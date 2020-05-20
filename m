Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AB41DB04B
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 12:34:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbM3J-0003gR-OV; Wed, 20 May 2020 10:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hkT=7C=zohomail.eu=elliotkillick@srs-us1.protection.inumbo.net>)
 id 1jbM3H-0003gM-Ix
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 10:34:20 +0000
X-Inumbo-ID: 7538a44c-9a85-11ea-b07b-bc764e2007e4
Received: from sender11-pp-o93.zoho.eu (unknown [31.186.226.251])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7538a44c-9a85-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 10:34:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1589970856; cv=none; d=zohomail.eu; s=zohoarc; 
 b=XVSwE/m1XA/r1o/v3UFNMI7+eMIYA6oss6uN9RUcp+NeHmgxiPzqmFdV0YXvlIzBawpUEYGqM+VS74/i5UfDoDtTV6PUln0yJgadldMXHvsnASw4wRPVlUUx2CKmmanijmL+qxDRvtD9ltRAY105tBeMC7fo/JRKMQ/ui8SL2BM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1589970856;
 h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=pvI8uhi+G5NcTAaxI75Nu7A+wbFrd2Zrmhd/Q23JWAo=; 
 b=BGpaPCXD1i8bZqFyyDLFj7GjOtB2sgXllKer5MiJ7Rkc47yqBfjaFEPnZMJLdhzizG5eUatZUIpAmbNj+sU7uzLyLoT5tJbnWVR1pJxuESsvVfOASvTDKWgHSonisMpzEj/2qde37m+j8zH/ZZyZy0MXKm91g+qrYNJYuMEr29g=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 dkim=pass  header.i=zohomail.eu;
 spf=pass  smtp.mailfrom=elliotkillick@zohomail.eu;
 dmarc=pass header.from=<elliotkillick@zohomail.eu>
 header.from=<elliotkillick@zohomail.eu>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589970856; 
 s=zoho; d=zohomail.eu; i=elliotkillick@zohomail.eu;
 h=To:From:Message-ID:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=pvI8uhi+G5NcTAaxI75Nu7A+wbFrd2Zrmhd/Q23JWAo=;
 b=Q79oMTlvpQw04cSBVCBQVVaIuIyB5zo3jww4+eqn2zYGOI9DrWuWmUaoBV2+4pzZ
 yPKlcl90U/3n493RD/OZYWV0Q+buoU8UVGgpt4pqQgu+2JUEExnffGoh9ox6E1XU/ui
 5Z3SGeTL4OEhFR+3wXzHsl05CYhkuH7n9BFcMip0=
Received: from [10.137.0.35]
 (CPEac202e7c9cc3-CMac202e7c9cc0.cpe.net.cable.rogers.com [99.231.147.74]) by
 mx.zoho.eu with SMTPS id 1589970853561616.0091882740427;
 Wed, 20 May 2020 12:34:13 +0200 (CEST)
To: xen-devel@lists.xenproject.org
From: Elliot Killick <elliotkillick@zohomail.eu>
Message-ID: <36815795-223f-2b96-5401-c262294cbaa8@zohomail.eu>
Subject: [BUG] Consistent LBR/TSX vmentry failure (0x80000022) calling
 domain_crash() in vmx.c:3324
Date: Wed, 20 May 2020 10:33:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

