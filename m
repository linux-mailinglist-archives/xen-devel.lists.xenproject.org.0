Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394BC18F291
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 11:20:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGK9l-0007jo-87; Mon, 23 Mar 2020 10:18:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0LFc=5I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jGK9k-0007jO-Iq
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 10:18:04 +0000
X-Inumbo-ID: 917515f1-6cef-11ea-829d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 917515f1-6cef-11ea-829d-12813bfff9fa;
 Mon, 23 Mar 2020 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584958679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1FBUYOW6q9VnSkHwIeoLxYMh8A8QDKI33buuWHabfZM=;
 b=IJiJap0Ve1y56T4GJGagotI2aN+VZ2zzEW6fu3ebhh+3XmRO31ZT631A
 TdyHN0dbzq/U2kL96/8MzzSXpWl3sU+29vAbQjBAt0SvzQsXwh7EI2Bz+
 OCORcHwdbb4WYo3PM5nArSCraAaNY9/rB8RKF+kP+0c5Q2zcDwR2/Mg0p M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cUSIDkbqAAfaLr/3qkFqxABdgttBjhonvt4Q/eur4ZmaJ17lCgvRYRZl8YaNsGOQYTkGkSkqJY
 IM/+IBS3GDo8inCtGj2p1D5YRAjYIgM/lveWBZ2loM5ldjEr6r6V02mFdbMgCmGeO4DAgg98ok
 L8rpaIiYnveh8C0aWJDPU8MK/uGAF0bQZiR39Pe7pUZbt1KJ2Y1Gu50zU7hzcn/EBVZejOugVy
 BqihKEIoAdsY5UBUaVgqAc5s8LRsdNzA72QE+q0tXHz9NzY3gxbRWUqe/A0lsOiZ/a7nIH/w+c
 vUM=
