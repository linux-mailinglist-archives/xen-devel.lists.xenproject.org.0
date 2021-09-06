Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494A3401C87
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179925.326376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEsZ-0001p6-1g; Mon, 06 Sep 2021 13:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179925.326376; Mon, 06 Sep 2021 13:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEsY-0001ml-Uu; Mon, 06 Sep 2021 13:41:42 +0000
Received: by outflank-mailman (input) for mailman id 179925;
 Mon, 06 Sep 2021 13:41:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNEsX-0001mf-80
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:41:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNEsV-0004xi-Mb; Mon, 06 Sep 2021 13:41:39 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNEsV-0005qx-G4; Mon, 06 Sep 2021 13:41:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Boy2zv/vfXIzRDN1u+uY3cgR2WQrfnHGiF9oilq+fg0=; b=ScdiiQJHlMAIB21htUpL6FgnEf
	sawNDL3sx2Bu/GhC2DPZU1ZKMGJN+DZeWa+sii/UIor4GnZ/Tw7MomWZUWHAtAJJEuis6TMPU+NJf
	QeUJ8iRTZM1Fk+IEbezyJzkX57uz3xRjrxBkmVW3l172VIILymcV3AlDc5OrCI+aThVc=;
Subject: Re: [PATCH 6/9] gnttab: check handle early in
 gnttab_get_status_frames()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <049c4f02-2af6-542e-cc51-5c245f33341c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <194da6a8-5818-fb5f-d3f7-3b374fd3c17f@xen.org>
Date: Mon, 6 Sep 2021 14:41:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <049c4f02-2af6-542e-cc51-5c245f33341c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/08/2021 11:13, Jan Beulich wrote:
> Like done in gnttab_setup_table(), check the handle once early in the
> function and use the lighter-weight (for PV) copying function in the
> loop.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -3261,6 +3261,9 @@ gnttab_get_status_frames(XEN_GUEST_HANDL
>           return -EFAULT;
>       }
>   
> +    if ( !guest_handle_okay(op.frame_list, op.nr_frames) )
> +        return -EFAULT;
> +
>       d = rcu_lock_domain_by_any_id(op.dom);
>       if ( d == NULL )
>       {
> @@ -3301,7 +3304,7 @@ gnttab_get_status_frames(XEN_GUEST_HANDL
>       for ( i = 0; i < op.nr_frames; i++ )
>       {
>           gmfn = gfn_x(gnttab_status_gfn(d, gt, i));
> -        if ( copy_to_guest_offset(op.frame_list, i, &gmfn, 1) )
> +        if ( __copy_to_guest_offset(op.frame_list, i, &gmfn, 1) )
>               op.status = GNTST_bad_virt_addr;
>       }
>   
> 

-- 
Julien Grall

