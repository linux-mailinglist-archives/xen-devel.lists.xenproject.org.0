Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2106844E1C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 01:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674204.1048990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVLD1-0006aP-QM; Thu, 01 Feb 2024 00:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674204.1048990; Thu, 01 Feb 2024 00:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVLD1-0006YY-Na; Thu, 01 Feb 2024 00:45:39 +0000
Received: by outflank-mailman (input) for mailman id 674204;
 Thu, 01 Feb 2024 00:45:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M+6X=JK=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rVLCz-0006YN-TU
 for xen-devel@lists.xen.org; Thu, 01 Feb 2024 00:45:37 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 353b2bce-c09b-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 01:45:35 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4110jL33006593
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 31 Jan 2024 19:45:27 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 4110jLE7006592;
 Wed, 31 Jan 2024 16:45:21 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 353b2bce-c09b-11ee-8a43-1f161083a0e0
Date: Wed, 31 Jan 2024 16:45:21 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
Subject: Re: Thoughts on current Xen EDAC/MCE situation
Message-ID: <Zbrpoa3b5PuwBDTa@mattapan.m5p.com>
References: <Za7Vr+Rb25y/+MSy@mattapan.m5p.com>
 <111f5551-70fa-4ded-a62a-e0aa967b3c29@suse.com>
 <ZbBDJGKqTU9rdpgD@mattapan.m5p.com>
 <e7d67831-d7b9-48fd-9478-f89e85ce0422@suse.com>
 <ZbEq2JLY25TyLltX@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbEq2JLY25TyLltX@mattapan.m5p.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Wed, Jan 24, 2024 at 07:20:56AM -0800, Elliott Mitchell wrote:
> On Wed, Jan 24, 2024 at 08:23:15AM +0100, Jan Beulich wrote:
> > 
> > Third, as to Dom0's purposes of having the address: If all it is to use
> > it for is to pass it back to Xen, paths in the respective drivers will
> > necessarily be entirely different for the Xen vs the native cases.
> 
> I'm less than certain of the best place for Xen to intercept MCE events.
> For UE memory events, the simplest approach on Linux might be to wrap the
> memory_failure() function.  Yet for Linux/x86,
> mce_register_decode_chain() also looks like a very good candidate.

I did hope to get some response.

It really does look like, aside from being x86-only,
mce_register_decode_chain() is the ideal hook point.  Xen could forward
NMIs to Domain 0, then intercept them from the decode chain.  For UEs
Xen would mark the event handled, then create a new event for whichever
domain (if any) was effected.


Right now my main concern is several of the Linux MCE/EDAC drivers are
growing `if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR)) return -ENODEV;`
calls.

This approach is being poisoned and will become quite difficult if this
isn't stopped.  The justification found for one instance was that it
"removed one message", with no useful information.  I cannot help
suspecting it involved a hypervisor from Redmond, WA and their engineers
are encouraged to poison interfaces used by others.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



