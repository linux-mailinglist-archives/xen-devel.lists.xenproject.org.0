Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4EBC921A9
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 14:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174802.1499752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyOG-0007rY-Q9; Fri, 28 Nov 2025 13:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174802.1499752; Fri, 28 Nov 2025 13:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyOG-0007q8-MR; Fri, 28 Nov 2025 13:20:00 +0000
Received: by outflank-mailman (input) for mailman id 1174802;
 Fri, 28 Nov 2025 13:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=336B=6E=bounce.vates.tech=bounce-md_30504962.6929a17b.v1-96b599006fe04ae1aee1ea847ea67836@srs-se1.protection.inumbo.net>)
 id 1vOyOF-0007k4-22
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 13:19:59 +0000
Received: from mail132-18.atl131.mandrillapp.com
 (mail132-18.atl131.mandrillapp.com [198.2.132.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeb74d8c-cc5c-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 14:19:56 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-18.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHv6M2JgCzCf9KJ1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 13:19:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 96b599006fe04ae1aee1ea847ea67836; Fri, 28 Nov 2025 13:19:55 +0000
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
X-Inumbo-ID: eeb74d8c-cc5c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764335995; x=1764605995;
	bh=X2fqWoTSCWqI9l6VQYgprhpU+9NtYg731KXaaYBfjfo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=b/jXY7ECmEXUCa7DGItI8ErybtRgDx5cbrlquRdTC0oTH8juC+n3JsNdbX5gbezPI
	 AjgX0QQbwSpb2zRRR4ct+CxYgyAFHgRmnxrF1FEXjTIjGduhOJfY7DMuGK/tn/NnJp
	 JLMmWWeozweTbiPwTn3uzlki8eFi+nNVlGbCrAb7EzC1QYfOkFmjsKDytwnDBTyUfV
	 BcsVqCPEjkh/Yq+qltjRvGTPc9kVP0eSvrj5jH4x40zPg125va37bNIT+Oi323ZyC0
	 DdPtS9NxPb44UKqHDnNeSfuosUBvroM0K6kOVSmIVtSXzC742GWD92TrZ2vRI3CWv0
	 jErowW9J3qABw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764335995; x=1764596495; i=julian.vetter@vates.tech;
	bh=X2fqWoTSCWqI9l6VQYgprhpU+9NtYg731KXaaYBfjfo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eB3LsxGTS109iOvvCwS9qV3ASAcPJqmspbnFe9ymQo1UwPPFcGjqDh8gdzeFDY0eF
	 UzVXalud63hS2duGy1+upqjBX/Wu9gDEZZIdcuA98sW08I7/x8Bpc8Btv3nTluL+1+
	 LXXCFlKxK4pqgZyjKH1EnV2zIc7UrmW7ExLQVgwQ2bO08EUZJPle927MqCeP+dr/Nb
	 u1xGkT31Vv4tdD8vq1YF78nsc5nG9ffqnOeMNiK1yh4OcIIceLCdnQnBhx+aWALTRv
	 oo7meJtjLI29gySsRYrbtYecpsk7mPr0sA92d2O+jhUlXVbUQacGxEauTKHl+R676o
	 LCpAEhhd8XqPg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/efi:=20Remove=20NX=20check=20from=20efi-boot.h?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764335993892
Message-Id: <83850159-6b76-4127-a689-e83a84c71e4f@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Teddy Astie" <teddy.astie@vates.tech>
References: <20251127143136.1598354-1-julian.vetter@vates.tech> <3653404b-0428-4dae-912f-18c4f8e74853@citrix.com>
In-Reply-To: <3653404b-0428-4dae-912f-18c4f8e74853@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.96b599006fe04ae1aee1ea847ea67836?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251128:md
Date: Fri, 28 Nov 2025 13:19:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/27/25 16:20, Andrew Cooper wrote:
> On 27/11/2025 2:31 pm, Julian Vetter wrote:
>> Currently Intel CPUs in EFI mode with the "Execute Disable Bit" disabled
>> and the 'CONFIG_REQUIRE_NX=3Dy' fail to boot, because this check is
>> performed before trampoline_setup is called, which determines if NX is
>> supported or if it's hidden by 'MSR_IA32_MISC_ENABLE[34] =3D 1' (if so,
>> re-enables NX).
>>
>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> 
> Lovely...=C2=A0 This isn't the only bug; there's another one from the Vat=
es
> forums about AMD CPUs which I haven't gotten around to fixing yet.
> 

Thank you. I will have a look. I haven't seen this thread.

> Do you have any more information about which system looks like this?
> 
I'm not sure if I understand your question correctly, but I was just 
booting an Intel based machine newer than ~2012. I have tested this on 4 
different machines, on which 3 hit this code path. One was a HPE 
ProLiant m510 Server with a XEON CPU, second was a Mini PC with Celeron 
CPU, and third was an old Intel NUC DCCP847DYE also with a Celeron CPU. 
The only system where I couldn't reproduce the issue was an old 
workstation with a Gigabyte mainboard. It has the flag in the Bios to 
set MSR_IA32_MISC_ENABLE, but I'm not sure if it was actually booting 
via UEFI. I will verify this on monday. I booted all the 3 other systems 
via UEFI -> Grub -> multiboot2. My grub entry looks like this:

multiboot2 /boot/xen.gz dom0_mem=3D2656M,max:2656M watchdog ucode=3Dscan 
dom0_max_vcpus=3D1-8 crashkernel=3D256M,below=3D4G console=3Dvga vga=3Dmode=
-0x0311
module2 boot/vmlinuz console=3Dhvc0 console=3Dtty0 init=3D/bin/sh
module2 boot/initrd-dom0

> trampoline_setup isn't executed on all EFI boots.=C2=A0 I had a different=
 fix
> in mind, but it's a little more complicated.

Aha. yes, I didn't thought about other code paths. But I'm wondering if 
we couldn't do the whole dance with XD and NX directly in the 
efi-boot.h. Then maybe we could even remove the part in trampoline_setup 
or are there other systems that hit only the trampoline_setup but not 
the efi_multiboot2?

@@ -747,16 +748,27 @@ static void __init efi_arch_cpu(void)

      if ( (eax >> 16) =3D=3D 0x8000 && eax > 0x80000000U )
      {
-        caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
-
          /*
           * This check purposefully doesn't use cpu_has_nx because
           * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
           * with CONFIG_REQUIRE_NX
           */
-        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
-             !boot_cpu_has(X86_FEATURE_NX) )
-            blexit(L"This build of Xen requires NX support");
+        if (IS_ENABLED(CONFIG_REQUIRE_NX)) {
+
+            msr_ia32 =3D rdmsr(MSR_IA32_MISC_ENABLE);
+            /* NX is hidden */
+            if (msr_ia32 & MSR_IA32_MISC_ENABLE_XD_DISABLE) {
+                msr_ia32 &=3D ~MSR_IA32_MISC_ENABLE_XD_DISABLE;
+
+                wrmsr(MSR_IA32_MISC_ENABLE_XD_DISABLE, msr_ia32);
+
+                /* Re-check for NX */
+                caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
+            }
+
+            if (!boot_cpu_has(X86_FEATURE_NX))
+                blexit(L"This build of Xen requires NX support");
+        }

          if ( cpu_has_nx )
              trampoline_efer |=3D EFER_NXE;


> 
> If I do the key prep patch, would you mind trying to tackle the AMD side
> too?
Yes of course. I will have a look into it. Thank you.

> 
> ~Andrew



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



