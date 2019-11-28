Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C29D10CAB5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:54:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaL97-0000oN-F3; Thu, 28 Nov 2019 14:51:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ucib=ZU=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iaL95-0000oI-PM
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:51:51 +0000
X-Inumbo-ID: 953b2b5f-11ee-11ea-a3d3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 953b2b5f-11ee-11ea-a3d3-12813bfff9fa;
 Thu, 28 Nov 2019 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574952701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qSFGDub9dwV2EFLWtKK8KYIfUxh/CZEHhtBfPNddfo0=;
 b=LTr1krehe4M5esb7URaAENMW2NrhIpZiZs4ZHqh2HW5QMBwSSqPbcdOz
 jZPH9sT7/JsQ4GKIMmhWR2tI/pagHZb8KwIXixweVyJZYef3nUNkmm7wH
 2xX47h1wCPhWx45OkMcOqvRXF5tYGZcZG2I6W9lttyObM7A348QtBOMMK 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lr+2sJexp+jG5hwxQ8JmZLcygHP4f0QAhP+ustAiiB7IAXNypAR1LUccuTKtX3t9EKRlqRoS2W
 mh8Th0Z1Ir8srDKkhPK4matNwByHxkAtwJoDS9cXo2pUvEQfI4HqrZnVziC2IQSfmVsEuR4Xdn
 2W2/Md+NVqKP6m2BDfioLFyHVCsyRpJA3Uc02yXkmw+wgeSFZnSkFOavjOrB+L5l5ZAOXe3XQl
 aoU4GjFPh2zYUP38MVbjn9QYSS7FY+FIU98Uw7dAKtQVupTSooY6MN9I86hjyFt5nXgq0OTXLU
 KX4=
