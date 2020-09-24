Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D4C2771DE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 15:11:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLR1J-0004WI-5t; Thu, 24 Sep 2020 13:10:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zFsw=DB=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kLR1I-0004Um-2x
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 13:10:44 +0000
X-Inumbo-ID: 9cc3d153-f179-4cac-9890-6ad5d14aa3a0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cc3d153-f179-4cac-9890-6ad5d14aa3a0;
 Thu, 24 Sep 2020 13:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=/RgN89Vr2y6FU5cQ9gL28D+wie47kQ+I4lyMBpsTU18=; b=fAgb94GBkSzIlqbCbneye9ar68
 wrzKGckG6s0NWveibkRnJLd8xkXxhPPtCZEUGVldaLolmF0VWCc9LNH7tmdGSijWb1goW/bEFWIBt
 +ZLTRT+LpvsfOhFiAexWrGNJFC1ZQ42OpxxIngUUCnjM1ISRdbk+ngJLRVx60LmgUIwM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kLR1E-0006ft-F3; Thu, 24 Sep 2020 13:10:40 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kLR1E-0002DB-7T; Thu, 24 Sep 2020 13:10:40 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v9 5/8] docs / tools: specific migration v4 to include
 DOMAIN_CONTEXT
Date: Thu, 24 Sep 2020 14:10:27 +0100
Message-Id: <20200924131030.1876-6-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200924131030.1876-1-paul@xen.org>
References: <20200924131030.1876-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

A new 'domain context' framework was recently introduced to facilitate
transfer of state for both PV and HVM guests. Hence this patch mandates the
presence of a new DOMAIN_CONTEXT record in version 4 of the libxc migration
stream.
This record will incorprate the content of the domain's 'shared_info' page
and the TSC informaiton so the SHARED_INFO and TSC_INFO records are deprecated.
It is intended that, in future, this record will contain state currently
present in the HVM_CONTEXT record. However, for compatibility with earlier
migration streams, the version 4 stream format continues to specify an
HVM_CONTEXT record and XEN_DOMCTL_sethvmcontext will continue to accept all
content of that record that may be present in a version 3 stream.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>

v7:
 - New in v7
---
 docs/specs/libxc-migration-stream.pandoc | 62 ++++++++++++++++++------
 tools/libs/guest/xg_sr_common.c          |  1 +
 tools/libs/guest/xg_sr_stream_format.h   |  1 +
 tools/python/xen/migration/libxc.py      |  2 +
 4 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libxc-migration-stream.pandoc
index 8aeab3b11b..989f2a0cb6 100644
--- a/docs/specs/libxc-migration-stream.pandoc
+++ b/docs/specs/libxc-migration-stream.pandoc
@@ -3,7 +3,7 @@
   Andrew Cooper <<andrew.cooper3@citrix.com>>
   Wen Congyang <<wency@cn.fujitsu.com>>
   Yang Hongyang <<hongyang.yang@easystack.cn>>
-% Revision 3
+% Revision 4
 
 Introduction
 ============
@@ -127,7 +127,7 @@ marker      0xFFFFFFFFFFFFFFFF.
 
 id          0x58454E46 ("XENF" in ASCII).
 
-version     0x00000003.  The version of this specification.
+version     0x00000004.  The version of this specification.
 
 options     bit 0: Endianness.  0 = little-endian, 1 = big-endian.
 
@@ -209,9 +209,9 @@ type         0x00000000: END
 
              0x00000006: X86_PV_VCPU_XSAVE
 
-             0x00000007: SHARED_INFO
+             0x00000007: SHARED_INFO (deprecated)
 
-             0x00000008: X86_TSC_INFO
+             0x00000008: X86_TSC_INFO (deprecated)
 
              0x00000009: HVM_CONTEXT
 
@@ -233,7 +233,9 @@ type         0x00000000: END
 
              0x00000012: X86_MSR_POLICY
 
-             0x00000013 - 0x7FFFFFFF: Reserved for future _mandatory_
+             0x00000013: DOMAIN_CONTEXT
+
+             0x00000014 - 0x7FFFFFFF: Reserved for future _mandatory_
              records.
 
              0x80000000 - 0xFFFFFFFF: Reserved for future _optional_
@@ -442,10 +444,11 @@ X86_PV_VCPU_MSRS             XEN_DOMCTL_{get,set}\_vcpu_msrs
 
 \clearpage
 
-SHARED_INFO
------------
+SHARED_INFO (deprecated)
+------------------------
 
-The content of the Shared Info page.
+The content of the Shared Info page. This is incorporated into the
+DOMAIN_CONTEXT record as of specification version 4.
 
      0     1     2     3     4     5     6     7 octet
     +-------------------------------------------------+
@@ -462,11 +465,12 @@ shared_info      Contents of the shared info page.  This record
 
 \clearpage
 
-X86_TSC_INFO
-------------
+X86_TSC_INFO (deprecated)
+-------------------------
 
 Domain TSC information, as accessed by the
