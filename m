Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 576B4AC100B
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994282.1377350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7ug-0006s8-2G; Thu, 22 May 2025 15:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994282.1377350; Thu, 22 May 2025 15:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7uf-0006ph-VJ; Thu, 22 May 2025 15:32:53 +0000
Received: by outflank-mailman (input) for mailman id 994282;
 Thu, 22 May 2025 15:32:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI7ue-0006bs-3R
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:32:52 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05d97bfa-3722-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 17:32:51 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-601a9e65228so4367063a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 08:32:51 -0700 (PDT)
Received: from [10.0.5.8] ([213.235.133.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad5b192cb0asm304924066b.170.2025.05.22.08.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 08:32:50 -0700 (PDT)
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
X-Inumbo-ID: 05d97bfa-3722-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747927971; x=1748532771; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ME/8N8eNfh+ICyV22mNqwvI/okvN6ReKjQi2OCzXUE=;
        b=KNGMoLAwlFPPGoGNSdeZaomgkWoWrhWeuVqRv67p7dPnf7WTbYIkN5DLpjaCsRRVJX
         If7yxM/C4QfPZ8oecoaveQDbI7lJq59TaatoeeiBcHIrMTyAWbCDVz4+Sa8d/2/xET5i
         IFP9hP8brLXoIJ0nn/kVIGoTAV8bH1Xk2YI+LmQTnqvmve6ExztJRkdHC226dHSirzye
         MtTLRMLACloVtN5ZR55O+iCR3vkBaqZJft2onN0EbjPu6xeoJHh8JuoTbjcVR87Yjo9k
         tUS5AKeVoG7vHBc8En/k4FEpGFUsjeqiJvQCyB41pHl9cTePSK0UZkAu08steRf6UyuF
         q6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747927971; x=1748532771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ME/8N8eNfh+ICyV22mNqwvI/okvN6ReKjQi2OCzXUE=;
        b=AxLWzFMUWmuHMP2e+TghAekJ9vzhR04pyki5pQc3AR7BtW79n8xiNSdXYqA3GW7a6Z
         rJimsjGl/OlOvy26ZMjwszRSjmHEUS7snMmswmxZxgGVMMCj81GsisvDy3b+J6/Rzk5N
         cvHqdJcvi4eikIyOeIzSCEXUlTI1yhgauCeHzdDqlM8J2ILS8T1x1RpKO/Taa5NE0AH2
         EM70cYiE8t3vgaEaB99rccfM9f1ZLfN1T9NjqhwYTdhJ9GSyUpL6DtOz1T5wVzpNLn/2
         qfh4S0mjOkhex68yvnvwCNL63iT2TY31zZADk0AQAvkTHmPL0tWlpuh8D67hna0lBakf
         WKcg==
X-Forwarded-Encrypted: i=1; AJvYcCViJxlGbAkleXnhEJoVy3H6vMO9BsKyRVqy/dgOjInv2jfGsDvsOFKAT/5qIHdpJs9Zlx+GUTNuTd0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2wzE02kdWCKofcFehLoyMS38cLMwzqjuLpKweDlW4GBjsZ6RV
	pb35+r8L6nknxWF7AN5UEZxr0c25u1K3PDrRyI8A8IuIV3PqzpDza8wVdp9iv+nKyg==
X-Gm-Gg: ASbGnctPuKFRWlfN73ytX4J108Bbq/9jb1zTOZL38ibyME8VeXFKeEosDHLQ8tCWIoo
	bDnsWxGJzSwCeNeuaqU4/0ZqfWsome8PiUVy/T8n1djgQyjHMIajsrOY/Nkz6Kzxevj84w0WkeA
	ztYk92oheRXOgkcKxqzsLCHPVhOVLDJwbhLrB+EMSXJFcJ72huqVYwZmvaAS1nRdmoiFmEN20mq
	4iMXYNZrJE/2KdsCe7843kY3yqJo6qFMsfhvjKp7w93TGgQYo63I/Yakrg2SL/tb0DvdWX8ymdU
	zjQILMhoOlg5UVR7M9s=
X-Google-Smtp-Source: AGHT+IF5KJzSEoAZGBMzN4YVn4HLrgpsu/UXGRFxbV8KFdrqTxEieKpAflTw74PkmrGxvJwXEIVPIw==
X-Received: by 2002:a17:907:868f:b0:ad5:45d6:5fd5 with SMTP id a640c23a62f3a-ad545d66146mr2238979766b.30.1747927971066;
        Thu, 22 May 2025 08:32:51 -0700 (PDT)
Message-ID: <f1cdeb76-6b39-4852-ad84-012e9e128e92@suse.com>
Date: Thu, 22 May 2025 17:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] xen/riscv: introduce intc_init() and helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <e1c952169ca894f2ea5ab3236e3ceb68da0117c5.1747843009.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e1c952169ca894f2ea5ab3236e3ceb68da0117c5.1747843009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 18:03, Oleksii Kurochko wrote:
> Introduce intc_init() to initialize the interrupt controller using the
> registered hardware ops.
> Also add intc_route_irq_to_xen() to route IRQs to Xen, with support for
> setting IRQ type and priority via new internal helpers intc_set_irq_type()
> and intc_set_irq_priority().
> 
> Call intc_init() to do basic initialization steps for APLIC and IMSIC.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


