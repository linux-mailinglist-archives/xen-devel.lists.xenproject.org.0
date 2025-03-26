Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD730A7193B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 15:47:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927936.1330690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txS2f-0002r8-QY; Wed, 26 Mar 2025 14:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927936.1330690; Wed, 26 Mar 2025 14:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txS2f-0002pg-Nd; Wed, 26 Mar 2025 14:47:41 +0000
Received: by outflank-mailman (input) for mailman id 927936;
 Wed, 26 Mar 2025 14:47:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES6w=WN=bounce.vates.tech=bounce-md_30504962.67e41385.v1-01a764632b814acabaeb6a206ee82911@srs-se1.protection.inumbo.net>)
 id 1txS2e-0002pa-40
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 14:47:40 +0000
Received: from mail134-16.atl141.mandrillapp.com
 (mail134-16.atl141.mandrillapp.com [198.2.134.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40c0ee08-0a51-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 15:47:35 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-16.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4ZN8lT43dmzB5p4wB
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 14:47:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 01a764632b814acabaeb6a206ee82911; Wed, 26 Mar 2025 14:47:33 +0000
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
X-Inumbo-ID: 40c0ee08-0a51-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743000453; x=1743270453;
	bh=GlHx0h86jpvU8waBjU23u3F+BNvm0mZZYIr3Q69GUNI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aYIFuTtMiLWaeG+O7k+CCzo23/9j0MC8+xnl46I8etzepKoilcFG4vtljV0Gf9Cht
	 NUbJEg5mIvqpyZY+bys9FUEq/Xo0SZu72V7ZYzTy5GtZcRnYDZm+F5MnyJRB7FCSfR
	 n8gaw6pnqDUgJum+bCqP6v2MLiBJNV4QmbrGo1ZzPKK0gobFNKKt15RpQ+akyG9uIq
	 DGFjSbGgascXfsLrkDOMZYqt0VRGHY0rsADM+qcpZAYwYCMVDzjR+es/Gv0/04CepB
	 QXbqqmz0n84HWvKQj3BSUBxN3UQyFaJMr8Zy0wUEIlBm5KuC/zxed8HnRCm7SFNSLm
	 WHZpGNfD6Ua7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743000453; x=1743260953; i=anthony.perard@vates.tech;
	bh=GlHx0h86jpvU8waBjU23u3F+BNvm0mZZYIr3Q69GUNI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ybQJUa5ZrZWag8BPwyFcz+sbEppzQa/WuEXkii+RGtBFj7xRIkwDQIcq1e9N14PPh
	 Z6pt/Dx2SMi3ti6NLq75AMXso4d2/aQ9gXHCtiFVPs7NJxpPWzikzF8qh41VukS3Sk
	 YOvQXmJBTDjwOHNceguv7cK1qSWIF76CeBWdRIAfRdkBiVOuruWFHOXjidBTgb9A1o
	 ZdDTv/cL1JgPtrNy7PS/4X6FOWI+hVW744gJqGy059tIhGJSKacBHpeMN5//+BcwyD
	 kb0oasHMGSLFnaUD9kLMxM5IGaY3udh/Wiluxf78A6nWJZOloM6XqzkM3go5wjSlKX
	 aKnF4y6s0ejsg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20tools/arm:=20Fix=20nr=5Fspis=20handling=20v2?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743000452162
To: "Michal Orzel" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Luca Fancellu" <luca.fancellu@arm.com>
Message-Id: <Z-QTg7pAam8jmVda@l14>
References: <20250325110029.399838-1-michal.orzel@amd.com>
In-Reply-To: <20250325110029.399838-1-michal.orzel@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.01a764632b814acabaeb6a206ee82911?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250326:md
Date: Wed, 26 Mar 2025 14:47:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Mar 25, 2025 at 12:00:29PM +0100, Michal Orzel wrote:
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 2d895408cac3..0adcaa373b54 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -181,13 +181,18 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>  
>      LOG(DEBUG, "Configure the domain");
>  
> -    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
> -        LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
> -            nr_spis);
> -        return ERROR_FAIL;
> +    /* Check if a user provided a value or not */
> +    if (cfg_nr_spis != LIBXL_NR_SPIS_DEFAULT) {
> +        if (nr_spis > cfg_nr_spis) {
> +            LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
> +                nr_spis);
> +            return ERROR_FAIL;
> +        }
> +        config->arch.nr_spis = cfg_nr_spis;
>      }
> +    else
> +        config->arch.nr_spis = nr_spis;

Just one small coding style issue: to avoid confusion, whenever one side
a of an if..else is using a block, both side should use a block. But
that can be fixed on commit:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

