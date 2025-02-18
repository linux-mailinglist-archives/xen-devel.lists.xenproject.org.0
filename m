Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54355A39E57
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:11:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891441.1300480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOJK-0007FK-Sf; Tue, 18 Feb 2025 14:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891441.1300480; Tue, 18 Feb 2025 14:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOJK-0007DK-Py; Tue, 18 Feb 2025 14:10:54 +0000
Received: by outflank-mailman (input) for mailman id 891441;
 Tue, 18 Feb 2025 14:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6eQ=VJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkOJJ-0007Cl-4v
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:10:53 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26b1faad-ee02-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 15:10:48 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso61062165e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 06:10:48 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43993d297e9sm21046705e9.33.2025.02.18.06.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 06:10:47 -0800 (PST)
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
X-Inumbo-ID: 26b1faad-ee02-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739887847; x=1740492647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gnHaycBuKeySQOmT0PTWO7o/+j7+Xf7EAs3n92pGywQ=;
        b=KABGs9+Lox/keU2vFm1ba4tqRkgjog5o+EczYPLgMGtWxWYftlFnoY2fpoZZLKzL6Q
         MdjlodME9d0dW9m2KQUz+DQCzTk1d+/Y5YJ3cuURmqmtx983owO6lsXfzeRFMNSLj9aZ
         2vDZVAC45Ou1Gj48O0XZIU5+8cVwGfB9FU4VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739887847; x=1740492647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnHaycBuKeySQOmT0PTWO7o/+j7+Xf7EAs3n92pGywQ=;
        b=JgX3SO8a4Lws2dNRCZRDBMwvKqiHkljPBqxLIrC1X7WEP9oaQzrj198lJ3U7Kp43v9
         4DNSpTHygpV4K1P5+7G1SOhBD1bweFTZ2MxHc0haJZ3m8BSXCvrSwzQ91a0lzKrSv6mV
         JcxUlCY1eY6uZOOB2Kn8/ZN9yqrtuAzJ0aGzt+z82zRqtlVnAwl//RVivfHQHogaiKjx
         /o9KBTao9/uyYErC0qAtpol9+ELedkNN0gBZAZeEt2edIEn6FkeNx/0CnHoNOwiin1yx
         uUVG0C1L6+cvEDxvesunLHop5xc+dN9y8rstZxSg9ECjN5wx05m0Ut2YMBFWpmXocAXG
         /HXg==
X-Forwarded-Encrypted: i=1; AJvYcCUNhvg2j+Jk9W9IahHVqraADcFnropeE5vYMXOAB5tzhmre1QEy65HxLj8hie5RlRV24mVa4qnQ+Uo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFxiTe9jmAIn4PKUHA3zCCOqdEu5qmnDwGjtFoowDS3DrdeKFH
	tnkAiiVtPtOYQEiQ3IOmD5WCRLO4bgZGAKKXg7ZOIf/XWEoLO9SSnu7p7aWm6qM=
X-Gm-Gg: ASbGncs95Rp12P5DneYzCC0o7i59ZdOtX7Ps4Y/kUrik5ArnyMaxjE9Pq5KLbtyKYVK
	rb8eOqzGQ19BkpK9B+C1cdthgpc7UJH+YDoHna/PSU4LBSx8IeQyF1BoODYUhkc5WUin1hbc3F/
	jejz87DZLxn+JrdjfXqME3F3Csi/uwYsBnIAW9yjWFBygpdTC5xt1zanVRf8HCbRdw6gq7JLv87
	zZF674uTpdfebmdTFdeIqYQXXUxj95iM3tl2LYPaQk9fH1pvcaQl0xQtjU/Z9RkMOVUQgfE2di6
	RWhvo4FbKmAscr/vVXEvk/ld1IGgNZDF04KRCiHjlRjdaClQcqX2rJA=
X-Google-Smtp-Source: AGHT+IFAYPvX+3iueQGDgOxkfZX7j2AMQ4u7ZI4Ge/r85uKBHCQVQNtFmAxjfXXUQ4j9XaFQfPec3w==
X-Received: by 2002:a05:600c:1c86:b0:439:98ca:e39b with SMTP id 5b1f17b1804b1-43998cae5a5mr8300805e9.29.1739887847372;
        Tue, 18 Feb 2025 06:10:47 -0800 (PST)
Message-ID: <9b22d0ff-5902-4ec7-ae54-e974482ebd87@citrix.com>
Date: Tue, 18 Feb 2025 14:10:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20250208205725.568631-1-richard.henderson@linaro.org>
 <20250208205725.568631-4-richard.henderson@linaro.org>
 <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/02/2025 11:20 am, Philippe Mathieu-Daudé wrote:
> Hi,
>
> Adding Xen community.
>
> On 8/2/25 21:57, Richard Henderson wrote:
>> Require a 64-bit host binary to spawn a 64-bit guest.
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   meson.build | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 1af8aeb194..911955cfa8 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -304,9 +304,14 @@ else
>>   endif
>>   accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>>   -if cpu in ['x86', 'x86_64']
>> +if cpu == 'x86'
>> +  xen_targets = ['i386-softmmu']
>> +elif cpu == 'x86_64'
>>     xen_targets = ['i386-softmmu', 'x86_64-softmmu']
>> -elif cpu in ['arm', 'aarch64']
>> +elif cpu == 'arm'
>> +  # i386 emulator provides xenpv machine type for multiple
>> architectures
>> +  xen_targets = ['i386-softmmu']
>
> Is actually someone *testing* this config? I'm having hard time building
> it, so am very suspicious about how it runs, and start to wonder if I'm
> not just wasting my time (as could be our CI).

It was intentional.  I believe it was Stefano (CC'd) who introduced it.

Xen uses qemu-system-i386 everywhere because qemu-system-x86_64 doesn't
make compatible VMs.  I'm not sure why; I suspect it's bugs in the Xen
machine types, but I don't know QEMU well enough to be sure.

Another thing that (at least, was) tied to qemu-system-i386 was using
Qemu as a XenBlk <-> QCOW adapter, at which point it wasn't even really
a system emulator, just a paravirtual disk implementation.

This is, AIUI, what ARM wants with the xenpv machine.  If there's a
better way to do this, please do say.


Looking through Xen's CI, I can't see any of the ARM builds building
QEMU at all.  I think it's quite possible it's not tested any more.

~Andrew

