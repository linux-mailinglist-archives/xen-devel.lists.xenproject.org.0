Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6780715BDB2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 12:35:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2CkH-0006Yg-C5; Thu, 13 Feb 2020 11:33:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XmNm=4B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j2CkF-0006YF-KE
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 11:33:23 +0000
X-Inumbo-ID: a1b795a0-4e54-11ea-bc8e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1b795a0-4e54-11ea-bc8e-bc764e2007e4;
 Thu, 13 Feb 2020 11:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581593599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cl2Det7wNJ45tqMxqWuUyw67At2+V5OQKY6y0cC9lTM=;
 b=gdy+lTECWT8IHXiaQXaEp1SEmdMz2LV1ia28sMCIQf/OUzT8IdPV+K0M
 jcK4EFXkORhPkKVOXGuMSDvAZoGk9RGBUpvPlYodiunwab/Nc4BeKaO0I
 GoWQZPe1rqhNd8RhOWEBfV4Ae6oY8jgosBdNiVVlI162WCXHUmr9wR7nf s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YRRRyRAXXPkQumE6KIu/yRwer9wZdiHD0Za0mRUCyann5GlEdJULTAzwB4rN/9TVN5DpL5CJYK
 nzLuTnXrZY0XGYSixRjfvDTxXhSIu9eqNDDrWyHCbMhqhwXGz0lkEA17b1dmxSNFDyten9LI5o
 bQ3AX9Y/fsjD/dw7ipgX0aM+dhbuW0l2uBSe6O3UvebnkEN2DCX+PRUq4jzA1hJmgZ4TrbyZne
 qEZ4p+Ysq8vge1F9Sa1bnSLKr8/mSOQFnxYoGUXLD6GTVMjkL20XJNlu+HjrJUoqJL0P2G75zM
 22c=
X-SBRS: 2.7
X-MesageID: 12566480
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,436,1574139600"; d="scan'208";a="12566480"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 13 Feb 2020 12:32:36 +0100
Message-ID: <20200213113237.58795-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213113237.58795-1-roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] smp: convert the cpu maps lock into a rw
 lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TW9zdCB1c2VycyBvZiB0aGUgY3B1IG1hcHMganVzdCBjYXJlIGFib3V0IHRoZSBtYXBzIG5vdCBj
