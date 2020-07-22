Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4557229ED0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 19:58:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyIzq-0002Ls-96; Wed, 22 Jul 2020 17:57:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k9w/=BB=yujala.com=srini@srs-us1.protection.inumbo.net>)
 id 1jyIzp-0002Ln-90
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 17:57:37 +0000
X-Inumbo-ID: d088149b-cc44-11ea-868c-bc764e2007e4
Received: from gproxy1-pub.mail.unifiedlayer.com (unknown [69.89.25.95])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d088149b-cc44-11ea-868c-bc764e2007e4;
 Wed, 22 Jul 2020 17:57:32 +0000 (UTC)
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
 by gproxy1.mail.unifiedlayer.com (Postfix) with ESMTP id 6A9FE84BD6190
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2020 11:57:31 -0600 (MDT)
Received: from md-71.webhostbox.net ([204.11.58.143]) by cmsmtp with ESMTP
 id yIzij0hEcDlydyIzijF67R; Wed, 22 Jul 2020 11:57:31 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=X7F81lbe c=1 sm=1 tr=0
 a=yS0qNmEK8ed8yKyeR8R6rg==:117 a=yS0qNmEK8ed8yKyeR8R6rg==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=_RQrkK6FrEwA:10:nop_rcvd_month_year
 a=o-A10e_uY_YA:10:endurance_base64_authed_username_1 a=DAwyPP_o2Byb1YXLmDAA:9
 a=0f1Y9JmXAAAA:8 a=cWRNjhkoAAAA:8 a=5JJ0oef6weKNsmNsFb8A:9
 a=5tgyK3aFugTBrctB:21 a=spVqwRLfTmeiu3zE:21 a=CjuIK1q_8ugA:10:nop_charset_2
 a=UVKsufMBYgcA:10:demote_hacked_domain_1 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=y8_R9gnzg0ak4JZGfxsA:9 a=CX5wSMZFaTPvz5or:21 a=xjF0CreuJmd9iHl0:21
 a=ZkcJNbYcqkxZVWdY:21 a=gKO2Hq4RSVkA:10:nop_mshtml
 a=UiCQ7L4-1S4A:10:nop_mshtml_css_classes a=hTZeC7Yk6K0A:10:nop_msword_html
 a=frz4AuCg-hUA:10:nop_css_in_html a=It28mvvgxjsq2WIeNnUB:22
 a=sVa6W5Aao32NNC1mekxh:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=yujala.com; 
 s=default;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
 References:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8kcf24TudZqoMYhspoMjkVi/XhjYybMqrFeOKJdCVdY=; b=vWpaEAx/QvMH+mj/CUdhMO0KkH
 wUceNTJ10mQ0piGt01fMjFcO9fKPpTV4EPVAmZjLkbCCjyMOeaptEZtPAr32L8bFEShv0b7aWkS48
 MpNkczLasm5vk/CJaSQBj+GxFCTdt0s1sK5gti5b+ou/o9HdhyWzuWOn9nR+fTLBrxCEfBoTQM/D0
 XhnRuCSR4ZSPm74JfMENP8p1Ddq5amR9KkfpxlUMFm3fl+TUflwdsz/ZjpaZC7tjMfB1BSiuuvrZ0
 WUn6+PliobB0X8bHWjY5vU64n4iAc3E00NCcuGsS7qi4UTjUeeSci+6U47KjO0k+nrSXyPgyw0oaD
 NspARMDw==;
Received: from 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 ([162.231.240.210]:55464 helo=SRINIASUSLAPTOP)
 by md-71.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <srini@yujala.com>) id 1jyIzi-0019V8-4D
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 17:57:30 +0000
From: "Srinivas Bangalore" <srini@yujala.com>
To: <xen-devel@lists.xenproject.org>
References: 
In-Reply-To: 
Subject: RE: Porting Xen to Jetson Nano 
Date: Wed, 22 Jul 2020 10:57:28 -0700
Message-ID: <002801d66051$90fe2300$b2fa6900$@yujala.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0029_01D66016.E4A1BC00"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdZeg0x1DrNeeg9GRtKkTne7zCxl1gBzRCMQ
Content-Language: en-us
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-71.webhostbox.net
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - yujala.com
X-BWhitelist: no
X-Source-IP: 162.231.240.210
X-Source-L: No
X-Exim-ID: 1jyIzi-0019V8-4D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 (SRINIASUSLAPTOP) [162.231.240.210]:55464
X-Source-Auth: srini@yujala.com
X-Email-Count: 1
X-Source-Cap: c3JpbmlxbGw7c3JpbmlxbGw7bWQtNzEud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
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

This is a multipart message in MIME format.

------=_NextPart_000_0029_01D66016.E4A1BC00
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear Xen experts,

 

Would greatly appreciate some hints on how to move forward with this one.

I have included further details on Xen diagnostics below:

 

(XEN) *** LOADING DOMAIN 0 ***

(XEN) Loading kernel from boot module @ 00000000e1000000

(XEN) Allocating 1:1 mappings totalling 512MB for dom0:

(XEN) BANK[0] 0x000000a0000000-0x000000c0000000 (512MB)

(XEN) Grant table range: 0x000000fec00000-0x000000fec60000

(XEN) Loading zImage from 00000000e1000000 to
00000000a0080000-00000000a223c808

(XEN) Allocating PPI 16 for event channel interrupt

(XEN) Loading dom0 DTB to 0x00000000a8000000-0x00000000a803435c

(XEN) Scrubbing Free RAM on 1 nodes using 4 CPUs

(XEN) ........done.

(XEN) Initial low memory virq threshold set at 0x4000 pages.

(XEN) Std. Loglevel: Errors and warnings

(XEN) Guest Loglevel: All

(XEN) ***************************************************

(XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS

(XEN) This option is intended to aid debugging of Xen by ensuring

(XEN) that all output is synchronously delivered on the serial line.

(XEN) However it can introduce SIGNIFICANT latencies and affect

(XEN) timekeeping. It is NOT recommended for production use!

(XEN) ***************************************************

(XEN) 3... 2... 1...

(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to
Xen)

(XEN) Freed 300kB init memory.

(XEN) *** Serial input -> Xen (type 'CTRL-a' three times to switch input to
DOM0)

(XEN) 'h' pressed -> showing installed handlers

(XEN)  key '%' (ascii '25') => trap to xendbg

(XEN)  key '*' (ascii '2a') => print all diagnostics

(XEN)  key '0' (ascii '30') => dump Dom0 registers

(XEN)  key 'A' (ascii '41') => toggle alternative key handling

(XEN)  key 'H' (ascii '48') => dump heap info

(XEN)  key 'R' (ascii '52') => reboot machine

(XEN)  key 'a' (ascii '61') => dump timer queues

(XEN)  key 'd' (ascii '64') => dump registers

(XEN)  key 'e' (ascii '65') => dump evtchn info

(XEN)  key 'g' (ascii '67') => print grant table usage

(XEN)  key 'h' (ascii '68') => show this message

(XEN)  key 'm' (ascii '6d') => memory info

(XEN)  key 'q' (ascii '71') => dump domain (and guest debug) info

(XEN)  key 'r' (ascii '72') => dump run queues

(XEN)  key 't' (ascii '74') => display multi-cpu clock info

(XEN)  key 'w' (ascii '77') => synchronously dump console ring buffer
(dmesg)

(XEN) '*' pressed -> firing all diagnostic keyhandlers

(XEN) [d: dump registers]

(XEN) 'd' pressed -> dumping registers

(XEN)

(XEN) *** Dumping CPU0 guest state (d0v0): ***

(XEN) ----[ Xen-4.8.5  arm64  debug=n   Tainted:  C   ]----

(XEN) CPU:    0

(XEN) PC:     00000000a0080000

(XEN) LR:     0000000000000000

(XEN) SP_EL0: 0000000000000000

(XEN) SP_EL1: 0000000000000000

(XEN) CPSR:   000001c5 MODE:64-bit EL1h (Guest Kernel, handler)

(XEN)      X0: 00000000a8000000  X1: 0000000000000000  X2: 0000000000000000

(XEN)      X3: 0000000000000000  X4: 0000000000000000  X5: 0000000000000000

(XEN)      X6: 0000000000000000  X7: 0000000000000000  X8: 0000000000000000

(XEN)      X9: 0000000000000000 X10: 0000000000000000 X11: 0000000000000000

(XEN)     X12: 0000000000000000 X13: 0000000000000000 X14: 0000000000000000

(XEN)     X15: 0000000000000000 X16: 0000000000000000 X17: 0000000000000000

(XEN)     X18: 0000000000000000 X19: 0000000000000000 X20: 0000000000000000

(XEN)     X21: 0000000000000000 X22: 0000000000000000 X23: 0000000000000000

(XEN)     X24: 0000000000000000 X25: 0000000000000000 X26: 0000000000000000

(XEN)     X27: 0000000000000000 X28: 0000000000000000  FP: 0000000000000000

(XEN)

(XEN)    ELR_EL1: 0000000000000000

(XEN)    ESR_EL1: 00000000

(XEN)    FAR_EL1: 0000000000000000

(XEN)

(XEN)  SCTLR_EL1: 00c50838

(XEN)    TCR_EL1: 00000000

(XEN)  TTBR0_EL1: 0000000000000000

(XEN)  TTBR1_EL1: 0000000000000000

(XEN)

(XEN)   VTCR_EL2: 80043594

(XEN)  VTTBR_EL2: 000100017f0f9000

(XEN)

(XEN)  SCTLR_EL2: 30cd183d

(XEN)    HCR_EL2: 000000008038663f

(XEN)  TTBR0_EL2: 00000000fecfc000

(XEN)

(XEN)    ESR_EL2: 8200000d

(XEN)  HPFAR_EL2: 0000000000000000

(XEN)    FAR_EL2: 00000000a0080000

(XEN)

(XEN) Guest stack trace from sp=0:

(XEN)   Failed to convert stack to physical address

(XEN)

(XEN) *** Dumping CPU1 host state: ***

(XEN) ----[ Xen-4.8.5  arm64  debug=n   Tainted:  C   ]----

(XEN) CPU:    1

(XEN) PC:     0000000000243ad8 idle_loop+0x74/0x11c

(XEN) LR:     0000000000243ae0

(XEN) SP:     00008000ff1bfe70

(XEN) CPSR:   20000249 MODE:64-bit EL2h (Hypervisor, handler)

(XEN)      X0: 0000000000000000  X1: 00008000feeb8680  X2: 0000000000000001

(XEN)      X3: fffffffffffffed4  X4: 00008000feeb8680  X5: 0000000000000000

(XEN)      X6: 00008000ff16dc40  X7: 00008000ff16dc58  X8: 00008000ff1bfe08

(XEN)      X9: 0000000000262458 X10: 000000000000000a X11: 00008000ff1bfbe9

(XEN)     X12: 0000000000000031 X13: 0000000000000001 X14: 00008000ff1bfbe8

(XEN)     X15: 0000000000000020 X16: 0000000000000000 X17: 0000000000000000

(XEN)     X18: 0000000000000000 X19: 0000000000302448 X20: 0000000000308d18

(XEN)     X21: 00000000002cbf80 X22: 0000000000308d18 X23: 0000000000308d18

(XEN)     X24: 0000000000000001 X25: 0000000000000001 X26: 0000000000000000

(XEN)     X27: 0000000000000000 X28: 0000000000000000  FP: 00008000ff1bfe70

(XEN)

(XEN)   VTCR_EL2: 80043594

(XEN)  VTTBR_EL2: 0000000000000000

(XEN)

(XEN)  SCTLR_EL2: 30cd183d

(XEN)    HCR_EL2: 000000000038663f

(XEN)  TTBR0_EL2: 00000000fecfc000

(XEN)

(XEN)    ESR_EL2: 00000000

(XEN)  HPFAR_EL2: 0000000000000000

(XEN)    FAR_EL2: 0000000000000000

(XEN)

(XEN) Xen stack trace from sp=00008000ff1bfe70:

(XEN)    00008000ff1bfe80 0000000000250f3c 0000000000308d18 0000000000000001

(XEN)    0000000000000001 0000000000000001 0000000000400000 0900494931070860

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000

(XEN) Xen call trace:

(XEN)    [<0000000000243ad8>] idle_loop+0x74/0x11c (PC)

(XEN)    [<0000000000243ae0>] idle_loop+0x7c/0x11c (LR)

(XEN)    [<0000000000250f3c>] start_secondary+0xfc/0x10c

(XEN)    [<0000000000000001>] 0000000000000001

(XEN)

(XEN) *** Dumping CPU2 host state: ***

(XEN) ----[ Xen-4.8.5  arm64  debug=n   Tainted:  C   ]----

(XEN) CPU:    2

(XEN) PC:     0000000000243ad8 idle_loop+0x74/0x11c

(XEN) LR:     0000000000243ae0

(XEN) SP:     00008000ff1afe70

(XEN) CPSR:   20000249 MODE:64-bit EL2h (Hypervisor, handler)

(XEN)      X0: 0000000000000000  X1: 00008000feeae680  X2: 0000000000000002

(XEN)      X3: fffffffffffffed4  X4: 00008000feeae680  X5: 0000000000000000

(XEN)      X6: 00008000ff16df20  X7: 00008000ff16df38  X8: 00008000ff1afe08

(XEN)      X9: 0000000000262458 X10: 000000000000000a X11: 00008000ff1afbe9

(XEN)     X12: 0000000000000032 X13: 0000000000000001 X14: 00008000ff1afbe8

(XEN)     X15: 0000000000000020 X16: 0000000000000000 X17: 0000000000000000

(XEN)     X18: 0000000000000000 X19: 0000000000302448 X20: 0000000000308d18

(XEN)     X21: 00000000002cbf80 X22: 0000000000308d18 X23: 0000000000308d18

(XEN)     X24: 0000000000000002 X25: 0000000000000001 X26: 0000000000000000

(XEN)     X27: 0000000000000000 X28: 0000000000000000  FP: 00008000ff1afe70

(XEN)

(XEN)   VTCR_EL2: 80043594

(XEN)  VTTBR_EL2: 0000000000000000

(XEN)

(XEN)  SCTLR_EL2: 30cd183d

(XEN)    HCR_EL2: 000000000038663f

(XEN)  TTBR0_EL2: 00000000fecfc000

(XEN)

(XEN)    ESR_EL2: 00000000

(XEN)  HPFAR_EL2: 0000000000000000

(XEN)    FAR_EL2: 0000000000000000

(XEN)

(XEN) Xen stack trace from sp=00008000ff1afe70:

(XEN)    00008000ff1afe80 0000000000250f3c 0000000000308d18 0000000000000002

(XEN)    0000000000000002 0000000000000001 0000000000400000 6002c108894108ca

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000

(XEN) Xen call trace:

(XEN)    [<0000000000243ad8>] idle_loop+0x74/0x11c (PC)

(XEN)    [<0000000000243ae0>] idle_loop+0x7c/0x11c (LR)

(XEN)    [<0000000000250f3c>] start_secondary+0xfc/0x10c

(XEN)    [<0000000000000002>] 0000000000000002

(XEN)

(XEN) *** Dumping CPU3 host state: ***

(XEN) ----[ Xen-4.8.5  arm64  debug=n   Tainted:  C   ]----

(XEN) CPU:    3

(XEN) PC:     0000000000243ad8 idle_loop+0x74/0x11c

(XEN) LR:     0000000000243ae0

(XEN) SP:     00008000ff1a7e70

(XEN) CPSR:   20000249 MODE:64-bit EL2h (Hypervisor, handler)

(XEN)      X0: 0000000000000000  X1: 00008000feeaa680  X2: 0000000000000003

(XEN)      X3: fffffffffffffed4  X4: 00008000feeaa680  X5: 0000000000000000

(XEN)      X6: 00008000ff1b4180  X7: 00008000ff1b4198  X8: 00008000ff1a7e08

(XEN)      X9: 0000000000262458 X10: 000000000000000a X11: 00008000ff1a7be9

(XEN)     X12: 0000000000000033 X13: 0000000000000001 X14: 00008000ff1a7be8

(XEN)     X15: 0000000000000020 X16: 0000000000000000 X17: 0000000000000000

(XEN)     X18: 0000000000000000 X19: 0000000000302448 X20: 0000000000308d18

(XEN)     X21: 00000000002cbf80 X22: 0000000000308d18 X23: 0000000000308d18

(XEN)     X24: 0000000000000003 X25: 0000000000000001 X26: 0000000000000000

(XEN)     X27: 0000000000000000 X28: 0000000000000000  FP: 00008000ff1a7e70

(XEN)

(XEN)   VTCR_EL2: 80043594

(XEN)  VTTBR_EL2: 0000000000000000

(XEN)

(XEN)  SCTLR_EL2: 30cd183d

(XEN)    HCR_EL2: 000000000038663f

(XEN)  TTBR0_EL2: 00000000fecfc000

(XEN)

(XEN)    ESR_EL2: 00000000

(XEN)  HPFAR_EL2: 0000000000000000

(XEN)    FAR_EL2: 0000000000000000

(XEN)

(XEN) Xen stack trace from sp=00008000ff1a7e70:

(XEN)    00008000ff1a7e80 0000000000250f3c 0000000000308d18 0000000000000003

(XEN)    0000000000000003 0000000000000001 0000000000400000 70c821138b0c9de0

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000

(XEN) Xen call trace:

(XEN)    [<0000000000243ad8>] idle_loop+0x74/0x11c (PC)

(XEN)    [<0000000000243ae0>] idle_loop+0x7c/0x11c (LR)

(XEN)    [<0000000000250f3c>] start_secondary+0xfc/0x10c

(XEN)    [<0000000000000003>] 0000000000000003

(XEN)

(XEN)

 

It seems the DOM0 kernel did not get added to the task list..

 

Boot args for Xen and Dom0 are here:
(XEN) Checking for initrd in /chosen

(XEN) linux,initrd limits invalid: 0000000084100000 >= 0000000084100000

(XEN) RAM: 0000000080000000 - 00000000fedfffff

(XEN) RAM: 0000000100000000 - 000000017f1fffff

(XEN)

(XEN) MODULE[0]: 00000000fc7f8000 - 00000000fc82d000 Device Tree

(XEN) MODULE[1]: 00000000e1000000 - 00000000e31bc808 Kernel
console=hvc0 earlyprintk=xen earlycon=xen rootfstype=ext4 rw rootwait
root=/dev/mmcblk0p1 rdinit=/sbin/init

(XEN)  RESVD[0]: 0000000080000000 - 0000000080020000

(XEN)  RESVD[1]: 00000000e3500000 - 00000000e3535000

(XEN)  RESVD[2]: 00000000fc7f8000 - 00000000fc82d000

(XEN)

(XEN) Command line: console=dtuart earlyprintk=xen
earlycon=uart8250,mmio32,0x70006000 sync_console dom0_mem=512M log_lvl=all
guest_loglvl=all console_to_ring

(XEN) Placing Xen at 0x00000000fec00000-0x00000000fee00000

 

Thanks,

Srini

 

From: Srinivas Bangalore <srini@yujala.com> 
Sent: Monday, July 20, 2020 3:51 AM
To: 'xen-devel@lists.xenproject.org' <xen-devel@lists.xenproject.org>
Subject: Porting Xen to Jetson Nano 

 

Hello,

 

I am trying to get Xen working on a Jetson Nano board (which is based on
NVIDIA's Tegra210 SoC). After some searching through the Xen-devel archives,
I learnt that there was a set of patches developed in 2017 to port Xen to
Tegra
(https://lists.xenproject.org/archives/html/xen-devel/2017-04/msg00991.html)
. However these patches don't appear in the main source repository.
Therefore, I applied these manually to Xen-4.8.5. With these changes, Xen
now boots up successfully on the Jetson Nano, but there is no Dom0 output on
the console. I can switch between Xen and Dom0 with CTRL-a-a-a.

 

I am using Linux kernel version 5.7 for Dom0. I also tried using the native
Linux kernel that comes with the Nano board, but that doesn't help.

 

Here's the console screen capture:

 

## Flattened Device Tree blob at e3000000

   Booting using the fdt blob at 0xe3000000

   reserving fdt memory region: addr=80000000 size=20000

   reserving fdt memory region: addr=e3000000 size=35000

   Loading Device Tree to 00000000fc7f8000, end 00000000fc82ffff ... OK

 

Starting kernel ...

 

- UART enabled -

- CPU 00000000 booting -

- Current EL 00000008 -

- Xen starting at EL2 -

- Zero BSS -

- Setting up control registers -

- Turning on paging -

- Ready -

(XEN) Checking for initrd in /chosen

(XEN) linux,initrd limits invalid: 0000000084100000 >= 0000000084100000

(XEN) RAM: 0000000080000000 - 00000000fedfffff

(XEN) RAM: 0000000100000000 - 000000017f1fffff

(XEN)

(XEN) MODULE[0]: 00000000fc7f8000 - 00000000fc82d000 Device Tree

(XEN) MODULE[1]: 00000000e1000000 - 00000000e2cbe200 Kernel
console=hvc0 earlyprintk=uart8250-32bit,0x70006000 rootfstype=ext4 rw
rootwait root=/dev/mmcblk0p1

(XEN)  RESVD[0]: 0000000080000000 - 0000000080020000

(XEN)  RESVD[1]: 00000000e3000000 - 00000000e3035000

(XEN)  RESVD[2]: 00000000fc7f8000 - 00000000fc82d000

(XEN)

(XEN) Command line: console=dtuart earlyprintk=xen earlycon=xenboot
dom0_mem=512M loglevel=all

(XEN) Placing Xen at 0x00000000fec00000-0x00000000fee00000

(XEN) Update BOOTMOD_XEN from 0000000080080000-0000000080188e01 =>
00000000fec00000-00000000fed08e01

(XEN) Domain heap initialised

(XEN) Taking dtuart configuration from /chosen/stdout-path

(XEN) Looking for dtuart at "/serial@70 Xen 4.8.5

(XEN) Xen version 4.8.5 (srinivas@) (aarch64-linux-gnu-gcc (Ubuntu/Linaro
7.5.0-3ubuntu1~18.04) 7.5.0) debug=n  Sun Jul 19 07:44:00 PDT 2020

(XEN) Latest ChangeSet:

(XEN) Processor: 411fd071: "ARM Limited", variant: 0x1, part 0xd07, rev 0x1

(XEN) 64-bit Execution:

(XEN)   Processor Features: 0000000000002222 0000000000000000

(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32

(XEN)     Extensions: FloatingPoint AdvancedSIMD

(XEN)   Debug Features: 0000000010305106 0000000000000000

(XEN)   Auxiliary Features: 0000000000000000 0000000000000000

(XEN)   Memory Model Features: 0000000000001124 0000000000000000

(XEN)   ISA Features:  0000000000011120 0000000000000000

(XEN) 32-bit Execution:

(XEN)   Processor Features: 00000131:00011011

(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle

(XEN)     Extensions: GenericTimer Security

(XEN)   Debug Features: 03010066

(XEN)   Auxiliary Features: 00000000

(XEN)   Memory Model Features: 10101105 40000000 01260000 02102211

(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121

(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 19200 KHz

(XEN) GICv2 initialization:

(XEN)         gic_dist_addr=0000000050041000

(XEN)         gic_cpu_addr=0000000050042000

(XEN)         gic_hyp_addr=0000000050044000

(XEN)         gic_vcpu_addr=0000000050046000

(XEN)         gic_maintenance_irq=25

(XEN) GICv2: 224 lines, 4 cpus, secure (IID 0200143b).

(XEN) Using scheduler: SMP Credit Scheduler (credit)

(XEN) Allocated console ring of 16 KiB.

(XEN) Bringing up CPU1

- CPU 00000001 booting -

- Current EL 00000008 -

- Xen starting at EL2 -

- Setting up control registers -

- Turning on paging -

- Ready -

(XEN) Bringing up CPU2

- CPU 00000002 booting -

- Current EL 00000008 -

- Xen starting at EL2 -

- Setting up control registers -

- Turning on paging -

- Ready -

(XEN) Bringing up CPU3

- CPU 00000003 booting -

- Current EL 00000008 -

- Xen starting at EL2 -

- Setting up control registers -

- Turning on paging -

- Ready -

(XEN) Brought up 4 CPUs

(XEN) P2M: 44-bit IPA with 44-bit PA

(XEN) P2M: 4 levels with order-0 root, VTCR 0x80043594

(XEN) I/O virtualisation disabled

(XEN) *** LOADING DOMAIN 0 ***

(XEN) Loading kernel from boot module @ 00000000e1000000

(XEN) Allocating 1:1 mappings totalling 512MB for dom0:

(XEN) BANK[0] 0x000000a0000000-0x000000c0000000 (512MB)

(XEN) Grant table range: 0x000000fec00000-0x000000fec60000

(XEN) Loading zImage from 00000000e1000000 to
00000000a0080000-00000000a1d3e200

(XEN) Allocating PPI 16 for event channel interrupt

(XEN) Loading dom0 DTB to 0x00000000a8000000-0x00000000a8034354

(XEN) Scrubbing Free RAM on 1 nodes using 4 CPUs

(XEN) ........done.

(XEN) Initial low memory virq threshold set at 0x4000 pages.

(XEN) Std. Loglevel: Errors and warnings

(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)

(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to
Xen)

(XEN) Freed 300kB init memory.

 

Any suggestions/pointers to move forward would be much appreciated.

 

Thanks,

Srini


------=_NextPart_000_0029_01D66016.E4A1BC00
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Dear Xen experts,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Would =
greatly appreciate some hints on how to move forward with this =
one&#8230;<o:p></o:p></p><p class=3DMsoNormal>I have included further =
details on Xen diagnostics below:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>(XEN) *** =
LOADING DOMAIN 0 ***<o:p></o:p></p><p class=3DMsoNormal>(XEN) Loading =
kernel from boot module @ 00000000e1000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Allocating 1:1 mappings totalling 512MB for =
dom0:<o:p></o:p></p><p class=3DMsoNormal>(XEN) BANK[0] =
0x000000a0000000-0x000000c0000000 (512MB)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Grant table range: =
0x000000fec00000-0x000000fec60000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Loading zImage from 00000000e1000000 to =
00000000a0080000-00000000a223c808<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Allocating PPI 16 for event channel =
interrupt<o:p></o:p></p><p class=3DMsoNormal>(XEN) Loading dom0 DTB to =
0x00000000a8000000-0x00000000a803435c<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Scrubbing Free RAM on 1 nodes using 4 =
CPUs<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
........done.<o:p></o:p></p><p class=3DMsoNormal>(XEN) Initial low =
memory virq threshold set at 0x4000 pages.<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Std. Loglevel: Errors and =
warnings<o:p></o:p></p><p class=3DMsoNormal>(XEN) Guest Loglevel: =
All<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
***************************************************<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) WARNING: CONSOLE OUTPUT IS =
SYNCHRONOUS<o:p></o:p></p><p class=3DMsoNormal>(XEN) This option is =
intended to aid debugging of Xen by ensuring<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) that all output is synchronously delivered on =
the serial line.<o:p></o:p></p><p class=3DMsoNormal>(XEN) However it can =
introduce SIGNIFICANT latencies and affect<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) timekeeping. It is NOT recommended for =
production use!<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
***************************************************<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) 3... 2... 1...<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) *** Serial input -&gt; DOM0 (type 'CTRL-a' three =
times to switch input to Xen)<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Freed 300kB init memory.<o:p></o:p></p><p class=3DMsoNormal>(XEN) *** =
Serial input -&gt; Xen (type 'CTRL-a' three times to switch input to =
DOM0)<o:p></o:p></p><p class=3DMsoNormal>(XEN) 'h' pressed -&gt; showing =
installed handlers<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; key =
'%' (ascii '25') =3D&gt; trap to xendbg<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; key '*' (ascii '2a') =3D&gt; print all =
diagnostics<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; key '0' =
(ascii '30') =3D&gt; dump Dom0 registers<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; key 'A' (ascii '41') =3D&gt; toggle =
alternative key handling<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
key 'H' (ascii '48') =3D&gt; dump heap info<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; key 'R' (ascii '52') =3D&gt; reboot =
machine<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; key 'a' (ascii =
'61') =3D&gt; dump timer queues<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; key 'd' (ascii '64') =3D&gt; dump =
registers<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; key 'e' (ascii =
'65') =3D&gt; dump evtchn info<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; key 'g' (ascii '67') =3D&gt; print grant =
table usage<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; key 'h' =
(ascii '68') =3D&gt; show this message<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; key 'm' (ascii '6d') =3D&gt; memory =
info<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; key 'q' (ascii '71') =
=3D&gt; dump domain (and guest debug) info<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; key 'r' (ascii '72') =3D&gt; dump run =
queues<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; key 't' (ascii =
'74') =3D&gt; display multi-cpu clock info<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; key 'w' (ascii '77') =3D&gt; synchronously =
dump console ring buffer (dmesg)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) '*' pressed -&gt; firing all diagnostic =
keyhandlers<o:p></o:p></p><p class=3DMsoNormal>(XEN) [d: dump =
registers]<o:p></o:p></p><p class=3DMsoNormal>(XEN) 'd' pressed -&gt; =
dumping registers<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) *** =
Dumping CPU0 guest state (d0v0): ***<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) ----[ Xen-4.8.5&nbsp; arm64&nbsp; =
debug=3Dn&nbsp;&nbsp; Tainted:&nbsp; C&nbsp;&nbsp; =
]----<o:p></o:p></p><p class=3DMsoNormal>(XEN) CPU:&nbsp;&nbsp;&nbsp; =
0<o:p></o:p></p><p class=3DMsoNormal>(XEN) PC:&nbsp;&nbsp;&nbsp;&nbsp; =
00000000a0080000<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
LR:&nbsp;&nbsp;&nbsp;&nbsp; 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) SP_EL0: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) SP_EL1: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) CPSR:&nbsp;&nbsp; 000001c5 MODE:64-bit EL1h =
(Guest Kernel, handler)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X0: =
00000000a8000000&nbsp; X1: 0000000000000000&nbsp; X2: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X3: =
0000000000000000&nbsp; X4: 0000000000000000&nbsp; X5: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X6: =
0000000000000000&nbsp; X7: 0000000000000000&nbsp; X8: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X9: =
0000000000000000 X10: 0000000000000000 X11: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X12: 0000000000000000 =
X13: 0000000000000000 X14: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X15: 0000000000000000 =
X16: 0000000000000000 X17: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X18: 0000000000000000 =
X19: 0000000000000000 X20: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X21: 0000000000000000 =
X22: 0000000000000000 X23: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X24: 0000000000000000 =
X25: 0000000000000000 X26: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X27: 0000000000000000 =
X28: 0000000000000000&nbsp; FP: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; ELR_EL1: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; ESR_EL1: =
00000000<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; =
FAR_EL1: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
SCTLR_EL1: 00c50838<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; TCR_EL1: =
00000000<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; TTBR0_EL1: =
0000000000000000<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
TTBR1_EL1: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; VTCR_EL2: 80043594<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; VTTBR_EL2: =
000100017f0f9000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
SCTLR_EL2: 30cd183d<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; HCR_EL2: =
000000008038663f<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
TTBR0_EL2: 00000000fecfc000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; ESR_EL2: =
8200000d<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; HPFAR_EL2: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; FAR_EL2: =
00000000a0080000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) Guest =
stack trace from sp=3D0:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; Failed to convert stack to physical =
address<o:p></o:p></p><p class=3DMsoNormal>(XEN)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) *** Dumping CPU1 host state: =
***<o:p></o:p></p><p class=3DMsoNormal>(XEN) ----[ Xen-4.8.5&nbsp; =
arm64&nbsp; debug=3Dn&nbsp;&nbsp; Tainted:&nbsp; C&nbsp;&nbsp; =
]----<o:p></o:p></p><p class=3DMsoNormal>(XEN) CPU:&nbsp;&nbsp;&nbsp; =
1<o:p></o:p></p><p class=3DMsoNormal>(XEN) PC:&nbsp;&nbsp;&nbsp;&nbsp; =
0000000000243ad8 idle_loop+0x74/0x11c<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) LR:&nbsp;&nbsp;&nbsp;&nbsp; =
0000000000243ae0<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
SP:&nbsp;&nbsp;&nbsp;&nbsp; 00008000ff1bfe70<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) CPSR:&nbsp;&nbsp; 20000249 MODE:64-bit EL2h =
(Hypervisor, handler)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X0: =
0000000000000000&nbsp; X1: 00008000feeb8680&nbsp; X2: =
0000000000000001<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X3: =
fffffffffffffed4&nbsp; X4: 00008000feeb8680&nbsp; X5: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X6: =
00008000ff16dc40&nbsp; X7: 00008000ff16dc58&nbsp; X8: =
00008000ff1bfe08<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X9: =
0000000000262458 X10: 000000000000000a X11: =
00008000ff1bfbe9<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X12: 0000000000000031 =
X13: 0000000000000001 X14: 00008000ff1bfbe8<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X15: 0000000000000020 =
X16: 0000000000000000 X17: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X18: 0000000000000000 =
X19: 0000000000302448 X20: 0000000000308d18<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X21: 00000000002cbf80 =
X22: 0000000000308d18 X23: 0000000000308d18<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X24: 0000000000000001 =
X25: 0000000000000001 X26: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X27: 0000000000000000 =
X28: 0000000000000000&nbsp; FP: 00008000ff1bfe70<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
&nbsp;&nbsp;VTCR_EL2: 80043594<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; VTTBR_EL2: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
SCTLR_EL2: 30cd183d<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; HCR_EL2: =
000000000038663f<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
TTBR0_EL2: 00000000fecfc000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; ESR_EL2: =
00000000<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; HPFAR_EL2: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; FAR_EL2: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) Xen =
stack trace from sp=3D00008000ff1bfe70:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 00008000ff1bfe80 =
0000000000250f3c 0000000000308d18 0000000000000001<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000001 =
0000000000000001 0000000000400000 0900494931070860<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000<o:p></o:p></p><p class=3DMsoNormal>(XEN) Xen call =
trace:<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; =
[&lt;0000000000243ad8&gt;] idle_loop+0x74/0x11c (PC)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; [&lt;0000000000243ae0&gt;] =
idle_loop+0x7c/0x11c (LR)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; [&lt;0000000000250f3c&gt;] =
start_secondary+0xfc/0x10c<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; [&lt;0000000000000001&gt;] =
0000000000000001<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) *** =
Dumping CPU2 host state: ***<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
----[ Xen-4.8.5&nbsp; arm64&nbsp; debug=3Dn&nbsp;&nbsp; Tainted:&nbsp; =
C&nbsp;&nbsp; ]----<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
CPU:&nbsp;&nbsp;&nbsp; 2<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
PC:&nbsp;&nbsp;&nbsp;&nbsp; 0000000000243ad8 =
idle_loop+0x74/0x11c<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
LR:&nbsp;&nbsp;&nbsp;&nbsp; 0000000000243ae0<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) SP:&nbsp;&nbsp;&nbsp;&nbsp; =
00008000ff1afe70<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
CPSR:&nbsp;&nbsp; 20000249 MODE:64-bit EL2h (Hypervisor, =
handler)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X0: =
0000000000000000&nbsp; X1: 00008000feeae680&nbsp; X2: =
0000000000000002<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X3: =
fffffffffffffed4&nbsp; X4: 00008000feeae680&nbsp; X5: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X6: =
00008000ff16df20&nbsp; X7: 00008000ff16df38&nbsp; X8: =
00008000ff1afe08<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X9: =
0000000000262458 X10: 000000000000000a X11: =
00008000ff1afbe9<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X12: 0000000000000032 =
X13: 0000000000000001 X14: 00008000ff1afbe8<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X15: 0000000000000020 =
X16: 0000000000000000 X17: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X18: 0000000000000000 =
X19: 0000000000302448 X20: 0000000000308d18<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X21: 00000000002cbf80 =
X22: 0000000000308d18 X23: 0000000000308d18<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X24: 0000000000000002 =
X25: 0000000000000001 X26: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X27: 0000000000000000 =
X28: 0000000000000000&nbsp; FP: 00008000ff1afe70<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; VTCR_EL2: 80043594<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; VTTBR_EL2: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
SCTLR_EL2: 30cd183d<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; HCR_EL2: =
000000000038663f<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
TTBR0_EL2: 00000000fecfc000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; ESR_EL2: =
00000000<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; HPFAR_EL2: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; FAR_EL2: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) Xen =
stack trace from sp=3D00008000ff1afe70:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 00008000ff1afe80 =
0000000000250f3c 0000000000308d18 0000000000000002<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000002 =
0000000000000001 0000000000400000 6002c108894108ca<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000<o:p></o:p></p><p class=3DMsoNormal>(XEN) Xen call =
trace:<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; =
[&lt;0000000000243ad8&gt;] idle_loop+0x74/0x11c (PC)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; [&lt;0000000000243ae0&gt;] =
idle_loop+0x7c/0x11c (LR)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; [&lt;0000000000250f3c&gt;] =
start_secondary+0xfc/0x10c<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; [&lt;0000000000000002&gt;] =
0000000000000002<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) *** =
Dumping CPU3 host state: ***<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
----[ Xen-4.8.5&nbsp; arm64&nbsp; debug=3Dn&nbsp;&nbsp; Tainted:&nbsp; =
C&nbsp;&nbsp; ]----<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
CPU:&nbsp;&nbsp;&nbsp; 3<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
PC:&nbsp;&nbsp;&nbsp;&nbsp; 0000000000243ad8 =
idle_loop+0x74/0x11c<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
LR:&nbsp;&nbsp;&nbsp;&nbsp; 0000000000243ae0<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) SP:&nbsp;&nbsp;&nbsp;&nbsp; =
00008000ff1a7e70<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
CPSR:&nbsp;&nbsp; 20000249 MODE:64-bit EL2h (Hypervisor, =
handler)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X0: =
0000000000000000&nbsp; X1: 00008000feeaa680&nbsp; X2: =
0000000000000003<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X3: =
fffffffffffffed4&nbsp; X4: 00008000feeaa680&nbsp; X5: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X6: =
00008000ff1b4180&nbsp; X7: 00008000ff1b4198&nbsp; X8: =
00008000ff1a7e08<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X9: =
0000000000262458 X10: 000000000000000a X11: =
00008000ff1a7be9<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X12: 0000000000000033 =
X13: 0000000000000001 X14: 00008000ff1a7be8<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X15: 0000000000000020 =
X16: 0000000000000000 X17: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X18: 0000000000000000 =
X19: 0000000000302448 X20: 0000000000308d18<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X21: 00000000002cbf80 =
X22: 0000000000308d18 X23: 0000000000308d18<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X24: 0000000000000003 =
X25: 0000000000000001 X26: 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X27: 0000000000000000 =
X28: 0000000000000000&nbsp; FP: 00008000ff1a7e70<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; VTCR_EL2: 80043594<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; VTTBR_EL2: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
SCTLR_EL2: 30cd183d<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; HCR_EL2: =
000000000038663f<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
TTBR0_EL2: 00000000fecfc000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; ESR_EL2: =
00000000<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; HPFAR_EL2: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; FAR_EL2: =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) Xen =
stack trace from sp=3D00008000ff1a7e70:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 00008000ff1a7e80 =
0000000000250f3c 0000000000308d18 0000000000000003<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000003 =
0000000000000001 0000000000400000 70c821138b0c9de0<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 =
0000000000000000<o:p></o:p></p><p class=3DMsoNormal>(XEN) Xen call =
trace:<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; =
[&lt;0000000000243ad8&gt;] idle_loop+0x74/0x11c (PC)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; [&lt;0000000000243ae0&gt;] =
idle_loop+0x7c/0x11c (LR)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; [&lt;0000000000250f3c&gt;] =
start_secondary+0xfc/0x10c<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp; [&lt;0000000000000003&gt;] =
0000000000000003<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>It seems the =
DOM0 kernel did not get added to the task list&#8230;.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Boot args =
for Xen and Dom0 are here:<br>(XEN) Checking for initrd in =
/chosen<o:p></o:p></p><p class=3DMsoNormal>(XEN) linux,initrd limits =
invalid: 0000000084100000 &gt;=3D 0000000084100000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) RAM: 0000000080000000 - =
00000000fedfffff<o:p></o:p></p><p class=3DMsoNormal>(XEN) RAM: =
0000000100000000 - 000000017f1fffff<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
MODULE[0]: 00000000fc7f8000 - 00000000fc82d000 Device =
Tree<o:p></o:p></p><p class=3DMsoNormal>(XEN) MODULE[1]: =
00000000e1000000 - 00000000e31bc808 =
Kernel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console=3Dhvc0 =
earlyprintk=3Dxen earlycon=3Dxen rootfstype=3Dext4 rw rootwait =
root=3D/dev/mmcblk0p1 rdinit=3D/sbin/init<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; RESVD[0]: 0000000080000000 - =
0000000080020000<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
RESVD[1]: 00000000e3500000 - 00000000e3535000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; RESVD[2]: 00000000fc7f8000 - =
00000000fc82d000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) Command =
line: console=3Ddtuart earlyprintk=3Dxen =
earlycon=3Duart8250,mmio32,0x70006000 sync_console dom0_mem=3D512M =
log_lvl=3Dall guest_loglvl=3Dall console_to_ring<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Placing Xen at =
0x00000000fec00000-0x00000000fee00000<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Srini<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div =
style=3D'border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in'><p class=3DMsoNormal><b>From:</b> Srinivas Bangalore =
&lt;srini@yujala.com&gt; <br><b>Sent:</b> Monday, July 20, 2020 3:51 =
AM<br><b>To:</b> 'xen-devel@lists.xenproject.org' =
&lt;xen-devel@lists.xenproject.org&gt;<br><b>Subject:</b> Porting Xen to =
Jetson Nano <o:p></o:p></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Hello,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I am trying =
to get Xen working on a Jetson Nano board (which is based on =
NVIDIA&#8217;s Tegra210 SoC). After some searching through the Xen-devel =
archives, I learnt that there was a set of patches developed in 2017 to =
port Xen to Tegra (<a =
href=3D"https://lists.xenproject.org/archives/html/xen-devel/2017-04/msg0=
0991.html">https://lists.xenproject.org/archives/html/xen-devel/2017-04/m=
sg00991.html</a>). However these patches don&#8217;t appear in the main =
source repository. Therefore, I applied these manually to Xen-4.8.5. =
With these changes, Xen now boots up successfully on the Jetson Nano, =
but there is no Dom0 output on the console. I can switch between Xen and =
Dom0 with CTRL-a-a-a.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I am using =
Linux kernel version 5.7 for Dom0. I also tried using the native Linux =
kernel that comes with the Nano board, but that doesn&#8217;t =
help.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Here&#8217;s the console screen =
capture:<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>## Flattened Device Tree blob at =
e3000000<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp; Booting using =
the fdt blob at 0xe3000000<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp; reserving fdt memory region: =
addr=3D80000000 size=3D20000<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp; reserving fdt memory region: =
addr=3De3000000 size=3D35000<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp; Loading Device Tree to 00000000fc7f8000, =
end 00000000fc82ffff ... OK<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Starting =
kernel ...<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>- UART enabled -<o:p></o:p></p><p class=3DMsoNormal>- =
CPU 00000000 booting -<o:p></o:p></p><p class=3DMsoNormal>- Current EL =
00000008 -<o:p></o:p></p><p class=3DMsoNormal>- Xen starting at EL2 =
-<o:p></o:p></p><p class=3DMsoNormal>- Zero BSS -<o:p></o:p></p><p =
class=3DMsoNormal>- Setting up control registers -<o:p></o:p></p><p =
class=3DMsoNormal>- Turning on paging -<o:p></o:p></p><p =
class=3DMsoNormal>- Ready -<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Checking for initrd in /chosen<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
linux,initrd limits invalid: 0000000084100000 &gt;=3D =
0000000084100000<o:p></o:p></p><p class=3DMsoNormal>(XEN) RAM: =
0000000080000000 - 00000000fedfffff<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) RAM: 0000000100000000 - =
000000017f1fffff<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
MODULE[0]: 00000000fc7f8000 - 00000000fc82d000 Device =
Tree<o:p></o:p></p><p class=3DMsoNormal>(XEN) MODULE[1]: =
00000000e1000000 - 00000000e2cbe200 =
Kernel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console=3Dhvc0 =
earlyprintk=3Duart8250-32bit,0x70006000 rootfstype=3Dext4 rw rootwait =
root=3D/dev/mmcblk0p1<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
RESVD[0]: 0000000080000000 - 0000000080020000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; RESVD[1]: 00000000e3000000 - =
00000000e3035000<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
RESVD[2]: 00000000fc7f8000 - 00000000fc82d000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) Command =
line: console=3Ddtuart earlyprintk=3Dxen earlycon=3Dxenboot =
dom0_mem=3D512M loglevel=3Dall<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Placing Xen at 0x00000000fec00000-0x00000000fee00000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Update BOOTMOD_XEN from =
0000000080080000-0000000080188e01 =3D&gt; =
00000000fec00000-00000000fed08e01<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Domain heap initialised<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Taking dtuart configuration from =
/chosen/stdout-path<o:p></o:p></p><p class=3DMsoNormal>(XEN) Looking for =
dtuart at &quot;/serial@70 Xen 4.8.5<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Xen version 4.8.5 (srinivas@) =
(aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0) =
debug=3Dn&nbsp; Sun Jul 19 07:44:00 PDT 2020<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Latest ChangeSet:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Processor: 411fd071: &quot;ARM Limited&quot;, =
variant: 0x1, part 0xd07, rev 0x1<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) 64-bit Execution:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; Processor Features: 0000000000002222 =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Exception Levels: =
EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Extensions: =
FloatingPoint AdvancedSIMD<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; Debug Features: 0000000010305106 =
0000000000000000<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp; =
Auxiliary Features: 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; Memory Model Features: =
0000000000001124 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; ISA Features:&nbsp; 0000000000011120 =
0000000000000000<o:p></o:p></p><p class=3DMsoNormal>(XEN) 32-bit =
Execution:<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp; =
Processor Features: 00000131:00011011<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Instruction Sets: =
AArch32 A32 Thumb Thumb-2 Jazelle<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Extensions: GenericTimer =
Security<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp; Debug =
Features: 03010066<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp; =
Auxiliary Features: 00000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; Memory Model Features: 10101105 =
40000000 01260000 02102211<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; ISA Features: 02101110 13112111 21232042 =
01112131 00011142 00011121<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 19200 =
KHz<o:p></o:p></p><p class=3DMsoNormal>(XEN) GICv2 =
initialization:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gic_dist_addr=3D0000000050041000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gic_cpu_addr=3D0000000050042000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gic_hyp_addr=3D0000000050044000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gic_vcpu_addr=3D0000000050046000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gic_maintenance_irq=3D25<o:p></o:p></p><p class=3DMsoNormal>(XEN) GICv2: =
224 lines, 4 cpus, secure (IID 0200143b).<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Using scheduler: SMP Credit Scheduler =
(credit)<o:p></o:p></p><p class=3DMsoNormal>(XEN) Allocated console ring =
of 16 KiB.<o:p></o:p></p><p class=3DMsoNormal>(XEN) Bringing up =
CPU1<o:p></o:p></p><p class=3DMsoNormal>- CPU 00000001 booting =
-<o:p></o:p></p><p class=3DMsoNormal>- Current EL 00000008 =
-<o:p></o:p></p><p class=3DMsoNormal>- Xen starting at EL2 =
-<o:p></o:p></p><p class=3DMsoNormal>- Setting up control registers =
-<o:p></o:p></p><p class=3DMsoNormal>- Turning on paging =
-<o:p></o:p></p><p class=3DMsoNormal>- Ready -<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Bringing up CPU2<o:p></o:p></p><p =
class=3DMsoNormal>- CPU 00000002 booting -<o:p></o:p></p><p =
class=3DMsoNormal>- Current EL 00000008 -<o:p></o:p></p><p =
class=3DMsoNormal>- Xen starting at EL2 -<o:p></o:p></p><p =
class=3DMsoNormal>- Setting up control registers -<o:p></o:p></p><p =
class=3DMsoNormal>- Turning on paging -<o:p></o:p></p><p =
class=3DMsoNormal>- Ready -<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Bringing up CPU3<o:p></o:p></p><p class=3DMsoNormal>- CPU 00000003 =
booting -<o:p></o:p></p><p class=3DMsoNormal>- Current EL 00000008 =
-<o:p></o:p></p><p class=3DMsoNormal>- Xen starting at EL2 =
-<o:p></o:p></p><p class=3DMsoNormal>- Setting up control registers =
-<o:p></o:p></p><p class=3DMsoNormal>- Turning on paging =
-<o:p></o:p></p><p class=3DMsoNormal>- Ready -<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Brought up 4 CPUs<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) P2M: 44-bit IPA with 44-bit PA<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) P2M: 4 levels with order-0 root, VTCR =
0x80043594<o:p></o:p></p><p class=3DMsoNormal>(XEN) I/O virtualisation =
disabled<o:p></o:p></p><p class=3DMsoNormal>(XEN) *** LOADING DOMAIN 0 =
***<o:p></o:p></p><p class=3DMsoNormal>(XEN) Loading kernel from boot =
module @ 00000000e1000000<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Allocating 1:1 mappings totalling 512MB for dom0:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) BANK[0] 0x000000a0000000-0x000000c0000000 =
(512MB)<o:p></o:p></p><p class=3DMsoNormal>(XEN) Grant table range: =
0x000000fec00000-0x000000fec60000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Loading zImage from 00000000e1000000 to =
00000000a0080000-00000000a1d3e200<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Allocating PPI 16 for event channel =
interrupt<o:p></o:p></p><p class=3DMsoNormal>(XEN) Loading dom0 DTB to =
0x00000000a8000000-0x00000000a8034354<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Scrubbing Free RAM on 1 nodes using 4 =
CPUs<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
........done.<o:p></o:p></p><p class=3DMsoNormal>(XEN) Initial low =
memory virq threshold set at 0x4000 pages.<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Std. Loglevel: Errors and =
warnings<o:p></o:p></p><p class=3DMsoNormal>(XEN) Guest Loglevel: =
Nothing (Rate-limited: Errors and warnings)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) *** Serial input -&gt; DOM0 (type 'CTRL-a' three =
times to switch input to Xen)<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Freed 300kB init memory.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Any =
suggestions/pointers to move forward would be much =
appreciated.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Srini<o:p></o:p></p></div></body></html>
------=_NextPart_000_0029_01D66016.E4A1BC00--


