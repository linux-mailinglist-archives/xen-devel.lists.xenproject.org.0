Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7F6A1D4A6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:38:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877623.1287759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMVn-0007og-Qg; Mon, 27 Jan 2025 10:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877623.1287759; Mon, 27 Jan 2025 10:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMVn-0007lX-NM; Mon, 27 Jan 2025 10:38:35 +0000
Received: by outflank-mailman (input) for mailman id 877623;
 Mon, 27 Jan 2025 10:38:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVGR=UT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tcMVl-0007lL-Q6
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:38:33 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daf03f41-dc9a-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:38:32 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30167f4c1e3so42770691fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:38:32 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc71c9dsm13890981fa.111.2025.01.27.02.38.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 02:38:31 -0800 (PST)
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
X-Inumbo-ID: daf03f41-dc9a-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737974312; x=1738579112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QByH+rwABHYUFPrWZeYCi2E9EJOMhWK7UZcxjM0OZgY=;
        b=hwMEUeV1wZssj3aGiwDbLJ6vE4nf1E33bZUZDHsxj21OCd2VSf1m4Ex6YJcJ+qa/iM
         m6K0HQUHCBGt/BzIcRilgAfZYU2HrnM2TyJSiFUF48BR1NZUy85rCGS2qQHz5Lh8UCCG
         kl3Fwqs8qZ1zY3ptjrAQYeRg0yMdxHTTPX/JnT/KGj0A7EfxMo3asNFQJXei/1aiJ7Y9
         Cn6ug36Rkd1Q4yczUvfYxej4XTfd3OkQV7YGESBQQsHaiPFU9MKW9oLkM6xAyN2J/Zta
         JwYR6xFw0Zg55ix2GfOvL/Y0tHo7Za0ON02aT7k7fKrlJhInsJPed6q7TgDV6QbuH49P
         RQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974312; x=1738579112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QByH+rwABHYUFPrWZeYCi2E9EJOMhWK7UZcxjM0OZgY=;
        b=aINqkDEfqR7SJaFm9wLcCNxA67n3duTR/q8YnJwEwaVcvNq+4PiHaeKt6JAx3Bxk8P
         c+jMU+pVo8/cSHBJWjzB91v3uujpPaTrRI2u//320vEjKs3+JVCwhpS4rK5wy5O9qFUZ
         MXlWQr78MaOxc7SP7Dl50k0CDGj7RxNExhT7bEHerDidhFg0CXJ+A8I0RZraunFfibLQ
         OsE4/20qtSpAUr/1Hk2nc3b164n8BPgKzXT0fkzAqk23j/mIFmsGabbWt4csDrLEQJsa
         mj32+jZ4YWfQhW7YBXgkW9YeEXny+KIt2YsG9adnvYfHP699XotIxP6V9YiitiLDm4tM
         HFYA==
X-Gm-Message-State: AOJu0YxVXBCZStweL5wj9BbX4781mX/pr+Vq/4spdGDXPrm/i0mozi/9
	nh4BtdO31nIBM3/4fNN7C8/kXhZfl8aGY1iEoMJVR9sDUGpdGQP+
X-Gm-Gg: ASbGncuFHTGS4ll7LChnYvD5C4iLMiHzUYK+SBTC7CojO1bRVpEDN8EPMRFWsz9CKUC
	R4hpFK+bmI3Q2HjEZjAq7JBKSm4aPaGYInF4aJL7aB0SikuGHAeAkR3XoGGy0rDvkiEN+9CGA+B
	Yhyz83EuhseE0VHWAUVN96GcuAv09NqMmFdTHBEbydvtGX7dBHChR2zTJvvBiPC2DRPbcv/weDY
	/kQUa6l+/rS66Y1XXXn693dOVYByOxYJkEMSAjlOhL2iUxs0DYbAkzCQSnBr1hjX1p/p30hpfpU
	mVA8c/YD+rdrwNn/cw==
X-Google-Smtp-Source: AGHT+IGRHOpNl6G4OlJfiUNwzaLsOLXBgCApyv340aTG5GSWc7eQNycobEV4KouovXpMT9xI8PdKSw==
X-Received: by 2002:a2e:a449:0:b0:306:1524:4a65 with SMTP id 38308e7fff4ca-3072caf1549mr133340461fa.20.1737974312032;
        Mon, 27 Jan 2025 02:38:32 -0800 (PST)
Message-ID: <2c3caa4c-33d2-45a0-8832-c0407ff02a60@gmail.com>
Date: Mon, 27 Jan 2025 11:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v2 0/5] x86/iommu: make CX16 mandatory for IOMMU
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <20250124120112.56678-1-roger.pau@citrix.com>
 <3204bed4-4f03-405e-b77c-4355803f3a31@citrix.com>
 <Z5OjYhD6nbFYa4ff@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <Z5OjYhD6nbFYa4ff@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/24/25 3:27 PM, Roger Pau Monné wrote:
> On Fri, Jan 24, 2025 at 02:24:34PM +0000, Andrew Cooper wrote:
>> On 24/01/2025 12:01 pm, Roger Pau Monne wrote:
>>> Hello,
>>>
>>> The following series is the original CX16 series sent by Teddy, with the
>>> CX16 checks split into a separate patch, plus one extra patch to switch
>>> AMD-Vi to use CMPXCHG16B when updating Interrupt Remapping Entries.
>>>
>>> Note that last patch to use CMPXCHG16B fixes a real bug with AMD
>>> hardware.
>>>
>>> Thanks, Roger.
>>>
>>> Roger Pau Monne (1):
>>>    iommu/amd: atomically update IRTE
>>>
>>> Teddy Astie (4):
>>>    x86/iommu: check for CMPXCHG16B when enabling IOMMU
>>>    iommu/vtd: remove non-CX16 logic from interrupt remapping
>>>    x86/iommu: remove non-CX16 logic from DMA remapping
>>>    iommu/vtd: cleanup MAP_SINGLE_DEVICE and related code
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

As we disscussed in matrix, with proper review R-Acked-by: Oleksii 
Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> Thanks.
>
>> CC Oleksii.  Patch 5 is a real bugfix that needs backporting, and the
>> prior patches have been in an almost-ready state for more than a release
>> now.
> I've split the checks into a pre-patch, and did a bit more cleanup of
> code that was no longer needed (pre/post interrupt mask before IRTE
> update), but overall the code is the same plus the extra fix.
>
> Thanks, Roger.

