Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD5398A0CB
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807229.1218545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEer-0005Kn-S9; Mon, 30 Sep 2024 11:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807229.1218545; Mon, 30 Sep 2024 11:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEer-0005I7-PN; Mon, 30 Sep 2024 11:33:41 +0000
Received: by outflank-mailman (input) for mailman id 807229;
 Mon, 30 Sep 2024 11:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Bw3=Q4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svEeq-0005I1-3g
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:33:40 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0825ba4-7f1f-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 13:33:29 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so642130766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 04:33:29 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2776debsm515749266b.34.2024.09.30.04.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 04:33:27 -0700 (PDT)
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
X-Inumbo-ID: d0825ba4-7f1f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727696008; x=1728300808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ai5cGA3AZU9bczCwTCaS+kkqmagWHlrM+YA4qrmIvVw=;
        b=kNEcRWseV9KFySvm0YJ6LjPwtzM2GcZ6yk2ZOYU/RZUH8qBbtYXEvw5upbHSveLORQ
         1rwTxIqvbuml0y3oBc9NOFea8KpkxLv+fytK6EE7NKEa+g+wADQYpFzP4yBexeNUHV/J
         nPwgL11xgaUgoLXphoWMWtG6sZg6J1rxVoCF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727696008; x=1728300808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ai5cGA3AZU9bczCwTCaS+kkqmagWHlrM+YA4qrmIvVw=;
        b=R/5y1IPZ17G7lEtY3YStB6Cn4SkXXMIst4TlGKqjUU52B6f9oXxZwMFGr40OqoLiut
         73qwc3wcq1sdc7pMvGAdgwjiD2xkaYnHBbvQanGMSBYulS6rTrElIZQmv/Gmsx4J7Uo4
         DsuQNbErfBFDI75yN8mRSXmocpTm9rFnva8WN9SbmSjI5MwPdBvddX9YjGBq9sKHg3ra
         Rc46b5XPWPSEUMmlkX6AdiCiwf+Z3qfJaWd7rAxnPLUkpyie5pKQkIN8C3Pn1QqNy69O
         nH7kyuEMxcQ4P8+9l3CoQAfc+gIQiBADrFGhDWOt77H5MlVm/XfWwNa6rp+VvYa7gV9K
         Ocig==
X-Forwarded-Encrypted: i=1; AJvYcCUM0E2KaRkfox45vkBVdvZoWWQjPTESX9zsaBWaau+6ZiHWVCA/WbG5TbTSkoCOEUVMlQ5NHNq8aGc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUJzRYVMGBQghzzcrMNGSalKOtNg4cIxdfsLZRmDBCl42S1TST
	tUHZbA9V5jNXKB+REHFZPvUSoHROESGjX3b2FtCZDL4XpUpEcPzJKjzYVd3mL/E=
X-Google-Smtp-Source: AGHT+IFj7i4Lxx3nwsGMHBNVgf07AHsXqILjeMs74uYT4uKdmNjIkY0c8w99rtM+rWxiLb97JIBynw==
X-Received: by 2002:a17:907:9445:b0:a8f:f799:e7d0 with SMTP id a640c23a62f3a-a93c48f6613mr1439428766b.5.1727696008582;
        Mon, 30 Sep 2024 04:33:28 -0700 (PDT)
Message-ID: <af218437-b8fb-4e34-95ca-cb39d4f57e7b@citrix.com>
Date: Mon, 30 Sep 2024 12:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
To: Jan Beulich <jbeulich@suse.com>, Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
 <Zufh7DOSCwzhrpZG@macbook.local>
 <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
 <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>
 <ZuqgTKqaUDWC_I-u@macbook.local>
 <27d717f7-3073-4139-bef0-05d1a39f1e6c@epam.com>
 <d5a6774b-3c50-4b39-9bb7-740f0763a1d4@suse.com>
 <12072ee1-5a39-4c19-a442-c5be45fb968e@epam.com>
 <15d79e3e-dea6-4c07-82c6-43e17e429123@suse.com>
 <b2edae9d-2c1a-4e67-9e01-2ce3813d4dbe@epam.com>
 <3c6aebb6-ec8c-4f1a-b5d2-eb216b9f7bef@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3c6aebb6-ec8c-4f1a-b5d2-eb216b9f7bef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/09/2024 12:27 pm, Jan Beulich wrote:
> On 30.09.2024 13:03, Sergiy Kibrik wrote:
>> 27.09.24 12:44, Jan Beulich:
>>>>>> (probably with X86_PMTIMER option depending on PV)
>>>>> HVM you mean?
>>>>>
>>>> I wanted to do it like this:
>>>>
>>>> --- a/xen/arch/x86/Kconfig
>>>> +++ b/xen/arch/x86/Kconfig
>>>> @@ -386,7 +386,7 @@ config ALTP2M
>>>>             If unsure, stay with defaults.
>>>>
>>>>    config X86_PMTIMER
>>>> -       bool "ACPI PM timer emulation support" if EXPERT
>>>> +       bool "ACPI PM timer emulation support" if EXPERT && PV
>>>>           default y
>>>>           depends on HVM
>>>>           help
>>>>
>>>> to allow it to be disabled when PV is on and prevent situation when pvh
>>>> domain can't be created because !PV and hvm domain can't be created
>>>> either without emulated timer.
>>> How does PV matter for this "depends on HVM" setting?
>> Options are dependant on HVM option, because pmtimer & stdvga drivers 
>> are part of HVM support code.
>> At the same time these options are allowed to be de-selected when PV/PVH 
>> enabled, because only PV/PVH domains can be created when stdvga or 
>> pmtimer are disabled
> But PV != PVH.

Furthermore, be aware that there's no such thing as PVH in Xen.  It's
toolstack level "branding" for want of a better term.

In Xen, there is PV (ring privileging) and HVM (hardware virt).

PVH is a toolstack level construct which passes a different set of
emulate flags, and doesn't set up qemu (on ioreq server 0) by default.

~Andrew

