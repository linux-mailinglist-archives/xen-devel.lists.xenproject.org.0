Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1140FA3A190
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 16:42:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891930.1300938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPjL-0005GS-Fz; Tue, 18 Feb 2025 15:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891930.1300938; Tue, 18 Feb 2025 15:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPjL-0005EG-CK; Tue, 18 Feb 2025 15:41:51 +0000
Received: by outflank-mailman (input) for mailman id 891930;
 Tue, 18 Feb 2025 15:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkPjK-0005EA-DO
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 15:41:50 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddd53749-ee0e-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 16:41:49 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so39205915e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 07:41:49 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4398cb4de78sm41912265e9.24.2025.02.18.07.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 07:41:48 -0800 (PST)
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
X-Inumbo-ID: ddd53749-ee0e-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739893308; x=1740498108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rftezDm0PXXAzXVMv5QO3Kp9pkZEb9I5IaKVIiUl1+w=;
        b=XYntR0+FQM7QYD5O2SmdezYq0CogDigT575+8xwBcDysqxAMyd94ajEKxaMf1sATqu
         aLUHMLmqlbe/Mrpw2kgCqIp0USWurL9iwlrcWYstNeFAmut9aGTgFnsRvXTUlvB3z8VT
         Le3IaYwXD6ANAZhZW57eKAeWzVyUv6VF8mkgwxpuJR7iUENkVrD/3+QY/dOUpYCubwh9
         yXQMdwuBk86nCIKwXSAY2wATPidENzsAOJbklEhvkyy7y0EBQBxjeDpdTqcdz71tDx2K
         jg93dn9ckRkkDpX5cVeJ4RxP+tjgctXBZ8M2rQ4tQwZkHfYzVUDs5BYZxYA8PXhxNcm8
         SXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739893308; x=1740498108;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rftezDm0PXXAzXVMv5QO3Kp9pkZEb9I5IaKVIiUl1+w=;
        b=J66AEX5zBmWRcbbOd7pw2UmRr+tvExqT4avMlOWG2I52NJLE9z3eqgoEdkmR36bbZl
         oSjEMG5Je9IUncop+JJKGaOIZCHYOlKC+aykFiKcmZH01e9NUG06DlX019vDA2fRqmHQ
         5GgVYhiqpojZH9aRBHHI6sCq/lPDsf2qhy6gKu1l6Rc1h80HkJYFpZaj7ZsxQfhnSOX4
         3ass2bF+rI358cVqTQ5Xu8t/X+J4e0HqjEbP3ygA5tWL3u/HcU4NKXFt3crRK2wcl2oK
         ZRPN/6PhKHcloVgH9k344q5eDSOK+hlk2bGAXa1MFjdQvFpEnGrWB+kp3zmDDAb6sQPm
         kP8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVobnlYJjOa9L8pPSsBHR4myd+USXEPGYmFXbsOwF1fjT+0DbxKmLzs66StF4+7oSby5n//BRWR8SI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSFBA05qIHhupLkmLHJrDUCsgxDM8M6QkC+Y1nU6+TWv7v3r0B
	g1dshZ++WtTBRLkFXUp2aEsVYBDXLLAPDDMrdtYFvnDPTxe2EiJ1putyQbwP7n8=
X-Gm-Gg: ASbGncvAXeeP9rKfMthPjBvEBwnjSCe5Zj2TPi27PxbJIFBGRAX0e+XDaF0/BKfRg4z
	0CduaY6VVVfyt0IB1Umqn0XxwWA8FcWxyffpB0oLzeu+Wyi07wAejqNKWn3JyBJO6maoY1ypzdB
	zEdh/OAVaDfxWFBw5YdxTEiKoKuHegcVbyEeEUYO8+FJSaF0kuJzZCyV8g0S4nhgGbABLRoyAOp
	3YqybWe9/4Kp3onxl1ThIavK6KY8F93BbYQn+GotuxvoSB63+VVZqSEQjLPIjLEbrPuTDnIn3wG
	dLUUZJPsUsJL3WKxtVKnyJ9LRpif/IiAh3ydhTEcrnl78BXv7dXejT8iVkA=
X-Google-Smtp-Source: AGHT+IF/8ntl9BcDGAADsSp5RSNssX1/saVLS8T4n7eb/VsqHM+B23KD2LwLr97A98aYw1YdA9oepQ==
X-Received: by 2002:a05:600c:1ca8:b0:439:8a44:1e65 with SMTP id 5b1f17b1804b1-4398a441f98mr62729005e9.7.1739893308542;
        Tue, 18 Feb 2025 07:41:48 -0800 (PST)
Message-ID: <5580a9e6-c1bc-44c8-9edc-d98ba4985123@linaro.org>
Date: Tue, 18 Feb 2025 16:41:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
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
 <3fb630f4-ebd2-4f14-a1fe-4e84786a1400@linaro.org>
