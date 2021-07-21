Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C33D0B76
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 11:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159240.292919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m68YG-0004x2-MT; Wed, 21 Jul 2021 09:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159240.292919; Wed, 21 Jul 2021 09:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m68YG-0004sr-Hk; Wed, 21 Jul 2021 09:30:04 +0000
Received: by outflank-mailman (input) for mailman id 159240;
 Wed, 21 Jul 2021 09:30:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=McEs=MN=dingwall.me.uk=james@srs-us1.protection.inumbo.net>)
 id 1m68YE-0004k6-To
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 09:30:02 +0000
Received: from smarthost01a.ixn.mail.zen.net.uk (unknown [212.23.1.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37aecb8f-ea06-11eb-8c09-12813bfff9fa;
 Wed, 21 Jul 2021 09:30:00 +0000 (UTC)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01a.ixn.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james@dingwall.me.uk>) id 1m68YB-00058k-6f
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 09:29:59 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 74341E969E
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jul 2021 10:29:58 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id zDzPP1zI7-1m for <xen-devel@lists.xenproject.org>;
 Wed, 21 Jul 2021 10:29:58 +0100 (BST)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id 47A95E969B
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jul 2021 10:29:58 +0100 (BST)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 3374CA06; Wed, 21 Jul 2021 10:29:58 +0100 (BST)
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
X-Inumbo-ID: 37aecb8f-ea06-11eb-8c09-12813bfff9fa
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Wed, 21 Jul 2021 10:29:58 +0100
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Subject: xen 4.11.4 incorrect (~3x) cpu frequency reported
Message-ID: <20210721092958.GA2502468@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01a-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

Hi,

We have a system which intermittently starts up and reports an incorrect cpu frequency:

# grep -i mhz /var/log/kern.log 
Jul 14 17:47:47 dom0 kernel: [    0.000475] tsc: Detected 2194.846 MHz processor
Jul 14 22:03:37 dom0 kernel: [    0.000476] tsc: Detected 2194.878 MHz processor
Jul 14 23:05:13 dom0 kernel: [    0.000478] tsc: Detected 2194.848 MHz processor
Jul 14 23:20:47 dom0 kernel: [    0.000474] tsc: Detected 2194.856 MHz processor
Jul 14 23:57:39 dom0 kernel: [    0.000476] tsc: Detected 2194.906 MHz processor
Jul 15 01:04:09 dom0 kernel: [    0.000476] tsc: Detected 2194.858 MHz processor
Jul 15 01:27:15 dom0 kernel: [    0.000482] tsc: Detected 2194.870 MHz processor
Jul 15 02:00:13 dom0 kernel: [    0.000481] tsc: Detected 2194.924 MHz processor
Jul 15 03:09:23 dom0 kernel: [    0.000475] tsc: Detected 2194.892 MHz processor
Jul 15 03:32:50 dom0 kernel: [    0.000482] tsc: Detected 2194.856 MHz processor
Jul 15 04:05:27 dom0 kernel: [    0.000480] tsc: Detected 2194.886 MHz processor
Jul 15 05:00:38 dom0 kernel: [    0.000473] tsc: Detected 2194.914 MHz processor
Jul 15 05:59:33 dom0 kernel: [    0.000480] tsc: Detected 2194.924 MHz processor
Jul 15 06:22:31 dom0 kernel: [    0.000474] tsc: Detected 2194.910 MHz processor
Jul 15 17:52:57 dom0 kernel: [    0.000474] tsc: Detected 2194.854 MHz processor
Jul 15 18:51:36 dom0 kernel: [    0.000474] tsc: Detected 2194.900 MHz processor
Jul 15 19:07:26 dom0 kernel: [    0.000478] tsc: Detected 2194.902 MHz processor
Jul 15 19:43:56 dom0 kernel: [    0.000154] tsc: Detected 6895.384 MHz processor

The xen 's' debug output:

(XEN) TSC marked as reliable, warp = 0 (count=4)
(XEN) dom1: mode=0,ofs=0x1d1ac8bf8e,khz=6895385,inc=1
(XEN) dom2: mode=0,ofs=0x28bc24c746,khz=6895385,inc=1
(XEN) dom3: mode=0,ofs=0x345696b138,khz=6895385,inc=1
(XEN) dom4: mode=0,ofs=0x34f2635f31,khz=6895385,inc=1
(XEN) dom5: mode=0,ofs=0x3581618a7d,khz=6895385,inc=1
(XEN) dom6: mode=0,ofs=0x3627ca68b2,khz=6895385,inc=1
(XEN) dom7: mode=0,ofs=0x36dd491860,khz=6895385,inc=1
(XEN) dom8: mode=0,ofs=0x377a57ea1a,khz=6895385,inc=1
(XEN) dom9: mode=0,ofs=0x381eb175ce,khz=6895385,inc=1
(XEN) dom10: mode=0,ofs=0x38cab2e260,khz=6895385,inc=1
(XEN) dom11: mode=0,ofs=0x397fc47387,khz=6895385,inc=1
(XEN) dom12: mode=0,ofs=0x3a552762a0,khz=6895385,inc=1

A processor from /proc/cpuinfo in dom0:

processor       : 3
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) D-2123IT CPU @ 2.20GHz
stepping        : 4
microcode       : 0x2000065
cpu MHz         : 6895.384
cache size      : 8448 KB
physical id     : 0
siblings        : 4
core id         : 0
cpu cores       : 1
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush acpi mmx fxsr sse sse2 ss ht syscall nx lm constant_tsc rep_good nopl nonstop_tsc cpuid pni pclmulqdq monitor est ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch intel_ppin ssbd ibrs ibpb stibp fsgsbase bmi1 hle avx2 bmi2 erms rtm avx512f avx512dq rdseed adx clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 md_clear
bugs            : null_seg cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit
bogomips        : 13790.76
clflush size    : 64
cache_alignment : 64
address sizes   : 46 bits physical, 48 bits virtual
power management:

Xen has been built at 310ab79875cb705cc2c7daddff412b5a4899f8c9 from the stable-4.12 branch.  The system is a supermicro server, model X11SDV-4C-TP8F.  I'm not sure if the incorrect value has been read from hardware or Xen has miscalculated the frequency so any pointers on things to examine would be welcome.

Thanks,
James

