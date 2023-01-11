Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8496662A7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 19:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475696.737483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFfgF-0004vH-QS; Wed, 11 Jan 2023 18:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475696.737483; Wed, 11 Jan 2023 18:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFfgF-0004t7-Ml; Wed, 11 Jan 2023 18:18:31 +0000
Received: by outflank-mailman (input) for mailman id 475696;
 Wed, 11 Jan 2023 18:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FWTY=5I=citrix.com=prvs=368716087=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pFfgD-0004t1-Og
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 18:18:29 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56dafc82-91dc-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 19:18:27 +0100 (CET)
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
X-Inumbo-ID: 56dafc82-91dc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673461107;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8eWpl94CgVNDdkjjqPyLI3KBUVFTsyRmT98TKI665ck=;
  b=dsVsbTdsBg8z+f+jFXNZP3vNjqLkMPhb44ZHkLvG7RY29bzET60YdtSP
   iBQNCEVnD/coboH4592N9XjavAHrXLhNQvXGVd/+2s0S/lyVi5rY0c/pC
   50P5tZBpceim0o9ErPBKj5NRp8VaHPvQg+RUEt66/fW3+KB65l1xWyd0X
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92218242
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5lxhZarKMUvrhYru9AfC5ob7/8heBmIZZRIvgKrLsJaIsI4StFCzt
 garIBnSOPbfZWKnLox3ao3g8EtV65TVnNU3HVE5+y40EHgb8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHziBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACoDVRSu2tK9+bLla81lo8JzNvW2FoxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw9
 zicpjSjXkty2Nq34gKf6lm+nPH0nwCgYa8SMqK98v9PqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+Oowi2FHUlJlYCOw4gRC4Ds8Pf/as820enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHRcJJG9eFoSTLkWVsDNZWei9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CK+PNYUTPMgsK1HXlM2LWaJ39zmz+HXAbIllY
 cvLGSpSJSty5VtbIMqeGL5GjO5DKtEWzmLPX5HrpylLIpLHDEN5vYwtaQPUBshgtfPsnekg2
 4oHXyd840kFAbKWj+i+2dJ7EG3m2lBiW8mo8JIJJ7LdSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:ZAoJ4KxiJ4IRZuDHZ9xgKrPxv+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBZpTnyAtj6fZq8z+893WB1B9uftWbdyQ+Vxe1ZjLcKhgeQYhEWldQtnZ
 uIEZIOb+EYZGIS5amV3OD7KadH/DDtytHKuQ6q9QYJcegcUdAD0+4WMGamO3wzYDMDKYsyFZ
 Ka6MYCjSGnY24rYsOyAWRAd/TfpvXQ/aiWKyIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH53KO+qPu2oyWsmlM7rq4m1OcJ+OEzSvBkufJlawkETTzYJLiJbofy8wzdZtvfq2rC3u
 O84SvIdP4DkU85NlvF3CcFnTOQmwrGokWStWOwkD/tp9f0Syk9DNcEjYVFcgHB405lp91k1r
 lXtljpw6a/ICmw7hgV3eK4Ii1Chw6xuz4vgOQTh3tQXc8Xb6JQt5UW+AdQHI0bFCz35Yg7GK
 02Zfusksp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIgUn2sG9pg6V55Yjt
 60RZhAhfVLVIsbfKh9DOAOTY++DXHMWwvFNCaILVHuBMg8SgHwQl7MkcUIDc2RCe01JcEJ6e
 v8uXtjxBAPR34=
X-IronPort-AV: E=Sophos;i="5.96,317,1665460800"; 
   d="scan'208";a="92218242"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH] build: include/compat: figure out which other compat headers are needed
Date: Wed, 11 Jan 2023 18:17:03 +0000
Message-ID: <20230111181703.30991-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Some compat headers depends on other compat headers that may not have
been generated due to config option.

This would be a generic way to deal with deps, instead of
    headers-$(call or $(CONFIG_TRACEBUFFER),$(CONFIG_HVM)) += compat/trace.h

This is just an RFC, as it only deals with "hvm_op.h" and nothing is
done to have make regenerate the new file when needed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/include/Makefile | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 65be310eca..5e6de97841 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -34,6 +34,29 @@ headers-$(CONFIG_TRACEBUFFER) += compat/trace.h
 headers-$(CONFIG_XENOPROF) += compat/xenoprof.h
 headers-$(CONFIG_XSM_FLASK) += compat/xsm/flask_op.h
 
+# Find dependencies of compat headers.
+# e.g. hvm/hvm_op.h needs trace.h; but if CONFIG_TRACEBUFFER=n, then trace.h would be missing.
+#
+# Using sed to remove ".." from path because unsure if something else is available
+# There's `realpath`, but maynot be available
+#	realpath --relative-to=. -mL compat/hvm/../trace.h -> compat/trace.h
+# `make` also have macro for that $(abspath), only recent version.
+#
+# The $(CC) line to gen deps is derived from $(cmd_compat_i)
+include $(obj)/.compat-header-deps.d
+$(obj)/.compat-header-deps.d: include/public/hvm/hvm_op.h
+	$(CC) -MM -MF $@.tmp $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $<
+	for f in $$(cat $@.tmp | sed -r '1s/^[^:]*: //; s/ \\$$//'); do \
+	    echo $$f; \
+	done | sed -r \
+	    -e 's#.*/public#compat#; : p; s#/[^/]+/../#/#; t p; s#$$# \\#' \
+	    -e '1i headers-y-deps := \\' -e '$$a \ ' \
+	    > $@
+
+headers-y-deps := $(filter-out compat/xen-compat.h,$(headers-y-deps))
+# Add compat header dependencies and eliminates duplicates
+headers-y := $(sort $(headers-y) $(headers-y-deps))
+
 cppflags-y                := -include public/xen-compat.h -DXEN_GENERATING_COMPAT_HEADERS
 cppflags-$(CONFIG_X86)    += -m32
 
-- 
Anthony PERARD


