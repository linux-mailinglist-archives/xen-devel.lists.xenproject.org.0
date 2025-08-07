Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF85B1D845
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073029.1435972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk05B-0002jB-5J; Thu, 07 Aug 2025 12:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073029.1435972; Thu, 07 Aug 2025 12:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk05B-0002gz-1u; Thu, 07 Aug 2025 12:50:57 +0000
Received: by outflank-mailman (input) for mailman id 1073029;
 Thu, 07 Aug 2025 12:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbW2=2T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uk059-0002gt-Ly
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:50:55 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27bed60d-738d-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 14:50:54 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55b8b8e00caso1101110e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 05:50:54 -0700 (PDT)
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
X-Inumbo-ID: 27bed60d-738d-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754571054; x=1755175854; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2a02EPa/Dkm1TIb8QJlzmnUQQOhfAv4onLhwTgD+dU=;
        b=NwbJA/Z0pBFHpBWipj0CKVwWtq0mZQbzlFxddHLfHf+4cdUkcAnQO0lkXHciymUm7R
         VG5mQngfw5dzv6TRlZTZCYKa0uV/cz9ossRtm/dz2cb8kQokuXiUhxynOq8HdzwS086m
         ZuCZHz+bpGtsSXbuDbSmBYUQWIVsRPq5d86ODP/2XhJ7JB5Akz9KUk2HwUoucl8Lj8ps
         KXd7yY2/gZFjNtnCrbb4XkRCNMM4HX63jg874byJA2K4dJkQTX6Tya1z6yLMcUup9iJF
         iGsqKibqKn9Z/yb4NLfTBNDC6V+Xm1I3HrJE94gTyfTRyOabmW5sgOl81kS7j/jKsH09
         U6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754571054; x=1755175854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2a02EPa/Dkm1TIb8QJlzmnUQQOhfAv4onLhwTgD+dU=;
        b=oUMSjof+ZedVkIaqabNE5wHRYDhP5eV6bHMh+N1qOHWi8T3rlAqada3yk8lxFp1ztO
         0xxbFCPSmgGyswtxQv2/+gZf/a95cTrNgZHZoEZiEIMUszNLC5ZHrzD4Vxv/C+QqcsRi
         sW0YqXWspZcBNQlESuHzD2stZ782hXnHf8XlgJRSSyXtMMJiRkdVhncPP8BhpUeT3n+P
         6fenLulshTW4GG7wDPonl6/j7t2OyNJxTNphlcuXofyNEVt1vnDODSwG6j+H3a06H6p2
         CKy8/WBP0zsoWnmbbHUTc4QWkYrstp/S5j91OPslaoqzNa7P5LUNrCyZf32j+gNeX5c5
         HbDQ==
X-Gm-Message-State: AOJu0YwIgOGzJ9L82QOgiUngtMNIeere4ZbbswePFmEk4DO2iltrbiDz
	fhfj7g04RGqR5t4Ii6cAGz+lY6fXGYtMXkzxTl0YhflytuegXzrUEA3+WTNv1UMk99lW37/yA42
	fx0Rm6AaxfWqpuoywPGRFx2B+GW9hQbk=
X-Gm-Gg: ASbGnctuwC6q7s4eIFOgvXIlkmtkjIhEGGmICS29bmO15KeSVDJHA80BvrxyVMMHKvd
	xMUufQYGZ6+LjOXjf5wIW+1ZNJjATcS55nbWPuo9IlK6aqkTO9ek0YTrNZJ/pgNvjH3i/nuTNXL
	ZCyul8YnQ+FnyK4+VzLMsJfjyZSbGVjAQzijcLKzz9QTDN7fFvnqrwcibChRPUpvrfNrIe0DnuW
	Ndxbg==
