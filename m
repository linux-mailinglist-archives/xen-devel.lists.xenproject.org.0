Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E976B2635
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 21:43:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8rQn-0000qb-Hu; Fri, 13 Sep 2019 19:40:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bj/4=XI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8rQl-0000qS-MX
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 19:40:31 +0000
X-Inumbo-ID: 57fc7a0c-d65e-11e9-95b9-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57fc7a0c-d65e-11e9-95b9-12813bfff9fa;
 Fri, 13 Sep 2019 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568403630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cp6tFL/XHMEP63R0guP26d8reY1TYzmtk99bNV5kdU0=;
 b=fJQYl2DxhXZlY2m3n6w7ErOZ8d5/uriZkfc2oldyLN04VLSHqh48q09+
 6IbL63prVih3xWO43lqPY4BDnWE3RMplONDTBJQ9MnyJB45vyL4D+RZX4
 stwaDnf8u/jkuoQhgEcmjSJ3kS8aKcRSiF411iZ84gVRi4HUIeruTZebS g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4cQ5q2E0MdFngU9Gt327bvIFQTJCEugu2xZjTFptNXiHsedpQW8+aaelrjY7O9WMUkZc8yPHOy
 Fl4HXlof9mhBXpMCq8fJETkV/tkEsUbFBIHjrBjaTbsADUPJmSjlbvnpZw29kGHTaCwj5OwLam
 6NiS7JpJON67lbAM+1B5yJlBCF+G9mPkkgki/W6haQtR9fVMXXJ9Pt2ILat5pk6dl8ozMhncRp
 2arD6TbwDZT8MY8cW7v1xgjyv1eokIKGjNRZpmz3qy+Sl+nNb6QnqG/kzWn4DLqad+o/02HtUI
 JyI=
X-SBRS: 2.7
X-MesageID: 5755000
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5755000"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 20:27:59 +0100
Message-ID: <20190913192759.10795-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190913192759.10795-1-andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 10/10] x86/cpuid: Enable CPUID Faulting for
 PV control domains by default
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

