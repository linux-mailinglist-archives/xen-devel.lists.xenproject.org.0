Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BBA34ECB4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 17:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103606.197612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGQV-000511-BQ; Tue, 30 Mar 2021 15:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103606.197612; Tue, 30 Mar 2021 15:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGQV-00050c-7v; Tue, 30 Mar 2021 15:37:07 +0000
Received: by outflank-mailman (input) for mailman id 103606;
 Tue, 30 Mar 2021 15:37:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRGQT-00050U-3H
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 15:37:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45e71df3-201f-4986-ae9e-db6bcb50e0ce;
 Tue, 30 Mar 2021 15:37:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FF91AFF9;
 Tue, 30 Mar 2021 15:37:03 +0000 (UTC)
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
X-Inumbo-ID: 45e71df3-201f-4986-ae9e-db6bcb50e0ce
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617118623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emOCP43U5HD3LXM1xmMO0uasduBk5tfij7cy9KsNKUA=;
	b=CAJmUc0xWPmBVNqEUyC9EtU3524mpwsEPdaFWFSU0r8AJtqvGJKRMQyCksWegQg4Lzd9+T
	2ow0ydq3pq4UbqKAUB7aK71obG3AGl9H3QEtRmqCoQn7F4qVqbdPX3D5HSBA3S8P8WoIPH
	QMTDqAFhnmeuTEGB1D49/fqyO8NmS/c=
Subject: Re: [PATCH 05/21] libs/guest: introduce helper to fetch a domain cpu
 policy
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87d48996-6b8b-d801-c43b-30b919244fcb@suse.com>
Date: Tue, 30 Mar 2021 17:37:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210323095849.37858-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.03.2021 10:58, Roger Pau Monne wrote:
> Such helper is based on the existing functions to fetch a CPUID and
> MSR policies, but uses the xc_cpu_policy_t type to return the data to
> the caller.
> 
> No user of the interface introduced on the patch.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with again a minor remark (plus of course the same that I made for
patch 4):

> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2599,6 +2599,8 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
>  /* Retrieve a system policy, or get/set a domains policy. */
>  int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
>                               xc_cpu_policy_t policy);
> +int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
> +                             xc_cpu_policy_t policy);

Generally I'd expect domid_t to be used for domain IDs.

Jan

