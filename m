Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23CA7AD670
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 12:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607800.946104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkjDA-00053C-9R; Mon, 25 Sep 2023 10:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607800.946104; Mon, 25 Sep 2023 10:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkjDA-00050R-65; Mon, 25 Sep 2023 10:53:08 +0000
Received: by outflank-mailman (input) for mailman id 607800;
 Mon, 25 Sep 2023 10:53:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vtXC=FJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qkjD8-00050L-A1
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 10:53:06 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b39b347c-5b91-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 12:53:03 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32320381a07so1987539f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Sep 2023 03:53:04 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j10-20020adfd20a000000b003142ea7a661sm5107099wrh.21.2023.09.25.03.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 03:53:03 -0700 (PDT)
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
X-Inumbo-ID: b39b347c-5b91-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695639184; x=1696243984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=64VNgcPp4OXSMV+J8NYa+uaatAv1OaEUdgVM3Udk89o=;
        b=IW1fAcm6V0qc0FXUN9h2uqkMUCRJQ5wCS+PdYbkeogXFIad9k7XsXSKOFaoqHwEvgG
         6cFG+0i4NDjs2s0IyfXcNHGXb81zRpSba1e+I2bj2aWOQUjmBlf3SK/UBj4J2hEI8rKW
         nvb9dZwEFnfXjeU6kDFFZ/Dyzoa/utuoiTMuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695639184; x=1696243984;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64VNgcPp4OXSMV+J8NYa+uaatAv1OaEUdgVM3Udk89o=;
        b=ZW8jhi/CYoACCstkfqN4BG0IP44a0+Yk2tMhJhKaLRWFO3yOd9M/ERQ3hCLBjOXHp9
         3kMnEb+yYj8OKwPi48VNLVwDxlnGMHtq4r6zfLrH3xC9fozRzoHn8MJ8Gw8oAlIJYDgG
         EraraHFFu/LruDzlXDEfVqcVkr0D8TEPVz17dc8i66vk4ylLGHOncDc1+dhTJAaQe/7B
         +bI2oXn0RJ7SJQVUGUJHyYznHDlDWRHFg7ZAitqrKPDdPKOXWg/g5q8M1G6bXKeHS7YK
         GzawX6RKLmmnFgD8pHmDhRNmbb3Qxv2dnrW+UW+L9KhNsShxId0Yv2/3R1UgSL+7Iz7t
         7G4A==
X-Gm-Message-State: AOJu0Yy7r0h8J7a87xmAHleII6LXaz/Xa1QxNBr/NFcBz1BIPLREvUiR
	n2hurKC8hISS7jMLYRN4r2VQXQ==
X-Google-Smtp-Source: AGHT+IEmTfOS55UWJ90ubsq4waMg3j07qyYpvMAPaVZZBla59e5TaC09p1NmLMCI/OzJ5m36kpHFgg==
X-Received: by 2002:adf:f548:0:b0:313:dee2:e052 with SMTP id j8-20020adff548000000b00313dee2e052mr5451253wrp.26.1695639183767;
        Mon, 25 Sep 2023 03:53:03 -0700 (PDT)
Message-ID: <28310181-d7f5-a8b6-f1fd-ea9ca0db56cb@citrix.com>
Date: Mon, 25 Sep 2023 11:53:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: andrew.cooper3@citrix.com
Subject: Re: [XEN PATCH v4] drivers/video: make declarations of defined
 functions available
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <5830a4d838883a20a6b320dd9af44ef4bb18ddaa.1695632599.git.nicola.vetrini@bugseng.com>
In-Reply-To: <5830a4d838883a20a6b320dd9af44ef4bb18ddaa.1695632599.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/09/2023 10:11 am, Nicola Vetrini wrote:
> diff --git a/xen/include/xen/vga.h b/xen/include/xen/vga.h
> index f72b63d446b1..9b2c47971d0c 100644
> --- a/xen/include/xen/vga.h
> +++ b/xen/include/xen/vga.h
> @@ -13,6 +13,12 @@
>  
>  #ifdef CONFIG_VGA
>  extern struct xen_vga_console_info vga_console_info;
> +int fill_console_start_info(struct dom0_vga_console_info *);

ci

> +void vesa_init(void);
> +void vesa_early_init(void);
> +void vesa_endboot(bool keep);
> +#else
> +static inline void vesa_init(void) {};

Extraneous ;

Both can be fixed on commit, but we're in code freeze now, so every
patch needs approving by the release manager (Henry, CC'd)

~Andrew

