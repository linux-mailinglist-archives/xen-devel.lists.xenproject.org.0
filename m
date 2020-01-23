Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF2F14707D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 19:09:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iugsR-0008Gg-Bs; Thu, 23 Jan 2020 18:06:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AKOf=3M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iugsQ-0008Gb-0x
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 18:06:46 +0000
X-Inumbo-ID: 1b9ff5c4-3e0b-11ea-bea0-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b9ff5c4-3e0b-11ea-bea0-12813bfff9fa;
 Thu, 23 Jan 2020 18:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579802802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=INdQVtjZQ+K3BK30zmQJ0/qlG9XVDY8JeGQiaGOGdEI=;
 b=DS0dZ7LKSb0/X2tgArhof0O4kgnefVmWnTn5DoOEPt91CJnRnOw3cZD+
 M3lwMFQjKtQ1EAgMwHhsaA4w84EfycenobYPLHCRqP6+SVLY/rFLQmcR4
 7wUgAff3TKwqwvxTX6X2aCBvU8sxfrn1vxm1HeSe5fcgHW3L0pafnp+pF 4=;
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
IronPort-SDR: zMv/MLPW/h6g+x9y+lFRwTY6OJQLeLg3ckjJGrmnPd3D+ydBhC6JqBJ35Lc2YWokJm4+qTtnNa
 2eRE24yinEDmbt5k3JrZ9uEv8Pe4dxFNgC0ZdNjonLtIzz3RlJeonCsAMbZlnCj904AkDJpPQp
 Mz1PtqhDLfYnMg90u/b+KBFsQb1fSVz9HQz43axybR8EnzrFSG98CXqEZg9/jRcVKt77QyRd6t
 ZfzZghtGsbW6FL4O5d9Ppy9wIqDmJeKdXTBfSActpMnlanC7mpcVtMtQ6wmO8ZLaAxxbglUC1C
 w3I=
