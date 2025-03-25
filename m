Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D59A70BEE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 22:13:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926955.1329769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txBZU-0005eG-Qs; Tue, 25 Mar 2025 21:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926955.1329769; Tue, 25 Mar 2025 21:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txBZU-0005bs-OF; Tue, 25 Mar 2025 21:12:28 +0000
Received: by outflank-mailman (input) for mailman id 926955;
 Tue, 25 Mar 2025 21:12:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81Lx=WM=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1txBZT-0005bm-Hf
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 21:12:27 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8197d2c-09bd-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 22:12:24 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 52PLBpj4040624
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 25 Mar 2025 17:11:57 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 52PLBpmb040623;
 Tue, 25 Mar 2025 14:11:51 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: d8197d2c-09bd-11f0-9ea3-5ba50f476ded
Date: Tue, 25 Mar 2025 14:11:51 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: jbeulich@suse.com, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Ray Huang <Ray.Huang@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
        Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/5] xen/acpi: upload power and performance related
 data from a PVH dom0
Message-ID: <Z-McF__J_QVvwnxe@mattapan.m5p.com>
References: <20250306110824.1506699-1-Penny.Zheng@amd.com>
 <20250306110824.1506699-2-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306110824.1506699-2-Penny.Zheng@amd.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Thu, Mar 06, 2025 at 07:08:20PM +0800, Penny Zheng wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> When running as a PVH dom0 the ACPI MADT is crafted by Xen in order to
> report the correct numbers of vCPUs that dom0 has, so the host MADT is
> not provided to dom0.  This creates issues when parsing the power and
> performance related data from ACPI dynamic tables, as the ACPI
> Processor UIDs found on the dynamic code are likely to not match the
> ones crafted by Xen in the dom0 MADT.
> 
> Xen would rely on Linux having filled at least the power and
> performance related data of the vCPUs on the system, and would clone
> that information in order to setup the remaining pCPUs on the system
> if dom0 vCPUs < pCPUs.  However when running as PVH dom0 it's likely
> that none of dom0 CPUs will have the power and performance data
> filled, and hence the Xen ACPI Processor driver needs to fetch that
> information by itself.
> 
> In order to do so correctly, introduce a new helper to fetch the _CST
> data without taking into account the system capabilities from the
> CPUID output, as the capabilities reported to dom0 in CPUID might be
> different from the ones on the host.
> 
> Note that the newly introduced code will only fetch the _CST, _PSS,
> _PPC and _PCT from a single CPU, and clone that information for all the
> other Processors.  This won't work on an heterogeneous system with
> Processors having different power and performance related data between
> them.

I'm unsure whether the above description is inaccurate versus what I've
seen being a distinct issue.

This also effects PV domain 0 and isn't limited to AMD processors.  In
particular if domain 0 is PV, C-states will only be uploaded for
processors which domain 0 has a corresponding vCPU.

xen-acpi-processor uploads C/P-states in two passes.  The first pass
being for processors which domain 0 has a vCPU.  The second pass being
for all physical processors.  In a PV domain 0, xen-acpi-processor is
unable to upload C-states during the second pass.

Snippet from pass 1:

xen_acpi_processor: ACPI CPU0 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU0 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU2 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU2 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS

Intermediate:
xen_acpi_processor: ACPI CPU0 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU0 w/ PST:coord_type = 254 domain = 0
xen_acpi_processor: ACPI CPU1 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU1 w/ PST:coord_type = 254 domain = 0
xen_acpi_processor: ACPI CPU2 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU2 w/ PST:coord_type = 254 domain = 1
xen_acpi_processor: ACPI CPU3 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU3 w/ PST:coord_type = 254 domain = 1

Snippet from pass 2:
xen_acpi_processor: ACPI CPU1 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU3 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS

Come to think of it, I've been wondering about the mapping between Xen
CPU numbers and ACPI CPU numbers...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



