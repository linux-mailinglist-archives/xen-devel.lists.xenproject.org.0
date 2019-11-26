Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E8110A15D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:43:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcyW-0000fN-IT; Tue, 26 Nov 2019 15:42:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uwxd=ZS=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iZcyU-0000fI-Qq
 for xen-devel@lists.xen.org; Tue, 26 Nov 2019 15:41:58 +0000
X-Inumbo-ID: 474b6f4e-1063-11ea-a3a3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 474b6f4e-1063-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574782917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5gVG/XC7XwavO+7DQ/jwtK4GwpnwKEEesx+THdH6So4=;
 b=RtnaTkDO/rPUFweTIVfFdDMmlW/0xBHXL7HsJW1Ydj9gmrhHBjCboBxh
 bOO+hVxhy74vHlpY24DSBAdDKYnXcWl0fSrJiyygZXJfqKcz4k8a8Z3h0
 lDWOzsN1Nb5j24sB/wbEimOhvYGWh1rm2LaC/5sS2tbDOTCLoUpgqkWPc 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: T7xE2BAdjAbkECBuHmmCY/LcuDVuZ5SDfl9k7cMiivEmC6MTTb6Gj1TLm/SycTCIrkb4LDU1t3
 SSypM5XG24PMZvq5qMEWX/PBlvJatgsSdnemTyX7nv6rih9BQHA95oaLRFX/i5joWgtOjfZ4eo
 42xgeAacmSeMpplgDdrDCiKfCwT3q0cvVWHpXAw+BFN3nplqcnCqxN6Z/HSLtCA2FP4Wc1M5ji
 1f6L/a2sDRSNh/JD/NuAvIcRbqt0KNjRCQsz3dzNzZjd+5RvpbbVZCI0yJc9vIZtbiNUMXc2xo
 fH8=
