Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1088374A9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 21:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670146.1042757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rS1IG-0001MO-8L; Mon, 22 Jan 2024 20:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670146.1042757; Mon, 22 Jan 2024 20:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rS1IG-0001Kp-5Q; Mon, 22 Jan 2024 20:53:20 +0000
Received: by outflank-mailman (input) for mailman id 670146;
 Mon, 22 Jan 2024 20:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LWrC=JA=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rS1IF-0001Kj-38
 for xen-devel@lists.xen.org; Mon, 22 Jan 2024 20:53:19 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41f78cc2-b968-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 21:53:14 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 40MKr3NJ062650
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 22 Jan 2024 15:53:09 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 40MKr3nY062649;
 Mon, 22 Jan 2024 12:53:03 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 41f78cc2-b968-11ee-9b0f-b553b5be7939
Date: Mon, 22 Jan 2024 12:53:03 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xen.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Thoughts on current Xen EDAC/MCE situation
Message-ID: <Za7Vr+Rb25y/+MSy@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

I've been mentioning this on a regular basis, but the state of MCE
handling with Xen seems poor.

I find the present handling of MCE in Xen an odd choice.  Having Xen do
most of the handling of MCE events is a behavior matching a traditional
stand-alone hypervisor.  Yet Xen was originally pushing any task not
requiring hypervisor action onto Domain 0.

MCE seems a perfect match for sharing responsibility with Domain 0.
Domain 0 needs to know about any MCE event, this is where system
administrators will expect to find logs.  In fact, if the event is a
Correctable Error, then *only* Domain 0 needs to know.  For a CE, Xen
may need no action at all (an implementation could need help) and
the effected domain would need no action.  It is strictly for
Uncorrectable Errors that action beside logging is needed.

For a UE memory error, the best approach might be for Domain 0 to decode
the error.  Once Domain 0 determines it is UE, invoke a hypercall to pass
the GPFN to Xen.  Xen would then forcibly unmap the page (similar to what
Linux does to userspace for corrupted pages).  Xen would then identify
what the page was used for, alert the domain and return that to Domain 0.


The key advantage of this approach is it makes MCE handling act very
similar to MCE handling without Xen.  Documentation about how MCEs are
reported/decoded would apply equally to Xen.  Another rather important
issue is it means less maintenance work to keep MCE handling working with
cutting-edge hardware.  I've noticed one vendor being sluggish about
getting patches into Linux and I fear similar issues may apply more
severely to Xen.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



