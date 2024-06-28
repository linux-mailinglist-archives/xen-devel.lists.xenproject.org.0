Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C976C91B421
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 02:39:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750419.1158581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMze3-0007Yv-CY; Fri, 28 Jun 2024 00:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750419.1158581; Fri, 28 Jun 2024 00:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMze3-0007XQ-9n; Fri, 28 Jun 2024 00:39:19 +0000
Received: by outflank-mailman (input) for mailman id 750419;
 Fri, 28 Jun 2024 00:39:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0kmA=N6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1sMze2-0007XI-7E
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2024 00:39:18 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d84b42e8-34e6-11ef-90a3-e314d9c70b13;
 Fri, 28 Jun 2024 02:39:16 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.17.1) with ESMTPS id 45S0d7jJ053794
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 27 Jun 2024 20:39:13 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 45S0d7g5053793;
 Thu, 27 Jun 2024 17:39:07 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: d84b42e8-34e6-11ef-90a3-e314d9c70b13
Date: Thu, 27 Jun 2024 17:39:07 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Xen C-state Issues
Message-ID: <Zn4GK2Anwu2lKBUd@mattapan.m5p.com>
References: <YSEo9Box2AFnmdLZ@mattapan.m5p.com>
 <dea9cf97-9332-b1c9-2cff-d87564832529@suse.com>
 <YSSFffDK5/5MUAdj@mattapan.m5p.com>
 <09fc5490-5b14-474c-dbe0-864952f19a33@suse.com>
 <YSbryyxk5G7xqHlQ@mattapan.m5p.com>
 <5a648db8-bf89-a58b-ba4b-bb992d68e82e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a648db8-bf89-a58b-ba4b-bb992d68e82e@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Thu, Aug 26, 2021 at 09:51:54AM +0200, Jan Beulich wrote:
> On 26.08.2021 03:18, Elliott Mitchell wrote:
> 
> > What you're writing about would be looking for bugs in development
> > branches.
> 
> Very much so, in case there are issues left, or ones have got
> reintroduced. That's what the primary purpose of this list is.
> 
> If you were suspecting missing fixes in the kernel, I guess xen-devel
> isn't the preferred channel anyway. Otoh the stable maintainers there
> would likely want concrete commits pointed out ...

Yikes, too many things on plate and never getting back to this.  With
Xen 4.17 and Linux 6.1.  When giving domain-0, 6-vCPUs `dmesg` shows:

xen_acpi_processor: Max ACPI ID: 62
xen_acpi_processor: Uploading Xen processor PM info
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
xen_acpi_processor: ACPI CPU4 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU4 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU6 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU6 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU8 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU8 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU10 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU10 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU0 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU0 w/ PST:coord_type = 254 domain = 0
xen_acpi_processor: ACPI CPU1 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU1 w/ PST:coord_type = 254 domain = 0
xen_acpi_processor: ACPI CPU2 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU2 w/ PST:coord_type = 254 domain = 1
xen_acpi_processor: ACPI CPU3 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU3 w/ PST:coord_type = 254 domain = 1
xen_acpi_processor: ACPI CPU4 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU4 w/ PST:coord_type = 254 domain = 2
xen_acpi_processor: ACPI CPU5 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU5 w/ PST:coord_type = 254 domain = 2
xen_acpi_processor: ACPI CPU6 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU6 w/ PST:coord_type = 254 domain = 3
xen_acpi_processor: ACPI CPU7 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU7 w/ PST:coord_type = 254 domain = 3
xen_acpi_processor: ACPI CPU8 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU8 w/ PST:coord_type = 254 domain = 4
xen_acpi_processor: ACPI CPU9 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU9 w/ PST:coord_type = 254 domain = 4
xen_acpi_processor: ACPI CPU10 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU10 w/ PST:coord_type = 254 domain = 5
xen_acpi_processor: ACPI CPU11 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU11 w/ PST:coord_type = 254 domain = 5
xen_acpi_processor: ACPI CPU12 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU12 w/ PST:coord_type = 254 domain = 6
xen_acpi_processor: ACPI CPU13 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU13 w/ PST:coord_type = 254 domain = 6
xen_acpi_processor: ACPI CPU14 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU14 w/ PST:coord_type = 254 domain = 7
xen_acpi_processor: ACPI CPU15 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU15 w/ PST:coord_type = 254 domain = 7
xen_acpi_processor: ACPI CPU16 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU16 w/ PST:coord_type = 254 domain = 8
xen_acpi_processor: ACPI CPU17 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU17 w/ PST:coord_type = 254 domain = 8
xen_acpi_processor: ACPI CPU18 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU18 w/ PST:coord_type = 254 domain = 9
xen_acpi_processor: ACPI CPU19 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU19 w/ PST:coord_type = 254 domain = 9
xen_acpi_processor: ACPI CPU20 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU20 w/ PST:coord_type = 254 domain = 10
xen_acpi_processor: ACPI CPU21 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU21 w/ PST:coord_type = 254 domain = 10
xen_acpi_processor: ACPI CPU22 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU22 w/ PST:coord_type = 254 domain = 11
xen_acpi_processor: ACPI CPU23 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU23 w/ PST:coord_type = 254 domain = 11
xen_acpi_processor: ACPI CPU24 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU24 w/ PST:coord_type = 254 domain = 12
xen_acpi_processor: ACPI CPU25 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU25 w/ PST:coord_type = 254 domain = 12
xen_acpi_processor: ACPI CPU26 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU26 w/ PST:coord_type = 254 domain = 13
xen_acpi_processor: ACPI CPU27 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU27 w/ PST:coord_type = 254 domain = 13
xen_acpi_processor: ACPI CPU28 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU28 w/ PST:coord_type = 254 domain = 14
xen_acpi_processor: ACPI CPU29 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU29 w/ PST:coord_type = 254 domain = 14
xen_acpi_processor: ACPI CPU30 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU30 w/ PST:coord_type = 254 domain = 15
xen_acpi_processor: ACPI CPU31 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU31 w/ PST:coord_type = 254 domain = 15
xen_acpi_processor: ACPI CPU1 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU3 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU5 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU7 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU9 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU11 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU12 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU13 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU14 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU15 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU16 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU17 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU18 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU19 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU20 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU21 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU22 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU23 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU24 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU25 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU26 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU27 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU28 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU29 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU30 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS
xen_acpi_processor: ACPI CPU31 - P-states uploaded.
xen_acpi_processor:      *P0: 4500 MHz, 5625 mW, 0 uS
xen_acpi_processor:       P1: 3000 MHz, 2550 mW, 0 uS

While Linux's `xen_acpi_processor.ko` module is part of the Linux kernel,
the Xen project should be concerned with this.  This matches with what
`xenpm get-cpuidle-states`/`xenpm get-cpufreq-states` seem to indicate.

P-state information is being uploaded to Xen for every core.  C-state
information is only being uploaded to Xen for cores which domain-0 has a
corresponding vCPU.

There is a simple mitigation, but I would certainly prefer a proper
solution.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