X-Google-Smtp-Source: AGHT+IHoHL9mSbQtj0ZD6KHTZ2n5gTAZNINXEidoJ0xVPAu2g4IHdpvbyV1DGIkc/OXb8a8BiXGzB2jDdcCvgE9v8nc=
X-Received: by 2002:a05:6512:23a9:b0:55b:87b8:839a with SMTP id
 2adb3069b0e04-55caf39cd30mr2340353e87.51.1754571053337; Thu, 07 Aug 2025
 05:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
In-Reply-To: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 7 Aug 2025 15:50:42 +0300
X-Gm-Features: Ac12FXzHVSMx7LFUOAcW_ZaOdUZjGmgCubJyuXDqoWr2DCHmozc9DM_V--LKuBM
Message-ID: <CAGeoDV9S3oqg-AgvQ1PhDCMM2Fd-uTrunD2q-4vSj9G8LwU9AA@mail.gmail.com>
Subject: Re: Xen 4.21 Development Update [June-July]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
	", Ayan Kumar Halder" <ayan.kumar.halder@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>, 
	Juergen Gross <jgross@suse.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	"Jason Andryuk," <jason.andryuk@amd.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>, 
	Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, "Penny Zheng," <Penny.Zheng@amd.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki=2C?= <marmarek@invisiblethingslab.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Grygorii Strashko <gragst.linux@gmail.com>, 
	Alejandro Vallejo <agarciav@amd.com>, "committers@xenproject.org" <committers@xenproject.org>, 
	Community Manager <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksii,

