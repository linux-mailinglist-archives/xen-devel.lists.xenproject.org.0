Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A857B752E44
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 02:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563443.880645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK6ZY-0007XR-0y; Fri, 14 Jul 2023 00:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563443.880645; Fri, 14 Jul 2023 00:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK6ZX-0007UY-UU; Fri, 14 Jul 2023 00:22:11 +0000
Received: by outflank-mailman (input) for mailman id 563443;
 Fri, 14 Jul 2023 00:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uaxh=DA=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qK6ZW-0007US-Hb
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 00:22:10 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 773b2297-21dc-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 02:22:08 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36E0Luni098961
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 13 Jul 2023 20:22:02 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36E0LuEM098960;
 Thu, 13 Jul 2023 17:21:56 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 773b2297-21dc-11ee-8611-37d641c3527e
Message-Id: <a8223a339a0b8ff3c0d04fb4ee2913c7558cc131.1689294071.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Thu, 13 Jul 2023 17:16:40 -0700
Subject: [PATCH] docs/xen-tscmode: remove mention of numeric tsc_mode= values
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

The better to encourage moving to setting via string mode names.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
I'm not actually sure what tsc_mode==0 does.  I didn't find other
references, so I'm unsure how that should be modified.
---
 docs/man/xen-tscmode.7.pod | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/docs/man/xen-tscmode.7.pod b/docs/man/xen-tscmode.7.pod
index 1d81a3fe18..80aea77f76 100644
--- a/docs/man/xen-tscmode.7.pod
+++ b/docs/man/xen-tscmode.7.pod
@@ -63,19 +63,19 @@ The non-default choices for tsc_mode are:
 
 =over 4
 
-=item * B<tsc_mode=1> (always emulate).
+=item * B<tsc_mode='always_emulate'> (always emulate).
 
 All rdtsc instructions are emulated; this is the best choice when
 TSC-sensitive apps are running and it is necessary to understand
 worst-case performance degradation for a specific hardware environment.
 
-=item * B<tsc_mode=2> (never emulate).
+=item * B<tsc_mode='native'> (never emulate).
 
 This is the same as prior to Xen 4.0 and is the best choice if it
 is certain that all apps running in this VM are TSC-resilient and
 highest performance is required.
 
-=item * B<tsc_mode=3> (PVRDTSCP).
+=item * B<tsc_mode='native_paravirt'> (PVRDTSCP).
 
 This mode has been removed.
 
@@ -200,10 +200,10 @@ per second per processor), this performance degradation is not noticeable
 OS-provided alternatives (e.g. Linux's gettimeofday).  For environments
 where it is certain that all apps are TSC-resilient (e.g.
 "TSC-safeness" is not necessary) and highest performance is a
-requirement, TSC emulation may be entirely disabled (tsc_mode==2).
+requirement, TSC emulation may be entirely disabled (tsc_mode='native').
 
-The default mode (tsc_mode==0) checks TSC-safeness of the underlying
-hardware on which the virtual machine is launched.  If it is
+The default mode (tsc_mode='always_emulate') checks TSC-safeness of the
+underlying hardware on which the virtual machine is launched.  If it is
 TSC-safe, rdtsc will execute at hardware speed; if it is not, rdtsc
 will be emulated.  Once a virtual machine is save/restored or migrated,
 however, there are two possibilities: TSC remains native IF the source
@@ -213,12 +213,13 @@ is emulated.  Note that, though emulated, the "apparent" TSC frequency
 will be the TSC frequency of the initial physical machine, even after
 migration.
 
-Finally, tsc_mode==1 always enables TSC emulation, regardless of
+Finally, tsc_mode='always_emulate' always enables TSC emulation, regardless of
 the underlying physical hardware. The "apparent" TSC frequency will
 be the TSC frequency of the initial physical machine, even after migration.
 This mode is useful to measure any performance degradation that
 might be encountered by a tsc_mode==0 domain after migration occurs,
-or a tsc_mode==3 domain when it is running on TSC-unsafe hardware.
+or a tsc_mode='native_paravirt' domain when it is running on
+TSC-unsafe hardware.
 
 Note that while Xen ensures that an emulated TSC is "safe" across migration,
 it does not ensure that it continues to tick at the same rate during
-- 
2.30.2


