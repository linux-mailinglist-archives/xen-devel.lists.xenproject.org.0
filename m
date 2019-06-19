Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80084C227
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 22:14:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdgvn-0002ho-6r; Wed, 19 Jun 2019 20:11:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iLMg=US=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdgvk-0002hW-Pu
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 20:11:40 +0000
X-Inumbo-ID: 71c4e380-92ce-11e9-b927-c797f0bb5d13
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71c4e380-92ce-11e9-b927-c797f0bb5d13;
 Wed, 19 Jun 2019 20:11:38 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NhalVcVCJzicGN5mcRtjgmhMgsv4RWwzijn2PgFDdcUt2rGmKuZyP7L1U+S7g0D8J6Wiq6ApFh
 u2Twom13SvBqYFg5QEdfDJaV9+PB0E86Xu84ViEriCABocQorWMDB6IpQ5mFafHdLe5PC2kCdE
 9wtFZjSm48WrCrz5EpsDMam7eLS0JtzJeC/Ev6JcBcNiJDx8dTKuO3BlEKMbEWi82Eig4SymJO
 Us6kXzTiZkBCU0WKJqGyJqJf37cOMJ7FBNVVtDeBGz+CPGPWH+jo0vt3uX/K4xLgfQGe1+P26i
 oeU=
X-SBRS: 2.7
X-MesageID: 1983437
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,394,1557201600"; 
   d="scan'208";a="1983437"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 19 Jun 2019 21:11:25 +0100
