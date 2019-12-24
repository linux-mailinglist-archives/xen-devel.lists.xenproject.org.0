Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A76E12A195
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 14:06:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijjrh-0005Nh-FX; Tue, 24 Dec 2019 13:04:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZIBU=2O=amazon.com=prvs=254c36092=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ijjrf-0005N1-QR
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 13:04:43 +0000
X-Inumbo-ID: f0b48ec6-264d-11ea-97ba-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0b48ec6-264d-11ea-97ba-12813bfff9fa;
 Tue, 24 Dec 2019 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1577192678; x=1608728678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vnIq/cIgRD0jd90vP+NlWt4S20SbX16kcXTVjrRcQ60=;
 b=S+QGCHc9tss+5PngJC2JcrPIOxT0hGuLojjx5qdTfUmpGSvusA2BaQ99
 A7nz1PeNYkNSlhVUAtN/yLWfQB1HvGJXUxb5AN5eEwxML4p1YgAcqK+fa
 KBrmxjYCnixNPlRaPpnCNh4gqu+/k6ceaHjf06NQuLAy7nNSLT0E4MT5x I=;
IronPort-SDR: f9DRfdJJtGk9Yoe+mjxl32GMCrpGGDFOEhjpy//ecS8xWfY38jI9ooewUmIt6GV4TPl12D2aJH
 zQR4sBOiAw5A==
X-IronPort-AV: E=Sophos;i="5.69,351,1571702400"; 
   d="scan'208";a="9013343"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 24 Dec 2019 13:04:37 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id A8B28141A2F; Tue, 24 Dec 2019 13:04:34 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 24 Dec 2019 13:04:33 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 24 Dec 2019 13:04:32 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 24 Dec 2019 13:04:30 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 13:04:14 +0000
Message-ID: <20191224130416.3570-5-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191224130416.3570-1-pdurrant@amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 4/6] domctl: set XEN_DOMCTL_createdomain 'rover'
 if valid domid is specified
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHZhbHVlIG9mICdyb3ZlcicgaXMgdGhlIHZhbHVlIGF0IHdoaWNoIFhlbiB3aWxsIHN0YXJ0
IHNlYXJjaGluZyBmb3IgYW4KdW51c2VkIGRvbWlkIGlmIG5vbmUgaXMgc3BlY2lmaWVkLiBDdXJy
ZW50bHkgaXQgaXMgb25seSB1cGRhdGVkIHdoZW4gYQpkb21pZCBpcyBhdXRvbWF0aWNhbGx5IGNo
b3NlbiwgcmF0aGVyIHRoYW4gc3BlY2lmaWVkIGJ5IHRoZSBjYWxsZXIsIHdoaWNoCm1ha2VzIGl0
IHZlcnkgaGFyZCB0byBkZXNjcmliZSBYZW4ncyByYXRpb25hbGUgaW4gY2hvb3NpbmcgZG9taWRz
IGluIGFuCmVudmlyb25tZW50IHdoZXJlIHNvbWUgZG9tYWluIGNyZWF0aW9ucyBoYXZlIHNwZWNp
ZmllZCBkb21pZHMgYW5kIHNvbWUKZG9uJ3QuClRoaXMgcGF0Y2ggYWx3YXlzIHVwZGF0ZXMgJ3Jv
dmVyJyBhZnRlciBhIHN1Y2Nlc3NmdWwgY3JlYXRpb24sIGV2ZW4gaW4gdGhlCmNhc2UgdGhhdCBk
b21pZCBpcyBzcGVjaWZpZWQgYnkgdGhlIGNhbGxlci4gVGhpcyBlbnN1cmVzIHRoYXQsIGlmIFhl
bgphdXRvbWF0aWNhbGx5IGNob29zZXMgYSBkb21pZCBmb3IgYSBzdWJzZXF1ZW50IGRvbWFpbiBj
cmVhdGlvbiBpdCB3aWxsCmFsd2F5cyBiZSB0aGUgbmV4dCBhdmFpbGFibGUgdmFsdWUgYWZ0ZXIg
dGhlIGRvbWlkIG9mIHRoZSBtb3N0IHJlY2VudGx5CmNyZWF0ZWQgZG9tYWluLgoKU2lnbmVkLW9m
Zi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJh
ZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIHhlbi9jb21tb24vZG9tY3Rs
LmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWN0bC5jIGIveGVuL2NvbW1vbi9kb21jdGwu
YwppbmRleCA2NTAzMTBlODc0Li41MjY4ZjM5NjdiIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2Rv
bWN0bC5jCisrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMKQEAgLTUyMSw4ICs1MjEsNiBAQCBsb25n
IGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwp
CiAgICAgICAgICAgICByZXQgPSAtRU5PTUVNOwogICAgICAgICAgICAgaWYgKCBkb20gPT0gcm92
ZXIgKQogICAgICAgICAgICAgICAgIGJyZWFrOwotCi0gICAgICAgICAgICByb3ZlciA9IGRvbTsK
ICAgICAgICAgfQogCiAgICAgICAgIGQgPSBkb21haW5fY3JlYXRlKGRvbSwgJm9wLT51LmNyZWF0
ZWRvbWFpbiwgZmFsc2UpOwpAQCAtNTM0LDcgKzUzMiw3IEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9H
VUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkKICAgICAgICAgfQogCiAg
ICAgICAgIHJldCA9IDA7Ci0gICAgICAgIG9wLT5kb21haW4gPSBkLT5kb21haW5faWQ7CisgICAg
ICAgIHJvdmVyID0gb3AtPmRvbWFpbiA9IGQtPmRvbWFpbl9pZDsKICAgICAgICAgY29weWJhY2sg
PSAxOwogICAgICAgICBkID0gTlVMTDsKICAgICAgICAgYnJlYWs7Ci0tIAoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