aGFuZ2luZyB3aGlsZQp0aGUgbG9jayBpcyBiZWluZyBoZWxkLCBidXQgZG9uJ3QgYWN0dWFsbHkg
bW9kaWZ5IHRoZSBtYXBzLgoKQ29udmVydCB0aGUgbG9jayBpbnRvIGEgcncgbG9jaywgYW5kIHRh
a2UgdGhlIGxvY2sgaW4gcmVhZCBtb2RlIGluCmdldF9jcHVfbWFwcyBhbmQgaW4gd3JpdGUgbW9k
ZSBpbiBjcHVfaG90cGx1Z19iZWdpbi4gVGhpcyB3aWxsIGxvd2VyCnRoZSBjb250ZW50aW9uIGFy
b3VuZCB0aGUgbG9jaywgc2luY2UgcGx1ZyBhbmQgdW5wbHVnIG9wZXJhdGlvbnMgdGhhdAp0YWtl
IHRoZSBsb2NrIGluIHdyaXRlIG1vZGUgYXJlIG5vdCB0aGF0IGNvbW1vbi4KCk5vdGUgdGhhdCB0
aGUgcmVhZCBsb2NrIGNhbiBiZSB0YWtlbiByZWN1cnNpdmVseSAoYXMgaXQncyBhIHNoYXJlZAps
b2NrKSwgYW5kIGhlbmNlIHdpbGwga2VlcCB0aGUgc2FtZSBiZWhhdmlvciBhcyB0aGUgcHJldmlv
dXNseSB1c2VkCnJlY3Vyc2l2ZSBsb2NrLiBBcyBmb3IgdGhlIHdyaXRlIGxvY2ssIGl0J3Mgb25s
eSB1c2VkIGJ5IENQVQpwbHVnL3VucGx1ZyBvcGVyYXRpb25zLCBhbmQgdGhlIGxvY2sgaXMgbmV2
ZXIgdGFrZW4gcmVjdXJzaXZlbHkgaW4KdGhhdCBjYXNlLgoKV2hpbGUgdGhlcmUgYWxzbyBjaGFu
Z2UgZ2V0X2NwdV9tYXBzIHJldHVybiB0eXBlIHRvIGJvb2wuCgpSZXBvcnRlZC1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KU3VnZ2VzdGVkLWFsc28tYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2NvbW1vbi9jcHUuYyAgICAgIHwgMjIgKysrKysrKysr
KysrKysrKy0tLS0tLQogeGVuL2luY2x1ZGUveGVuL2NwdS5oIHwgMTMgKysrLS0tLS0tLS0tLQog
MiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL2NwdS5jIGIveGVuL2NvbW1vbi9jcHUuYwppbmRleCA2NmM4NTVj
NWQ5Li4wZDdhMTA4NzhjIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2NwdS5jCisrKyBiL3hlbi9j
b21tb24vY3B1LmMKQEAgLTM5LDI2ICszOSwzNiBAQCBjb25zdCB1bnNpZ25lZCBsb25nIGNwdV9i
aXRfYml0bWFwW0JJVFNfUEVSX0xPTkcrMV1bQklUU19UT19MT05HUyhOUl9DUFVTKV0gPSB7CiAj
ZW5kaWYKIH07CiAKLXN0YXRpYyBERUZJTkVfU1BJTkxPQ0soY3B1X2FkZF9yZW1vdmVfbG9jayk7
CitzdGF0aWMgREVGSU5FX1JXTE9DSyhjcHVfYWRkX3JlbW92ZV9sb2NrKTsKIAotYm9vbF90IGdl
dF9jcHVfbWFwcyh2b2lkKQorYm9vbCBnZXRfY3B1X21hcHModm9pZCkKIHsKLSAgICByZXR1cm4g
c3Bpbl90cnlsb2NrX3JlY3Vyc2l2ZSgmY3B1X2FkZF9yZW1vdmVfbG9jayk7CisgICAgcmV0dXJu
IHJlYWRfdHJ5bG9jaygmY3B1X2FkZF9yZW1vdmVfbG9jayk7CiB9CiAKIHZvaWQgcHV0X2NwdV9t
YXBzKHZvaWQpCiB7Ci0gICAgc3Bpbl91bmxvY2tfcmVjdXJzaXZlKCZjcHVfYWRkX3JlbW92ZV9s
b2NrKTsKKyAgICByZWFkX3VubG9jaygmY3B1X2FkZF9yZW1vdmVfbG9jayk7Cit9CisKK2Jvb2wg
Y3B1X2hvdHBsdWdfYmVnaW4odm9pZCkKK3sKKyAgICByZXR1cm4gd3JpdGVfdHJ5bG9jaygmY3B1
X2FkZF9yZW1vdmVfbG9jayk7Cit9CisKK3ZvaWQgY3B1X2hvdHBsdWdfZG9uZSh2b2lkKQorewor
ICAgIHdyaXRlX3VubG9jaygmY3B1X2FkZF9yZW1vdmVfbG9jayk7CiB9CiAKIHN0YXRpYyBOT1RJ
RklFUl9IRUFEKGNwdV9jaGFpbik7CiAKIHZvaWQgX19pbml0IHJlZ2lzdGVyX2NwdV9ub3RpZmll
cihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKQogewotICAgIGlmICggIXNwaW5fdHJ5bG9jaygm
Y3B1X2FkZF9yZW1vdmVfbG9jaykgKQorICAgIGlmICggIXdyaXRlX3RyeWxvY2soJmNwdV9hZGRf
cmVtb3ZlX2xvY2spICkKICAgICAgICAgQlVHKCk7IC8qIFNob3VsZCBuZXZlciBmYWlsIGFzIHdl
IGFyZSBjYWxsZWQgb25seSBkdXJpbmcgYm9vdC4gKi8KICAgICBub3RpZmllcl9jaGFpbl9yZWdp
c3RlcigmY3B1X2NoYWluLCBuYik7Ci0gICAgc3Bpbl91bmxvY2soJmNwdV9hZGRfcmVtb3ZlX2xv
Y2spOworICAgIHdyaXRlX3VubG9jaygmY3B1X2FkZF9yZW1vdmVfbG9jayk7CiB9CiAKIHN0YXRp
YyBpbnQgY3B1X25vdGlmaWVyX2NhbGxfY2hhaW4odW5zaWduZWQgaW50IGNwdSwgdW5zaWduZWQg
bG9uZyBhY3Rpb24sCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vY3B1LmggYi94ZW4vaW5j
bHVkZS94ZW4vY3B1LmgKaW5kZXggMmM4N2RiMjZmNi4uZTQ5MTcyZjY0YyAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUveGVuL2NwdS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9jcHUuaApAQCAtNiwx
OSArNiwxMiBAQAogI2luY2x1ZGUgPHhlbi9ub3RpZmllci5oPgogCiAvKiBTYWZlbHkgYWNjZXNz
IGNwdV9vbmxpbmVfbWFwLCBjcHVfcHJlc2VudF9tYXAsIGV0Yy4gKi8KLWJvb2xfdCBnZXRfY3B1
X21hcHModm9pZCk7Citib29sIGdldF9jcHVfbWFwcyh2b2lkKTsKIHZvaWQgcHV0X2NwdV9tYXBz
KHZvaWQpOwogCiAvKiBTYWZlbHkgcGVyZm9ybSBDUFUgaG90cGx1ZyBhbmQgdXBkYXRlIGNwdV9v
bmxpbmVfbWFwLCBldGMuICovCi1zdGF0aWMgaW5saW5lIGJvb2wgY3B1X2hvdHBsdWdfYmVnaW4o
dm9pZCkKLXsKLSAgICByZXR1cm4gZ2V0X2NwdV9tYXBzKCk7Ci19Ci0KLXN0YXRpYyBpbmxpbmUg
dm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQpCi17Ci0gICAgcHV0X2NwdV9tYXBzKCk7Ci19Citi
b29sIGNwdV9ob3RwbHVnX2JlZ2luKHZvaWQpOwordm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQp
OwogCiAvKiBSZWNlaXZlIG5vdGlmaWNhdGlvbiBvZiBDUFUgaG90cGx1ZyBldmVudHMuICovCiB2
b2lkIHJlZ2lzdGVyX2NwdV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKTsKLS0g
CjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
