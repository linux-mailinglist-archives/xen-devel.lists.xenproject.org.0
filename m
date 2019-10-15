Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC97D7A6C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 17:50:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKP3Y-0006sN-1G; Tue, 15 Oct 2019 15:48:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JiiH=YI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iKP3W-0006sH-Vx
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 15:48:15 +0000
X-Inumbo-ID: 323df55c-ef63-11e9-9396-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 323df55c-ef63-11e9-9396-12813bfff9fa;
 Tue, 15 Oct 2019 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571154494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rTTVk62nyZlBdywC9TsPCBEqn3hU35NOF2WU+JHZtD4=;
 b=LJSNzpNOY6xd3/KePslsmqQzHr+KLKaVpF0GNTqhcsu5fZvlQeVupnq/
 9PgBw1OTtmwLcAOyuTy9g/PnumjMrPae+AI1n0ZeH0fZGnqcBUwpDRwMD
 shr2/PeLSNtNKHj+0el0y+OzfIBdyk+sXB7h4x8d3+o/s8sIXlTqEVbFV s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wrQomBz/zHLFiiS7yWU5fdNAcYQhXSOKyFc1JwAer1Y0x/Cudn81VwNghOURdnj2jQGcbstH2Q
 GesNS7O97yMlxIGRL+nRjs4exnBRQmvB+zJeE796G+yJ6ktHcN3LthSpYqUQYPRVbOH+bostkd
 Q9zTgPJxsKiDr+AV5Tt9KOjb2Kce91MQOAYoA4YPZvtUjfwHFNLRX0Zwiupnt2lmYfKQcOuqdD
 tuaoEs6+f51kOLNqeENDoBmRTIZVSbe+k2Vsi82Hrwhvy+Rxg3VXP3rMBCFA3wWzjcszbffzzt
 wtU=
X-SBRS: 2.7
X-MesageID: 7316156
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,300,1566878400"; 
   d="scan'208";a="7316156"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 15 Oct 2019 17:47:33 +0200
