Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE905B0F1F7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 14:12:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053892.1422677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueYJr-0003FV-1K; Wed, 23 Jul 2025 12:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053892.1422677; Wed, 23 Jul 2025 12:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueYJq-0003D3-Uv; Wed, 23 Jul 2025 12:11:34 +0000
Received: by outflank-mailman (input) for mailman id 1053892;
 Wed, 23 Jul 2025 12:11:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmaN=2E=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueYAs-00009o-2Q
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 12:02:18 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1169b2d-67bc-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 14:02:17 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so4687629f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 05:02:17 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca2bcc3sm16361626f8f.27.2025.07.23.05.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 05:02:16 -0700 (PDT)
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
X-Inumbo-ID: e1169b2d-67bc-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753272137; x=1753876937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mnV1Eiy+MVzKg3oFCrSpgkzHMwIsi4VFpdJmynS/ubg=;
        b=XfUFwSPfSjXtBsnaGESgfT63+PrPEkQrVx+TZACkDNYUeGyRN3rTazK1qNlKGDxnf6
         CLztTwfkci8efSjJ6xDVCYjwvIvKitBSigyjGzT+xb8CJ2yOeYmAgYiCiif0Bv0EcPba
         fnG6Szltwa5qi7ksywP93nonwd7zxDew2LFFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753272137; x=1753876937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnV1Eiy+MVzKg3oFCrSpgkzHMwIsi4VFpdJmynS/ubg=;
        b=w09R9DdmaXqA2ztkW9Yqnril83kBy5bjHeM3dFmdLUkaAH8P9Q/l2NKXO2pLBLBsQz
         L8Y+YQDa+QCpDY9bbuoVCf1OH+Jesn1sAM8rM98DRa6GzrhSen4zsFXdr3yWpy0bL9WI
         6u3r60FqCA24RJsVnYrjx9j8L7GHExFDGqjZ4AziYlST2xQdTWf7bST1AQ0213a41/iH
         vHN+KogpDBQTAPGDEi0MBgnK6CIPImUthUfrY4CudrZf+En5+gLXXSS74tWBTyp4bFqm
         d2yayUV9gCQqqSXWPBU8vbqgaAhSO4Z5cZHJsbvdx7E+s41J6UCjcLakB2vSSyqUZ9dy
         Xm2A==
X-Forwarded-Encrypted: i=1; AJvYcCXp0l8dm5bdlcd53UEoF0/IFRZxcvapyGq3ZAt+7dMqE6mwSq6oahZauPPb/FDsMupPqX/D0D4P8vM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaVgnzHE4itcIRrvyB3LNLBTm/IMNQlK0w4SzRGcniX3DGXRBI
	w9GCn8L1kCkezREnWhXdlE+S2bLV7LBjuqlJ7hP9j8ScruhXe1o7h9u6EeTag9CUXeo=
X-Gm-Gg: ASbGnctX25rHgmAToBcIeZ8NhlohAqv9DhjUj+1siK8zN/Oh0jQBySvKwz4ENQ6MC9d
	ECgLbrJBeJTg/LE2HjX42/8z8lYGqE24P+nRQx41J3/BcQ0j2iYSGcr6CV6hHneHXAPnARiW/Ga
	Dzm6CVQMNIyF6+wJHOEs0fFXRX0L8QFs4orKCo80MrFf0wqMeIYI8Fp5LoktJpcdkOX70GQR86f
	SUXHzndBEeOagJrAb2ARnyJXls1GG11gS/SfzUbU+9yGmaA4JQnxwCspPZpMjq95zENDkskDHNv
	PIscy66JusG+k8mNd9/O829XWcZ2rlImLKCRuaym8Fg4QptGhf3uHN6yEvC7/Xc8ox1nxXQy/Qi
	aPX2SKKz+vARZ9lJv82zEks5NrtFxZT8eyDQvlG+gMHiNkodWC2N6giifdzH0wWMmUsio
X-Google-Smtp-Source: AGHT+IEaiB88YaZSEIs0bdQms3saEJ5d/wDCph0nWbVgpXAJG7Yo6/xBBHVVSooTBdS/+UmhejMA2w==
X-Received: by 2002:a05:6000:26c9:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3b768ef96cemr2346881f8f.34.1753272136953;
        Wed, 23 Jul 2025 05:02:16 -0700 (PDT)
Message-ID: <811ca2b7-7b0a-4b75-8988-a84d8ec8640b@citrix.com>
Date: Wed, 23 Jul 2025 13:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pmstat: drop struct px_stat's usable field
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <4897cfe9-f5d5-4ab6-a29c-cda32ab56122@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4897cfe9-f5d5-4ab6-a29c-cda32ab56122@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/07/2025 12:59 pm, Jan Beulich wrote:
> Its initial calculation in cpufreq_statistic_init() is entirely unused,
> as do_get_pm_info() recalculates it before use. That re-calculation can
> then be done right where the output field is set, eliminating the need
> for the internal field. In turn the struct pointer there can then be
> constified.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

