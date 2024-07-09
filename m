Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4C092B60C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 12:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756176.1164705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR8Wr-0004yL-Vp; Tue, 09 Jul 2024 10:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756176.1164705; Tue, 09 Jul 2024 10:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR8Wr-0004w5-Sg; Tue, 09 Jul 2024 10:57:01 +0000
Received: by outflank-mailman (input) for mailman id 756176;
 Tue, 09 Jul 2024 10:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7TZB=OJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sR8Wq-0004vz-S0
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 10:57:00 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6a87aa5-3de1-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 12:56:58 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso20436205e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 03:56:58 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427265d6ebasm9190805e9.41.2024.07.09.03.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 03:56:58 -0700 (PDT)
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
X-Inumbo-ID: f6a87aa5-3de1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720522618; x=1721127418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Klx7LL74vI+ro2X+0F2FCKOwfRQmfK+bzqc5UOyXUfI=;
        b=JmEOfTLdgx6WCs4haHieb9AmN+WdSER3FhqLSy8EOZK8gEmdBSAq9A4xvlDOtQ0N0W
         LcczH1AVePaiyKs4PbbG5dkMNjoSGIiHR4EjWWK5RYqxdkGwusiWT7S4uZW5SkwTap6i
         Q3l6Pc04MZuFDwdSeocIfw9LJ55VKDe102nnUC3G9+ITbG59YLEtpyiz9JAqTeTetDqa
         I+Q0uZsGyvIlLx7gtfv1r+jY8IIE0vu4R6TzK92hXAkAvoU9EkQ3Z5WhzjlnieENk1ay
         p8qiuFirHaBjiNCIZkAr1dFD46joCMRxlBiSFRbfq3V6rP0Ugs2byFjdGEZC6i/HUvJU
         L0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720522618; x=1721127418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Klx7LL74vI+ro2X+0F2FCKOwfRQmfK+bzqc5UOyXUfI=;
        b=If+0PD85d8LoCPKezW772eVdRZ4UBVjv1too/a/HN2EXZT6G923lBondWJy1g5uXcK
         F72vH/Fj6jVOz1At4t2sdM3yEFyaqfysFNnoJBbpgc8PIAxgQneXSDDAegCdSrORwmC7
         uOKwvzW3YAhJ/6gmw3FbuNhZVxAPpN8GeIK28vszgU9blv7gDNsAaWLXuYqLzzNgmBUY
         enL5FqZoxr8jNRKMs0+gRgitHL0e2w+pBZjNDdiUOPI0L82cW4ClWxjl8q90riFBgnOy
         RC7jJPADiYKaN6N/SZtMmR9PooQVt27CEiyhh56xzuNLVZGTmk5mJRnmFKubKCgqNRff
         kQnA==
X-Gm-Message-State: AOJu0YycsJZtMEZNASxP8nsLVtf2ndYb6/EmhOG1H5K4C8TJ2cv/v6P2
	+MdRSs0ehvlfr1wKBrWjHcwuShc521jHNVpRklGaUm3mbYSjgITOOvoLyy43m7Y=
X-Google-Smtp-Source: AGHT+IFsjfGVW0Vm93shA9/aWzaB+WbQjyYo3fTFdFeWdBc/0sYXDfKHQCMzls18ALDQXyYu8dpDUw==
X-Received: by 2002:a05:600c:44c6:b0:426:5fa7:b495 with SMTP id 5b1f17b1804b1-42672305df7mr15805555e9.15.1720522618313;
        Tue, 09 Jul 2024 03:56:58 -0700 (PDT)
Message-ID: <88db3cb6-2b7e-48b2-9bf4-d871067325a0@suse.com>
Date: Tue, 9 Jul 2024 12:56:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
 <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
 <89d7b5a6-e971-4cd0-85df-0dd599d0ba1b@suse.com>
 <7d207d6c-d025-4fbb-8649-9c42224097f5@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <7d207d6c-d025-4fbb-8649-9c42224097f5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.07.24 09:01, Jan Beulich wrote:
> On 09.07.2024 08:36, Jürgen Groß wrote:
>> On 09.07.24 08:24, Jan Beulich wrote:
>>> On 08.07.2024 23:30, Jason Andryuk wrote:
>>>>    From the backtrace, it looks like the immediate case is just trying to
>>>> read a 4-byte version:
>>>>
>>>>    >>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>>>>    >>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>>>>    >>>> [   44.575550]  ucsi_register+0x24/0xa0
>>>>    >>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
>>>>
>>>> int ucsi_register(struct ucsi *ucsi)
>>>> {
>>>>            int ret;
>>>>
>>>>            ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
>>>>                                  sizeof(ucsi->version));
>>>>
>>>> ->read being ucsi_acpi_read()
>>>>
>>>> However, the driver also appears write to adjacent addresses.
>>>
>>> There are also corresponding write functions in the driver, yes, but
>>> ucsi_acpi_async_write() (used directly or indirectly) similarly calls
>>> ucsi_acpi_dsm(), which wires through to acpi_evaluate_dsm(). That's
>>> ACPI object evaluation, which isn't obvious without seeing the
>>> involved AML whether it might write said memory region.
>>
>> I guess an ACPI dump would help here?
> 
> Perhaps, yes.

It is available in the bug report:

https://bugzilla.opensuse.org/show_bug.cgi?id=1227301


Juergen

