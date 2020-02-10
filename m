Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96806158170
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 18:32:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Cs0-0006cA-Js; Mon, 10 Feb 2020 17:29:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rnvo=36=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1Cry-0006bf-Lo
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 17:29:14 +0000
X-Inumbo-ID: d752adfc-4c2a-11ea-b4ed-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d752adfc-4c2a-11ea-b4ed-12813bfff9fa;
 Mon, 10 Feb 2020 17:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581355748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o4hQMakeBAIwBozAO6WBJ4ueS9R6pAqEY27bfnaQayQ=;
 b=bxU180cse9Fp9llL/rlpjEBRATMuGlqYcyTDl5w6N/ToS5vnYEKImltd
 nx7AoXi7y6EfMYXAgs7/M1NowlPqA2Ur6j0V7lKxTqp7Tr9ZighnpQPxZ
 kOm+HsFjFoB8J06GSbBKYZQkwXrsfO/hWM7bNGjEwnyz9YZ0G3mBodjLf 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uWEyeU2kp66D3dgBl/4dBQV5KFsyj6Rg7tqO/hTkGt3cuV9ylomY5F1eb4Bge5I0qCOJSD70sh
 283vUXpl2nF1bSV1Mlq5QUgzTBEqzY2thTQb8tBXi8DuUHM6E17EB9GRqDpjyP45Yr1GkpKIv6
 UnJRPuPCCbs+2NVwmmd6RR53QHqUrS9HBWl3tAal+bLnhQ3vxGWAVlF3epUpSKlrcOgU6Gy2Iu
 JnEEcofteB1KyHEwec7BjWQAdCQOkSWbfBmKg11jD6FQw4bm7HFLtWgSRT22SGWtIVvHkYPUqO
 AxQ=
