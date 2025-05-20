Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55DCABCF1A
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 08:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990458.1374407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHGKs-0005sh-Fo; Tue, 20 May 2025 06:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990458.1374407; Tue, 20 May 2025 06:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHGKs-0005qg-DB; Tue, 20 May 2025 06:20:22 +0000
Received: by outflank-mailman (input) for mailman id 990458;
 Tue, 20 May 2025 06:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHGKq-0005qa-9k
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 06:20:20 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fea3714-3542-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 08:20:18 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad53cd163d9so602503466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 23:20:18 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4cc5e9sm688760566b.173.2025.05.19.23.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 23:20:17 -0700 (PDT)
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
X-Inumbo-ID: 7fea3714-3542-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747722017; x=1748326817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPAQPo0D8mdf+B7aRBWjKJ/4rZOLY5oVWJ0SM/csTM4=;
        b=Wl1nT/JjWB6CnXCOsg7yC2OOtHHlzEBqOfTtLA63715Ph24JTkpcaX02/8slSRw9r6
         tYxAI44SFB7p4eo85TIqSt0sILmny/yZ7eVvCGflHC/+2z7JoZHx26dD+isBiOvUsLmr
         TaDltDVG85a5exYtVAaYoIAVYasvi46orYfAjkV1UHaDHkDBehK2O8jb6wMeJxmamA17
         6+vNXL2yR/0LKI6u7gC6DXDQgJLHEaQryqSYmQh0RDG7fwMKCJMvY8fSHAF4ESRkvFLA
         kyhj5Xzp7vHE48UbtURSBPJ+oH7FZafZ/AAABbhgm8l3qiPhqHQFtGgbBwHKJfn5UUxT
         EIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747722017; x=1748326817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPAQPo0D8mdf+B7aRBWjKJ/4rZOLY5oVWJ0SM/csTM4=;
        b=GbepKmuyHSmWjZP35CcxuQMTVrTR3QoNr6KwoD55UGPV4vKLdGoKURdUam1Qxk6SHU
         dr1ES/mE07jGakkH4MtJd5gi25r6vjuxGNorUJklU7JGhcGBWaHv5BVD0tLjLBKx6kAp
         aT5TmRjx2x2tbim9L5gcO1kg5p+vK9u8DjE4YpshlBKt4k2vtweKuCjF60/YnTC2Xqqb
         KbrEDId4mqmmwjR78gL2EgyqaA0UbrQerb+kiA4QhvLhq8atKl9xRhhReh8M8yXvfUYl
         C7UWfR/sAlJ1vXwyEEYvuNzeidGOmEWXuiArO9yTiUVcn7+mlvB9Frps0Sf/HZk42osH
         noDg==
X-Forwarded-Encrypted: i=1; AJvYcCX0sduErzkXx/VC2O1k3VsrHxBnRgvcsuQzC6/dB25igkq5uCZoCQ/KVsrkyNhZd2HFdFFM+1xe8As=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzn7cgmzrMpwBYqziZqGzdjpUL7w+N6AXvmcP6gzE8gQWCkwOpo
	4U9sHdVSBrkUvw5uq6k5Fao6mLWqUYcVrDSruw5wSjEVf88lBVnkRCsQg7Eu8keZxQ==
X-Gm-Gg: ASbGnctXexLtIedH44NEAIecUXRCnQ7JmtnSqLU9cCp6kVYh3M9A0D0tofEAw2ceTVJ
	fvsvZ3a7YFFfJQKsYa8C3/U48PCouP3/AQIUULyN6HVA//mk79eRiJ9ThTgClOVRjWFGhouTwUZ
	5BN9UrJVHkbgyQDR9iFCL0Ue00qQDwVgXAJyebp4u/6fossxfmQxRnHX3frrsOse+5mYcFdRtMH
	U5FJUtsLGnjm0Zxt7BYNHSRSWfvCm7SHSyF/f1PKSbdkeqWRtNqDUYEAqVCULiqUDy0BOPovBlF
	J01gumVxoyNbjvAXTcKYqtJbCa8aJdIK1GSpSwhO5IrEaABFEDiP/Kc2g28Tpg==
X-Google-Smtp-Source: AGHT+IGh3hq4hPQrOoZpu9MT9N7qoDaj2JKB7EUfwRcAvKsSwd7HayPSHpb5R1GgwoI3SI3etzDlZA==
X-Received: by 2002:a17:907:db02:b0:ad5:27b6:7fd1 with SMTP id a640c23a62f3a-ad52d48da04mr1518032566b.17.1747722017425;
        Mon, 19 May 2025 23:20:17 -0700 (PDT)
Message-ID: <a8423035-771d-4e55-a3c5-562cc67dbb26@suse.com>
Date: Tue, 20 May 2025 08:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/console: introduce console_get_domid()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250519201211.1366244-1-dmukhin@ford.com>
 <20250519201211.1366244-3-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250519201211.1366244-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 22:12, dmkhn@proton.me wrote:
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -78,12 +78,11 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
>      unsigned long flags;
>      struct vpl011 *vpl011 = &d->arch.vpl011;
>      struct vpl011_xen_backend *intf = vpl011->backend.xen;
> -    struct domain *input = console_get_domain();
>  
>      VPL011_LOCK(d, flags);
>  
>      intf->out[intf->out_prod++] = data;
> -    if ( d == input )
> +    if ( d->domain_id == console_get_domid() )

How do you know d isn't a domain different from the one that was the
console "owner" prior to being destroyed? Original code guaranteed this
up to ...

> @@ -123,8 +122,6 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
>      vpl011_update_interrupt_status(d);
>  
>      VPL011_UNLOCK(d, flags);
> -
> -    console_put_domain(input);

... here.

Jan

