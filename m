Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4093912B5E4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 17:35:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iksXd-0001Xj-48; Fri, 27 Dec 2019 16:32:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CFv7=2R=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iksXc-0001Xa-2P
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 16:32:44 +0000
X-Inumbo-ID: 7c819ee2-28c6-11ea-9c5f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c819ee2-28c6-11ea-9c5f-12813bfff9fa;
 Fri, 27 Dec 2019 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577464354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yB0bvCUV+fmVOFW7FGeLqFzKS17AeUTzidjyGeYkTts=;
 b=PYtPlCMRk67WMHVeXv2o2JlkklkVzNAquXjgLLhqPzLSwLf7unPZD6/0
 LmYmcJranx7IeDBjvwF6/PH5lRvPRlOr/5Hx64YsHOPwU3pg86kxw9b6n
 9V2dX03udP3fa6vgxF9MtC+8Dc0me8BgfM9yVwRPm8XxVVzVMqFLlZPbr w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4cV0c0JygSlWbcJY6IEKh+PZ3xf2hH7+1DhbJNv3f7IWVMoaHRayzduwfgp7GfIor58IUj5u4q
 m/gZsBZXjjB5E5g1i9SX4B7qPKgWpCZXwN1KW3m12o25WavziPh2Rw7QfyvEEaTc2u/F/X5hdw
 YGkW/IzrTwOKpCDrp4GUwD0fdd1Fimg4MXTApNDKXIJTYfHOKava8co7soP/9Y+ZD6I0EqB4kx
 P+Q7GMqv0OWYQDYRCU3G3s0hfw2ObThkYRUzdresSkMV9+LehDLjAa4QdmA2pgWkuPQq14OtGj
 rT8=
