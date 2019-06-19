Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4074B6AF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:06:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdYN3-0002Ex-Oo; Wed, 19 Jun 2019 11:03:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XeE9=US=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdYN1-0002Ed-AN
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:03:15 +0000
X-Inumbo-ID: d5abb5b7-9281-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d5abb5b7-9281-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 11:03:14 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VYZNi5pZ5GedzBUYfRoB/U/UFai0d0AnDWXNaIa31JUrD8P02TdjHiifq3dM15nHAK0Kb3HjkY
 nQYyOBcQGHTeiXIDM/5tAZZyyVpubDAQN8VgWSNBga5QBCpN4td3PwYdRfK+oL3lgD6zH2hg1y
 sLcKsE40tN1bPFD//QIpAJBozQQsnOfweCBb/NB+XFU89xS3BNbtn8HiM4tvVuq6WQwiMnSc1+
 UyatOMjDLUuhvprqooZ2YXDptyFCmy/Xj1PPMOAUNPzjsmxlkXaoyp6wCbz1HR4Ao2uGVESj/8
 dDw=
X-SBRS: 2.7
X-MesageID: 1926705
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1926705"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Jun 2019 13:02:48 +0200
Message-ID: <20190619110250.18881-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190619110250.18881-1-roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] x86/linker: use DECL_SECTION uniformly
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

UmVwbGFjZSB0aGUgdHdvIG9wZW4tY29kZWQgRUZJIHJlbGF0ZWQgc2VjdGlvbiBkZWNsYXJhdGlv
bnMgd2l0aCB0aGUKdXNhZ2Ugb2YgREVDTF9TRUNUSU9OLiBUaGlzIGlzIGEgcHJlcGFyYXRvcnkg
Y2hhbmdlIGZvciBhbHNvIGFkZGluZyBhCnJlbG9jIHNlY3Rpb24gdG8gdGhlIEVMRiBiaW5hcnku
CgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
LS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0t
CiB4ZW4vYXJjaC94ODYveGVuLmxkcy5TIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ZW4u
bGRzLlMgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCmluZGV4IGNiNDJkYzhmZGEuLjk4YTk5NDQ0
YzIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKKysrIGIveGVuL2FyY2gveDg2
L3hlbi5sZHMuUwpAQCAtMjk4LDEyICsyOTgsMTIgQEAgU0VDVElPTlMKIAogI2lmZGVmIEVGSQog
ICAuID0gQUxJR04oNCk7Ci0gIC5yZWxvYyA6IHsKKyAgREVDTF9TRUNUSU9OKC5yZWxvYykgewog
ICAgICooLnJlbG9jKQogICB9IDp0ZXh0CiAgIC8qIFRyaWNrIHRoZSBsaW5rZXIgaW50byBzZXR0
aW5nIHRoZSBpbWFnZSBzaXplIHRvIGV4YWN0bHkgMTZNYi4gKi8KICAgLiA9IEFMSUdOKF9fc2Vj
dGlvbl9hbGlnbm1lbnRfXyk7Ci0gIC5wYWQgOiB7CisgIERFQ0xfU0VDVElPTigucGFkKSB7CiAg
ICAgLiA9IEFMSUdOKE1CKDE2KSk7CiAgIH0gOnRleHQKICNlbmRpZgotLSAKMi4yMC4xIChBcHBs
ZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
