Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A991517F8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:36:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyubQ-0001L1-7t; Tue, 04 Feb 2020 09:34:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5+CW=3Y=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iyubP-0001Kc-7V
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:34:39 +0000
X-Inumbo-ID: 8c5e15ac-4731-11ea-8ef9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c5e15ac-4731-11ea-8ef9-12813bfff9fa;
 Tue, 04 Feb 2020 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580808873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=2g21h5VXnWTXEdDsr4vYTMSl4J4YBWAfT+fz1Duajyw=;
 b=heo5PjKWBw7a30NJkiddFHLEhCR9VftX3Dir3wXfHikxvnooI8OZRXZ6
 KH5qWgw27lQkcAARmOomQh+Anf4mFAckYXiCH9xJi8wmZ+sQV+wR0VWjv
 JuomuNWyJIWb6Wk592RZK1dxXS2LA1WthRkwECBNu89KcViOu7h6IKcIL c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iuOJ5ZnFPHC9BZKkcfeKt3lNFBZgeHWWGQNfLKHRzZEUrUBUd30yIulUNP19uOqYp8tYn6mx6u
 sbh7awwEupu/4aqSNHS/R1UXD+v2cpRK3OTLJsZlyEGWrIaRt46lHIKNPOWlySO1XDFXYAfCGe
 wVhYII8q87VUgxwRAGk4QOedOiGvxU8E74EFs4bWSIMBpMkgPZZEkeaze2M62AtK5ijL+eybaX
 GTrte6xxanJTopxtNjZqTJTNB925BTehNONIn7Roo2mlOA3CiagE/QsXl5ZFXPoC2mCoEFmAF1
 iQo=
