Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC709E1960
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847903.1262940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQEe-0004uF-Do; Tue, 03 Dec 2024 10:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847903.1262940; Tue, 03 Dec 2024 10:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQEe-0004sG-B4; Tue, 03 Dec 2024 10:34:28 +0000
Received: by outflank-mailman (input) for mailman id 847903;
 Tue, 03 Dec 2024 10:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lc0I=S4=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1tIQEc-0004s0-Qu
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:34:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29af441e-b162-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 11:34:24 +0100 (CET)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-3imNtiqfPWiTDY4FPD89Tg-1; Tue, 03 Dec 2024 05:34:22 -0500
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3ea3b6b1930so4122752b6e.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 02:34:22 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-199.web.vodafone.de.
 [109.42.51.199]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d896a2a706sm36364946d6.112.2024.12.03.02.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 02:34:21 -0800 (PST)
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
X-Inumbo-ID: 29af441e-b162-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733222063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c8+mtyeu29sdyoeKiIX8Wc5RPqMhIGCC9Pt4TP7ecf4=;
	b=cJqHL1FUPDVrg3aN5BY3BEBlF/rtphem34aLZEAbI6q8hiKviHf2c+rggFNYQWRkrR7Ad8
	aH0j5Brin/hbDLKWN/GVcVX+gBm5gyK0vGaBZauHlSEXMA2J9np9py30bCwi+6mvfdkKvs
	W8MbKIt2XHCqWDr2M1hAO7oGPKmws1Q=
X-MC-Unique: 3imNtiqfPWiTDY4FPD89Tg-1
X-Mimecast-MFC-AGG-ID: 3imNtiqfPWiTDY4FPD89Tg
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222061; x=1733826861;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8+mtyeu29sdyoeKiIX8Wc5RPqMhIGCC9Pt4TP7ecf4=;
        b=KUTV/1Eko5DQ0gbXrvaMESaXC9CCmDdklqeaR2FClxScTFHjBXfHKQ+rL71CbwiFiN
         +LRHrfskxAqO0AYY2t+fs9fRk1cVgK4II1aYV5wj68U+rFEZTGbPzGdZ6S0QENe1OrdI
         JF/KDI1PRmzseueZSfBGpL/NcMMSwFjozK2eU2YD+jGtsn5HwiXrD5SzUbR19nJKMkf0
         jGhe7lMrATBlVEaH5x4ByG0CfsXi2d3tW7M/5hkcBS034dsJZk24EtYOvSctXgYnjCo2
         VpxTRohLy0SH99N5si9HJ8QetqrAj4uNz+Uy5uCHhPKvNQ5oGWtaIU5832DNfJuAL+ml
         an6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzi+37RLINd7DYhysjL08v7ZaiAVJLIswpGNfnz7MlXxD2AaKjEmp6VzhzmAOax+uIwVdp9Ze1iG8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkX9WABSa0HCo1s8JoJ/xI6G+J9e9NJ277TmOV1qkiCbrqpSne
	bz4JqTr/UkII7+3roVKCVeAsbsY1ACzoMNyuq15CFHTMx4gcrC28eihklPFZpcyL8DvRy8WQqG+
	IM5TNsIq0YaZ7PFe7Fnsm0Eh/tHUA+PvYwNm5EiZtdfdE/T0kBKxDtrGOSPFuERw6
X-Gm-Gg: ASbGnctbtyqNlcSXZ9QkDHIzOsaBj3A06YzHoCULsmG7m60pemJMC35jjlO8VwcS3gg
	QMTVWQ5AkbYEpRM4uNqonSy3gegX7Hi44ul/NcYMxObfg/cU9OdDu/euwcH6e8gXYNj6nVEDjpa
	6HDLpiBzQ9bKbhq5Z67QFcQjNteLgusERgjdSlf5mWk+GlOV96h8QDE21z2dmOB87oTa8cEoCkt
	O7/5zs/SypAbjfIHP4PFqDyfNKeB8eRtJMxfB2XIy1nDAy2MgU7Aq6ChMtepmwN5rYVv8OjSHbD
	4GZ8og==
X-Received: by 2002:a05:6808:e8b:b0:3ea:50a8:4559 with SMTP id 5614622812f47-3eae4f3644dmr2105741b6e.11.1733222061682;
        Tue, 03 Dec 2024 02:34:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuIhxr1AdwQWCioyz4uSMKD/Tml3jp2xw56cENHvBd4LkbxW9BtfirqUCqNBfExKytFJdHMw==
X-Received: by 2002:a05:6808:e8b:b0:3ea:50a8:4559 with SMTP id 5614622812f47-3eae4f3644dmr2105729b6e.11.1733222061475;
        Tue, 03 Dec 2024 02:34:21 -0800 (PST)
Message-ID: <0715a97a-5b59-45c9-acd0-a1357a6ffa86@redhat.com>
Date: Tue, 3 Dec 2024 11:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] accel/kvm: Remove mentions of legacy '-machine
 foo,accel=bar'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241203092153.60590-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K-D1k4kVfrqXovhNQhvie_CykjCGqUwG7VfWCaSgLOM_1733222061
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/12/2024 10.21, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Update the documentation when KVM is referred to.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   docs/bypass-iommu.txt            | 3 ++-
>   docs/nvdimm.txt                  | 2 +-
>   docs/specs/tpm.rst               | 2 +-
>   docs/system/arm/cpu-features.rst | 2 +-
>   docs/system/cpu-hotplug.rst      | 2 +-
>   docs/system/ppc/powernv.rst      | 2 +-
>   docs/system/ppc/pseries.rst      | 4 ++--
>   scripts/device-crash-test        | 2 +-
>   8 files changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