X-SBRS: 2.7
X-MesageID: 11361584
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11361584"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 23 Jan 2020 19:06:14 +0100
Message-ID: <20200123180615.69370-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200123180615.69370-1-roger.pau@citrix.com>
References: <20200123180615.69370-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] x86/apic: fix disabling LVT0 in
 disconnect_bsp_APIC
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEludGVsIFNETSBzdGF0ZXM6CgoiV2hlbiBhbiBpbGxlZ2FsIHZlY3RvciB2YWx1ZSAoMCB0
byAxNSkgaXMgd3JpdHRlbiB0byBhIExWVCBlbnRyeSBhbmQKdGhlIGRlbGl2ZXJ5IG1vZGUgaXMg
Rml4ZWQgKGJpdHMgOC0xMSBlcXVhbCAwKSwgdGhlIEFQSUMgbWF5IHNpZ25hbCBhbgppbGxlZ2Fs
IHZlY3RvciBlcnJvciwgd2l0aG91dCByZWdhcmQgdG8gd2hldGhlciB0aGUgbWFzayBiaXQgaXMg
c2V0IG9yCndoZXRoZXIgYW4gaW50ZXJydXB0IGlzIGFjdHVhbGx5IHNlZW4gb24gdGhlIGlucHV0
LiIKCkFuZCB0aGF0J3MgZXhhY3RseSB3aGF0J3MgY3VycmVudGx5IGRvbmUgaW4gZGlzY29ubmVj
dF9ic3BfQVBJQyB3aGVuCnZpcnRfd2lyZV9zZXR1cCBpcyB0cnVlIGFuZCBMVlQgTElOVDAgaXMg
YmVpbmcgbWFza2VkLiBCeSB3cml0aW5nIG9ubHkKQVBJQ19MVlRfTUFTS0VEIFhlbiBpcyBhY3R1
YWxseSBzZXR0aW5nIHRoZSB2ZWN0b3IgdG8gMCBhbmQgdGhlCmRlbGl2ZXJ5IG1vZGUgdG8gRml4
ZWQgKDApLCBhbmQgaGVuY2UgaXQgdHJpZ2dlcnMgYW4gQVBJQyBlcnJvciBldmVuCndoZW4gdGhl
IExWVCBlbnRyeSBpcyBtYXNrZWQuCgpUaGlzIHdvdWxkIHVzdWFsbHkgbWFuaWZlc3Qgd2hlbiBY
ZW4gaXMgYmVpbmcgc2h1dCBkb3duLCBhcyB0aGF0J3MKd2hlcmUgZGlzY29ubmVjdF9ic3BfQVBJ
QyBpcyBjYWxsZWQ6CgooWEVOKSBBUElDIGVycm9yIG9uIENQVTA6IDQwKDAwKQoKRml4IHRoaXMg
YnkgY2FsbGluZyBjbGVhcl9sb2NhbF9BUElDIHByaW9yIHRvIHNldHRpbmcgdGhlIExWVCBMSU5U
CnJlZ2lzdGVycyB3aGljaCBhbHJlYWR5IGNsZWFyIExWVCBMSU5UMCwgYW5kIGhlbmNlIHRoZSB0
cm91Ymxlc29tZQp3cml0ZSBjYW4gYmUgYXZvaWRlZCBhcyB0aGUgcmVnaXN0ZXIgaXMgYWxyZWFk
eSBjbGVhcmVkLgoKUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKIC0gVXNlIGNsZWFyX2xvY2FsX0FQSUMgaW4g
b3JkZXIgdG8gY2xlYXIgTElOVDAuCi0tLQogeGVuL2FyY2gveDg2L2FwaWMuYyB8IDYgKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9hcGljLmMgYi94ZW4vYXJjaC94ODYvYXBpYy5jCmluZGV4IGE2
YTc3NTRkNzcuLjUwOGIxNTg2ZjIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9hcGljLmMKKysr
IGIveGVuL2FyY2gveDg2L2FwaWMuYwpAQCAtMjYyLDYgKzI2Miw4IEBAIHZvaWQgZGlzY29ubmVj
dF9ic3BfQVBJQyhpbnQgdmlydF93aXJlX3NldHVwKQogICAgICAgICAvKiBHbyBiYWNrIHRvIFZp
cnR1YWwgV2lyZSBjb21wYXRpYmlsaXR5IG1vZGUgKi8KICAgICAgICAgdW5zaWduZWQgbG9uZyB2
YWx1ZTsKIAorICAgICAgICBjbGVhcl9sb2NhbF9BUElDKCk7CisKICAgICAgICAgLyogRm9yIHRo
ZSBzcHVyaW91cyBpbnRlcnJ1cHQgdXNlIHZlY3RvciBGLCBhbmQgZW5hYmxlIGl0ICovCiAgICAg
ICAgIHZhbHVlID0gYXBpY19yZWFkKEFQSUNfU1BJVik7CiAgICAgICAgIHZhbHVlICY9IH5BUElD
X1ZFQ1RPUl9NQVNLOwpAQCAtMjc5LDEwICsyODEsNiBAQCB2b2lkIGRpc2Nvbm5lY3RfYnNwX0FQ
SUMoaW50IHZpcnRfd2lyZV9zZXR1cCkKICAgICAgICAgICAgIHZhbHVlID0gU0VUX0FQSUNfREVM
SVZFUllfTU9ERSh2YWx1ZSwgQVBJQ19NT0RFX0VYVElOVCk7CiAgICAgICAgICAgICBhcGljX3dy
aXRlKEFQSUNfTFZUMCwgdmFsdWUpOwogICAgICAgICB9Ci0gICAgICAgIGVsc2UgewotICAgICAg
ICAgICAgLyogRGlzYWJsZSBMVlQwICovCi0gICAgICAgICAgICBhcGljX3dyaXRlKEFQSUNfTFZU
MCwgQVBJQ19MVlRfTUFTS0VEKTsKLSAgICAgICAgfQogCiAgICAgICAgIC8qIEZvciBMVlQxIG1h
a2UgaXQgZWRnZSB0cmlnZ2VyZWQsIGFjdGl2ZSBoaWdoLCBubWkgYW5kIGVuYWJsZWQgKi8KICAg
ICAgICAgdmFsdWUgPSBhcGljX3JlYWQoQVBJQ19MVlQxKTsKLS0gCjIuMjUuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
