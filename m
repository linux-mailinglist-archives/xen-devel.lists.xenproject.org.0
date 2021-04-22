Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3540368141
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 15:10:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115435.220237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZZ6B-0002k1-CL; Thu, 22 Apr 2021 13:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115435.220237; Thu, 22 Apr 2021 13:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZZ6B-0002jc-9H; Thu, 22 Apr 2021 13:10:27 +0000
Received: by outflank-mailman (input) for mailman id 115435;
 Thu, 22 Apr 2021 13:10:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lZZ69-0002jV-Sb
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 13:10:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZZ69-0006ak-Dh; Thu, 22 Apr 2021 13:10:25 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=edge-m3-r2-133.e-iad51.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZZ68-0001FF-N3; Thu, 22 Apr 2021 13:10:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=iagCjn60lNMyzlAfFcXQ7L4RX9qShg1jGvCCr2iiXMI=; b=K22K9Fx93a2lod+BBvEqdM1adb
	GR6Xx1vHFU0K4+Hz+FPYnmmamkLV8cJ9XiAgwSP3VcFv+s94eQ1jeBbVd/QxOxzzY1DW1wBMUjEPj
	XZc4GYTmAP4gKO3RvXnAdgxrmd972YW9M8wSw5rJoOhMOqD8SBd7/VJ0z94q2tgpMB8I=;
Message-ID: <9e6ce48e89d073ba8363bfd8d88171d553e4ceed.camel@xen.org>
Subject: Re: [PATCH v10 03/13] x86/mm: switch to new APIs in
 modify_xen_mappings
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	 <andrew.cooper3@citrix.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Date: Thu, 22 Apr 2021 14:10:21 +0100
In-Reply-To: <8a15361c10f2cdcf2bd4a973d10c45be6a2536e3.1619014052.git.hongyxia@amazon.com>
References: <cover.1619014052.git.hongyxia@amazon.com>
	 <8a15361c10f2cdcf2bd4a973d10c45be6a2536e3.1619014052.git.hongyxia@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-04-21 at 15:15 +0100, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Page tables allocated in that function should be mapped and unmapped
> now.
> 
> Note that pl2e now maybe mapped and unmapped in different iterations,
> so
> we need to add clean-ups for that.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> ---
> Changed in v7:
> - use normal unmap in the error path.
> ---
>  xen/arch/x86/mm.c | 57 ++++++++++++++++++++++++++++++---------------
> --
>  1 file changed, 36 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 8a68da26f45f..832e654294b4 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5546,6 +5546,7 @@ int map_pages_to_xen(
>  
>   out:
>      L3T_UNLOCK(current_l3page);
> +    unmap_domain_page(pl2e);
>      unmap_domain_page(pl3e);
>      unmap_domain_page(pl2e);
>      return rc;

Something is seriously wrong here. This is obviously a mis-hunk which
should have been at the end of modify_xen_mappings() instead of
map_pages_to_xen(). This time the context is also different so I don't
understand why it did not conflict when I rebased.

Apologies. I noticed this patch has been merged so I will send a fix
right away.

Hongyan


