Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2111325B1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:09:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ione5-0005AC-Me; Tue, 07 Jan 2020 12:07:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tB6F=24=amazon.com=prvs=2686fb3d9=hongyxia@srs-us1.protection.inumbo.net>)
 id 1ione3-000591-Lb
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:07:35 +0000
X-Inumbo-ID: 44682f3f-3146-11ea-abea-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44682f3f-3146-11ea-abea-12813bfff9fa;
 Tue, 07 Jan 2020 12:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578398847; x=1609934847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=k9ao28sjxycjJJ0sKPbc+jDcJKXPxqdYKANLUQawgsg=;
 b=Y4w4pzRPb6YwAW3sCTsFENbdLfsATjot1whK4xGoMB0uhReWXUPCzygs
 v6iChHVfP9bLwomrClj0vFvgwfppkUmqPxKF8qREVXSFLv5SS+YKn+Pwv
 mKhQLw2YxHA7Edlwr7CXLnVc9zgHMSeUtTSYcQdPwHOkRLf5OGrxaMvVD Q=;
IronPort-SDR: RXHC8QyoI91/DwlBhQyMM3o6YE501Ntq1IjrBXKWqLKWELxCSpw/fEMLf35cID3BBMY2bcu0mo
 cKU2blFvpjKQ==
X-IronPort-AV: E=Sophos;i="5.69,406,1571702400"; d="scan'208";a="11237542"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 07 Jan 2020 12:07:26 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id E38D0A1C3D; Tue,  7 Jan 2020 12:07:24 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 12:07:15 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 12:07:14 +0000
Received: from u0b3720fa96e858.ant.amazon.com (10.125.106.133) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 12:07:11 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 7 Jan 2020 12:06:49 +0000
Message-ID: <3f256df7ddae79efa66ceead096315593cb3901e.1578397252.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578397252.git.hongyxia@amazon.com>
References: <cover.1578397252.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 7/7] x86/mm: change pl*e to l*t in
 virt_to_xen_l*e
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgbmVlZCB0byBoYXZl
IGEgdmFyaWFibGUgbmFtZWQgcGwqZSB3aGVuIHdlIHJld3JpdGUKdmlydF90b194ZW5fbCplLiBD
aGFuZ2UgcGwqZSB0byBsKnQgdG8gcmVmbGVjdCBiZXR0ZXIgaXRzIHB1cnBvc2UuClRoaXMgd2ls
bCBtYWtlIHJldmlld2luZyBsYXRlciBwYXRjaCBlYXNpZXIuCgpObyBmdW5jdGlvbmFsIGNoYW5n
ZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neXhpYUBhbWF6b24uY29tPgpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgNDIg
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMjEgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCA2YjU4OTc2MmIxLi5kNTk0ZDZh
YmZiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0u
YwpAQCAtNTA1NCwyNSArNTA1NCwyNSBAQCBzdGF0aWMgbDNfcGdlbnRyeV90ICp2aXJ0X3RvX3hl
bl9sM2UodW5zaWduZWQgbG9uZyB2KQogICAgIGlmICggIShsNGVfZ2V0X2ZsYWdzKCpwbDRlKSAm
IF9QQUdFX1BSRVNFTlQpICkKICAgICB7CiAgICAgICAgIGJvb2wgbG9ja2luZyA9IHN5c3RlbV9z
dGF0ZSA+IFNZU19TVEFURV9ib290OwotICAgICAgICBsM19wZ2VudHJ5X3QgKnBsM2UgPSBhbGxv
Y194ZW5fcGFnZXRhYmxlKCk7CisgICAgICAgIGwzX3BnZW50cnlfdCAqbDN0ID0gYWxsb2NfeGVu
X3BhZ2V0YWJsZSgpOwogCi0gICAgICAgIGlmICggIXBsM2UgKQorICAgICAgICBpZiAoICFsM3Qg
KQogICAgICAgICAgICAgcmV0dXJuIE5VTEw7Ci0gICAgICAgIGNsZWFyX3BhZ2UocGwzZSk7Cisg
ICAgICAgIGNsZWFyX3BhZ2UobDN0KTsKICAgICAgICAgaWYgKCBsb2NraW5nICkKICAgICAgICAg
ICAgIHNwaW5fbG9jaygmbWFwX3BnZGlyX2xvY2spOwogICAgICAgICBpZiAoICEobDRlX2dldF9m
bGFncygqcGw0ZSkgJiBfUEFHRV9QUkVTRU5UKSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGw0
X3BnZW50cnlfdCBsNGUgPSBsNGVfZnJvbV9wYWRkcihfX3BhKHBsM2UpLCBfX1BBR0VfSFlQRVJW
SVNPUik7CisgICAgICAgICAgICBsNF9wZ2VudHJ5X3QgbDRlID0gbDRlX2Zyb21fcGFkZHIoX19w
YShsM3QpLCBfX1BBR0VfSFlQRVJWSVNPUik7CiAKICAgICAgICAgICAgIGw0ZV93cml0ZShwbDRl
LCBsNGUpOwogICAgICAgICAgICAgZWZpX3VwZGF0ZV9sNF9wZ3RhYmxlKGw0X3RhYmxlX29mZnNl
dCh2KSwgbDRlKTsKLSAgICAgICAgICAgIHBsM2UgPSBOVUxMOworICAgICAgICAgICAgbDN0ID0g
TlVMTDsKICAgICAgICAgfQogICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bp
bl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKLSAgICAgICAgaWYgKCBwbDNlICkKLSAgICAgICAg
ICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShwbDNlKTsKKyAgICAgICAgaWYgKCBsM3QgKQorICAgICAg
ICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKGwzdCk7CiAgICAgfQogCiAgICAgcmV0dXJuIGw0ZV90
b19sM2UoKnBsNGUpICsgbDNfdGFibGVfb2Zmc2V0KHYpOwpAQCAtNTA4OSwyMiArNTA4OSwyMiBA
QCBzdGF0aWMgbDJfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9sMmUodW5zaWduZWQgbG9uZyB2KQog
ICAgIGlmICggIShsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICB7
CiAgICAgICAgIGJvb2wgbG9ja2luZyA9IHN5c3RlbV9zdGF0ZSA+IFNZU19TVEFURV9ib290Owot
ICAgICAgICBsMl9wZ2VudHJ5X3QgKnBsMmUgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CisgICAg
ICAgIGwyX3BnZW50cnlfdCAqbDJ0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwogCi0gICAgICAg
IGlmICggIXBsMmUgKQorICAgICAgICBpZiAoICFsMnQgKQogICAgICAgICAgICAgcmV0dXJuIE5V
TEw7Ci0gICAgICAgIGNsZWFyX3BhZ2UocGwyZSk7CisgICAgICAgIGNsZWFyX3BhZ2UobDJ0KTsK
ICAgICAgICAgaWYgKCBsb2NraW5nICkKICAgICAgICAgICAgIHNwaW5fbG9jaygmbWFwX3BnZGly
X2xvY2spOwogICAgICAgICBpZiAoICEobDNlX2dldF9mbGFncygqcGwzZSkgJiBfUEFHRV9QUkVT
RU5UKSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGwzZV93cml0ZShwbDNlLCBsM2VfZnJvbV9w
YWRkcihfX3BhKHBsMmUpLCBfX1BBR0VfSFlQRVJWSVNPUikpOwotICAgICAgICAgICAgcGwyZSA9
IE5VTEw7CisgICAgICAgICAgICBsM2Vfd3JpdGUocGwzZSwgbDNlX2Zyb21fcGFkZHIoX19wYShs
MnQpLCBfX1BBR0VfSFlQRVJWSVNPUikpOworICAgICAgICAgICAgbDJ0ID0gTlVMTDsKICAgICAg
ICAgfQogICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1h
cF9wZ2Rpcl9sb2NrKTsKLSAgICAgICAgaWYgKCBwbDJlICkKLSAgICAgICAgICAgIGZyZWVfeGVu
X3BhZ2V0YWJsZShwbDJlKTsKKyAgICAgICAgaWYgKCBsMnQgKQorICAgICAgICAgICAgZnJlZV94
ZW5fcGFnZXRhYmxlKGwydCk7CiAgICAgfQogCiAgICAgQlVHX09OKGwzZV9nZXRfZmxhZ3MoKnBs
M2UpICYgX1BBR0VfUFNFKTsKQEAgLTUxMjIsMjIgKzUxMjIsMjIgQEAgbDFfcGdlbnRyeV90ICp2
aXJ0X3RvX3hlbl9sMWUodW5zaWduZWQgbG9uZyB2KQogICAgIGlmICggIShsMmVfZ2V0X2ZsYWdz
KCpwbDJlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICB7CiAgICAgICAgIGJvb2wgbG9ja2luZyA9
IHN5c3RlbV9zdGF0ZSA+IFNZU19TVEFURV9ib290OwotICAgICAgICBsMV9wZ2VudHJ5X3QgKnBs
MWUgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CisgICAgICAgIGwxX3BnZW50cnlfdCAqbDF0ID0g
YWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwogCi0gICAgICAgIGlmICggIXBsMWUgKQorICAgICAgICBp
ZiAoICFsMXQgKQogICAgICAgICAgICAgcmV0dXJuIE5VTEw7Ci0gICAgICAgIGNsZWFyX3BhZ2Uo
cGwxZSk7CisgICAgICAgIGNsZWFyX3BhZ2UobDF0KTsKICAgICAgICAgaWYgKCBsb2NraW5nICkK
ICAgICAgICAgICAgIHNwaW5fbG9jaygmbWFwX3BnZGlyX2xvY2spOwogICAgICAgICBpZiAoICEo
bDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QUkVTRU5UKSApCiAgICAgICAgIHsKLSAgICAg
ICAgICAgIGwyZV93cml0ZShwbDJlLCBsMmVfZnJvbV9wYWRkcihfX3BhKHBsMWUpLCBfX1BBR0Vf
SFlQRVJWSVNPUikpOwotICAgICAgICAgICAgcGwxZSA9IE5VTEw7CisgICAgICAgICAgICBsMmVf
d3JpdGUocGwyZSwgbDJlX2Zyb21fcGFkZHIoX19wYShsMXQpLCBfX1BBR0VfSFlQRVJWSVNPUikp
OworICAgICAgICAgICAgbDF0ID0gTlVMTDsKICAgICAgICAgfQogICAgICAgICBpZiAoIGxvY2tp
bmcgKQogICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKLSAgICAgICAg
aWYgKCBwbDFlICkKLSAgICAgICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShwbDFlKTsKKyAgICAg
ICAgaWYgKCBsMXQgKQorICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKGwxdCk7CiAgICAg
fQogCiAgICAgQlVHX09OKGwyZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFNFKTsKLS0gCjIu
MTUuMy5BTVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
