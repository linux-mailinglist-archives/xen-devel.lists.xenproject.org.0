Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8015079F3E9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 23:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601666.937759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgXYx-000638-8R; Wed, 13 Sep 2023 21:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601666.937759; Wed, 13 Sep 2023 21:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgXYx-00060s-4A; Wed, 13 Sep 2023 21:38:19 +0000
Received: by outflank-mailman (input) for mailman id 601666;
 Wed, 13 Sep 2023 21:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OkSH=E5=knorrie.org=hans@srs-se1.protection.inumbo.net>)
 id 1qgXYv-00060m-FQ
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 21:38:17 +0000
Received: from syrinx.knorrie.org (syrinx.knorrie.org [2001:888:2177::4d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7601f0f-527d-11ee-8787-cb3800f73035;
 Wed, 13 Sep 2023 23:38:16 +0200 (CEST)
Received: from [IPV6:4000:0:fb:a::15]
 (2a02-a213-2bc5-6a80-0000-0000-0000-0004.cable.dynamic.v6.ziggo.nl
 [IPv6:2a02:a213:2bc5:6a80::4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by syrinx.knorrie.org (Postfix) with ESMTPSA id DB9A6615FAF14;
 Wed, 13 Sep 2023 23:38:12 +0200 (CEST)
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
X-Inumbo-ID: d7601f0f-527d-11ee-8787-cb3800f73035
Message-ID: <676789d2-a054-2b44-69be-c458ef236d50@knorrie.org>
Date: Wed, 13 Sep 2023 23:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: =?UTF-8?Q?Radoslav_Bod=c3=b3?= <radoslav.bodo@igalileo.cz>,
 1051862@bugs.debian.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <abd6fb7e-bd03-7bf0-b43f-5e4914f6aadf@igalileo.cz>
From: Hans van Kranenburg <hans@knorrie.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: (Debian) Bug#1051862: server flooded with xen_mc_flush warnings
 with xen 4.17 + linux 6.1
In-Reply-To: <abd6fb7e-bd03-7bf0-b43f-5e4914f6aadf@igalileo.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Radoslav,

Thanks for your report...

Hi Juergen, Boris and xen-devel,

At Debian, we got the report below. (Also at
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1051862)

This hardware, with only Xen and Dom0 running is hitting the failed
multicall warning and logging in arch/x86/xen/multicalls.c. Can you help
advise what we can do to further debug this issue?

Since this looks like pretty low level Xen/hardware stuff, I'd rather
ask upstream for directions first. If needed the Debian Xen Team can
assist the end user with the debugging process.

Thanks,

More reply inline...

On 9/13/23 20:12, Radoslav Bodó wrote:
> Package: xen-system-amd64
> Version: 4.17.1+2-gb773c48e36-1
> Severity: important
> 
> Hello,
> 
> after upgrade from Bullseye to Bookworm one of our dom0's
> became unusable due to logs/system being continuously flooded
> with warnings from arch/x86/xen/multicalls.c:102 xen_mc_flush, and the 
> system become unusable.
> 
> The issue starts at some point where system services starts to come up, 
> but nothing very special is on that box (dom0, nftables, fail2ban, 
> prometheus-node-exporter, 3x domU). We have tried to disable all domU's 
> and fail2ban as the name of the process would suggest, but issue is 
> still present. We have tried also some other elaboration but none of 
> them have helped so far:
> 
> * the issue arise when xen 4.17 + linux >= 6.1 is booted
> * xen + bookworm-backports linux-image-6.4.0-0.deb12.2-amd64 have same isuue
> * without xen hypervisor, linux 6.1 runs just fine
> * systemrescue cd boot and xfs_repair rootfs did not helped
> * memtest seem to be fine running for hours

Thanks for already trying out all these combinations.

> As a workaround we have booted xen 4.17 + linux 5.10.0-25 (5.10.191-1)
> and the system is running fine as for last few months.
> 
> Hardware:
> * Dell PowerEdge R750xs
> * 2x Intel Xeon Silver 4310 2.1G
> * 256GB RAM
> * PERC H755 Adapter, 12x 18TB HDDs

I have a few quick additional questions already:

1. For clarification.. From your text, I understand that only this one
single server is showing the problem after the Debian version upgrade.
Does this mean that this is the only server you have running with
exactly this combination of hardware (and BIOS version, CPU microcode
etc etc)? Or, is there another one with same hardware which does not
show the problem?

2. Can you reply with the output of 'xl dmesg' when the problem happens?
Or, if the system gets unusable too quick, do you have a serial console
connection to capture the output?

3. To confirm... I understand that there are many of these messages.
Since you pasted only one, does that mean that all of them look exactly
the same, with "1 of 1 multicall(s) failed: cpu 10" "call  1: op=1
arg=[ffff8888a1a9eb10] result=-22"? Or are there variations? If so, can
you reply with a few different ones?

Since this very much looks like an issue of Xen related code where the
Xen hypervisor, dom0 kernel and hardware has to work together correctly,
(and not a Debian packaging problem) I'm already asking upstream for
advice about what we should/could do next, instead of trying to make a
guess myself.

Thanks,
Hans

> Any help, advice or bug confirmation would be appreciated
> 
> Best regards
> bodik
> 
> 
> (log also in attachment)
> 
> ```
> kernel: [   99.762402] WARNING: CPU: 10 PID: 1301 at 
> arch/x86/xen/multicalls.c:102 xen_mc_flush+0x196/0x220
> kernel: [   99.762598] Modules linked in: nvme_fabrics nvme_core bridge 
> xen_acpi_processor xen_gntdev stp llc xen_evtchn xenfs xen_privcmd 
> binfmt_misc intel_rapl_msr ext4 intel_rapl_common crc16 
> intel_uncore_frequency_common mbcache ipmi_ssif jbd2 nfit libnvdimm 
> ghash_clmulni_intel sha512_ssse3 sha512_generic aesni_intel acpi_ipmi 
> nft_ct crypto_simd cryptd mei_me mgag200 ipmi_si iTCO_wdt intel_pmc_bxt 
> ipmi_devintf drm_shmem_helper dell_smbios nft_masq iTCO_vendor_support 
> isst_if_mbox_pci drm_kms_helper isst_if_mmio dcdbas mei intel_vsec 
> isst_if_common dell_wmi_descriptor wmi_bmof watchdog pcspkr 
> intel_pch_thermal ipmi_msghandler i2c_algo_bit acpi_power_meter button 
> nft_nat joydev evdev sg nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 
> nf_defrag_ipv4 nf_tables nfnetlink drm fuse loop efi_pstore configfs 
> ip_tables x_tables autofs4 xfs libcrc32c crc32c_generic hid_generic 
> usbhid hid dm_mod sd_mod t10_pi crc64_rocksoft crc64 crc_t10dif 
> crct10dif_generic ahci libahci xhci_pci libata xhci_hcd
> kernel: [   99.762633]  megaraid_sas tg3 crct10dif_pclmul 
> crct10dif_common crc32_pclmul crc32c_intel bnxt_en usbcore scsi_mod 
> i2c_i801 libphy i2c_smbus usb_common scsi_common wmi
> kernel: [   99.764765] CPU: 10 PID: 1301 Comm: python3 Tainted: G 
> W          6.1.0-12-amd64 #1  Debian 6.1.52-1
> kernel: [   99.764989] Hardware name: Dell Inc. PowerEdge R750xs/0441XG, 
> BIOS 1.8.2 09/14/2022
> kernel: [   99.765214] RIP: e030:xen_mc_flush+0x196/0x220
> kernel: [   99.765436] Code: e2 06 48 01 da 85 c0 0f 84 23 ff ff ff 48 
> 8b 43 18 48 83 c3 40 48 c1 e8 3f 41 01 c5 48 39 d3 75 ec 45 85 ed 0f 84 
> 06 ff ff ff <0f> 0b e8 e3 6e a0 00 41 8b 14 24 44 89 ee 48 c7 c7 c0 ea 
> 33 82 89
> kernel: [   99.765910] RSP: e02b:ffffc900412ffc60 EFLAGS: 00010082
> kernel: [   99.766152] RAX: ffffffffffffffea RBX: ffff8888a1a9e300 RCX: 
> 0000000000000000
> kernel: [   99.766403] RDX: 0000000000000000 RSI: 0000000000000001 RDI: 
> ffff8888a1a9eb10
> kernel: [   99.766653] RBP: 0000000080000002 R08: 0000000000000000 R09: 
> 0000000000744f8b
> kernel: [   99.766902] R10: 0000000000007ff0 R11: 0000000000000018 R12: 
> ffff8888a1a9e300
> kernel: [   99.767153] R13: 0000000000000001 R14: ffffea0005130000 R15: 
> ffffea0005130000
> kernel: [   99.767409] FS:  00007f59b5ba62c0(0000) 
> GS:ffff8888a1a80000(0000) knlGS:0000000000000000
> kernel: [   99.767664] CS:  10000e030 DS: 0000 ES: 0000 CR0: 
> 0000000080050033
> kernel: [   99.767918] CR2: 00007f59b2200000 CR3: 0000000141bd0000 CR4: 
> 0000000000050660
> kernel: [   99.768181] Call Trace:
> kernel: [   99.768436]  <TASK>
> kernel: [   99.768691]  ? __warn+0x7d/0xc0
> kernel: [   99.768947]  ? xen_mc_flush+0x196/0x220
> kernel: [   99.769204]  ? report_bug+0xe6/0x170
> kernel: [   99.769460]  ? handle_bug+0x41/0x70
> kernel: [   99.769713]  ? exc_invalid_op+0x13/0x60
> kernel: [   99.769967]  ? asm_exc_invalid_op+0x16/0x20
> kernel: [   99.770223]  ? xen_mc_flush+0x196/0x220
> kernel: [   99.770478]  xen_mc_issue+0x6d/0x70
> kernel: [   99.770726]  xen_set_pmd_hyper+0x54/0x90
> kernel: [   99.770965]  do_set_pmd+0x188/0x2a0
> kernel: [   99.771200]  filemap_map_pages+0x1a9/0x6e0
> kernel: [   99.771434]  xfs_filemap_map_pages+0x41/0x60 [xfs]
> kernel: [   99.771714]  do_fault+0x1a4/0x410
> kernel: [   99.771947]  __handle_mm_fault+0x660/0xfa0
> kernel: [   99.772182]  handle_mm_fault+0xdb/0x2d0
> kernel: [   99.772414]  do_user_addr_fault+0x19c/0x570
> kernel: [   99.772643]  exc_page_fault+0x70/0x170
> kernel: [   99.772873]  asm_exc_page_fault+0x22/0x30
> kernel: [   99.773102] RIP: 0033:0x7f59b502cbe2
> kernel: [   99.773329] Code: 4d 8d 87 80 01 00 00 48 89 d9 45 31 c9 48 
> 85 ff 74 5c 66 0f 1f 44 00 00 49 8d b0 80 fe ff ff 31 d2 41 0f 18 08 f3 
> 0f 6f 04 11 <f3> 0f 6f 1c 16 f3 0f 6f 24 16 66 0f ef c3 66 0f 70 c8 31 
> 66 0f f4
> kernel: [   99.773806] RSP: 002b:00007ffc69923f70 EFLAGS: 00010246
> kernel: [   99.774040] RAX: 00007ffc69923fa0 RBX: 00007f59b5038000 RCX: 
> 00007f59b5038000
> kernel: [   99.774276] RDX: 0000000000000000 RSI: 00007f59b21ffffa RDI: 
> 0000000000000010
> kernel: [   99.774504] RBP: 00000000025b8f40 R08: 00007f59b220017a R09: 
> 0000000000000000
> kernel: [   99.774727] R10: 0000000000077eca R11: 0000000000000400 R12: 
> 00007f59b1a002fa
> kernel: [   99.774947] R13: 00007ffc69923fe0 R14: 00007f59b5038080 R15: 
> 00007f59b21ffffa
> kernel: [   99.775161]  </TASK>
> kernel: [   99.775365] ---[ end trace 0000000000000000 ]---
> kernel: [   99.775567] 1 of 1 multicall(s) failed: cpu 10
> kernel: [   99.775763]   call  1: op=1 arg=[ffff8888a1a9eb10] result=-22
> ```



