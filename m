Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A866E539630
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 20:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339936.564857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6VZ-0001EN-4A; Tue, 31 May 2022 18:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339936.564857; Tue, 31 May 2022 18:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6VZ-0001C1-19; Tue, 31 May 2022 18:22:21 +0000
Received: by outflank-mailman (input) for mailman id 339936;
 Tue, 31 May 2022 18:22:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nw6VY-0001Bv-0t
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 18:22:20 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99b19747-e10e-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 20:22:18 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654021329834917.9817460474425;
 Tue, 31 May 2022 11:22:09 -0700 (PDT)
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
X-Inumbo-ID: 99b19747-e10e-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1654021334; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wp5+TSjauFy6EGGZIt5qjwVblic4+pobd2jhIwU8RPb+NktbA3DP4NtPqmsEfV7Nd83YKJu5JwV4Sm+A3MUVO1S5wOOrxo/CVg0zcLUGR7WtnrJTZgEmZ85olsgayuVdaBOU+hxsaJANsxe9QAvTK2o3jUj+4e0oFXJfz87ICVQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654021334; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=jWXI3JIoau3kt0MxfNomZ5YC5oHP8ua1nV5SsGfTDV4=; 
	b=XXTenUnRWMrKfnUizNQ3fpUabGStmdsa7SHxLYCX6oNWznKCIem+p3O4skTIigo2aSlip27iDoce3e8bod7vHrQZzQiQ+mfRbzibNhgxpLK15FZOaoDfiAkb1p6rcvpy/F+vBHR9M/fqdN3+jiPX6eRTcSaeQrBKLVJklNOq3yk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654021334;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=jWXI3JIoau3kt0MxfNomZ5YC5oHP8ua1nV5SsGfTDV4=;
	b=IOm2LFXvSVnuxzdbdUZJ12Tm1VxrHAccaZG6npp9OLWwLxFr8I67OhNAM9jrXqD1
	WATn7pApjxC8qIsO97QGA/7EKWaY99+oP6HuMJ8Mi2V/O2ssgzN94SSh9pKwyVP29Os
	ErAZqgiOeBE1J7f8fEJeiXNFR3LFO55P/HsPowOI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	jandryuk@gmail.com
Subject: [PATCH v4 0/3] xsm: refactor and optimize policy loading
Date: Tue, 31 May 2022 14:20:38 -0400
Message-Id: <20220531182041.10640-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series was born out of some cleanup work done while crafting the
hyperlaunch boot modules patch series. The primary purpose of this series was
to stop walking all boot modules when it was not necessary, but the scope
creeped during review.

Changes in v4:
* rewroked xsm_{multiboot,dt}_init() to support flask=late
* applied the correct types to the policy_buffer for DT
* change type from array to pointer on xsm_multiboot_policy_init()

Changes in v3:
* added arm Rb for patch #3
* mainly a resend due to fubar on sending v2

Changes in v2:
* changed init_policy to policy_file_required
* split the patch into a series
* corrected casting of policy buffer
* use IS_ENABLED() instead of #ifdef sequence
* moved #ifdef inside of braces for xsm_dt_policy_init()
* addressed lack of error handling of xsm{mb,dt}_init()

Daniel P. Smith (3):
  xsm: only search for a policy file when needed
  xsm: consolidate loading the policy buffer
  xsm: properly handle error from XSM init

 xen/arch/arm/setup.c  | 10 ++---
 xen/arch/x86/setup.c  |  9 ++++-
 xen/include/xsm/xsm.h |  2 +-
 xen/xsm/xsm_core.c    | 89 ++++++++++++++++++++++++-------------------
 xen/xsm/xsm_policy.c  | 34 ++++++++++++++---
 5 files changed, 91 insertions(+), 53 deletions(-)

-- 
2.20.1


