Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85A7401C25
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179876.326294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNETT-0002nf-3u; Mon, 06 Sep 2021 13:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179876.326294; Mon, 06 Sep 2021 13:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNETT-0002kx-0d; Mon, 06 Sep 2021 13:15:47 +0000
Received: by outflank-mailman (input) for mailman id 179876;
 Mon, 06 Sep 2021 13:15:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNETR-0002kp-LG
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:15:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNETP-0004V7-U6; Mon, 06 Sep 2021 13:15:43 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNETP-0003Vs-OG; Mon, 06 Sep 2021 13:15:43 +0000
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
	bh=NJgZOIAhM0FRVum0rn4oVDRo/18ADiT0ruigwcfl41Q=; b=XW0IShM2XbHG4wk6yifxpLIXOJ
	auG9rIrvW9Oldb8T0hnV61Rt299IwvLueOVjPdpa4bDlb9kekT42qOAL/o/ZJFJxembj0fFUudmC9
	+VRpfR4Bn7BiakMNDsfQ8+pyuCEf4sJnreGjZPBcb8GeTVJnoOMx9AQRIda6LIxHb/5o=;
Subject: Re: [PATCH 2/9] gnttab: drop a redundant expression from
 gnttab_release_mappings()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <80426a2b-81ac-acc1-db93-077934468b1b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eac94bb4-d9bd-f416-9c43-a9bb708ed008@xen.org>
Date: Mon, 6 Sep 2021 14:15:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <80426a2b-81ac-acc1-db93-077934468b1b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/08/2021 11:11, Jan Beulich wrote:
> This gnttab_host_mapping_get_page_type() invocation sits in the "else"
> path of a conditional controlled by "map->flags & GNTMAP_readonly".
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -3816,9 +3816,7 @@ int gnttab_release_mappings(struct domai
>                   if ( gnttab_release_host_mappings(d) &&
>                        !is_iomem_page(act->mfn) )
>                   {
> -                    if ( gnttab_host_mapping_get_page_type((map->flags &
> -                                                            GNTMAP_readonly),
> -                                                           d, rd) )
> +                    if ( gnttab_host_mapping_get_page_type(false, d, rd) )
>                           put_page_type(pg);
>                       put_page(pg);
>                   }
> 

-- 
Julien Grall

