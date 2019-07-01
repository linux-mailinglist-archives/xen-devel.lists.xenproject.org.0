Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFC85B970
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 12:51:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhts2-00062j-D4; Mon, 01 Jul 2019 10:49:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tezJ=U6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hhts1-00062Y-FC
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 10:49:13 +0000
X-Inumbo-ID: da26f382-9bed-11e9-ac92-4723d51b6d21
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da26f382-9bed-11e9-ac92-4723d51b6d21;
 Mon, 01 Jul 2019 10:49:08 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IlpH73wbgUqHqUYN2A8SgtXBCHo8FkY1Qz3mtGYfmsQVTtnmcC4HvqHoG6269nLHakLa3lve44
 aWEH3+wHN/jtlTfWIgZx/ZcnYx4yIOCmmmT4hCHncj0FpgvXGT4pkRkc4lt3hFvX4L6nTfnW3J
 mK79rgi4l2e8lN2iYbyT7La2+EeKKPgDUbwl/y3tE/e9hnZd2apkQZ8o5H17JN5bgHY5Uco+UP
 sC/c4N9D0QULwbie6bLLuy540RIQ9Kqc/X79PXywMuUPi4o0iTJUojJCQssmQgZWYrXNmDMYy1
 cGs=
X-SBRS: 2.7
X-MesageID: 2454098
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,439,1557201600"; 
   d="scan'208";a="2454098"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 1 Jul 2019 12:49:03 +0200
Message-ID: <20190701104903.72364-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xstate: make use_xsave non-init
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

TExWTSBjb2RlIGdlbmVyYXRpb24gY2FuIGF0dGVtcHQgdG8gbG9hZCBmcm9tIGEgdmFyaWFibGUg
aW4gdGhlIG5leHQKY29uZGl0aW9uIG9mIGFuIGV4cHJlc3Npb24gdW5kZXIgY2VydGFpbiBjaXJj
dW1zdGFuY2VzLCB0aHVzCmF0dGVtcHRpbmcgdG8gbG9hZCB1c2VfeHNhdmUgcmVnYXJkbGVzcyBv
ZiB0aGUgdmFsdWUgb2YgdGhlIGJzcAp2YXJpYWJsZSwgd2hpY2ggbGVhZHMgdG8gYSBwYWdlIGZh
dWx0IHdoZW4gdGhlIGluaXQgc2VjdGlvbiBoYXMKYWxyZWFkeSBiZWVuIHVubWFwcGVkLgoKRml4
IHRoaXMgYnkgbWFraW5nIHVzZV94c2F2ZSBub24taW5pdCwgdGh1cyBwcmV2ZW50aW5nIHRoZSBw
YWdlIGZhdWx0LgpUaGUgTExWTSBidWcgd2l0aCB0aGUgZGlzY3Vzc2lvbiBhYm91dCB0aGlzIGlz
c3VlIGNhbiBiZSBmb3VuZCBhdDoKCmh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9Mzk3MDcKClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgotLS0KIHhlbi9hcmNoL3g4Ni94c3RhdGUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94
c3RhdGUuYyBiL3hlbi9hcmNoL3g4Ni94c3RhdGUuYwppbmRleCAzMjkzZWY4MzRmLi42YTczNTMx
MDliIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYveHN0YXRlLmMKKysrIGIveGVuL2FyY2gveDg2
L3hzdGF0ZS5jCkBAIC01NzcsNyArNTc3LDcgQEAgdW5zaWduZWQgaW50IHhzdGF0ZV9jdHh0X3Np
emUodTY0IHhjcjApCiAvKiBDb2xsZWN0IHRoZSBpbmZvcm1hdGlvbiBvZiBwcm9jZXNzb3IncyBl
eHRlbmRlZCBzdGF0ZSAqLwogdm9pZCB4c3RhdGVfaW5pdChzdHJ1Y3QgY3B1aW5mb194ODYgKmMp
CiB7Ci0gICAgc3RhdGljIGJvb2wgX19pbml0ZGF0YSB1c2VfeHNhdmUgPSB0cnVlOworICAgIHN0
YXRpYyBib29sIHVzZV94c2F2ZSA9IHRydWU7CiAgICAgYm9vbGVhbl9wYXJhbSgieHNhdmUiLCB1
c2VfeHNhdmUpOwogCiAgICAgYm9vbCBic3AgPSBjID09ICZib290X2NwdV9kYXRhOwotLSAKMi4y
MC4xIChBcHBsZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
