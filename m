Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5270623A8EC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 16:53:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2bq9-0005UL-I6; Mon, 03 Aug 2020 14:53:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2bq8-0005UA-HG
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 14:53:24 +0000
X-Inumbo-ID: 1431a5dc-d599-11ea-9097-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1431a5dc-d599-11ea-9097-bc764e2007e4;
 Mon, 03 Aug 2020 14:53:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66E08B751;
 Mon,  3 Aug 2020 14:53:37 +0000 (UTC)
Subject: [PATCH 07/10] x86emul: AVX512F scatter insns are memory writes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Message-ID: <752561bb-ab7a-e7c0-3bce-832b2162c755@suse.com>
Date: Mon, 3 Aug 2020 16:53:21 +0200
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

While the custom handling renders the "to_mem" field generally unused,
x86_insn_is_mem_write() still (indirectly) consumes that information,
and hence the table entries want to be correct.

Fixes:  ("x86emul: support AVX512F scatter insns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -516,7 +516,7 @@ static const struct ext0f38_table {
     [0x9d] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x9e] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0x9f] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xa0 ... 0xa3] = { .simd_size = simd_other, .vsib = 1, .d8s = d8s_dq },
+    [0xa0 ... 0xa3] = { .simd_size = simd_other, .to_mem = 1, .vsib = 1, .d8s = d8s_dq },
     [0xa6 ... 0xa8] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0xa9] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xaa] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },


