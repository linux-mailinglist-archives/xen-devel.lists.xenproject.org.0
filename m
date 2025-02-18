Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A924A3A123
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 16:26:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891897.1300909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPU2-0003nT-Ly; Tue, 18 Feb 2025 15:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891897.1300909; Tue, 18 Feb 2025 15:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPU2-0003ly-IM; Tue, 18 Feb 2025 15:26:02 +0000
Received: by outflank-mailman (input) for mailman id 891897;
 Tue, 18 Feb 2025 15:26:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkPU0-0003ls-Ql
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 15:26:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6a5832f-ee0c-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 16:25:57 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43937cf2131so38029425e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 07:25:57 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43996aa820dsm16090465e9.5.2025.02.18.07.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 07:25:56 -0800 (PST)
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
X-Inumbo-ID: a6a5832f-ee0c-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739892357; x=1740497157; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kO8ZjQjaFKbnEHTOpCzz+11SR4934oDmM1CC/TSqYe0=;
        b=PTcWFleqs7z3pfZTgOE7OLFN4uHVkykbbtByghc+XMufk9rZSU/ZDnYEC9UK/cRdVv
         XOxv0dRONGXXLyjeefbSoNO2wrmeB9iJA3JbxrDjlrhoqd1lo72d0q8eioBgirVIM4Pa
         ezXpyso7uT40nAJK9kCIFFy7/vn7O+uM8GnaVPTk/oUD2+WYJxcJPCBHezEPGq83U2zm
         U+9im+TmoQ4eXErMlOH5KDjfTxW14x3nVY7PWfCS2m8p0AyC7otKa2Zh/IeELcebCKrI
         0royiqpJzff6ppEODtw9CociiCVm+qVt3YLa18f4nW4+MwdNBpa3hkdSs1nlWbYx1+j5
         yPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739892357; x=1740497157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kO8ZjQjaFKbnEHTOpCzz+11SR4934oDmM1CC/TSqYe0=;
        b=GkycNiJOkBBHWjLBw8TaEJkxVp1SMqc6G4G4ND0be/8jPV7wi1s0qGLpG/+bmDfAin
         UcdWl33ZCyQuocSSFx7z55nY4eRmY82c1JvJ2G8ehSAAaO+mxUfziSN3BwcutCLOtoLS
         cpnIO9T3Zt+mLZLc89cO6RO7rGswuYGiNm0nlBd8XvdnnqQ50Y+xLjKxFq23y5tkBgkx
         jFM2l3M6+GE7fdIsQy/5skDAQGDvq6ZMPgSCVylnqmCmFdhzVI9nFs2i/z9Eb8d9bK5F
         IyDfAWncI7kWOclr400r3FWt2kACYE3kVd3cRL6Qh5w+TKEFrl/iy2g1lQQr04n1an/y
         d6OA==
X-Forwarded-Encrypted: i=1; AJvYcCVM/vKnL5G3/9vf3bSZ9Zv/z33yYI0JNMM8ovFekPv+JauPe54kDNjhfH70U4wVOQC8E/zVV/LLZtc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypDCdPVVJ05A7juDq+RsmXayK/Q4bwyU+7iBn9ZEgLi1H0nim3
	ncx12xw5n8PSmZAXX3i8Ho8m/o+T/SZ+hv3kmUix7VDUMY+Ytrkzm++R5v5mm+c=
X-Gm-Gg: ASbGnctbF9KW392uoldl2pbpDByF8uoL81lT7yNT6eIetOs7o8LwOIQ08L8wsuzhNLi
	OQBQOcdeKNwbtLkONi0ypR8odPTHSvTK22ajyNq64YuN5yjNIID4lVkSnyVQjFffgoPMmZHaVxl
	tjdbZcbPVsyTgebz4TNJOmi3rg+qVBD4wsZs8oDurb5lKfHr2BjMpHmGTwm5dkuVBp/GOH0tXbe
	G2PVChUDD4sYhdR08VUS4/5mQIa+PbaMcxh+/WIT6FeDopgmKGvD9VHoQiOYTFSUmIdHRtrMJy0
	vQUb0fmPjBpFfJtBmDmeFmLpVTqmz05LeCEJSbraUZCDPTxupiDrNN6T0FQ=