-XEN_DOMCTL_{get,set}tscinfo hypercall sub-ops.
+XEN_DOMCTL_{get,set}tscinfo hypercall sub-ops. This is incorporated into the
+DOMAIN_CONTEXT record as of specification version 4.
 
      0     1     2     3     4     5     6     7 octet
     +------------------------+------------------------+
@@ -680,6 +684,25 @@ MSR_policy       Array of xen_msr_entry_t[]'s
 
 \clearpage
 
+DOMAIN_CONTEXT
+--------------
+
+Domain context, as accessed by the
+XEN_DOMCTL_{get,set}domaincontext hypercall sub-ops.
+
+     0     1     2     3     4     5     6     7 octet
+    +-------------------------------------------------+
+    | dom_ctx                                         |
+    ...
+    +-------------------------------------------------+
+
+--------------------------------------------------------------------
+Field            Description
+-----------      ---------------------------------------------------
+dom_ctx          The Domain Context blob from Xen.
+--------------------------------------------------------------------
+
+\clearpage
 
 Layout
 ======
@@ -706,8 +729,7 @@ A typical save record for an x86 PV guest image would look like:
     * STATIC_DATA_END
 * X86_PV_P2M_FRAMES record
 * Many PAGE_DATA records
-* X86_TSC_INFO
-* SHARED_INFO record
+* DOMAIN_CONTEXT
 * VCPU context records for each online VCPU
     * X86_PV_VCPU_BASIC record
     * X86_PV_VCPU_EXTENDED record
@@ -735,7 +757,7 @@ A typical save record for an x86 HVM guest image would look like:
     * X86_{CPUID,MSR}_POLICY
     * STATIC_DATA_END
 * Many PAGE_DATA records
-* X86_TSC_INFO
+* DOMAIN_CONTEXT
 * HVM_PARAMS
 * HVM_CONTEXT
 * END record
@@ -746,6 +768,18 @@ the validity of architectural state in the context.
 Compatibility with older versions
 =================================
 
+v4 compat with v3
+-----------------
+
+A v4 stream is compatible with a v3 stream, but mandates the presence of a
+DOMAIN_CONTEXT record. This incorporates context such as the content of
+the domain's Shared Info page and the TSC information, hence the SHARED_INFO
+and TSC_INFO records are deprecated.
+It also supercedes HVM_CONTEXT and, over time, data that is currently part of
+the HVM_CONTEXT blob will move to the DOMAIN_CONTEXT blob. Xen, however, will
+continue to accept all defined HVM_CONTEXT records so a v4-compatible
+receiver can still accept an unmodified v3 stream.
+
 v3 compat with v2
 -----------------
 
diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 17567ab133..f813320202 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -39,6 +39,7 @@ static const char *const mandatory_rec_types[] =
     [REC_TYPE_STATIC_DATA_END]              = "Static data end",
     [REC_TYPE_X86_CPUID_POLICY]             = "x86 CPUID policy",
     [REC_TYPE_X86_MSR_POLICY]               = "x86 MSR policy",
+    [REC_TYPE_DOMAIN_CONTEXT]               = "Domain context",
 };
 
 const char *rec_type_to_str(uint32_t type)
diff --git a/tools/libs/guest/xg_sr_stream_format.h b/tools/libs/guest/xg_sr_stream_format.h
index 8a0da26f75..bc538bc192 100644
--- a/tools/libs/guest/xg_sr_stream_format.h
+++ b/tools/libs/guest/xg_sr_stream_format.h
@@ -76,6 +76,7 @@ struct xc_sr_rhdr
 #define REC_TYPE_STATIC_DATA_END            0x00000010U
 #define REC_TYPE_X86_CPUID_POLICY           0x00000011U
 #define REC_TYPE_X86_MSR_POLICY             0x00000012U
+#define REC_TYPE_DOMAIN_CONTEXT             0x00000013U
 
 #define REC_TYPE_OPTIONAL             0x80000000U
 
diff --git a/tools/python/xen/migration/libxc.py b/tools/python/xen/migration/libxc.py
index 9881f5ced4..08ac81344f 100644
--- a/tools/python/xen/migration/libxc.py
+++ b/tools/python/xen/migration/libxc.py
@@ -59,6 +59,7 @@ REC_TYPE_checkpoint_dirty_pfn_list  = 0x0000000f
 REC_TYPE_static_data_end            = 0x00000010
 REC_TYPE_x86_cpuid_policy           = 0x00000011
 REC_TYPE_x86_msr_policy             = 0x00000012
+REC_TYPE_domain_context             = 0x00000013
 
 rec_type_to_str = {
     REC_TYPE_end                        : "End",
@@ -80,6 +81,7 @@ rec_type_to_str = {
     REC_TYPE_static_data_end            : "Static data end",
     REC_TYPE_x86_cpuid_policy           : "x86 CPUID policy",
     REC_TYPE_x86_msr_policy             : "x86 MSR policy",
+    REC_TYPE_domain_context             : "Domain context",
 }
 
 # page_data
-- 
2.20.1