On Tue, Aug 5, 2025 at 9:19=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Hello everyone,
>
> This email only tracks big items for xen.git tree. Please reply for
> items you
> would like to see in 4.21 so that people have an idea what is going on an=
d
> prioritise accordingly.
>
> You're welcome to provide description and use cases of the feature you're
> working on.
>
> =3D Timeline =3D
>
> The current release schedule could be found here:
>    https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes
>
> And as a reminder I would like to remind at the of this week we will have
> Last posting date (Fri Aug 08, 2025).
>
> =3D Updates =3D
>
> The following items ( the links for them could be found int the list belo=
w )
> were moved to completed:
>    [since Jun2 - Aug5]:
>     Added some tags: [4.21], [next-rel(s)] to the list "Full list of item=
s"
>     below.
>     * x86:
>      - kexec: add kexec support to Mini-OS.
>      - x86: memcpy() / memset() (non-)ERMS flavors plus fallout
>     * Arm:
>      - SMMU handling for PCIe Passthrough on ARM.
>      - Add support for R-Car Gen4 PCI host controller.
>      - First chunk for Arm R82 and MPU support.
>      - Enable R52 support for the first chunk of MPU support
>      - ARM split hardware and control domains.
>     * RISC-V:
>      - Introduce basic UART support and interrupts for hypervisor mode.
>
>    [since May 6 - Jun2]:
>      * Hypervisor:
>        - tools: remove qemu-traditional
>      * Arm:
>        - PCI devices passthrough on Arm, part 3
>      * x86:
>        - xen: cache control improvements
>    [since 4.20 relese - May 6]:
>      * Hypervisor:
>        - Move parts of Arm's Dom0less to common code
>        - remove libxenctrl usage from xenstored
>      * Arm:
>        - Enable early bootup of Armv8-R AArch32 systems
>      * x86:
>        - x86/HVM: emulation (MMIO) improvements
>      * RISC-V:
>        - RISC-V some preinit calls.
>        - Fixes for UBSAN & GCOV support for RISC-V.
>
> Some new items added:
>   [since May]
>      * x86:
>       - Allow x86 to unflatten DTs
>       - hyperlaunch: move remaining pvh dom0 construction
>       - x86/hyperlaunch: introduce concept of core domains
>       - Confidential computing and AMD SEV support
>      * Arm:
>       - SMMU handling for PCIe Passthrough on ARM
>       - xen/arm: scmi: introduce SCI SCMI SMC multi-agent support
>       - Add initial Xen Suspend-to-RAM support on ARM64
>      * RISC-V:
>       - introduce p2m functionality
>   [since 4.20 release]
>      * Hypervisor:
>        - tools: remove qemu-traditional
>        - Physical address hypercall ABI ("HVMv2")
>        - xen: Untangle mm.h
>        - xen: introduce CONFIG_SYSCTL
>        - Add support for exact-node memory claims
>        - Several CI cleanups and improvements, plus yet another new runne=
r
>      * x86:
>        - x86/EFI: prevent write-execute sections
>        - x86: Trenchboot Secure Launch DRTM (Xen)
>        - Hyperlaunch device tree for dom0 (v6)
>        - amd-cppc CPU Performance Scaling Driver (v4)
>        - Hyperlaunch domain builder
>        - kexec: add kexec support to Mini-OS
>        - xen: cache control improvements (should be moved to "Hypervisor"=
?)
>        - x86: generate xen.efi image with no write-execute sections
>        - x86/asm: cleanups after toolchain baseline upgrade
>      * Arm:
>        - Add support for R-Car Gen4 PCI host controller (v4)
>        - FF-A VM to VM support (v5)
>        - First chunk for Arm R82 and MPU support (v4)
>        - ARM split hardware and control domains (v5)
>        - MPU mm subsistem skeleton
>      * RISC-V:
>        - introduce basic UART support and interrupts for hypervisor mode
>
> * Full list of items : *
>
> =3D Projects =3D
>
> =3D=3D Hypervisor =3D=3D
>
> * [4.21] xen/console: cleanup console input switch logic (v5)
>    - Denis Mukhin
>    -
> https://lore.kernel.org/xen-devel/20250530231841.73386-1-dmukhin@ford.com=
/
>
> * [4.21] xen: introduce CONFIG_SYSCTL (v4 -> v8)
>    -  Penny Zheng
>    -
> https://lore.kernel.org/xen-devel/20250711043158.2566880-1-Penny.Zheng@am=
d.com/
>
> * [4.21] Several CI cleanups and improvements, plus yet another new runne=
r
>    - Marek Marczykowski-G=C3=B3recki
>    -
> https://lore.kernel.org/xen-devel/cover.7da1777882774486a13e6f39ff4a2096f=
6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/
>    -
> https://patchew.org/Xen/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.17=
44028549.git-series.marmarek@invisiblethingslab.com/
>
> * [4.21] automation: Refresh the remaining Debian containers (v2)
>    -  Javi Merino
>    -
> https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@cloud.=
com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e
>
> * [4.21] MSI-X support with qemu in stubdomain, and other related
> changes (v8)
>    -  Marek Marczykowski-G=C3=B3recki
>    -
> https://lore.kernel.org/xen-devel/cover.33fb4385b7dd6c53bda4acf0a9e91748b=
3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com/
>    -  Only automation patch left to be reviewed/merged.
>
> * [next-rel(s)] Physical address hypercall ABI ("HVMv2")
>    - Teddy Astie
>    -
> https://lore.kernel.org/xen-devel/cover.1744981654.git.teddy.astie@vates.=
tech/
>
> * [next-rel(s)] xen: Untangle mm.h
>    -  Andrew Cooper
>    -
> https://lore.kernel.org/xen-devel/20250312174513.4075066-1-andrew.cooper3=
@citrix.com/
>    -
> https://patchew.org/Xen/20250312174513.4075066-1-andrew.cooper3@citrix.co=
m/
>
> * [next-rel(s)] Add support for exact-node memory claims
>    -  Alejandro Vallejo
>    -
> https://lore.kernel.org/xen-devel/20250314172502.53498-1-alejandro.vallej=
o@cloud.com/
>    -
> https://patchew.org/Xen/20250314172502.53498-1-alejandro.vallejo@cloud.co=
m/
>
> * [next-rel(s)] Remove the directmap (v5)
>    -  Alejandro Vallejo
>    -
> https://lore.kernel.org/xen-devel/20250108151822.16030-1-alejandro.vallej=
o@cloud.com/
>    -
> https://patchew.org/Xen/20250108151822.16030-1-alejandro.vallejo@cloud.co=
m/
>
> * [next-rel(s)] GRUB: Supporting Secure Boot of xen.gz (v1)
>    -  Ross Lagerwall
>    -
> https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@citrix.com=
/
>
> * [next-rel(s)] Introduce xenbindgen to autogen hypercall structs (v1)
>    -  Alejandro Vallejo
>    -
> https://patchew.org/Xen/20241115115200.2824-1-alejandro.vallejo@cloud.com=
/
>
> * [next-rel(s)] Introduce NS8250 UART emulator (v2)
>    -  Denis Mukhin
>    -
> https://patchew.org/Xen/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/
>
> * [next-rel(s)] xen: framework for UART emulators
>    - Denis Mukhin
>    -
> https://lore.kernel.org/xen-devel/20250624035443.344099-1-dmukhin@ford.co=
m/
>
> =3D=3D=3D x86 =3D=3D=3D
> * [4.21] x86/asm: cleanups after toolchain baseline upgrade (v1 -> v2)
>    - Denis Mukhin
>    -
> https://lore.kernel.org/xen-devel/20250403182250.3329498-1-dmukhin@ford.c=
om/
>    - https://patchew.org/Xen/20250403182250.3329498-1-dmukhin@ford.com/
>
> * [4.21?] x86/efi: Fix booting when NX is disabled (v1 -> v2)
>    - Andrew Cooper
>    -
> https://patchew.org/Xen/20240722101838.3946983-1-andrew.cooper3@citrix.co=
m/
>    -
> https://lore.kernel.org/xen-devel/20240722101838.3946983-1-andrew.cooper3=
@citrix.com/
>
> * [4.21?] Hyperlaunch device tree for dom0 (v6)
>    - Alejandro Vallejo
>    - https://patchew.org/Xen/20250429123629.20839-1-agarciav@amd.com/
>    -
> https://lore.kernel.org/xen-devel/20250429123629.20839-1-agarciav@amd.com=
/
>
> *  [4.21?] Boot modules for Hyperlaunch (v9)
>    -  Daniel P. Smith
>    -
> https://lore.kernel.org/xen-devel/20241115131204.32135-1-dpsmith@apertuss=
olutions.com/
>    -
> https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.c=
om/
>
> *  [4.21?] Address Space Isolation FPU preparations (v2->v3)
>    -  Alejandro Vallejo
>    -
> https://patchew.org/Xen/20250110132823.24348-1-alejandro.vallejo@cloud.co=
m/
>
> * [next-rel(s)] Hyperlaunch domain builder
>    - Daniel P. Smith
>    -
> https://lore.kernel.org/xen-devel/20250515131744.3843-1-dpsmith@apertusso=
lutions.com/
>
> * [next-rel(s)] Confidential computing and AMD SEV support
>    - Teddy Astie
>    - https://patchew.org/Xen/cover.1747312394.git.teddy.astie@vates.tech/
>    -
> https://lore.kernel.org/xen-devel/cover.1747312394.git.teddy.astie@vates.=
tech/
>
> * [next-rel(s)] amd-cppc CPU Performance Scaling Driver (v5 -> v6)
>    - Penny Zheng
>    -
> https://lore.kernel.org/xen-devel/20250711035106.2540522-1-Penny.Zheng@am=
d.com/
>
> * [next-rel(s)] x86: Trenchboot Secure Launch DRTM (Xen) (v1 -> v3)
>    - Sergii Dmytruk
>    - https://patchew.org/Xen/cover.1745172094.git.sergii.dmytruk@3mdeb.co=
m/
>    -
> https://lore.kernel.org/xen-devel/cover.1748611041.git.sergii.dmytruk@3md=
eb.com/
>
> * [next-rel(s)] x86/EFI: prevent write-execute sections
>    - Roger Pau Monne <roger.pau@citrix.com>
>    -
> https://lore.kernel.org/xen-devel/20250401130840.72119-1-roger.pau@citrix=
.com/
>
> * [next-rel(s)] x86: generate xen.efi image with no write-execute section=
s
>    - Roger Pau Monne
>    -
> https://lore.kernel.org/xen-devel/20250318173547.59475-1-roger.pau@citrix=
.com/
>
> *  [next-rel(s)] Expose consistent topology to guests (v7)
>    -  Alejandro Vallejo
>    -
> https://patchew.org/Xen/20241021154600.11745-1-alejandro.vallejo@cloud.co=
m/
>
> *  [next-rel(s)] x86/alternatives: Adjust all insn-relative fields (v2)
>    -  Andrew Cooper
>    -
> https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3=
@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
>
> *  [next-rel(s)] x86emul: misc additions (v7)
>    -  Jan Beulich
>    - https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.co=
m/
>
> *  [next-rel(s)] x86: support AVX10 (v3)
>    -  Jan Beulich
>    -
> https://lore.kernel.org/xen-devel/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@su=
se.com/
>    - https://patchew.org/Xen/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.co=
m/
>
> *  [next-rel(s)] VT-d: SATC handling; ATS: tidying (v2)
>    -  Jan Beulich
>    - https://patchew.org/Xen/64b028be-2197-4951-ae5b-32f9eabfa84a@suse.co=
m/
>
> *  [next-rel(s)] x86: parallelize AP bring-up during boot (v1)
>    -  Krystian Hebel
>    -
> https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3md=
eb.com/
>
> *  [next-rel(s)] x86/spec-ctrl: IBPB improvements (v4)
>    -  Jan Beulich
>    - https://patchew.org/Xen/06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.co=
m/
>
> *  [next-rel(s)] Move some boot code from assembly to C (v2)
>    -  Frediano Ziglio
>    -
> https://lore.kernel.org/xen-devel/20241122093358.478774-1-frediano.ziglio=
@cloud.com/
>    -
> https://patchew.org/Xen/20241122093358.478774-1-frediano.ziglio@cloud.com=
/
>
> *  [next-rel(s)]amd-pstate CPU Performance Scaling Driver (v1)
>    -  Penny Zheng
>    - https://patchew.org/Xen/20241203081111.463400-1-Penny.Zheng@amd.com/
>    -
> https://lore.kernel.org/xen-devel/593baee2-9bf1-4db4-86e8-015cae48dc1a@su=
se.com/
>
> * [next-rel(s)] x86: adventures in Address Space Isolation
>    - Roger Pau Monne <roger.pau@citrix.com>
>    -
> https://lore.kernel.org/xen-devel/20250108142659.99490-1-roger.pau@citrix=
.com/
>
> =3D=3D=3D ARM =3D=3D=3D
>
> * [4.21?] MPU mm subsistem skeleton
>    - Luca Fancellu
>    -
> https://lore.kernel.org/xen-devel/20250312135258.1815706-1-luca.fancellu@=
arm.com/
>    - https://patchew.org/Xen/20250312135258.1815706-1-luca.fancellu@arm.c=
om/
>
> * [4.21?] Add initial Xen Suspend-to-RAM support on ARM64 (v4)
>    - Mykola Kvach
>    -
> https://lore.kernel.org/xen-devel/cover.1748848482.git.mykola_kvach@epam.=
com/

