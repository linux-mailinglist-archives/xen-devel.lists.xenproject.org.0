Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2083F14DD73
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 16:00:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixBGd-0003pU-LO; Thu, 30 Jan 2020 14:58:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixBGb-0003pH-Rq
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 14:58:01 +0000
X-Inumbo-ID: e8aaf4a0-4370-11ea-8a92-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8aaf4a0-4370-11ea-8a92-12813bfff9fa;
 Thu, 30 Jan 2020 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580396281; x=1611932281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jWP/Kr2Ts6Val7nfm7XrDb112aC13m4+y12u2fDJXsQ=;
 b=nEoVGtBJI2IvqbPocAtNtXhraYVCpdwSc6FDzBE0V01CCG0FNOaklKkk
 TcHDL0/5JS9rIq5PAYQUMQyd06HY03QFf+zsFrK9xMxe08N5i2JOodsGr
 mNuE2G9wboPBqysW85bdYlgxEO7z+zLtbeYE47Rnfa1YoaAWtzyQ3K113 U=;
IronPort-SDR: gUcmwMj4SvNgyvVDmb1myLdidwN2c6LN8+oQyp51nKu2Ps1LBvSPKrX36P2XyhQJO2IXetQ6c8
 IuZhz9GFle6g==
X-IronPort-AV: E=Sophos;i="5.70,382,1574121600"; d="scan'208";a="14033251"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Jan 2020 14:58:00 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3BA21241606; Thu, 30 Jan 2020 14:57:57 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 14:57:56 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 14:57:56 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 30 Jan 2020 14:57:52 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 14:57:42 +0000
Message-ID: <20200130145745.1306-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200130145745.1306-1-pdurrant@amazon.com>
References: <20200130145745.1306-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v8 1/4] x86 / vmx: move teardown from
 domain_destroy()...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIHRvIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpLgoKVGhlIHRlYXJkb3duIGNvZGUg
ZnJlZXMgdGhlIEFQSUN2IHBhZ2UuIFRoaXMgZG9lcyBub3QgbmVlZCB0byBiZSBkb25lIGxhdGUK
c28gZG8gaXQgaW4gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgcmF0aGVyIHRoYW4gZG9t
YWluX2Rlc3Ryb3koKS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4KLS0tCkNjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNj
OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT4KCnY0OgogIC0gTmV3IGluIHY0IChkaXNhZ2dyZWdhdGVkIGZyb20gdjMgcGF0Y2ggIzMp
Ci0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwppbmRleCBiMjYy
ZDM4YTdjLi42MDZmM2RjMmViIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
YworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtNDE5LDcgKzQxOSw3IEBAIHN0
YXRpYyBpbnQgdm14X2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4gKmQpCiAgICAgcmV0
dXJuIDA7CiB9CiAKLXN0YXRpYyB2b2lkIHZteF9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWlu
ICpkKQorc3RhdGljIHZvaWQgdm14X2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyhzdHJ1Y3Qg
ZG9tYWluICpkKQogewogICAgIGlmICggIWhhc192bGFwaWMoZCkgKQogICAgICAgICByZXR1cm47
CkBAIC0yMjQwLDcgKzIyNDAsNyBAQCBzdGF0aWMgc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSBf
X2luaXRkYXRhIHZteF9mdW5jdGlvbl90YWJsZSA9IHsKICAgICAuY3B1X3VwX3ByZXBhcmUgICAg
ICAgPSB2bXhfY3B1X3VwX3ByZXBhcmUsCiAgICAgLmNwdV9kZWFkICAgICAgICAgICAgID0gdm14
X2NwdV9kZWFkLAogICAgIC5kb21haW5faW5pdGlhbGlzZSAgICA9IHZteF9kb21haW5faW5pdGlh
bGlzZSwKLSAgICAuZG9tYWluX2Rlc3Ryb3kgICAgICAgPSB2bXhfZG9tYWluX2Rlc3Ryb3ksCisg
ICAgLmRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyA9IHZteF9kb21haW5fcmVsaW5xdWlzaF9y
ZXNvdXJjZXMsCiAgICAgLnZjcHVfaW5pdGlhbGlzZSAgICAgID0gdm14X3ZjcHVfaW5pdGlhbGlz
ZSwKICAgICAudmNwdV9kZXN0cm95ICAgICAgICAgPSB2bXhfdmNwdV9kZXN0cm95LAogICAgIC5z
YXZlX2NwdV9jdHh0ICAgICAgICA9IHZteF9zYXZlX3ZtY3NfY3R4dCwKLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
