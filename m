Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B963B2FE49
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088815.1446534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7As-00062P-Aa; Thu, 21 Aug 2025 15:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088815.1446534; Thu, 21 Aug 2025 15:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7As-00061K-57; Thu, 21 Aug 2025 15:25:58 +0000
Received: by outflank-mailman (input) for mailman id 1088815;
 Thu, 21 Aug 2025 15:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oAtF=3B=bounce.vates.tech=bounce-md_30504962.68a73a7d.v1-8a92cbcbf28e4ec8835df8665a8d7231@srs-se1.protection.inumbo.net>)
 id 1up7Ap-0005na-SG
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:25:55 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dee1c3e-7ea3-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 17:25:50 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4c76bK0sgzzBsVBZ7
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 15:25:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8a92cbcbf28e4ec8835df8665a8d7231; Thu, 21 Aug 2025 15:25:49 +0000
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
X-Inumbo-ID: 1dee1c3e-7ea3-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755789949; x=1756059949;
	bh=f+MVIfI7tSP+OiiCs9By3b93AN5lW1SGwr6uGwBsgGw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=KL8ME3Ul070FOn29lID2q7aqwedYjff6Z2oAclj8NHWzxPMpvh64tv9jMbdph4+Ge
	 k5/NJwX7qMXhokz/LxDHv9/AIeG5WWZjVA9fernW9p+IZSI8vXx0n/RRxOc/ggJXPE
	 TyaQIvVLyW+xdhpS3Nts+ZNEsDbOFMiCD0jvMV6udTrTceDo0WgeBgNeJP2a5IOcQ9
	 FsuP0mhqsx2H25Bglo4RlMxZNUhrmO232jO6UfI5EnH77eR0+GEqXLe1OWJ1SnI6d8
	 hx6lprxwS8ZV68aJpeYmiJLp3IXRVf4iF4yaHZWhYcw8EbW8VKBJK3q8AK4c5X+KMT
	 vdXbA6vFGKHew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755789949; x=1756050449; i=teddy.astie@vates.tech;
	bh=f+MVIfI7tSP+OiiCs9By3b93AN5lW1SGwr6uGwBsgGw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ouVkk7UnfZgeqSDR7NSs0DaZKpQxyo8BfPoTlL/kFK0biayylxu9KjlQdYBEuD1Nw
	 h2/oZ3NbeOqgJEk4BukqpA5nLl73mmtx48zivEzf0HLCwE6d0HYZwx/aBLNMQuK581
	 jXk1BSuRhAnZSLXiogRidS0gPFZT/GltAcQhMpIeWp1spynPIrkrfRvVUQKjNKH+ez
	 55R3MDToc7rfaM1zA6Sqej/1nwtOa70G/Yb9z8nKEaAhHW2s3kuWKgGxK9OjEN0yki
	 X4MX3Y75gyfO2DCNIPNXZ5Fjj8NBe7Y7Xp9Bw6ZcLgA83HSQzx6/2xYO8o4bqFQRi+
	 p/ekELGyY/WeA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=200/9]=20x86/hvm:=20New=20Xen=20HVM=20ABI=20proposal=20("HVMv2"=20part=201)?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755789947659
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Dario Faggioli" <dfaggioli@suse.com>, "George Dunlap" <gwd@xenproject.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-Id: <cover.1755785258.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8a92cbcbf28e4ec8835df8665a8d7231?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250821:md
Date: Thu, 21 Aug 2025 15:25:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello, this series introduce a new hypercall ABI proposal (x86 only for now).

The current Xen ABI has some shortcommings :

First, the hypercall parameters are usually pointers that point to a structure
in guest memory, this pointer is usually a virtual address. 
It causes various issues as :
 - you need to define a format for these structures which is currently C
   structures, but it complicates support with non LP64 platforms (e.g Windows)
   or other programming languages (e.g Rust, where solutions are hard to come with)
 - the translation from virtual address to machine physical address is very expensive
   as you need to translate the GVA to GPA, and then GPA to HPA each time you want to
   access a virtual address
 - such virtual addresses are not readable under confidential computing guests which
   makes such new ABI required.

Another issue is that all possible Xen hypercalls are exposed through this
single interface, it makes hardening the hypervisor more complicated as you
need to permission check on a per-hypercall basis (e.g through XSM) instead
of having a minimal strict safe-for-guest-use set of operations.

The current ABI allows the guest to modify its physmap; this is notably used for
mapping the shared info, grant table and ballooning. While we could make that work
for confidential guests. It comes with its own set of problems, and in order to
simplify the memory management, this series come with a proposal for mapping these
specific pages in advance and telling the guest the location. That helps reducing
the scope of this new ABI. Ballooning implementation hasn't been fully considered yet.

This series propose a new hypercall interface designed for use by guests kernels
with high performance (low hypercall overhead) and confidential computing environments
(notably AMD SEV) compatibility in mind. It currently only supports x86 long mode
(64-bits) due to specific register requirements.

It doesn't aim to entirely replace the current ABI, but to propose a alternative
one that could be used by guests as a fast-path ABI or for confidential computing
guests.

