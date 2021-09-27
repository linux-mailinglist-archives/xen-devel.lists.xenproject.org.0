Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A316419C5A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 19:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197137.350098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUuNo-0002Xh-2s; Mon, 27 Sep 2021 17:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197137.350098; Mon, 27 Sep 2021 17:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUuNn-0002Va-VW; Mon, 27 Sep 2021 17:25:39 +0000
Received: by outflank-mailman (input) for mailman id 197137;
 Mon, 27 Sep 2021 17:25:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWny=OR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mUuNm-0002VU-N5
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 17:25:38 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7979ed08-db6a-4aa8-bff5-cd77488ebf11;
 Mon, 27 Sep 2021 17:25:37 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id z24so81572509lfu.13
 for <xen-devel@lists.xenproject.org>; Mon, 27 Sep 2021 10:25:37 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u14sm1659605lfi.231.2021.09.27.10.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 10:25:36 -0700 (PDT)
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
X-Inumbo-ID: 7979ed08-db6a-4aa8-bff5-cd77488ebf11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=BxtWH+zfZOEqiyTTmaQRt0CfvXvlFSx5l0UI63Q5xaM=;
        b=ddOTpbia4/+S1xHCQ3gyH9+KRouDsqA+F4EWRzeE+0xHng/Z7M3p0DIVaeCGoWunxb
         ZV97ayrb8hTMcQ/7vjGvhAdcNszIWxnd0yw72+ZUFAi7KXFc8D8e4Sj591SU2KAfJt+O
         FDgsUJN4ZqM0srqNTnJTr+plKMnQPqRnv6Ni5SYHIDTvyjxLSydJkSKl0LDIoxdp7H/Z
         yCjswkvBVc5Eyi1ZNKJYwsiegGIu9+dbe48BPEqYimW/v32OyAEl0wQRCZcgcEdZh/jW
         /qSLWsw/uKgxOG942DDngeT0Vdb9NYA0CRDzDWjOD4uCGVwB+mS0rKRzPJJ5eAwKwaQL
         E32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BxtWH+zfZOEqiyTTmaQRt0CfvXvlFSx5l0UI63Q5xaM=;
        b=KgREWVkGk697Y+qqDHrgPXuJjGWo/p7MiFIe1RhxQdfshtTkD5TtBX0aMtOvc7aUhd
         YnjpeVX/PrQy0BpL/lzZx/v7VsRbmDo6l/YsbJHj1q5pmrOR7VumsHyq3syFQEQbgFLN
         GaojzSZLoyMwO/GB48u1/gOwm0XUVy2hN3XC/TTWCTMg/Qky4vz/EcT/DUY2ROFXRZ5R
         DfyhYuBO4Ve3NuJs1f+0DfJaVVZ90s9FjJuWhe6aPahgsGxH7O56Po2pc4leqACSM0Dn
         8eX7hrGcqsmISlccB5s5KZmSDpjrE3fFa0ZYb0+akzqZclsvrIp0dAt0w4c36UgG3Atw
         3PZg==
X-Gm-Message-State: AOAM531NimxutkIoteQwzSftwTanhin/HVarLViolBw82Ex1HVWwecvM
	oEgYAfm3Au7PzBk26lU4L+4=
X-Google-Smtp-Source: ABdhPJwD85iEm4TMHrL2i4N0lju0rL0CtCBKrFAiVS1yG48GbVsbOta1nOP4NGbyGUSULJtbeb6CIw==
X-Received: by 2002:a2e:7008:: with SMTP id l8mr1053858ljc.340.1632763536739;
        Mon, 27 Sep 2021 10:25:36 -0700 (PDT)
Subject: Re: Xen Rust VirtIO demos work breakdown for Project Stratos
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
 Mike Holmes <mike.holmes@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, xen-devel@lists.xenproject.org,
 wl@xen.org, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Sergio Lopez <slp@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <87pmsylywy.fsf@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <47bce3dd-d271-1688-d445-43eee667ade3@gmail.com>
Date: Mon, 27 Sep 2021 20:25:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87pmsylywy.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 24.09.21 19:02, Alex Bennée wrote:

Hi Alex

[snip]

>
> [STR-56] <https://linaro.atlassian.net/browse/STR-56>
>
> 2.1 Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])
> ───────────────────────────────────────────────────────────────
>
>    Currently the foreign memory mapping support only works for dom0 due
>    to reference counting issues. If we are to support backends running in
>    their own domains this will need to get fixed.
>
>    Estimate: 8w
>
>
> [STR-57] <https://linaro.atlassian.net/browse/STR-57>

If I got this paragraph correctly, this is already fixed on Arm [1]


[1] 
https://lore.kernel.org/xen-devel/1611884932-1851-17-git-send-email-olekstysh@gmail.com/


[snip]


-- 
Regards,

Oleksandr Tyshchenko