Message-ID: <1560975087-25632-3-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] xen/link: Link .data.schedulers and
 CONSTRUCTERS in more appropriate locations
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
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TmVpdGhlciBvZiB0aGVzZSBzaG91bGQgbGl2ZSBpbiAuZGF0YQoKICogLmRhdGEuc2NoZWR1bGVy
cyBpcyBvbmx5IGV2ZXIgcmVhZCwgc28gaXMgbW92ZWQgaW50byAucm9kYXRhCiAqIENPTlNUUlVD
VE9SUyBpcyBvbmx5IGV2ZXIgcmVhZCwgYW5kIG9ubHkgYXQgYm9vdCwgc28gaXMgbW92ZWQgdG8g
YmVzaWRlCiAgIC5pbml0LnJvZGF0YQoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhl
bi9hcmNoL2FybS94ZW4ubGRzLlMgfCAxMSArKysrKystLS0tLQogeGVuL2FyY2gveDg2L3hlbi5s
ZHMuUyB8IDExICsrKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMgYi94
ZW4vYXJjaC9hcm0veGVuLmxkcy5TCmluZGV4IDMxZDc0YTguLjJiNDRlNWQgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKKysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwpAQCAt
NjYsNiArNjYsMTEgQEAgU0VDVElPTlMKICAgICAgICAqKC5kYXRhLnBhcmFtKQogICAgICAgIF9f
cGFyYW1fZW5kID0gLjsKIAorICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsKKyAgICAg
ICBfX3N0YXJ0X3NjaGVkdWxlcnNfYXJyYXkgPSAuOworICAgICAgICooLmRhdGEuc2NoZWR1bGVy
cykKKyAgICAgICBfX2VuZF9zY2hlZHVsZXJzX2FycmF5ID0gLjsKKwogICAgICAgIF9fcHJvY19p
bmZvX3N0YXJ0ID0gLjsKICAgICAgICAqKC5wcm9jLmluZm8pCiAgICAgICAgX19wcm9jX2luZm9f
ZW5kID0gLjsKQEAgLTkyLDEyICs5Nyw3IEBAIFNFQ1RJT05TCiAgICAgICAgLiA9IEFMSUdOKFBB
R0VfU0laRSk7CiAgICAgICAgKiguZGF0YS5wYWdlX2FsaWduZWQpCiAgICAgICAgKiguZGF0YSkK
LSAgICAgICAuID0gQUxJR04oOCk7Ci0gICAgICAgX19zdGFydF9zY2hlZHVsZXJzX2FycmF5ID0g
LjsKLSAgICAgICAqKC5kYXRhLnNjaGVkdWxlcnMpCi0gICAgICAgX19lbmRfc2NoZWR1bGVyc19h
cnJheSA9IC47CiAgICAgICAgKiguZGF0YS4qKQotICAgICAgIENPTlNUUlVDVE9SUwogICB9IDp0
ZXh0CiAKICAgLiA9IEFMSUdOKFNNUF9DQUNIRV9CWVRFUyk7CkBAIC0xNTQsNiArMTU0LDcgQEAg
U0VDVElPTlMKICAgLmluaXQuZGF0YSA6IHsKICAgICAgICAqKC5pbml0LnJvZGF0YSkKICAgICAg
ICAqKC5pbml0LnJvZGF0YS4qKQorICAgICAgIENPTlNUUlVDVE9SUwogCiAgICAgICAgLiA9IEFM
SUdOKFBPSU5URVJfQUxJR04pOwogICAgICAgIF9fc2V0dXBfc3RhcnQgPSAuOwpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKaW5kZXgg
ZWMzN2QzOC4uOWZhNmM5OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUworKysg
Yi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCkBAIC0xNDAsNiArMTQwLDExIEBAIFNFQ1RJT05TCiAg
ICAgICAgKiguZGF0YS5wYXJhbSkKICAgICAgICBfX3BhcmFtX2VuZCA9IC47CiAKKyAgICAgICAu
ID0gQUxJR04oUE9JTlRFUl9BTElHTik7CisgICAgICAgX19zdGFydF9zY2hlZHVsZXJzX2FycmF5
ID0gLjsKKyAgICAgICAqKC5kYXRhLnNjaGVkdWxlcnMpCisgICAgICAgX19lbmRfc2NoZWR1bGVy
c19hcnJheSA9IC47CisKICNpZiBkZWZpbmVkKENPTkZJR19IQVNfVlBDSSkgJiYgZGVmaW5lZChD
T05GSUdfTEFURV9IV0RPTSkKICAgICAgICAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7CiAgICAg
ICAgX19zdGFydF92cGNpX2FycmF5ID0gLjsKQEAgLTIwNyw2ICsyMTIsNyBAQCBTRUNUSU9OUwog
CiAgICAgICAgKiguaW5pdC5yb2RhdGEpCiAgICAgICAgKiguaW5pdC5yb2RhdGEuKikKKyAgICAg
ICBDT05TVFJVQ1RPUlMKIAogICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsKICAgICAg
ICBfX3NldHVwX3N0YXJ0ID0gLjsKQEAgLTI2MSwxNyArMjY3LDEyIEBAIFNFQ1RJT05TCiAgIC4g
PSBBTElHTihTTVBfQ0FDSEVfQllURVMpOwogICBERUNMX1NFQ1RJT04oLmRhdGEucmVhZF9tb3N0
bHkpIHsKICAgICAgICAqKC5kYXRhLnJlYWRfbW9zdGx5KQotICAgICAgIC4gPSBBTElHTig4KTsK
LSAgICAgICBfX3N0YXJ0X3NjaGVkdWxlcnNfYXJyYXkgPSAuOwotICAgICAgICooLmRhdGEuc2No
ZWR1bGVycykKLSAgICAgICBfX2VuZF9zY2hlZHVsZXJzX2FycmF5ID0gLjsKICAgfSA6dGV4dAog
CiAgIERFQ0xfU0VDVElPTiguZGF0YSkgewogICAgICAgICooLmRhdGEucGFnZV9hbGlnbmVkKQog
ICAgICAgICooLmRhdGEpCiAgICAgICAgKiguZGF0YS4qKQotICAgICAgIENPTlNUUlVDVE9SUwog
ICB9IDp0ZXh0CiAKICAgREVDTF9TRUNUSU9OKC5ic3MpIHsKLS0gCjIuMS40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
