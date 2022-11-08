Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E4962187F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440161.694272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhN-00072W-IN; Tue, 08 Nov 2022 15:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440161.694272; Tue, 08 Nov 2022 15:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhN-0006zK-EZ; Tue, 08 Nov 2022 15:39:37 +0000
Received: by outflank-mailman (input) for mailman id 440161;
 Tue, 08 Nov 2022 15:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQhM-0006zE-C1
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:39:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a6a5574-5f7b-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 16:39:34 +0100 (CET)
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
X-Inumbo-ID: 8a6a5574-5f7b-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8ePR03hmluMvOGGTEiWLD/HCh/fqyWBWHQzlfAz9mW4=;
  b=Qlcd397j3Ty8M+5IqATEqYp0rPtYrPoe8MZJdlElZuxS230FIAnLReTo
   7gnD4aujZiNUxzGJqFa5hD5B8NOQ5OP/Msg5IZ9sz0K6Mo3Q9N4KCL6qu
   IDsbV4q1NkwnOvte+7GEdvwT87lZhkznBURNu6M5YlfoVbKuY/sCNMB3d
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84417005
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9knbNquqGW13lrMKgnEn17uSP+fnVFpeMUV32f8akzHdYApBsoF/q
 tZmKTvUM/3YNGvwcox3bYq+8UkFsMPTzN5lTwVkqS01FCwT+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaGxyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEyoUQQijp8uMmpmhU9lzl50hI/KzI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XfjFGqVTTua0t5Gv7xw1tyrn9dtHSf7RmQO0FwhrB+
 TqeogwVBDk+LdbAkhSP8UiNxcbQwHnpBIUwLLqBo6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8wwufHHlCcTdHZ/QvrspwTjsvv
 neFls3kLSZiu7qUTTSa7Lj8kN+pEXFLdylYP3ZCFFZbpYm4yG0usv7RZu15CYGtrv3cI2vb2
 Sm6szlnhboo1dFegs1X4mv7qz6ro5HISCs86QPWQn+p42tFWWK1W2C7wQOFtKgdde51WnHE5
 SFZwJbGsIjiGLnXzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meJ52u9B7cJZhNGiJObhKrgY/nGNYC6SbzYugn8N7KjovFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yUylKVfo+lGLsGbd1PVoXKscWnD27eHwG507/jer2iIC9Fd/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnC/zGPSRHhURUUG6Wfe8p0KKbTYeVI2QQnMyZb5mNscRmCspIwN/s+gw
 513chMwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:wVwiwa5FANW47TynjwPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84417005"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 15/15] tools/ocaml/libs/xc: fix use of uninitialized memory in shadow_allocation_get
Date: Tue, 8 Nov 2022 15:34:07 +0000
Message-ID: <94f93ee61a4d0bd2fac3f5a753cb935962be20bb.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It has been noticed in 2013 that shadow allocation sometimes returns the
wrong value, which got worked around by adding a limit to the shadow
multiplier of 1000 and ignoring the value from Xen in that case
to avoid a shadow multiplier causing a VM to request 6PB of memory for
example:
https://github.com/xapi-project/xen-api/pull/1215/commits/be55a8c30b41d1cd7596fc100ab1cfd3539f74eb

However that is just a workaround, and I've just reproduced this by
killing a VM mid migration, which resulted in a shadow multiplier of
629.42, rendering the VM unbootable even after a host reboot.

The real bug is in Xen: when a VM is dying it will return '0' for paging
op domctls and log a message at info level
'Ignoring paging op on dying domain', which leaves the 'mb' parameter
uninitialized upon return from the domctl.

The binding also doesn't initialize the 'c->mb' parameter (it is meant
to be used only when setting, not when querying the allocation),
which results in the VM getting a shadow allocation (and thus multiplier)
set based on what value happened to be currently on the stack.

Explicitly initialize the value passed to the domctl, and detect the uninitialized
case (shadow allocation of 0), and raise an exception in that case.
The exception will cause xenopsd to skip setting the shadow multiplier.

Note that the behaviour of Xen here is inconsistent between x86 and ARM:
ARM would return EINVAL when it gets a paging op on a dying domain,
and X86-64 would return 0 with possibly uninitialized data.

It might be desirable to change the x86 path in the hypervisor to return
EINVAL, although that would require more testing in case it breaks
somethig.
But the bindings should be defensive anyway against bugs like this.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion in 4.17:
- fixes a long-standing (>9y old) bug that is still happening today

Changes since v2:
- new in v3
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index e2d897581f..9681a74e40 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1019,7 +1019,7 @@ CAMLprim value stub_shadow_allocation_get(value xch, value domid)
 {
     CAMLparam2(xch, domid);
     CAMLlocal1(mb);
-    unsigned int c_mb;
+    unsigned int c_mb = 0;
     int ret;
 
     caml_enter_blocking_section();
@@ -1029,6 +1029,9 @@ CAMLprim value stub_shadow_allocation_get(value xch, value domid)
     caml_leave_blocking_section();
     if (ret != 0)
         failwith_xc(_H(xch));
+    if ( !c_mb )
+        caml_failwith("domctl returned uninitialized data for shadow "
+                      "allocation, dying domain?");
 
     mb = Val_int(c_mb);
     CAMLreturn(mb);
-- 
2.34.1


