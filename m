Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B13375119E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 22:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562749.879545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJg2q-00049Y-SC; Wed, 12 Jul 2023 20:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562749.879545; Wed, 12 Jul 2023 20:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJg2q-00047f-Oz; Wed, 12 Jul 2023 20:02:40 +0000
Received: by outflank-mailman (input) for mailman id 562749;
 Wed, 12 Jul 2023 20:02:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cscr=C6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qJg2o-00047T-VS
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 20:02:38 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a4cf889-20ef-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 22:02:35 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36CK2IJs091884
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 12 Jul 2023 16:02:24 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36CK2IMq091883;
 Wed, 12 Jul 2023 13:02:18 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 0a4cf889-20ef-11ee-8611-37d641c3527e
Message-Id: <cover.1689191941.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
Date: Wed, 12 Jul 2023 12:59:01 -0700
Subject: [PATCH v3 0/3] Fixing ACPI error reporting display
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

This series has been seen previously.  The issue is pretty simple, if
ACPI errors occur there is a high probability they will occur on multiple
cores at once.  Since there is no locking for `printk()` there is a need
to emit the entire error with a single `printk()`.

I believe this is roughly where things left off.  The loop adjustment had
been requested to be broken into a separate step.  I had also goofed when
adjusting the handling and the string order had gotten reversed.

I'm unsure how best to make the `printk()` more maintainable.  Yet more
"%s" and entries[#] will be needed if additional bits get defined.  I'm
inclined to keep the string broken apart to hint as to how it matches
the entry list.  I'm okay with everything being fully concatenated if
that is felt best.


Elliott Mitchell (3):
  x86/APIC: include full string with error_interrupt() error messages
  x86/APIC: modify error_interrupt() to output using single printk()
  x86/APIC: adjustments to error_interrupt() loop

 xen/arch/x86/apic.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

-- 
2.30.2