This new ABI maps into current many operations (with some limitations), a tool is
provided to generate C stubs using the yaml specification.
These C stubs reuse the existing hypercall structures to ease adding support
for this ABI in guests.

You can find some example generated headers in Linux SEV WIP branch [1].

[1] https://github.com/xcp-ng/linux/tree/xen-sev-6.14/include/xen/interface/fastabi

Teddy Astie (9):
  x86/hvm: Use direct structures instead of guest handles
  common: Isolate XENVER_get_features into a separate function
  common/grant_table: Use direct structures instead of guest handles
  hvm: Introduce "fixed memory layout" feature
  docs/x86: Introduce FastABI
  sched: Extract do_poll main logic into vcpu_poll
  x86/hvm: Introduce FastABI implementation
  hvm: Introduce XEN_HVM_MEMMAP_TYPE_HOTPLUG_ZONE
  tools: Introduce abi-tool

 docs/guest-guide/x86/fastabi.pandoc           |  50 +++++
 .../x86/fixed-memory-layout.pandoc            |  24 ++
 docs/guest-guide/x86/index.rst                |   2 +
 tools/include/xen-tools/common-macros.h       |   4 +
 tools/libs/guest/xg_dom_x86.c                 |  84 +++++++
 tools/libs/light/libxl_create.c               |   1 +
 tools/libs/light/libxl_types.idl              |   1 +
 tools/libs/light/libxl_x86.c                  |  71 ++++++
 tools/xl/xl_parse.c                           |   1 +
 xen/abi/event_channel.yml                     | 130 +++++++++++
 xen/abi/grant_table.yml                       |  46 ++++
 xen/abi/hvm.yml                               |  50 +++++
 xen/abi/memory.yml                            |  11 +
 xen/abi/sched.yml                             |  48 ++++
 xen/abi/vcpu.yml                              | 139 ++++++++++++
 xen/abi/version.yml                           |  15 ++
 xen/arch/x86/cpuid.c                          |   3 +
 xen/arch/x86/domain.c                         |  71 ++++++
 xen/arch/x86/hvm/hvm.c                        | 205 +++++++++++++-----
 xen/arch/x86/hvm/hypercall.c                  |  22 ++
 xen/arch/x86/include/asm/fastabi.h            |  17 ++
 xen/common/Kconfig                            |   6 +
 xen/common/Makefile                           |   1 +
 xen/common/domain.c                           | 179 +++++++++++++++
 xen/common/event_channel.c                    | 199 +++++++++++++++++
 xen/common/fastabi.c                          |  49 +++++
 xen/common/grant_table.c                      | 112 +++++++---
 xen/common/kernel.c                           | 117 ++++++----
 xen/common/memory.c                           | 110 ++++++++++
 xen/common/sched/core.c                       | 149 +++++++++++--
 xen/include/public/arch-x86/cpuid.h           |   4 +
 xen/include/public/arch-x86/hvm/start_info.h  |   8 +
 xen/include/public/event_channel.h            |   7 +
 xen/include/public/fastabi.h                  |  20 ++
 xen/include/xen/fastabi.h                     |  21 ++
 xen/tools/abi-tool/.gitignore                 |   1 +
 xen/tools/abi-tool/Cargo.lock                 | 145 +++++++++++++
 xen/tools/abi-tool/Cargo.toml                 |  11 +
 xen/tools/abi-tool/src/abi.rs                 |  23 ++
 xen/tools/abi-tool/src/c_lang.rs              | 173 +++++++++++++++
 xen/tools/abi-tool/src/main.rs                |  17 ++
 xen/tools/abi-tool/src/spec.rs                |  61 ++++++
 42 files changed, 2265 insertions(+), 143 deletions(-)
 create mode 100644 docs/guest-guide/x86/fastabi.pandoc
 create mode 100644 docs/guest-guide/x86/fixed-memory-layout.pandoc
 create mode 100644 xen/abi/event_channel.yml
 create mode 100644 xen/abi/grant_table.yml
 create mode 100644 xen/abi/hvm.yml
 create mode 100644 xen/abi/memory.yml
 create mode 100644 xen/abi/sched.yml
 create mode 100644 xen/abi/vcpu.yml
 create mode 100644 xen/abi/version.yml
 create mode 100644 xen/arch/x86/include/asm/fastabi.h
 create mode 100644 xen/common/fastabi.c
 create mode 100644 xen/include/public/fastabi.h
 create mode 100644 xen/include/xen/fastabi.h
 create mode 100644 xen/tools/abi-tool/.gitignore
 create mode 100644 xen/tools/abi-tool/Cargo.lock
 create mode 100644 xen/tools/abi-tool/Cargo.toml
 create mode 100644 xen/tools/abi-tool/src/abi.rs
 create mode 100644 xen/tools/abi-tool/src/c_lang.rs
 create mode 100644 xen/tools/abi-tool/src/main.rs
 create mode 100644 xen/tools/abi-tool/src/spec.rs

-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


