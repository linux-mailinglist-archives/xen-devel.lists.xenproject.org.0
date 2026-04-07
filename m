Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH7FDh+91GmWwwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 10:15:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBB83AB2AB
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 10:15:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274523.1560616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA1Zq-0004mh-AG; Tue, 07 Apr 2026 08:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274523.1560616; Tue, 07 Apr 2026 08:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA1Zq-0004kn-7L; Tue, 07 Apr 2026 08:14:26 +0000
Received: by outflank-mailman (input) for mailman id 1274523;
 Tue, 07 Apr 2026 08:08:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kroupa.matyas@gmail.com>) id 1wA1To-0003hq-QO
 for xen-devel@lists.xen.org; Tue, 07 Apr 2026 08:08:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA1Tl-0011Pa-VO
 for xen-devel@lists.xen.org; Tue, 07 Apr 2026 10:08:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kroupa.matyas@gmail.com>)
 id 69d4bb69-5cb7-0a2a0a5109dd-0a2a45099586-12
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 10:08:11 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <kroupa.matyas@gmail.com>)
 id 69d4bb6b-bf79-0a2a45090019-d155dd2be56e-3
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 10:08:11 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43d43e09de5so579562f8f.1
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 01:08:11 -0700 (PDT)
Received: from rivendell.hailstone.cz ([2001:718:801:311:4701:d1d5:7bfd:a254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d2738sm48714833f8f.24.2026.04.07.01.08.08
 for <xen-devel@lists.xen.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 01:08:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775549290; x=1776154090; darn=lists.xen.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FghN7Xge3vH2+8zvcZb/VI7n3VoWaWR5ju3BI+dhG/8=;
        b=iWlpiUNSAkpruNMToH5qGw6Uz15Mn6jCV2kNQf3+18chS0rY9y3QPYCka81Hd5sEPC
         6ayIEwBvcEn8JOIVNXxamYHNVdyWWfok4wDx5GooHj1pndtQ9CL7s7VvntxipzNzv0Yf
         bkvqJDniW3Fq7Poii0q8qMrumksPpKmY7ZPDV0NoflHB+0fMPJJ1m/I26cNHLrE1I2Hs
         w4ZzcXbVYZEuQqnCe6BcMHcwYTVlGtMbwggUpB7elkArJHZe6WOvgpFf6lFJxE/rYw2z
         +P9RWJ5Javkh5F7ECs1zOq+Qny5Lj1zRspb3nYiUg5/X7yCvX5IF+xW9qSF4qUdz+oj0
         hImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549290; x=1776154090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FghN7Xge3vH2+8zvcZb/VI7n3VoWaWR5ju3BI+dhG/8=;
        b=N6WNLsE9taiquuNCExbUGFbJiuRRued039bccI7WFlffJm8AvhZxapH9qXB00MxyBb
         b+u1GxUufUZxml2Y+MqYH47pDj3qEcT9X3Bjc/ROyfARZy50uAm1gBZ9QsmC2TNEeVT1
         hqNhs45qnXQp9cG2pbz2K4TdC4Sn4zEEwcQrnh9wlZFCEryCSO2Ve+QxXqVlmkJ8yG/i
         53/YyfwAXP+1t6M1QWmN4mUKnHwYS+dcwHQZWpE8ZJb4k6h7Ty4tkBW/fYz1+QVMaumL
         hYkKu6ZLLZDtUywYHwJHTn7ArB/e2SmFIdt1zq9daavVLooyG8CSA0UHASNWicZC9d13
         u+Aw==
X-Gm-Message-State: AOJu0YyXp9+YhlE0bTif+R7hEXlBic8I9vhKRbMO7x8Sn4TyONVttlsf
	p9eskFMVZcu717nwvw1v0Uk4ancapAo5HtdOqXWAtdZtgDGVrd9lrxHkFpQ0/A==
X-Gm-Gg: AeBDievKzdGpTUN1CFk93CoikQCm8O4evDLb5EUPLm4x/dBBB7AmH9j+lfDTRaTjEtT
	5h8+tXRa3ryOE1DwCeYzdEkhCBn+vqYHRj7n/iJ/Hvbw914NJdkjH89ieMEk9T2qfz4qROb9jDq
	9upPE/kJ4fD64VjLD5tJQcS8TDiV6OwsQIS9WjD1dMB8+JMmWYqkuLb4Q3mBxTGnDXxW3Yng/pJ
	jcac1n4wBmX6arfyQsJMOnui1UQtedvo5v3o8HzMsB4ZF3c57JOa1rEDyyugzn/nDEhhpM57cLU
	HB02yEo21O0nEew6ox1/HuIWICGnnmNYVhvLbQS/SKp9x1FLFLh8YWIdTOygV5S5qubVM4Q8RlC
	K48+U0xLPMt0s8WRbffd4mlrdc+7dG1jHuKTv4L8nbiS5SSqr7c0XdgBpsXUoCATIxTxRRxPNyF
	QmS9xgzsvT6ildxW9Xl8GPKOFXxApMRTNmkMyPm5E9els=
X-Received: by 2002:a05:6000:2885:b0:43c:f7d6:474a with SMTP id ffacd0b85a97d-43d2927bc07mr21724427f8f.19.1775549290314;
        Tue, 07 Apr 2026 01:08:10 -0700 (PDT)
From: =?UTF-8?B?TWF0ecOhxaE=?= Kroupa <kroupa.matyas@gmail.com>
To: xen-devel@lists.xen.org
Subject: Xen on Zen 3
Date: Tue, 07 Apr 2026 10:08:07 +0200
Message-ID: <5490687.niJfEyVGOH@rivendell.hailstone.cz>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart6521316.E0xQCEvomI"
Content-Transfer-Encoding: 7Bit
X-purgate-ID: tlsNG-bad1c0/1775549291-5D1F5152-EB3E9FC2/0/0
X-purgate-type: clean
X-purgate-size: 19301
X-Spamd-Result: default: False [0.56 / 15.00];
	R_MIXED_CHARSET(1.25)[subject];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-log];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xen.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,rivendell.hailstone.cz:mid];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FORGED_SENDER(0.00)[kroupamatyas@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	HAS_ATTACHMENT(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xen.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kroupamatyas@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6FBB83AB2AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.

--nextPart6521316.E0xQCEvomI
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,
I am trying to run Xen on a bare metal with Zen 3 microarchitecture (to be=
=20
specific Ryzen 9 5950X). I am using Fedora 43 as Dom0 in PVH mode. However,=
 the=20
Linux kernel crashes early in the boot causing Xen to reboot. I am not exac=
tly=20
sure if Linux or Xen is the problematic part. The kernel boots fine without=
=20
Xen. Before Ryzen 9 I had Ryzen 5 3400G (Zen+) which booted even with Xen.

The Xen is a backported from Fedora 44 (not yet released) because I need Xe=
n=20
4.21 features, mainly ReBAR support for the Arc B50 GPU. Package specificat=
ion=20
with build commands can be found on https://src.fedoraproject.org/rpms/xen/
blob/f44/f/xen.spec. There are also downstream patches and configuration.

I have set up a serial link, so I have some logs. They are in the attachmen=
t.=20
I have used gdb to translate the binary offset to source code line. The=20
problematic line is https://elixir.bootlin.com/linux/v6.19.10/source/arch/x=
86/
kernel/amd_node.c#L296. It seems that linux is detecting zero PCI roots on=
=20
non-zero number of nodes causing division by zero.

System information
Boot mode: UEFI
Secure boot: disabled
IOMMU: enabled
SR-IOV: enabled
Above 4G decoding & rebar: enabled
Xen cmdline: placeholder dom0=3Dpvh dom0_mem=3D36G com1=3D115200,8n1=20
console=3Dcom1,vga no-real-mode edd=3Doff
Linux cmdline: placeholder root=3DUUID=3D5a7af636-54c3-4f76-a164-c1138de257=
ad ro=20
rootflags=3Dsubvol=3D@ rhgb quiet console=3Dhvc0 earlyprintk=3Dxen
Xen version: 4.21.1
Linux version: 6.19.10

If you need more logs or other information, I will be more than happy to=20
provide it.
Thank you in advance
Maty=C3=A1=C5=A1 Kroupa
--nextPart6521316.E0xQCEvomI
Content-Disposition: attachment; filename="xen-4.21.1-linux-6.19.10.log"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-log; charset="UTF-8"; name="xen-4.21.1-linux-6.19.10.log"

error: ../../grub-core/commands/loadenv.c:216:sparse file not allowed.
GRUB version 2.12

+--------------------------------------------------------------------------=
=2D-+||||||||||||||||||||||+-----------------------------------------------=
=2D----------------------------+     Use the ^ and v keys to select which e=
ntry is highlighted.         =20
      Press enter to boot the selected OS, `e' to edit the commands      =20
      before booting or `c' for a command-line. ESC to return            =20
      previous menu.                                                       =
 Fedora Linux (6.19.10-200.fc43.x86_64) 43 (Server Edition)                =
  Fedora Linux (6.19.9-200.fc43.x86_64) 43 (Server Edition)                =
   Fedora Linux (6.19.8-200.fc43.x86_64) 43 (Server Edition)               =
    Fedora Linux (6.6.84-200.fc41.x86_64) 43 (Server Edition)              =
     Fedora Linux (0-rescue-9a85b9092f254228a1dc4273a335191f) 43 (Server Ed=
itio>*Fedora, with Xen 4.21.1 and Linux 6.19.10-200.fc43.x86_64            =
       Fedora, with Xen 4.21.1 and Linux 6.19.9-200.fc43.x86_64            =
        Fedora, with Xen 4.21.1 and Linux 6.19.8-200.fc43.x86_64           =
         Fedora, with Xen 4.21.1 and Linux 6.6.84-200.fc41.x86_64          =
          UEFI Firmware Settings                                           =
                                                                           =
               The highlighted entry will be executed automatically in 5s. =
                   The highlighted entry will be executed automatically in =
4s.                    The highlighted entry will be executed automatically=
 in 3s.                                                                    =
                                                                           =
                                 Fedora, with Xen 4.21.1 and Linux 6.19.10-=
200.fc43.x86_64                  *Fedora Linux (0-rescue-9a85b9092f254228a1=
dc4273a335191f) 43 (Server Editio> Fedora Linux (0-rescue-9a85b9092f254228a=
1dc4273a335191f) 43 (Server Editio>*Fedora, with Xen 4.21.1 and Linux 6.19.=
10-200.fc43.x86_64                  Loading Xen 4.21.1 ...
Loading Linux 6.19.10-200.fc43.x86_64 ...
Loading initial ramdisk ...
Xen 4.21.1
(XEN) Xen version 4.21.1 (mockbuild@) (gcc (GCC) 15.2.1 20260123 (Red Hat 1=
5.2.1-7)) debug=3Dn Thu Apr  2 00:00:00 UTC 2026
(XEN) Latest ChangeSet:=20
(XEN) build-id: 86b71d479f28fc1106fffdfe76c8e7037e2e70fa
(XEN) CPU Vendor: AMD, Family 25 (0x19), Model 33 (0x21), Stepping 2 (raw 0=
0a20f12)
(XEN) BSP microcode revision: 0x0a201213
(XEN) Bootloader: GRUB 2.12
(XEN) Command line: placeholder dom0=3Dpvh dom0_mem=3D36G com1=3D115200,8n1=
 console=3Dcom1,vga no-real-mode edd=3Doff
(XEN) Xen image load base address: 0xb6a00000
(XEN) Video information:
(XEN)  VGA is graphics mode 1920x1080, 32 bpp
(XEN)  VBE/DDC methods: none; EDID transfer time: 0 seconds
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 3 EDD information structures
(XEN) Using IDT event delivery
(XEN) Enabling Supervisor Shadow Stacks
(XEN)   - Disabling PV32 due to CET
(XEN) EFI RAM map:
(XEN)  [0000000000000000, 000000000009ffff] (usable)
(XEN)  [00000000000a0000, 00000000000fffff] (reserved)
(XEN)  [0000000000100000, 0000000009bfefff] (usable)
(XEN)  [0000000009bff000, 0000000009ffffff] (reserved)
(XEN)  [000000000a000000, 000000000a1fffff] (usable)
(XEN)  [000000000a200000, 000000000a20dfff] (ACPI NVS)
(XEN)  [000000000a20e000, 000000000affffff] (usable)
(XEN)  [000000000b000000, 000000000b01ffff] (reserved)
(XEN)  [000000000b020000, 00000000bb13afff] (usable)
(XEN)  [00000000bb13b000, 00000000bc947fff] (reserved)
(XEN)  [00000000bc948000, 00000000bc988fff] (ACPI data)
(XEN)  [00000000bc989000, 00000000bd07cfff] (ACPI NVS)
(XEN)  [00000000bd07d000, 00000000bdbfefff] (reserved)
(XEN)  [00000000bdbff000, 00000000beffffff] (usable)
(XEN)  [00000000bf000000, 00000000bfffffff] (reserved)
(XEN)  [00000000f0000000, 00000000f7ffffff] (reserved)
(XEN)  [00000000fd200000, 00000000fd2fffff] (reserved)
(XEN)  [00000000fd600000, 00000000fd7fffff] (reserved)
(XEN)  [00000000fea00000, 00000000fea0ffff] (reserved)
(XEN)  [00000000feb80000, 00000000fec01fff] (reserved)
(XEN)  [00000000fec10000, 00000000fec10fff] (reserved)
(XEN)  [00000000fec30000, 00000000fec30fff] (reserved)
(XEN)  [00000000fed00000, 00000000fed00fff] (reserved)
(XEN)  [00000000fed40000, 00000000fed44fff] (reserved)
(XEN)  [00000000fed80000, 00000000fed8ffff] (reserved)
(XEN)  [00000000fedc2000, 00000000fedcffff] (reserved)
(XEN)  [00000000fedd4000, 00000000fedd5fff] (reserved)
(XEN)  [00000000ff000000, 00000000ffffffff] (reserved)
(XEN)  [0000000100000000, 0000000c3f2fffff] (usable)
(XEN)  [0000000c3f300000, 0000000c3fffffff] (reserved)
(XEN) ACPI: RSDP BD066014, 0024 (r2 ALASKA)
(XEN) ACPI: XSDT BD065728, 00CC (r1 ALASKA   A M I   1072009 AMI   1000013)
(XEN) ACPI: FACP BC97A000, 0114 (r6 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: DSDT BC973000, 60DA (r2 ALASKA   A M I   1072009 INTL 20120913)
(XEN) ACPI: FACS BD060000, 0040
(XEN) ACPI: SSDT BC980000, 8CE9 (r2    AMD AmdTable        2 MSFT  4000000)
(XEN) ACPI: SSDT BC97C000, 3CB6 (r2    AMD  AMD AOD        1 INTL 20120913)
(XEN) ACPI: SSDT BC97B000, 01CC (r2 ALASKA  CPUSSDT  1072009 AMI   1072009)
(XEN) ACPI: FIDT BC972000, 009C (r1 ALASKA    A M I  1072009 AMI     10013)
(XEN) ACPI: MCFG BC971000, 003C (r1 ALASKA    A M I  1072009 MSFT    10013)
(XEN) ACPI: AAFT BC970000, 00F1 (r1 ALASKA OEMAAFT   1072009 MSFT       97)
(XEN) ACPI: HPET BC96F000, 0038 (r1 ALASKA    A M I  1072009 AMI         5)
(XEN) ACPI: IVRS BC96E000, 00D0 (r2  AMD   AmdTable        1 AMD         1)
(XEN) ACPI: BGRT BC96D000, 0038 (r1 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: TPM2 BC96C000, 004C (r4 ALASKA   A M I         1 AMI         0)
(XEN) ACPI: PCCT BC96B000, 006E (r2    AMD AmdTable        1 AMD         1)
(XEN) ACPI: SSDT BC962000, 8033 (r2    AMD AmdTable        1 AMD         1)
(XEN) ACPI: CRAT BC960000, 1710 (r1    AMD AmdTable        1 AMD         1)
(XEN) ACPI: CDIT BC95F000, 0029 (r1    AMD AmdTable        1 AMD         1)
(XEN) ACPI: SSDT BC95B000, 37C4 (r2    AMD   MYRTLE        1 INTL 20120913)
(XEN) ACPI: SSDT BC95A000, 00BF (r1    AMD AmdTable     1000 INTL 20120913)
(XEN) ACPI: WSMT BC959000, 0028 (r1 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: APIC BC958000, 015E (r3 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: SSDT BC956000, 10AF (r2    AMD   MYRTLE        1 INTL 20120913)
(XEN) ACPI: FPDT BC955000, 0044 (r1 ALASKA   A M I   1072009 AMI   1000013)
(XEN) System RAM: 49075MB (50253492kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000c3f300000
(XEN) Domain heap initialised
(XEN) vesafb: framebuffer at 0x000000f800000000, mapped to 0xffff82c0002030=
00, using 8128k, total 8128k
(XEN) vesafb: mode is 1920x1080x32, linelength=3D7680, font 8x16
(XEN) vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
(XEN) SMBIOS 3.3 present.
(XEN) PCI: MCFG configuration 0: base f0000000 segment 0000 buses 00 - 7f
(XEN) PCI: MCFG area at f0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-7f
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x808 (32 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - bd060000/000000000000000=
0, using 32
(XEN) ACPI:             wakeup_vec[bd06000c], vec_size[20]
(XEN) Overriding APIC driver with bigsmp
(XEN) ACPI: IOAPIC (id[0x21] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 33, version 33, address 0xfec00000, GSI 0-23
(XEN) ACPI: IOAPIC (id[0x22] address[0xfec01000] gsi_base[24])
(XEN) IOAPIC[1]: apic_id 34, version 33, address 0xfec01000, GSI 24-55
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) ACPI: HPET id: 0x10228201 base: 0xfed00000
(XEN) ACPI: BGRT: invalidating v1 image at 0xb762c018
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 32 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 56 GSI, 6600 MSI/MSI-X
(XEN) AMD-Vi: IOMMU Extended Features:
(XEN) - Peripheral Page Service Request
(XEN) - NX bit
(XEN) - Invalidate All Command
(XEN) - Performance Counters
(XEN) - Host Address Translation Size: 0x2
(XEN) - Guest Address Translation Size: 0
(XEN) - Guest CR3 Root Table Level: 0x1
(XEN) - Maximum PASID: 0xf
(XEN) - SMI Filter Register: 0x1
(XEN) - SMI Filter Register Count: 0x2
(XEN) - Guest Virtual APIC Modes: 0x1
(XEN) - Dual PPR Log: 0x2
(XEN) - Dual Event Log: 0x2
(XEN) - User / Supervisor Page Protection
(XEN) - Device Table Segmentation: 0x3
(XEN) - PPR Log Overflow Early Warning
(XEN) - PPR Automatic Response
(XEN) - Memory Access Routing and Control: 0x1
(XEN) - Block StopMark Message
(XEN) - Performance Optimization
(XEN) - MSI Capability MMIO Access
(XEN) - Guest I/O Protection
(XEN) - Host Access
(XEN) - Enhanced PPR Handling
(XEN) - Attribute Forward
(XEN) - Virtualized IOMMU
(XEN) - VMGuard I/O Support
(XEN) - VM Table Size: 0x2
(XEN) Switched to APIC driver x2apic_mixed
(XEN) CPU0: 2200 ... 3400 MHz
(XEN) xstate: size: 0x988 and states: 0x207
(XEN) CPU0: AMD Fam19h machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware hints: STIBP_ALWAYS IBRS_FAST IBRS_SAME_MODE
(XEN)   Hardware features: IBPB IBRS STIBP SSBD PSFD
(XEN)   Compiled-in support: INDIRECT_THUNK RETURN_THUNK SHADOW_PAGING HARD=
EN_ARRAY HARDEN_BRANCH HARDEN_GUEST_ACCESS HARDEN_LOCK
(XEN)   Xen settings: BTI-Thunk: JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD- PSFD-, =
Other: VERW BRANCH_HARDEN
(XEN)   Support for HVM VMs: MSR_SPEC_CTRL MSR_VIRT_SPEC_CTRL RSB VERW IBPB=
=2Dentry
(XEN)   Support for PV VMs: VERW IBPB-entry
(XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 3393.617 MHz processor.
(XEN) Freed 1008kB unused BSS memory
(XEN) alt table ffff82d04049bfb8 -> ffff82d0404b328e
(XEN) AMD-Vi: IOMMU 0 Enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) Enabling APIC mode.  Using 2 I/O APICs
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
(XEN) Wallclock source: CMOS RTC
(XEN) Defaulting to alternative key handling; send 'A' to switch to normal =
mode.
(XEN) Allocated console ring of 128 KiB.
(XEN) HVM: ASIDs enabled
(XEN) SVM: Supported advanced features:
(XEN)  - Nested Page Tables (NPT)
(XEN)  - Last Branch Record (LBR) Virtualisation
(XEN)  - Next-RIP Saved on #VMEXIT
(XEN)  - VMCB Clean Bits
(XEN)  - TLB flush by ASID
(XEN)  - DecodeAssists
(XEN)  - Virtual VMLOAD/VMSAVE
(XEN)  - Virtual GIF
(XEN)  - Pause-Intercept Filter
(XEN)  - Pause-Intercept Filter Threshold
(XEN)  - TSC Rate MSR
(XEN)  - NPT Supervisor Shadow Stack
(XEN)  - MSR_SPEC_CTRL virtualisation
(XEN) HVM: SVM enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) Brought up 32 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) Adding cpu 4 to runqueue 0
(XEN) Adding cpu 5 to runqueue 0
(XEN) Adding cpu 6 to runqueue 0
(XEN) Adding cpu 7 to runqueue 0
(XEN) Adding cpu 8 to runqueue 0
(XEN) Adding cpu 9 to runqueue 0
(XEN) Adding cpu 10 to runqueue 0
(XEN) Adding cpu 11 to runqueue 0
(XEN) Adding cpu 12 to runqueue 0
(XEN) Adding cpu 13 to runqueue 0
(XEN) Adding cpu 14 to runqueue 0
(XEN) Adding cpu 15 to runqueue 0
(XEN) Adding cpu 16 to runqueue 1
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 17 to runqueue 1
(XEN) Adding cpu 18 to runqueue 1
(XEN) Adding cpu 19 to runqueue 1
(XEN) Adding cpu 20 to runqueue 1
(XEN) Adding cpu 21 to runqueue 1
(XEN) Adding cpu 22 to runqueue 1
(XEN) Adding cpu 23 to runqueue 1
(XEN) Adding cpu 24 to runqueue 1
(XEN) Adding cpu 25 to runqueue 1
(XEN) Adding cpu 26 to runqueue 1
(XEN) Adding cpu 27 to runqueue 1
(XEN) Adding cpu 28 to runqueue 1
(XEN) Adding cpu 29 to runqueue 1
(XEN) Adding cpu 30 to runqueue 1
(XEN) Adding cpu 31 to runqueue 1
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) NX (Execute Disable) protection active
(XEN) d0 has maximum 6656 PIRQs
(XEN) *** Building a PVH Dom0 ***
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: Errors, warnings and info
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 724kB init memory
Poking KASLR using RDRAND RDTSC...
[    0.622790] Oops: divide error: 0000 [#1] SMP NOPTI
[    0.622790] fbcon: Taking over console
[    0.623479] CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.10-200=
=2Efc43.x86_64 #1 PREEMPT(lazy)=20
[    0.623479] Hardware name: To Be Filled By O.E.M. B450M Steel Legend/B45=
0M Steel Legend, BIOS P10.43 06/25/2025
[    0.623479] RIP: 0010:amd_smn_init+0x1ea/0x280
[    0.623479] Code: c7 c7 13 de 16 83 e8 85 7c 44 fd eb 6f 48 89 df e8 0b =
18 ca fc 48 89 c3 48 85 c0 0f 84 5b ff ff ff 44 89 e8 31 d2 45 8d 7d 01 <66=
> f7 f5 66 85 d2 75 42 66 90 eb 2c 41 0f b7 ce 48 8d b3 c8 00 00
[    0.623479] RSP: 0018:ffffc9000004fe28 EFLAGS: 00010246
[    0.623479] RAX: 0000000000000000 RBX: ffff888103ee6000 RCX: 00000000000=
00005
[    0.623479] RDX: 0000000000000000 RSI: ffff888103ee6000 RDI: 00000000000=
00000
[    0.623479] RBP: 0000000000000000 R08: 0000000000000282 R09: ffff8881015=
cbf70
[    0.623479] R10: ffffc9000004fe28 R11: ffffffff84a4c880 R12: 00000000000=
00002
[    0.623479] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00001
[    0.623479] FS:  0000000000000000(0000) GS:ffff88898e5ef000(0000) knlGS:=
0000000000000000
[    0.623479] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.623479] CR2: 0000000000000000 CR3: 0000000003a2e000 CR4: 00000000007=
50ef0
[    0.623479] PKRU: 55555554
[    0.623479] Call Trace:
[    0.623479]  <TASK>
[    0.623479]  ? __pfx_amd_smn_init+0x10/0x10
[    0.623479]  do_one_initcall+0x5b/0x300
[    0.623479]  do_initcalls+0x148/0x170
[    0.623479]  kernel_init_freeable+0xf9/0x140
[    0.623479]  ? __pfx_kernel_init+0x10/0x10
[    0.623479]  kernel_init+0x1a/0x140
[    0.623479]  ret_from_fork+0x130/0x1a0
[    0.623479]  ? __pfx_kernel_init+0x10/0x10
[    0.623479]  ret_from_fork_asm+0x1a/0x30
[    0.623479]  </TASK>
[    0.623479] Modules linked in:
[    0.623480] ---[ end trace 0000000000000000 ]---
[    0.623499] RIP: 0010:amd_smn_init+0x1ea/0x280
[    0.623508] Code: c7 c7 13 de 16 83 e8 85 7c 44 fd eb 6f 48 89 df e8 0b =
18 ca fc 48 89 c3 48 85 c0 0f 84 5b ff ff ff 44 89 e8 31 d2 45 8d 7d 01 <66=
> f7 f5 66 85 d2 75 42 66 90 eb 2c 41 0f b7 ce 48 8d b3 c8 00 00
[    0.623534] RSP: 0018:ffffc9000004fe28 EFLAGS: 00010246
[    0.623547] RAX: 0000000000000000 RBX: ffff888103ee6000 RCX: 00000000000=
00005
[    0.623559] RDX: 0000000000000000 RSI: ffff888103ee6000 RDI: 00000000000=
00000
[    0.623571] RBP: 0000000000000000 R08: 0000000000000282 R09: ffff8881015=
cbf70
[    0.623583] R10: ffffc9000004fe28 R11: ffffffff84a4c880 R12: 00000000000=
00002
[    0.623595] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00001
[    0.623608] FS:  0000000000000000(0000) GS:ffff88898e5ef000(0000) knlGS:=
0000000000000000
[    0.623623] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.623634] CR2: 0000000000000000 CR3: 0000000003a2e000 CR4: 00000000007=
50ef0
[    0.623646] PKRU: 55555554
[    0.623653] Kernel panic - not syncing: Attempted to kill init! exitcode=
=3D0x0000000b
(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.

--nextPart6521316.E0xQCEvomI--




