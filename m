Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDA7148B4E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 16:33:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv0vi-0006px-PU; Fri, 24 Jan 2020 15:31:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9iSm=3N=amazon.co.uk=prvs=28596b9bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iv0vh-0006pe-LO
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 15:31:29 +0000
X-Inumbo-ID: 91edc874-3ebe-11ea-8032-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91edc874-3ebe-11ea-8032-12813bfff9fa;
 Fri, 24 Jan 2020 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579879882; x=1611415882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sxPnPVoRAvywpCa7LpMqm/5kHF3lOXD/ctRFVIMS828=;
 b=GbiJTFTU0tCrMGQflbSo9JZeH7f6d+Q8K5mEzvbtPVTj6IrqnplpfwgC
 bQ7uvpYAPjcZvcul3lUikSbndydB+xoAejIpx9k9XfURv02YTLfi2daFD
 JUvGzHV+doLg5ECDtdUEcEsX3qWWIz9LI8dtosii4wOV8aQwRKswky3XU U=;
IronPort-SDR: DJMXuMG0lyhcTByMTyve91pr8Vjzo2AV9M5u+GSKATXi4BcsJSrPSceSunrtig7WO8NPhJKLDL
 y4Cl88A+211A==
X-IronPort-AV: E=Sophos;i="5.70,358,1574121600"; d="scan'208";a="14030541"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 24 Jan 2020 15:31:19 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id C09CBA07AC; Fri, 24 Jan 2020 15:31:17 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 24 Jan 2020 15:31:17 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 24 Jan 2020 15:31:16 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 24 Jan 2020 15:31:13 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 24 Jan 2020 15:30:59 +0000
Message-ID: <20200124153103.18321-4-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124153103.18321-1-pdurrant@amazon.com>
References: <20200124153103.18321-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 3/7] x86 / hvm: make domain_destroy() method
 optional
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBtZXRob2QgaXMgY3VycmVudGx5IGVtcHR5IGZvciBTVk0gc28gbWFrZSBpdCBvcHRpb25h
bCBhbmQsIHdoaWxlIGluCnRoZSBuZWlnaGJvdXJob29kLCBtYWtlIGl0IGFuIGFsdGVybmF0aXZl
X3ZjYWxsKCkuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5j
b20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
CkNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKdjQ6CiAtIE5ldyBpbiB2NCAoZGlz
YWdncmVnYXRlZCBmcm9tIHYzIHBhdGNoICMzKQotLS0KIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMg
ICAgIHwgNCArKystCiB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyB8IDUgLS0tLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCmluZGV4IDYz
MzNhZTZhYmEuLjBiOTM2MDlhODIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMK
KysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtNzQ3LDcgKzc0Nyw5IEBAIHZvaWQgaHZt
X2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpCiAKICAgICBodm1fZGVzdHJveV9jYWNo
ZWF0dHJfcmVnaW9uX2xpc3QoZCk7CiAKLSAgICBodm1fZnVuY3MuZG9tYWluX2Rlc3Ryb3koZCk7
CisgICAgaWYgKCBodm1fZnVuY3MuZG9tYWluX2Rlc3Ryb3kgKQorICAgICAgICBhbHRlcm5hdGl2
ZV92Y2FsbChodm1fZnVuY3MuZG9tYWluX2Rlc3Ryb3ksIGQpOworCiAgICAgcnRjX2RlaW5pdChk
KTsKICAgICBzdGR2Z2FfZGVpbml0KGQpOwogICAgIHZpb2FwaWNfZGVpbml0KGQpOwpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9z
dm0uYwppbmRleCBiMWMzNzZkNDU1Li5iN2Y2N2Y5ZjAzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvaHZtL3N2bS9zdm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwpAQCAtMTE1
NSwxMCArMTE1NSw2IEBAIHN0YXRpYyBpbnQgc3ZtX2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdCBk
b21haW4gKmQpCiAgICAgcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyB2b2lkIHN2bV9kb21haW5fZGVz
dHJveShzdHJ1Y3QgZG9tYWluICpkKQotewotfQotCiBzdGF0aWMgaW50IHN2bV92Y3B1X2luaXRp
YWxpc2Uoc3RydWN0IHZjcHUgKnYpCiB7CiAgICAgaW50IHJjOwpAQCAtMjQyNSw3ICsyNDIxLDYg
QEAgc3RhdGljIHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgX19pbml0ZGF0YSBzdm1fZnVuY3Rp
b25fdGFibGUgPSB7CiAgICAgLmNwdV91cCAgICAgICAgICAgICAgID0gc3ZtX2NwdV91cCwKICAg
ICAuY3B1X2Rvd24gICAgICAgICAgICAgPSBzdm1fY3B1X2Rvd24sCiAgICAgLmRvbWFpbl9pbml0
aWFsaXNlICAgID0gc3ZtX2RvbWFpbl9pbml0aWFsaXNlLAotICAgIC5kb21haW5fZGVzdHJveSAg
ICAgICA9IHN2bV9kb21haW5fZGVzdHJveSwKICAgICAudmNwdV9pbml0aWFsaXNlICAgICAgPSBz
dm1fdmNwdV9pbml0aWFsaXNlLAogICAgIC52Y3B1X2Rlc3Ryb3kgICAgICAgICA9IHN2bV92Y3B1
X2Rlc3Ryb3ksCiAgICAgLnNhdmVfY3B1X2N0eHQgICAgICAgID0gc3ZtX3NhdmVfdm1jYl9jdHh0
LAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
