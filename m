Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30F917994
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 09:24:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748412.1156118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMN0e-0003xv-QW; Wed, 26 Jun 2024 07:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748412.1156118; Wed, 26 Jun 2024 07:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMN0e-0003vy-Nv; Wed, 26 Jun 2024 07:24:04 +0000
Received: by outflank-mailman (input) for mailman id 748412;
 Wed, 26 Jun 2024 07:24:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IXAa=N4=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sMN0c-0003vq-Qo
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 07:24:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f5a38bf-338d-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 09:24:01 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D53DF4EE0738;
 Wed, 26 Jun 2024 09:24:00 +0200 (CEST)
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
X-Inumbo-ID: 0f5a38bf-338d-11ef-90a3-e314d9c70b13
MIME-Version: 1.0
Date: Wed, 26 Jun 2024 09:24:00 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] common/kernel: address violation of MISRA C Rule 13.6
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <alpine.DEB.2.22.394.2406251812480.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
 <54949b0561263b9f18da500255836d89ca8838ba.1719308599.git.alessandro.zucchelli@bugseng.com>
 <521767cb-ac08-48c5-bd91-b30c1d192331@suse.com>
 <alpine.DEB.2.22.394.2406251812480.3635@ubuntu-linux-20-04-desktop>
Message-ID: <34415eccf4a3204b694c93cbf0d1e816@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-26 03:13, Stefano Stabellini wrote:

Hi,
> On Tue, 25 Jun 2024, Jan Beulich wrote:
>> On 25.06.2024 12:14, Alessandro Zucchelli wrote:
>> > --- a/xen/common/kernel.c
>> > +++ b/xen/common/kernel.c
>> > @@ -660,14 +660,15 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>> >
>> >      case XENVER_guest_handle:
>> >      {
>> > +        struct domain *d = current->domain;
>> 
>> Can a (new) variable thus initialized please be consistently named 
>> currd?
>> 
>> >          xen_domain_handle_t hdl;
>> >
>> >          if ( deny )
>> >              memset(&hdl, 0, ARRAY_SIZE(hdl));
>> >
>> > -        BUILD_BUG_ON(ARRAY_SIZE(current->domain->handle) != ARRAY_SIZE(hdl));
>> > +        BUILD_BUG_ON(ARRAY_SIZE(d->handle) != ARRAY_SIZE(hdl));
>> 
>> Wasn't there the intention to exclude BUILD_BUG_ON() for specifically 
>> this
>> (and any other similar) rule?
> 
> +1

Yes, this macro will be deviated, you may ignore this patch.

> 
> I think if we could do that it would be ideal because those are the
> difficult cases are only meant are build checks so there is no point in
> applying to MISRA to them.
> 
> 
>> > -        if ( copy_to_guest(arg, deny ? hdl : current->domain->handle,
>> > +        if ( copy_to_guest(arg, deny ? hdl : d->handle,
>> >                             ARRAY_SIZE(hdl) ) )
>> >              return -EFAULT;
>> >          return 0;
>> 

-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

