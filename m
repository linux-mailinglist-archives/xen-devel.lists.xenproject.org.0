Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96D521C36
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 19:08:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRgIz-00078a-H6; Fri, 17 May 2019 17:06:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3oPk=TR=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRgIx-00078V-S4
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 17:05:59 +0000
X-Inumbo-ID: 0a03959f-78c6-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0a03959f-78c6-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 17:05:58 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: TER6KUlPmSRG6jjY3rcWCT3l8v+WLx8xCYm/2dElmh20QkwzKX4/l/Etp7qF0dbL7ah57aJHAR
 kA1kvkrSlbdIMnKJa1IYQm5DTDSboj8hffo9ur8IHNiE/f1Q9xb6DrWBikiFOypPBAtY6zGk0P
 txjfnu2pkUCaRl/NQpwOj1YIn0z8whcy2Vauvm6n9MoDs/ALLBrszgLf0N98rA5CJxqHF4HRG3
 JzSgDcZxqxRKo0jZXi5mVj3tXxkqODs3BBVlX7sF66DC2gH5M8btvS3eNb5yjQG62n5JP9LLJi
 PuY=
X-SBRS: 2.7
X-MesageID: 581591
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="581591"
From: Wei Liu <wei.liu2@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 17 May 2019 18:05:55 +0100
Message-ID: <20190517170555.17423-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxl: fix libxl_domain_need_memory after
 899433f149d
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgODk5NDMzZjE0OWQgbGlieGwgbmVlZHMgdG8ga25vdyB0aGUgY29udGVudCBvZiBkX2Nv
bmZpZyB0bwpkZXRlcm1pbmUgd2hpY2ggUUVNVSBpcyB1c2VkLiBUaGUgY29kZSBpcyBjaGFuZ2Vk
IHN1Y2ggdGhhdApsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2VfbW9kZWwgbmVlZHMgdG8gYmUgY2Fs
bGVkIGJlZm9yZQpsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdC4KClRoaXMgaXMg
ZmluZSBmb3IgbGlieGwgY29kZSwgYnV0IGl0IGlzIHByb2JsZW1hdGljIGZvcgpsaWJ4bF9kb21h
aW5fbmVlZF9tZW1vcnksIHdoaWNoIGlzIHRoZSBvbmx5IHB1YmxpYyBBUEkgdGhhdCB0YWtlcyBh
CmJ1aWxkX2luZm8uIFRvIGF2b2lkIGJyZWFrIGl0cyB1c2VycywgcHJvdmlkZSBhIGNvbXBhdGli
aWxpdHkgc2V0dGluZwppbnNpZGUgdGhhdCBmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+CkNjOiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+CkNjOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KClBsZWFzZSB0ZXN0LgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX21lbS5j
IHwgMTggKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jIGIvdG9vbHMvbGlieGwvbGli
eGxfbWVtLmMKaW5kZXggNDQ4YTJhZjhmZC4uZmUxZjljMmZmOCAxMDA2NDQKLS0tIGEvdG9vbHMv
bGlieGwvbGlieGxfbWVtLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMKQEAgLTQ1Nyw2
ICs0NTcsMjQgQEAgaW50IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeShsaWJ4bF9jdHggKmN0eCwK
ICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb19pbml0KGJfaW5mbyk7CiAgICAgbGlieGxfZG9t
YWluX2J1aWxkX2luZm9fY29weShjdHgsIGJfaW5mbywgYl9pbmZvX2luKTsKIAorICAgIC8qCisg
ICAgICogSXQgaGFzIGJlY29tZSBhIHJlcXVpcmVtZW50IHRoYXQgdG8gZmlndXJlIG91dCB3aGlj
aCBRRU1VIHRvCisgICAgICogdXNlLCBsaWJ4bCB3aWxsIG5lZWQgdG8gcGVlayBkX2NvbmZpZydz
IGNvbnRlbnQuIFRoZSBjb2RlIGhhcworICAgICAqIGJlZW4gY2hhbmdlZCBzdWNoIHRoYXQgb25l
IHdpbGwgbmVlZCB0byBjYWxsCisgICAgICogbGlieGxfX2RvbWFpbl9zZXRfZGV2aWNlX21vZGVs
IGJlZm9yZSBjYWxsaW5nCisgICAgICogbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1
bHQgaW5zaWRlIGxpYnhsLgorICAgICAqCisgICAgICogVGhpcyAocHJvYmxlbWF0aWMpIHB1Ymxp
YyBBUEkgaXMgdGhlIG9ubHkgb25lIHdoaWNoIHRha2VzIGEKKyAgICAgKiBiX2luZm8sIGltcG9z
aW5nIHRoZSBzYW1lIHJlcXVpcmVtZW50IG9uIHRoZSB1c2VycyBvZiB0aGlzCisgICAgICogcHVi
bGljIEFQSSB3aWxsIGJyZWFrIHRoZW0uCisgICAgICoKKyAgICAgKiBQcm92aWRlIGEgY29tcGF0
aWJpbGl0eSBzZXR0aW5nIGZvciB0aGlzIGZ1bmN0aW9uLiBUaGUKKyAgICAgKiBjYWxjdWxhdGlv
biBkb2Vzbid0IHJlYWxseSBjYXJlIHdoaWNoIFFFTVUgaXMgc2V0IGhlcmUsIHNvIHdlCisgICAg
ICogZ28gd2l0aCB0aGUgdXBzdHJlYW0gZGVmYXVsdC4KKyAgICAgKi8KKyAgICBpZiAoIWJfaW5m
by0+ZGV2aWNlX21vZGVsX3ZlcnNpb24pCisJYl9pbmZvLT5kZXZpY2VfbW9kZWxfdmVyc2lvbiA9
IExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1FFTVVfWEVOOworCiAgICAgcmMgPSBsaWJ4bF9f
ZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdChnYywgYl9pbmZvKTsKICAgICBpZiAocmMpIGdv
dG8gb3V0OwogCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
