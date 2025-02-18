Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2735A39D3E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 14:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891397.1300441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkNVr-00067z-KR; Tue, 18 Feb 2025 13:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891397.1300441; Tue, 18 Feb 2025 13:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkNVr-00065t-H3; Tue, 18 Feb 2025 13:19:47 +0000
Received: by outflank-mailman (input) for mailman id 891397;
 Tue, 18 Feb 2025 13:19:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkNVq-00065m-1F
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 13:19:46 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffd5e0cb-edfa-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 14:19:36 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4396424d173so54969925e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 05:19:36 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa7e8sm183896475e9.26.2025.02.18.05.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 05:19:35 -0800 (PST)
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
X-Inumbo-ID: ffd5e0cb-edfa-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739884776; x=1740489576; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9jOWDgWdgm3WlBmHZkzJFmY7KFSm2K7SI7318/JBa0I=;
        b=MXccux+cW4UdMxPUy7jmWz70NXX2i4FSWgg0C3LBkshKshKCK8UWs874jum4FtRQCJ
         u/NC2O0ktxbptknFdwnI3ezWsjW3Xk3yV/gUv7UPQBllbmcKhBcu8EPRy0uTzoBSu5J2
         8i/2FQCHSxR98cczFQP+MQwi7Ug354pWagsuO6FsnZitJFpA+CW40q4aabyO4OUFt/ab
         9EUKXF5DTiQ0QDqSExZr2hbIDDUzTGVcOo8YH15W8li7OoC8jTV4CY3HBz5ohlj8xzCM
         RV/KnjsQyVMfIYfp7TR4D5xJTx3fz8ZSLhNMM81oThj08jypA++f+a6d+7gOBDCmp7AL
         dBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884776; x=1740489576;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jOWDgWdgm3WlBmHZkzJFmY7KFSm2K7SI7318/JBa0I=;
        b=p6rWXEQKgv4sw3tmy0yn8hvLsAs2zNd6hsC8QdUvcc+mTJB4RTr7KyL6fchhTIaOH7
         d+wnrxjIcqjmSukKHkpDbthqnhCKOFh//lWsHNE5FigyyR2GLR5IJBCWuM6dIWI5PjtS
         orquP6USntCyRRrQctmI4KuSNDaz40nXgIaD2/RRB6nBF6Y0dVqc3Ze9LK/QL++f1YDe
         g93mpsbLMJHGHKgOMT8H16tGaUOlk2cauf1Ck96k3cLJ8+UHN1zGXtOyAnnwGp6zrE9f
         TiykiwMBJAa7xIm9hEihZCgUERnV5E6sD31ipsr6OnOYFcwNYChXIcieRO8LnS9wDoT3
         88ug==
X-Forwarded-Encrypted: i=1; AJvYcCUGydTVHhF97CsG+BXydT0GKrmhyXW5HxhzW97DUZz90xd86OrPpzL4BvxXYOjrdeKeUzxWJnURRTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1FnvTXv9e1rd15dvDRNRl2RqPFSW9qjdcUQlhlU2Bb1EfsRFy
	EL2vzNR99p1otqv9Csb5VyTvI/4uo+E+v5lN1lBDY+61RUMQuhU6ZeMjVmEl+Dw=
X-Gm-Gg: ASbGnctNzakaUF9P+dmlc4Irf8Zgw6841zsYyM6GwGZJQa935GVblH9sQcWs2xZZT7D
	4Y/aHJ4epmuNT6zdwSemmmtfFKn0wGPDdoO5GO2oqMhfXD5YXieOsTfvvuXF7kx/vvXc0ZZpKq+
	xX7vaFbTh5+oljWJxtE0v/qw8VNSdRM3w2r5K8xRq0qBPWAoTxdAhL+a/4GGRUTQs4zXhpIJanO
	CudTwn6eipKPaduKauurGw0d7zIA9wX63k7/cBfAWm3KP0A/O0sOvC3Jr80CPetdoC2jp7DUHmh
	5X5X22dhS859kl2+dqc+z+PTlGO3VgFXXcSg8/mVc+lLcPdhueu7v4YFf8I=
X-Google-Smtp-Source: AGHT+IFqA+wta4oXzvphBFhAl3JSyZyc9j8Lmp26VteGErYposT+mqTp+MOGtS8nT9S2EAYzkKJk9A==
X-Received: by 2002:a05:600c:3b22:b0:439:8bc3:a6a3 with SMTP id 5b1f17b1804b1-4398bc3ad73mr64046275e9.3.1739884775677;
        Tue, 18 Feb 2025 05:19:35 -0800 (PST)
Message-ID: <dc24cf43-b6a1-42b6-ac93-4128f2c03684@linaro.org>
Date: Tue, 18 Feb 2025 14:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20250208205725.568631-1-richard.henderson@linaro.org>
 <20250208205725.568631-4-richard.henderson@linaro.org>
 <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
Content-Language: en-US
In-Reply-To: <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/2/25 12:20, Philippe Mathieu-Daudé wrote:
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
>> -if cpu in ['x86', 'x86_64']
>> +if cpu == 'x86'
>> +  xen_targets = ['i386-softmmu']
>> +elif cpu == 'x86_64'
>>     xen_targets = ['i386-softmmu', 'x86_64-softmmu']
>> -elif cpu in ['arm', 'aarch64']
>> +elif cpu == 'arm'
>> +  # i386 emulator provides xenpv machine type for multiple architectures
>> +  xen_targets = ['i386-softmmu']
> 
> Is actually someone *testing* this config? I'm having hard time building
> it, so am very suspicious about how it runs, and start to wonder if I'm
> not just wasting my time (as could be our CI).

This config is not tested and not functional. I'll post a patch
removing it.

> 
>> +elif cpu == 'aarch64'
>>     # i386 emulator provides xenpv machine type for multiple 
>> architectures
>>     xen_targets = ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu']
>>   else
> 
> Regards,
> 
> Phil.
> 


