Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D1CAFB4B8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 15:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035591.1407913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYm08-0000ar-2S; Mon, 07 Jul 2025 13:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035591.1407913; Mon, 07 Jul 2025 13:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYm07-0000ZP-Vt; Mon, 07 Jul 2025 13:35:19 +0000
Received: by outflank-mailman (input) for mailman id 1035591;
 Mon, 07 Jul 2025 13:35:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uYm05-0000ZJ-R5
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 13:35:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uYm04-005W6o-1s;
 Mon, 07 Jul 2025 13:35:16 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uYm04-004td5-0w;
 Mon, 07 Jul 2025 13:35:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=c/+UKGP38qDfAQ8ZfwawqjavFXJZS6YRiQBUzl25klY=; b=UQ5Cmz1x6gc1I0ZX0oR/EtC+ja
	I1xHbowZP8DeujC/C4zs6F7GX9WRxdLOJiqteaZDQ7rC1f/2f4DzCtt16h24sg5twLev1k/TyKUWF
	hSetH3hemDUGTxd965CfCVsXAMZvHebKOZmSo2Jjgvu/OTV1SGcW6B2v7FuXUGqx9LsU=;
Date: Mon, 7 Jul 2025 15:35:14 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Petr =?utf-8?B?QmVuZcWh?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v7 2/7] tools/xl: Add altp2m_count parameter
Message-ID: <aGvNEsyTkFLJAWqA@l14>
References: <cover.1751397919.git.w1benny@gmail.com>
 <090b27895506d78055d1bab9c2b3617e85f389c6.1751397919.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <090b27895506d78055d1bab9c2b3617e85f389c6.1751397919.git.w1benny@gmail.com>

On Tue, Jul 01, 2025 at 07:54:24PM +0000, Petr Beneš wrote:
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 8a85fba1cf..acf7fd9837 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -421,6 +421,15 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>          return -ERROR_INVAL;
>      }
>  
> +    if (b_info->altp2m_count == LIBXL_ALTP2M_COUNT_DEFAULT) {
> +        if ((libxl_defbool_val(b_info->u.hvm.altp2m) ||

This access turned out to be an issue. "hvm.altp2m" is only set to a
default value for hvm guests on x86, in
libxl__arch_domain_build_info_setdefault() in ibxl_x86.c. So trying to
create a PV guest will fail here.

It seems that altp2m_count is going to be used for the creation of all
guest, right? That is in addition to HVM, it will be also used for PV
guest and on Arm, and any other architectures that could be added. What
should be the value of altp2m_count in all this case, if altp2m is only
set on x86 HVM guest?


> +            b_info->altp2m != LIBXL_ALTP2M_MODE_DISABLED))
> +            /* Reflect the default legacy count */
> +            b_info->altp2m_count = 10;
> +        else
> +            b_info->altp2m_count = 0;

Cheers,

-- 
Anthony PERARD

