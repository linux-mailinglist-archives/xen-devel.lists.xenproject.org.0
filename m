Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82487191669
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 17:29:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGmNT-00032X-Vd; Tue, 24 Mar 2020 16:26:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGmNT-00032S-4J
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 16:26:07 +0000
X-Inumbo-ID: 28bf6436-6dec-11ea-8475-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28bf6436-6dec-11ea-8475-12813bfff9fa;
 Tue, 24 Mar 2020 16:26:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8C3C2AC19;
 Tue, 24 Mar 2020 16:26:04 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Message-ID: <553aaf64-1171-2354-95a9-d5e54d3b21c4@suse.com>
Date: Tue, 24 Mar 2020 17:26:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH 1/7] x86emul: add wrappers to check for AMD-like
 behavior
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

These are to aid readbility at their use sites, in particular because
we're going to gain more of them.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1836,6 +1836,18 @@ in_protmode(
     return !(in_realmode(ctxt, ops) || (ctxt->regs->eflags & X86_EFLAGS_VM));
 }
 
+static bool
+_amd_like(const struct cpuid_policy *cp)
+{
+    return cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON);
+}
+
+static bool
+amd_like(const struct x86_emulate_ctxt *ctxt)
+{
+    return _amd_like(ctxt->cpuid);
+}
+
 #define vcpu_has_fpu()         (ctxt->cpuid->basic.fpu)
 #define vcpu_has_sep()         (ctxt->cpuid->basic.sep)
 #define vcpu_has_cx8()         (ctxt->cpuid->basic.cx8)
@@ -1995,7 +2007,7 @@ protmode_load_seg(
         case x86_seg_tr:
             goto raise_exn;
         }
-        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+        if ( !_amd_like(cp) ||
              !ops->read_segment ||
              ops->read_segment(seg, sreg, ctxt) != X86EMUL_OKAY )
             memset(sreg, 0, sizeof(*sreg));
@@ -2122,9 +2134,7 @@ protmode_load_seg(
          *   - all 16 bytes read with the high 8 bytes ignored on AMD.
          */
         bool wide = desc.b & 0x1000
-                    ? false : (desc.b & 0xf00) != 0xc00 &&
-                               !(cp->x86_vendor &
-                                 (X86_VENDOR_AMD | X86_VENDOR_HYGON))
+                    ? false : (desc.b & 0xf00) != 0xc00 && !_amd_like(cp)
                                ? mode_64bit() : ctxt->lma;
 
         if ( wide )
@@ -2142,9 +2152,7 @@ protmode_load_seg(
             default:
                 return rc;
             }
-            if ( !mode_64bit() &&
-                 (cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
-                 (desc.b & 0xf00) != 0xc00 )
+            if ( !mode_64bit() && _amd_like(cp) && (desc.b & 0xf00) != 0xc00 )
                 desc_hi.b = desc_hi.a = 0;
             if ( (desc_hi.b & 0x00001f00) ||
                  (seg != x86_seg_none &&
@@ -2525,9 +2533,7 @@ x86_decode_onebyte(
         case 3: /* call (far, absolute indirect) */
         case 5: /* jmp (far, absolute indirect) */
             /* REX.W ignored on a vendor-dependent basis. */
-            if ( op_bytes == 8 &&
-                 (ctxt->cpuid->x86_vendor &
-                  (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            if ( op_bytes == 8 && amd_like(ctxt) )
                 op_bytes = 4;
             state->desc = DstNone | SrcMem | Mov;
             break;
@@ -2651,8 +2657,7 @@ x86_decode_twobyte(
     case 0xb4: /* lfs */
     case 0xb5: /* lgs */
         /* REX.W ignored on a vendor-dependent basis. */
-        if ( op_bytes == 8 &&
-             (ctxt->cpuid->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( op_bytes == 8 && amd_like(ctxt) )
             op_bytes = 4;
         break;
 
@@ -4068,9 +4073,7 @@ x86_emulate(
             if ( ea.type == OP_REG )
                 src.val = *ea.reg;
             else if ( (rc = read_ulong(ea.mem.seg, ea.mem.off, &src.val,
-                                       (op_bytes == 2 &&
-                                        !(ctxt->cpuid->x86_vendor &
-                                          (X86_VENDOR_AMD | X86_VENDOR_HYGON))
+                                       (op_bytes == 2 && !amd_like(ctxt)
                                         ? 2 : 4),
                                        ctxt, ops)) )
                 goto done;