X-SBRS: 2.7
X-MesageID: 9082639
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="9082639"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 28 Nov 2019 14:51:35 +0000
Message-ID: <20191128145135.11974-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH LP-BUILD_TOOLS] Fix building with updated
 ENFORCE_UNIQUE_SYMBOLS behaviour
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBhdGNoICJidWlsZDogcHJvdmlkZSBvcHRpb24gdG8gZGlzYW1iaWd1YXRlIHN5bWJvbCBu
YW1lcyIgY2hhbmdlcwpFTkZPUkNFX1VOSVFVRV9TWU1CT0xTIHNvIHRoYXQgZ2NjIGdlbmVyYXRl
cyBvdXRwdXQgdG8gYSB0ZW1wb3JhcnkgZmlsZQphbmQgdGhlbiBvYmpjb3B5IGlzIHVzZWQgdG8g
Y3JlYXRlIHRoZSBmaW5hbCBvYmplY3QgZmlsZS4gVGhpcyBicmVha3MKbGl2ZXBhdGNoLWJ1aWxk
J3MgaW50ZXJwb3NpdGlvbiBvZiBHQ0MgdG8gY2FwdHVyZSB0aGUgY2hhbmdlZCBvYmplY3QKZmls
ZXMgc28gaW50ZXJjZXB0IGNhbGxzIHRvIG9iamNvcHkgYXMgd2VsbCB0byBjYXB0dXJlIHRoZSBm
aW5hbCBvYmplY3QKZmlsZXMuCgpXaGlsZSBpbiB0aGUgYXJlYSwgYWRkIGEgY291cGxlIG9mIGV4
dHJhIG9iamVjdCBmaWxlcyB0byBiZSBpZ25vcmVkIHdoZW4KcGF0Y2hpbmcuCgpTaWduZWQtb2Zm
LWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KLS0tCgpXaXRo
IHRoaXMgY2hhbmdlLCBJJ3ZlIGJ1aWx0IGFuZCBzdWNjZXNzZnVsbHkgYXBwbGllZCBhIHRyaXZp
YWwKbGl2ZXBhdGNoIHdpdGggSmFuJ3MgcGF0Y2ggYXBwbGllZCBhbmQgRU5GT1JDRV9VTklRVUVf
U1lNQk9MUyB0dXJuZWQgb24uCgpUbyBiZSBhcHBsaWVkIGF0IHRoZSBzYW1lIHRpbWUgYXMgSmFu
J3MgcGF0Y2guCgogbGl2ZXBhdGNoLWdjYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGl2ZXBhdGNoLWdj
YyBiL2xpdmVwYXRjaC1nY2MKaW5kZXggMDFlNGI4Yy4uOTEzMzNkNSAxMDA3NTUKLS0tIGEvbGl2
ZXBhdGNoLWdjYworKysgYi9saXZlcGF0Y2gtZ2NjCkBAIC0yNiw2ICsyNiw3IEBAIGRlY2xhcmUg
LWEgYXJncz0oIiRAIikKIGtlZXA9bm8KIAogZGVjbGFyZSAtciBHQ0NfUkU9J2djYy4qJworZGVj
bGFyZSAtciBPQkpDT1BZX1JFPSdvYmpjb3B5LionCiBpZiBbWyAiJFRPT0xDSEFJTkNNRCIgPX4g
JEdDQ19SRSBdXSA7IHRoZW4KICAgICB3aGlsZSBbICIkIyIgLWd0IDAgXTsgZG8KICAgICAgICAg
aWYgWyAiJDEiID0gIi1vIiBdOyB0aGVuCkBAIC0zNCw3ICszNSw5IEBAIGlmIFtbICIkVE9PTENI
QUlOQ01EIiA9fiAkR0NDX1JFIF1dIDsgdGhlbgogICAgICAgICAgICAgY2FzZSAiJG9iaiIgaW4K
ICAgICAgICAgICAgIHZlcnNpb24ub3xcCiAgICAgICAgICAgICBkZWJ1Zy5vfFwKKyAgICAgICAg
ICAgIGVmaS9jaGVjay5vfFwKICAgICAgICAgICAgICoueGVuLXN5bXMuKi5vfFwKKyAgICAgICAg
ICAgICoueGVuLmVmaS4qLm98XAogICAgICAgICAgICAgYnVpbHRfaW4ub3xcCiAgICAgICAgICAg
ICBwcmVsaW5rLm98XAogICAgICAgICAgICAgLioubykKQEAgLTU2LDYgKzU5LDI1IEBAIGlmIFtb
ICIkVE9PTENIQUlOQ01EIiA9fiAkR0NDX1JFIF1dIDsgdGhlbgogICAgIGZpCiAgICAgc2hpZnQK
IGRvbmUKK2VsaWYgW1sgIiRUT09MQ0hBSU5DTUQiID1+ICRPQkpDT1BZX1JFIF1dIDsgdGhlbgor
ICAgIG9iaj0iJHshI30iCisgICAgY2FzZSAiJG9iaiIgaW4KKyAgICAgICAgdmVyc2lvbi5vfFwK
KyAgICAgICAgZGVidWcub3xcCisgICAgICAgIGVmaS9jaGVjay5vfFwKKyAgICAgICAgLioubykK
KyAgICAgICAgICAgIDs7CisgICAgICAgICoubykKKyAgICAgICAgICAgIHBhdGg9IiQocHdkKS8k
KGRpcm5hbWUgJG9iaikiCisgICAgICAgICAgICBkaXI9IiR7cGF0aCMkTElWRVBBVENIX0JVSUxE
X0RJUn0iCisgICAgICAgICAgICBpZiBbIC1uICIkTElWRVBBVENIX0NBUFRVUkVfRElSIiAtYSAt
ZCAiJExJVkVQQVRDSF9DQVBUVVJFX0RJUiIgXTsgdGhlbgorICAgICAgICAgICAgICAgIGVjaG8g
IiRkaXIvJG9iaiIgPj4gIiR7TElWRVBBVENIX0NBUFRVUkVfRElSfS9jaGFuZ2VkX29ianMiCisg
ICAgICAgICAgICAgICAga2VlcD15ZXMKKyAgICAgICAgICAgIGZpCisgICAgICAgICAgICA7Owor
ICAgICAgICAqKQorICAgICAgICAgICAgOzsKKyAgICBlc2FjCiBmaQogCiAiJFRPT0xDSEFJTkNN
RCIgIiR7YXJnc1tAXX0iCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
