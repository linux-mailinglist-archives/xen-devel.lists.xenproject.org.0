Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC24945EECC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232892.404168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxi-0005Dx-EB; Fri, 26 Nov 2021 13:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232892.404168; Fri, 26 Nov 2021 13:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxh-0004iE-46; Fri, 26 Nov 2021 13:08:21 +0000
Received: by outflank-mailman (input) for mailman id 232892;
 Fri, 26 Nov 2021 13:08:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavA-0002zD-U5
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f4a651c-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:05:42 +0100 (CET)
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
X-Inumbo-ID: 8f4a651c-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PgE5BFcBHa/MwQQAVsmO5Ee04lSQ5qVW11+nLEj1wp4=;
  b=H7g5rZYT41F70oe1cJdZdm3aVmxBYnwx9sdYATmi7FSvVBbsxSS/1nRt
   AVh36QOWQj+orshX0tcxtgOhp9AzwRVsuOOMMn4Z0FOj022nfB/nxoMME
   VEqYTySFAR5k6kkhWT5J2QqAgxUp8rIGhjPhYvmdZXO3IAzKxz6nySjQI
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RXJkyoZCtH2jLoH126WkT5H5cqN2zPvp2yyG0NGemrHgn5Qr2zeVZ0zkRZ42+8NaN/YZO6oIZ6
 5uCzOSje0jMb3/OqRH49S4FgyZCEdWf2LwDzwJX5Ze5Eu61zsMpFXqZclaUSjeiMNy6ytJLsto
 iGgWCilxHnkr9xEsD7rRRHd+D2iROjlkkb1hB6MZUM8GijyZGPsn5bqK6nxWk9rxcQYXvFGKfB
 1YXcKPBFSi3/qwFunXWEXVCTUYIKvqJ/lmTL0Cn+35/FiCNu7UMHG6zOraUDkqLd76zbtXeYxM
 9zrzeAEELp+MaPIH8J+OeBHH
X-SBRS: 5.1
X-MesageID: 58676416
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1ivs0Kkffdzw9xMy4DWVWCDo5gxMIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXGqAOvyCZmbwKYpxYY/g8klSuJDdxt5iHQQ5/ypjFyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Q22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IRSl62Sch8bBaHNt8YedB1EPCxyF4QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKaAO
 JRFMGQHgBLoQTFFfUoqBZUChNyUoHrYLBlejH2KjP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfIBDM8LyjqV+JHY4im7BU8AUhFMZPYP4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud14WtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0tjA3Dt4ade51q2VtW
 lBfwKByC8hUUPmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehw2YphZJm61P
 hOI0e+02HO1FCDxBUOQS9jsY/nGMIC6TYi1PhwqRoYmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnWNrNNIcwlVdSNT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C8t6gKxOrO4
 F+nXUpUlAj2iXHdcF3YYXF/crL/G514qCtjbyArOF+p3VklYJqus/hDJ8dmI+F/+bwx1+NwQ
 tkEZ96EXqZFRAPY9mlPdpL6toFjKkim3FrcIyq/bTEjVJd8XAiVqMT8dw7i+XBWXCq6vMczu
 ZO60QbfTcZRTghuFp+OOvmu00mwrT4Wn+crBxnEJdxaeUPN9ol2KnOu0q9rcp9UcRian2mUz
 QebBxsctNLhmY5t/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkVsW4YpxF7FnkfA369f1/uIIyw1lGDPAbkixC6MmKX6DhJEduqpIz75fmA23R
 kPQpYUKZeTXYJvoQAwLOQ4oTuWfzvVFyDDd4MM8LFj++CIqrqGMVl9fPkXUhSFQRFev3FjJH
 Qv1VBYq1jGC
IronPort-HdrOrdr: A9a23:N48GrKs+6mNkzEnpHfRSSjPC7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58676416"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 30/65] x86/emul: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:11 +0000
Message-ID: <20211126123446.32324-31-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