VGhlIGRvbWFpbiBidWlsZGVyIG5vIGxvbmdlciB1c2VzIGxvY2FsIENQVUlEIGluc3RydWN0aW9u
cyBmb3IgcG9saWN5CmRlY2lzaW9ucy4gIFRoaXMgcmVzb2x2ZXMgYSBrZXkgaXNzdWUgZm9yIFBW
SCBkb20wJ3MuICBIb3dldmVyLCBhcyBQViBkb20wJ3MKaGF2ZSBuZXZlciBoYWQgZmF1bHRpbmcg
ZW5mb3JjZWQsIGxlYXZlIGEgY29tbWFuZCBsaW5lIG9wdGlvbiB0byByZXN0b3JlIHRoZQpvbGQg
YmVoYXZpb3VyLgoKQWR2ZXJ0aXNlIHZpcnR1YWxpc2VkIGZhdWx0aW5nIHN1cHBvcnQgdG8gY29u
dHJvbCBkb21haW5zIHVubGVzcyB0aGUgb3B0LW91dApoYXMgYmVlbiB1c2VkLgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpD
QzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2MjoKICogSW50cm9k
dWNlIGEgY29tbWFuZCBsaW5lIG9wdGlvbiB0byByZXRhaW4gb2xkIGJlaGF2aW91ci4KICogQWR2
ZXJ0aXNlIHZpcnR1YWxpc2VkIGZhdWx0aW5nIHN1cHBvcnQgdG8gZG9tMCB3aGVuIGl0IGlzIHVz
ZWQuCnYyLjE6CiAqIFNwbGl0IHRoZSBQVkggYWRqdXN0bWVudCBvdXQuICBSZWJhc2UuCiAqIFJl
Y292ZXIgdGhlIGRvY3MvIGh1bmsgd2hpY2ggd2FzIGFjY2lkZW50YWxseSBtaXNzaW5nLgotLS0K
IGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8IDE5ICsrKysrKysrKysrKysrKysr
Ky0KIHhlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMgICAgICAgICB8IDI2ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAgICAgfCAgMiArKwog
eGVuL2FyY2gveDg2L21zci5jICAgICAgICAgICAgICAgIHwgIDMgKystCiB4ZW4vaW5jbHVkZS9h
c20teDg2L3NldHVwLmggICAgICAgfCAgMSArCiA1IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlv
bnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW4tY29tbWFu
ZC1saW5lLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwppbmRleCA4
MzI3OTdlMmUyLi5mYzY0NDI5MDY0IDEwMDY0NAotLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQt
bGluZS5wYW5kb2MKKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCkBAIC02
NTgsNyArNjU4LDggQEAgVGhlIGRlYnVnIHRyYWNlIGZlYXR1cmUgaXMgb25seSBlbmFibGVkIGlu
IGRlYnVnZ2luZyBidWlsZHMgb2YgWGVuLgogU3BlY2lmeSB0aGUgYml0IHdpZHRoIG9mIHRoZSBE
TUEgaGVhcC4KIAogIyMjIGRvbTAKLSAgICA9IExpc3Qgb2YgWyBwdiB8IHB2aCwgc2hhZG93PTxi
b29sPiwgdmVyYm9zZT08Ym9vbD4gXQorICAgID0gTGlzdCBvZiBbIHB2IHwgcHZoLCBzaGFkb3c9
PGJvb2w+LCB2ZXJib3NlPTxib29sPiwKKyAgICAgICAgICAgICAgICBjcHVpZC1mYXVsdGluZz08
Ym9vbD4gXQogCiAgICAgQXBwbGljYWJpbGl0eTogeDg2CiAKQEAgLTY5MSw2ICs2OTIsMjIgQEAg
Q29udHJvbHMgZm9yIGhvdyBkb20wIGlzIGNvbnN0cnVjdGVkIG9uIHg4NiBzeXN0ZW1zLgogICAg
IGluZm9ybWF0aW9uIGR1cmluZyB0aGUgZG9tMCBidWlsZC4gIEl0IGRlZmF1bHRzIHRvIHRoZSBj
b21waWxlIHRpbWUgY2hvaWNlCiAgICAgb2YgYENPTkZJR19WRVJCT1NFX0RFQlVHYC4KIAorKiAg
IFRoZSBgY3B1aWQtZmF1bHRpbmdgIGJvb2xlYW4gaXMgYW4gaW50ZXJpbSBvcHRpb24sIGlzIG9u
bHkgYXBwbGljYWJsZSB0bworICAgIFBWIGRvbTAsIGFuZCBkZWZhdWx0cyB0byB0cnVlLgorCisg
ICAgQmVmb3JlIFhlbiA0LjEzLCB0aGUgZG9tYWluIGJ1aWxkZXIgbG9naWMgZm9yIGd1ZXN0IGNv
bnN0cnVjdGlvbiBkZXBlbmRlZAorICAgIG9uIHNlZWluZyBob3N0IENQVUlEIHZhbHVlcyB0byBm
dW5jdGlvbiBjb3JyZWN0bHkuICBBcyBhIHJlc3VsdCwgQ1BVSUQKKyAgICBGYXVsdGluZyB3YXMg
bmV2ZXIgYWN0aXZhdGVkIGZvciBQViBkb20wJ3MsIGV2ZW4gb24gY2FwYWJsZSBoYXJkd2FyZS4K
KworICAgIEluIFhlbiA0LjEzLCB0aGUgZG9tYWluIGJ1aWxkZXIgbG9naWMgaGFzIGJlZW4gZml4
ZWQsIGFuZCBubyBsb25nZXIgaGFzCisgICAgdGhpcyBkZXBlbmRlbmN5LiAgQXMgYSBjb25zZXF1
ZW5jZSwgQ1BVSUQgRmF1bHRpbmcgaXMgYWN0aXZhdGVkIGJ5IGRlZmF1bHQKKyAgICBldmVuIGZv
ciBQViBkb20wJ3MuCisKKyAgICBIb3dldmVyLCBhcyBQViBkb20wJ3MgaGF2ZSBhbHdheXMgc2Vl
biBob3N0IENQVUlEIGRhdGEgaW4gdGhlIHBhc3QsIHRoZXJlCisgICAgaXMgYSBjaGFuY2UgdGhh
dCBmdXJ0aGVyIGRlcGVuZGVuY2llcyBleGlzdC4gIFRoaXMgYm9vbGVhbiBjYW4gYmUgdXNlZCB0
bworICAgIHJlc3RvcmUgdGhlIHByZS00LjEzIGJlaGF2aW91ci4gIElmIHNwZWNpZnlpbmcgYG5v
LWNwdWlkLWZhdWx0aW5nYCBmaXhlcworICAgIGFuIGlzc3VlIGluIGRvbTAsIHBsZWFzZSByZXBv
cnQgYSBidWcuCisKICMjIyBkb20wLWlvbW11CiAgICAgPSBMaXN0IG9mIFsgcGFzc3Rocm91Z2g9
PGJvb2w+LCBzdHJpY3Q9PGJvb2w+LCBtYXAtaW5jbHVzaXZlPTxib29sPiwKICAgICAgICAgICAg
ICAgICBtYXAtcmVzZXJ2ZWQ9PGJvb2w+LCBub25lIF0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9jcHUvY29tbW9uLmMgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCmluZGV4IDRiZjg1MmM5
NDguLjZjNmJkNjMzMDEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKKysr
IGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwpAQCAtMTAsMTIgKzEwLDE1IEBACiAjaW5jbHVk
ZSA8YXNtL2lvLmg+CiAjaW5jbHVkZSA8YXNtL21wc3BlYy5oPgogI2luY2x1ZGUgPGFzbS9hcGlj
Lmg+CisjaW5jbHVkZSA8YXNtL3NldHVwLmg+CiAjaW5jbHVkZSA8bWFjaF9hcGljLmg+CiAjaW5j
bHVkZSA8cHVibGljL3N5c2N0bC5oPiAvKiBmb3IgWEVOX0lOVkFMSURfe1NPQ0tFVCxDT1JFfV9J
RCAqLwogCiAjaW5jbHVkZSAiY3B1LmgiCiAjaW5jbHVkZSAibWNoZWNrL3g4Nl9tY2EuaCIKIAor
Ym9vbCBfX3JlYWRfbW9zdGx5IG9wdF9kb20wX2NwdWlkX2ZhdWx0aW5nID0gdHJ1ZTsKKwogYm9v
bF90IG9wdF9hcmF0ID0gMTsKIGJvb2xlYW5fcGFyYW0oImFyYXQiLCBvcHRfYXJhdCk7CiAKQEAg
LTE3MSwyMCArMTc0LDE5IEBAIHZvaWQgY3R4dF9zd2l0Y2hfbGV2ZWxsaW5nKGNvbnN0IHN0cnVj
dCB2Y3B1ICpuZXh0KQogCQkvKgogCQkgKiBXZSAqc2hvdWxkKiBiZSBlbmFibGluZyBmYXVsdGlu
ZyBmb3IgUFYgY29udHJvbCBkb21haW5zLgogCQkgKgotCQkgKiBVbmZvcnR1bmF0ZWx5LCB0aGUg
ZG9tYWluIGJ1aWxkZXIgKGhhdmluZyBvbmx5IGV2ZXIgYmVlbiBhCi0JCSAqIFBWIGd1ZXN0KSBl
eHBlY3RzIHRvIGJlIGFibGUgdG8gc2VlIGhvc3QgY3B1aWQgc3RhdGUgaW4gYQotCQkgKiBuYXRp
dmUgQ1BVSUQgaW5zdHJ1Y3Rpb24sIHRvIGNvcnJlY3RseSBidWlsZCBhIENQVUlEIHBvbGljeQot
CQkgKiBmb3IgSFZNIGd1ZXN0cyAobm90YWJseSB0aGUgeHN0YXRlIGxlYXZlcykuCi0JCSAqCi0J
CSAqIFRoaXMgbG9naWMgaXMgZnVuZGltZW50YWxseSBicm9rZW4gZm9yIEhWTSB0b29sc3RhY2sK
LQkJICogZG9tYWlucywgYW5kIGZhdWx0aW5nIGNhdXNlcyBQViBndWVzdHMgdG8gYmVoYXZlIGxp
a2UgSFZNCi0JCSAqIGd1ZXN0cyBmcm9tIHRoZWlyIHBvaW50IG9mIHZpZXcuCisJCSAqIFRoZSBk
b21haW4gYnVpbGRlciBoYXMgbm93IGJlZW4gdXBkYXRlZCB0byBub3QgZGVwZW5kIG9uCisJCSAq
IHNlZWluZyBob3N0IENQVUlEIHZhbHVlcy4gIFRoaXMgbWFrZXMgaXQgY29tcGF0aWJsZSB3aXRo
CisJCSAqIFBWSCB0b29sc3RhY2sgZG9tYWlucywgYW5kIGxldHMgdXMgZW5hYmxlIGZhdWx0aW5n
IGJ5CisJCSAqIGRlZmF1bHQgZm9yIGFsbCBQViBkb21haW5zLgogCQkgKgotCQkgKiBGdXR1cmUg
ZGV2ZWxvcG1lbnQgcGxhbnMgd2lsbCBtb3ZlIHJlc3BvbnNpYmlsaXR5IGZvcgotCQkgKiBnZW5l
cmF0aW5nIHRoZSBtYXhpbXVtIGZ1bGwgY3B1aWQgcG9saWN5IGludG8gWGVuLCBhdCB3aGljaAot
CQkgKiB0aGlzIHByb2JsZW0gd2lsbCBkaXNhcHBlYXIuCisJCSAqIEhvd2V2ZXIsIGFzIFBWIGNv
bnRyb2wgZG9tYWlucyBoYXZlIG5ldmVyIGhhZCBmYXVsdGluZworCQkgKiBlbmZvcmNlZCBvbiB0
aGVtIGJlZm9yZSwgdGhlcmUgbWlnaHQgcGxhdXNpYmx5IGJlIG90aGVyCisJCSAqIGRlcGVuZGVu
aWNlcyBvbiBob3N0IENQVUlEIGRhdGEuICBUaGVyZWZvcmUsIHdlIGhhdmUgbGVmdAorCQkgKiBh
biBpbnRlcmltIGVzY2FwZSBoYXRjaCBpbiB0aGUgZm9ybSBvZgorCQkgKiBgZG9tMD1uby1jcHVp
ZC1mYXVsdGluZ2AgdG8gcmVzdG9yZSB0aGUgb2xkZXIgYmVoYXZpb3VyLgogCQkgKi8KLQkJc2V0
X2NwdWlkX2ZhdWx0aW5nKG5leHRkICYmICghaXNfY29udHJvbF9kb21haW4obmV4dGQpIHx8CisJ
CXNldF9jcHVpZF9mYXVsdGluZyhuZXh0ZCAmJiAob3B0X2RvbTBfY3B1aWRfZmF1bHRpbmcgfHwK
KwkJCQkJICAgICAhaXNfY29udHJvbF9kb21haW4obmV4dGQpIHx8CiAJCQkJCSAgICAgIWlzX3B2
X2RvbWFpbihuZXh0ZCkpICYmCiAJCQkJICAgKGlzX3B2X2RvbWFpbihuZXh0ZCkgfHwKIAkJCQkg
ICAgbmV4dC0+YXJjaC5tc3JzLT4KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxk
LmMgYi94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCmluZGV4IGM2OTU3MDkyMGMuLjRiNzUxNjZk
YjMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gv
eDg2L2RvbTBfYnVpbGQuYwpAQCAtMzA1LDYgKzMwNSw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHBh
cnNlX2RvbTBfcGFyYW0oY29uc3QgY2hhciAqcykKICNlbmRpZgogICAgICAgICBlbHNlIGlmICgg
KHZhbCA9IHBhcnNlX2Jvb2xlYW4oInZlcmJvc2UiLCBzLCBzcykpID49IDAgKQogICAgICAgICAg
ICAgb3B0X2RvbTBfdmVyYm9zZSA9IHZhbDsKKyAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJz
ZV9ib29sZWFuKCJjcHVpZC1mYXVsdGluZyIsIHMsIHNzKSkgPj0gMCApCisgICAgICAgICAgICBv
cHRfZG9tMF9jcHVpZF9mYXVsdGluZyA9IHZhbDsKICAgICAgICAgZWxzZQogICAgICAgICAgICAg
cmMgPSAtRUlOVkFMOwogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbXNyLmMgYi94ZW4vYXJj
aC94ODYvbXNyLmMKaW5kZXggYTZjOGNjNzYyNy4uNDY5OGQyYmJhMSAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L21zci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwpAQCAtMjYsNiArMjYsNyBA
QAogCiAjaW5jbHVkZSA8YXNtL2RlYnVncmVnLmg+CiAjaW5jbHVkZSA8YXNtL21zci5oPgorI2lu
Y2x1ZGUgPGFzbS9zZXR1cC5oPgogCiBERUZJTkVfUEVSX0NQVSh1aW50MzJfdCwgdHNjX2F1eCk7
CiAKQEAgLTkyLDcgKzkzLDcgQEAgaW50IGluaXRfZG9tYWluX21zcl9wb2xpY3koc3RydWN0IGRv
bWFpbiAqZCkKICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAKICAgICAvKiBTZWUgY29tbWVudCBp
biBjdHh0X3N3aXRjaF9sZXZlbGxpbmcoKSAqLwotICAgIGlmICggaXNfY29udHJvbF9kb21haW4o
ZCkgJiYgaXNfcHZfZG9tYWluKGQpICkKKyAgICBpZiAoICFvcHRfZG9tMF9jcHVpZF9mYXVsdGlu
ZyAmJiBpc19jb250cm9sX2RvbWFpbihkKSAmJiBpc19wdl9kb21haW4oZCkgKQogICAgICAgICBt
cC0+cGxhdGZvcm1faW5mby5jcHVpZF9mYXVsdGluZyA9IGZhbHNlOwogCiAgICAgZC0+YXJjaC5t
c3IgPSBtcDsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc2V0dXAuaCBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvc2V0dXAuaAppbmRleCAxNWQ2MzYzMDIyLi44NjFkNDZkNmFjIDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3NldHVwLmgKKysrIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9zZXR1cC5oCkBAIC02Niw2ICs2Niw3IEBAIGV4dGVybiBib29sIG9wdF9kb20wX3NoYWRv
dzsKICNlbmRpZgogZXh0ZXJuIGJvb2wgb3B0X2RvbTBfcHZoOwogZXh0ZXJuIGJvb2wgb3B0X2Rv
bTBfdmVyYm9zZTsKK2V4dGVybiBib29sIG9wdF9kb20wX2NwdWlkX2ZhdWx0aW5nOwogCiAjZGVm
aW5lIG1heF9pbml0X2RvbWlkICgwKQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