Content-Language: en-US
In-Reply-To: <3fb630f4-ebd2-4f14-a1fe-4e84786a1400@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/2/25 16:25, Philippe Mathieu-Daudé wrote:
> +Vikram
> 
> On 18/2/25 15:10, Andrew Cooper wrote:
>> On 18/02/2025 11:20 am, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> Adding Xen community.
>>>
>>> On 8/2/25 21:57, Richard Henderson wrote:
>>>> Require a 64-bit host binary to spawn a 64-bit guest.
>>>>
>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>    meson.build | 9 +++++++--
>>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meson.build b/meson.build
>>>> index 1af8aeb194..911955cfa8 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -304,9 +304,14 @@ else
>>>>    endif
>>>>    accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>>>>    -if cpu in ['x86', 'x86_64']
>>>> +if cpu == 'x86'
>>>> +  xen_targets = ['i386-softmmu']
>>>> +elif cpu == 'x86_64'
>>>>      xen_targets = ['i386-softmmu', 'x86_64-softmmu']
>>>> -elif cpu in ['arm', 'aarch64']
>>>> +elif cpu == 'arm'
>>>> +  # i386 emulator provides xenpv machine type for multiple
>>>> architectures
>>>> +  xen_targets = ['i386-softmmu']
>>>
>>> Is actually someone *testing* this config? I'm having hard time building
>>> it, so am very suspicious about how it runs, and start to wonder if I'm
>>> not just wasting my time (as could be our CI).
>>
>> It was intentional.  I believe it was Stefano (CC'd) who introduced it.
> 
> In the introduction commit, "ARM targets" is used, so apparently both
> 32/64bit were picked deliberately:
> 
> ---
> commit aaea616d54317b8a0154adf52303a51da2d8d56f
> Author: Vikram Garhwal <vikram.garhwal@amd.com>
> Date:   Wed Jun 14 17:03:38 2023 -0700
> 
>      meson.build: enable xenpv machine build for ARM
> 
>      Add CONFIG_XEN for aarch64 device to support build for ARM targets.
> 
>      Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>      Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>      Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 
> diff --git a/meson.build b/meson.build
> index 481865bfa97..cfa98e9e25f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -136,7 +136,7 @@ endif
>   if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>     # i386 emulator provides xenpv machine type for multiple architectures
>     accelerator_targets += {
> -    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu'],
>     }
>   endif
>   if cpu in ['x86', 'x86_64']
> ---

Hmm wrong commit apparently, but the history isn't clear. See:

-- >8 --
commit 3b6b75506de44c5070639943c30a0ad5850f5d02
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Mon Sep 17 11:59:41 2012 +0200

     configure: factor out list of supported Xen/KVM/HAX targets

     This will be useful when the functions are called, early in the 
configure
     process, to filter out targets that do not support hardware 
acceleration.

     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

diff --git a/configure b/configure
...
+supported_xen_target() {
+    test "$xen" = "yes" || return 1
+    glob "$1" "*-softmmu" || return 1
+    case "${1%-softmmu}:$cpu" in
+        arm:arm | aarch64:aarch64 | \
+        i386:i386 | i386:x86_64 | x86_64:i386 | x86_64:x86_64)
+            return 0
+        ;;
+    esac
+    return 1
+}
+
  # default parameters
  source_path=$(dirname "$0")
  cpu=""
@@ -6178,46 +6222,22 @@ echo "TARGET_ABI_DIR=$TARGET_ABI_DIR" >> 
$config_target_mak
  if [ "$HOST_VARIANT_DIR" != "" ]; then
      echo "HOST_VARIANT_DIR=$HOST_VARIANT_DIR" >> $config_target_mak
  fi
-case "$target_name" in
-  i386|x86_64)
-    if test "$xen" = "yes" -a "$target_softmmu" = "yes" ; then
-      echo "CONFIG_XEN=y" >> $config_target_mak
-      if test "$xen_pci_passthrough" = yes; then
+
+if supported_xen_target $target; then
+    echo "CONFIG_XEN=y" >> $config_target_mak
+    if test "$xen_pci_passthrough" = yes; then
          echo "CONFIG_XEN_PCI_PASSTHROUGH=y" >> "$config_target_mak"
-      fi
      fi
-    ;;
-  *)
---

Paolo, Alex, was this intentional?

>> Xen uses qemu-system-i386 everywhere because qemu-system-x86_64 doesn't
>> make compatible VMs.  I'm not sure why; I suspect it's bugs in the Xen
>> machine types, but I don't know QEMU well enough to be sure.
>>
>> Another thing that (at least, was) tied to qemu-system-i386 was using
>> Qemu as a XenBlk <-> QCOW adapter, at which point it wasn't even really
>> a system emulator, just a paravirtual disk implementation.
>>
>> This is, AIUI, what ARM wants with the xenpv machine.  If there's a
>> better way to do this, please do say.
> 
> No, I concur.
> 
>> Looking through Xen's CI, I can't see any of the ARM builds building
>> QEMU at all.  I think it's quite possible it's not tested any more.
> 
> We only cross-build, see our cross-arm64-xen-only job:
> https://gitlab.com/qemu-project/qemu/-/jobs/9165958873
> 
> Note, if it is not clear, the problem I have is to test Xen on
> 32-bit ARM hosts; I don't have any problem with 64-bit ones.
> 
> Regards,
> 
> Phil.