X-Google-Smtp-Source: AGHT+IEfQkZCEMZr8K3W+1iS/umucsBFRf5X6CifaRXiFtiDEf5G7/tN5hMhY5suxFVLoEfx6kpx6w==
X-Received: by 2002:a05:600c:1552:b0:439:90f5:3942 with SMTP id 5b1f17b1804b1-43990f53d17mr32639405e9.25.1739892356885;
        Tue, 18 Feb 2025 07:25:56 -0800 (PST)
Message-ID: <3fb630f4-ebd2-4f14-a1fe-4e84786a1400@linaro.org>
Date: Tue, 18 Feb 2025 16:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
To: Andrew Cooper <andrew.cooper3@citrix.com>, qemu-devel@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20250208205725.568631-1-richard.henderson@linaro.org>
 <20250208205725.568631-4-richard.henderson@linaro.org>
 <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
 <9b22d0ff-5902-4ec7-ae54-e974482ebd87@citrix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9b22d0ff-5902-4ec7-ae54-e974482ebd87@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+Vikram

On 18/2/25 15:10, Andrew Cooper wrote:
> On 18/02/2025 11:20 am, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> Adding Xen community.
>>
>> On 8/2/25 21:57, Richard Henderson wrote:
>>> Require a 64-bit host binary to spawn a 64-bit guest.
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>    meson.build | 9 +++++++--
>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 1af8aeb194..911955cfa8 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -304,9 +304,14 @@ else
>>>    endif
>>>    accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>>>    -if cpu in ['x86', 'x86_64']
>>> +if cpu == 'x86'
>>> +  xen_targets = ['i386-softmmu']
>>> +elif cpu == 'x86_64'
>>>      xen_targets = ['i386-softmmu', 'x86_64-softmmu']
>>> -elif cpu in ['arm', 'aarch64']
>>> +elif cpu == 'arm'
>>> +  # i386 emulator provides xenpv machine type for multiple
>>> architectures
>>> +  xen_targets = ['i386-softmmu']
>>
>> Is actually someone *testing* this config? I'm having hard time building
>> it, so am very suspicious about how it runs, and start to wonder if I'm
>> not just wasting my time (as could be our CI).
> 
> It was intentional.  I believe it was Stefano (CC'd) who introduced it.

In the introduction commit, "ARM targets" is used, so apparently both
32/64bit were picked deliberately:

---
commit aaea616d54317b8a0154adf52303a51da2d8d56f
Author: Vikram Garhwal <vikram.garhwal@amd.com>
Date:   Wed Jun 14 17:03:38 2023 -0700

     meson.build: enable xenpv machine build for ARM

     Add CONFIG_XEN for aarch64 device to support build for ARM targets.

     Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
     Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
     Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 481865bfa97..cfa98e9e25f 100644
--- a/meson.build
+++ b/meson.build
@@ -136,7 +136,7 @@ endif
  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
    # i386 emulator provides xenpv machine type for multiple architectures
    accelerator_targets += {
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu'],
    }
  endif
  if cpu in ['x86', 'x86_64']
---

> Xen uses qemu-system-i386 everywhere because qemu-system-x86_64 doesn't
> make compatible VMs.  I'm not sure why; I suspect it's bugs in the Xen
> machine types, but I don't know QEMU well enough to be sure.
> 
> Another thing that (at least, was) tied to qemu-system-i386 was using
> Qemu as a XenBlk <-> QCOW adapter, at which point it wasn't even really
> a system emulator, just a paravirtual disk implementation.
> 
> This is, AIUI, what ARM wants with the xenpv machine.  If there's a
> better way to do this, please do say.

No, I concur.

> Looking through Xen's CI, I can't see any of the ARM builds building
> QEMU at all.  I think it's quite possible it's not tested any more.

We only cross-build, see our cross-arm64-xen-only job:
https://gitlab.com/qemu-project/qemu/-/jobs/9165958873

Note, if it is not clear, the problem I have is to test Xen on
32-bit ARM hosts; I don't have any problem with 64-bit ones.

Regards,

Phil.

