Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3108E1665F0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 19:13:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4qGL-00026K-35; Thu, 20 Feb 2020 18:09:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K2d/=4I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1j4qGK-00026E-25
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 18:09:24 +0000
X-Inumbo-ID: 1e612abe-540c-11ea-8575-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e612abe-540c-11ea-8575-12813bfff9fa;
 Thu, 20 Feb 2020 18:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582222162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zlG350Msj7FLYeUU90FmQ5Cnb3irM8P0wm5d6Jmkwbg=;
 b=dfUet1OkXjr6c1oC8SAmPAy2801nrlOvIraTL8KO5UWBA3JoQyvwdIY6
 Hd+hpWqR8RPBYAW7jH0/22lpukw4a2bWOZRqfq7g46a3awOKm2G9I6cFB
 gBW4drfWtGjmNRx6pvBdSAB1N9xblXS4mN93qEcgPJQJx3f4eubMPpFkl 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 97ounxRcd5M2Dm5BpqD26AJRA6CibPsAHs2EZB2EeFc4VAV27CEMXcW6cu7qoErMjes/QuC9Am
 dUTiSOM4ZlYs7Qf+wn7NmTC12sON+GdrgkjGh907Q0rpdnGRElyAO9JXoAB/GiaRBGL9fRda8b
 vme8iTSEu4qjQnpuRrgrwIRQSL+/VLQReXgHEov7q+IMyjUgRRmcHJRv43uGttWLL33MYdf6ij
 TdkCE29WqU7WLkwGOWE4FOjIyajmqrMZ8WHT9alwrIrkaIBQkVtKsL94lh9Ss5iNWF1h0MNzZw
 DWY=
X-SBRS: 2.7
X-MesageID: 13204038
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,465,1574139600"; d="scan'208";a="13204038"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 20 Feb 2020 18:09:17 +0000
Message-ID: <20200220180917.2988821-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] MAINTAINERS: Step back to designated reviewer
 for mm/
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBoYXZpbmcgdG8gdGFrZSBvdmVyIExhcnMnIHJvbGUgYXMgY29tbXVuaXR5IG1hbmFnZXIs
IEkgZG9uJ3QgaGF2ZQp0aGUgbmVjZXNzYXJ5IHRpbWUgdG8gcmV2aWV3IHRoZSBtbS8gc3Vic3lz
dGVtLiAgU3RlcCBiYWNrIHRvIGJlaW5nIG9ubHkKYSBkZXNpZ25hdGVkIHJldmlld2VyLCByZXZl
cnRpbmcgbWFudGFpbmVyc2hpcCB0byB0aGUgeDg2IG1haW50aWFuZXJzLgoKV2hpbGUgaGVyZSwg
Zml4IG15IGUtbWFpbCBhZGRyZXNzIGluIG90aGVyIHBsYWNlcy4KClNpZ25lZC1vZmYtYnk6IEdl
b3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0tCkNDOiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgpDQzogS29ucmFkIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5j
b20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIE1BSU5UQUlORVJTIHwgMTAg
KysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDQ2NDI0YzE4
MzMuLmEyYTNlOGQ3ZDIgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJT
CkBAIC00MzksNyArNDM5LDcgQEAgUzoJU3VwcG9ydGVkCiBGOgl4ZW4vY29tbW9uL3NjaGVkL3J0
LmMKIAogU0NIRURVTElORwotTToJR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRy
aXguY29tPgorTToJR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgogTToJ
RGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KIFM6CVN1cHBvcnRlZAogRjoJeGVu
L2NvbW1vbi9zY2hlZC8KQEAgLTU0NCw3ICs1NDQsOSBAQCBGOgl4ZW4vaW5jbHVkZS9hc20teDg2
L2h2bS9pb3JlcS5oCiBGOgl4ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2lvcmVxLmgKIAogWDg2IE1F
TU9SWSBNQU5BR0VNRU5UCi1NOglHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJp
eC5jb20+CitNOglKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CitNOglBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgorUjoJR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPgogUzoJU3VwcG9ydGVkCiBGOgl4ZW4vYXJjaC94ODYvbW0vCiAK
QEAgLTU3NSw3ICs1NzcsNyBAQCBGOgl4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10
bGZzLmgKIEY6CXhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZpcmlkaWFuLmgKIAogWEVOVFJBQ0UK
LU06CUdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KK006CUdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KIFM6CVN1cHBvcnRlZAogRjoJdG9v
bHMveGVudHJhY2UvCiBGOgl4ZW4vY29tbW9uL3RyYWNlLmMKQEAgLTU5MSw3ICs1OTMsNyBAQCBG
Oglkb2NzL21pc2MveHNtLWZsYXNrLnR4dAogCiBUSEUgUkVTVAogTToJQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLU06CUdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5s
YXBAZXUuY2l0cml4LmNvbT4KK006CUdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT4KIE06CUlhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgogTToJSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgogTToJSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4KLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
