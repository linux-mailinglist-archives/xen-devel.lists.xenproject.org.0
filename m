Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CBF71C8D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 18:09:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpxIw-0001R7-5n; Tue, 23 Jul 2019 16:06:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vTna=VU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpxIu-0001Qd-4e
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 16:06:16 +0000
X-Inumbo-ID: cc37775c-ad63-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc37775c-ad63-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 16:06:15 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MociYMKhRQ0Ltw2xIvjoYKhlFBqQIrh8+ujFhhyJIvrXiqD8p7luE8c1xMd5fMiG67+EEzcsTR
 awAszHS/AHi9GOSxgESHRhymDWQLuLYOi5oenhgW3YidIMSz60ktJUefiZ8IWiZsVIL4zQa6wY
 kveqbBcpUthZGAyM8cvVO1kKyWeSvTLBMUyv4JIMc9WCIsw9bGka8lxn4CQf1geVlcjBovPqQ5
 bZs3aJmYKl3Rrh1EN2sylKhajEpgD80tJv5hrndQD19nH3CTnbzIQp3gepd7IFdfEcDmuJ70Zt
 D6M=
X-SBRS: 2.7
X-MesageID: 3410781
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3410781"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Jul 2019 17:06:07 +0100
Message-ID: <20190723160609.2177-5-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190723160609.2177-1-paul.durrant@citrix.com>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/6] x86/domain: remove the 'oos_off' flag
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
Cc: Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZsYWcgaXMgbm90IG5lZWRlZCBzaW5jZSB0aGUgZG9tYWluICdjcmVhdGVmbGFncycgY2Fu
IG5vdyBiZSB0ZXN0ZWQKZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpD
YzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiAiUm9nZXIgUGF1IE1v
bm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cv
Y29tbW9uLmMgfCAzICstLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCAgICB8IDEgLQog
MiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jIGIveGVuL2FyY2gveDg2L21tL3No
YWRvdy9jb21tb24uYwppbmRleCAzMjBlYTBkYjIxLi4yYzdmYWZhNGZiIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFk
b3cvY29tbW9uLmMKQEAgLTYyLDcgKzYyLDYgQEAgaW50IHNoYWRvd19kb21haW5faW5pdChzdHJ1
Y3QgZG9tYWluICpkKQogCiAjaWYgKFNIQURPV19PUFRJTUlaQVRJT05TICYgU0hPUFRfT1VUX09G
X1NZTkMpCiAgICAgZC0+YXJjaC5wYWdpbmcuc2hhZG93Lm9vc19hY3RpdmUgPSAwOwotICAgIGQt
PmFyY2gucGFnaW5nLnNoYWRvdy5vb3Nfb2ZmID0gZC0+Y3JlYXRlZmxhZ3MgJiBYRU5fRE9NQ1RM
X0NERl9vb3Nfb2ZmOwogI2VuZGlmCiAgICAgZC0+YXJjaC5wYWdpbmcuc2hhZG93LnBhZ2V0YWJs
ZV9keWluZ19vcCA9IDA7CiAKQEAgLTI1MjMsNyArMjUyMiw3IEBAIHN0YXRpYyB2b2lkIHNoX3Vw
ZGF0ZV9wYWdpbmdfbW9kZXMoc3RydWN0IHZjcHUgKnYpCiAjaWYgKFNIQURPV19PUFRJTUlaQVRJ
T05TICYgU0hPUFRfT1VUX09GX1NZTkMpCiAgICAgLyogV2UgbmVlZCB0byBjaGVjayB0aGF0IGFs
bCB0aGUgdmNwdXMgaGF2ZSBwYWdpbmcgZW5hYmxlZCB0bwogICAgICAqIHVuc3luYyBQVHMuICov
Ci0gICAgaWYgKCBpc19odm1fZG9tYWluKGQpICYmICFkLT5hcmNoLnBhZ2luZy5zaGFkb3cub29z
X29mZiApCisgICAgaWYgKCBpc19odm1fZG9tYWluKGQpICYmICEoZC0+Y3JlYXRlZmxhZ3MgJiBY
RU5fRE9NQ1RMX0NERl9vb3Nfb2ZmKSApCiAgICAgewogICAgICAgICBpbnQgcGUgPSAxOwogICAg
ICAgICBzdHJ1Y3QgdmNwdSAqdnB0cjsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
ZG9tYWluLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCmluZGV4IDkzM2I4NTkwMWYu
LjVmOTg5OTQ2OWMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmgKKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaApAQCAtMTE1LDcgKzExNSw2IEBAIHN0cnVj
dCBzaGFkb3dfZG9tYWluIHsKIAogICAgIC8qIE9PUyAqLwogICAgIGJvb2xfdCBvb3NfYWN0aXZl
OwotICAgIGJvb2xfdCBvb3Nfb2ZmOwogCiAgICAgLyogSGFzIHRoaXMgZG9tYWluIGV2ZXIgdXNl
ZCBIVk1PUF9wYWdldGFibGVfZHlpbmc/ICovCiAgICAgYm9vbF90IHBhZ2V0YWJsZV9keWluZ19v
cDsKLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
