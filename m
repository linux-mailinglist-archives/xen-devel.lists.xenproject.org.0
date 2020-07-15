Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE0722106D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 17:11:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvj4K-0003ee-68; Wed, 15 Jul 2020 15:11:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXN5=A2=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1jvj4I-0003eS-TX
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 15:11:34 +0000
X-Inumbo-ID: 784095e2-c6ad-11ea-bca7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 784095e2-c6ad-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 15:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594825894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K1owBnRIAVTLefyKeo/+v16BnObQDQqtz+nCvF/ExPk=;
 b=KDGMtsEu6pA+66JLREo8V4CXgbfH7TK7LDW8ABX/moM2KGARVQkDE+Up
 1F/Gw/ZAnGqt/8lGy+zQ/3+c1pJL/Z96PvRToG+YcLGOw+AgMY6gkIbfT
 7KNDo5317R7qjCO+Dn86VaNQNeQqaqKly5AXMjArbTk8eLJ5SJIG5KatN M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CzHeqjY9VbefBM2DJ6NxvUrHVDQlZCRk4LRNwhjRMWOHZTVopogD3gmx0tv/NAbChMfShjV0sV
 swl7+jP9sy8lFDCCUMPh1rjCwkezY7wfm7+/7h5h2b3iAxIm7vmZUJcbLcTV6UwtAxIHvq3HJ5
 WoJGFVYbuarawQyJlvJiK9XSHZdouH2uviZeoPe/ykm5VJTfn+GdG7F0MnFflPa0Qb4V1iEraG
 /AbqG9psoN1pnKYGRF9U3MZaAly4Q4I29pAR/ff8u6hrPNNSWL7undOQzm7jroEW0CL8jRz0RL
 cD4=
X-SBRS: 2.7
X-MesageID: 22775216
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22775216"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v1 1/1] oxenstored: fix ABI breakage introduced in Xen 4.9.0
Date: Wed, 15 Jul 2020 16:10:56 +0100
Message-ID: <6fcfdb706cc2f666069c1d0bbc59d22f660fc81d.1594825512.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1594825512.git.edvin.torok@citrix.com>
References: <cover.1594825512.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wl@xen.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
 David Scott <dave@recoil.org>, Christian
 Lindig <christian.lindig@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dbc84d2983969bb47d294131ed9e6bbbdc2aec49 (Xen >= 4.9.0) deleted XS_RESTRICT
from oxenstored, which caused all the following opcodes to be shifted by 1:
reset_watches became off-by-one compared to the C version of xenstored.

Looking at the C code the opcode for reset watches needs:
XS_RESET_WATCHES = XS_SET_TARGET + 2

So add the placeholder `Invalid` in the OCaml<->C mapping list.
(Note that the code here doesn't simply convert the OCaml constructor to
 an integer, so we don't need to introduce a dummy constructor).

Igor says that with a suitably patched xenopsd to enable watch reset,
we now see `reset watches` during kdump of a guest in xenstored-access.log.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Tested-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 tools/ocaml/libs/xb/op.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xb/op.ml b/tools/ocaml/libs/xb/op.ml
index d4f1f08185..9bcab0f38c 100644
--- a/tools/ocaml/libs/xb/op.ml
+++ b/tools/ocaml/libs/xb/op.ml
@@ -28,7 +28,7 @@ let operation_c_mapping =
            Transaction_end; Introduce; Release;
            Getdomainpath; Write; Mkdir; Rm;
            Setperms; Watchevent; Error; Isintroduced;
-           Resume; Set_target; Reset_watches |]
+           Resume; Set_target; Invalid; Reset_watches |]
 let size = Array.length operation_c_mapping
 
 let array_search el a =
-- 
2.25.1


