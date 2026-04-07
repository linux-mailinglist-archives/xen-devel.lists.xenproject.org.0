Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NiBFFki1WnK1AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 17:27:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797323B0F67
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 17:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275124.1561089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA8KX-0006Qb-08; Tue, 07 Apr 2026 15:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275124.1561089; Tue, 07 Apr 2026 15:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA8KW-0006OL-SE; Tue, 07 Apr 2026 15:27:04 +0000
Received: by outflank-mailman (input) for mailman id 1275124;
 Tue, 07 Apr 2026 15:27:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kroupa.matyas@gmail.com>) id 1wA8KV-0006OF-0i
 for xen-devel@lists.xen.org; Tue, 07 Apr 2026 15:27:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA8KT-00CbUr-Sf
 for xen-devel@lists.xen.org; Tue, 07 Apr 2026 17:27:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kroupa.matyas@gmail.com>)
 id 69d5222d-e002-0a2a0a5209dd-0a2a4507e1fa-20
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 17:27:01 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <kroupa.matyas@gmail.com>)
 id 69d52245-ba2d-0a2a45070019-d155802db824-3
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 17:27:01 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so36759795e9.2
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 08:27:01 -0700 (PDT)
Received: from rivendell.hailstone.cz ([2001:718:801:311:4701:d1d5:7bfd:a254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488bfc31418sm96097705e9.3.2026.04.07.08.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 08:27:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775575621; x=1776180421; darn=lists.xen.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHPScCRJGZQUSpb7kpMIaL4SJh1cfTTzVvA9I+0J7iM=;
        b=fPJM0m0OVVqERYThndq/3FIM7v/GC6FFis/3dBPVs4rywEXygHpTpi5tBpyxRqnvnO
         Jb5VSVofd2LQFijPKTEVcp70lC66l6DUSLZ1qoveDkPND9rG9SPAq02PS/EavpxqZ7FG
         uz5T61f94nju7Qt1B8i5LNW1YrkvMoQmL5TWDXd4SWxp2+6MkudLEMi9+XJSbMkWR5Hs
         WtATjCoeFma2xWRIu0NdxPatjMjInTF2CdXfB6623vCK5yAxyhTL8wZClquGVcbt1X96
         FjtbmhkKqAFKWccwiSOeLY10LBaU33ICQFbO/qQ2uKh4k/lEFsK2kbTBiv/2Hx2tcoYx
         hoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575621; x=1776180421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IHPScCRJGZQUSpb7kpMIaL4SJh1cfTTzVvA9I+0J7iM=;
        b=WwSym/yLO8VeeqqWXFwAOj3p/SFnrIdHAVDMssJSofVTIKKed+VHglUm2vtxLau+ok
         aGWo5hHuzRAp6Lnm/kKIiIeFyowZeaPkG4424fnpTS5hEFR4m4+sueFYIBsJ9MfwUMqp
         39TWv47jFyfutO14cjeFNAla8HVvYH3346Qr6YIZoKepVdM9jpHcgtFaDYflF93oR+LL
         CjPWBzqvB5ItW6IgvvvjmZVQEmNBiHdFH5lHee+2cXu/9/vugxYPyCjrZp8fkxdHwDnT
         x1m5fUU3q6caH57gupaHie14IWmoGUfYG6OiRpjmgpymponCvXBMMy4Ja1OTv3zjxn5V
         CoLA==
X-Gm-Message-State: AOJu0YzXV5u+eWMXN6y9jdz0rOjmTOpoP3wgYBrgb8f9tFXxkTRtD37j
	Z+rUV31EJwZbLdCWv7v5dLxLBeYx8+JO614ITyyq01/UJMEPrJtA8GOw
X-Gm-Gg: AeBDietabWnXCm1oF4eXAcrdZeaeVeANsrN7XeW2jLSfSffrBwZFZp1b7Xi0iVUAOBq
	nKLJrJn3oZ8XjFX5pvb1oIBB72VhaBQKj/TmSddGHidzbDqAZGqz8x2i5QpdorLjln4gan0jXbX
	Ka5fvKvcnKQx1rLrqTtfeWnvr6dDfieHITFlbMXI8plUzHJdZZTy9L74A2iDLG23K9Bo90de0e2
	50tc1uzaHF/ccmcrD2I9L8KDAb8JP5a2PoQCHB9PrSBTWwZa9GSe3xl2e9yGnR2yJOwRpVZ2I/c
	cfwPQevPFnopKeKpZNOa1BenInnmP2cykIIsnc6rYxccFnYhjR8whVQ6YVJrIWHi+0bQKSI6U1P
	C+kSsYtAa/38PA50G9UCrgxPdUUht5wPHGyyCHbm18URSGbm7nSmZhUzDyASeKaPO3jQfLfEf+g
	jhVHcchJjZ7eSxiCi4nO0Qwyskdw1cxKEE77+vK8D7xx1A1zb+XH4kJA==
X-Received: by 2002:a05:600c:4f0d:b0:488:b187:d898 with SMTP id 5b1f17b1804b1-488b187d996mr117484875e9.14.1775575620942;
        Tue, 07 Apr 2026 08:27:00 -0700 (PDT)
From: =?UTF-8?B?TWF0ecOhxaE=?= Kroupa <kroupa.matyas@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: Xen on Zen 3
Date: Tue, 07 Apr 2026 17:26:59 +0200
Message-ID: <3426323.0QQBjFxQff@rivendell.hailstone.cz>
In-Reply-To: <e9c1f232-e81e-4202-8550-6fd3afeab206@suse.com>
References:
 <5490687.niJfEyVGOH@rivendell.hailstone.cz>
 <4454038.v2OnDr8pfo@rivendell.hailstone.cz>
 <e9c1f232-e81e-4202-8550-6fd3afeab206@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart24824718.vTCxPXJkl2"
Content-Transfer-Encoding: 7Bit
X-purgate-ID: tlsNG-ef75cf/1775575621-83B4041E-2C8F7BFC/0/0
X-purgate-type: clean
X-purgate-size: 51764
X-Spamd-Result: default: False [0.56 / 15.00];
	R_MIXED_CHARSET(1.25)[subject];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xen.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[kroupamatyas@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,rivendell.hailstone.cz:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xen.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kroupamatyas@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 797323B0F67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.

--nextPart24824718.vTCxPXJkl2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

> I'd guess the value to be 1, but there
> being multiple nodes at the same time. You may want to instrument the
> function a little more to be certain.

I managed to get the dyndbg working and you were right, there is 1 root dev=
ice, 2 max logical packages and 1 node per package. I have searched how lin=
ux gets the number of max logical packages and it seems to have something t=
o with the bitmap weight of the package-domain APIC map. Those are probably=
 different on bare metal and Xen.

Last time I forgot to attach logs, this time I put that right now.

Maty=C3=A1=C5=A1 Kroupa
--nextPart24824718.vTCxPXJkl2
Content-Disposition: attachment;
 filename="xen-4.21.1-linux-6.19.10-dyndbg.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8";
 name="xen-4.21.1-linux-6.19.10-dyndbg.txt"

Loading Xen 4.21.1 ...
Loading Linux 6.19.10-200.fc43.x86_64 ...
Loading initial ramdisk ...
Xen 4.21.1
(XEN) Xen version 4.21.1 (mockbuild@) (gcc (GCC) 15.2.1 20260123 (Red Hat 15.2.1-7)) debug=n Mon Apr  6 00:00:00 UTC 2026
(XEN) Latest ChangeSet: 
(XEN) build-id: 11ab961ff2580581f074fd57a1954e7cea23875c
(XEN) CPU Vendor: AMD, Family 25 (0x19), Model 33 (0x21), Stepping 2 (raw 00a20f12)
(XEN) BSP microcode revision: 0x0a201213
(XEN) Bootloader: GRUB 2.12
(XEN) Command line: placeholder dom0=pvh dom0_mem=36G com1=115200,8n1 console=com1,vga no-real-mode edd=off
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
(XEN) vesafb: framebuffer at 0x000000f800000000, mapped to 0xffff82c000203000, using 8128k, total 8128k
(XEN) vesafb: mode is 1920x1080x32, linelength=7680, font 8x16
(XEN) vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
(XEN) SMBIOS 3.3 present.
(XEN) PCI: MCFG configuration 0: base f0000000 segment 0000 buses 00 - 7f
(XEN) PCI: MCFG area at f0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-7f
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x808 (32 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - bd060000/0000000000000000, using 32
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
(XEN)   Compiled-in support: INDIRECT_THUNK RETURN_THUNK SHADOW_PAGING HARDEN_ARRAY HARDEN_BRANCH HARDEN_GUEST_ACCESS HARDEN_LOCK
(XEN)   Xen settings: BTI-Thunk: JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD- PSFD-, Other: VERW BRANCH_HARDEN
(XEN)   Support for HVM VMs: MSR_SPEC_CTRL MSR_VIRT_SPEC_CTRL RSB VERW IBPB-entry
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
(XEN) Detected 3393.640 MHz processor.
(XEN) Freed 1008kB unused BSS memory
(XEN) alt table ffff82d04049bfb8 -> ffff82d0404b328e
(XEN) AMD-Vi: IOMMU 0 Enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) Enabling APIC mode.  Using 2 I/O APICs
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) Wallclock source: CMOS RTC
(XEN) Defaulting to alternative key handling; send 'A' to switch to normal mode.
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
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.7 by American Megatrends
[    0.000000] efi: ACPI=0xbd066000 ACPI 2.0=0xbd066014 TPMFinalLog=0xbd030000 SMBIOS=0xbda22000 SMBIOS 3.0=0xbda21000 (MEMATTR=0xb753c018 unusable) ESRT=0xbc954018 MOKvar=0xbda6d000 
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.3.0 present.
[    0.000000] DMI: To Be Filled By O.E.M. B450M Steel Legend/B450M Steel Legend, BIOS P10.43 06/25/2025
[    0.000000] DMI: Memory slots populated: 4/4
[    0.000000] Hypervisor detected: Xen HVM
[    0.000000] Xen version 4.21.
[    0.000003] HVMOP_pagetable_dying not supported
[    0.065007] tsc: Fast TSC calibration failed
[    0.065023] tsc: Detected 3393.640 MHz processor
[    0.065189] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.065193] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.065204] last_pfn = 0xc3f300 max_arch_pfn = 0x400000000
[    0.065232] MTRR map: 5 entries (4 fixed + 1 variable; max 21), built from 9 variable MTRRs
[    0.065236] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.066982] CPU MTRRs all blank - virtualized system.
[    0.066996] last_pfn = 0xbefff max_arch_pfn = 0x400000000
[    0.070252] esrt: Reserving ESRT space from 0x00000000bc954018 to 0x00000000bc954050.
[    0.070259] Using GB pages for direct mapping
[    0.071080] secureboot: Secure boot disabled
[    0.071083] RAMDISK: [mem 0x05600000-0x0872ffff]
[    0.071090] ACPI: Early table checksum verification disabled
[    0.071095] ACPI: RSDP 0x00000000BEFFFD00 000024 (v02 ALASKA)
[    0.071100] ACPI: XSDT 0x00000000BEFFFD24 000084 (v01 ALASKA A M I    01072009 AMI  01000013)
[    0.071107] ACPI: APIC 0x00000000BEFFFDA8 000258 (v03 ALASKA A M I    01072009 AMI  00010013)
[    0.071113] ACPI: FACP 0x00000000BC97A000 000114 (v06 ALASKA A M I    01072009 AMI  00010013)
[    0.071156] ACPI: DSDT 0x00000000BC973000 0060DA (v02 ALASKA A M I    01072009 INTL 20120913)
[    0.071161] ACPI: FACS 0x00000000BD060000 000040
[    0.071166] ACPI: SSDT 0x00000000BC980000 008CE9 (v02 AMD    AmdTable 00000002 MSFT 04000000)
[    0.071171] ACPI: SSDT 0x00000000BC97C000 003CB6 (v02 AMD    AMD AOD  00000001 INTL 20120913)
[    0.071176] ACPI: SSDT 0x00000000BC97B000 0001CC (v02 ALASKA CPUSSDT  01072009 AMI  01072009)
[    0.071182] ACPI: MCFG 0x00000000BC971000 00003C (v01 ALASKA A M I    01072009 MSFT 00010013)
[    0.071187] ACPI: TPM2 0x00000000BC96C000 00004C (v04 ALASKA A M I    00000001 AMI  00000000)
[    0.071192] ACPI: SSDT 0x00000000BC962000 008033 (v02 AMD    AmdTable 00000001 AMD  00000001)
[    0.071197] ACPI: SSDT 0x00000000BC95B000 0037C4 (v02 AMD    MYRTLE   00000001 INTL 20120913)
[    0.071203] ACPI: SSDT 0x00000000BC95A000 0000BF (v01 AMD    AmdTable 00001000 INTL 20120913)
[    0.071208] ACPI: SSDT 0x00000000BC956000 0010AF (v02 AMD    MYRTLE   00000001 INTL 20120913)
[    0.071213] ACPI: FPDT 0x00000000BC955000 000044 (v01 ALASKA A M I    01072009 AMI  01000013)
[    0.071217] ACPI: Reserving APIC table memory at [mem 0xbefffda8-0xbeffffff]
[    0.071220] ACPI: Reserving FACP table memory at [mem 0xbc97a000-0xbc97a113]
[    0.071222] ACPI: Reserving DSDT table memory at [mem 0xbc973000-0xbc9790d9]
[    0.071225] ACPI: Reserving FACS table memory at [mem 0xbd060000-0xbd06003f]
[    0.071227] ACPI: Reserving SSDT table memory at [mem 0xbc980000-0xbc988ce8]
[    0.071229] ACPI: Reserving SSDT table memory at [mem 0xbc97c000-0xbc97fcb5]
[    0.071232] ACPI: Reserving SSDT table memory at [mem 0xbc97b000-0xbc97b1cb]
[    0.071234] ACPI: Reserving MCFG table memory at [mem 0xbc971000-0xbc97103b]
[    0.071236] ACPI: Reserving TPM2 table memory at [mem 0xbc96c000-0xbc96c04b]
[    0.071239] ACPI: Reserving SSDT table memory at [mem 0xbc962000-0xbc96a032]
[    0.071241] ACPI: Reserving SSDT table memory at [mem 0xbc95b000-0xbc95e7c3]
[    0.071243] ACPI: Reserving SSDT table memory at [mem 0xbc95a000-0xbc95a0be]
[    0.071246] ACPI: Reserving SSDT table memory at [mem 0xbc956000-0xbc9570ae]
[    0.071248] ACPI: Reserving FPDT table memory at [mem 0xbc955000-0xbc955043]
[    0.071454] No NUMA configuration found
[    0.071457] Faking a node at [mem 0x0000000000000000-0x0000000c3f2fffff]
[    0.071468] NODE_DATA(0) allocated [mem 0x943f27280-0x943f51fff]
[    0.071657] Zone ranges:
[    0.071659]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.071662]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.071665]   Normal   [mem 0x0000000100000000-0x0000000c3f2fffff]
[    0.071668]   Device   empty
[    0.071671] Movable zone start for each node
[    0.071674] Early memory node ranges
[    0.071676]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.071679]   node   0: [mem 0x0000000000100000-0x0000000009bfefff]
[    0.071682]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    0.071684]   node   0: [mem 0x000000000a20e000-0x000000000affffff]
[    0.071686]   node   0: [mem 0x000000000b020000-0x00000000bb13afff]
[    0.071689]   node   0: [mem 0x00000000bdbff000-0x00000000beffefff]
[    0.071691]   node   0: [mem 0x0000000100000000-0x0000000c3f2fffff]
[    0.071698] Initmem setup node 0 [mem 0x0000000000001000-0x0000000c3f2fffff]
[    0.071704] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.071722] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.071858] On node 0, zone DMA32: 1025 pages in unavailable ranges
[    0.071873] On node 0, zone DMA32: 14 pages in unavailable ranges
[    0.075072] On node 0, zone DMA32: 32 pages in unavailable ranges
[    0.075202] On node 0, zone DMA32: 10948 pages in unavailable ranges
[    0.145002] On node 0, zone Normal: 4097 pages in unavailable ranges
[    0.145037] On node 0, zone Normal: 3328 pages in unavailable ranges
[    0.146328] ACPI: PM-Timer IO Port: 0x808
[    0.146374] IOAPIC[0]: apic_id 33, version 17, address 0xfec00000, GSI 0-23
[    0.146398] IOAPIC[1]: apic_id 34, version 17, address 0xfec01000, GSI 24-55
[    0.146402] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.146405] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.146410] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.146419] CPU topo: Max. logical packages:   2
[    0.146421] CPU topo: Max. logical nodes:      1
[    0.146424] CPU topo: Num. nodes per package:  1
[    0.146430] CPU topo: Max. logical dies:       2
[    0.146433] CPU topo: Max. dies per package:   1
[    0.146444] CPU topo: Max. threads per core:   1
[    0.146447] CPU topo: Num. cores per package:    16
[    0.146449] CPU topo: Num. threads per package:  16
[    0.146452] CPU topo: Allowing 32 present CPUs plus 0 hotplug CPUs
[    0.146478] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.146481] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.146485] PM: hibernation: Registered nosave memory: [mem 0x09bff000-0x09ffffff]
[    0.146488] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0x0a20dfff]
[    0.146491] PM: hibernation: Registered nosave memory: [mem 0x0b000000-0x0b01ffff]
[    0.146494] PM: hibernation: Registered nosave memory: [mem 0xbb13b000-0xbdbfefff]
[    0.146497] PM: hibernation: Registered nosave memory: [mem 0xbefff000-0xffffffff]
[    0.146501] [mem 0xc0000000-0xefffffff] available for PCI devices
[    0.146507] Booting kernel on Xen PVH
[    0.146510] Xen version: 4.21.1
[    0.146514] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.151561] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:32 nr_cpu_ids:32 nr_node_ids:1
[    0.153193] percpu: Embedded 84 pages/cpu s221184 r8192 d114688 u524288
[    0.153201] pcpu-alloc: s221184 r8192 d114688 u524288 alloc=1*2097152
[    0.153205] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07 
[    0.153212] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15 
[    0.153219] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 22 23 
[    0.153225] pcpu-alloc: [0] 24 25 26 27 [0] 28 29 30 31 
[    0.153252] xen: PV spinlocks enabled
[    0.153256] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.153260] Kernel command line: placeholder root=UUID=5a7af636-54c3-4f76-a164-c1138de257ad ro rootflags=subvol=@ rhgb quiet console=hvc0 earlyprintk=xen loglevel=8 "dyndbg=file amd_node.c +p"
[    0.153350] Unknown kernel command line parameters "placeholder rhgb", will be passed to user space.
[    0.153368] random: crng init done
[    0.153371] printk: log buffer data + meta data: 262144 + 917504 = 1179648 bytes
[    0.159204] Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes, linear)
[    0.162209] Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.162306] software IO TLB: area num 32.
[    0.173962] Fallback order for Node 0: 0 
[    0.173969] Built 1 zonelists, mobility grouping on.  Total pages: 12563371
[    0.173975] Policy zone: Normal
[    0.174203] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.269440] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
Poking KASLR using RDRAND RDTSC...
[    0.280270] ftrace: allocating 63414 entries in 248 pages
[    0.280275] ftrace: allocated 248 pages with 5 groups
[    0.280866] Dynamic Preempt: lazy
[    0.280976] rcu: Preemptible hierarchical RCU implementation.
[    0.280978] rcu: 	RCU event tracing is enabled.
[    0.280981] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=32.
[    0.280984] 	Trampoline variant of Tasks RCU enabled.
[    0.280986] 	Rude variant of Tasks RCU enabled.
[    0.280988] 	Tracing variant of Tasks RCU enabled.
[    0.280990] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.280993] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=32
[    0.281011] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=32.
[    0.281015] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=32.
[    0.281019] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=32.
[    0.284778] Using NULL legacy PIC
[    0.284781] NR_IRQS: 524544, nr_irqs: 1224, preallocated irqs: 0
[    0.285120] xen:events: Using FIFO-based ABI
[    0.285131] xen:events: Xen HVM callback vector for event delivery is enabled
[    0.285177] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.285270] kfence: initialized - using 2097152 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
[    0.285337] Console: colour dummy device 80x25
[    0.285342] printk: legacy console [tty0] enabled
[    0.285541] printk: legacy console [hvc0] enabled
[    0.285541] printk: legacy console [hvc0] enabled
[    0.285550] printk: legacy bootconsole [xenboot0] disabled
[    0.285550] printk: legacy bootconsole [xenboot0] disabled
[    0.285583] ACPI: Core revision 20250807
[    0.300833] Failed to register legacy timer interrupt
[    0.300840] APIC: Switch to symmetric I/O mode setup
[    0.301293] x2apic enabled
[    0.301817] APIC: Switched APIC routing to: physical x2apic
[    0.301895] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x30ead6a4c9c, max_idle_ns: 440795297796 ns
[    0.301912] Calibrating delay loop (skipped), value calculated using timer frequency.. 6787.28 BogoMIPS (lpj=3393640)
[    0.301985] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.302017] Last level iTLB entries: 4KB 512, 2MB 512, 4MB 256
[    0.302025] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
[    0.302038] mitigations: Enabled attack vectors: user_kernel, user_user, guest_host, guest_guest, SMT mitigations: auto
[    0.302052] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.302063] Transient Scheduler Attacks: Mitigation: Clear CPU buffers
[    0.302071] Spectre V2 : Mitigation: Retpolines
[    0.302077] Speculative Return Stack Overflow: Mitigation: Safe RET
[    0.302085] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.302096] Spectre V2 : Spectre v2 / SpectreRSB: Filling RSB on context switch and VMEXIT
[    0.302105] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.302113] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.302124] active return thunk: srso_alias_return_thunk
[    0.302146] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.302155] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.302163] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.302170] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
[    0.302179] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.302187] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.302195] x86/fpu: Enabled xstate features 0x207, context size is 840 bytes, using 'compacted' format.
[    0.302910] Freeing SMP alternatives memory: 56K
[    0.302910] pid_max: default: 32768 minimum: 301
[    0.302910] Yama: becoming mindful.
[    0.302910] SELinux:  Initializing.
[    0.302910] LSM support for eBPF active
[    0.302910] landlock: Up and running.
[    0.302910] Mount-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.302910] Mountpoint-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.302910] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.302910] Xen: using vcpuop timer interface
[    0.302910] installing Xen timer for CPU 0
[    0.302910] smpboot: CPU0: AMD Ryzen 9 5950X 16-Core Processor (family: 0x19, model: 0x21, stepping: 0x2)
[    0.302910] cpu 0 spinlock event irq 28
[    0.302910] Performance Events: PMU not available due to virtualization, using software events only.
[    0.302910] signal: max sigframe size: 3376
[    0.302910] rcu: Hierarchical SRCU implementation.
[    0.302910] rcu: 	Max phase no-delay instances is 400.
[    0.302910] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
[    0.359391] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.359660] smp: Bringing up secondary CPUs ...
[    0.359824] installing Xen timer for CPU 1
[    0.359889] smpboot: x86: Booting SMP configuration:
[    0.359898] .... node  #0, CPUs:        #1
[    0.361128] installing Xen timer for CPU 2
[    0.361219]   #2
[    0.361608] installing Xen timer for CPU 3
[    0.361689]   #3
[    0.362112] installing Xen timer for CPU 4
[    0.362189]   #4
[    0.362581] installing Xen timer for CPU 5
[    0.362663]   #5
[    0.363109] installing Xen timer for CPU 6
[    0.363202]   #6
[    0.363612] installing Xen timer for CPU 7
[    0.363702]   #7
[    0.364123] installing Xen timer for CPU 8
[    0.364203]   #8
[    0.364545] installing Xen timer for CPU 9
[    0.364631]   #9
[    0.364997] installing Xen timer for CPU 10
[    0.365084]  #10
[    0.365451] installing Xen timer for CPU 11
[    0.365531]  #11
[    0.365955] installing Xen timer for CPU 12
[    0.366062]  #12
[    0.366407] installing Xen timer for CPU 13
[    0.366482]  #13
[    0.366832] installing Xen timer for CPU 14
[    0.366932]  #14
[    0.367308] installing Xen timer for CPU 15
[    0.367407]  #15
[    0.367802] installing Xen timer for CPU 16
[    0.367890]  #16
[    0.368283] installing Xen timer for CPU 17
[    0.368384]  #17
[    0.368846] installing Xen timer for CPU 18
[    0.368978]  #18
[    0.369408] installing Xen timer for CPU 19
[    0.369519]  #19
[    0.369991] installing Xen timer for CPU 20
[    0.370110]  #20
[    0.370551] installing Xen timer for CPU 21
[    0.370680]  #21
[    0.371143] installing Xen timer for CPU 22
[    0.371256]  #22
[    0.371695] installing Xen timer for CPU 23
[    0.371812]  #23
[    0.372261] installing Xen timer for CPU 24
[    0.372383]  #24
[    0.372818] installing Xen timer for CPU 25
[    0.372940]  #25
[    0.373402] installing Xen timer for CPU 26
[    0.373515]  #26
[    0.373950] installing Xen timer for CPU 27
[    0.374077]  #27
[    0.374519] installing Xen timer for CPU 28
[    0.374635]  #28
[    0.375078] installing Xen timer for CPU 29
[    0.375194]  #29
[    0.375586] installing Xen timer for CPU 30
[    0.375688]  #30
[    0.376132] installing Xen timer for CPU 31
[    0.376246]  #31
[    0.377089] cpu 1 spinlock event irq 153
[    0.378076] cpu 2 spinlock event irq 154
[    0.379031] cpu 3 spinlock event irq 155
[    0.380017] cpu 4 spinlock event irq 156
[    0.381042] cpu 5 spinlock event irq 157
[    0.382021] cpu 6 spinlock event irq 158
[    0.383039] cpu 7 spinlock event irq 159
[    0.384023] cpu 8 spinlock event irq 160
[    0.385038] cpu 9 spinlock event irq 161
[    0.386022] cpu 10 spinlock event irq 162
[    0.387040] cpu 11 spinlock event irq 163
[    0.388023] cpu 12 spinlock event irq 164
[    0.389025] cpu 13 spinlock event irq 165
[    0.390037] cpu 14 spinlock event irq 166
[    0.391026] cpu 15 spinlock event irq 167
[    0.392013] cpu 16 spinlock event irq 168
[    0.393005] cpu 17 spinlock event irq 169
[    0.394031] cpu 18 spinlock event irq 170
[    0.395005] cpu 19 spinlock event irq 171
[    0.396017] cpu 20 spinlock event irq 172
[    0.397005] cpu 21 spinlock event irq 173
[    0.398001] cpu 22 spinlock event irq 174
[    0.399005] cpu 23 spinlock event irq 175
[    0.400003] cpu 24 spinlock event irq 176
[    0.401003] cpu 25 spinlock event irq 177
[    0.402003] cpu 26 spinlock event irq 178
[    0.403003] cpu 27 spinlock event irq 179
[    0.404002] cpu 28 spinlock event irq 180
[    0.404993] cpu 29 spinlock event irq 181
[    0.406017] cpu 30 spinlock event irq 182
[    0.406993] cpu 31 spinlock event irq 183
[    0.407207] smp: Brought up 1 node, 32 CPUs
[    0.407220] smpboot: Total of 32 processors activated (217192.96 BogoMIPS)
[    0.408613] Memory: 36627636K/50253484K available (22589K kernel code, 4588K rwdata, 17848K rodata, 5196K init, 5796K bss, 13585756K reserved, 0K cma-reserved)
[    0.409528] devtmpfs: initialized
[    0.409599] x86/mm: Memory block size: 128MB
[    0.415459] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20dfff] (57344 bytes)
[    0.415459] ACPI: PM: Registering ACPI NVS region [mem 0xbc989000-0xbd07cfff] (7290880 bytes)
[    0.415921] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.415972] posixtimers hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.416023] futex hash table entries: 8192 (524288 bytes on 1 NUMA nodes, total 512 KiB, linear).
[    0.416270] PM: RTC time: 11:42:23, date: 2026-04-07
[    0.417104] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.417135] xen:grant_table: Grant tables using version 1 layout
[    0.417163] Grant table initialized
[    0.418162] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.418336] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.418516] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.418539] audit: initializing netlink subsys (disabled)
[    0.418583] audit: type=2000 audit(1775562143.863:1): state=initialized audit_enabled=0 res=1
[    0.418583] thermal_sys: Registered thermal governor 'fair_share'
[    0.418583] thermal_sys: Registered thermal governor 'bang_bang'
[    0.418583] thermal_sys: Registered thermal governor 'step_wise'
[    0.418583] thermal_sys: Registered thermal governor 'user_space'
[    0.420010] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.420517] PCI: ECAM [mem 0xf0000000-0xf7ffffff] (base 0xf0000000) for domain 0000 [bus 00-7f]
[    0.420543] PCI: Using configuration type 1 for base access
[    0.420736] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.421021] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.421034] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.421045] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.421055] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.435710] raid6: skipped pq benchmark and selected avx2x4
[    0.435722] raid6: using avx2x2 recovery algorithm
[    0.435806] fbcon: Taking over console
[    0.435847] ACPI: Added _OSI(Module Device)
[    0.435855] ACPI: Added _OSI(Processor Device)
[    0.435864] ACPI: Added _OSI(Processor Aggregator Device)
[    0.465547] ACPI: 8 ACPI AML tables successfully acquired and loaded
[    0.468587] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.476748] ACPI: Interpreter enabled
[    0.476776] ACPI: PM: (supports S0 S3 S4 S5)
[    0.476786] ACPI: Using IOAPIC for interrupt routing
[    0.478526] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.478541] PCI: Ignoring E820 reservations for host bridge windows
[    0.479180] ACPI: Enabled 3 GPEs in block 00 to 1F
[    0.499677] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.499694] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.499860] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug LTR DPC]
[    0.500156] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
[    0.500180] acpi PNP0A08:00: [Firmware Info]: ECAM [mem 0xf0000000-0xf7ffffff] for domain 0000 [bus 00-7f] only partially covers this bridge
[    0.500927] PCI host bridge to bus 0000:00
[    0.500954] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    0.500966] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    0.500977] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    0.500988] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.500999] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dffff window]
[    0.501013] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfcffffff window]
[    0.501026] pci_bus 0000:00: root bus resource [mem 0xc40000000-0xffffffffff window]
[    0.501039] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.501081] pci 0000:00:00.0: [1022:1480] type 00 class 0x060000 conventional PCI endpoint
[    0.501399] pci 0000:00:00.2: [1022:1481] type 00 class 0x080600 conventional PCI endpoint
[    0.501681] pci 0000:00:01.0: [1022:1482] type 00 class 0x060000 conventional PCI endpoint
[    0.501909] pci 0000:00:01.1: [1022:1483] type 01 class 0x060400 PCIe Root Port
[    0.501975] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.502000] pci 0000:00:01.1:   bridge window [mem 0xfcc00000-0xfccfffff]
[    0.502219] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    0.502623] pci 0000:00:01.3: [1022:1483] type 01 class 0x060400 PCIe Root Port
[    0.502690] pci 0000:00:01.3: PCI bridge to [bus 02-06]
[    0.502710] pci 0000:00:01.3:   bridge window [io  0xe000-0xffff]
[    0.502725] pci 0000:00:01.3:   bridge window [mem 0xfc500000-0xfc8fffff]
[    0.502777] pci 0000:00:01.3: enabling Extended Tags
[    0.502950] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
[    0.503357] pci 0000:00:02.0: [1022:1482] type 00 class 0x060000 conventional PCI endpoint
[    0.503577] pci 0000:00:03.0: [1022:1482] type 00 class 0x060000 conventional PCI endpoint
[    0.503812] pci 0000:00:03.1: [1022:1483] type 01 class 0x060400 PCIe Root Port
[    0.503886] pci 0000:00:03.1: PCI bridge to [bus 07-0a]
[    0.503914] pci 0000:00:03.1:   bridge window [mem 0xfb000000-0xfc3fffff]
[    0.503947] pci 0000:00:03.1:   bridge window [mem 0xf800000000-0xfc007fffff 64bit pref]
[    0.504165] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.504567] pci 0000:00:04.0: [1022:1482] type 00 class 0x060000 conventional PCI endpoint
[    0.504785] pci 0000:00:05.0: [1022:1482] type 00 class 0x060000 conventional PCI endpoint
[    0.505009] pci 0000:00:07.0: [1022:1482] type 00 class 0x060000 conventional PCI endpoint
[    0.505243] pci 0000:00:07.1: [1022:1484] type 01 class 0x060400 PCIe Root Port
[    0.505310] pci 0000:00:07.1: PCI bridge to [bus 0b]
[    0.505372] pci 0000:00:07.1: enabling Extended Tags
[    0.505551] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.505939] pci 0000:00:08.0: [1022:1482] type 00 class 0x060000 conventional PCI endpoint
[    0.506169] pci 0000:00:08.1: [1022:1484] type 01 class 0x060400 PCIe Root Port
[    0.506235] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    0.506259] pci 0000:00:08.1:   bridge window [mem 0xfc900000-0xfcbfffff]
[    0.506308] pci 0000:00:08.1: enabling Extended Tags
[    0.506493] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.506909] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 conventional PCI endpoint
[    0.507154] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 conventional PCI endpoint
[    0.507428] pci 0000:00:18.0: [1022:1440] type 00 class 0x060000 conventional PCI endpoint
[    0.507606] pci 0000:00:18.1: [1022:1441] type 00 class 0x060000 conventional PCI endpoint
[    0.507782] pci 0000:00:18.2: [1022:1442] type 00 class 0x060000 conventional PCI endpoint
[    0.508000] pci 0000:00:18.3: [1022:1443] type 00 class 0x060000 conventional PCI endpoint
[    0.508181] pci 0000:00:18.4: [1022:1444] type 00 class 0x060000 conventional PCI endpoint
[    0.508362] pci 0000:00:18.5: [1022:1445] type 00 class 0x060000 conventional PCI endpoint
[    0.508538] pci 0000:00:18.6: [1022:1446] type 00 class 0x060000 conventional PCI endpoint
[    0.508715] pci 0000:00:18.7: [1022:1447] type 00 class 0x060000 conventional PCI endpoint
[    0.509189] pci 0000:01:00.0: [1987:5012] type 00 class 0x010802 PCIe Endpoint
[    0.509919] pci 0000:01:00.0: BAR 0 [mem 0xfcc00000-0xfcc03fff 64bit]
[    0.511735] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.511910] pci 0000:02:00.0: [1022:43d5] type 00 class 0x0c0330 PCIe Legacy Endpoint
[    0.512102] pci 0000:02:00.0: BAR 0 [mem 0xfc8a0000-0xfc8a7fff 64bit]
[    0.512141] pci 0000:02:00.0: enabling Extended Tags
[    0.512301] pci 0000:02:00.0: PME# supported from D3hot D3cold
[    0.512670] pci 0000:02:00.1: [1022:43c8] type 00 class 0x010601 PCIe Legacy Endpoint
[    0.513061] pci 0000:02:00.1: BAR 5 [mem 0xfc880000-0xfc89ffff]
[    0.513075] pci 0000:02:00.1: ROM [mem 0xfc800000-0xfc87ffff pref]
[    0.513101] pci 0000:02:00.1: enabling Extended Tags
[    0.513216] pci 0000:02:00.1: PME# supported from D3hot D3cold
[    0.513476] pci 0000:02:00.2: [1022:43c6] type 01 class 0x060400 PCIe Switch Upstream Port
[    0.513554] pci 0000:02:00.2: PCI bridge to [bus 03-06]
[    0.513575] pci 0000:02:00.2:   bridge window [io  0xe000-0xffff]
[    0.513591] pci 0000:02:00.2:   bridge window [mem 0xfc500000-0xfc7fffff]
[    0.513652] pci 0000:02:00.2: enabling Extended Tags
[    0.513768] pci 0000:02:00.2: PME# supported from D3hot D3cold
[    0.514074] pci 0000:00:01.3: PCI bridge to [bus 02-06]
[    0.514295] pci 0000:03:00.0: [1022:43c7] type 01 class 0x060400 PCIe Switch Downstream Port
[    0.514376] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.514456] pci 0000:03:00.0: enabling Extended Tags
[    0.514605] pci 0000:03:00.0: PME# supported from D3hot D3cold
[    0.514900] pci 0000:03:01.0: [1022:43c7] type 01 class 0x060400 PCIe Switch Downstream Port
[    0.514983] pci 0000:03:01.0: PCI bridge to [bus 05]
[    0.515006] pci 0000:03:01.0:   bridge window [io  0xf000-0xffff]
[    0.515022] pci 0000:03:01.0:   bridge window [mem 0xfc700000-0xfc7fffff]
[    0.515088] pci 0000:03:01.0: enabling Extended Tags
[    0.515240] pci 0000:03:01.0: PME# supported from D3hot D3cold
[    0.515537] pci 0000:03:04.0: [1022:43c7] type 01 class 0x060400 PCIe Switch Downstream Port
[    0.515617] pci 0000:03:04.0: PCI bridge to [bus 06]
[    0.515638] pci 0000:03:04.0:   bridge window [io  0xe000-0xefff]
[    0.515654] pci 0000:03:04.0:   bridge window [mem 0xfc500000-0xfc6fffff]
[    0.515719] pci 0000:03:04.0: enabling Extended Tags
[    0.515867] pci 0000:03:04.0: PME# supported from D3hot D3cold
[    0.516190] pci 0000:02:00.2: PCI bridge to [bus 03-06]
[    0.516310] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.516483] pci 0000:05:00.0: [10ec:8168] type 00 class 0x020000 PCIe Endpoint
[    0.516699] pci 0000:05:00.0: BAR 0 [io  0xf000-0xf0ff]
[    0.516725] pci 0000:05:00.0: BAR 2 [mem 0xfc704000-0xfc704fff 64bit]
[    0.516747] pci 0000:05:00.0: BAR 4 [mem 0xfc700000-0xfc703fff 64bit]
[    0.517016] pci 0000:05:00.0: supports D1 D2
[    0.517029] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.517537] pci 0000:03:01.0: PCI bridge to [bus 05]
[    0.517708] pci 0000:06:00.0: [1000:0087] type 00 class 0x010700 PCIe Endpoint
[    0.517828] pci 0000:06:00.0: BAR 0 [io  0xe000-0xe0ff]
[    0.517844] pci 0000:06:00.0: BAR 1 [mem 0xfc640000-0xfc64ffff 64bit]
[    0.517861] pci 0000:06:00.0: BAR 3 [mem 0xfc600000-0xfc63ffff 64bit]
[    0.517878] pci 0000:06:00.0: ROM [mem 0xfc500000-0xfc5fffff pref]
[    0.517906] pci 0000:06:00.0: enabling Extended Tags
[    0.518114] pci 0000:06:00.0: supports D1 D2
[    0.518302] pci 0000:06:00.0: 16.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x4 link at 0000:03:04.0 (capable of 63.008 Gb/s with 8.0 GT/s PCIe x8 link)
[    0.518473] pci 0000:03:04.0: PCI bridge to [bus 06]
[    0.518897] pci 0000:07:00.0: [8086:e2ff] type 01 class 0x060400 PCIe Switch Upstream Port
[    0.519217] pci 0000:07:00.0: BAR 0 [mem 0xfc00000000-0xfc007fffff 64bit pref]
[    0.519243] pci 0000:07:00.0: PCI bridge to [bus 08-0a]
[    0.519278] pci 0000:07:00.0:   bridge window [mem 0xfb000000-0xfc3fffff]
[    0.519321] pci 0000:07:00.0:   bridge window [mem 0xf800000000-0xfbffffffff 64bit pref]
[    0.519927] pci 0000:07:00.0: PME# supported from D0 D3hot D3cold
[    0.520607] pci 0000:07:00.0: 63.008 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x8 link at 0000:00:03.1 (capable of 252.056 Gb/s with 32.0 GT/s PCIe x8 link)
[    0.520986] pci 0000:00:03.1: PCI bridge to [bus 07-0a]
[    0.521316] pci 0000:08:01.0: [8086:e2f0] type 01 class 0x060400 PCIe Switch Downstream Port
[    0.521405] pci 0000:08:01.0: PCI bridge to [bus 09]
[    0.521429] pci 0000:08:01.0:   bridge window [mem 0xfb000000-0xfc1fffff]
[    0.521465] pci 0000:08:01.0:   bridge window [mem 0xf800000000-0xfbffffffff 64bit pref]
[    0.521630] pci 0000:08:01.0: PME# supported from D0 D3hot D3cold
[    0.521976] pci 0000:08:02.0: [8086:e2f1] type 01 class 0x060400 PCIe Switch Downstream Port
[    0.522073] pci 0000:08:02.0: PCI bridge to [bus 0a]
[    0.522099] pci 0000:08:02.0:   bridge window [mem 0xfc300000-0xfc3fffff]
[    0.522307] pci 0000:08:02.0: PME# supported from D0 D3hot D3cold
[    0.522787] pci 0000:07:00.0: PCI bridge to [bus 08-0a]
[    0.522956] pci 0000:09:00.0: [8086:e212] type 00 class 0x030000 PCIe Endpoint
[    0.596925] pci 0000:09:00.0: BAR 0 [mem 0xfb000000-0xfbffffff 64bit]
[    0.596945] pci 0000:09:00.0: BAR 2 [mem 0xf800000000-0xfbffffffff 64bit pref]
[    0.596967] pci 0000:09:00.0: ROM [mem 0xfc000000-0xfc1fffff pref]
[    0.597358] pci 0000:09:00.0: PME# supported from D0 D3hot
[    0.599097] pci 0000:08:01.0: PCI bridge to [bus 09]
[    0.599278] pci 0000:0a:00.0: [8086:e2f7] type 00 class 0x040300 PCIe Endpoint
[    0.599422] pci 0000:0a:00.0: BAR 0 [mem 0xfc300000-0xfc303fff 64bit]
[    0.599509] pci 0000:0a:00.0: PME# supported from D3hot D3cold
[    0.600261] pci 0000:08:02.0: PCI bridge to [bus 0a]
[    0.600499] pci 0000:0b:00.0: [1022:148a] type 00 class 0x130000 PCIe Endpoint
[    0.600607] pci 0000:0b:00.0: enabling Extended Tags
[    0.601172] pci 0000:00:07.1: PCI bridge to [bus 0b]
[    0.601336] pci 0000:0c:00.0: [1022:1485] type 00 class 0x130000 PCIe Endpoint
[    0.601445] pci 0000:0c:00.0: enabling Extended Tags
[    0.601954] pci 0000:0c:00.1: [1022:1486] type 00 class 0x108000 PCIe Endpoint
[    0.602047] pci 0000:0c:00.1: BAR 2 [mem 0xfca00000-0xfcafffff]
[    0.602064] pci 0000:0c:00.1: BAR 5 [mem 0xfcb08000-0xfcb09fff]
[    0.602090] pci 0000:0c:00.1: enabling Extended Tags
[    0.602541] pci 0000:0c:00.3: [1022:149c] type 00 class 0x0c0330 PCIe Endpoint
[    0.605219] pci 0000:0c:00.3: BAR 0 [mem 0xfc900000-0xfc9fffff 64bit]
[    0.605254] pci 0000:0c:00.3: enabling Extended Tags
[    0.605409] pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
[    0.605754] pci 0000:0c:00.4: [1022:1487] type 00 class 0x040300 PCIe Endpoint
[    0.605842] pci 0000:0c:00.4: BAR 0 [mem 0xfcb00000-0xfcb07fff]
[    0.605879] pci 0000:0c:00.4: enabling Extended Tags
[    0.606023] pci 0000:0c:00.4: PME# supported from D0 D3hot D3cold
[    0.606383] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    0.611478] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.611575] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    0.611657] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.611753] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.611844] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.611930] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.612006] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.612081] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.613305] xen:balloon: Initialising balloon driver
[    0.613928] iommu: Default domain type: Translated
[    0.613930] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.615031] SCSI subsystem initialized
[    0.615053] libata version 3.00 loaded.
[    0.615053] ACPI: bus type USB registered
[    0.615053] usbcore: registered new interface driver usbfs
[    0.615053] usbcore: registered new interface driver hub
[    0.615053] usbcore: registered new device driver usb
[    0.615053] pps_core: LinuxPPS API ver. 1 registered
[    0.615053] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.615053] PTP clock support registered
[    0.615053] EDAC MC: Ver: 3.0.0
[    0.615958] efivars: Registered efivars operations
[    0.616210] NetLabel: Initializing
[    0.616220] NetLabel:  domain hash size = 128
[    0.616229] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.616258] NetLabel:  unlabeled traffic allowed by default
[    0.616270] mctp: management component transport protocol core
[    0.616281] NET: Registered PF_MCTP protocol family
[    0.616302] PCI: Using ACPI for IRQ routing
[    0.625913] PCI: pci_cache_line_size set to 64 bytes
[    0.626741] e820: reserve RAM buffer [mem 0x09bff000-0x0bffffff]
[    0.626752] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
[    0.626762] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
[    0.626772] e820: reserve RAM buffer [mem 0xbb13b000-0xbbffffff]
[    0.626782] e820: reserve RAM buffer [mem 0xbefffd00-0xbfffffff]
[    0.626792] e820: reserve RAM buffer [mem 0xc3f300000-0xc3fffffff]
[    0.627097] pci 0000:09:00.0: vgaarb: setting as boot VGA device
[    0.627138] pci 0000:09:00.0: vgaarb: bridge control possible
[    0.627149] pci 0000:09:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.627162] vgaarb: loaded
[    0.627162] pci 0000:00:00.0: Reserving PCI config space
[    0.627162] Found 1 AMD root devices
[    0.627162] Oops: divide error: 0000 [#1] SMP NOPTI
[    0.627162] CPU: 5 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.10-200.fc43.x86_64 #1 PREEMPT(lazy) 
[    0.627162] Hardware name: To Be Filled By O.E.M. B450M Steel Legend/B450M Steel Legend, BIOS P10.43 06/25/2025
[    0.627162] RIP: 0010:amd_smn_init+0x1ea/0x280
[    0.627162] Code: c7 c7 13 de 16 83 e8 85 7c 44 fd eb 6f 48 89 df e8 0b 18 ca fc 48 89 c3 48 85 c0 0f 84 5b ff ff ff 44 89 e8 31 d2 45 8d 7d 01 <66> f7 f5 66 85 d2 75 42 eb 02 eb 2c 41 0f b7 ce 48 8d b3 c8 00 00
[    0.627162] RSP: 0018:ffffc9000004fe28 EFLAGS: 00010246
[    0.627162] RAX: 0000000000000000 RBX: ffff888103fd9000 RCX: 0000000000000005
[    0.627162] RDX: 0000000000000000 RSI: ffff888103fd9000 RDI: 0000000000000000
[    0.627164] RBP: 0000000000000000 R08: 0000000000000282 R09: ffff8881040a2f90
[    0.627176] R10: ffffc9000004fe28 R11: ffffffff84a4c880 R12: 0000000000000002
[    0.627188] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
[    0.627202] FS:  0000000000000000(0000) GS:ffff88898e66f000(0000) knlGS:0000000000000000
[    0.627215] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.627227] CR2: 0000000000000000 CR3: 0000000003a2e000 CR4: 0000000000750ef0
[    0.627241] PKRU: 55555554
[    0.627248] Call Trace:
[    0.627254]  <TASK>
[    0.627261]  ? __pfx_amd_smn_init+0x10/0x10
[    0.627269]  do_one_initcall+0x5b/0x300
[    0.627281]  do_initcalls+0x148/0x170
[    0.627291]  kernel_init_freeable+0xf9/0x140
[    0.627301]  ? __pfx_kernel_init+0x10/0x10
[    0.627311]  kernel_init+0x1a/0x140
[    0.627319]  ret_from_fork+0x130/0x1a0
[    0.627328]  ? __pfx_kernel_init+0x10/0x10
[    0.627338]  ret_from_fork_asm+0x1a/0x30
[    0.627349]  </TASK>
[    0.627355] Modules linked in:
[    0.627364] ---[ end trace 0000000000000000 ]---
[    0.627373] RIP: 0010:amd_smn_init+0x1ea/0x280
[    0.627382] Code: c7 c7 13 de 16 83 e8 85 7c 44 fd eb 6f 48 89 df e8 0b 18 ca fc 48 89 c3 48 85 c0 0f 84 5b ff ff ff 44 89 e8 31 d2 45 8d 7d 01 <66> f7 f5 66 85 d2 75 42 eb 02 eb 2c 41 0f b7 ce 48 8d b3 c8 00 00
[    0.627407] RSP: 0018:ffffc9000004fe28 EFLAGS: 00010246
[    0.627417] RAX: 0000000000000000 RBX: ffff888103fd9000 RCX: 0000000000000005
[    0.627428] RDX: 0000000000000000 RSI: ffff888103fd9000 RDI: 0000000000000000
[    0.627440] RBP: 0000000000000000 R08: 0000000000000282 R09: ffff8881040a2f90
[    0.627452] R10: ffffc9000004fe28 R11: ffffffff84a4c880 R12: 0000000000000002
[    0.627463] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
[    0.627476] FS:  0000000000000000(0000) GS:ffff88898e66f000(0000) knlGS:0000000000000000
[    0.627488] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.627498] CR2: 0000000000000000 CR3: 0000000003a2e000 CR4: 0000000000750ef0
[    0.627510] PKRU: 55555554
[    0.627517] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.

--nextPart24824718.vTCxPXJkl2--




