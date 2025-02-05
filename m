Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3A6A2982B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 18:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882278.1292441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfjdP-0003Bo-B0; Wed, 05 Feb 2025 17:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882278.1292441; Wed, 05 Feb 2025 17:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfjdP-00039k-7t; Wed, 05 Feb 2025 17:56:23 +0000
Received: by outflank-mailman (input) for mailman id 882278;
 Wed, 05 Feb 2025 17:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KjPr=U4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tfjdM-0002uH-VJ
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 17:56:21 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80b3a32c-e3ea-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 18:56:19 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so339815e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 09:56:19 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b57ccsm19515318f8f.79.2025.02.05.09.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 09:56:18 -0800 (PST)
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
X-Inumbo-ID: 80b3a32c-e3ea-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738778179; x=1739382979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SezWguPGLH2gSBjLm56i4oC4VEJNlKhmOJ4S84wkkYU=;
        b=ryAaN8BJxjaZWeBzbh2kQXHjHkcfiZOJfM0JUqPaMfRuvvpHMqaoJpcm3h0DRFbPzx
         mlC5dgVsqpLAS+msg2HluetSCBFnnHbbYaNB0sq8P5/h2IGeitgl+hCfr3VXJJZkdl1Y
         3SjeWwCt5eOsqEKiCXe5EJ0ZgnjDviAvemeIKxFuZemJ/j/guqAqlPfekOPdigIqRl+1
         0qEqPh8R2ze5UZCr9PLBTOuUZE06CIa8acoxOaf6l9ppzqFTNGJI4JPoQAM9FzScr9Mw
         BKUEaTAtlyzRoC1tXCZyLJ2zLWcy1oU49/ZA4ZrdL+JvR2UK1wA8/+2lvUSEq7/LbTIY
         rR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738778179; x=1739382979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SezWguPGLH2gSBjLm56i4oC4VEJNlKhmOJ4S84wkkYU=;
        b=bOyNeMdnBWYBtcLQgPlUZ/r0ML0SURAHDv7qCiP8d1MF6qKjzaBcJGBk3/rpt54s3+
         67IyAskcZcb3HA53A1lfeyxv6hU5qE3K9rgVi8jhavhNwZ33xQMUjTrQqUmDSZDCU4kS
         rE9UPy4700U+nK3VGQ/wZKD8L3sNJ6dmbfzlZUbZu9t9KnTb0AKoXmmkU9PkfULKtzBN
         aGw0vT6GmavmCC3TOeI5bJ7dRvEjAaQW5FVtUPEqbAnCtOiMZ2pMUVEkaEpX7c7v90ro
         SaXytADPsFsb1zh4Ak3b4vlndmeJlAyr8SQxa6b2LebNP8SbPNptp33fo967S/ewMU1G
         Z+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXtTJvzSQnL5bjwN8IAR73sjTx5umjg6sf0N/RqHPhcsQ7a5Es7IPT9SFfvudMhYXTQ+zehj2MO6iU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2szGiN287sp4/QGvUtlEDHkE3PCI1Gtnf0/jDgBTikn4ElI05
	yWnLwPpk/76jnnKNoFoozVXqnH7OgMdiVyszrK2DiLU0TOAPFf/1qALX8VjHgLY=
X-Gm-Gg: ASbGncvHqjQ1sN9CvxKO+tLp5UdoqGk4qlsnAst89Z6sVDZ/agdMlAGUV32/r8UobId
	NX6TqPEq+GgnswFFEJtvBvrpnkIEJPG/XQAV7uJqp6Xls07LI5KIEcab2LrmotnNQ4c6YR7zxoo
	n46l4lnOWYs3w+OW/XcEDomtvFKbU5Eh7WqUoGBYOmUhWvf/PcyZPOFhUjtyRCIrIMlxk5sWGVB
	AWOgUpHJ0fGy8VwC20b76FaHM0Uu8CQUrO57P3VxMSbNaTbKTpS7cW4wGWS2h2wLiAjiOz/Joc1
	bwkyPvF88oCfMV8I6o4ZPBX2J8uQE5VeW60OhhQAt1wnm/bFYygXmcnHFgQ=
X-Google-Smtp-Source: AGHT+IHyaAmW6pOmMnweaAuPdmGLQ0Sgq+YR2iG7QeDWvK0YRYRhPfQGOIZZdtevGjJeARiBlSopbA==
X-Received: by 2002:a05:6000:1445:b0:38d:b1a5:3f51 with SMTP id ffacd0b85a97d-38db48c8baamr3052563f8f.22.1738778178870;
        Wed, 05 Feb 2025 09:56:18 -0800 (PST)
Message-ID: <2fe7fa85-6025-4a51-9ad6-03cbcb5f4131@linaro.org>
Date: Wed, 5 Feb 2025 18:56:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] meson: Disallow 64-bit on 32-bit Xen emulation
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk, berrange@redhat.com,
 thuth@redhat.com, "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20250204215359.1238808-1-richard.henderson@linaro.org>
 <20250204215359.1238808-6-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250204215359.1238808-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/2/25 22:53, Richard Henderson wrote:
> Require a 64-bit host binary to spawn a 64-bit guest.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 5a40a2a629..0ca83135e2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -304,9 +304,14 @@ else
>   endif
>   accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>   
> -if cpu in ['x86', 'x86_64']
> +if cpu == 'x86'
> +  xen_targets = ['i386-softmmu']
> +elif cpu == 'x86_64'
>     xen_targets = ['i386-softmmu', 'x86_64-softmmu']
> -elif cpu in ['arm', 'aarch64']
> +elif cpu == 'arm'
> +  # i386 emulator provides xenpv machine type for multiple architectures
> +  xen_targets = ['i386-softmmu']
> +elif cpu == 'aarch64'
>     # i386 emulator provides xenpv machine type for multiple architectures
>     xen_targets = ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu']
>   else

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


