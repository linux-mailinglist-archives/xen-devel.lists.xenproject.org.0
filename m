Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3904C3623
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 20:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278590.475905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNK6v-0006BI-PO; Thu, 24 Feb 2022 19:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278590.475905; Thu, 24 Feb 2022 19:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNK6v-00068k-J6; Thu, 24 Feb 2022 19:49:09 +0000
Received: by outflank-mailman (input) for mailman id 278590;
 Thu, 24 Feb 2022 19:49:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTFz=TH=citrix.com=prvs=047b345d9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nNK6u-00068W-JH
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 19:49:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2a6a649-95aa-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 20:49:06 +0100 (CET)
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
X-Inumbo-ID: d2a6a649-95aa-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645732146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bg09nIB9t3NNShfGM6r18m+esMd6e6YTAaEyvnpHPUU=;
  b=eNCBYk9mY+IHLtpKp5nKUMvHZVVgfmNQTLt5LgiIGGybciCmMvPa3Zsd
   HC0oGHk1HnO75ADUo6N9lY4qXWUVdunDKGpYeZ39TlP8eDQyrxfeidQCc
   O9QZoe1otm46PorekbekWoIjrxAGJcWe731MvBgTNUOscg90DASWw4Cqj
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64830769
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DtmAGKPuofaQxOvvrR2Zl8FynXyQoLVcMsEvi/4bfWQNrUoj0zRWz
 jccD2uHOa2CMDTwfowgYI3n/EJXu5SDytcyTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZj2NIw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 fNclbrrRSQTAvPPnN03a0Z4AgRSIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQaaFP
 5VHOFKDajzvXSFXfWdOWasct/eShj7iQ21Uo0qK8P9fD2/7k1UqjemF3MDuUtiNSsJYhFqYp
 2TL5T3RW09BcteYzFKt93u2g+bVkCDTWYQMFaa5/PpnnF2SwGMIDBQcE1C8pJGRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy67LGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqOAkVbS1e7/rZnN8wiivldolDAYuZkYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNvBFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gNuFmSx28za67onAMFh
 meJ52u9A7cJYROXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgTywzhR2zftkZ
 s/AGSpJMZr8If45pNZRb71AuYLHOwhknT+DLXwF507PPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPRoyizpNbWO3GNmaZKdAhiBSFiWfje9pwGHsbec1EOMDxwVJfsLUYJJtUNc1J9zbyTo
 BlQmyZwlTLCuJEwAV7SOyA7Nei2Bs4XQLBSFXVEAGtEEkMLOe6HhJrzvbNuFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:1okAAaj13JVPolTDs2anlpUv33BQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.90,134,1643691600"; 
   d="scan'208";a="64830769"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Thiner Logoer
	<logoerthiner1@163.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: x86/CET: Fix S3 resume with shadow stacks active
Date: Thu, 24 Feb 2022 19:48:52 +0000
Message-ID: <20220224194853.17774-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220224194853.17774-1-andrew.cooper3@citrix.com>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The original shadow stack support has an error on S3 resume with very bizzare
fallout.  The BSP comes back up, but APs fail with:

  (XEN) Enabling non-boot CPUs ...
  (XEN) Stuck ??
  (XEN) Error bringing CPU1 up: -5

and then later (on at least two Intel TigerLake platforms), the next HVM vCPU
to be scheduled on the BSP dies with:

  (XEN) d1v0 Unexpected vmexit: reason 3
  (XEN) domain_crash called from vmx.c:4304
  (XEN) Domain 1 (vcpu#0) crashed on cpu#0:

The VMExit reason is EXIT_REASON_INIT, which has nothing to do with the
scheduled vCPU, and will be addressed in a subsequent patch.  It is a
consequence of the APs triple faulting.

The reason the APs triple fault is because we don't tear down the stacks on
suspend.  The idle/play_dead loop is killed in the middle of running, meaning
that the supervisor token is left busy.

On resume, SETSSBSY finds the token already busy, suffers #CP and triple
faults because the IDT isn't configured this early.

Rework the AP bringup path to (re)create the supervisor token.  This ensures
the primary stack is non-busy before use.

Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
Link: https://github.com/QubesOS/qubes-issues/issues/7283
Reported-by: Thiner Logoer <logoerthiner1@163.com>
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Thiner Logoer <logoerthiner1@163.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Thiner Logoer <logoerthiner1@163.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Slightly RFC.  This does fix the crash encountered, but it occurs to me that
there's a race condition when S3 platform powerdown is incident with an
NMI/#MC, where more than just the primary shadow stack can end up busy on
resume.

A larger fix would be to change how we allocate tokens, and always have each
CPU set up its own tokens.  I didn't do this originally in the hopes of having
WRSSQ generally disabled, but that plan failed when encountering reality...

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index fa41990dde0f..5d12937a0e40 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -51,13 +51,21 @@ ENTRY(__high_start)
         test    $CET_SHSTK_EN, %al
         jz      .L_ap_cet_done
 
-        /* Derive MSR_PL0_SSP from %rsp (token written when stack is allocated). */
-        mov     $MSR_PL0_SSP, %ecx
+        /* Derive the supervisor token address from %rsp. */
         mov     %rsp, %rdx
+        and     $~(STACK_SIZE - 1), %rdx
+        or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %rdx
+
+        /*
+         * Write a new supervisor token.  Doesn't matter on boot, but for S3
+         * resume this clears the busy bit.
+         */
+        wrssq   %rdx, (%rdx)
+
+        /* Point MSR_PL0_SSP at the token. */
+        mov     $MSR_PL0_SSP, %ecx
+        mov     %edx, %eax
         shr     $32, %rdx
-        mov     %esp, %eax
-        and     $~(STACK_SIZE - 1), %eax
-        or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %eax
         wrmsr
 
         setssbsy

