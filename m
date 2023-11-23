Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398067F5C73
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 11:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639516.997003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r673o-0002GL-DJ; Thu, 23 Nov 2023 10:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639516.997003; Thu, 23 Nov 2023 10:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r673o-0002Db-9U; Thu, 23 Nov 2023 10:35:52 +0000
Received: by outflank-mailman (input) for mailman id 639516;
 Thu, 23 Nov 2023 10:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVVO=HE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r673n-0002DT-AC
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 10:35:51 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11f7b628-89ec-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 11:35:50 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3316c6e299eso471752f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 02:35:50 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j14-20020adff54e000000b0032db8cccd3asm1294939wrp.114.2023.11.23.02.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 02:35:49 -0800 (PST)
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
X-Inumbo-ID: 11f7b628-89ec-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700735750; x=1701340550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iA44kAn7NZCRNRT6spxN9UeiJp3AHVq0xMA+G5wHLRQ=;
        b=uxc+z0BTuaraR7pncLB1OAYey6KLOLid2Lf093Ip139L/2KFqhD423ZZzjIVXCfG30
         qlwWRXppZAhe6YfCfN26YHKw1HJa8VamJiPuo2gwCRnJKulaStYbqXu3/J+qWiiHFKsd
         CR3Kwg10YoYIZbRXq3tH0xn9Ub9BDP+AJQosk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700735750; x=1701340550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iA44kAn7NZCRNRT6spxN9UeiJp3AHVq0xMA+G5wHLRQ=;
        b=DmO83yWq2/C6AZIjht1oApB82R+UnuBAKbdryYew5Vgu6z9Nhf1oXbTmrMUWgXWV+f
         VAsz4NHMqX+EVmOBszkr9rg9aaF9mUPPWsupkWy733n7toTxEiQdIQryDilaawMIe5a2
         cL8Ds2hcGLvxHCv+FtZydbkeWtZwWf5XSmJ4vVp977uEDVD/9ZsjQeJtAEw2DQozohwE
         nZ6+ByDEqvHI05rLPoRKrhSJuu0RbsHDw8jFSxdp+pSZqFrrfkmObRwG8z4wurWdmGh8
         Edv6Cs/AY0CGkc/ZgzRc70iAtyru1e/Cmx1msFvixj4KMu33f3h9dP08SNutSn9vHyW8
         YAWQ==
X-Gm-Message-State: AOJu0Yz5x03jTv7DQp2fqwVSfnpNw2vZX9LKFQDTLd4is34oo+A9KzR0
	lqKsvFZf27wdMPuqE9JZ9KoTmg==
X-Google-Smtp-Source: AGHT+IFqiklXwDQMqODDiTQHeobMM80HJBNjffWqL7lz63EYAoK5etaf2twNc8O6taBRnqJ0d1mFmA==
X-Received: by 2002:a5d:4851:0:b0:332:c4e3:9aff with SMTP id n17-20020a5d4851000000b00332c4e39affmr3394945wrs.7.1700735749784;
        Thu, 23 Nov 2023 02:35:49 -0800 (PST)
Message-ID: <e93fe838-199e-493f-af1e-66bd618aa20f@citrix.com>
Date: Thu, 23 Nov 2023 10:35:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, Henry Wang <Henry.Wang@arm.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-5-andrew.cooper3@citrix.com>
 <379DF4D1-8DB9-46AF-9586-861ED78DFF38@arm.com>
 <03c6aa83-6c8f-4d40-9f36-d89725bd614b@citrix.com>
 <3222AE09-B511-490E-8298-8808261DEFAE@arm.com>
 <0eb64ed9-a56c-491e-b9b8-a03e90c4c2f1@citrix.com>
 <364FAA71-A00A-4D47-8210-DFE4EC590F79@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <364FAA71-A00A-4D47-8210-DFE4EC590F79@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/11/2023 9:46 am, Luca Fancellu wrote:
>
>> On 22 Nov 2023, at 18:03, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 22/11/2023 3:49 pm, Luca Fancellu wrote:
>>>> On 21 Nov 2023, at 20:41, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>>
>>>> On 21/11/2023 8:33 pm, Luca Fancellu wrote:
>>>>> + CC henry
>>>>>
>>>>>> On 21 Nov 2023, at 20:15, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>>>>
>>>>>> -Wwrite-strings is unhappy with assigning "xen" to a mutable pointer, but this
>>>>>> logic looks incorrect.  It was inherited from the x86 side, where the logic
>>>>>> was redundant and has now been removed.
>>>>>>
>>>>>> In the ARM case it inserts the image name into "xen,xen-bootargs" and there is
>>>>>> no logic at all to strip this before parsing it as the command line.
>>>>>>
>>>>>> The absence of any logic to strip an image name suggests that it shouldn't
>>>>>> exist there, or having a Xen image named e.g. "hmp-unsafe" in the filesystem
>>>>>> is going to lead to some unexpected behaviour on boot.
>>>>>>
>>>>>> No functional change.
>>>>>>
>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> ---
>>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>>> CC: Wei Liu <wl@xen.org>
>>>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>>>> CC: Julien Grall <julien@xen.org>
>>>>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>>>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>>> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
>>>>>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>
>>>>>> v2:
>>>>>> * New.
>>>>>>
>>>>>> I'm afraid that all of this reasoning is based on reading the source code.  I
>>>>>> don't have any way to try this out in a real ARM UEFI environment.
>>>>> I will test this one tomorrow on an arm board
>>> I confirm that booting though UEFI on an arm board works
>>>
>>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
>> Thanks, and you confirmed that the first cmdline parameter is still usable?
> Yes, I’m using a xen.cfg like this:
>
> [global]
> default=xen
>
> [xen]
> options=noreboot dom0_mem=4096M bootscrub=0 iommu=on loglvl=error guest_loglvl=error
> kernel=Image console=hvc0 earlycon=xenboot rootwait root=PARTUUID=6a60524d-061d-454a-bfd1-38989910eccd
>
> And in Xen boot I can see this:
>
> [...]
> (XEN) Command line:  noreboot dom0_mem=4096M bootscrub=0 iommu=on loglvl=error guest_loglvl=error
> [...]
>
> So I think it’s passing every parameter

Thankyou all for the testing.

~Andrew

