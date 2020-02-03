Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F211504BA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 11:59:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZPh-0007Ys-St; Mon, 03 Feb 2020 10:57:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z8sP=3X=amazon.co.uk=prvs=29554d7b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iyZPg-0007Yh-G6
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 10:57:08 +0000
X-Inumbo-ID: ebe14cae-4673-11ea-a933-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebe14cae-4673-11ea-a933-bc764e2007e4;
 Mon, 03 Feb 2020 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580727428; x=1612263428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gzobShf8Ff0Sr4nJu807Ny+fAQLwCOU4cbk5kGoMPBw=;
 b=P2iQ19V/eWgeUGLDoeXA9m9JmEQjzg+Y6zY7JtuP+TkCzDjnjJ2Ve1zS
 0k1qB7LDRuxcKgZ25xRGCbxhuM7bYSHuwH9v/xO0MayKph06oYrAh09aO
 bpce6mcrg8R7R3AxW2QzDPioeEAGlsE+V2rR0cw4kubmUGl486EUC63uL k=;
IronPort-SDR: LqY645qCdk/G5a+FxYxIpS5gU8x4LqIJdw8s7VgXd39beUzGDGky2bwVvfogkuhY4qhIAviNJh
 GtkPNrdL1GDA==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="15395179"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 03 Feb 2020 10:57:07 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 76DADA2430; Mon,  3 Feb 2020 10:57:04 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 10:57:04 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 10:57:02 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 3 Feb 2020 10:57:00 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 10:56:51 +0000
Message-ID: <20200203105654.22998-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200203105654.22998-1-pdurrant@amazon.com>
References: <20200203105654.22998-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v9 1/4] x86 / vmx: move teardown from
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIHRvIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpLgoKVGhlIHRlYXJkb3duIGNvZGUg
ZnJlZXMgdGhlIEFQSUN2IHBhZ2UuIFRoaXMgZG9lcyBub3QgbmVlZCB0byBiZSBkb25lIGxhdGUK
c28gZG8gaXQgaW4gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgcmF0aGVyIHRoYW4gZG9t
YWluX2Rlc3Ryb3koKS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2
aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgotLS0KQ2M6IEp1biBO
YWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2Vy
IFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCnY0OgogIC0gTmV3IGluIHY0IChkaXNhZ2dyZWdhdGVk
IGZyb20gdjMgcGF0Y2ggIzMpCi0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bXguYwppbmRleCBiMjYyZDM4YTdjLi42MDZmM2RjMmViIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3ZteC92bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAt
NDE5LDcgKzQxOSw3IEBAIHN0YXRpYyBpbnQgdm14X2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdCBk
b21haW4gKmQpCiAgICAgcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyB2b2lkIHZteF9kb21haW5fZGVz
dHJveShzdHJ1Y3QgZG9tYWluICpkKQorc3RhdGljIHZvaWQgdm14X2RvbWFpbl9yZWxpbnF1aXNo
X3Jlc291cmNlcyhzdHJ1Y3QgZG9tYWluICpkKQogewogICAgIGlmICggIWhhc192bGFwaWMoZCkg
KQogICAgICAgICByZXR1cm47CkBAIC0yMjQwLDcgKzIyNDAsNyBAQCBzdGF0aWMgc3RydWN0IGh2
bV9mdW5jdGlvbl90YWJsZSBfX2luaXRkYXRhIHZteF9mdW5jdGlvbl90YWJsZSA9IHsKICAgICAu
Y3B1X3VwX3ByZXBhcmUgICAgICAgPSB2bXhfY3B1X3VwX3ByZXBhcmUsCiAgICAgLmNwdV9kZWFk
ICAgICAgICAgICAgID0gdm14X2NwdV9kZWFkLAogICAgIC5kb21haW5faW5pdGlhbGlzZSAgICA9
IHZteF9kb21haW5faW5pdGlhbGlzZSwKLSAgICAuZG9tYWluX2Rlc3Ryb3kgICAgICAgPSB2bXhf
ZG9tYWluX2Rlc3Ryb3ksCisgICAgLmRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyA9IHZteF9k
b21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMsCiAgICAgLnZjcHVfaW5pdGlhbGlzZSAgICAgID0g
dm14X3ZjcHVfaW5pdGlhbGlzZSwKICAgICAudmNwdV9kZXN0cm95ICAgICAgICAgPSB2bXhfdmNw
dV9kZXN0cm95LAogICAgIC5zYXZlX2NwdV9jdHh0ICAgICAgICA9IHZteF9zYXZlX3ZtY3NfY3R4
dCwKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
