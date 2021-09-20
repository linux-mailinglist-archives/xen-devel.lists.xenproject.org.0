Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2AA411E11
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191051.340950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN3A-00054G-4l; Mon, 20 Sep 2021 17:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191051.340950; Mon, 20 Sep 2021 17:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN39-0004zs-TN; Mon, 20 Sep 2021 17:25:51 +0000
Received: by outflank-mailman (input) for mailman id 191051;
 Mon, 20 Sep 2021 17:25:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSN38-0003cq-Cg
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:25:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5e97c3b-1a37-11ec-b87a-12813bfff9fa;
 Mon, 20 Sep 2021 17:25:40 +0000 (UTC)
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
X-Inumbo-ID: c5e97c3b-1a37-11ec-b87a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632158740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=op3mN7Ssn2+qHvMncFrr9eY7JKq/qdFKvePUbUZAdVE=;
  b=RcVOOoaze2uwR7P9cXIuOh6dtW2+TpF9fVjIuYhA13ckgTV3TFdk/sUY
   LEXbWRfFhiKkFy+RQMRQpBZBVp0g0urKzrvln7NnKC0Mz68L8w3XmVnIV
   AN5yiovRy7qCvhwf0Z7lCZxWwIV/mPGfxhxgVNSTkqJDrAlEvl4iCmi2/
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eDVWBXpWkoIOoo1AZVM4liBpfZcmugDKNRYzyrxPPYjrE3mqsirArDaUXgCfQrbvgBVttQ+g0L
 cfkXCAwNbQllMw4iSPZrM2oKdbiBYaZhueWW5XOqphEN3V0+YbuWu6f5ZdO5ymNNC17D4L8WIe
 gwJWeHXsDR6DdWnMJJmXekeID0oLhgdmFtHTEH5AcbADiI6w0AdqMLkOTcLs5Jr+kYJo8h56jM
 y6DLYBwuuPnM4SpxTq6x+ufRoWFdcE27uXuhSf1r08j475mY/knmRA1WrDJVWtq+g5L1IohsmV
 ThmAn1z6meN8JTqlTq0hP1wv
X-SBRS: 5.1
X-MesageID: 54938585
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VbwWZqwB1MSix56KN1h6t+ffwSrEfRIJ4+MujC+fZmUNrF6WrkVTy
 zEbWW/XMq2MNjGheNF2btzkpkJTvZDcztZiTAFprSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrRh2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/Zx2
 MQchZjpcyI0PvD1u/g/CTlCDggraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25wfRqaDN
 5dxhTxHXBvtXC1CZHMrUtEYpcio2nPRfiVHpwfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcI4cHbK39/lugXWI23ceThYRUDOTvv2RmkO4HdVFJ
 CQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLV/ASxFmUCViRGatEtqIkxXzNC/
 kSSg9rjCDhrsbuUYXGQ7LGZqXW1Iyd9EIMZTXZaF01fuYCl+dxtyEKUJjp+LEKrpvv1CSCh8
 zTTlg0jh+gqrtIpjYWh4HmS1lpAuaP1oh4JChT/Bzz+t1MiNd/9PeRE+nCAsq0Rd9/xok2p+
 SFewpnAtrhm4YSlyXTVKNjhCo1F8Bps3Nf0uldpA5Bp3DCk4XfLkWt4sWwmeRsB3irpf1bUj
 K7vVeF5v8Q70JiCN/Yfj2eN5yMCl/OIKDgdfqqIBueim7AoHON9wM2LWaJ39zu3+HXAbIllY
 cvLGSpSJS9CVMyLMwZat89CiOR2l0jSNEv4RIzhzgTP7FZtTCfOEt843K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ/zvwJyb+Xr
 i/iMqKaoXKm7UD6xcyxQigLQNvSsVxX9hrX5AQgYgSl3WYNe4Gq4PtNfpc7Z+B/pudi0eR1X
 78OfMDZWqZDTTHO+jI8a5jhrdM9KET31FzWZyf1MiIie5NARhDS/oO2dAXY6yRTXDG8stEzo
 uP821qDE4YDXQlrEO3fdOmrkwGqpXEYle8rBxnIL9BfdV/C6o9vLyCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWtO/kOzPb82yvxZ57fNyJJT2NBnnp/KiCZ
 PlOy62uOvMwg1sX4ZF3FKxmzPxi6oK39aNa1AltAF7Cc0+vVuF7OnCD0MRC6v9Ny7tetVfkU
 06D4IAHa7CAOcejG18NPgs1KO+E0KhMyDXV6P00JmT85TN2o+XbARkDYUHUhXwPNqZxPaMk3
 fwl6Zwf5AGIgxY3NsqL03JP/GOWI31cC6gqu/n22mMwZtbHHr2aXaHhNw==
IronPort-HdrOrdr: A9a23:fepU9qq6Y6YRGtz1OIBx+ngaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="54938585"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [PATCH v2 09/12] xen/trace: Minor code cleanup
Date: Mon, 20 Sep 2021 18:25:26 +0100
Message-ID: <20210920172529.24932-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

 * Delete trailing whitespace
 * Replace an opencoded DIV_ROUND_UP()
 * Drop bogus smp_rmb() - spin_lock_irqsave() has full smp_mb() semantics.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>
---
 xen/common/trace.c              | 37 +++++++++++++++----------------------
 xen/include/asm-x86/hvm/trace.h |  2 +-
 2 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/xen/common/trace.c b/xen/common/trace.c
index 4297ff505fb9..41a3c170446b 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -75,10 +75,6 @@ static cpumask_t tb_cpu_mask;
 /* which tracing events are enabled */
 static u32 tb_event_mask = TRC_ALL;
 
