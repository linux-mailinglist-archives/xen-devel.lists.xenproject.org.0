Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B092B55273
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 16:47:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfmhr-0003BU-OA; Tue, 25 Jun 2019 14:45:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ot0M=UY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hfmhq-0003BL-Np
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 14:45:58 +0000
X-Inumbo-ID: f07dc2c9-9757-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f07dc2c9-9757-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 14:45:56 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zK/LNadjFT54Kv9wQ8cr3tSWLolovWgYnRMO/FhBC1ILuhi52xIb4YoTJyvogh6nkI+m5GJBlJ
 xbmddveZyIVnSb2BVMdhSRMDufX6or7KDnk+aPRUK4l+j2TInwvOC830WncjVBU+YcyfALMKq3
 fyzVFsLyOqlW49HywFE39YWDYrj9ft21GnhrH0vPTDdvQtzBfcTRKvp25ev2ssfYVqlXMKn0UF
 hk167bkANJviBM1OvFnal0mpKh6/wxt/jv7eIJ7s7pcq3CB/kdOZC2upl6ZvNWL+6/B1XyqtZZ
 kyk=
X-SBRS: 2.7
X-MesageID: 2201612
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2201612"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 25 Jun 2019 15:43:50 +0100
Message-ID: <20190625144350.6176-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190625144350.6176-1-andrew.cooper3@citrix.com>
References: <20190625144350.6176-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/3] page-alloc: Clamp get_free_buddy() to
 online nodes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ZC0+bm9kZV9hZmZpbml0eSBkZWZhdWx0cyB0byBOT0RFX01BU0tfQUxMIHdoaWNoIGhhcyBiaXRz
IHNldCBvdXRzaWRlIG9mCm5vZGVfb25saW5lX21hcC4gIFRoaXMgaW4gdHVybiBjYXVzZXMgdGhl
IGxvb3AgaW4gZ2V0X2ZyZWVfYnVkZHkoKSB0byB3YXN0ZQplZmZvcnQgaXRlcmF0aW5nIG92ZXIg
b2ZmbGluZSBub2Rlcy4KCkFsd2F5cyBjbGFtcCBkLT5ub2RlX2FmZmluaXR5IHRvIG5vZGVfb25s
aW5lX21hcCB3aGVuIGluIHVzZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IEdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KCnYyOgogKiBSZWJhc2Ugb3Zl
ciB0aGUgbm9kZW1hc2sgQVBJIGNoYW5nZSwgYW5kIGltcGxlbWVudCB3aXRoIGEgc2luZ2xlCiAg
IG5vZGVzX2FuZCgpCi0tLQogeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgfCA2ICsrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKaW5kZXgg
N2JiYTViMGIyZS4uZmUxMTU5YjM1MiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9j
LmMKKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKQEAgLTgxMSwxMSArODExLDE1IEBAIHN0
YXRpYyBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfZnJlZV9idWRkeSh1bnNpZ25lZCBpbnQgem9uZV9s
bywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
ZG9tYWluICpkKQogewogICAgIG5vZGVpZF90IGZpcnN0LCBub2RlID0gTUVNRl9nZXRfbm9kZSht
ZW1mbGFncyksIHJlcV9ub2RlID0gbm9kZTsKLSAgICBub2RlbWFza190IG5vZGVtYXNrID0gZCA/
IGQtPm5vZGVfYWZmaW5pdHkgOiBub2RlX29ubGluZV9tYXA7CisgICAgbm9kZW1hc2tfdCBub2Rl
bWFzazsKICAgICB1bnNpZ25lZCBpbnQgaiwgem9uZSwgbm9kZW1hc2tfcmV0cnkgPSAwOwogICAg
IHN0cnVjdCBwYWdlX2luZm8gKnBnOwogICAgIGJvb2wgdXNlX3Vuc2NydWJiZWQgPSAobWVtZmxh
Z3MgJiBNRU1GX25vX3NjcnViKTsKIAorICAgIC8qIENsYW1wIG5vZGVtYXNrIHRvIG5vZGVfb25s
aW5lX21hcCBhbmQgb3B0aW9uYWxseSBkLT5ub2RlX2FmZmluaXR5LiAqLworICAgIG5vZGVzX2Fu
ZCgmbm9kZW1hc2ssICZub2RlX29ubGluZV9tYXAsCisgICAgICAgICAgICAgIGQgPyAmZC0+bm9k
ZV9hZmZpbml0eSA6ICZub2RlX29ubGluZV9tYXApOworCiAgICAgaWYgKCBub2RlID09IE5VTUFf
Tk9fTk9ERSApCiAgICAgewogICAgICAgICBpZiAoIGQgIT0gTlVMTCApCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