pv_emul_is_mem_write() only has a single user.  Having it as a static inline
is pointless because it can't be inlined to begin with.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/emulate.c             | 72 +++++++++++++++++-----------------
 xen/arch/x86/hvm/hvm.c                 |  8 ++--
 xen/arch/x86/hvm/svm/svm.c             |  4 +-
 xen/arch/x86/mm.c                      |  4 +-
 xen/arch/x86/mm/shadow/hvm.c           |  8 ++--
 xen/arch/x86/pv/emul-gate-op.c         |  5 ++-
 xen/arch/x86/pv/emul-priv-op.c         | 65 +++++++++++++++---------------
 xen/arch/x86/pv/emulate.h              |  7 ----
 xen/arch/x86/pv/ro-page-fault.c        | 25 +++++++-----
 xen/arch/x86/x86_emulate.c             | 21 +++++-----
 xen/arch/x86/x86_emulate/x86_emulate.c | 10 ++---
 xen/arch/x86/x86_emulate/x86_emulate.h | 33 ++++++++--------
 xen/include/asm-x86/hvm/emulate.h      |  8 ++--
 xen/include/asm-x86/mm.h               | 16 +++-----
 14 files changed, 142 insertions(+), 144 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index bd4e3ab6456e..952e28e5b212 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1272,7 +1272,7 @@ static int __hvmemul_read(
     return linear_read(addr, bytes, p_data, pfec, hvmemul_ctxt);
 }
 
