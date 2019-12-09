Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A21172F9
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 18:40:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieMzF-0001Ub-4d; Mon, 09 Dec 2019 17:38:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieMzD-0001UT-CH
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 17:38:19 +0000
X-Inumbo-ID: af86e3da-1aaa-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af86e3da-1aaa-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 17:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575913099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4shP+jxSILsDmW0PdUqOApthRN+7XdBqnWgH+mKtZg4=;
 b=dgo+aRjfAHSkWm4j3PXU14GI3VSOE7ReSORumHs+54l2tod5gzmlnVxe
 NLR+tbUPxPtiojdFETa8RU0Wemv4DoDDM7VVAA5hoPCCaoTQP0S77NdAI
 0awPRgezQQWYxVy53EemPgcbSg0AejhuNRL72v0j2CoOS3NCQ5dnl8sS0 4=;
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
IronPort-SDR: M6ao4APKkmzpDj44vMcAkHIMKsAeCx7+0KTkg5wWy1B6RtNdeNfRDYkLDrbsSquz2cPCS/8FSp
 TZxsug0FpteUNudvO1KbREVkK2aWXpPZBlMnTEsMtgZ7kgksjMF8xgRsvMtYjhq0e1Kcg1LWhw
 S2kBIwPUbp99QhyNNiTKMF3iWFe8oB7YkStUWjXN1lvKgIWHMfF1AMDeCu+yyBahc7NO6d2OI6
 w6dfh5afX4aXF6DnahjgL7gUCiTUoyO5WeNbjL0dUByvKio0kFNABKFhjD3V6zeM7Hoei/ReTU
 kms=
X-SBRS: 2.7
X-MesageID: 9411222
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,296,1571716800"; 
   d="scan'208";a="9411222"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Dec 2019 18:37:57 +0100
Message-ID: <20191209173757.46833-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4] x86: do not enable global pages when
 virtualized on AMD hardware
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

