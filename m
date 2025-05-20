Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D9ABDC83
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990811.1374738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNts-0005kz-JQ; Tue, 20 May 2025 14:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990811.1374738; Tue, 20 May 2025 14:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNts-0005jU-G1; Tue, 20 May 2025 14:25:00 +0000
Received: by outflank-mailman (input) for mailman id 990811;
 Tue, 20 May 2025 14:24:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmRr=YE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHNtq-0005jK-NT
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:24:58 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33a72a8c-3586-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 16:24:55 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-601c5cd15ecso3802589a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:24:55 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f1fe4fa6sm32635055e9.16.2025.05.20.07.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:24:44 -0700 (PDT)
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
X-Inumbo-ID: 33a72a8c-3586-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747751095; x=1748355895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vukP6mAFAfc2z2Hy2jbrX5ANwFrMXoNMWXcrIYeDrBs=;
        b=os9Kx8gRoxbc8RqNs6XI+SEtiv3xdUgb0NnGoDFDqwaMAw+aeuizvjUBJ6JePJ1SB4
         mxPTWmGjWj+RGp29uzWzk5TRRhuqW33l10zzR6+xnGpdKD1rp4rRVZIjZycf0w115Lpb
         o6xa2V/tAh8q04jQYa28rt0jY+JgYsQYhUzxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751095; x=1748355895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vukP6mAFAfc2z2Hy2jbrX5ANwFrMXoNMWXcrIYeDrBs=;
        b=pW4LYgPun4RiyKc6EAUR5ZDN+2SatphmhACEXvgS2w9rrM9j5BJGYHreaBtc95+fy2
         /eP2gM2zre5pcoOIPBDaNfpR/wIiLNvMw+1kHz1SNNVOemhnpSxfIw3g7+Sh1EWPIOke
         D63ecWo4QjW6l+54EJ1J7CAJ21Ti+qDpu6/4z+FJTg44N8h2E6SlmdWUk5yAgsM16JBo
         LWh24v4qj70ysfTVsJIu3yVxKgEI+aWwK2Yz+uW8Xkj9sLesJEl7KhL8kfDZxxV55JL6
         37UHi6GuVOkeFP/7ONgNfAGKtY56sBYuMCBEMMTiRMN9ghOv0y3x9vJlOt8OsCPftp7V
         aLWA==
X-Forwarded-Encrypted: i=1; AJvYcCVQw6LiQ/mAiD+9wCChDusm8RP2gRpG+8M1AefH2QfnOOR1hvrVvNRQVxmBgVNdRof4zUajYc7QlmQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjJj+LJAUc+QsRrYKwn2uFywFQ7bfnxCiOGMMopSriGtvPO7Yf
	pfTQrUiFjMh8MUeqa3PTwqFdBMxVlvrExgebJCnlzmtoN+mP7vtw/D7jXdlgU6f2bUeCI9G/t9o
	s4qf9
X-Gm-Gg: ASbGncvrEHzWvM6awv5KPhxKXuou6n7gxRJ1MRxBvb22dZn3wINKPcRfVO8hTIFovy8
	h0fKdgOtLNJzsKNGCSuxm502uKV1nOt9MjbhAr62Sj5ov4/beDFFto0vgg+VUU1ziQeLZDzPoay
	liNHfANSt4o1WLQtmwxK3r9X/cpin+ApNH4ZNL0MMNGbKcHfIVD0lXBg1J0DuUYEX5n6tmfxIFl
	tapw7ZwLEGn3ftCEwYrFiIbY/mfJs5ZIVOWZ/8r1hCBA0svfch6l8ZAXyRUuAXLO0bP8FOF9Ez/
	h6EYx7Y+tsV0z8/DIku/BEddZ8l9inn4KUTAFaq3Pcv8gc0oc/OoAPLV0eGA6cADVqeSw6NZEnT
	aEkWt+skn2e8MIMOm
X-Google-Smtp-Source: AGHT+IGRScKP989oJnjMGzL0TuMyyhiWGMxYCt8WoRzcsa2lYHP+dQ1qnySGYEoqoTaNcbC7GYjX1Q==
X-Received: by 2002:a05:600c:c1b:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-442feffbb8dmr186256045e9.17.1747751084368;
        Tue, 20 May 2025 07:24:44 -0700 (PDT)
Message-ID: <26756272-790a-4418-b75e-5052f10319d1@citrix.com>
Date: Tue, 20 May 2025 15:24:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/vgic-v3: Fix write_ignore_64's check in
 __vgic_v3_rdistr_rd_mmio_write()
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250520134751.1460968-1-oleksandr_tyshchenko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250520134751.1460968-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/05/2025 2:47 pm, Oleksandr Tyshchenko wrote:
> An attempt to write access the register (i.e. GICR_PROPBASER, GICR_PENDBASER)
> which should be ignored (i.e. no virtual ITS present) causes the data about

Do you mean "data abort" here?  If not, I can't parse the sentence.

> due to incorrect check at the write_ignore_64 label. The check should be
> inverted.
>
> Fixes: c4d6bbdc12e5 ("xen/arm: vgic-v3: Support 32-bit access for 64-bit registers")
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  xen/arch/arm/vgic-v3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 2eaa48fadb..b366b046a2 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -649,7 +649,7 @@ bad_width:
>      return 0;
>  
>  write_ignore_64:
> -    if ( vgic_reg64_check_access(dabt) ) goto bad_width;
> +    if ( !vgic_reg64_check_access(dabt) ) goto bad_width;

As you're modifying anyway, the goto should be on the next line.

~Andrew

