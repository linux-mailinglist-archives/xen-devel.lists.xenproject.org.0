Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB6565C7DE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 21:10:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470702.730287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCnbf-0004Ft-Jr; Tue, 03 Jan 2023 20:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470702.730287; Tue, 03 Jan 2023 20:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCnbf-0004E7-H0; Tue, 03 Jan 2023 20:09:55 +0000
Received: by outflank-mailman (input) for mailman id 470702;
 Tue, 03 Jan 2023 20:09:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oadl=5A=citrix.com=prvs=36087fe06=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCnbe-0004E1-CL
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 20:09:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93d66c6d-8ba2-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 21:09:52 +0100 (CET)
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
X-Inumbo-ID: 93d66c6d-8ba2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672776592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=2yFcSH2umpU0naapLlqvQU9WmOebWnbXbogEZZlzszQ=;
  b=NGhzt1fpRodRKYbZz8kndgdKkukR2L0+6sTWeGoXnbizLFxsR2VorXDx
   IkzjmWA/WAc7PILrIsreGejf0Rxs5pDf/OlGJLWhso3LElhhAZTjTx2Ov
   D1pd0wvgli+LX+mOZWQxpQyQIMNA/c9dxx+rNTdyOvopGqmomNsaob86O
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91025429
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:K79aoK27suSQTPsnj/bD5eVxkn2cJEfYwER7XKvMYLTBsI5bpzNTy
 mQbCDjXOfiOYjf9f9Ekb4rkoxgBuZCHnIVgTVBupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlD5gVmPqgX1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPX588
 KZfAjQ0cU7cmeuQkI66bukzr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TbHJ0PwxrC9
 woq+Uz1LhU2BfKv1gO68yuJvPHLxB6jYoI7QejQGvlC3wTImz175ActfUCgvfCzh0q6WtReA
 08Z4Cwjqe417kPDZsb5dw21pjiDpBF0c9hNF+w37imdx6yS5ByWbkAmZDNcbN0ttOctWCcnk
 FSOmrvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyLzflTqWEIwlSvTsyISoR3egm
 FhmsRTSmZ0vkvwOjeKR+WnY3W2yr76Zcg8R5lr+CzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCl/OI+TfNDKq8gj9yjn9ZKme6ENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+BxmX9mlTOLHMyrp/hC7VZ5TCfMIYrpzXPUNrxphE96iF+9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUUG6WTNg5UPLIare1M2cFzN/teNmdvNjaQ5xfUK/goJl
 1nhMnJlJK3X3CCecV3TOy0zN9sCn/9X9BoGAMDlBn7ws1BLXGplxP13m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:MwMeY6B+wy/VSHDlHems55DYdb4zR+YMi2TDtnoBLyC9F/bzqy
 nApoV46faWslYssRMb6LW90cC7KBu2lKKdirNhWYtKMjOW31dA77sP0WIh+VDd8uHFmdK1HJ
 0PT0DZZeeAbmRHsQ==
X-IronPort-AV: E=Sophos;i="5.96,297,1665460800"; 
   d="scan'208";a="91025429"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH 3/4] xen/version: Drop bogus return values for XENVER_platform_parameters
Date: Tue, 3 Jan 2023 20:09:42 +0000
Message-ID: <20230103200943.5801-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230103200943.5801-1-andrew.cooper3@citrix.com>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

A split in virtual address space is only applicable for x86 PV guests.
Furthermore, the information returned for x86 64bit PV guests is wrong.

Explain the problem in version.h, stating the other information that PV guests
need to know.

For 64bit PV guests, and all non-x86-PV guests, return 0, which is strictly
less wrong than the values currently returned.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 xen/common/kernel.c          |  6 ++++--
 xen/include/public/version.h | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index ccee178ff17a..70e7dff87488 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -522,7 +522,9 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( current->hcall_compat )
         {
             compat_platform_parameters_t params = {
-                .virt_start = HYPERVISOR_COMPAT_VIRT_START(current->domain),
+                .virt_start = is_pv_vcpu(current)
+                            ? HYPERVISOR_COMPAT_VIRT_START(current->domain)
+                            : 0,
             };
 
             if ( copy_to_guest(arg, &params, 1) )
@@ -532,7 +534,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #endif
         {
             xen_platform_parameters_t params = {
-                .virt_start = HYPERVISOR_VIRT_START,
+                .virt_start = 0,
             };
 
             if ( copy_to_guest(arg, &params, 1) )
diff --git a/xen/include/public/version.h b/xen/include/public/version.h
index 0ff8bd9077c6..c8325219f648 100644
--- a/xen/include/public/version.h
+++ b/xen/include/public/version.h
@@ -42,6 +42,26 @@ typedef char xen_capabilities_info_t[1024];
 typedef char xen_changeset_info_t[64];
 #define XEN_CHANGESET_INFO_LEN (sizeof(xen_changeset_info_t))
 
+/*
+ * This API is problematic.
+ *
+ * It is only applicable to guests which share pagetables with Xen (x86 PV
+ * guests), and is supposed to identify the virtual address split between
+ * guest kernel and Xen.
+ *
+ * For 32bit PV guests, it mostly does this, but the caller needs to know that
+ * Xen lives between the split and 4G.
+ *
+ * For 64bit PV guests, Xen lives at the bottom of the upper canonical range.
+ * This previously returned the start of the upper canonical range (which is
+ * the userspace/Xen split), not the Xen/kernel split (which is 8TB further
+ * on).  This now returns 0 because the old number wasn't correct, and
+ * changing it to anything else would be even worse.
+ *
+ * For all guest types using hardware virt extentions, Xen is not mapped into
+ * the guest kernel virtual address space.  This now return 0, where it
+ * previously returned unrelated data.
+ */
 #define XENVER_platform_parameters 5
 struct xen_platform_parameters {
     xen_ulong_t virt_start;
-- 
2.11.0


