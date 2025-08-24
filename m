Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D08B331A0
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 19:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092154.1448176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqEPC-00031S-S6; Sun, 24 Aug 2025 17:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092154.1448176; Sun, 24 Aug 2025 17:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqEPC-0002yv-P1; Sun, 24 Aug 2025 17:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1092154;
 Sun, 24 Aug 2025 17:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=He09=3E=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uqEPA-0002yW-MD
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 17:21:20 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baef83ae-810e-11f0-a32c-13f23c93f187;
 Sun, 24 Aug 2025 19:21:11 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-333f92d60ddso25805861fa.3
 for <xen-devel@lists.xenproject.org>; Sun, 24 Aug 2025 10:21:11 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e609f72sm11356591fa.71.2025.08.24.10.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 10:21:09 -0700 (PDT)
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
X-Inumbo-ID: baef83ae-810e-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756056071; x=1756660871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tstixrJ1U30zPuZdAIq5lv7yMqCb01iOnxoT5R4mL8A=;
        b=RyoIe/YsZPHCYo3MxvkI0El01v1GdqSvGjOaX72+BL+eZRdz6mVXjkzxlWMKdMWof3
         STEl/vZo2iqcWgmAAUkbfREyh3CF82fEzGanXp5jibJT8DYrPhNUQhzqvnFIDLDiTCBc
         RpnHf6esmkQy9EBPr/PJ79UKOE6nOQDULa3l+SBMRIAFEplH9bpIdRfr8/opLXqowEBd
         YFY3BfHA7UDONomtK1mRHtYDhnLFokqV7Qgx+eYRiNtNhUh5RzuWKNLHhbL+wFLnqD7o
         dYqFRYnk/hk96GWRmtRMR1DN5SC1C6Jz9HrJSUMU6Y8XmbnuZp1BB4DS7LII75EfjNx1
         ckmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756056071; x=1756660871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tstixrJ1U30zPuZdAIq5lv7yMqCb01iOnxoT5R4mL8A=;
        b=iEOaTTYJVUk7i5/7I5SdorSGxjYpnXhb6w8wVRq3997z+/na5CXqE4LxImfSbKBWj6
         qZ5FJrqf13HFGSdZPWy+89PPzv9F/MZNVMazlHtyQFsHpSahd3vuC4ROOKeeDR42Zxhr
         fb+/Cl05fAXTrlxGUxw0+WrAPYwIZxPlo7K9R5qKo5Lu/ixXPuNr5OfhvZCao4wi0YHq
         nqXuiaUtNBn312zY5u/xLKqAcltFHq1DZ5ldmtigKV2FHrLJNOfj0caQ5cybeunOO/C6
         XKPJQhDsQAGvEjmwnXa4SIbz2yO4+QvpyhcCscGCBgJSXx751IDNLh3+S1gdx3x5Yb0k
         FFdw==
X-Forwarded-Encrypted: i=1; AJvYcCWMBjeA04b/INUHynXZE2Mblnr7H9J5R66Djy9faP/+lAqOqs82YY9b8dAog1HPRP3AIXuNXse2024=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+Qk6zicPi2zRYq8xZ/vkO4nFPhWzH2CB+XRRKKsGTtvjxplqf
	ioweFdEFz3OSR+1KYfN0yekdzWxlmu6m7nwyMhnZ8pnzu9O8/FmW6dS5
X-Gm-Gg: ASbGncviVkngy7pqTyo5rxzOJtiDn20IIuh/xHF3OSmM8aeBvOEwOEw+OS8rj7+s1/z
	zSo379kK4bR1EXC+v3hN48PgY5rBNKOmTnUc3wqvQLyHniO9UjNR8BsMbKyZxEXOoeUxN3+Nq9Y
	t4j7xZn3GU//zFk9XHI5gbENOXijr1qe4Xl67NsZs6JCz+o3StKwMH7frg+QCLMNPEI+y6tAIMH
	W3BFstbZ+O37UDuF0R2E5LOEfOuA2BkAWw+QYw/EIlA7trbJ5vr6eVsRDcogMgeBW6WhJ7b6kvS
	wKP7VX7dsU8y0MtYQ1a9DuyDtVHFDnk+x5nT+Ve1QCj2ag72ygpNXi7bntT8ZIx9d+pQ8FoSRh2
	lm7u14eDaJ2OotBUgq/a20mhaTA==
X-Google-Smtp-Source: AGHT+IHjrQoV7r1oWl7d4bTxtZOzqQ48jEm3crXIcz+Yc7tJKBgczRhlPVRg+AigCw/wTzfMeoBanQ==
X-Received: by 2002:a05:651c:1107:10b0:336:7747:723 with SMTP id 38308e7fff4ca-33677470a6dmr1499131fa.12.1756056070498;
        Sun, 24 Aug 2025 10:21:10 -0700 (PDT)
Message-ID: <9009233a-69b6-4b6d-b8c5-02550035aac3@gmail.com>
Date: Sun, 24 Aug 2025 20:21:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] Introduce eSPI support
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1754514206.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <cover.1754514206.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.08.25 15:33, Leonid Komarianskyi wrote:
> Hello everyone!

Hello Leonid,

> 
> ### Background
> Unlike the Linux kernel, which has supported extended shared peripheral
> interrupts (eSPIs) since 2019 [1], Xen currently lacks support for this
> interrupt range. For SoCs with GICv3.1+, this feature may be essential
> because critical devices, such as consoles required for booting Xen
> itself, may rely on eSPIs. Additionally, these platforms require eSPI
> support for fully functional domains, as any device using eSPIs cannot
> currently be used with Xen setups. Without eSPI support, Xen cannot run
> properly on these platforms, significantly limiting its usability on
> modern ARM hardware.
> 
> This patch series adds support for the extended shared peripheral
> interrupt (eSPI) range (INTIDs 4096-5119 [2](ranges of INTIDs)) for Xen
> and guest domains. The implementation uses a generic approach to handle
> eSPIs, similar to regular SPIs, while maintaining compatibility with the
> existing SPI range. Functionality remains unchanged for setups that do
> not require eSPIs.


I have lightly re-checked the simple Arm64 Xen environment (dom0less 
DomU under QEMU) with your series applied. To be clear, I did not really 
test the eSPI support (the underlying GICv3 HW does support it); I just 
wanted to ensure that your series would not break anything. So, in both 
cases (CONFIG_GICV3_ESPI=y and CONFIG_GICV3_ESPI=n), I did not notice 
any issues (at least obvious) related to GICv3 emulation and SPI 
injection for the passed-through device.

Also, I think you want to describe the eSPI feature in the CHANGELOG.md.


[snip]