X-SBRS: 2.7
X-MesageID: 14788291
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="14788291"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 23 Mar 2020 10:17:20 +0000
Message-ID: <20200323101724.15655-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200323101724.15655-1-andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/7] x86/ucode/intel: Remove gratuitous memory
 allocations from cpu_request_microcode()
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y3B1X3JlcXVlc3RfbWljcm9jb2RlKCkgbmVlZHMgdG8gc2NhbiBpdHMgY29udGFpbmVyIGFuZCBk
dXBsaWNhdGUgb25lIGJsb2IsCmJ1dCB0aGUgZ2V0X25leHRfdWNvZGVfZnJvbV9idWZmZXIoKSBo
ZWxwZXIgZHVwbGljYXRlcyBldmVyeSBibG9iIGluIHR1cm4uCkZ1cnRoZXJtb3JlLCB0aGUgbGVu
Z3RoIGNoZWNraW5nIGlzIG9ubHkgc2FmZSBmcm9tIG92ZXJmbG93IGluIDY0Yml0IGJ1aWxkcy4K
CkRlbGV0ZSBnZXRfbmV4dF91Y29kZV9mcm9tX2J1ZmZlcigpIGFuZCBhbHRlciB0aGUgcHVycG9z
ZSBvZiB0aGUgc2F2ZWQKdmFyaWFibGUgdG8gc2ltcGx5IHBvaW50IHNvbWV3aGVyZSBpbiBidWYg
dW50aWwgd2UncmUgcmVhZHkgdG8gcmV0dXJuLgoKVGhpcyBpcyBvbmx5IGEgbW9kZXN0IHJlZHVj
dGlvbiBpbiBhYnNvbHV0ZSBjb2RlIHNpemUgKC0xNDQpLCBidXQgYXZvaWRzCm1ha2luZyBtZW1v
cnkgYWxsb2NhdGlvbnMgZm9yIGV2ZXJ5IGJsb2IgaW4gdGhlIGNvbnRhaW5lci4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzog
SmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4K
Q0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNo
L3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMgfCA2OSArKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDQzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMg
Yi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jCmluZGV4IGYwYmVlZmUxYmIuLjBj
Y2VhYzYyNTUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMK
KysrIGIveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvaW50ZWwuYwpAQCAtMzIxLDc1ICszMjEs
NTggQEAgc3RhdGljIGludCBhcHBseV9taWNyb2NvZGUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9w
YXRjaCAqcGF0Y2gpCiAgICAgcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBsb25nIGdldF9uZXh0X3Vj
b2RlX2Zyb21fYnVmZmVyKHN0cnVjdCBtaWNyb2NvZGVfaW50ZWwgKiptYywKLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwgdW5zaWduZWQg
bG9uZyBzaXplLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBvZmZzZXQpCi17Ci0gICAgc3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKm1j
X2hlYWRlcjsKLSAgICB1bnNpZ25lZCBsb25nIHRvdGFsX3NpemU7Ci0KLSAgICAvKiBObyBtb3Jl
IGRhdGEgKi8KLSAgICBpZiAoIG9mZnNldCA+PSBzaXplICkKLSAgICAgICAgcmV0dXJuIDA7Ci0g
ICAgbWNfaGVhZGVyID0gKHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICopKGJ1ZiArIG9m
ZnNldCk7Ci0gICAgdG90YWxfc2l6ZSA9IGdldF90b3RhbHNpemUobWNfaGVhZGVyKTsKLQotICAg
IGlmICggKG9mZnNldCArIHRvdGFsX3NpemUpID4gc2l6ZSApCi0gICAgewotICAgICAgICBwcmlu
dGsoS0VSTl9FUlIgIm1pY3JvY29kZTogZXJyb3IhIEJhZCBkYXRhIGluIG1pY3JvY29kZSBkYXRh
IGZpbGVcbiIpOwotICAgICAgICByZXR1cm4gLUVJTlZBTDsKLSAgICB9Ci0KLSAgICAqbWMgPSB4
bWVtZHVwX2J5dGVzKG1jX2hlYWRlciwgdG90YWxfc2l6ZSk7Ci0gICAgaWYgKCAqbWMgPT0gTlVM
TCApCi0gICAgICAgIHJldHVybiAtRU5PTUVNOwotCi0gICAgcmV0dXJuIG9mZnNldCArIHRvdGFs
X3NpemU7Ci19Ci0KIHN0YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpjcHVfcmVxdWVzdF9t
aWNyb2NvZGUoY29uc3Qgdm9pZCAqYnVmLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplX3Qgc2l6ZSkKIHsKLSAgICBsb25nIG9mZnNldCA9
IDA7CiAgICAgaW50IGVycm9yID0gMDsKLSAgICBzdHJ1Y3QgbWljcm9jb2RlX2ludGVsICptYywg
KnNhdmVkID0gTlVMTDsKKyAgICBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2ludGVsICpzYXZlZCA9
IE5VTEw7CiAgICAgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2ggPSBOVUxMOwogCi0gICAg
d2hpbGUgKCAob2Zmc2V0ID0gZ2V0X25leHRfdWNvZGVfZnJvbV9idWZmZXIoJm1jLCBidWYsIHNp
emUsIG9mZnNldCkpID4gMCApCisgICAgd2hpbGUgKCBzaXplICkKICAgICB7Ci0gICAgICAgIGVy
cm9yID0gbWljcm9jb2RlX3Nhbml0eV9jaGVjayhtYyk7Ci0gICAgICAgIGlmICggZXJyb3IgKQor
ICAgICAgICBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2ludGVsICptYzsKKyAgICAgICAgdW5zaWdu
ZWQgaW50IGJsb2Jfc2l6ZTsKKworICAgICAgICBpZiAoIHNpemUgPCBNQ19IRUFERVJfU0laRSB8
fCAgICAgICAvKiBJbnN1ZmZpY2llbnQgc3BhY2UgZm9yIGhlYWRlcj8gKi8KKyAgICAgICAgICAg
ICAobWMgPSBidWYpLT5oZHIuaGRydmVyICE9IDEgfHwgLyogVW5yZWNvZ25pc2VkIGhlYWRlciB2
ZXJzaW9uPyAgICovCisgICAgICAgICAgICAgbWMtPmhkci5sZHJ2ZXIgIT0gMSB8fCAgICAgICAg
IC8qIFVucmVjb2duaXNlZCBsb2FkZXIgdmVyc2lvbj8gICAqLworICAgICAgICAgICAgIHNpemUg
PCAoYmxvYl9zaXplID0gICAgICAgICAgICAvKiBJbnN1ZmZpY2llbnQgc3BhY2UgZm9yIHBhdGNo
PyAgKi8KKyAgICAgICAgICAgICAgICAgICAgIGdldF90b3RhbHNpemUoJm1jLT5oZHIpKSApCiAg
ICAgICAgIHsKLSAgICAgICAgICAgIHhmcmVlKG1jKTsKKyAgICAgICAgICAgIGVycm9yID0gLUVJ
TlZBTDsKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICB9CiAKKyAgICAgICAgZXJyb3IgPSBt
aWNyb2NvZGVfc2FuaXR5X2NoZWNrKG1jKTsKKyAgICAgICAgaWYgKCBlcnJvciApCisgICAgICAg
ICAgICBicmVhazsKKwogICAgICAgICAvKgogICAgICAgICAgKiBJZiB0aGUgbmV3IHVwZGF0ZSBj
b3ZlcnMgY3VycmVudCBDUFUsIGNvbXBhcmUgdXBkYXRlcyBhbmQgc3RvcmUgdGhlCiAgICAgICAg
ICAqIG9uZSB3aXRoIGhpZ2hlciByZXZpc2lvbi4KICAgICAgICAgICovCiAgICAgICAgIGlmICgg
KG1pY3JvY29kZV91cGRhdGVfbWF0Y2gobWMpICE9IE1JU19VQ09ERSkgJiYKICAgICAgICAgICAg
ICAoIXNhdmVkIHx8IChtYy0+aGRyLnJldiA+IHNhdmVkLT5oZHIucmV2KSkgKQotICAgICAgICB7
Ci0gICAgICAgICAgICB4ZnJlZShzYXZlZCk7CiAgICAgICAgICAgICBzYXZlZCA9IG1jOwotICAg
ICAgICB9Ci0gICAgICAgIGVsc2UKLSAgICAgICAgICAgIHhmcmVlKG1jKTsKKworICAgICAgICBi
dWYgICs9IGJsb2Jfc2l6ZTsKKyAgICAgICAgc2l6ZSAtPSBibG9iX3NpemU7CiAgICAgfQotICAg
IGlmICggb2Zmc2V0IDwgMCApCi0gICAgICAgIGVycm9yID0gb2Zmc2V0OwogCiAgICAgaWYgKCBz
YXZlZCApCiAgICAgewogICAgICAgICBwYXRjaCA9IHhtYWxsb2Moc3RydWN0IG1pY3JvY29kZV9w
YXRjaCk7CiAgICAgICAgIGlmICggcGF0Y2ggKQotICAgICAgICAgICAgcGF0Y2gtPm1jX2ludGVs
ID0gc2F2ZWQ7Ci0gICAgICAgIGVsc2UKICAgICAgICAgewotICAgICAgICAgICAgeGZyZWUoc2F2
ZWQpOwotICAgICAgICAgICAgZXJyb3IgPSAtRU5PTUVNOworICAgICAgICAgICAgcGF0Y2gtPm1j
X2ludGVsID0geG1lbWR1cF9ieXRlcyhzYXZlZCwgZ2V0X3RvdGFsc2l6ZSgmc2F2ZWQtPmhkcikp
OworICAgICAgICAgICAgaWYgKCAhcGF0Y2gtPm1jX2ludGVsICkKKyAgICAgICAgICAgIHsKKyAg
ICAgICAgICAgICAgICBYRlJFRShwYXRjaCk7CisgICAgICAgICAgICAgICAgZXJyb3IgPSAtRU5P
TUVNOworICAgICAgICAgICAgfQogICAgICAgICB9CisgICAgICAgIGVsc2UKKyAgICAgICAgICAg
IGVycm9yID0gLUVOT01FTTsKICAgICB9CiAKICAgICBpZiAoIGVycm9yICYmICFwYXRjaCApCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
