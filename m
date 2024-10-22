Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE69AB0B1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 16:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824225.1238322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Fkn-0003PA-W1; Tue, 22 Oct 2024 14:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824225.1238322; Tue, 22 Oct 2024 14:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Fkn-0003MB-Sc; Tue, 22 Oct 2024 14:20:57 +0000
Received: by outflank-mailman (input) for mailman id 824225;
 Tue, 22 Oct 2024 14:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjUh=RS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3Fkl-0003Ly-Th
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 14:20:55 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8f86901-9080-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 16:20:54 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2fb561f273eso56793961fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 07:20:54 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c726besm3203491a12.93.2024.10.22.07.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 07:20:53 -0700 (PDT)
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
X-Inumbo-ID: d8f86901-9080-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729606854; x=1730211654; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3f3pXqNyI+bwOtKt5dUl7KO7hRUU1R9j1/G49d53U6A=;
        b=vvKdhj//oqzVgvxLSe2sfriMMQ6G3WIXBvgQVpijpHyeZGNN18TN1iDiER1fwpQR+Q
         2zNbgEPy0HWg3/83hQ5+aShsFd4q5fcGD40RiIVGxLDTgXFhfnPoTWzrGu61P4f+qPFc
         1b6kx5A4Y3Y3lSzPmXnQ80Y/nEI3t/jvyK0Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729606854; x=1730211654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3f3pXqNyI+bwOtKt5dUl7KO7hRUU1R9j1/G49d53U6A=;
        b=dl7K2Fa/l0Vj7vhIf57T4eeEQ7RCZqMo+UNSlfRN2nojByYGL7NCjHrbbgT1pOUGqX
         JOMMWsNKewj/0/hA4BNGpmxO9ml44T72Nain7EYPBybLWF3QdBZVrF31hj6hCqbqhpax
         lVJAhpP1d51RqwF6uTCzW3OsTef++0cwHx98QdeUEAo5V6C5xgnTGBtEzCgUi7cjLsM7
         gxwOAEmzfhCYEi+73reuynwG4glR+M3zNoYAckBErgvAjrrNjFEMNJp5rcx9AVcHOv+A
         xrHAxRZhpkEnNCOemV8COX7YjxLtenDnotH+qzNkY60+P82EDyUr/FxZJUfqbaTSZt7I
         mSRg==
X-Gm-Message-State: AOJu0YyxWv/oHIkgesH6728ufcSF9r0rP3QGOv2+9Z2DGFy3JVaA3f3J
	S5ylEZPF1+3aU022Uq+5jy0daQEWu2WLfbRxNV/vhRK58xnX8Cu40HOhxag5vRg=
X-Google-Smtp-Source: AGHT+IEvOl91P9RM15RtFys8ueGxh/rArnfJRHUdg0YzGtzn3WMYarRUG4gApY2nf2z8vC4Av45GJQ==
X-Received: by 2002:a2e:1309:0:b0:2f3:b71a:1e91 with SMTP id 38308e7fff4ca-2fc90541af3mr17989571fa.17.1729606853595;
        Tue, 22 Oct 2024 07:20:53 -0700 (PDT)
Message-ID: <0273bc68-855d-4833-8c2f-ad9ff845c92b@citrix.com>
Date: Tue, 22 Oct 2024 15:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix PVH boot during boot_info transition period
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20241022124114.84498-1-andrew.cooper3@citrix.com>
 <Zxey5Gap8p8SiH9w@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zxey5Gap8p8SiH9w@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/10/2024 3:12 pm, Roger Pau Monné wrote:
> On Tue, Oct 22, 2024 at 01:41:14PM +0100, Andrew Cooper wrote:
>> multiboot_fill_boot_info() taking the physical address of the multiboot_info
>> structure leads to a subtle use-after-free on the PVH path, with rather less
>> subtle fallout.
>>
>> The pointers used by __start_xen(), mbi and mod, are either:
>>
>>  - MB:  Directmap pointers into the trampoline, or
>>  - PVH: Xen pointers into .initdata, or
>>  - EFI: Directmap pointers into Xen.
>>
>> Critically, these either remain valid across move_xen() (MB, PVH), or rely on
>> move_xen() being inhibited (EFI).
>>
>> The conversion to multiboot_fill_boot_info(), taking only mbi_p, makes the PVH
>> path use directmap pointers into Xen, as well as move_xen() which invalidates
>> said pointers.
>>
>> Switch multiboot_fill_boot_info() to consume the same virtual addresses that
>> __start_xen() currently uses.  This keeps all the pointers valid for the
>> duration of __start_xen(), for all boot protocols.
>>
>> It can be safely untangled once multiboot_fill_boot_info() takes a full copy
>> the multiboot info data, and __start_xen() has been moved over to using the
>> new boot_info consistently.
>>
>> Right now, bi->{loader,cmdline,mods} are problematic.  Nothing uses
>> bi->mods[], and nothing uses bi->cmdline after move_xen().
>>
>> bi->loader is used after move_xen(), although only for cmdline_cook() of
>> dom0's cmdline, where it happens to be benign because PVH boot skips the
>> inspection of the bootloader name.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
> One nit below about dropping a const keyword.
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>>
>> This is more proof that Xen only boots by accident.  It certainly isn't by any
>> kind of design.
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1506947472
>> including the pending work to add a PVShim test
>>
>> This is the least-invasive fix given the rest of the Hyperlaunch series.
>>
>> A different option would to introduce EFI and PVH forms of
>> multiboot_fill_boot_info(), but that would involve juggling even more moving
>> parts during the transition period.
>> ---
>>  xen/arch/x86/setup.c | 25 ++++++++++++++++++++-----
>>  1 file changed, 20 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index db670258d650..e43b56d4e80f 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -283,11 +283,10 @@ struct boot_info __initdata xen_boot_info = {
>>      .cmdline = "",
>>  };
>>  
>> -static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
>> +static struct boot_info *__init multiboot_fill_boot_info(
>> +    multiboot_info_t *mbi, module_t *mods)
> Shouldn't mbi keep the const keyword?  Given there are no changes on
> how it's used in multiboot_fill_boot_info().

Fine.

FWIW,
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1507153249
is previously-crashing consider_modules() change, with this fix in
place, shown now to be functioning.

~Andrew

