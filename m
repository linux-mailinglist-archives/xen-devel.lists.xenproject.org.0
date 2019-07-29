Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7455E78BCA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:30:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4ki-0000Oa-GF; Mon, 29 Jul 2019 12:27:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs4kh-0000OS-1H
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:27:43 +0000
X-Inumbo-ID: 41b78d26-b1fc-11e9-b8e9-275bf5d2db5d
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41b78d26-b1fc-11e9-b8e9-275bf5d2db5d;
 Mon, 29 Jul 2019 12:27:40 +0000 (UTC)
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
IronPort-SDR: cX8Z9eJmHgeoWhosIk17timF7Tx0EqaEmf8wj0OKTMn68TGeNqg/UigVzITaTo6khbTHVcxQx0
 Un+6cn+JD3VYfiZ8YtrHc458GayN3Oy2TgcJpiANrzCEvps5TutR1TGdJuJ7z6/w+gygSXyT/P
 n2OsS5d4a5nZEgRMDpWGxpFC5pck45ahG+UNYa2FhgBz8sxwXkQDEZN89uc+NkIQC3sMYtjUwF
 l/eDeWJw1hE5essiW2Jqc8g0jOD6ZEV5u344XuVl0RkRFgeJ0cSITMSOunsXFd9zEN5glOY6s8
 z0Q=
X-SBRS: 2.7
X-MesageID: 3565566
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3565566"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 13:12:04 +0100
Message-ID: <20190729121204.13559-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190729121204.13559-1-andrew.cooper3@citrix.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 10/10] xen/nodemask: Drop remaining refeces
 to linux
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmaWxlIGhhcyBub3cgZGl2ZXJnZWQgY29tcGxldGVseSBmcm9tIGl0cyBMaW51eCByb290
cy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8
d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpD
QzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xv
ZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS94ZW4vbm9kZW1hc2suaCB8
IDE3ICsrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbm9kZW1hc2suaCBi
L3hlbi9pbmNsdWRlL3hlbi9ub2RlbWFzay5oCmluZGV4IGVkOTE4ZTRhOGQuLmJlNDAxNmU1NzEg
MTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9ub2RlbWFzay5oCisrKyBiL3hlbi9pbmNsdWRl
L3hlbi9ub2RlbWFzay5oCkBAIC0xLDExICsxLDExIEBACi0jaWZuZGVmIF9fTElOVVhfTk9ERU1B
U0tfSAotI2RlZmluZSBfX0xJTlVYX05PREVNQVNLX0gKKyNpZm5kZWYgWEVOX05PREVNQVNLX0gK
KyNkZWZpbmUgWEVOX05PREVNQVNLX0gKIAogLyoKICAqIE5vZGVtYXNrcyBwcm92aWRlIGEgYml0
bWFwIHN1aXRhYmxlIGZvciByZXByZXNlbnRpbmcgdGhlCiAgKiBzZXQgb2YgTm9kZSdzIGluIGEg
c3lzdGVtLCBvbmUgYml0IHBvc2l0aW9uIHBlciBOb2RlIG51bWJlci4KICAqCi0gKiBTZWUgZGV0
YWlsZWQgY29tbWVudHMgaW4gdGhlIGZpbGUgbGludXgvYml0bWFwLmggZGVzY3JpYmluZyB0aGUK
KyAqIFNlZSBkZXRhaWxlZCBjb21tZW50cyBpbiB0aGUgZmlsZSB4ZW4vYml0bWFwLmggZGVzY3Jp
YmluZyB0aGUKICAqIGRhdGEgdHlwZSBvbiB3aGljaCB0aGVzZSBub2RlbWFza3MgYXJlIGJhc2Vk
LgogICoKICAqIFRoZSBhdmFpbGFibGUgbm9kZW1hc2sgb3BlcmF0aW9ucyBhcmU6CkBAIC0yNTUs
NCArMjU1LDEzIEBAIGV4dGVybiBub2RlbWFza190IG5vZGVfb25saW5lX21hcDsKIAogI2RlZmlu
ZSBmb3JfZWFjaF9vbmxpbmVfbm9kZShub2RlKSBmb3JfZWFjaF9ub2RlX21hc2sobm9kZSwgJm5v
ZGVfb25saW5lX21hcCkKIAotI2VuZGlmIC8qIF9fTElOVVhfTk9ERU1BU0tfSCAqLworI2VuZGlm
IC8qIFhFTl9OT0RFTUFTS19IICovCisKKy8qCisgKiBMb2NhbCB2YXJpYWJsZXM6CisgKiBtb2Rl
OiBDCisgKiBjLWZpbGUtc3R5bGU6ICJCU0QiCisgKiBjLWJhc2ljLW9mZnNldDogNAorICogaW5k
ZW50LXRhYnMtbW9kZTogbmlsCisgKiBFbmQ6CisgKi8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
