Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AF7E8EE5
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 19:01:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPVkG-0002OG-HZ; Tue, 29 Oct 2019 17:57:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPVkE-0002OB-Pl
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 17:57:26 +0000
X-Inumbo-ID: 9075a76a-fa75-11e9-bbab-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9075a76a-fa75-11e9-bbab-bc764e2007e4;
 Tue, 29 Oct 2019 17:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572371845;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PHDOqdd3Btv6Rq5lFsK2wS+5odjzlKpkCbkP56Ia6EA=;
 b=UWcDLg1t2r2zf3BMjXnFHT5FbvDp0CzrX/D11v9+R2NYNDQqWn0WY/0U
 ojYU70WxiWWWmuNTIjhLviBSxZ8DeCTkPi9zy9SIYmZLv8k9ko7fxzvtv
 bx/du+yRtW1xkd9aU0wKN9Nl8b4m1pBztKA8T8EivPoWgu5Ye6AUV6xZZ w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WVXG0aqqeHUoCZsC3YmXBcFEG0od2JTnnc0tSOThJbO0YVX9hzWxtBzLokcianfiZFXJ/6bmXS
 +1FKOeMmlXju8Ve/zucArcQop1OV7unEvPf/RL5K2ZA2IbX4ANzkA2dM8sxix84zhm8n+F9SFA
 5XAaqlRhiu/sZzkIMxuDufBw5KqTmYXiAI1nfgvQE19tQx5/qmVxodhy5h9NWGLo8NwsUt+hP8
 VofTOZ1E8qHB/N/C6sy3hxteUm6KfHR5tmOFEJyNmmpdiQCiNxbdy/y+2/LpR2BA0y/EqylqLx
 bZM=
