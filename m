Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0E2233FB8
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 09:07:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1P7m-0005QN-Kv; Fri, 31 Jul 2020 07:06:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1P7l-0005QI-Kx
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 07:06:37 +0000
X-Inumbo-ID: 5f769cb8-d2fc-11ea-8e12-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f769cb8-d2fc-11ea-8e12-bc764e2007e4;
 Fri, 31 Jul 2020 07:06:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D48F4ACDB;
 Fri, 31 Jul 2020 07:06:48 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: replace UB shifts
Message-ID: <bd679766-939d-3176-c913-e993dd48ef15@suse.com>
Date: Fri, 31 Jul 2020 09:06:35 +0200
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Displacement values can be negative, hence we shouldn't left-shift them.

While auditing shifts, I noticed a pair of missing parentheses, which
also get added right here.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3370,7 +3370,7 @@ x86_decode(
         {
             generate_exception_if(d & vSIB, EXC_UD);
             modrm_rm |= ((rex_prefix & 1) << 3) |
-                        (evex_encoded() && !evex.x) << 4;
+                        ((evex_encoded() && !evex.x) << 4);
             ea.type = OP_REG;
         }
         else if ( ad_bytes == 2 )
@@ -3417,7 +3417,7 @@ x86_decode(
                     ea.mem.off = insn_fetch_type(int16_t);
                 break;
             case 1:
-                ea.mem.off += insn_fetch_type(int8_t) << disp8scale;
+                ea.mem.off += insn_fetch_type(int8_t) * (1 << disp8scale);
                 break;
             case 2:
                 ea.mem.off += insn_fetch_type(int16_t);
@@ -3479,7 +3479,7 @@ x86_decode(
                 pc_rel = mode_64bit();
                 break;
             case 1:
-                ea.mem.off += insn_fetch_type(int8_t) << disp8scale;
+                ea.mem.off += insn_fetch_type(int8_t) * (1 << disp8scale);
                 break;
             case 2:
                 ea.mem.off += insn_fetch_type(int32_t);
@@ -10028,7 +10028,8 @@ x86_emulate(
                 continue;
 
             rc = ops->write(ea.mem.seg,
-                            truncate_ea(ea.mem.off + (idx << state->sib_scale)),
+                            truncate_ea(ea.mem.off +
+                                        idx * (1 << state->sib_scale)),
                             (void *)mmvalp + i * op_bytes, op_bytes, ctxt);
             if ( rc != X86EMUL_OKAY )
             {
@@ -10146,7 +10147,7 @@ x86_emulate(
                   ? ops->write
                   : ops->read)(ea.mem.seg,
                                truncate_ea(ea.mem.off +
-                                           (idx << state->sib_scale)),
+                                           idx * (1 << state->sib_scale)),
                                NULL, 0, ctxt);
             if ( rc == X86EMUL_EXCEPTION )
             {

