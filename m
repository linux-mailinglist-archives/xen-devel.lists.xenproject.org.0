Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A450215A76
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 17:14:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsSpB-00044O-Hb; Mon, 06 Jul 2020 15:14:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jsSp9-00044B-HM
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 15:14:27 +0000
X-Inumbo-ID: 61688384-bf9b-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61688384-bf9b-11ea-b7bb-bc764e2007e4;
 Mon, 06 Jul 2020 15:14:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 553E7AAD0;
 Mon,  6 Jul 2020 15:14:26 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: fix FXRSTOR test for most AMD CPUs
Message-ID: <29986a8f-47bf-43c2-98e9-e08c1c5925af@suse.com>
Date: Mon, 6 Jul 2020 17:14:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

AMD CPUs that we classify as X86_BUG_FPU_PTRS don't touch the selector/
offset portion of the save image during FXSAVE unless an unmasked
exception is pending. Hence the selector zapping done between the
initial FXSAVE and the emulated FXRSTOR needs to be mirrored onto the
second FXSAVE, output of which gets fed into memcmp() to compare with
the input image.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2577,6 +2577,7 @@ int main(int argc, char **argv)
         regs.ecx = (unsigned long)(res + 0x81);
         rc = x86_emulate(&ctxt, &emulops);
         asm volatile ( "fxsave %0" : "=m" (res[0x100]) :: "memory" );
+        zap_xfpsel(&res[0x100]);
         if ( (rc != X86EMUL_OKAY) ||
              memcmp(res + 0x100, res + 0x80, 0x200) ||
              (regs.eip != (unsigned long)&instr[4]) )