X-SBRS: 2.7
X-MesageID: 7944013
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7944013"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 29 Oct 2019 17:57:20 +0000
Message-ID: <20191029175720.7354-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13] tools/configure: Honour
 XEN_COMPILE_ARCH and _TARGET_ for shim
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHB2c2hpbSBjYW4gb25seSBiZSBidWlsdCA2NC1iaXQgYmVjYXVzZSB0aGUgaHlwZXJ2aXNv
ciBpcyBvbmx5CjY0LWJpdCBub3dhZGF5cy4gIFRoZSBoeXBlcnZpc29yIGJ1aWxkIHN1cHBvcnRz
IFhFTl9DT01QSUxFX0FSQ0ggYW5kClhFTl9UQVJHRVRfQVJDSCB3aGljaCBvdmVycmlkZSB0aGUg
aW5mb3JtYXRpb24gZnJvbSB1bmFtZS4gIFRoZSBwdnNoaW0KYnVpbGQgcnVucyBvdXQgb2YgdGhl
IHRvb2xzLyBkaXJlY3RvcnkgYnV0IGNhbGxzIHRoZSBoeXBlcnZpc29yIGJ1aWxkCnN5c3RlbS4K
CklmIG9uZSBydW5zIGluIGEgTGludXggMzItYml0IHVzZXJsYW5kIHdpdGggYSA2NC1iaXQga2Vy
bmVsLCBvbmUgdXNlZAp0byBiZSBhYmxlIHRvIHNldCBYRU5fQ09NUElMRV9BUkNILiAgQnV0IG5v
d2FkYXlzIHRoaXMgZG9lcyBub3Qgd29yay4KY29uZmlndXJlIHNlZXMgdGhlIHRhcmdldCBjcHUg
YXMgNjQtYml0IGFuZCB0cmllcyB0byBidWlsZCBwdnNoaW0uClRoZSBidWlsZCBwcmludHMKICBl
Y2hvICIqKiogWGVuIHg4Ni8zMiB0YXJnZXQgbm8gbG9uZ2VyIHN1cHBvcnRlZCEiCmFuZCBkb2Vz
bid0IGJ1aWxkIGFueXRoaW5nLiAgVGhlbiB0aGUgc3Vic2VxdWVudCBNYWtlZmlsZXMgdHJ5IHRv
Cmluc3RhbGwgdGhlIG5vbi1idWlsdCBwaWVjZXMuCgpGaXggdGhpcyBhbm9tYWx5IGJ5IGNhdXNp
bmcgY29uZmlndXJlIHRvIGhvbm91ciB0aGUgWGVuIGh5cGVydmlzb3Igd2F5Cm9mIHNldHRpbmcg
dGhlIHRhcmdldCBhcmNoaXRlY3R1cmUuCgpJbiBwcmluY2lwbGUgdGhpcyB1c2VyIGJlaGF2aW91
ciBpcyBub3QgaGFuZGxlZCBxdWl0ZSByaWdodCwgYmVjYXVzZQpjb25maWd1cmUgd2lsbCBzdGls
bCBzZWUgNjQtYml0IGFuZCBzbyBhbGwgdGhlIGF1dG9jb25mLWJhc2VkCmFyY2hpdGVjdHVyZSB0
ZXN0aW5nIHdpbGwgc2VlIDY0LWJpdCByYXRoZXIgdGhhbiAzMi1iaXQgeDg2LiAgQnV0IHRoZQp0
b29scyBhcmUgaW4gZmFjdCBnZW5lcmFsbHkgcXVpdGUgcG9ydGFibGU6IHRoaXMgcGFydGljdWxh
ciBsb2NhdGlvbgppbiBjb25maWd1cmV7LmFjLH0gaXMgdGhlIG9ubHkgcGxhY2UgaW4gdG9vbHMv
IHdoZXJlIDY0LWJpdCB4ODYgaXMKdHJlYXRlZCBkaWZmZXJlbnRseSBmcm9tIDMyLWJpdCB4ODYs
IHNvIHRoZSBmaXggaXMgc3VmZmljaWVudCBhbmQKY29ycmVjdCBmb3IgdGhpcyB1c2UgY2FzZS4K
Ckl0IHJlbWFpbnMgdGhlIGNhc2UgdGhhdCBYRU5fQ09NUElMRV9BUkNIIG9yIFhFTl9UQVJHRVRf
QVJDSCB0byBhCm5vbi14ODYgYXJjaGl0ZWN0dXJlLCB3aGVuIGNvbmZpZ3VyZSB0aGlua3MgdGhp
bmdzIGFyZSB4ODYsIG9yIHZpY2UKdmVyc2EsIHdpbGwgbm90IHdvcmsgcmlnaHQuCgpJIGhhdmUg
cmVydW4gYXV0b2dlbi5zaCwgc28gdGhpcyBwYXRjaCBjb250YWlucyB0aGUgZml4IHRvIGNvbmZp
Z3VyZQphcyB3ZWxsIGFzIHRoZSBzb3VyY2UgZml4IHRvIGNvbmZpZ3VyZS5hYy4KClNpZ25lZC1v
ZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDQzogSsO8cmdl
biBHcm/DnyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHRvb2xzL2NvbmZpZ3VyZSAgICB8IDIgKy0K
IHRvb2xzL2NvbmZpZ3VyZS5hYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZpZ3VyZSBiL3Rvb2xz
L2NvbmZpZ3VyZQppbmRleCA4Mjk0N2FkMzA4Li5kOWNjY2U2ZDJiIDEwMDc1NQotLS0gYS90b29s
cy9jb25maWd1cmUKKysrIGIvdG9vbHMvY29uZmlndXJlCkBAIC05NzExLDcgKzk3MTEsNyBAQCBm
aQogZWxzZQogCiAgICAgY3B1PWB0ZXN0IC16ICIkdGFyZ2V0X2NwdSIgJiYgZWNobyAiJGhvc3Rf
Y3B1IiB8fCBlY2hvICIkdGFyZ2V0X2NwdSJgCi0gICAgY2FzZSAiJGNwdSIgaW4KKyAgICBjYXNl
ICIke1hFTl9DT01QSUxFX0FSQ0gtJHtYRU5fVEFSR0VUX0FSQ0gtJGNwdX19IiBpbgogICAgICAg
ICB4ODZfNjQpCiAgICAgICAgICAgIHB2c2hpbT0ieSI7OwogICAgICAgICAqKSBwdnNoaW09Im4i
OzsKZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZpZ3VyZS5hYyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwpp
bmRleCA2NzRiZDU4MDlkLi5hOGQ4Y2U1ZmZlIDEwMDY0NAotLS0gYS90b29scy9jb25maWd1cmUu
YWMKKysrIGIvdG9vbHMvY29uZmlndXJlLmFjCkBAIC00NzksNyArNDc5LDcgQEAgQUNfQVJHX0VO
QUJMRShbcHZzaGltXSwKICAgICAgICAgICAgICAgICAgICBbRGlzYWJsZSBwdnNoaW0gYnVpbGQg
KGVuYWJsZWQgYnkgZGVmYXVsdCBvbiA2NGJpdCB4ODYpXSksCiAgICAgW0FTX0lGKFt0ZXN0ICJ4
JGVuYWJsZV9wdnNoaW0iID0gInhubyJdLCBbcHZzaGltPW5dLCBbcHZzaGltPXldKV0sIFsKICAg
ICBjcHU9YHRlc3QgLXogIiR0YXJnZXRfY3B1IiAmJiBlY2hvICIkaG9zdF9jcHUiIHx8IGVjaG8g
IiR0YXJnZXRfY3B1ImAKLSAgICBjYXNlICIkY3B1IiBpbgorICAgIGNhc2UgIiR7WEVOX0NPTVBJ
TEVfQVJDSC0ke1hFTl9UQVJHRVRfQVJDSC0kY3B1fX0iIGluCiAgICAgICAgIHg4Nl82NCkKICAg
ICAgICAgICAgcHZzaGltPSJ5Ijs7CiAgICAgICAgICopIHB2c2hpbT0ibiI7OwotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