V2hlbiB1c2luZyBnbG9iYWwgcGFnZXMgYSBmdWxsIHRsYiBmbHVzaCBjYW4gb25seSBiZSBwZXJm
b3JtZWQgYnkKdG9nZ2xpbmcgdGhlIFBHRSBiaXQgaW4gQ1I0LCB3aGljaCBpcyB1c3VhbGx5IHF1
aXRlIGV4cGVuc2l2ZSBpbiB0ZXJtcwpvZiBwZXJmb3JtYW5jZSB3aGVuIHJ1bm5pbmcgdmlydHVh
bGl6ZWQuIFRoaXMgaXMgc3BlY2lhbGx5IHJlbGV2YW50IG9uCkFNRCBoYXJkd2FyZSwgd2hpY2gg
ZG9lc24ndCBoYXZlIHRoZSBhYmlsaXR5IHRvIGRvIHNlbGVjdGl2ZSBDUjQKdHJhcHBpbmcsIGJ1
dCBjYW4gYWxzbyBiZSByZWxldmFudCBvbiBJbnRlbCBpZiB0aGUgdW5kZXJseWluZwpoeXBlcnZp
c29yIGFsc28gdHJhcHMgYWNjZXNzZXMgdG8gdGhlIFBHRSBDUjQgYml0LgoKSW4gb3JkZXIgdG8g
YXZvaWQgdGhpcyBwZXJmb3JtYW5jZSBwZW5hbHR5LCBkbyBub3QgdXNlIGdsb2JhbCBwYWdlcwp3
aGVuIHJ1bm5pbmcgdmlydHVhbGl6ZWQgb24gQU1EIGhhcmR3YXJlLiBBIGNvbW1hbmQgbGluZSBv
cHRpb24KJ2dsb2JhbC1wYWdlcycgaXMgcHJvdmlkZWQgaW4gb3JkZXIgdG8gYWxsb3cgdGhlIHVz
ZXIgdG8gc2VsZWN0CndoZXRoZXIgZ2xvYmFsIHBhZ2VzIHdpbGwgYmUgZW5hYmxlZCBmb3IgUFYg
Z3Vlc3RzLgoKVGhlIGFib3ZlIGZpZ3VyZXMgYXJlIGZyb20gYSBQViBzaGltIHJ1bm5pbmcgb24g
QU1EIGhhcmR3YXJlIHdpdGgKMzIgdkNQVXM6CgpQR0UgZW5hYmxlZCwgeDJBUElDIG1vZGU6Cgoo
WEVOKSBHbG9iYWwgbG9jayBmbHVzaF9sb2NrOiBhZGRyPWZmZmY4MmQwODA0YjAxYzAsIGxvY2t2
YWw9MWFkYjFhZGIsIG5vdCBsb2NrZWQKKFhFTikgICBsb2NrOjE4NDE4ODMoMTM3NTEyODk5ODU0
MyksIGJsb2NrOjE2NTg3MTYoMTAxOTMwNTQ4OTA3ODEpCgpBdmVyYWdlIGxvY2sgdGltZTogICA3
NDY1ODhucwpBdmVyYWdlIGJsb2NrIHRpbWU6IDYxNDUxNDducwoKUEdFIGRpc2FibGVkLCB4MkFQ
SUMgbW9kZToKCihYRU4pIEdsb2JhbCBsb2NrIGZsdXNoX2xvY2s6IGFkZHI9ZmZmZjgyZDA4MDRh
ZjFjMCwgbG9ja3ZhbD1hOGJmYThiZiwgbm90IGxvY2tlZAooWEVOKSAgIGxvY2s6MjczMDE3NSg2
NTc1MDUzODk4ODYpLCBibG9jazoyMDM5NzE2KDI5NjM3NjgyNDc3MzgpCgpBdmVyYWdlIGxvY2sg
dGltZTogICAyNDA4MjlucwpBdmVyYWdlIGJsb2NrIHRpbWU6IDE0NTMwMjlucwoKQXMgc2VlbiBm
cm9tIHRoZSBhYm92ZSBmaWd1cmVzIHRoZSBsb2NrIGFuZCBibG9jayB0aW1lIG9mIHRoZSBmbHVz
aApsb2NrIGlzIHJlZHVjZWQgdG8gYXBwcm94aW1hdGVseSAxLzMgb2YgdGhlIG9yaWdpbmFsIHZh
bHVlLgoKTm90ZSB0aGF0IFhFTl9NSU5JTUFMX0NSNCBhbmQgbW11X2NyNF9mZWF0dXJlcyBhcmUg
bm90IG1vZGlmaWVkLCBhbmQKdGh1cyBnbG9iYWwgcGFnZXMgYXJlIGxlZnQgZW5hYmxlZCBmb3Ig
dGhlIGh5cGVydmlzb3IuIFRoaXMgaXMgbm90IGFuCmlzc3VlIGJlY2F1c2UgdGhlIGNvZGUgdG8g
c3dpdGNoIHRoZSBjb250cm9sIHJlZ2lzdGVycyAoY3IzIGFuZCBjcjQpCmFscmVhZHkgdGFrZXMg
aW50byBhY2NvdW50IHN1Y2ggc2l0dWF0aW9uIGFuZCBwZXJmb3JtcyB0aGUgbmVjZXNzYXJ5CmZs
dXNoZXMuIFRoZSBzYW1lIGFscmVhZHkgaGFwcGVucyB3aGVuIHVzaW5nIFhQVEkgb3IgUENJREUs
IGFzIHRoZQpndWVzdCBjcjQgZG9lc24ndCBoYXZlIGdsb2JhbCBwYWdlcyBlbmFibGVkIGluIHRo
YXQgY2FzZSBlaXRoZXIuCgpBbHNvIG5vdGUgdGhhdCB0aGUgc3VzcGVuZCBhbmQgcmVzdW1lIGNv
ZGUgaXMgY29ycmVjdCBpbiB3cml0aW5nCm1tdV9jcjRfZmVhdHVyZXMgaW50byBjcjQgb24gcmVz
dW1lLCBzaW5jZSB0aGF0J3MgdGhlIGNyNCB1c2VkIGJ5IHRoZQppZGxlIHZDUFUgd2hpY2ggaXMg
dGhlIGNvbnRleHQgdXNlZCBieSB0aGUgc3VzcGVuZCBhbmQgcmVzdW1lIHJvdXRpbmUuCgpTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNo
YW5nZXMgc2luY2UgdjM6CiAtIEV4cGFuZCBjb21taXQgbWVzc2FnZS4KCkNoYW5nZXMgc2luY2Ug
djI6CiAtIFNldCB0aGUgZGVmYXVsdCB2YWx1ZSBhdCBpbml0IGlmIG5vdCBzcGVjaWZpZWQgYnkg
dGhlIHVzZXIuCiAtIFVzZSBpbnQ4X3QgYW5kIHJlYWRfbW9zdGx5IGZvciBvcHRfZ2xvYmFsX3Bh
Z2VzLgoKQ2hhbmdlcyBzaW5jZSB2MToKIC0gUHJvdmlkZSBjb21tYW5kIGxpbmUgb3B0aW9uIHRv
IGVuYWJsZS9kaXNhYmxlIFBHRS4KIC0gT25seSBkaXNhYmxlIFBHRSBvbiBBTUQgaGFyZHdhcmUg
d2hlbiB2aXJ0dWFsaXplZC4KIC0gRG9jdW1lbnQgdGhlIGdsb2JhbC1wYWdlcyBvcHRpb24uCi0t
LQogZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIHwgMTMgKysrKysrKysrKysrKwog
eGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jICAgICAgICAgIHwgMTUgKysrKysrKysrKysrKystCiAy
IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgYi9kb2NzL21pc2MveGVuLWNv
bW1hbmQtbGluZS5wYW5kb2MKaW5kZXggZDk0OTVlZjZiOS4uN2JlMzBmMjc2NiAxMDA2NDQKLS0t
IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCisrKyBiL2RvY3MvbWlzYy94ZW4t
Y29tbWFuZC1saW5lLnBhbmRvYwpAQCAtMTA4Nyw2ICsxMDg3LDE5IEBAIHZhbHVlIHNldHRhYmxl
IHZpYSBYZW4gdG9vbHMuCiAKIERvbTAgaXMgdXNpbmcgdGhpcyB2YWx1ZSBmb3Igc2l6aW5nIGl0
cyBtYXB0cmFjayB0YWJsZS4KIAorIyMjIGdsb2JhbC1wYWdlcyAoeDg2KQorPiBgPSA8Ym9vbGVh
bj5gCisKKz4gRGVmYXVsdDogYHRydWVgIHVubGVzcyBydW5uaW5nIHZpcnR1YWxpemVkIG9uIEFN
RCBoYXJkd2FyZQorCitTZXQgd2hldGhlciB0aGUgUEdFIGJpdCBpbiBDUjQgd2lsbCBiZSBlbmFi
bGVkIGZvciBQViBndWVzdHMuIFRoaXMgY29udHJvbHMgdGhlCit1c2FnZSBvZiBnbG9iYWwgcGFn
ZXMsIGFuZCB0aHVzIHRoZSBuZWVkIHRvIHBlcmZvcm0gdGxiIGZsdXNoZXMgYnkgd3JpdGluZyB0
bworQ1I0LgorCitOb3RlIGl0J3MgZGlzYWJsZWQgYnkgZGVmYXVsdCB3aGVuIHJ1bm5pbmcgdmly
dHVhbGl6ZWQgb24gQU1EIGhhcmR3YXJlIHNpbmNlCitBTUQgU1ZNIGRvZXNuJ3Qgc3VwcG9ydCBz
ZWxlY3RpdmUgdHJhcHBpbmcgb2YgQ1I0LCBzbyBnbG9iYWwgcGFnZXMgYXJlIG5vdAorZW5hYmxl
ZCBpbiBvcmRlciB0byByZWR1Y2UgdGhlIG92ZXJoZWFkIG9mIHRsYiBmbHVzaGVzLgorCiAjIyMg
Z3Vlc3RfbG9nbHZsCiA+IGA9IDxsZXZlbD5bLzxyYXRlLWxpbWl0ZWQgbGV2ZWw+XWAgd2hlcmUg
bGV2ZWwgaXMgYG5vbmUgfCBlcnJvciB8IHdhcm5pbmcgfCBpbmZvIHwgZGVidWcgfCBhbGxgCiAK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9wdi9k
b21haW4uYwppbmRleCA0YjZmNDhkZWEyLi44ZmY3MzNmNTZiIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvcHYvZG9tYWluLmMKKysrIGIveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCkBAIC0xMTgs
NiArMTE4LDE5IEBAIHVuc2lnbmVkIGxvbmcgcHZfZml4dXBfZ3Vlc3RfY3I0KGNvbnN0IHN0cnVj
dCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGNyNCkKICAgICAgICAgICAgIChtbXVfY3I0X2ZlYXR1
cmVzICYgUFZfQ1I0X0dVRVNUX1ZJU0lCTEVfTUFTSykpOwogfQogCitzdGF0aWMgaW50OF90IF9f
cmVhZF9tb3N0bHkgb3B0X2dsb2JhbF9wYWdlcyA9IC0xOworYm9vbGVhbl9ydW50aW1lX3BhcmFt
KCJnbG9iYWwtcGFnZXMiLCBvcHRfZ2xvYmFsX3BhZ2VzKTsKKworc3RhdGljIGludCBfX2luaXQg
cGdlX2luaXQodm9pZCkKK3sKKyAgICBpZiAoIG9wdF9nbG9iYWxfcGFnZXMgPT0gLTEgKQorICAg
ICAgICBvcHRfZ2xvYmFsX3BhZ2VzID0gIWNwdV9oYXNfaHlwZXJ2aXNvciB8fAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICE9IFg4Nl9WRU5ET1Jf
QU1EOworCisgICAgcmV0dXJuIDA7Cit9CitfX2luaXRjYWxsKHBnZV9pbml0KTsKKwogdW5zaWdu
ZWQgbG9uZyBwdl9tYWtlX2NyNChjb25zdCBzdHJ1Y3QgdmNwdSAqdikKIHsKICAgICBjb25zdCBz
dHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwpAQCAtMTMwLDcgKzE0Myw3IEBAIHVuc2lnbmVk
IGxvbmcgcHZfbWFrZV9jcjQoY29uc3Qgc3RydWN0IHZjcHUgKnYpCiAgICAgICovCiAgICAgaWYg
KCBkLT5hcmNoLnB2LnBjaWQgKQogICAgICAgICBjcjQgfD0gWDg2X0NSNF9QQ0lERTsKLSAgICBl
bHNlIGlmICggIWQtPmFyY2gucHYueHB0aSApCisgICAgZWxzZSBpZiAoICFkLT5hcmNoLnB2Lnhw
dGkgJiYgb3B0X2dsb2JhbF9wYWdlcyApCiAgICAgICAgIGNyNCB8PSBYODZfQ1I0X1BHRTsKIAog
ICAgIC8qCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
