Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FF4447E1D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 11:37:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223230.385849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk21v-000851-S4; Mon, 08 Nov 2021 10:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223230.385849; Mon, 08 Nov 2021 10:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk21v-00082O-OT; Mon, 08 Nov 2021 10:37:35 +0000
Received: by outflank-mailman (input) for mailman id 223230;
 Mon, 08 Nov 2021 10:37:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mk21u-00082I-3L
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 10:37:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mk21t-0001xU-LL; Mon, 08 Nov 2021 10:37:33 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.146.147]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mk21t-0004gX-F5; Mon, 08 Nov 2021 10:37:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Nj/lKmQ6q9a3v5gfY230zqeTy8GzXapFZr/UE2kGyAQ=; b=qNF8vS3QREyXif3hfgRbrHW6g5
	j31B8DM1t9DX7L8mbkFVP1uzutN3bL84cweMIa8/kxlnIgNWfwUaMhTX5LtKZI/RSMOANzAPZIcqj
	1IgHq1208PeiHwGrMp7vMq+xKgjluF3bm/JrtaEFFY9euya5UpuJ3//kR+gKxFmyScZQ=;
Message-ID: <caac2d2b-46a7-e12b-7cb0-ac1b7791d8a1@xen.org>
Date: Mon, 8 Nov 2021 10:37:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [XEN][PATCH v3 1/1] Update libfdt to v1.6.1
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com
References: <1636147719-80482-1-git-send-email-fnu.vikram@xilinx.com>
 <1636147719-80482-2-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1636147719-80482-2-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vikram,

On 05/11/2021 21:28, Vikram Garhwal wrote:
> Update libfdt to v1.6.1 of libfdt taken from git://github.com/dgibson/dtc.
> This update is done to support device tree overlays.
> 
> A few minor changes are done to make it compatible with Xen:
>      fdt_overlay.c: overlay_fixup_phandle()
> 
>          Replace strtoul() with simple_strtoul() as strtoul() is not available in
>          Xen lib and included lib.h.
> 
>          Change char *endptr to const char *endptr.

I would clarify this is a requirement to use simple_strtoul().

[...]

> diff --git a/xen/include/xen/libfdt/libfdt_env.h b/xen/include/xen/libfdt/libfdt_env.h
> index 035bf75..03380d5 100644
> --- a/xen/include/xen/libfdt/libfdt_env.h
> +++ b/xen/include/xen/libfdt/libfdt_env.h
> @@ -1,22 +1,98 @@
> -#ifndef _LIBFDT_ENV_H
> -#define _LIBFDT_ENV_H
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +#ifndef LIBFDT_ENV_H
> +#define LIBFDT_ENV_H
> +/*
> + * libfdt - Flat Device Tree manipulation
> + * Copyright (C) 2006 David Gibson, IBM Corporation.
> + * Copyright 2012 Kim Phillips, Freescale Semiconductor.
> + */
>   
> +#include <xen/config.h>

The build system should always include <xen/config.h> automagically. So 
can you clarify why this is necessary?

>   #include <xen/types.h>
>   #include <xen/string.h>
>   #include <asm/byteorder.h>
> +#include <xen/stdbool.h>

We usually order the headers so <xen/...> are first and then <asm/...>. 
They are then ordered alphabetically within themself.

But it is not clear why you are adding <xen/stdbool.h> as AFAICT it is 
already going to be included by existing headers. Did you see an error 
without including it?

Cheers,

-- 
Julien Grall

