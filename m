Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC4B511C0D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 17:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315213.533664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjx1-0000IL-7v; Wed, 27 Apr 2022 15:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315213.533664; Wed, 27 Apr 2022 15:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjx1-0000FO-4d; Wed, 27 Apr 2022 15:51:35 +0000
Received: by outflank-mailman (input) for mailman id 315213;
 Wed, 27 Apr 2022 15:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CTGo=VF=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1njjwz-0007rz-Qm
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 15:51:33 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8ecea52-c641-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 17:51:32 +0200 (CEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 08:34:32 -0700
Received: from esimonso-mobl1.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.23.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 08:34:31 -0700
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
X-Inumbo-ID: e8ecea52-c641-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651074692; x=1682610692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kbCPed86nvsBlhVS5WHzEURJPx5XQ+Bz2HXpoqkbpVg=;
  b=C8OpWO/D0yLDZ4ZQ+DAxRmYicSgCBvDwkA5P/ymKmuFbGa521DIIWBvB
   vnd85jFQPYrcfPur1X0S9/oznk8nkKH3W6njuIpJRcT8Om0N31CPRT6gl
   04eDJSaVj07FLzbzLCh0FptsIBxuf/HaaVf6jKogcJ8hkslbp/onhrr7k
   LH1hvEg/1RY7amH0vFPKzUuY1Rjtbt++G9gsuZWqxBkM+4HeS6j0JEdlR
   HSiRH8XU0VzsHD3HH02pK5wajziWhprv3qAxnKIjAWRyvXmcKPb6xGPT9
   X84BQEJtZygP4ACFfaZly0RSyozmVQc8imXg/dwRLFQo6r8XYhB08g+Ho
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="328915526"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="328915526"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="680854487"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/3] tools/libxc: change xc_memshr_fork_reset API to match hypervisor
Date: Wed, 27 Apr 2022 11:34:19 -0400
Message-Id: <f3fdd4e99892549dc68e7511f2d84f51af446e86.1651073086.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Need to separately specify if the reset is for the memory or for the VM state,
or both.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v5: split from the hypervisor-side patch
---
 tools/include/xenctrl.h     | 3 ++-
 tools/libs/ctrl/xc_memshr.c | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 95bd5eca67..1b089a2c02 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2290,7 +2290,8 @@ int xc_memshr_fork(xc_interface *xch,
  *
  * With VMs that have a lot of memory this call may block for a long time.
  */
-int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain);
+int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain,
+                         bool reset_state, bool reset_memory);
 
 /* Debug calls: return the number of pages referencing the shared frame backing
  * the input argument. Should be one or greater.
diff --git a/tools/libs/ctrl/xc_memshr.c b/tools/libs/ctrl/xc_memshr.c
index a6cfd7dccf..a0d0b894e2 100644
--- a/tools/libs/ctrl/xc_memshr.c
+++ b/tools/libs/ctrl/xc_memshr.c
@@ -257,12 +257,17 @@ int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
     return xc_memshr_memop(xch, domid, &mso);
 }
 
-int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid)
+int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid, bool reset_state,
+                         bool reset_memory)
 {
     xen_mem_sharing_op_t mso;
 
     memset(&mso, 0, sizeof(mso));
     mso.op = XENMEM_sharing_op_fork_reset;
+    if ( reset_state )
+        mso.u.fork.flags |= XENMEM_FORK_RESET_STATE;
+    if ( reset_memory )
+        mso.u.fork.flags |= XENMEM_FORK_RESET_MEMORY;
 
     return xc_memshr_memop(xch, domid, &mso);
 }
-- 
2.34.1


