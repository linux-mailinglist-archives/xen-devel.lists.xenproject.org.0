Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D49E1931
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:25:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847849.1262910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ62-0000gS-6J; Tue, 03 Dec 2024 10:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847849.1262910; Tue, 03 Dec 2024 10:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ62-0000eD-2v; Tue, 03 Dec 2024 10:25:34 +0000
Received: by outflank-mailman (input) for mailman id 847849;
 Tue, 03 Dec 2024 10:25:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lc0I=S4=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1tIQ61-0000OY-Ax
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:25:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec77d4d8-b160-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 11:25:32 +0100 (CET)
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-lJWNlTEeM_65pIhmjGo1xQ-1; Tue, 03 Dec 2024 05:25:29 -0500
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-6ef6add361aso49862827b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 02:25:29 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-199.web.vodafone.de.
 [109.42.51.199]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d875221e2csm59512626d6.108.2024.12.03.02.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 02:25:28 -0800 (PST)
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
X-Inumbo-ID: ec77d4d8-b160-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733221531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9RD4AGEHDHwzQlUUYYm0x1kn9o+vBEiZ5DFCqwxpxGM=;
	b=MkOZ8PfW0OWe4ceEQwitA3YTUcAJ7alWJdhsEa9vmCEktk+debZEvLTEroDt/dZGRVknL4
	MHWhPxD6VhhtfqiUcLXYkgG4+RW/b9AyeoUSx8nm3Kw6E20mbuj4D+5X0piC98rcA3mvqp
	H1j2r+2J2rWuks1VXzsMq/Hm6HuSFkI=
X-MC-Unique: lJWNlTEeM_65pIhmjGo1xQ-1
X-Mimecast-MFC-AGG-ID: lJWNlTEeM_65pIhmjGo1xQ
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733221529; x=1733826329;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RD4AGEHDHwzQlUUYYm0x1kn9o+vBEiZ5DFCqwxpxGM=;
        b=XWgyERQa65h9VePCD33VYTjbP2CXFKfnJ6QldtRPaLsxVZL6i5yleueJ6AgwQNPxjp
         v/XdFA0M7ls/MQrMXJgoF0OFxnzLgTx9sldL4sFCr3JIC+Mg56wiVV7TpggID317qfx+
         4vzf+b04LVkmEkDOuoZNB9JHenxBqxwinBKXP/V0WIiZRQ0oKRTgAddZeAkrZRblG7eH
         JieQbaHzaAfWnf+2S/eQj3A+2JOGCCKTmM9HJsTl09suO/grCEfxXzbL6oLSGP2I5f2Q
         dIhGpcmVCucltt5WUSkE9KDOZsHi61XmyvrwvUdp/iKDQT2VUTgF5CwW83FFb2EiZtqV
         saPg==
X-Forwarded-Encrypted: i=1; AJvYcCV4KUX/ekPobjQvE3ITZK4AMrzr/QuebFz8/zcib17YNjiSBVlDhbIz6N9CzVQnFkftmkX+VcScZxg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlNDeTMVSHQpLejl6+vnfG5Ph8heQXttSEhHl3/GUzVApHPO/d
	7DfKL4lCkFcE8seC8JiPw6TK9VUJmaQ4vKJZQeyxqZOTl84hvoY4xOh428Zqd9nhml/x4fe6XTS
	yyBlDM6SmSsMXsA/uF+taX+Y+mywyosSSzKXdhc18uUYBoZt1LT5+u5zQts26yhOd
X-Gm-Gg: ASbGncsSLCuNNIb7b6mXbOIBZKkdmPbPezM3mvPaEdMvxZZE2JxquFX8uZFndm+n9cR
	ieyrAzBdT/Djr5fkYRXE6D+FtHp4ste9dDsmP5ORGBdfORm8Kl1EyuLk58foBJVMxiVlYANLaPA
	WEw2LYtEbjCBO29jdGd+md/tNOMsNfroYIPRknelK6CjK1JF28SkE4zu1rIY8Di4ubFKWo0aCJc
	BKAmWWL+gQUqQUaRHJYdcmC+9msq+5+2VZs7WodykT6qMYaaTZGh2Mt6X64cEZzJ0uXpv4v+wwQ
	UdTWPA==
X-Received: by 2002:a05:690c:7082:b0:6ef:7372:1131 with SMTP id 00721157ae682-6efad347d99mr29596027b3.41.1733221528929;
        Tue, 03 Dec 2024 02:25:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCzHlHtzf8vt0HkFH4QdgEQXGf7HxTcee32BcaMWjQ+E3LVW6GJQ+e9gCjohaYy4zSxRVU4Q==
X-Received: by 2002:a05:690c:7082:b0:6ef:7372:1131 with SMTP id 00721157ae682-6efad347d99mr29595887b3.41.1733221528714;
        Tue, 03 Dec 2024 02:25:28 -0800 (PST)
Message-ID: <dbaeb043-11b6-4dc1-bac9-2995638f2833@redhat.com>
Date: Tue, 3 Dec 2024 11:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] tests/qtest/fuzz: Remove legacy '-machine
 foo,accel=bar'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241203092153.60590-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JREj9Bd8zTeV_KU-9o0j6GAv1YU4g1ROJ_NY6VrOxWA_1733221529
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/12/2024 10.21, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
> fuzzer scripts and tests.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/fuzz/generic_fuzz.c                | 2 +-
>   tests/qtest/fuzz/i440fx_fuzz.c                 | 2 +-
>   tests/qtest/fuzz/qos_fuzz.c                    | 2 +-
>   scripts/oss-fuzz/output_reproducer.py          | 2 --
>   scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py | 6 +++---
>   5 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


