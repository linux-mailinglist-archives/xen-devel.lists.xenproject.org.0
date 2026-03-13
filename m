Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLmyOM08tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8696B28719F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253914.1549915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tk-0007aw-Av; Fri, 13 Mar 2026 16:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253914.1549915; Fri, 13 Mar 2026 16:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tk-0007U5-1Z; Fri, 13 Mar 2026 16:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1253914;
 Fri, 13 Mar 2026 16:35:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/wq=BN=bounce.vates.tech=bounce-md_30504962.69b43cb5.v1-dee8f2259b93467080f6b231169e5ae3@srs-se1.protection.inumbo.net>)
 id 1w15Ti-0006Ek-NG
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:10 +0000
Received: from mail179-36.suw41.mandrillapp.com
 (mail179-36.suw41.mandrillapp.com [198.2.179.36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95403724-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:02 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-36.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4fXVT13g0nzlfcWc
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dee8f2259b93467080f6b231169e5ae3; Fri, 13 Mar 2026 16:35:01 +0000
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
X-Inumbo-ID: 95403724-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419701; x=1773689701;
	bh=REkocrI6Nk2YpoA8OynAjGyLNwNnZKPqQ6VDiOkj00E=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Q31graVI6AFMeCAtOCGvkHRYQf/+xCA8xFi2Rjrep2kzpBn5xgZ++aGaiwtGaemUa
	 DgGlRI3GTn3mAhhvA6Ymg0GeBZJVlzjroTZoydrVawge2fnnn1cY0NImKYZ7wKDAo0
	 8HQemOGAYRfLVkvXlE/Oczdj9O8io1xcSCFBXZDe+GSuXhzHDBXw/oC/ywGqwJmJNn
	 9nSsAw22rXk9ARvYLhpJZB76kgLX3+Mmzck4k+D7zi8StQgvj9UYDn4Vg8VvE/BiVG
	 bEv/KtLlM8/4jKtwPxOIozWfvVyWPdrTfEXuB68PO++9PcjL9bhCB6l7do3okjCThm
	 Jy0Nwr7k3WX6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419701; x=1773680201; i=thierry.escande@vates.tech;
	bh=REkocrI6Nk2YpoA8OynAjGyLNwNnZKPqQ6VDiOkj00E=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=LjklmnpcnUd3nisXU/GCwH0RUgbk4L4Bar+lOQVEKHoJww+laau1dTNDuxiAuQhlZ
	 ogLBptd9v52pinNDvxZDAMuRVtYb2b69QQLdd292lZwBbRxlwZoe/J/V3WLZhgoYXd
	 cMLOBuUgTEUhQlnbmyMlRIwbU70vpWZcHRxpcbD8yC/9FF7cl/X6/HCbgESsntQ0mk
	 mC/zh7ISCUYIKJGQKhVLOg4jIShnrSutJRZuHpSB1S2FfAOXd1P8O/SW2rUCrC7eEJ
	 auPTrEX1ItB6ZI/sQky3v4YYTzeXnDW+0gHJ6zEFYb7h4BYPBBbSVZNQtHN2ukafJK
	 9VP5+yjUxOisg==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2000/17]=20Q35=20initial=20support=20for=20HVM=20guests?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419700304
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>
Message-Id: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dee8f2259b93467080f6b231169e5ae3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.262];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8696B28719F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series introduces initial Q35 chipset support for HVM guests, based on the
patchset at [1] by Alexey Gerasimenko.

Basic support means that this patchset allows to start an HVM guest that
emulates a Q35 chipset via Qemu and implements access to PCIe extended
configuration space for such devices emulated by Qemu.

Support for PCIe device passthrough is not implemented yet. This is planned but
implies modifications in the hypervisor and the firmwares, mainly for the
support of multiple PCI buses.

In order to create a Q35 guest, a new domain config option has been added,
named 'device_model_machine'. Possible values are:
- "i440" - i440 emulation (default)
- "q35"  - emulate a Q35 machine

If the option is omitted it defaults to "i440", not impacting existing domain
configuration files.

DSDT files for Q35 and i440 are largely similar so the existing file dsdt.asl
has been split with i440 and q35 specific parts put in seperated files.

The PCIe MMCONFIG area is configured by hvmloader and its base address and size
are set in Xen using a new pair of hypercalls HVMOP_get|set_ecam_space. Access
to the MMCONFIG area from a guest is trapped by Xen and transfered to the
emulator as XEN_DMOP_IO_RANGE_PCI ioreq type.

[1] https://lore.kernel.org/xen-devel/cover.1520867740.git.x1917x@gmail.com/

Thierry Escande (17):
  libacpi: Split dsdt.asl file and extract i440 specific parts
  libacpi: new DSDT ACPI table for Q35
  hvmloader: add function to set the emulated machine type (i440/Q35)
  hvmloader: add ACPI enabling for Q35
  hvmloader: add Q35 DSDT table loading
  hvmloader: Move pci devices setup to a separate function
  hvmloader: add basic Q35 support
  hvmloader: Extend PCI BAR struct
  xev/hvm: Add HVMOP_get|set_ecam_space hypercalls
  hvmloader: Add support for HVMOP_set|get_ecam_space hypercalls
  hvmloader: allocate MMCONFIG area in the MMIO hole
  libxl: Q35 support (new option device_model_machine)
  libxl: Add xen-platform device for Q35 machine
  libacpi: build ACPI MCFG table if requested
  hvmloader: Set MCFG in ACPI table
  Handle PCIe ECAM space access from guests
  docs: provide description for device_model_machine option

 docs/man/xl.cfg.5.pod.in             |  27 +++
 tools/firmware/hvmloader/Makefile    |   2 +-
 tools/firmware/hvmloader/config.h    |   5 +
 tools/firmware/hvmloader/e820.c      |  11 ++
 tools/firmware/hvmloader/hvmloader.c |  21 ++-
 tools/firmware/hvmloader/ovmf.c      |   4 +-
 tools/firmware/hvmloader/pci.c       | 264 +++++++++++++++++++--------
 tools/firmware/hvmloader/pci_regs.h  |  16 ++
 tools/firmware/hvmloader/seabios.c   |   4 +-
 tools/firmware/hvmloader/util.c      |  94 +++++++++-
 tools/firmware/hvmloader/util.h      |  21 ++-
 tools/libacpi/Makefile               |  10 +-
 tools/libacpi/acpi2_0.h              |  17 ++
 tools/libacpi/build.c                |  43 +++++
 tools/libacpi/dsdt.asl               |  28 +--
 tools/libacpi/dsdt_i440.asl          |  36 ++++
 tools/libacpi/dsdt_q35.asl           | 130 +++++++++++++
 tools/libacpi/libacpi.h              |   6 +
 tools/libs/light/libxl_dm.c          |  22 ++-
 tools/libs/light/libxl_types.idl     |   7 +
 tools/xl/xl_parse.c                  |  14 ++
 xen/arch/x86/hvm/hvm.c               |  52 ++++++
 xen/arch/x86/hvm/ioreq.c             |  15 ++
 xen/arch/x86/include/asm/domain.h    |   4 +
 xen/include/public/hvm/hvm_op.h      |  11 ++
 25 files changed, 739 insertions(+), 125 deletions(-)
 create mode 100644 tools/libacpi/dsdt_i440.asl
 create mode 100644 tools/libacpi/dsdt_q35.asl

-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