-/* Return the number of elements _type necessary to store at least _x bytes of data
- * i.e., sizeof(_type) * ans >= _x. */
-#define fit_to_type(_type, _x) (((_x)+sizeof(_type)-1) / sizeof(_type))
-
 static int cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -96,8 +92,8 @@ static struct notifier_block cpu_nfb = {
 
 static uint32_t calc_tinfo_first_offset(void)
 {
-    int offset_in_bytes = offsetof(struct t_info, mfn_offset[NR_CPUS]);
-    return fit_to_type(uint32_t, offset_in_bytes);
+    return DIV_ROUND_UP(offsetof(struct t_info, mfn_offset[NR_CPUS]),
+                        sizeof(uint32_t));
 }
 
 /**
@@ -148,7 +144,7 @@ static int calculate_tbuf_size(unsigned int pages, uint16_t t_info_first_offset)
         pages = max_pages;
     }
 
-    /* 
+    /*
      * NB this calculation is correct, because t_info_first_offset is
      * in words, not bytes
      */
@@ -167,7 +163,7 @@ static int calculate_tbuf_size(unsigned int pages, uint16_t t_info_first_offset)
  * trace buffers.  The trace buffers are then available for debugging use, via
  * the %TRACE_xD macros exported in <xen/trace.h>.
  *
- * This function may also be called later when enabling trace buffers 
+ * This function may also be called later when enabling trace buffers
  * via the SET_SIZE hypercall.
  */
 static int alloc_trace_bufs(unsigned int pages)
@@ -401,7 +397,7 @@ int tb_control(struct xen_sysctl_tbuf_op *tbc)
         break;
     case XEN_SYSCTL_TBUFOP_enable:
         /* Enable trace buffers. Check buffers are already allocated. */
-        if ( opt_tbuf_size == 0 ) 
+        if ( opt_tbuf_size == 0 )
             rc = -EINVAL;
         else
             tb_init_done = 1;
@@ -438,7 +434,7 @@ int tb_control(struct xen_sysctl_tbuf_op *tbc)
     return rc;
 }
 
-static inline unsigned int calc_rec_size(bool_t cycles, unsigned int extra) 
+static inline unsigned int calc_rec_size(bool_t cycles, unsigned int extra)
 {
     unsigned int rec_size = 4;
 
@@ -597,7 +593,7 @@ static inline void __insert_record(struct t_buf *buf,
         rec->u.cycles.cycles_lo = (uint32_t)tsc;
         rec->u.cycles.cycles_hi = (uint32_t)(tsc >> 32);
         dst = rec->u.cycles.extra_u32;
-    } 
+    }
 
     if ( extra_data && extra )
         memcpy(dst, extra_data, extra);
@@ -717,9 +713,6 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
     if ( !cpumask_test_cpu(smp_processor_id(), &tb_cpu_mask) )
         return;
 
-    /* Read tb_init_done /before/ t_bufs. */
-    smp_rmb();
-
     spin_lock_irqsave(&this_cpu(t_lock), flags);
 
     buf = this_cpu(t_bufs);
@@ -735,14 +728,14 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
 
     /* Calculate the record size */
     rec_size = calc_rec_size(cycles, extra);
- 
+
     /* How many bytes are available in the buffer? */
     bytes_to_tail = calc_bytes_avail(buf);
-    
+
     /* How many bytes until the next wrap-around? */
     bytes_to_wrap = calc_bytes_to_wrap(buf);
-    
-    /* 
+
+    /*
      * Calculate expected total size to commit this record by
      * doing a dry-run.
      */
@@ -756,7 +749,7 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
         {
             total_size += bytes_to_wrap;
             bytes_to_wrap = data_size;
-        } 
+        }
         total_size += LOST_REC_SIZE;
         bytes_to_wrap -= LOST_REC_SIZE;
 
@@ -768,7 +761,7 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
     if ( rec_size > bytes_to_wrap )
     {
         total_size += bytes_to_wrap;
-    } 
+    }
     total_size += rec_size;
 
     /* Do we have enough space for everything? */
@@ -781,7 +774,7 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
     }
 
     /*
-     * Now, actually write information 
+     * Now, actually write information
      */
     bytes_to_wrap = calc_bytes_to_wrap(buf);
 
@@ -791,7 +784,7 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
         {
             insert_wrap_record(buf, LOST_REC_SIZE);
             bytes_to_wrap = data_size;
-        } 
+        }
         insert_lost_records(buf);
         bytes_to_wrap -= LOST_REC_SIZE;
 
diff --git a/xen/include/asm-x86/hvm/trace.h b/xen/include/asm-x86/hvm/trace.h
index 145b59f6ac65..696e42eb9499 100644
--- a/xen/include/asm-x86/hvm/trace.h
+++ b/xen/include/asm-x86/hvm/trace.h
@@ -52,7 +52,7 @@
 #define DO_TRC_HVM_CLTS        DEFAULT_HVM_MISC
 #define DO_TRC_HVM_LMSW        DEFAULT_HVM_MISC
 #define DO_TRC_HVM_LMSW64      DEFAULT_HVM_MISC
-#define DO_TRC_HVM_REALMODE_EMULATE DEFAULT_HVM_MISC 
+#define DO_TRC_HVM_REALMODE_EMULATE DEFAULT_HVM_MISC
 #define DO_TRC_HVM_TRAP             DEFAULT_HVM_MISC
 #define DO_TRC_HVM_TRAP_DEBUG       DEFAULT_HVM_MISC
 #define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC
-- 
2.11.0