Message-ID: <20191015154736.19882-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015154736.19882-1-roger.pau@citrix.com>
References: <20191015154736.19882-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/4] iommu/amd: support all delivery modes
 with x2APIC
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
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBBTUQgSU9NTVUgY29kZSB3aWxsIGF0dGVtcHQgdG8gY3JlYXRlIHJlbWFwcGluZyBl
bnRyaWVzIGZvcgphbGwgSU8tQVBJQyBwaW5zLCByZWdhcmRsZXNzIG9mIHRoZSBkZWxpdmVyeSBt
b2RlLiBBTUQgSU9NTVUKaW1wbGVtZW50YXRpb24gZG9lc24ndCBzdXBwb3J0IHJlbWFwcGluZyBl
bnRyaWVzIGZvciBJTy1BUElDIHBpbnMgd2l0aApkZWxpdmVyeSBtb2RlIHNldCB0byBTTUksIE1O
SSwgSU5JVCBvciBFeHRJTlQsIGluc3RlYWQgdGhvc2UgZW50cmllcwphcmUgbm90IHRyYW5zbGF0
ZWQgcHJvdmlkZWQgdGhlIHJpZ2h0IGJpdHMgYXJlIHNldCBpbiB0aGUgZGV2aWNlIHRhYmxlCmVu
dHJ5LgoKVGhpcyBjaGFuZ2UgY2hlY2tzIHdoZXRoZXIgdGhlIGRldmljZSB0YWJsZSBlbnRyeSBo
YXMgdGhlIGNvcnJlY3QgYml0cwpzZXQgaW4gb3JkZXIgdG8gZGVsaXZlcnkgdGhlIHJlcXVlc3Rl
ZCBpbnRlcnJ1cHQgb3IgYSB3YXJuaW5nIG1lc3NhZ2UKaXMgcHJpbnRlZC4gSXQgYWxzbyB0cmFu
c2xhdGVzIHRoZSAzMmJpdCBkZXN0aW5hdGlvbiBmaWVsZCBpbnRvIGEKcGh5c2ljYWwgb3IgbG9n
aWNhbCBJTy1BUElDIGVudHJ5IGZvcm1hdC4gTm90ZSB0aGF0IGlmIHRoZSAzMmJpdApkZXN0aW5h
dGlvbiBjYW5ub3QgZml0IGludG8gdGhlIGxlZ2FjeSBmb3JtYXQgYSBtZXNzYWdlIGlzIHByaW50
ZWQgYW5kCnRoZSBlbnRyeSBpcyBtYXNrZWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCk15IEFNRCBoYXJkd2FyZSBkb2Vzbid0IGhh
dmUgYW55IG9mIHN1Y2ggZW50cmllcywgaGVuY2UgSSd2ZSBvbmx5IGJlZW4KYWJsZSB0byBjb21w
aWxlIHRlc3QgdGhpcyBjaGFuZ2UgYW5kIGFzc2VydCBpdCBkb2Vzbid0IGFmZmVjdCB0aGUKZnVu
Y3Rpb25hbGl0eSBvZiBvdGhlciBpbnRlcnJ1cHQgZGVsaXZlcnkgbW9kZXMuCi0tLQogeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYyB8IDgxICsrKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwppbmRleCBmYjcxMDczYzg0Li4wMmRkMzczN2M3IDEw
MDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCisrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMKQEAgLTQzOSw2ICs0Mzks
ODAgQEAgaW50IF9faW5pdCBhbWRfaW9tbXVfc2V0dXBfaW9hcGljX3JlbWFwcGluZyh2b2lkKQog
ICAgIHJldHVybiAwOwogfQogCit2b2lkIHNldHVwX2ZvcmNlZF9pb2FwaWNfcnRlKHVuc2lnbmVk
IGludCBhcGljLCB1bnNpZ25lZCBpbnQgcGluLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IElPX0FQSUNfcm91dGVfZW50cnkgKnJ0ZSkKK3sKKyAgICB1bnNpZ25lZCBpbnQgaWR4
ID0gaW9hcGljX2lkX3RvX2luZGV4KElPX0FQSUNfSUQoYXBpYykpOworICAgIHN0cnVjdCBhbWRf
aW9tbXVfZHRlICp0YWJsZSA9IGlvbW11LT5kZXZfdGFibGUuYnVmZmVyOworICAgIHVuc2lnbmVk
IGludCByZXFfaWQsIGRlc3QsIG9mZnNldDsKKyAgICB1bmlvbiBpcnRlX3B0ciBlbnRyeTsKKwor
ICAgIEFTU0VSVCh4MmFwaWNfZW5hYmxlZCk7CisKKyAgICBpZiAoIGlkeCA9PSBNQVhfSU9fQVBJ
Q1MgKQorICAgIHsKKyAgICAgICAgcnRlLT5tYXNrID0gdHJ1ZTsKKyAgICAgICAgcmV0dXJuOwor
ICAgIH0KKworICAgIHJlcV9pZCA9IGdldF9pbnRyZW1hcF9yZXF1ZXN0b3JfaWQoaW9hcGljX3Ni
ZGZbaWR4XS5zZWcsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpb2Fw
aWNfc2JkZltpZHhdLmJkZik7CisKKyAgICBzd2l0Y2ggKCBydGUtPmRlbGl2ZXJ5X21vZGUgKQor
ICAgIHsKKyAgICBjYXNlIGRlc3RfU01JOgorICAgICAgICBicmVhazsKKworI2RlZmluZSBERUxf
Q0hFQ0sodHlwZSwgZHRlX2ZpZWxkKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAorICAgIGNhc2UgZGVzdF8gIyMgdHlwZTogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICBpZiAoICF0YWJsZVtyZXFfaWRdLmR0ZV9m
aWVsZCApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgcHJp
bnRrKFhFTkxPR19XQVJOSU5HICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAorICAgICAgICAgICAgICAgICAgIFNUUih0eXBlKSAiIG9uIElPLUFQSUMgJXUgcGluICV1IHdp
bGwgYmUgYWJvcnRlZFxuIiwgXAorICAgICAgICAgICAgICAgICAgIGFwaWMsIHBpbik7ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICBicmVhazsKKwor
ICAgIERFTF9DSEVDSyhOTUksIG5taV9wYXNzKTsKKyAgICBERUxfQ0hFQ0soSU5JVCwgaW5pdF9w
YXNzKTsKKyAgICBERUxfQ0hFQ0soRXh0SU5ULCBleHRfaW50X3Bhc3MpOworI3VuZGVmIERFTF9D
SEVDSworCisgICAgZGVmYXVsdDoKKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CisgICAg
ICAgIHJldHVybjsKKyAgICB9CisKKyAgICBvZmZzZXQgPSBpb2FwaWNfc2JkZltpZHhdLnBpbl8y
X2lkeFtwaW5dOworICAgIGlmICggb2Zmc2V0ID49IElOVFJFTUFQX01BWF9FTlRSSUVTICkKKyAg
ICB7CisgICAgICAgIHJ0ZS0+bWFzayA9IHRydWU7CisgICAgICAgIHJldHVybjsKKyAgICB9CisK
KyAgICBlbnRyeSA9IGdldF9pbnRyZW1hcF9lbnRyeShpb21tdSwgcmVxX2lkLCBvZmZzZXQpOwor
ICAgIGRlc3QgPSBnZXRfZnVsbF9kZXN0KGVudHJ5LnB0cjEyOCk7CisKKyNkZWZpbmUgU0VUX0RF
U1QobmFtZSwgZGVzdF9tYXNrKSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCisgICAgaWYgKCBkZXN0ICYgfihkZXN0X21hc2spICkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgIHsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgICAgICAgICAiSU8tQVBJQyAldSBw
aW4gJXUgIiBTVFIobmFtZSkgIiBkZXN0aW5hdGlvbiAoJXgpID4gJXhcbiIsICAgICAgXAorICAg
ICAgICAgICAgICAgYXBpYywgcGluLCBkZXN0LCBkZXN0X21hc2spOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgcnRlLT5tYXNrID0gdHJ1ZTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgIHJl
dHVybjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAorICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICBydGUtPmRlc3QubmFt
ZS5uYW1lICMjIF9kZXN0ID0gZGVzdDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCit9CisKKyAgICBpZiAoIHJ0ZS0+ZGVzdF9tb2RlICkKKyAgICAgICAgU0VUX0RFU1Qo
cGh5c2ljYWwsIDB4ZikKKyAgICBlbHNlCisgICAgICAgIFNFVF9ERVNUKGxvZ2ljYWwsIDB4ZmYp
CisjdW5kZWYgU0VUX0RFU1QKKworICAgIHJldHVybjsKK30KKwogdm9pZCBhbWRfaW9tbXVfaW9h
cGljX3VwZGF0ZV9pcmUoCiAgICAgdW5zaWduZWQgaW50IGFwaWMsIHVuc2lnbmVkIGludCByZWcs
IHVuc2lnbmVkIGludCB2YWx1ZSkKIHsKQEAgLTQ4Miw2ICs1NTYsMTMgQEAgdm9pZCBhbWRfaW9t
bXVfaW9hcGljX3VwZGF0ZV9pcmUoCiAgICAgICAgICooKHUzMiAqKSZuZXdfcnRlKSA9IHZhbHVl
OwogICAgICAgICAvKiByZWFkIHVwcGVyIDMyIGJpdHMgZnJvbSBpby1hcGljIHJ0ZSAqLwogICAg
ICAgICAqKCgodTMyICopJm5ld19ydGUpICsgMSkgPSBfX2lvX2FwaWNfcmVhZChhcGljLCByZWcg
KyAxKTsKKworICAgICAgICBpZiAoIG5ld19ydGUuZGVsaXZlcnlfbW9kZSA+IDEgJiYgeDJhcGlj
X2VuYWJsZWQgKQorICAgICAgICB7CisgICAgICAgICAgICBzZXR1cF9mb3JjZWRfaW9hcGljX3J0
ZShhcGljLCBwaW4sIGlvbW11LCAmbmV3X3J0ZSk7CisgICAgICAgICAgICBfX2lvYXBpY193cml0
ZV9lbnRyeShhcGljLCBwaW4sIHRydWUsIG5ld19ydGUpOworICAgICAgICAgICAgcmV0dXJuOwor
ICAgICAgICB9CiAgICAgfQogICAgIGVsc2UKICAgICB7Ci0tIAoyLjIzLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
