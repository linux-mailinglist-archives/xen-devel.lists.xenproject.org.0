Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525EA731DFD
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 18:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549761.858493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9q0y-0000WL-Gq; Thu, 15 Jun 2023 16:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549761.858493; Thu, 15 Jun 2023 16:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9q0y-0000RW-Co; Thu, 15 Jun 2023 16:40:04 +0000
Received: by outflank-mailman (input) for mailman id 549761;
 Thu, 15 Jun 2023 16:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJjk=CD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1q9q0x-0000An-11
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 16:40:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45b43e12-0b9b-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 18:40:01 +0200 (CEST)
Received: from [192.168.1.198] (unknown [151.35.43.103])
 by support.bugseng.com (Postfix) with ESMTPSA id 7D5744EE0738;
 Thu, 15 Jun 2023 18:39:59 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 45b43e12-0b9b-11ee-b232-6b7b168915f2
Message-ID: <d0eed387-0f96-f7c4-0e66-f5109eac2e9c@bugseng.com>
Date: Thu, 15 Jun 2023 18:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From: nicola <nicola.vetrini@bugseng.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Refactoring of a possibly unsafe pattern for variable initialization
 via function calls
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

while investigating possible patches regarding Mandatory Rule 9.1, I
found the following pattern, that is likely to results in a lot possible
positives from many (all) static analysis tools for this rule.

This is the current status (taken from `xen/common/device_tree.c:135')


const struct dt_property *dt_find_property(const struct dt_device_node *np,
                                            const char *name, u32 *lenp)
{
     const struct dt_property *pp;

     if ( !np )
         return NULL;

     for ( pp = np->properties; pp; pp = pp->next )
     {
         if ( dt_prop_cmp(pp->name, name) == 0 )
         {
             if ( lenp )
                 *lenp = pp->length;
             break;
         }
     }

     return pp;
}




It's very hard to detect that the pointee is always written whenever a 
non-NULL pointer for `lenp' is supplied, and it can safely be read in 
the callee, so a sound analysis will err on the cautious side.

My proposal, in a future patch, is to refactor these kinds of functions 
as follows:


const struct dt_property *dt_find_property(const struct dt_device_node *np,
                                            const char *name, u32 *lenp)
{
     u32 len = 0;
     const struct dt_property *pp;

     if ( !np )
         return NULL;

     for ( pp = np->properties; pp; pp = pp->next )
     {
         if ( dt_prop_cmp(pp->name, name) == 0 )
         {
             len = pp->length;
             break;
         }
     }

     if ( lenp )
         *lenp = len;
     return pp;
}


The advantage here is that we can easily argue that `*lenp' is always
initialized by the function (if not NULL) and inform the tool about
this, which is a safer API and also resolves almost all subsequent
"don't know"s about further uses of the variables involved (e.g. `lenp').

Regards,
-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

