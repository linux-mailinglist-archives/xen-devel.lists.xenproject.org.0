Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EDA840B45
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 17:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673032.1047149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUQ2-0008FA-8h; Mon, 29 Jan 2024 16:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673032.1047149; Mon, 29 Jan 2024 16:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUQ2-0008D7-4V; Mon, 29 Jan 2024 16:23:34 +0000
Received: by outflank-mailman (input) for mailman id 673032;
 Mon, 29 Jan 2024 16:23:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9VRI=JH=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rUUQ0-0008Cx-3X
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 16:23:32 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdad6398-bec2-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 17:23:31 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e80046246so16089925e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 08:23:31 -0800 (PST)
Received: from [192.168.13.31] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b0040e50d82af5sm10632092wmq.32.2024.01.29.08.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 08:23:29 -0800 (PST)
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
X-Inumbo-ID: bdad6398-bec2-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706545410; x=1707150210; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1U95h2OOTfszoqXa08Tm5UXIetJ+sJnMEkG7ANYgKQc=;
        b=Q8gYAVPu752f273GkD8cSgXW2UBGY350fdyF4G9wio8VNyrepqfr0iZX1pv1Ifny4O
         cWRkv4qCffpGPTI0WciZ3yJIXsSMhqP45cgYEGhlX3vZp8XSfUMYhjQ7uWXqDBBQnpLB
         r2elOujkV2kwb6DTsItI9NvC2781+s11vW8boH32ULZrUdmBCaqzN+SoaQ+0sU/AlqPv
         jID1+NwmUcm0+QkIFAUgsw0ZtPtUFLfY0IIl5gHeshP/832mp1MX4JvHK/69N6CJS6u6
         eLleSuC35wzoGukWHCk1qm4DjQlgC8QqnklFa1CYE2HOpmsPHYNVe63lb6IXnFYf/1xY
         OkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706545410; x=1707150210;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U95h2OOTfszoqXa08Tm5UXIetJ+sJnMEkG7ANYgKQc=;
        b=KQRM+8SjTHBbr8cac0C+UJf+1bkplla8V5qI/6tG5h0aUiScH/10rt3+Pbne1YM4iw
         CLKoDl7ehjCJCsjNzUooZmP6xp7eaMS+1M0wOsGD8KOl+RmnNiqwRsyDD27LqCvVTok8
         fQzeoyOWOtU3rA+IR1sYtLf4X+iEKBbYuHNF3xVo02QsMY8tYU5F8pWkT+zUjahwAF/i
         t3DARFVcHC0Bx/9N6mwUXS71wktOjmGFKmCpCzh47ySSA+44/3lae4ZeyuFDQ+ceJDGG
         wfonjtDPiiW8jUF7eIGbJgouLnN2r/Oepv540ziqJmUQwkMTZPYA/7dOjQdnlbVkK7HT
         LVVQ==
X-Gm-Message-State: AOJu0YwHqZrHVfxoyRmB6Qm1zQqV7bf1u4kl2Qq3LefXNpvYI0pnL+J9
	OVS8wSn2eNkzGRp7IQJf6OUshGjPrZVy3HPxPC0HTTEG2LEqpLMy
X-Google-Smtp-Source: AGHT+IGphsrgeW4MVyxwqEJacHn5mOVmoT3HIXiBIdpFBH2moIz6QQlCDKSMQA9SNF6AOwLixGXG3w==
X-Received: by 2002:a05:600c:4691:b0:40e:4a5d:b2d1 with SMTP id p17-20020a05600c469100b0040e4a5db2d1mr4780598wmo.20.1706545410449;
        Mon, 29 Jan 2024 08:23:30 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <14a78f14-c6c5-41d1-94b2-3148ee6048fb@xen.org>
Date: Mon, 29 Jan 2024 16:23:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v6 1/3] x86/iommu: remove regions not to be mapped
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20240124172953.29814-2-roger.pau@citrix.com>
 <20240125132626.34553-1-roger.pau@citrix.com>
Organization: Xen Project
In-Reply-To: <20240125132626.34553-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/01/2024 13:26, Roger Pau Monne wrote:
> Introduce the code to remove regions not to be mapped from the rangeset
> that will be used to setup the IOMMU page tables for the hardware domain.
> 
> This change also introduces two new functions: remove_xen_ranges() and
> vpci_subtract_mmcfg() that copy the logic in xen_in_range() and
> vpci_is_mmcfg_address() respectively and remove the ranges that would otherwise
> be intercepted by the original functions.
> 
> Note that the rangeset is still not populated.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v6:
>   - Fix subtraction to be done against the address, not the mfn.
> 
> Changes since v4:
>   - Fix off-by-one when removing the Xen used ranges, as the rangesets are
>     inclusive.
> 
> Changes since v3:
>   - Remove unnecessary line wrapping.
> 
> Changes since v1:
>   - Split from bigger patch.
> ---
>   xen/arch/x86/hvm/io.c               | 16 ++++++++
>   xen/arch/x86/include/asm/hvm/io.h   |  3 ++
>   xen/arch/x86/include/asm/setup.h    |  1 +
>   xen/arch/x86/setup.c                | 48 +++++++++++++++++++++++
>   xen/drivers/passthrough/x86/iommu.c | 61 +++++++++++++++++++++++++++++
>   5 files changed, 129 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