X-SBRS: 2.7
X-MesageID: 9403139
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9403139"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Tue, 26 Nov 2019 15:41:53 +0000
Message-ID: <20191126154153.12144-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 for 4.13] x86/microcode: refuse to load the
 same revision ucode
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Chao Gao <chao.gao@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IGlmIGEgdXNlciB0cmllcyB0byBsaXZlLWxvYWQgdGhlIHNhbWUgb3Igb2xkZXIg
dWNvZGUgcmV2aXNpb24KdGhhbiBDUFUgYWxyZWFkeSBoYXMsIGhlIHdpbGwgZ2V0IGEgc2luZ2xl
IG1lc3NhZ2UgaW4gWGVuIGxvZyBsaWtlOgoKICAgIChYRU4pIDEyOCBjb3JlcyBhcmUgdG8gdXBk
YXRlIHRoZWlyIG1pY3JvY29kZQoKTm8gYWN0dWFsIHVjb2RlIGxvYWRpbmcgd2lsbCBoYXBwZW4g
YW5kIHRoaXMgc2l0dWF0aW9uIGNhbiBiZSBxdWl0ZQpjb25mdXNpbmcuIEZpeCB0aGlzIGJ5IHN0
YXJ0aW5nIHVjb2RlIHVwZGF0ZSBvbmx5IHdoZW4gdGhlIHByb3ZpZGVkCnVjb2RlIHJldmlzaW9u
IGlzIGhpZ2hlciB0aGFuIHRoZSBjdXJyZW50bHkgY2FjaGVkIG9uZSAoaWYgYW55KS4KVGhpcyBp
cyBiYXNlZCBvbiB0aGUgcHJvcGVydHkgdGhhdCBpZiBtaWNyb2NvZGVfY2FjaGUgZXhpc3RzLCBh
bGwgQ1BVcwppbiB0aGUgc3lzdGVtIHNob3VsZCBoYXZlIGF0IGxlYXN0IHRoYXQgdWNvZGUgcmV2
aXNpb24uCgpBZGRpdGlvbmFsbHksIHByaW50IGEgdXNlciBmcmllbmRseSBtZXNzYWdlIGlmIG5v
IG1hdGNoaW5nIG9yIG5ld2VyCnVjb2RlIGNhbiBiZSBmb3VuZCBpbiB0aGUgcHJvdmlkZWQgYmxv
Yi4gVGhpcyBhbHNvIHJlcXVpcmVzIGlnbm9yaW5nCi1FTk9EQVRBIGluIEFNRC1zaWRlIGNvZGUs
IG90aGVyd2lzZSB0aGUgbWVzc2FnZSBnaXZlbiB0byB0aGUgdXNlciBpczoKCiAgICAoWEVOKSBQ
YXJzaW5nIG1pY3JvY29kZSBibG9iIGVycm9yIC02MQoKV2hpY2ggYWN0dWFsbHkgbWVhbnMgdGhh
dCBhIHVjb2RlIGJsb2Igd2FzIHBhcnNlZCBmaW5lLCBidXQgbm8gbWF0Y2hpbmcKdWNvZGUgd2Fz
IGZvdW5kLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRy
aXguY29tPgotLS0KdjIgLS0+IHYzOgotIG1vdmUgdWNvZGUgY29tcGFyaXNvbiB0byBnZW5lcmlj
IGNvZGUKLSBpZ25vcmUgLUVOT0RBVEEgaW4gYSBkaWZmZXJlbnQgY29kZSBzZWN0aW9uCgp2MSAt
LT4gdjI6Ci0gY29tcGFyZSBwcm92aWRlZCB1Y29kZSB3aXRoIHRoZSBjdXJyZW50bHkgY2FjaGVk
IG9uZQoKQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ0M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KQ0M6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CkNDOiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21pY3JvY29k
ZS5jICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGVf
YW1kLmMgfCAgNyArKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMgYi94ZW4vYXJjaC94ODYvbWljcm9j
b2RlLmMKaW5kZXggNjVkMWY0MWU3Yy4uNDRlZmMyZDliMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L21pY3JvY29kZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwpAQCAtNjQwLDEw
ICs2NDAsMjkgQEAgaW50IG1pY3JvY29kZV91cGRhdGUoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShj
b25zdF92b2lkKSBidWYsIHVuc2lnbmVkIGxvbmcgbGVuKQogCiAgICAgaWYgKCAhcGF0Y2ggKQog
ICAgIHsKKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJtaWNyb2NvZGU6IGNvdWxkbid0
IGZpbmQgYW55IG1hdGNoaW5nIHVjb2RlIGluICIKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJ0aGUgcHJvdmlkZWQgYmxvYiFcbiIpOwogICAgICAgICByZXQgPSAtRU5PRU5UOwogICAg
ICAgICBnb3RvIHB1dDsKICAgICB9CiAKKyAgICAvKgorICAgICAqIElmIG1pY3JvY29kZV9jYWNo
ZSBleGlzdHMsIGFsbCBDUFVzIGluIHRoZSBzeXN0ZW0gc2hvdWxkIGhhdmUgYXQgbGVhc3QKKyAg
ICAgKiB0aGF0IHVjb2RlIHJldmlzaW9uLgorICAgICAqLworICAgIHNwaW5fbG9jaygmbWljcm9j
b2RlX211dGV4KTsKKyAgICBpZiAoIG1pY3JvY29kZV9jYWNoZSAmJgorICAgICAgICAgbWljcm9j
b2RlX29wcy0+Y29tcGFyZV9wYXRjaChwYXRjaCwgbWljcm9jb2RlX2NhY2hlKSAhPSBORVdfVUNP
REUgKQorICAgIHsKKyAgICAgICAgc3Bpbl91bmxvY2soJm1pY3JvY29kZV9tdXRleCk7CisgICAg
ICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAibWljcm9jb2RlOiBjb3VsZG4ndCBmaW5kIGFueSBu
ZXdlciByZXZpc2lvbiAiCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiaW4gdGhlIHBy
b3ZpZGVkIGJsb2IhXG4iKTsKKyAgICAgICAgcmV0ID0gLUVOT0VOVDsKKworICAgICAgICBnb3Rv
IHB1dDsKKyAgICB9CisgICAgc3Bpbl91bmxvY2soJm1pY3JvY29kZV9tdXRleCk7CisKICAgICBp
ZiAoIG1pY3JvY29kZV9vcHMtPnN0YXJ0X3VwZGF0ZSApCiAgICAgewogICAgICAgICByZXQgPSBt
aWNyb2NvZGVfb3BzLT5zdGFydF91cGRhdGUoKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9t
aWNyb2NvZGVfYW1kLmMgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jCmluZGV4IDFlNTJm
N2Y0OWEuLjAwNzUwZjdiYmIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1k
LmMKKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYwpAQCAtNTAyLDYgKzUwMiwxMyBA
QCBzdGF0aWMgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqY3B1X3JlcXVlc3RfbWljcm9jb2RlKGNv
bnN0IHZvaWQgKmJ1ZiwKIAogICAgIGlmICggZXJyb3IgKQogICAgIHsKKyAgICAgICAgLyoKKyAg
ICAgICAgICogLUVOT0RBVEEgaGVyZSBtZWFucyB0aGF0IHRoZSBibG9iIHdhcyBwYXJzZWQgZmlu
ZSBidXQgbm8gbWF0Y2hpbmcKKyAgICAgICAgICogdWNvZGUgd2FzIGZvdW5kLiBEb24ndCByZXR1
cm4gaXQgdG8gdGhlIGNhbGxlci4KKyAgICAgICAgICovCisgICAgICAgIGlmICggZXJyb3IgPT0g
LUVOT0RBVEEgKQorICAgICAgICAgICAgZXJyb3IgPSAwOworCiAgICAgICAgIHhmcmVlKG1jX2Ft
ZC0+ZXF1aXZfY3B1X3RhYmxlKTsKICAgICAgICAgeGZyZWUobWNfYW1kKTsKICAgICAgICAgZ290
byBvdXQ7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
