Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C93537741
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 16:56:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYtlJ-0000K6-M7; Thu, 06 Jun 2019 14:53:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JKzC=UF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hYtlI-0000K1-9B
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 14:53:04 +0000
X-Inumbo-ID: c76f255c-886a-11e9-96f1-1bb4731b1534
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c76f255c-886a-11e9-96f1-1bb4731b1534;
 Thu, 06 Jun 2019 14:53:01 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VJBci8yLgHLq7/lsdm+c/GuKKshgW2NjrMR3o2NCWJJnhXpQfkHlKmYSdRtWalos4qrothrFBR
 kmWWXwDl5GP5iTpUXoJ37ilYZA8UUZKvbEP4KwG3F9A9aFkIzONl074+B429slRRi8E0QbMYVS
 QaUqjnlAo8iSIAa4KxDAkLDokQXS7MmASYBCoJdeXYmp/cS/8Ttc2o26WjPeynIRG3uyWNxCOr
 OX8CbMbpTXwXDNARxWmwPrdPnOxOv+8rAR1lppfCtuzR3bMS/B8wgMiAsWIxMzsqFY8504kowe
 UL4=
X-SBRS: -0.9
X-MesageID: 1413492
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1413492"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 6 Jun 2019 15:52:57 +0100
Message-ID: <1559832777-7818-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/pv: Fix undefined behaviour in
 check_descriptor()
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

VUJTQU4gcmVwb3J0czoKCiAgKFhFTikgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KICAoWEVOKSBV
QlNBTjogVW5kZWZpbmVkIGJlaGF2aW91ciBpbiB4ODZfNjQvbW0uYzoxMTA4OjMxCiAgKFhFTikg
bGVmdCBzaGlmdCBvZiAyNTUgYnkgMjQgcGxhY2VzIGNhbm5vdCBiZSByZXByZXNlbnRlZCBpbiB0
eXBlICdpbnQnCiAgKFhFTikgLS0tLVsgWGVuLTQuMTMtdW5zdGFibGUgIHg4Nl82NCAgZGVidWc9
eSAgIFRhaW50ZWQ6ICAgIEggXS0tLS0KICAoWEVOKSBDUFU6ICAgIDYwCiAgKFhFTikgUklQOiAg
ICBlMDA4Ols8ZmZmZjgyZDA4MDJhNTRjZT5dIHVic2FuLmMjdWJzYW5fZXBpbG9ndWUrMHhhLzB4
YzIKICA8c25pcD4KICAoWEVOKSBYZW4gY2FsbCB0cmFjZToKICAoWEVOKSAgICBbPGZmZmY4MmQw
ODAyYTU0Y2U+XSB1YnNhbi5jI3Vic2FuX2VwaWxvZ3VlKzB4YS8weGMyCiAgKFhFTikgICAgWzxm
ZmZmODJkMDgwMmE2MDA5Pl0gX191YnNhbl9oYW5kbGVfc2hpZnRfb3V0X29mX2JvdW5kcysweDE1
ZC8weDE2YwogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDMzYWJkNz5dIGNoZWNrX2Rlc2NyaXB0b3Ir
MHgxOTEvMHgzZGQKICAoWEVOKSAgICBbPGZmZmY4MmQwODA0ZWY5MjA+XSBkb191cGRhdGVfZGVz
Y3JpcHRvcisweDdmLzB4MmI2CiAgKFhFTikgICAgWzxmZmZmODJkMDgwNGVmYjc1Pl0gY29tcGF0
X3VwZGF0ZV9kZXNjcmlwdG9yKzB4MWUvMHgyMAogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDRmYTFj
Yz5dIHB2X2h5cGVyY2FsbCsweDg3Zi8weGE2ZgogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDUwMWFj
Yj5dIGRvX2VudHJ5X2ludDgyKzB4NTMvMHg1OAogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDUwNzAy
Yj5dIGVudHJ5X2ludDgyKzB4YmIvMHhjMAogIChYRU4pCiAgKFhFTikgPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KClN3aXRjaCB0byBhbiB1bnNpZ25lZCBzaGlmdC4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni94ODZf
NjQvbW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyBiL3hlbi9hcmNoL3g4
Ni94ODZfNjQvbW0uYwppbmRleCBkOGY1NThiLi4xNzIxZGNiIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYveDg2XzY0L21tLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCkBAIC0xMTA1
LDcgKzExMDUsNyBAQCBpbnQgY2hlY2tfZGVzY3JpcHRvcihjb25zdCBzdHJ1Y3QgZG9tYWluICpk
b20sIHNlZ19kZXNjX3QgKmQpCiAgICAgICAgICAgICAgKiAweGY2ODAwMDAwLiBFeHRlbmQgdGhl
c2UgdG8gYWxsb3cgYWNjZXNzIHRvIHRoZSBsYXJnZXIgcmVhZC1vbmx5CiAgICAgICAgICAgICAg
KiBNMlAgdGFibGUgYXZhaWxhYmxlIGluIDMyb242NCBtb2RlLgogICAgICAgICAgICAgICovCi0g
ICAgICAgICAgICBiYXNlID0gKGIgJiAoMHhmZiA8PCAyNCkpIHwgKChiICYgMHhmZikgPDwgMTYp
IHwgKGEgPj4gMTYpOworICAgICAgICAgICAgYmFzZSA9IChiICYgKDB4ZmZ1IDw8IDI0KSkgfCAo
KGIgJiAweGZmKSA8PCAxNikgfCAoYSA+PiAxNik7CiAKICAgICAgICAgICAgIGxpbWl0ID0gKGIg
JiAweGYwMDAwKSB8IChhICYgMHhmZmZmKTsKICAgICAgICAgICAgIGxpbWl0Kys7IC8qIFdlIGFk
ZCBvbmUgYmVjYXVzZSBsaW1pdCBpcyBpbmNsdXNpdmUuICovCi0tIAoyLjEuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
