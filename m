Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC271443AD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:54:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itxgE-0005LZ-Gz; Tue, 21 Jan 2020 17:51:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ThP3=3K=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1itxgC-0005KH-CH
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 17:51:08 +0000
X-Inumbo-ID: 7ea87952-3c76-11ea-bb21-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ea87952-3c76-11ea-bb21-12813bfff9fa;
 Tue, 21 Jan 2020 17:50:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 09:50:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="228929264"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.23.127])
 by orsmga006.jf.intel.com with ESMTP; 21 Jan 2020 09:50:09 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 09:49:49 -0800
Message-Id: <ccfe688a5604ab5d547562c7e7d7f787418bef43.1579628566.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1579628566.git.tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 16/18] xen/mem_access: Use
 __get_gfn_type_access in set_mem_access
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIF9fZ2V0X2dmbl90eXBlX2FjY2VzcyBpbnN0ZWFkIG9mIHAybS0+Z2V0X2VudHJ5IHRvIHRy
aWdnZXIgcGFnZS1mb3JraW5nCndoZW4gdGhlIG1lbV9hY2Nlc3MgcGVybWlzc2lvbiBpcyBiZWlu
ZyBzZXQgb24gYSBwYWdlIHRoYXQgaGFzIG5vdCB5ZXQgYmVlbgpjb3BpZWQgb3ZlciBmcm9tIHRo
ZSBwYXJlbnQuCgpTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxA
aW50ZWwuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgfCA1ICsrLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2Fj
Y2Vzcy5jCmluZGV4IDMyMGI5ZmU2MjEuLjljYWYwOGE1YjIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS9tZW1fYWNjZXNzLmMKKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwpA
QCAtMzAzLDExICszMDMsMTAgQEAgc3RhdGljIGludCBzZXRfbWVtX2FjY2VzcyhzdHJ1Y3QgZG9t
YWluICpkLCBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAogICAgIEFTU0VSVCghYXAybSk7CiAjZW5k
aWYKICAgICB7Ci0gICAgICAgIG1mbl90IG1mbjsKICAgICAgICAgcDJtX2FjY2Vzc190IF9hOwog
ICAgICAgICBwMm1fdHlwZV90IHQ7Ci0KLSAgICAgICAgbWZuID0gcDJtLT5nZXRfZW50cnkocDJt
LCBnZm4sICZ0LCAmX2EsIDAsIE5VTEwsIE5VTEwpOworICAgICAgICBtZm5fdCBtZm4gPSBfX2dl
dF9nZm5fdHlwZV9hY2Nlc3MocDJtLCBnZm5feChnZm4pLCAmdCwgJl9hLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX0FMTE9DLCBOVUxMLCBmYWxzZSk7CiAg
ICAgICAgIHJjID0gcDJtLT5zZXRfZW50cnkocDJtLCBnZm4sIG1mbiwgUEFHRV9PUkRFUl80Sywg
dCwgYSwgLTEpOwogICAgIH0KIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