X-SBRS: 2.7
X-MesageID: 12517738
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,401,1574139600"; d="scan'208";a="12517738"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 09:34:23 +0000
Message-ID: <20200204093424.10159-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200204093424.10159-1-ian.jackson@eu.citrix.com>
References: <20200204093424.10159-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/2] tools/xenstore: Re-introduce (fake)
 xs_restrict call to preserve ABI
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Stefan Bader <stefan.bader@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU3RlZmFuIEJhZGVyIDxzdGVmYW4uYmFkZXJAY2Fub25pY2FsLmNvbT4KCmxpYnhlbnN0
b3JlMy4wIGluIFhlbiA0LjggaGFkIHRoaXMgZnVuY3Rpb24uICBXZSBkb24ndCByZWFsbHkgd2Fu
dCB0bwpidW1wIHRoZSBBQkkgdmVyc2lvbiAoc29uYW1lKSBqdXN0IGZvciB0aGlzLCBzaW5jZSB3
ZSBkb24ndCB0aGluawp0aGVyZSBhcmUgYWN0dWFsIGNhbGxlcnMgYW55d2hlcmUuICBCdXQgdG9v
bHMgY29tcGxhaW4gYWJvdXQgdGhlCnN5bWJvbCBnb2luZyBhd2F5LgoKU28sIHByb3ZpZGUgYSBm
dW5jdGlvbiB4c19yZXN0cmljdCB3aGljaCBjb25mb3JtcyB0byB0aGUgb3JpZ2luYWwKc2VtYW50
aWNzLCBhbHRob3VnaCBpdCBhbHdheXMgZmFpbHMuCgpHYnAtUHE6IFRvcGljIHhlbnN0b3JlCkdi
cC1QcTogTmFtZSB0b29scy1mYWtlLXhzLXJlc3RyaWN0LnBhdGNoClNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpBY2tlZC1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCnYzOiBGaXhlZCBjb21taXQgYXV0aG9yCnYyOiBOZXcg
aW4gdGhpcyB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMKLS0tCiB0b29scy94ZW5zdG9yZS9pbmNsdWRl
L3hlbnN0b3JlLmggfCA1ICsrKysrCiB0b29scy94ZW5zdG9yZS94cy5jICAgICAgICAgICAgICAg
fCA2ICsrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvdG9vbHMveGVuc3RvcmUvaW5jbHVkZS94ZW5zdG9yZS5oIGIvdG9vbHMveGVuc3RvcmUvaW5j
bHVkZS94ZW5zdG9yZS5oCmluZGV4IDI1NGY1NTZhMGIuLjI1YjMxODgxYzggMTAwNjQ0Ci0tLSBh
L3Rvb2xzL3hlbnN0b3JlL2luY2x1ZGUveGVuc3RvcmUuaAorKysgYi90b29scy94ZW5zdG9yZS9p
bmNsdWRlL3hlbnN0b3JlLmgKQEAgLTEzNCw2ICsxMzQsMTEgQEAgYm9vbCB4c19ta2RpcihzdHJ1
Y3QgeHNfaGFuZGxlICpoLCB4c190cmFuc2FjdGlvbl90IHQsCiBib29sIHhzX3JtKHN0cnVjdCB4
c19oYW5kbGUgKmgsIHhzX3RyYW5zYWN0aW9uX3QgdCwKIAkgICBjb25zdCBjaGFyICpwYXRoKTsK
IAorLyogRmFrZSBmdW5jdGlvbiB3aGljaCB3aWxsIGFsd2F5cyByZXR1cm4gZmFsc2UgKHJlcXVp
cmVkIHRvIGxldAorICogbGlieGVuc3RvcmUgcmVtYWluIGF0IDMuMCB2ZXJzaW9uLgorICovCiti
b29sIHhzX3Jlc3RyaWN0KHN0cnVjdCB4c19oYW5kbGUgKmgsIHVuc2lnbmVkIGRvbWlkKTsKKwog
LyogR2V0IHBlcm1pc3Npb25zIG9mIG5vZGUgKGZpcnN0IGVsZW1lbnQgaXMgb3duZXIsIGZpcnN0
IHBlcm1zIGlzICJvdGhlciIpLgogICogUmV0dXJucyBtYWxsb2NlZCBhcnJheSwgb3IgTlVMTDog
Y2FsbCBmcmVlKCkgYWZ0ZXIgdXNlLgogICovCmRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94
cy5jIGIvdG9vbHMveGVuc3RvcmUveHMuYwppbmRleCBmODIzYWJlNzM3Li5hYTFkMjRiOGI5IDEw
MDY0NAotLS0gYS90b29scy94ZW5zdG9yZS94cy5jCisrKyBiL3Rvb2xzL3hlbnN0b3JlL3hzLmMK
QEAgLTc5Nyw2ICs3OTcsMTIgQEAgdW53aW5kOgogCXJldHVybiBmYWxzZTsKIH0KIAorLyogQWx3
YXlzIHJldHVybiBmYWxzZSBhIGZ1bmN0aW9uYWxpdHkgaGFzIGJlZW4gcmVtb3ZlZCBpbiBYZW4g
NC45ICovCitib29sIHhzX3Jlc3RyaWN0KHN0cnVjdCB4c19oYW5kbGUgKmgsIHVuc2lnbmVkIGRv
bWlkKQoreworCXJldHVybiBmYWxzZTsKK30KKwogLyogV2F0Y2ggYSBub2RlIGZvciBjaGFuZ2Vz
IChwb2xsIG9uIGZkIHRvIGRldGVjdCwgb3IgY2FsbCByZWFkX3dhdGNoKCkpLgogICogV2hlbiB0
aGUgbm9kZSAob3IgYW55IGNoaWxkKSBjaGFuZ2VzLCBmZCB3aWxsIGJlY29tZSByZWFkYWJsZS4K
ICAqIFRva2VuIGlzIHJldHVybmVkIHdoZW4gd2F0Y2ggaXMgcmVhZCwgdG8gYWxsb3cgbWF0Y2hp
bmcuCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
