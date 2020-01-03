Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 475DB12F8A1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 14:08:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inMew-000455-Md; Fri, 03 Jan 2020 13:06:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inMev-00044s-2u
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 13:06:33 +0000
X-Inumbo-ID: d76898d4-2e29-11ea-a914-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d76898d4-2e29-11ea-a914-bc764e2007e4;
 Fri, 03 Jan 2020 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578056784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=iIhNZh3H3QETi04fBEQQiQ/Nu8djEopkhydQ7p5z6C8=;
 b=FaTDhf2qQDgnHpWuB1Nh+y4g1XFCozQOh61vNH4CVvSxsh917d33xAWK
 JenJnEsfY5embhhDWXGqCE0/O3Cox3ohbW77t1zJKofHUYSXdV2VoikTZ
 HO2xvQaqMc1QgUdey3tmFd5eYeGsttT39qyKksBXK6PXf5S5SPsVI1Ika E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WsEqwiUcIrLTMOgDani+MtxiLWfrpvijNIW+gpvvkx097GGB6zjA0dzcp4Za4CLeU2lYZhb0Ty
 lj9tcC07jnZ6HcSTPjyuSaiGiRsGrKAh2lHZG/UAbb2uTigzBegdQ5c4v+wzQgeB9DCmX3l5FQ
 mWBw9jzANTVpDlPMcR/QEURVTIpxrWbEOLuFkA5JBxm+XoYlBZAm2PWhYWi2x3AqX2RcjSmgTB
 ddMlpeThLhR6vqiTTPu3s1SlHcDCZGc6Q9KKyGBXEP+k8X+uJpXJ86EdA7hHpgaEUCoszRRQHJ
 ypM=
X-SBRS: 2.7
X-MesageID: 10571931
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,390,1571716800"; d="scan'208";a="10571931"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 3 Jan 2020 13:06:10 +0000
Message-ID: <20200103130616.13724-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191224151932.6304-1-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] Use CPUID/MSR data from migration streams
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0aGUgaW5jcmVtZW50YWwgd29yayB0byAiU3VwcG9ydCBDUFVJRC9NU1IgZGF0YSBp
biBtaWdyYXRpb24gc3RyZWFtcyIKd2hpY2gganVnZ2xlcyBsaWJ4bCBzdWZmaWNpZW50bHkgdG8g
YWxsb3cgdXMgdG8gdXNlIHRoZSBkYXRhIHNlbnQgaW4gbWlncmF0aW9uCnN0cmVhbXMuCgpUaGUg
dHdvIHBhdGNoZXM6CiAgdG9vbHMvbGlieGw6IENvZGUtZ2VuIGltcHJvdmVtZW50cyBmb3IgbGli
eGxfc2F2ZV9tc2dzX2dlbi5wbAogIHRvb2xzL2xpYnhsOiBSZXBvc2l0aW9uIGJ1aWxkX3ByZSgp
IGxvZ2ljIGJldHdlZW4gYXJjaGl0ZWN0dXJlcwoKcG9zdGVkIGluZGVwZW5kZW50bHkgYXJlIGxv
Z2ljYWxseSBwYXRjaGVzIDEzLzE0IG9mIHRoZSBzZXJpZXMsIGFuZCB0aGVzZSBzaXgKbWFrZSBp
dCB1cCB0byAyMC4KCkZ1dHVyZSB2ZXJzaW9ucyBvZiB0aGUgc2VyaWVzLCBpZiBuZWNlc3Nhcnks
IHdpbGwgcG9zdCB0aGVtIGFsbCB0b2d0aGVyLgoKQW5kcmV3IENvb3BlciAoNik6CiAgZml4dXAg
dG9vbHMvbWlncmF0aW9uOiBGb3JtYXR0aW5nIGFuZCBzdHlsZSBjbGVhbnVwCiAgdG9vbHMvbGli
eGw6IFNpbXBsaWZ5IGNhbGxiYWNrIGhhbmRsaW5nIGluIGxpYnhsLXNhdmUtaGVscGVyCiAgdG9v
bHMvbGlieFtjbF06IFBsdW1iIHN0YXRpY19kYXRhX2RvbmUoKSB1cCBpbnRvIGxpYnhsCiAgdG9v
bHMvbGlieGw6IFBsdW1iIGRvbWFpbl9jcmVhdGVfc3RhdGUgZG93biBpbnRvIGxpYnhsX19idWls
ZF9wcmUoKQogIHRvb2xzL2xpYnhsOiBSZS1wb3NpdGlvbiBDUFVJRCBoYW5kbGluZyBkdXJpbmcg
ZG9tYWluIGNvbnN0cnVjdGlvbgogIHRvb2xzL2xpYnhjOiBSZXN0b3JlIENQVUlEL01TUiBkYXRh
IGZvdW5kIGluIHRoZSBtaWdyYXRpb24gc3RyZWFtCgogdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5n
dWVzdC5oICAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogdG9v
bHMvbGlieGMveGNfc3JfY29tbW9uX3g4Ni5jICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tCiB0b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlLmMgICAgICAgIHwgIDEgKwogdG9v
bHMvbGlieGMveGNfc3Jfc2F2ZS5jICAgICAgICAgICB8ICA4ICsrKy0tLS0KIHRvb2xzL2xpYnhs
L2xpYnhsX2NyZWF0ZS5jICAgICAgICAgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfZG0uYyAgICAgICAgICAgICB8ICA1ICsrKy0t
CiB0b29scy9saWJ4bC9saWJ4bF9kb20uYyAgICAgICAgICAgIHwgMTYgKysrKysrKystLS0tLQog
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCAgICAgICB8IDExICsrKystLS0tLQogdG9vbHMv
bGlieGwvbGlieGxfc2F2ZV9oZWxwZXIuYyAgICB8IDE1ICsrKysrLS0tLS0tLS0KIHRvb2xzL2xp
YnhsL2xpYnhsX3NhdmVfbXNnc19nZW4ucGwgfCAgMyArKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDEz
MCBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
