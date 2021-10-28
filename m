Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142D343F376
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 01:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218345.378729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgEnf-000454-Bw; Thu, 28 Oct 2021 23:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218345.378729; Thu, 28 Oct 2021 23:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgEnf-00043L-8w; Thu, 28 Oct 2021 23:27:11 +0000
Received: by outflank-mailman (input) for mailman id 218345;
 Thu, 28 Oct 2021 23:27:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4/Z=PQ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mgEnd-00043F-Ea
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 23:27:09 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6670aa09-9939-4d19-9872-2c97554643db;
 Thu, 28 Oct 2021 23:27:08 +0000 (UTC)
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
X-Inumbo-ID: 6670aa09-9939-4d19-9872-2c97554643db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635463627;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QlWcwayW5CxhvXGoPasCNax8f8rHN7qc15u+X7fUJio=;
  b=OwzL+rPdXmay+MqXHWJ3WwIUuqjKpEddJpa+P4SDFypX7VdLEOMmU4+B
   pmM1G7SxOhH0QrFOQfFcue1IVx+N9HdwfCrnoZO/o31HrsTbcIv5xD/pt
   ndWgBLTBt/VhmXpgVnAK7xnP/kH3UFA3MritidXajwXOxV26TRwMIPOwa
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Finsqbu55MIkTc0MulkVXNihMwDdrxruU2ptGip3ug7VUhWBEm0cJsnxlHoRQK/P/7EGevjUEY
 01n3FB21VX5BsHSx6JjJ+dSpxJIt7yLuh5DWVh7sXo5LgasSxCDDxTUSszXdBLBf39t/lnBT8k
 OOYCLRj2Q9gkiy4vQHm7lmaftuFadOG/MBciGnMeH4spEzHMEVYhpLLHGai1qYZW2HmjuUdc6V
 VGzP7rKtnNVD+kV4GyNAET/cXHOWfm/Z45ygxifac/Cdh2TzH5Mze0Fmvt0zk10j5vsbx9Up6T
 QD4650j2nPhiQae0JeodVE07
X-SBRS: 5.1
X-MesageID: 57000582
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sMYEC6JozSlDze2iFE+RNZIlxSXFcZb7ZxGr2PjKsXjdYENShWcOm
 jEfWWmAPffYZTT2eNFwYIji9E4EuZaHx9VrGwNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5y7Zi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Ug8Fo6
 McXj6WpEwV3FaPppvYabB1HRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpv3pgWQKaED
 yYfQSNJPDWHQFpJBlI4MZAQkdm2nXDvdjIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 33E13T0BAkAM96SwibD9Wij7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc/B1J
 lEQ+yEuhbMv70HtRd74NyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEBZUi9YSM58jvYvHz50/
 VGsocHuOjhw5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEY49SP/dYsndXGiqm
 WjT/XdWa6A71JZTj82GEUb7byVAT3QjZjU+4RnLRSqb5wd9aZ/Ni2eAuAWDs6gowGp0SDC8U
 Jk4dyq2sL9m4XKlznXlrAAx8FeBvavt3Nr02gcHInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSXxMPMrPd/sW51yl8AM8OgJsNiOM7KihbAqLWe6ENxGPxbMjwgBbmB1ycnTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+8zN7Ti7eHwP9Dz+ieD2TCfMEd8taQLSBshkvPLsiFiEq
 L53aprVoyizpcWjO0E7B6ZIdgtURZX6bLirw/FqmhmreVs4ST54Ua+BndvMueVNxsxoqwsBx
 VnlMmcw9bY1rSevxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:/aOxAK97VcxScLwVWLZuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+8jztCWE7Ar5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslvd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.87,191,1631592000"; 
   d="scan'208";a="57000582"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH] x86/kexec: Fix crash on transition to a 32bit kernel on AMD hardware
Date: Fri, 29 Oct 2021 00:26:58 +0100
Message-ID: <20211028232658.20637-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The `ljmp *mem` instruction is (famously?) not binary compatible between Intel
and AMD CPUS.  The AMD-compatible version would require .long to be .quad in
the second hunk.

Switch to using lretq, which is compatible between Intel and AMD, as well as
being less logic overall.

Fixes: 5a82d5cf352d ("kexec: extend hypercall with improved load/unload ops")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

For 4.16.  This is a bugfix for rare (so rare it has probably never been
exercised) but plain-broken usecase.

One argument against taking it says that this has been broken for 8 years
already, so what's a few extra weeks.  Another is that this patch is only
compile tested because I don't have a suitable setup to repro, nor the time to
try organising one.

On the other hand, I specifically used the point of binary incompatibility to
persuade Intel to drop Call Gates out of the architecture in the forthcoming
FRED spec.

The lretq pattern used here matches x86_32_switch() in
xen/arch/x86/boot/head.S, and this codepath is executed on every MB2+EFI
xen.gz boot, which from XenServer alone is a very wide set of testing.
---
 xen/arch/x86/x86_64/kexec_reloc.S | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index d488d127cfb9..a93f92b19248 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -86,12 +86,11 @@ call_32_bit:
         movq    %rax, (compat_mode_gdt_desc + 2)(%rip)
         lgdt    compat_mode_gdt_desc(%rip)
 
-        /* Relocate compatibility mode entry point address. */
-        leal    compatibility_mode(%rip), %eax
-        movl    %eax, compatibility_mode_far(%rip)
-
         /* Enter compatibility mode. */
-        ljmp    *compatibility_mode_far(%rip)
+        lea     compatibility_mode(%rip), %rax
+        push    $0x10
+        push    %rax
+        lretq
 
 relocate_pages:
         /* %rdi - indirection page maddr */
@@ -171,10 +170,6 @@ compatibility_mode:
         ud2
 
         .align 4
-compatibility_mode_far:
-        .long 0x00000000             /* set in call_32_bit above */
-        .word 0x0010
-
 compat_mode_gdt_desc:
         .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
         .quad 0x0000000000000000     /* set in call_32_bit above */
-- 
2.11.0


