Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A9583282
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 15:17:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huzI7-00057Y-33; Tue, 06 Aug 2019 13:14:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qF5n=WC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1huzI5-00057S-3q
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 13:14:13 +0000
X-Inumbo-ID: 134184aa-b84c-11e9-b7c9-9710ebf7bdda
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 134184aa-b84c-11e9-b7c9-9710ebf7bdda;
 Tue, 06 Aug 2019 13:14:09 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hkI9n7x6IVE0lGqJ7xtXQ0h/ZOC1cD9MmTK/OCDeGbOTgXjYIB/5+5BqwjUapgVxPyQlMxnrQJ
 mr5xPWMIbaZRJb00UEcbZbmy/zyEas3Yqv/kuWK33uMgJw62/fZup3i4Cj41YmXHJheB3zTytW
 fVk8n2hO11AFwEOHmg45dM7KovDIkn2zQedKKx83+1qCqEl6SUvG6lrH0ZYi9Rco9zoF9T1A+X
 v0jq4VJG61owFI2frToB/57w7RlrML6QOkML0I6iqGMd+64YwUrDnhaeO7cluPlHzHZMmvSQtb
 iRA=
X-SBRS: 2.7
X-MesageID: 4087361
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,353,1559534400"; 
   d="scan'208";a="4087361"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 6 Aug 2019 15:13:46 +0200
Message-ID: <20190806131346.50881-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/apic: enable x2APIC mode before doing any
 setup
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBjb2RlIGNhbGxzIGFwaWNfeDJhcGljX3Byb2JlIHdoaWNoIGRvZXMgc29tZSBpbml0
aWFsaXphdGlvbgphbmQgc2V0dXAgYmVmb3JlIGhhdmluZyBlbmFibGVkIHgyQVBJQyBtb2RlIChp
ZiBpdCdzIG5vdCBhbHJlYWR5CmVuYWJsZWQgYnkgdGhlIGZpcm13YXJlKS4KClRoaXMgY2FuIGxl
YWQgdG8gaXNzdWVzIGlmIHRoZSBBUElDIElEIGRvZXNuJ3QgbWF0Y2ggdGhlIHgyQVBJQyBJRCwg
YXMKYXBpY194MmFwaWNfcHJvYmUgY2FsbHMgaW5pdF9hcGljX2xkcl94MmFwaWNfY2x1c3RlciB3
aGljaCBkZXBlbmRpbmcKb24gdGhlIEFQSUMgbW9kZSBtaWdodCBzZXQgY3B1XzJfbG9naWNhbF9h
cGljaWQgdXNpbmcgdGhlIEFQSUMgSUQKaW5zdGVhZCBvZiB0aGUgeDJBUElDIElEIChiZWNhdXNl
IHgyQVBJQyBtaWdodCBub3QgYmUgZW5hYmxlZCB5ZXQpLgoKRml4IHRoaXMgYnkgZW5hYmxpbmcg
eDJBUElDIGJlZm9yZSBjYWxsaW5nIGFwaWNfeDJhcGljX3Byb2JlLgoKQXMgYSByZW1hcmssIHRo
aXMgd2FzIGRpc2NvdmVyZWQgd2hpbGUgSSB3YXMgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2h5Cm9u
ZSBvZiBteSB0ZXN0IGJveGVzIGRpZG4ndCByZXBvcnQgYW55IGlvbW11IGZhdWx0cy4gVGhlIHJv
b3QgY2F1c2UKd2FzIHRoYXQgdGhlIGlvbW11IE1TSSBhZGRyZXNzIGZpZWxkIHdhcyBzZXQgdXNp
bmcgdGhlIHN0YWxlIHZhbHVlIGluCmNwdV8yX2xvZ2ljYWxfYXBpY2lkLCBhbmQgdGh1cyB0aGUg
aW9tbXUgZmF1bHQgaW50ZXJydXB0IHdvdWxkIGdldApsb3N0LiBFdmVuIGlmIHRoZSBNU0kgYWRk
cmVzcyBmaWVsZCBnZXRzIHNldHMgdG8gYSBjb3JyZWN0IHZhbHVlCmFmdGVyd2FyZHMgYXMgc29v
biBhcyBhIHNpbmdsZSBpb21tdSBmYXVsdCBpcyBwZW5kaW5nIG5vIGZ1cnRoZXIKaW50ZXJydXB0
cyB3b3VsZCBnZXQgaW5qZWN0ZWQsIHNvIGxvc2luZyBhIHNpbmdsZSBpb21tdSBmYXVsdAppbnRl
cnJ1cHQgaXMgZmF0YWwuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8
d2xAeGVuLm9yZz4KLS0tCiB4ZW4vYXJjaC94ODYvYXBpYy5jIHwgMTAgKysrKystLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvYXBpYy5jIGIveGVuL2FyY2gveDg2L2FwaWMuYwppbmRleCA5YzNjOTk4
ZDM0Li5iZDY5Mjk5YTI3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYXBpYy5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9hcGljLmMKQEAgLTk1MiwxNyArOTUyLDE3IEBAIHZvaWQgX19pbml0IHgyYXBp
Y19ic3Bfc2V0dXAodm9pZCkKIAogICAgIGZvcmNlX2lvbW11ID0gMTsKIAotICAgIG9yaWdfbmFt
ZSA9IGdlbmFwaWMubmFtZTsKLSAgICBnZW5hcGljID0gKmFwaWNfeDJhcGljX3Byb2JlKCk7Ci0g
ICAgaWYgKCBnZW5hcGljLm5hbWUgIT0gb3JpZ19uYW1lICkKLSAgICAgICAgcHJpbnRrKCJTd2l0
Y2hlZCB0byBBUElDIGRyaXZlciAlc1xuIiwgZ2VuYXBpYy5uYW1lKTsKLQogICAgIGlmICggIXgy
YXBpY19lbmFibGVkICkKICAgICB7CiAgICAgICAgIHgyYXBpY19lbmFibGVkID0gdHJ1ZTsKICAg
ICAgICAgX19lbmFibGVfeDJhcGljKCk7CiAgICAgfQogCisgICAgb3JpZ19uYW1lID0gZ2VuYXBp
Yy5uYW1lOworICAgIGdlbmFwaWMgPSAqYXBpY194MmFwaWNfcHJvYmUoKTsKKyAgICBpZiAoIGdl
bmFwaWMubmFtZSAhPSBvcmlnX25hbWUgKQorICAgICAgICBwcmludGsoIlN3aXRjaGVkIHRvIEFQ
SUMgZHJpdmVyICVzXG4iLCBnZW5hcGljLm5hbWUpOworCiByZXN0b3JlX291dDoKICAgICByZXN0
b3JlX0lPX0FQSUNfc2V0dXAoaW9hcGljX2VudHJpZXMpOwogICAgIHVubWFza184MjU5QSgpOwot
LSAKMi4yMC4xIChBcHBsZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