-static int hvmemul_read(
+static int cf_check hvmemul_read(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -1290,7 +1290,7 @@ static int hvmemul_read(
         container_of(ctxt, struct hvm_emulate_ctxt, ctxt));
 }
 
-int hvmemul_insn_fetch(
+int cf_check hvmemul_insn_fetch(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -1337,7 +1337,7 @@ int hvmemul_insn_fetch(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_write(
+static int cf_check hvmemul_write(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -1385,7 +1385,7 @@ static int hvmemul_write(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_rmw(
+static int cf_check hvmemul_rmw(
     enum x86_segment seg,
     unsigned long offset,
     unsigned int bytes,
@@ -1438,7 +1438,7 @@ static int hvmemul_rmw(
     return rc;
 }
 
-static int hvmemul_blk(
+static int cf_check hvmemul_blk(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -1479,7 +1479,7 @@ static int hvmemul_blk(
     return rc;
 }
 
-static int hvmemul_write_discard(
+static int cf_check hvmemul_write_discard(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -1490,7 +1490,7 @@ static int hvmemul_write_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_rep_ins_discard(
+static int cf_check hvmemul_rep_ins_discard(
     uint16_t src_port,
     enum x86_segment dst_seg,
     unsigned long dst_offset,
@@ -1501,7 +1501,7 @@ static int hvmemul_rep_ins_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_rep_movs_discard(
+static int cf_check hvmemul_rep_movs_discard(
    enum x86_segment src_seg,
    unsigned long src_offset,
    enum x86_segment dst_seg,
@@ -1513,7 +1513,7 @@ static int hvmemul_rep_movs_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_rep_stos_discard(
+static int cf_check hvmemul_rep_stos_discard(
     void *p_data,
     enum x86_segment seg,
     unsigned long offset,
@@ -1524,7 +1524,7 @@ static int hvmemul_rep_stos_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_rep_outs_discard(
+static int cf_check hvmemul_rep_outs_discard(
     enum x86_segment src_seg,
     unsigned long src_offset,
     uint16_t dst_port,
@@ -1535,7 +1535,7 @@ static int hvmemul_rep_outs_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_cmpxchg_discard(
+static int cf_check hvmemul_cmpxchg_discard(
     enum x86_segment seg,
     unsigned long offset,
     void *p_old,
@@ -1547,7 +1547,7 @@ static int hvmemul_cmpxchg_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_read_io_discard(
+static int cf_check hvmemul_read_io_discard(
     unsigned int port,
     unsigned int bytes,
     unsigned long *val,
@@ -1556,7 +1556,7 @@ static int hvmemul_read_io_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_write_io_discard(
+static int cf_check hvmemul_write_io_discard(
     unsigned int port,
     unsigned int bytes,
     unsigned long val,
@@ -1565,7 +1565,7 @@ static int hvmemul_write_io_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_write_msr_discard(
+static int cf_check hvmemul_write_msr_discard(
     unsigned int reg,
     uint64_t val,
     struct x86_emulate_ctxt *ctxt)
@@ -1573,7 +1573,7 @@ static int hvmemul_write_msr_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_cache_op_discard(
+static int cf_check hvmemul_cache_op_discard(
     enum x86emul_cache_op op,
     enum x86_segment seg,
     unsigned long offset,
@@ -1582,7 +1582,7 @@ static int hvmemul_cache_op_discard(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_cmpxchg(
+static int cf_check hvmemul_cmpxchg(
     enum x86_segment seg,
     unsigned long offset,
     void *p_old,
@@ -1676,7 +1676,7 @@ static int hvmemul_cmpxchg(
     return rc;
 }
 
-static int hvmemul_validate(
+static int cf_check hvmemul_validate(
     const struct x86_emulate_state *state,
     struct x86_emulate_ctxt *ctxt)
 {
@@ -1689,7 +1689,7 @@ static int hvmemul_validate(
            ? X86EMUL_OKAY : X86EMUL_UNHANDLEABLE;
 }
 
-static int hvmemul_rep_ins(
+static int cf_check hvmemul_rep_ins(
     uint16_t src_port,
     enum x86_segment dst_seg,
     unsigned long dst_offset,
@@ -1767,7 +1767,7 @@ static int hvmemul_rep_outs_set_context(
     return rc;
 }
 
-static int hvmemul_rep_outs(
+static int cf_check hvmemul_rep_outs(
     enum x86_segment src_seg,
     unsigned long src_offset,
     uint16_t dst_port,
@@ -1808,7 +1808,7 @@ static int hvmemul_rep_outs(
                                !!(ctxt->regs->eflags & X86_EFLAGS_DF), gpa);
 }
 
-static int hvmemul_rep_movs(
+static int cf_check hvmemul_rep_movs(
    enum x86_segment src_seg,
    unsigned long src_offset,
    enum x86_segment dst_seg,
@@ -1978,7 +1978,7 @@ static int hvmemul_rep_movs(
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int hvmemul_rep_stos(
+static int cf_check hvmemul_rep_stos(
     void *p_data,
     enum x86_segment seg,
     unsigned long offset,
@@ -2106,7 +2106,7 @@ static int hvmemul_rep_stos(
     }
 }
 
-static int hvmemul_read_segment(
+static int cf_check hvmemul_read_segment(
     enum x86_segment seg,
     struct segment_register *reg,
     struct x86_emulate_ctxt *ctxt)
@@ -2123,7 +2123,7 @@ static int hvmemul_read_segment(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_write_segment(
+static int cf_check hvmemul_write_segment(
     enum x86_segment seg,
     const struct segment_register *reg,
     struct x86_emulate_ctxt *ctxt)
@@ -2142,7 +2142,7 @@ static int hvmemul_write_segment(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_read_io(
+static int cf_check hvmemul_read_io(
     unsigned int port,
     unsigned int bytes,
     unsigned long *val,
@@ -2159,7 +2159,7 @@ static int hvmemul_read_io(
     return hvmemul_do_pio_buffer(port, bytes, IOREQ_READ, val);
 }
 
-static int hvmemul_write_io(
+static int cf_check hvmemul_write_io(
     unsigned int port,
     unsigned int bytes,
     unsigned long val,
@@ -2168,7 +2168,7 @@ static int hvmemul_write_io(
     return hvmemul_do_pio_buffer(port, bytes, IOREQ_WRITE, &val);
 }
 
-static int hvmemul_read_cr(
+static int cf_check hvmemul_read_cr(
     unsigned int reg,
     unsigned long *val,
     struct x86_emulate_ctxt *ctxt)
@@ -2189,7 +2189,7 @@ static int hvmemul_read_cr(
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int hvmemul_write_cr(
+static int cf_check hvmemul_write_cr(
     unsigned int reg,
     unsigned long val,
     struct x86_emulate_ctxt *ctxt)
@@ -2233,7 +2233,7 @@ static int hvmemul_write_cr(
     return rc;
 }
 
-static int hvmemul_read_xcr(
+static int cf_check hvmemul_read_xcr(
     unsigned int reg,
     uint64_t *val,
     struct x86_emulate_ctxt *ctxt)
@@ -2246,7 +2246,7 @@ static int hvmemul_read_xcr(
     return rc;
 }
 
-static int hvmemul_write_xcr(
+static int cf_check hvmemul_write_xcr(
     unsigned int reg,
     uint64_t val,
     struct x86_emulate_ctxt *ctxt)
@@ -2256,7 +2256,7 @@ static int hvmemul_write_xcr(
     return x86emul_write_xcr(reg, val, ctxt);
 }
 
-static int hvmemul_read_msr(
+static int cf_check hvmemul_read_msr(
     unsigned int reg,
     uint64_t *val,
     struct x86_emulate_ctxt *ctxt)
@@ -2269,7 +2269,7 @@ static int hvmemul_read_msr(
     return rc;
 }
 
-static int hvmemul_write_msr(
+static int cf_check hvmemul_write_msr(
     unsigned int reg,
     uint64_t val,
     struct x86_emulate_ctxt *ctxt)
@@ -2282,7 +2282,7 @@ static int hvmemul_write_msr(
     return rc;
 }
 
-static int hvmemul_cache_op(
+static int cf_check hvmemul_cache_op(
     enum x86emul_cache_op op,
     enum x86_segment seg,
     unsigned long offset,
@@ -2352,7 +2352,7 @@ static int hvmemul_cache_op(
     return X86EMUL_OKAY;
 }
 
-static int hvmemul_get_fpu(
+static int cf_check hvmemul_get_fpu(
     enum x86_emulate_fpu_type type,
     struct x86_emulate_ctxt *ctxt)
 {
@@ -2394,7 +2394,7 @@ static int hvmemul_get_fpu(
     return X86EMUL_OKAY;
 }
 
-static void hvmemul_put_fpu(
+static void cf_check hvmemul_put_fpu(
     struct x86_emulate_ctxt *ctxt,
     enum x86_emulate_fpu_type backout,
     const struct x86_emul_fpu_aux *aux)
@@ -2481,7 +2481,7 @@ static void hvmemul_put_fpu(
     }
 }
 
-static int hvmemul_tlb_op(
+static int cf_check hvmemul_tlb_op(
     enum x86emul_tlb_op op,
     unsigned long addr,
     unsigned long aux,
@@ -2538,7 +2538,7 @@ static int hvmemul_tlb_op(
     return rc;
 }
 
-static int hvmemul_vmfunc(
+static int cf_check hvmemul_vmfunc(
     struct x86_emulate_ctxt *ctxt)
 {
     int rc;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 785add50896a..fdc0b86bf091 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3737,8 +3737,8 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
     return X86EMUL_EXCEPTION;
 }
 
-static bool is_sysdesc_access(const struct x86_emulate_state *state,
-                              const struct x86_emulate_ctxt *ctxt)
+static bool cf_check is_sysdesc_access(
+    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
 {
     unsigned int ext;
     int mode = x86_insn_modrm(state, NULL, &ext);
@@ -3778,8 +3778,8 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
     return X86EMUL_OKAY;
 }
 
-static bool is_cross_vendor(const struct x86_emulate_state *state,
-                            const struct x86_emulate_ctxt *ctxt)
+static bool cf_check is_cross_vendor(
+    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
 {
     switch ( ctxt->opcode )
     {
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index ffa7c51e376f..c01477c97c09 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2443,8 +2443,8 @@ static void svm_invlpg_intercept(unsigned long linear)
     paging_invlpg(current, linear);
 }
 
-static bool is_invlpg(const struct x86_emulate_state *state,
-                      const struct x86_emulate_ctxt *ctxt)
+static bool cf_check is_invlpg(
+    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
 {
     unsigned int ext;
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5d7acf705fb8..b60eb99d1094 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4838,7 +4838,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return 0;
 }
 
-int mmio_ro_emulated_write(
+int cf_check mmio_ro_emulated_write(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -4859,7 +4859,7 @@ int mmio_ro_emulated_write(
     return X86EMUL_OKAY;
 }
 
-int mmcfg_intercept_write(
+int cf_check mmcfg_intercept_write(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index d5f42102a0bd..ea99dd714fc3 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -148,7 +148,7 @@ hvm_read(enum x86_segment seg,
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int
+static int cf_check
 hvm_emulate_read(enum x86_segment seg,
                  unsigned long offset,
                  void *p_data,
@@ -161,7 +161,7 @@ hvm_emulate_read(enum x86_segment seg,
                     container_of(ctxt, struct sh_emulate_ctxt, ctxt));
 }
 
-static int
+static int cf_check
 hvm_emulate_insn_fetch(enum x86_segment seg,
                        unsigned long offset,
                        void *p_data,
@@ -184,7 +184,7 @@ hvm_emulate_insn_fetch(enum x86_segment seg,
     return X86EMUL_OKAY;
 }
 
-static int
+static int cf_check
 hvm_emulate_write(enum x86_segment seg,
                   unsigned long offset,
                   void *p_data,
@@ -237,7 +237,7 @@ hvm_emulate_write(enum x86_segment seg,
     return X86EMUL_OKAY;
 }
 
-static int
+static int cf_check
 hvm_emulate_cmpxchg(enum x86_segment seg,
                     unsigned long offset,
                     void *p_old,
diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
index 43d847abd0ab..17a32b649ab5 100644
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -96,8 +96,9 @@ struct gate_op_ctxt {
     bool insn_fetch;
 };
 
-static int read_mem(enum x86_segment seg, unsigned long offset, void *p_data,
-                    unsigned int bytes, struct x86_emulate_ctxt *ctxt)
+static int cf_check read_mem(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt)
 {
     const struct gate_op_ctxt *goc =
         container_of(ctxt, struct gate_op_ctxt, ctxt);
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 7f4279a0517b..808ff1873352 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -358,8 +358,9 @@ static unsigned int check_guest_io_breakpoint(struct vcpu *v,
     return match;
 }
 
-static int read_io(unsigned int port, unsigned int bytes,
-                   unsigned long *val, struct x86_emulate_ctxt *ctxt)
+static int cf_check read_io(
+    unsigned int port, unsigned int bytes, unsigned long *val,
+    struct x86_emulate_ctxt *ctxt)
 {
     struct priv_op_ctxt *poc = container_of(ctxt, struct priv_op_ctxt, ctxt);
     struct vcpu *curr = current;
@@ -462,8 +463,9 @@ static void guest_io_write(unsigned int port, unsigned int bytes,
     }
 }
 
-static int write_io(unsigned int port, unsigned int bytes,
-                    unsigned long val, struct x86_emulate_ctxt *ctxt)
+static int cf_check write_io(
+    unsigned int port, unsigned int bytes, unsigned long val,
+    struct x86_emulate_ctxt *ctxt)
 {
     struct priv_op_ctxt *poc = container_of(ctxt, struct priv_op_ctxt, ctxt);
     struct vcpu *curr = current;
@@ -493,9 +495,9 @@ static int write_io(unsigned int port, unsigned int bytes,
     return X86EMUL_OKAY;
 }
 
-static int read_segment(enum x86_segment seg,
-                        struct segment_register *reg,
-                        struct x86_emulate_ctxt *ctxt)
+static int cf_check read_segment(
+    enum x86_segment seg, struct segment_register *reg,
+    struct x86_emulate_ctxt *ctxt)
 {
     /* Check if this is an attempt to access the I/O bitmap. */
     if ( seg == x86_seg_tr )
@@ -607,10 +609,10 @@ static int pv_emul_virt_to_linear(unsigned long base, unsigned long offset,
     return rc;
 }
 
-static int rep_ins(uint16_t port,
-                   enum x86_segment seg, unsigned long offset,
-                   unsigned int bytes_per_rep, unsigned long *reps,
-                   struct x86_emulate_ctxt *ctxt)
+static int cf_check rep_ins(
+    uint16_t port, enum x86_segment seg, unsigned long offset,
+    unsigned int bytes_per_rep, unsigned long *reps,
+    struct x86_emulate_ctxt *ctxt)
 {
     struct priv_op_ctxt *poc = container_of(ctxt, struct priv_op_ctxt, ctxt);
     struct vcpu *curr = current;
@@ -675,10 +677,10 @@ static int rep_ins(uint16_t port,
     return X86EMUL_OKAY;
 }
 
-static int rep_outs(enum x86_segment seg, unsigned long offset,
-                    uint16_t port,
-                    unsigned int bytes_per_rep, unsigned long *reps,
-                    struct x86_emulate_ctxt *ctxt)
+static int cf_check rep_outs(
+    enum x86_segment seg, unsigned long offset, uint16_t port,
+    unsigned int bytes_per_rep, unsigned long *reps,
+    struct x86_emulate_ctxt *ctxt)
 {
     struct priv_op_ctxt *poc = container_of(ctxt, struct priv_op_ctxt, ctxt);
     struct vcpu *curr = current;
@@ -744,8 +746,8 @@ static int rep_outs(enum x86_segment seg, unsigned long offset,
     return X86EMUL_OKAY;
 }
 
-static int read_cr(unsigned int reg, unsigned long *val,
-                   struct x86_emulate_ctxt *ctxt)
+static int cf_check read_cr(
+    unsigned int reg, unsigned long *val, struct x86_emulate_ctxt *ctxt)
 {
     const struct vcpu *curr = current;
 
@@ -787,8 +789,8 @@ static int read_cr(unsigned int reg, unsigned long *val,
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int write_cr(unsigned int reg, unsigned long val,
-                    struct x86_emulate_ctxt *ctxt)
+static int cf_check write_cr(
+    unsigned int reg, unsigned long val, struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
 
@@ -871,8 +873,8 @@ static uint64_t guest_efer(const struct domain *d)
     return val;
 }
 
-static int read_msr(unsigned int reg, uint64_t *val,
-                    struct x86_emulate_ctxt *ctxt)
+static int cf_check read_msr(
+    unsigned int reg, uint64_t *val, struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
@@ -1020,8 +1022,8 @@ static int read_msr(unsigned int reg, uint64_t *val,
     return ret;
 }
 
-static int write_msr(unsigned int reg, uint64_t val,
-                     struct x86_emulate_ctxt *ctxt)
+static int cf_check write_msr(
+    unsigned int reg, uint64_t val, struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
@@ -1188,8 +1190,9 @@ static int write_msr(unsigned int reg, uint64_t val,
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int cache_op(enum x86emul_cache_op op, enum x86_segment seg,
-                    unsigned long offset, struct x86_emulate_ctxt *ctxt)
+static int cf_check cache_op(
+    enum x86emul_cache_op op, enum x86_segment seg,
+    unsigned long offset, struct x86_emulate_ctxt *ctxt)
 {
     ASSERT(op == x86emul_wbinvd || op == x86emul_wbnoinvd);
 
@@ -1208,8 +1211,8 @@ static int cache_op(enum x86emul_cache_op op, enum x86_segment seg,
     return X86EMUL_OKAY;
 }
 
-static int validate(const struct x86_emulate_state *state,
-                    struct x86_emulate_ctxt *ctxt)
+static int cf_check validate(
+    const struct x86_emulate_state *state, struct x86_emulate_ctxt *ctxt)
 {
     switch ( ctxt->opcode )
     {
@@ -1258,11 +1261,9 @@ static int validate(const struct x86_emulate_state *state,
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int insn_fetch(enum x86_segment seg,
-                      unsigned long offset,
-                      void *p_data,
-                      unsigned int bytes,
-                      struct x86_emulate_ctxt *ctxt)
+static int cf_check insn_fetch(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt)
 {
     const struct priv_op_ctxt *poc =
         container_of(ctxt, struct priv_op_ctxt, ctxt);
diff --git a/xen/arch/x86/pv/emulate.h b/xen/arch/x86/pv/emulate.h
index 4b845b08e372..49a4d34832df 100644
--- a/xen/arch/x86/pv/emulate.h
+++ b/xen/arch/x86/pv/emulate.h
@@ -12,13 +12,6 @@ int pv_emul_read_descriptor(unsigned int sel, const struct vcpu *v,
 
 void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip);
 
-static inline int pv_emul_is_mem_write(const struct x86_emulate_state *state,
-                                       struct x86_emulate_ctxt *ctxt)
-{
-    return x86_insn_is_mem_write(state, ctxt) ? X86EMUL_OKAY
-                                              : X86EMUL_UNHANDLEABLE;
-}
-
 /* Return a pointer to the GDT/LDT descriptor referenced by sel. */
 static inline const seg_desc_t *gdt_ldt_desc_ptr(unsigned int sel)
 {
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index ac5b66870c8c..276e11e16dff 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -26,6 +26,13 @@
 #include "emulate.h"
 #include "mm.h"
 
+static int cf_check pv_emul_is_mem_write(
+    const struct x86_emulate_state *state, struct x86_emulate_ctxt *ctxt)
+{
+    return x86_insn_is_mem_write(state, ctxt) ? X86EMUL_OKAY
+                                              : X86EMUL_UNHANDLEABLE;
+}
+
 /*********************
  * Writable Pagetables
  */
@@ -35,9 +42,9 @@ struct ptwr_emulate_ctxt {
     l1_pgentry_t  pte;
 };
 
-static int ptwr_emulated_read(enum x86_segment seg, unsigned long offset,
-                              void *p_data, unsigned int bytes,
-                              struct x86_emulate_ctxt *ctxt)
+static int cf_check ptwr_emulated_read(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt)
 {
     unsigned int rc = bytes;
     unsigned long addr = offset;
@@ -203,9 +210,9 @@ static int ptwr_emulated_update(unsigned long addr, intpte_t *p_old,
     return X86EMUL_OKAY;
 }
 
-static int ptwr_emulated_write(enum x86_segment seg, unsigned long offset,
-                               void *p_data, unsigned int bytes,
-                               struct x86_emulate_ctxt *ctxt)
+static int cf_check ptwr_emulated_write(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt)
 {
     intpte_t val = 0;
 
@@ -221,9 +228,9 @@ static int ptwr_emulated_write(enum x86_segment seg, unsigned long offset,
     return ptwr_emulated_update(offset, NULL, val, bytes, ctxt);
 }
 
-static int ptwr_emulated_cmpxchg(enum x86_segment seg, unsigned long offset,
-                                 void *p_old, void *p_new, unsigned int bytes,
-                                 bool lock, struct x86_emulate_ctxt *ctxt)
+static int cf_check ptwr_emulated_cmpxchg(
+    enum x86_segment seg, unsigned long offset, void *p_old, void *p_new,
+    unsigned int bytes, bool lock, struct x86_emulate_ctxt *ctxt)
 {
     intpte_t old = 0, new = 0;
     int rc;
diff --git a/xen/arch/x86/x86_emulate.c b/xen/arch/x86/x86_emulate.c
index 1e082e6f3b2d..60191a94dc18 100644
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -53,8 +53,8 @@
 
 #include "x86_emulate/x86_emulate.c"
 
-int x86emul_read_xcr(unsigned int reg, uint64_t *val,
-                     struct x86_emulate_ctxt *ctxt)
+int cf_check x86emul_read_xcr(
+    unsigned int reg, uint64_t *val, struct x86_emulate_ctxt *ctxt)
 {
     switch ( reg )
     {
@@ -77,8 +77,8 @@ int x86emul_read_xcr(unsigned int reg, uint64_t *val,
 }
 
 /* Note: May be called with ctxt=NULL. */
-int x86emul_write_xcr(unsigned int reg, uint64_t val,
-                      struct x86_emulate_ctxt *ctxt)
+int cf_check x86emul_write_xcr(
+    unsigned int reg, uint64_t val, struct x86_emulate_ctxt *ctxt)
 {
     switch ( reg )
     {
@@ -100,8 +100,8 @@ int x86emul_write_xcr(unsigned int reg, uint64_t val,
 
 #ifdef CONFIG_PV
 /* Called with NULL ctxt in hypercall context. */
-int x86emul_read_dr(unsigned int reg, unsigned long *val,
-                    struct x86_emulate_ctxt *ctxt)
+int cf_check x86emul_read_dr(
+    unsigned int reg, unsigned long *val, struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
 
@@ -143,8 +143,8 @@ int x86emul_read_dr(unsigned int reg, unsigned long *val,
     return X86EMUL_OKAY;
 }
 
-int x86emul_write_dr(unsigned int reg, unsigned long val,
-                     struct x86_emulate_ctxt *ctxt)
+int cf_check x86emul_write_dr(
+    unsigned int reg, unsigned long val, struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
 
@@ -167,8 +167,9 @@ int x86emul_write_dr(unsigned int reg, unsigned long val,
 }
 #endif /* CONFIG_PV */
 
-int x86emul_cpuid(uint32_t leaf, uint32_t subleaf,
-                  struct cpuid_leaf *res, struct x86_emulate_ctxt *ctxt)
+int cf_check x86emul_cpuid(
+    uint32_t leaf, uint32_t subleaf, struct cpuid_leaf *res,
+    struct x86_emulate_ctxt *ctxt)
 {
     guest_cpuid(current, leaf, subleaf, res);
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 069acde51791..509b047a4889 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2524,7 +2524,7 @@ static void adjust_bnd(struct x86_emulate_ctxt *ctxt,
  done:;
 }
 
-int x86emul_unhandleable_rw(
+int cf_check x86emul_unhandleable_rw(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -12319,7 +12319,7 @@ x86_insn_operand_ea(const struct x86_emulate_state *state,
  * memory operand (like POP), but it does not mean e.g. segment selector
  * loads, where the descriptor table access is considered an implicit one.
  */
-bool
+bool cf_check
 x86_insn_is_mem_access(const struct x86_emulate_state *state,
                        const struct x86_emulate_ctxt *ctxt)
 {
@@ -12411,7 +12411,7 @@ x86_insn_is_mem_access(const struct x86_emulate_state *state,
  * loads, where the (possible) descriptor table write is considered an
  * implicit access.
  */
-bool
+bool cf_check
 x86_insn_is_mem_write(const struct x86_emulate_state *state,
                       const struct x86_emulate_ctxt *ctxt)
 {
@@ -12583,7 +12583,7 @@ x86_insn_is_mem_write(const struct x86_emulate_state *state,
     return false;
 }
 
-bool
+bool cf_check
 x86_insn_is_portio(const struct x86_emulate_state *state,
                    const struct x86_emulate_ctxt *ctxt)
 {
@@ -12598,7 +12598,7 @@ x86_insn_is_portio(const struct x86_emulate_state *state,
     return false;
 }
 
-bool
+bool cf_check
 x86_insn_is_cr_access(const struct x86_emulate_state *state,
                       const struct x86_emulate_ctxt *ctxt)
 {
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 4a483a464804..2c5635804bb8 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -743,7 +743,7 @@ static inline unsigned long *decode_gpr(struct cpu_user_regs *regs,
 }
 
 /* Unhandleable read, write or instruction fetch */
-int
+int cf_check
 x86emul_unhandleable_rw(
     enum x86_segment seg,
     unsigned long offset,
@@ -773,16 +773,16 @@ x86_insn_immediate(const struct x86_emulate_state *state,
 unsigned int
 x86_insn_length(const struct x86_emulate_state *state,
                 const struct x86_emulate_ctxt *ctxt);
-bool
+bool cf_check
 x86_insn_is_mem_access(const struct x86_emulate_state *state,
                        const struct x86_emulate_ctxt *ctxt);
-bool
+bool cf_check
 x86_insn_is_mem_write(const struct x86_emulate_state *state,
                       const struct x86_emulate_ctxt *ctxt);
-bool
+bool cf_check
 x86_insn_is_portio(const struct x86_emulate_state *state,
                    const struct x86_emulate_ctxt *ctxt);
-bool
+bool cf_check
 x86_insn_is_cr_access(const struct x86_emulate_state *state,
                       const struct x86_emulate_ctxt *ctxt);
 
@@ -794,17 +794,18 @@ void x86_emulate_free_state(struct x86_emulate_state *state);
 
 #ifdef __XEN__
 
-int x86emul_read_xcr(unsigned int reg, uint64_t *val,
-                     struct x86_emulate_ctxt *ctxt);
-int x86emul_write_xcr(unsigned int reg, uint64_t val,
-                      struct x86_emulate_ctxt *ctxt);
-
-int x86emul_read_dr(unsigned int reg, unsigned long *val,
-                    struct x86_emulate_ctxt *ctxt);
-int x86emul_write_dr(unsigned int reg, unsigned long val,
-                     struct x86_emulate_ctxt *ctxt);
-int x86emul_cpuid(uint32_t leaf, uint32_t subleaf,
-                  struct cpuid_leaf *res, struct x86_emulate_ctxt *ctxt);
+int cf_check x86emul_read_xcr(
+    unsigned int reg, uint64_t *val, struct x86_emulate_ctxt *ctxt);
+int cf_check x86emul_write_xcr(
+    unsigned int reg, uint64_t val, struct x86_emulate_ctxt *ctxt);
+
+int cf_check x86emul_read_dr(
+    unsigned int reg, unsigned long *val, struct x86_emulate_ctxt *ctxt);
+int cf_check x86emul_write_dr(
+    unsigned int reg, unsigned long val, struct x86_emulate_ctxt *ctxt);
+int cf_check x86emul_cpuid(
+    uint32_t leaf, uint32_t subleaf, struct cpuid_leaf *res,
+    struct x86_emulate_ctxt *ctxt);
 
 #endif
 
diff --git a/xen/include/asm-x86/hvm/emulate.h b/xen/include/asm-x86/hvm/emulate.h
index 610078b28fca..8bebfb5105b2 100644
--- a/xen/include/asm-x86/hvm/emulate.h
+++ b/xen/include/asm-x86/hvm/emulate.h
@@ -92,11 +92,9 @@ static inline bool handle_mmio(void)
     return hvm_emulate_one_insn(x86_insn_is_mem_access, "MMIO");
 }
 
-int hvmemul_insn_fetch(enum x86_segment seg,
-                       unsigned long offset,
-                       void *p_data,
-                       unsigned int bytes,
-                       struct x86_emulate_ctxt *ctxt);
+int cf_check hvmemul_insn_fetch(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt);
 int hvmemul_do_pio_buffer(uint16_t port,
                           unsigned int size,
                           uint8_t dir,
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index cb9052749963..1c849b96d583 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -546,16 +546,12 @@ struct mmio_ro_emulate_ctxt {
         unsigned int seg, bdf;
 };
 
-extern int mmio_ro_emulated_write(enum x86_segment seg,
-                                  unsigned long offset,
-                                  void *p_data,
-                                  unsigned int bytes,
-                                  struct x86_emulate_ctxt *ctxt);
-extern int mmcfg_intercept_write(enum x86_segment seg,
-                                 unsigned long offset,
-                                 void *p_data,
-                                 unsigned int bytes,
-                                 struct x86_emulate_ctxt *ctxt);
+int cf_check mmio_ro_emulated_write(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt);
+int cf_check mmcfg_intercept_write(
+    enum x86_segment seg, unsigned long offset, void *p_data,
+    unsigned int bytes, struct x86_emulate_ctxt *ctxt);
 
 int audit_adjust_pgtables(struct domain *d, int dir, int noisy);
 
-- 
2.11.0


