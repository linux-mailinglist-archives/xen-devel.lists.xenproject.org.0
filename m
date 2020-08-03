Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440F223A8F0
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 16:54:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2bqc-0005Y6-RO; Mon, 03 Aug 2020 14:53:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2bqa-0005Xr-Pi
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 14:53:52 +0000
X-Inumbo-ID: 25152b08-d599-11ea-9097-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25152b08-d599-11ea-9097-bc764e2007e4;
 Mon, 03 Aug 2020 14:53:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC755AC24;
 Mon,  3 Aug 2020 14:54:06 +0000 (UTC)
Subject: [PATCH 08/10] x86emul: AVX512PF insns aren't memory accesses
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Message-ID: <aa4533ca-401e-4e0b-6b81-e8e4c42b9d77@suse.com>
Date: Mon, 3 Aug 2020 16:53:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These are prefetches, so should be treated just like other prefetches.

Fixes:  ("x86emul: support AVX512PF insns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -12265,6 +12265,8 @@ x86_insn_is_mem_access(const struct x86_
          ... X86EMUL_OPC_F2(0x0f, 0x1f): /* NOP space */
         case X86EMUL_OPC(0x0f, 0xb9): /* UD1 */
         case X86EMUL_OPC(0x0f, 0xff): /* UD0 */
+        case X86EMUL_OPC_EVEX_66(0x0f38, 0xc6): /* V{GATH,SCATT}ERPF*D* */
+        case X86EMUL_OPC_EVEX_66(0x0f38, 0xc7): /* V{GATH,SCATT}ERPF*Q* */
             return false;
 
         case X86EMUL_OPC(0x0f, 0x01):