Our team expects to see this feature included in the 4.21 release.

Additional related patches for this feature:
https://lore.kernel.org/xen-devel/cover.1753778926.git.mykola_kvach@epam.co=
m/
https://lore.kernel.org/xen-devel/e57133182b9bcecb519911c8b3f0d871955d6fef.=
1754540991.git.mykola_kvach@epam.com/

>
> * [4.21?] xen/arm: scmi: introduce SCI SCMI SMC multi-agent support (->v4=
)
>    - Oleksii Moisieiev
>    -
> https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@=
epam.com/
>
> * [next-rel(s)] FF-A VM to VM support (v6)
>    - Bertrand Marquis <bertrand.marquis@arm.com>
>    -
> https://lore.kernel.org/xen-devel/cover.1747925287.git.bertrand.marquis@a=
rm.com/
>    - https://patchew.org/Xen/cover.1747925287.git.bertrand.marquis@arm.co=
m/
>
> *  [next-rel(s)] Add Virtio-PCI for dom0less on ARM (v1)
>    -  Edgar E. Iglesias
>    -
> https://lore.kernel.org/xen-devel/20240924162359.1390487-1-edgar.iglesias=
@gmail.com/T/#mfa148991b9408f223a079d4cef610244d5b04c2b
>    -
> https://patchew.org/Xen/20240924162359.1390487-1-edgar.iglesias@gmail.com=
/
>
> *  [next-rel(s)] DOMCTL-based guest magic region allocation for 11 domUs
> (v4)
>    -  Henry Wang
>    - https://patchew.org/Xen/20240409045357.236802-1-xin.wang2@amd.com/
>
> =3D=3D=3D RISCV =3D=3D=3D
>
> * [4.21] xen/riscv: introduce p2m functionality (v1->v3)
>    - Oleksii Kurochko
>    -
> https://lore.kernel.org/xen-devel/cover.1753973161.git.oleksii.kurochko@g=
mail.com/T/#t
>
> =3D=3D=3D PPC =3D=3D=3D
>
> *  Early Boot Allocation on Power (v5)
>    -  Shawn Anastasio
>    -
> https://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@raptore=
ngineering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d
>    -
> https://patchew.org/Xen/cover.1727388925.git.sanastasio@raptorengineering=
.com/
>
> =3D=3D Completed =3D=3D
>
> =3D=3D=3D Hypervisor =3D=3D=3D
>
> * tools: remove qemu-traditional
>    - Juergen Gross <jgross@suse.com>
>    - https://lore.kernel.org/xen-devel/20250527132035.985-1-jgross@suse.c=
om/
>
> *  remove libxenctrl usage from xenstored (v8)
>    -  Juergen Gross
>    -
> https://lore.kernel.org/xen-devel/20250204113407.16839-1-jgross@suse.com/
>
> * xen/config.h: Move BITS_PER_* definitions from asm/config.h to
> xen/config.h
>    - Oleksii Kurochko
>    -
> https://lore.kernel.org/xen-devel/6b21fb046cf1c8ca760f5ad72fa3cc13b59c406=
9.1743092485.git.oleksii.kurochko@gmail.com/
>
> * Move parts of Arm's Dom0less to common code
>    - Oleksii Kurochko
>    -
> https://patchew.org/Xen/cover.1746468003.git.oleksii.kurochko@gmail.com/
>    -
> https://lore.kernel.org/xen-devel/cover.1746468003.git.oleksii.kurochko@g=
mail.com/T/#t
>
> =3D=3D=3D x86 =3D=3D=3D
>
> *  x86: memcpy() / memset() (non-)ERMS flavors plus fallout (v4 -> v5)
>    -  Jan Beulich
>    - https://patchew.org/Xen/14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.co=
m/
>
> * kexec: add kexec support to Mini-OS (v1 -> v2)
>    - Juergen Gross <jgross@suse.com>
>    -
> https://lore.kernel.org/xen-devel/20250616084619.11112-1-jgross@suse.com/
>
> * [4.21] Allow x86 to unflatten DTs (v8)
>    - Alejandro Vallejo
>    -
> https://lore.kernel.org/xen-devel/20250722000525.7247-1-alejandro.garciav=
allejo@amd.com/#t
>
> * xen: cache control improvements
>    - Roger Pau Monne
>    -
> https://lore.kernel.org/xen-devel/20250506083148.34963-1-roger.pau@citrix=
.com/
>
> *  x86/HVM: emulation (MMIO) improvements (v3)
>    -  Jan Beulich
>    - https://patchew.org/Xen/729f7896-55b7-4b5b-a7e9-6eb0420e0b14@suse.co=
m/
>
> =3D=3D=3D ARM =3D=3D=3D
>
> * Enable R52 support for the first chunk of MPU support
>   -  Ayan Kumar Halder
>   -
> https://lore.kernel.org/xen-devel/20250619113152.2723066-1-ayan.kumar.hal=
der@amd.com/
>
> * ARM split hardware and control domains (v5)
>    - Jason Andryuk
>    -
> https://lore.kernel.org/xen-devel/20250416212911.410946-1-jason.andryuk@a=
md.com/
>    - https://patchew.org/Xen/20250416212911.410946-1-jason.andryuk@amd.co=
m/
>
> * First chunk for Arm R82 and MPU support (v4 -> v6)
>    - Luca Fancellu
>    -
> https://lore.kernel.org/xen-devel/20250523065406.3795420-1-luca.fancellu@=
arm.com/
>    - https://patchew.org/Xen/20250523065406.3795420-1-luca.fancellu@arm.c=
om/
>
> * Add support for R-Car Gen4 PCI host controller (v4 -> v5)
>    - Mykyta Poturai
>    -
> https://lore.kernel.org/xen-devel/cover.1747820844.git.mykyta_poturai@epa=
m.com/
>    -
> https://patchew.org/Xen/cover.1747820844.git.mykyta._5Fpoturai@epam.com/
>
> * SMMU handling for PCIe Passthrough on ARM (v11 -> v12)
>    - Mykyta Poturai
>    -
> https://lore.kernel.org/xen-devel/cover.1751439885.git.mykyta_poturai@epa=
m.com/
>
> *  PCI devices passthrough on Arm, part 3 (v16->v20->v21)
>    -  Stewart Hildebrand
>    -
> https://patchew.org/Xen/20250508104608.531079-1-stewart.hildebrand@amd.co=
m/
>    -
> https://lore.kernel.org/xen-devel/20250508104608.531079-1-stewart.hildebr=
and@amd.com/
>
> * Enable early bootup of Armv8-R AArch32 systems
>    - Ayan Kumar Halder
>    -
> https://lore.kernel.org/xen-devel/20250414164514.588373-1-ayan.kumar.hald=
er@amd.com/
>    -
> https://patchew.org/Xen/20250414164514.588373-1-ayan.kumar.halder@amd.com=
/
>
> =3D=3D=3D RISC-V =3D=3D=3D
>
> * riscv: introduce basic UART support and interrupts for hypervisor mode
> (v2 -> v3)
>    -  Oleksii Kurochko
>    -
> https://lore.kernel.org/xen-devel/cover.1747843009.git.oleksii.kurochko@g=
mail.com/
>    -
> https://patchew.org/Xen/cover.1747843009.git.oleksii.kurochko@gmail.com/
>
> * RISC-V some preinit calls:
>    -  Oleksii Kurochko
>    -
> https://lore.kernel.org/xen-devel/4ddde60347edf6740fbc69b5739d099616f5b5f=
f.1743165791.git.oleksii.kurochko@gmail.com/
>
> * Fixes for UBSAN & GCOV support for RISC-V:
>    -  Oleksii Kurochko
>    -
> https://lore.kernel.org/xen-devel/9fbb5e1389b84bed2e95f99e4c383d0215c7a52=
4.1744889185.git.oleksii.kurochko@gmail.com/
>
> Have a good week!
>
> Best regards,
>   Oleksi

Best regards,
Mykola

