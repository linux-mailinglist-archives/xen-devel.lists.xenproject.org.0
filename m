Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A222C17E3E5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 16:46:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBKYt-000775-FG; Mon, 09 Mar 2020 15:43:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8knV=42=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jBKYs-000770-1R
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 15:43:22 +0000
X-Inumbo-ID: b41440aa-621c-11ea-8f6d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b41440aa-621c-11ea-8f6d-bc764e2007e4;
 Mon, 09 Mar 2020 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583768602;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p5EV/RGkFtkIqEYMmHHoJlpRZJsp/e2siF8S72RTPpQ=;
 b=S/bJQtXxo8nkO04XfG6RIz7vzTAF1tysK4lDM4aDQaFXDfFfj4IIeefI
 z/SQrhyCj0YPVMlP4LIv+2rCu/A/nCbgODgMgCGKeM8COSq2j40Uavagq
 6w35F6b2XPFo27Y99/7yzQO+5PzNRdlQilaC+QiqQR5Nv/g5J72vRt3ug g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jgsj5LMgOun/6ercpl3I9B+TuEqlJFVxyibvuu/lPrjMUb8Za0i99pjKE92vh6Rj0cJs4Ab1J6
 9EqKM97xmAqZI5lVA8PFt4UXrInkboYlIrdIhwWL2Ep+x40W2GvC4c+bNkQSai3aphKZuP2lUG
 Qh9F8Nv7BBTMIIjgRlgUMUpz8ui+7OpyOUH0GdpXNH3PcPNEBug35weJjrY3t8eAzQUQhpbsWv
 0Zq92I8xRN0uTnXSwAtV2+9XF/gYcZi94jtRQ+b5Q/Z4ljVDJ7RSpDwH7KEgjkycPMBIS71J9Y
 4Ko=
X-SBRS: 2.7
X-MesageID: 13649192
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,533,1574139600"; d="scan'208";a="13649192"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Mar 2020 15:43:14 +0000
Message-ID: <20200309154314.16432-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] ts-*logs*: Capture xl dmesg,
 and save it from host examination
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <royger@FreeBSD.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJveWdlckBGcmVlQlNELm9yZz4KQ0M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLWV4YW1pbmUtbG9ncy1zYXZlIHwg
MyArKy0KIHRzLWxvZ3MtY2FwdHVyZSAgICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3RzLWV4YW1pbmUtbG9ncy1z
YXZlIGIvdHMtZXhhbWluZS1sb2dzLXNhdmUKaW5kZXggMGM5NzMzMGIuLjU4ODIzNjIwIDEwMDc1
NQotLS0gYS90cy1leGFtaW5lLWxvZ3Mtc2F2ZQorKysgYi90cy1leGFtaW5lLWxvZ3Mtc2F2ZQpA
QCAtODMsNyArODMsOCBAQCBzdWIgc2F2ZV9sb2dzICgpIHsKIAkJCS1vdXRwdXQtY2F0XyNwcm9j
I3BhcnRpdGlvbnMKIAkJCS1vdXRwdXQtaWZjb25maWcKIAkJCS1vdXRwdXQtbHNwY2lfLXR2Ci0J
CQktb3V0cHV0LXhsX2luZm9fLW4pKSB7CisJCQktb3V0cHV0LXhsX2luZm9fLW4KKwkJCS1vdXRw
dXQteGxfZG1lc2cpKSB7CiAJbXkgJHJlID0gJHBhdDsKIAkkcmUgPX4gcy9eLS9cUSRoby0+e05h
bWV9XEUtLzsKIAlwdXNoIEByZSwgIl4kcmVcJCI7CmRpZmYgLS1naXQgYS90cy1sb2dzLWNhcHR1
cmUgYi90cy1sb2dzLWNhcHR1cmUKaW5kZXggODMyMzRmNmYuLmQxNjM3MmYyIDEwMDc1NQotLS0g
YS90cy1sb2dzLWNhcHR1cmUKKysrIGIvdHMtbG9ncy1jYXB0dXJlCkBAIC0xOTEsNiArMTkxLDcg
QEAgc3ViIGZldGNoX2xvZ3NfaG9zdCAoKSB7CiAKICAgICBmb3JlYWNoIG15ICRjbWQKICAgICAg
ICAgKAorICAgICAgICAgJ3hsIGRtZXNnJywKICAgICAgICAgICd4bCBpbmZvIC1uJywKICAgICAg
ICAgICdjYXQgL3Byb2MvY3B1aW5mbycsCiAgICAgICAgICAneGwgbGlzdCcsCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