X-SBRS: 2.7
X-MesageID: 12224388
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12224388"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 10 Feb 2020 18:28:27 +0100
Message-ID: <20200210172829.43604-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210172829.43604-1-roger.pau@citrix.com>
References: <20200210172829.43604-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 5/7] x86/tlb: allow disabling the TLB clock
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIFRMQiBjbG9jayBpcyBoZWxwZnVsIHdoZW4gcnVubmluZyBYZW4gb24gYmFyZSBtZXRhbCBi
ZWNhdXNlIHdoZW4KZG9pbmcgYSBUTEIgZmx1c2ggZWFjaCBDUFUgaXMgSVBJJ2VkIGFuZCBjYW4g
a2VlcCBhIHRpbWVzdGFtcCBvZiB0aGUKbGFzdCBmbHVzaC4KClRoaXMgaXMgbm90IHRoZSBjYXNl
IGhvd2V2ZXIgd2hlbiBYZW4gaXMgcnVubmluZyB2aXJ0dWFsaXplZCwgYW5kIHRoZQp1bmRlcmx5
aW5nIGh5cGVydmlzb3IgcHJvdmlkZXMgbWVjaGFuaXNtIHRvIGFzc2lzdCBpbiBwZXJmb3JtaW5n
IFRMQgpmbHVzaGVzOiBYZW4gaXRzZWxmIGZvciBleGFtcGxlIG9mZmVycyBhIEhWTU9QX2ZsdXNo
X3RsYnMgaHlwZXJjYWxsIGluCm9yZGVyIHRvIHBlcmZvcm0gYSBUTEIgZmx1c2ggd2l0aG91dCBo
YXZpbmcgdG8gSVBJIGVhY2ggQ1BVLiBXaGVuCnVzaW5nIHN1Y2ggbWVjaGFuaXNtcyBpdCdzIG5v
IGxvbmdlciBwb3NzaWJsZSB0byBrZWVwIGEgdGltZXN0YW1wIG9mCnRoZSBmbHVzaGVzIG9uIGVh
Y2ggQ1BVLCBhcyB0aGV5IGFyZSBwZXJmb3JtZWQgYnkgdGhlIHVuZGVybHlpbmcKaHlwZXJ2aXNv
ci4KCk9mZmVyIGEgYm9vbGVhbiBpbiBvcmRlciB0byBzaWduYWwgWGVuIHRoYXQgdGhlIHRpbWVz
dGFtcGVkIFRMQgpzaG91bGRuJ3QgYmUgdXNlZC4gVGhpcyBhdm9pZHMga2VlcGluZyB0aGUgdGlt
ZXN0YW1wcyBvZiB0aGUgZmx1c2hlcywKYW5kIGFsc28gZm9yY2VzIE5FRURfRkxVU0ggdG8gYWx3
YXlzIHJldHVybiB0cnVlLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQsIGFzIHRoaXMg
Y2hhbmdlIGRvZXNuJ3QgaW50cm9kdWNlIGFueQp1c2VyIHRoYXQgZGlzYWJsZXMgdGhlIHRpbWVz
dGFtcGVkIFRMQi4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9mbHVzaHRsYi5jICAgICAgICB8IDE5ICsrKysr
KysrKysrKystLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaCB8IDE3ICsrKysr
KysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMgYi94ZW4vYXJjaC94
ODYvZmx1c2h0bGIuYwppbmRleCBlN2NjZDRlYzdiLi4zNjQ5OTAwNzkzIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvZmx1c2h0bGIuYworKysgYi94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwpAQCAt
MzIsNiArMzIsOSBAQAogdTMyIHRsYmZsdXNoX2Nsb2NrID0gMVU7CiBERUZJTkVfUEVSX0NQVSh1
MzIsIHRsYmZsdXNoX3RpbWUpOwogCisvKiBTaWduYWxzIHdoZXRoZXIgdGhlIFRMQiBmbHVzaCBj
bG9jayBpcyBpbiB1c2UuICovCitib29sIF9fcmVhZF9tb3N0bHkgdGxiX2Nsa19lbmFibGVkID0g
dHJ1ZTsKKwogLyoKICAqIHByZV9mbHVzaCgpOiBJbmNyZW1lbnQgdGhlIHZpcnR1YWwgVExCLWZs
dXNoIGNsb2NrLiBSZXR1cm5zIG5ldyBjbG9jayB2YWx1ZS4KICAqIApAQCAtODIsMTIgKzg1LDEz
IEBAIHN0YXRpYyB2b2lkIHBvc3RfZmx1c2godTMyIHQpCiBzdGF0aWMgdm9pZCBkb190bGJfZmx1
c2godm9pZCkKIHsKICAgICB1bnNpZ25lZCBsb25nIGZsYWdzLCBjcjQ7Ci0gICAgdTMyIHQ7Cisg
ICAgdTMyIHQgPSAwOwogCiAgICAgLyogVGhpcyBub24tcmVlbnRyYW50IGZ1bmN0aW9uIGlzIHNv
bWV0aW1lcyBjYWxsZWQgaW4gaW50ZXJydXB0IGNvbnRleHQuICovCiAgICAgbG9jYWxfaXJxX3Nh
dmUoZmxhZ3MpOwogCi0gICAgdCA9IHByZV9mbHVzaCgpOworICAgIGlmICggdGxiX2Nsa19lbmFi
bGVkICkKKyAgICAgICAgdCA9IHByZV9mbHVzaCgpOwogCiAgICAgaWYgKCB1c2VfaW52cGNpZCAp
CiAgICAgICAgIGludnBjaWRfZmx1c2hfYWxsKCk7CkBAIC05OSw3ICsxMDMsOCBAQCBzdGF0aWMg
dm9pZCBkb190bGJfZmx1c2godm9pZCkKICAgICBlbHNlCiAgICAgICAgIHdyaXRlX2NyMyhyZWFk
X2NyMygpKTsKIAotICAgIHBvc3RfZmx1c2godCk7CisgICAgaWYgKCB0bGJfY2xrX2VuYWJsZWQg
KQorICAgICAgICBwb3N0X2ZsdXNoKHQpOwogCiAgICAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3Mp
OwogfQpAQCAtMTA3LDcgKzExMiw3IEBAIHN0YXRpYyB2b2lkIGRvX3RsYl9mbHVzaCh2b2lkKQog
dm9pZCBzd2l0Y2hfY3IzX2NyNCh1bnNpZ25lZCBsb25nIGNyMywgdW5zaWduZWQgbG9uZyBjcjQp
CiB7CiAgICAgdW5zaWduZWQgbG9uZyBmbGFncywgb2xkX2NyNDsKLSAgICB1MzIgdDsKKyAgICB1
MzIgdCA9IDA7CiAKICAgICAvKiBUaHJvdWdob3V0IHRoaXMgZnVuY3Rpb24gd2UgbWFrZSB0aGlz
IGFzc3VtcHRpb246ICovCiAgICAgQVNTRVJUKCEoY3I0ICYgWDg2X0NSNF9QQ0lERSkgfHwgIShj
cjQgJiBYODZfQ1I0X1BHRSkpOwpAQCAtMTE1LDcgKzEyMCw4IEBAIHZvaWQgc3dpdGNoX2NyM19j
cjQodW5zaWduZWQgbG9uZyBjcjMsIHVuc2lnbmVkIGxvbmcgY3I0KQogICAgIC8qIFRoaXMgbm9u
LXJlZW50cmFudCBmdW5jdGlvbiBpcyBzb21ldGltZXMgY2FsbGVkIGluIGludGVycnVwdCBjb250
ZXh0LiAqLwogICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKIAotICAgIHQgPSBwcmVfZmx1c2go
KTsKKyAgICBpZiAoIHRsYl9jbGtfZW5hYmxlZCApCisgICAgICAgIHQgPSBwcmVfZmx1c2goKTsK
IAogICAgIG9sZF9jcjQgPSByZWFkX2NyNCgpOwogICAgIEFTU0VSVCghKG9sZF9jcjQgJiBYODZf
Q1I0X1BDSURFKSB8fCAhKG9sZF9jcjQgJiBYODZfQ1I0X1BHRSkpOwpAQCAtMTY3LDcgKzE3Myw4
IEBAIHZvaWQgc3dpdGNoX2NyM19jcjQodW5zaWduZWQgbG9uZyBjcjMsIHVuc2lnbmVkIGxvbmcg
Y3I0KQogICAgIGlmICggY3I0ICYgWDg2X0NSNF9QQ0lERSApCiAgICAgICAgIGludnBjaWRfZmx1
c2hfYWxsX25vbmdsb2JhbHMoKTsKIAotICAgIHBvc3RfZmx1c2godCk7CisgICAgaWYgKCB0bGJf
Y2xrX2VuYWJsZWQgKQorICAgICAgICBwb3N0X2ZsdXNoKHQpOwogCiAgICAgbG9jYWxfaXJxX3Jl
c3RvcmUoZmxhZ3MpOwogfQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVzaHRs
Yi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVzaHRsYi5oCmluZGV4IDA3ZjliYzYxMDMuLjk3
NzMwMTQzMjAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaAorKysg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2ZsdXNodGxiLmgKQEAgLTIxLDEwICsyMSwyMSBAQCBleHRl
cm4gdTMyIHRsYmZsdXNoX2Nsb2NrOwogLyogVGltZSBhdCB3aGljaCBlYWNoIENQVSdzIFRMQiB3
YXMgbGFzdCBmbHVzaGVkLiAqLwogREVDTEFSRV9QRVJfQ1BVKHUzMiwgdGxiZmx1c2hfdGltZSk7
CiAKLSNkZWZpbmUgdGxiZmx1c2hfY3VycmVudF90aW1lKCkgdGxiZmx1c2hfY2xvY2sKKy8qIFRM
QiBjbG9jayBpcyBpbiB1c2UuICovCitleHRlcm4gYm9vbCB0bGJfY2xrX2VuYWJsZWQ7CisKK3N0
YXRpYyBpbmxpbmUgdWludDMyX3QgdGxiZmx1c2hfY3VycmVudF90aW1lKHZvaWQpCit7CisgICAg
LyogUmV0dXJuaW5nIDAgZnJvbSB0bGJmbHVzaF9jdXJyZW50X3RpbWUgd2lsbCBhbHdheXMgZm9y
Y2UgYSBmbHVzaC4gKi8KKyAgICByZXR1cm4gdGxiX2Nsa19lbmFibGVkID8gdGxiZmx1c2hfY2xv
Y2sgOiAwOworfQogCiBzdGF0aWMgaW5saW5lIHZvaWQgcGFnZV9zZXRfdGxiZmx1c2hfdGltZXN0
YW1wKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCiB7CisgICAgLyogQXZvaWQgdGhlIHdyaXRlIGlm
IHRoZSBUTEIgY2xvY2sgaXMgZGlzYWJsZWQuICovCisgICAgaWYgKCAhdGxiX2Nsa19lbmFibGVk
ICkKKyAgICAgICAgcmV0dXJuOworCiAgICAgLyoKICAgICAgKiBQcmV2ZW50IHN0b3JpbmcgYSBz
dGFsZSB0aW1lIHN0YW1wLCB3aGljaCBjb3VsZCBoYXBwZW4gaWYgYW4gdXBkYXRlCiAgICAgICog
dG8gdGxiZmx1c2hfY2xvY2sgcGx1cyBhIHN1YnNlcXVlbnQgZmx1c2ggSVBJIGhhcHBlbiBiZXR3
ZWVuIHRoZQpAQCAtNjcsNiArNzgsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIHRsYmZsdXNoX2Zp
bHRlcihjcHVtYXNrX3QgKm1hc2ssIHVpbnQzMl90IHBhZ2VfdGltZXN0YW1wKQogewogICAgIHVu
c2lnbmVkIGludCBjcHU7CiAKKyAgICAvKiBTaG9ydC1jaXJjdWl0OiB0aGVyZSdzIG5vIG5lZWQg
dG8gaXRlcmF0ZSBpZiB0aGUgY2xvY2sgaXMgZGlzYWJsZWQuICovCisgICAgaWYgKCAhdGxiX2Ns
a19lbmFibGVkICkKKyAgICAgICAgcmV0dXJuOworCiAgICAgZm9yX2VhY2hfY3B1ICggY3B1LCBt
YXNrICkKICAgICAgICAgaWYgKCAhTkVFRF9GTFVTSChwZXJfY3B1KHRsYmZsdXNoX3RpbWUsIGNw
dSksIHBhZ2VfdGltZXN0YW1wKSApCiAgICAgICAgICAgICBfX2NwdW1hc2tfY2xlYXJfY3B1KGNw
dSwgbWFzayk7Ci0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
