Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55944B50D1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271585.466134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJaud-0003Pz-9p; Mon, 14 Feb 2022 12:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271585.466134; Mon, 14 Feb 2022 12:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJaud-0003Fg-2l; Mon, 14 Feb 2022 12:57:03 +0000
Received: by outflank-mailman (input) for mailman id 271585;
 Mon, 14 Feb 2022 12:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJaua-0001Wb-Tu
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:57:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95738935-8d95-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 13:56:55 +0100 (CET)
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
X-Inumbo-ID: 95738935-8d95-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=bS6U6dpS0uCHmyTfyvV11KW0uKIoo2qJ/wueBOXPivk=;
  b=A6REouaRBDkRyFwQwIO95HTAALUcEYrhICbPBWWG0Jlfg09Swj3zmvoC
   1VABM/sahF7VlpufIgpj/XrCneTchZoZJX4E40TNf2v7UykdVAtBZcq8o
   KQHi0Rqy373+oz0131T+8hiB5qby075h++3Dkfy/ml07lVlmzdCEWzR61
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: DcILunBeCx6JLSKYMAN5Ejn1W6HEpA9UXxQC/kfaq2+bBy5/w2+cDsBLAX4KkGwAkMX0o9PKAR
 Bzf0W+y7J2bdy8v4TnIcTtrANOJceFf0MiXi8rxTIF/CO5wwSp7XlplHnpvd2P2oGBWbixXBwY
 paRC12Nqk103A5rHrfBv+ZxZ3CBzCVp2P8waxCfBA87xT6WYWrkREZcFOVigvSiz1ECi+1BFJt
 vgCd6GO4HmSfFFoI4q70yDuOG55chiPxTDq7Sj4lQSpxVsuFbf+0IltD6EaQpfazFFYhxMnpGV
 nhJTXpPc+fLmHwSpaAsw1U6h
X-SBRS: 5.1
X-MesageID: 64148583
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XWXNLatFYQLeei+KE2WuiZmVb+fnVEhZMUV32f8akzHdYApBsoF/q
 tZmKWjUaP2CamLxeIx1bdu+9ksCvZbUxtI3TQpory9nFHlH+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplmKybGClqEYT3t6c9XgYDNz4lZJIX5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5NFOWc/N3wsZTVsMU0rLp95md6ToUD6fAEDgwq3/LcOtj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWduJ0e
 mJX1QMVgusS+VPwasamBiLpvyvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgJ8hMwaWNweHmJzi
 ALQ9z/9LXk26eDOFyrBnluBhW7qYUAowXk+iTjopOfvy/3qu8kNgx3GVb6P+4bl34SuSVkcL
 91nxRXSZon/b+ZWjc1XHnid2lpAQ6QlqSZvuG3qspqNtF8RWWJcT9XABaLnxfhBNp2FaVKKo
 WIJncOThMhXU83Ry3zdHbhVRerzjxpgDNE7qQQxd6TNChz3oyLzFWyuyG0WyLhV3jYsJmayP
 R67VfJ5755PJnq6BZKbkKrqY/nGOZPITIy/PtiNN4ImSsEoKGevoXE/DWbNjjuFuBV9zskC1
 WKzLJ/E4YAyUv88klJbho41jNcW+8zJ7T2PFM6rl0z9idJzphe9EN84DbdHVchhhIvsnekf2
 4w32xKix0oNXevgTDPQ9IJPf1kGIWJiXcL9qtBNd/7FKQ1jQTlzB/jUyLInWopkg6UKybuYo
 iDjAhdVmAjlmHnKCQSWcXQ/Ornhaoly8CAgNis2MFf2h3V6OdSz7L0SfoccdKU88LAx1uZ9S
 vQIIp3SAvlGRjnd1S4aaJ3x8N5reBix3FrcNCu5ejkvOZVnQlWRqNPjewLu8ggIDza26pRi8
 +HxiFuDTMNaFQp4DcvQZPa+9H+LvCAQyLBoQk/FAthPY0GwooJkHDP8060sKMYWJBSdmjbDj
 1SKAQ0VrPXmqpMu9IWbnriNqoqkHrcsHkdeGGWHv7+6OTODozimyI5EFu2JYSrcRCX//6D7P
 bdZyPT1MfsmmldWstUjT+Y3nPxmv9a/9aVHyglEHWnQawX5A7xtFXCKwM1Tu/Af3bReowa3B
 hqC99Qy1W9l4y85/Ir9/DYYU9k=
IronPort-HdrOrdr: A9a23:8a+lVqnTUB7VIruLicTU/0ogkSXpDfIo3DAbv31ZSRFFG/Fxl6
 iV/cjztCWE8Ar5N0tQ+uxoVJPufZqYz+8Q3WBzB8baYOCFghrLEGgK1+KLqFeMdxEWtNQtsp
 uIG5IObuEYZmIbsS+V2meF+q4bsby6zJw=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64148583"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 4/7] xsm: Use __initconst_cf_clobber for xsm_ops
Date: Mon, 14 Feb 2022 12:56:29 +0000
Message-ID: <20220214125632.24563-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125632.24563-1-andrew.cooper3@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

All calls through xsm_ops are fully altcall'd.  Harden all fnptr targets.

This yields:

  (XEN) altcall: Optimised away 197 endbr64 instructions

of 1655 on an everything-enabled build of Xen, which is ~12%.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/dummy.c       | 2 +-
 xen/xsm/flask/hooks.c | 2 +-
 xen/xsm/silo.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 4d29a9aa5b9f..8c044ef61500 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -13,7 +13,7 @@
 #define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
-static const struct xsm_ops __initconstrel dummy_ops = {
+static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .security_domaininfo           = xsm_security_domaininfo,
     .domain_create                 = xsm_domain_create,
     .getdomaininfo                 = xsm_getdomaininfo,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 63484e323c09..0bf63ffa84c4 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1765,7 +1765,7 @@ static int cf_check flask_argo_send(
 
 #endif
 
-static const struct xsm_ops __initconstrel flask_ops = {
+static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index 4d5fc98e7e54..b89b36428784 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -102,7 +102,7 @@ static int cf_check silo_argo_send(
 
 #endif
 
-static const struct xsm_ops __initconstrel silo_xsm_ops = {
+static const struct xsm_ops __initconst_cf_clobber silo_xsm_ops = {
     .evtchn_unbound = silo_evtchn_unbound,
     .evtchn_interdomain = silo_evtchn_interdomain,
     .grant_mapref = silo_grant_mapref,
-- 
2.11.0