X-SBRS: 2.7
X-MesageID: 10626142
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10626142"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Dec 2019 16:32:23 +0000
Message-ID: <20191227163224.4113837-8-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227163224.4113837-1-george.dunlap@citrix.com>
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 8/9] RFC: golang/xenlight: Notify xenlight of
 SIGCHLD
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bGlieGwgZm9ya3MgZXh0ZXJuYWwgcHJvY2Vzc2VzIGFuZCB3YWl0cyBmb3IgdGhlbSB0byBjb21w
bGV0ZTsgaXQKdGhlcmVmb3JlIG5lZWRzIHRvIGJlIG5vdGlmaWVkIHdoZW4gY2hpbGRyZW4gZXhp
dC4KCkluIGFic2VuY2Ugb2YgaW5zdHJ1Y3Rpb25zIHRvIHRoZSBjb250cmFyeSwgbGlieGwgc2V0
cyB1cCBpdHMgb3duClNJR0NITEQgaGFuZGxlcnMuCgpHb2xhbmcgYWx3YXlzIHVubWFza3MgYW5k
IGhhbmRsZXMgU0lHQ0hMRCBpdHNlbGYuICBsaWJ4bCB0aGFua2Z1bGx5Cm5vdGljZXMgdGhpcyBh
bmQgdGhyb3dzIGFuIGFzc2VydCgpIHJhdGhlciB0aGFuIGNsb2JiZXJpbmcgU0lHQ0hMRApoYW5k
bGVycy4KClRlbGwgbGlieGwgdGhhdCB3ZSdsbCBiZSByZXNwb25zaWJsZSBmb3IgZ2V0dGluZyBT
SUdDSExEIG5vdGlmaWNhdGlvbnMKdG8gaXQuICBBcnJhbmdlIGZvciBhIGNoYW5uZWwgaW4gdGhl
IGNvbnRleHQgdG8gcmVjZWl2ZSBub3RpZmljYXRpb25zCm9uIFNJR0NITEQsIGFuZCBzZXQgdXAg
YSBnb3JvdXRpbmUgdGhhdCB3aWxsIHBhc3MgdGhlc2Ugb24gdG8gbGlieGwuCgpTaWduZWQtb2Zm
LWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpJIGhhdmUg
bm8gaWRlYSBpZiB0aGlzIGlzIGFjdHVhbGx5IHRoZSByaWdodCB3YXkgdG8gZ28gYWJvdXQgdGhp
czsgaW4KcGFydGljdWxhciwgbGlieGxfZXZlbnQuaCdzIGNvbW1lbnQgb24gdGhpcyBmdW5jdGlv
biByZWZlcnMgdG8gdGhlCmNvbW1lbnQgb24gYGxpYnhsX2NoaWxkcHJvY19yZWFwZWRgLCB3aGlj
aCBzYXlzOgoKICogTWF5IE5PVCBiZSBjYWxsZWQgZnJvbSB3aXRoaW4gYSBzaWduYWwgaGFuZGxl
ciB3aGljaCBtaWdodAogKiBpbnRlcnJ1cHQgYW55IGxpYnhsIG9wZXJhdGlvbi4gIFRoZSBhcHBs
aWNhdGlvbiB3aWxsIGFsbW9zdAogKiBjZXJ0YWlubHkgbmVlZCB0byB1c2UgdGhlIHNlbGYtcGlw
ZSB0cmljayAob3IgYSB3b3JraW5nIHBzZWxlY3Qgb3IKICogcHBvbGwpIHRvIGltcGxlbWVudCB0
aGlzLgoKSSBkb24ndCBoYXZlIGEgZ29vZCB3YXkgb2Yga25vd2luZyB3aGV0aGVyIHRoZQpnb3By
b2MtcmVjZWl2aW5nLWEtY2hhbm5lbCBzYXRpc2ZpZXMgdGhpcyByZXF1aXJlbWVudCBvciBub3Qu
ICBJdApzZWVtcyB0byB3b3JrLCBpbiB0aGUgc2Vuc2UgdGhhdCB0aGUgcHlncnViIHByb2Nlc3Mg
d29ya3MgZmluZS4gIEJ1dAppdCBnZXRzIHN0dWNrIGEgYml0IGZ1cnRoZXIgb24sIGxvb2tzIGxp
a2Ugd2FpdGluZyBmb3IgdGhlIGRpc2s7IGFuZCBhCmRpZmYgb2YgdGhlIG91dHB1dCBiZXR3ZWVu
IGB4bCBjcmVhdGVgIGFuZCB0aGUgZ29sYW5nIGNyZWF0ZSBzZWVtcyB0bwppbmRpY2F0ZSB0aGF0
IHhlbnN0b3JlIHdhdGNoZXMgYXJlbid0IGJlaW5nIGRlbGl2ZXJlZC4gIE5vdCBzdXJlIGlmCnRo
YXQncyBleHBsaWNpdGx5IGRvIHRvIFNJR0NITEQsIG9yIGR1ZSB0byBzb21lIG90aGVyIHNpZGUg
ZWZmZWN0IG9mCnNldHRpbmcgbGlieGxfc2lnY2hsZF9vd25lcl9tYWlubG9vcCwgb3Igc29tZXRo
aW5nIGVsc2UgZW50aXJlbHkuCgpDQzogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2Vj
LmNvbT4KLS0tCiB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCAzNCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVu
bGlnaHQuZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggZTExNTU5
MjI1Ny4uZjcwYTRjNmQ5NiAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxp
Z2h0LmdvCisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtMzMsNiAr
MzMsOSBAQCBpbXBvcnQgIkMiCiAKIGltcG9ydCAoCiAJImZtdCIKKwkib3MiCisJIm9zL3NpZ25h
bCIKKwkic3lzY2FsbCIKIAkidW5zYWZlIgogKQogCkBAIC03Nyw4ICs4MCwyMyBAQCBmdW5jIChl
IEVycm9yKSBFcnJvcigpIHN0cmluZyB7CiAKIC8vIENvbnRleHQgcmVwcmVzZW50cyBhIGxpYnhs
X2N0eC4KIHR5cGUgQ29udGV4dCBzdHJ1Y3QgewotCWN0eCAgICAqQy5saWJ4bF9jdHgKLQlsb2dn
ZXIgKkMueGVudG9vbGxvZ19sb2dnZXJfc3RkaW9zdHJlYW0KKwljdHggICAgICpDLmxpYnhsX2N0
eAorCWxvZ2dlciAgKkMueGVudG9vbGxvZ19sb2dnZXJfc3RkaW9zdHJlYW0KKwlzaWdjaGxkIGNo
YW4gb3MuU2lnbmFsCit9CisKKy8vIEdvbGFuZyBhbHdheXMgdW5tYXNrcyBTSUdDSExELCBhbmQg
aW50ZXJuYWxseSBoYXMgd2F5cyBvZgorLy8gZGlzdHJpYnV0aW5nIFNJR0NITEQgdG8gbXVsdGlw
bGUgcmVjaXBpZW50cy4gIGxpYnhsIGhhcyBwcm92aXNpb24KKy8vIGZvciB0aGlzIG1vZGVsOiBq
dXN0IHRlbGwgaXQgd2hlbiBhIFNJR0NITEQgaGFwcGVuZWQsIGFuZCBpdCB3aWxsCisvLyBsb29r
IGFmdGVyIGl0cyBvd24gcHJvY2Vzc2VzLgorLy8KKy8vIFRoaXMgc2hvdWxkICJwbGF5IG5pY2Vs
eSIgd2l0aCBvdGhlciB1c2VycyBvZiBTSUdDSExEIGFzIGxvbmcgYXMKKy8vIHRoZXkgZG9uJ3Qg
cmVhcCBsaWJ4bCdzIHByb2Nlc3Nlcy4KK2Z1bmMgc2lnY2hsZEhhbmRsZXIoY3R4ICpDb250ZXh0
KSB7CisJZm9yIF8gPSByYW5nZSBjdHguc2lnY2hsZCB7CisJCS8vIENhbiB3ZSBzcGluIHVwIGFu
b3RoZXIgZ29yb3V0aW5lIGZvciB0aGlzPworCQlDLmxpYnhsX2NoaWxkcHJvY19zaWdjaGxkX29j
Y3VycmVkKGN0eC5jdHgpCisJfQogfQogCiAvLyBOZXdDb250ZXh0IHJldHVybnMgYSBuZXcgQ29u
dGV4dC4KQEAgLTkzLDYgKzExMSwxNSBAQCBmdW5jIE5ld0NvbnRleHQoKSAoKkNvbnRleHQsIGVy
cm9yKSB7CiAJCXJldHVybiBuaWwsIEVycm9yKHJldCkKIAl9CiAKKwljdHguc2lnY2hsZCA9IG1h
a2UoY2hhbiBvcy5TaWduYWwsIDIpCisJc2lnbmFsLk5vdGlmeShjdHguc2lnY2hsZCwgc3lzY2Fs
bC5TSUdDSExEKQorCisJZ28gc2lnY2hsZEhhbmRsZXIoJmN0eCkKKworCUMubGlieGxfY2hpbGRw
cm9jX3NldG1vZGUoY3R4LmN0eCwKKwkJJkMubGlieGxfY2hpbGRwcm9jX2hvb2tze2NobGRvd25l
cjogQy5saWJ4bF9zaWdjaGxkX293bmVyX21haW5sb29wfSwKKwkJbmlsKQorCiAJcmV0dXJuICZj
dHgsIG5pbAogfQogCkBAIC0xMDIsNiArMTI5LDkgQEAgZnVuYyAoY3R4ICpDb250ZXh0KSBDbG9z
ZSgpIGVycm9yIHsKIAljdHguY3R4ID0gbmlsCiAJQy54dGxfbG9nZ2VyX2Rlc3Ryb3koKCpDLnhl
bnRvb2xsb2dfbG9nZ2VyKSh1bnNhZmUuUG9pbnRlcihjdHgubG9nZ2VyKSkpCiAKKwlzaWduYWwu
U3RvcChjdHguc2lnY2hsZCkKKwljbG9zZShjdHguc2lnY2hsZCkKKwogCWlmIHJldCAhPSAwIHsK
IAkJcmV0dXJuIEVycm9yKHJldCkKIAl9Ci0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