Xen is crashing Windows 10 (64-bit) VMs consistently whenever IDA
Debugger
(https://www.hex-rays.com/products/ida/support/download_freeware/)
launches the Local Windows Debugger. The crash occurs when trying to
launch the debugger against any executable (e.g. calc.exe) right at the
time IDA says it is "Moving segment from <X address> to <Y address>".

Tested on Windows 7, 8 and Linux as well but the bug is only triggered
on Windows 10. Happens whether or not IDA is running with administrator
privileges. No drivers/VM tools installed. Windows has a bug check code
of zero, leaves no memory dump, nothing in the logs from QEMU in Dom0,
the domain just powers off immediately leaving a record of the incident
in the hypervisor.log. So, it does appear to be a Xen issue. Modern
Intel CPU.

Does anyone have some ideas on what may be causing this?

Thank you,
Elliot

hypervisor.log:

(XEN) d24v1 vmentry failure (reason 0x80000022): MSR loading (entry 1)
(XEN)=C2=A0=C2=A0 msr 000001dd val 1ffff80676f52be5 (mbz 0)
(XEN) ************* VMCS Area **************
(XEN) *** Guest State ***
(XEN) CR0: actual=3D0x0000000080050031, shadow=3D0x0000000080050031,
gh_mask=3Dffffffffffffffff
(XEN) CR4: actual=3D0x0000000000172678, shadow=3D0x0000000000170678,
gh_mask=3Dffffffffffffffff
(XEN) CR3 =3D 0x00000001b2725002
(XEN) RSP =3D 0xffff960c962d1af8 (0xffff960c962d1af8)=C2=A0 RIP =3D
0xfffff80676dc29d0 (0xfffff80676dc29d0)
(XEN) RFLAGS=3D0x00000002 (0x00000002)=C2=A0 DR7 =3D 0x0000000000000400
(XEN) Sysenter RSP=3D0000000000000000 CS:RIP=3D0000:0000000000000000
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=C2=A0 attr=C2=A0 limit=
=C2=A0=C2=A0 base
(XEN)=C2=A0=C2=A0 CS: 0010 0209b 00000000 0000000000000000
(XEN)=C2=A0=C2=A0 DS: 002b 0c0f3 ffffffff 0000000000000000
(XEN)=C2=A0=C2=A0 SS: 0000 1c000 ffffffff 0000000000000000
(XEN)=C2=A0=C2=A0 ES: 002b 0c0f3 ffffffff 0000000000000000
(XEN)=C2=A0=C2=A0 FS: 0053 040f3 00007c00 0000000000000000
(XEN)=C2=A0=C2=A0 GS: 002b 0c0f3 ffffffff ffffb181c2d00000
(XEN) GDTR:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 00000057 ffffb181c2d15fb0
(XEN) LDTR: 0000 1c000 ffffffff 0000000000000000
(XEN) IDTR:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 00000fff ffffb181c2d13000
(XEN)=C2=A0=C2=A0 TR: 0040 0008b 00000067 ffffb181c2d14000
(XEN) EFER =3D 0x0000000000000400=C2=A0 PAT =3D 0x0007010600070106
(XEN) PreemptionTimer =3D 0x00000000=C2=A0 SM Base =3D 0x00000000
(XEN) DebugCtl =3D 0x0000000000000001=C2=A0 DebugExceptions =3D 0x000000000=
0000000
(XEN) Interruptibility =3D 00000000=C2=A0 ActivityState =3D 00000000
(XEN) *** Host State ***
(XEN) RIP =3D 0xffff82d0801f0840 (vmx_asm_vmexit_handler)=C2=A0 RSP =3D
0xffff8304204f7f70
(XEN) CS=3De008 SS=3D0000 DS=3D0000 ES=3D0000 FS=3D0000 GS=3D0000 TR=3De040
(XEN) FSBase=3D0000000000000000 GSBase=3D0000000000000000
TRBase=3Dffff83042bb02c80
(XEN) GDTBase=3Dffff83042baf2000 IDTBase=3Dffff8304204ee000
(XEN) CR0=3D0000000080050033 CR3=3D0000000417a40000 CR4=3D00000000001526e0
(XEN) Sysenter RSP=3Dffff8304204f7fa0 CS:RIP=3De008:ffff82d0802144b0
(XEN) EFER =3D 0x0000000000000000=C2=A0 PAT =3D 0x0000050100070406
(XEN) *** Control State ***
(XEN) PinBased=3D0000003f CPUBased=3Db62065fa SecondaryExec=3D000054eb
(XEN) EntryControls=3D000053ff ExitControls=3D000fefff
(XEN) ExceptionBitmap=3D00060002 PFECmask=3D00000000 PFECmatch=3D00000000
(XEN) VMEntry: intr_info=3D0000002f errcode=3D00000000 ilen=3D00000000
(XEN) VMExit: intr_info=3D00000000 errcode=3D00000000 ilen=3D00000002
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reason=3D80000022 qua=
lification=3D0000000000000002
(XEN) IDTVectoring: info=3D00000000 errcode=3D00000000
(XEN) TSC Offset =3D 0xffff797cd2ddfef4=C2=A0 TSC Multiplier =3D 0x00000000=
00000000
(XEN) TPR Threshold =3D 0x00=C2=A0 PostedIntrVec =3D 0x00
(XEN) EPT pointer =3D 0x000000041444701e=C2=A0 EPTP index =3D 0x0000
(XEN) PLE Gap=3D00000080 Window=3D00001000
(XEN) Virtual processor ID =3D 0xf71d VMfunc controls =3D 0000000000000000
(XEN) **************************************
(XEN) domain_crash called from vmx.c:3324
(XEN) Domain 24 (vcpu#1) crashed on cpu#1:
(XEN) ----[ Xen-4.8.5-15.fc25=C2=A0 x86_64=C2=A0 debug=3Dn=C2=A0=C2=A0 Not =
tainted ]----
(XEN) CPU:=C2=A0=C2=A0=C2=A0 1
(XEN) RIP:=C2=A0=C2=A0=C2=A0 0010:[<fffff80676dc29d0>]
(XEN) RFLAGS: 0000000000000002=C2=A0=C2=A0 CONTEXT: hvm guest (d24v1)
(XEN) rax: 0000000000000001=C2=A0=C2=A0 rbx: 0000000000000000=C2=A0=C2=A0 r=
cx: 00000000000001d9
(XEN) rdx: 0000000000000000=C2=A0=C2=A0 rsi: 0000000000000000=C2=A0=C2=A0 r=
di: 0000000000000000
(XEN) rbp: ffff960c962d1b80=C2=A0=C2=A0 rsp: ffff960c962d1af8=C2=A0=C2=A0 r=
8:=C2=A0 0000000000000002
(XEN) r9:=C2=A0 ffffb181c2d00000=C2=A0=C2=A0 r10: ffffc48c879b6080=C2=A0=C2=
=A0 r11: 0000000000000000
(XEN) r12: 0000000000000000=C2=A0=C2=A0 r13: 0000000000000000=C2=A0=C2=A0 r=
14: 0000000000000000
(XEN) r15: 0000000000000000=C2=A0=C2=A0 cr0: 0000000080050031=C2=A0=C2=A0 c=
r4: 0000000000170678
(XEN) cr3: 00000001b2725002=C2=A0=C2=A0 cr2: 00007ff89f231770
(XEN) fsb: 0000000000000000=C2=A0=C2=A0 gsb: ffffb181c2d00000=C2=A0=C2=A0 g=
ss: 000000146673a000
(XEN) ds: 002b=C2=A0=C2=A0 es: 002b=C2=A0=C2=A0 fs: 0053=C2=A0=C2=A0 gs: 00=
2b=C2=A0=C2=A0 ss: 0000=C2=A0=C2=A0 cs: 0010


