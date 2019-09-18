Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64363B67D9
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 18:17:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAcaw-0004BY-9L; Wed, 18 Sep 2019 16:14:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bm4j=XN=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAcau-0004BC-Nl
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 16:14:16 +0000
X-Inumbo-ID: 5a1fe7fe-da2f-11e9-963c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a1fe7fe-da2f-11e9-963c-12813bfff9fa;
 Wed, 18 Sep 2019 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568823253;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=V2xEulYZR53SyAEl4/oduUhssb81FbTNQ1iN/Fe4JvY=;
 b=Rd48+Gnb0AhPYpqdR1OmnFdx3IDZndwgIv2vsLp0ru+zFUJVxN7CuzW3
 kcOb26wAMfp7XiF/VKs/Yb5x27w+p2tlZysXaAkP7Fk/cDYo7BTy0WVu4
 fX45D4s73jhCYDwnO/R4kLe33QJYRamPB0OfpUkiDocLNvOmOUlrGQf2k c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wxag333C8jjSBPa7+VxD56j2cSLCpg/EsYJXuy36WB5SLg5dKu6T86QfvW1PPPJDrK7stdLAuI
 NNtH2V9UcjIlXZQcWy/FZbVQyCOqIiVV1e/kUEFmMjMha2jPdihmkiVR58GPD0h1TZxwCvTQTv
 ZASfbdduEC+nCqXHkzLoD5HWVBv+uyP4RZjOQkXs5O/aXZpMvWeDKKswCI+1V1BT0EIUITokE6
 NJy198fnjC58zflwvmJM2AdmdpAvTqHJui8eaDWFw7lzYXe8m+XdDSs+MCDURnqqupBoptelBo
 Grw=
X-SBRS: 2.7
X-MesageID: 5739459
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,521,1559534400"; 
   d="scan'208";a="5739459"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 18 Sep 2019 17:14:06 +0100
Message-ID: <20190918161406.19208-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/configure: Allow specifying python to be
 found from path
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li9jb25maWd1cmUgdGFrZXMgYSBQWVRIT049Li4uIGFyZ3VtZW50LiAgWW91IGNhbiB1c2UgdGhp
cyB0byBzcGVjaWZ5CnRoZSBweXRob24gaW50ZXJwcmV0ZXIuICBIb3dldmVyLCBmb3Igbm8gZ29v
ZCByZWFzb24sIGl0IGV4cGVjdHMgYW4KYWJzb2x1dGUgcGF0aC4KCkZpeCB0aGlzLiAgVGhlIG5l
dyBsb2dpYyBpczoKICogaWYgbm90IHNldCwgZGVmYXVsdCB0byBgcHl0aG9uJwogKiBpZiBub3Qg
YWJzb2x1dGUsIGxvb2sgaXQgdXAgd2l0aCB0eXBlIC1wCiAqIHNwbGl0IGludG8gZGlyZWN0b3J5
IGFuZCBleGVjdXRhYmxlIG5hbWUKClRoZSByZXN1bHRzIGluIGNvbmZpZy9Ub29scy5tayAod2hp
Y2ggY29udGFpbnMgQFBZVEhPTkAgYW5kCkBQWVRIT05QQVRIQCkgYXJlIGlkZW50aWNhbCBmb3Ig
Ym90aAogIC4vY29uZmlndXJlCiAgLi9jb25maWd1cmUgUFlUSE9OPS91c3IvYmluL3B5dGhvbgpz
byBJIGFzc2VydCB0aGlzIGhhcyBubyBmdW5jdGlvbmFsIGNoYW5nZSBleGNlcHQgdGhhdCBub3cg
eW91IGNhbiBzYXkKICAuL2NvbmZpZ3VyZSBQWVRIT049cHl0aG9uCgpJbiBwYXJ0aWN1bGFyIHlv
dSBjYW4gbm93IHNheQogIC4vY29uZmlndXJlIFBZVEhPTj1weXRob24yCiAgLi9jb25maWd1cmUg
UFlUSE9OPXB5dGhvbjMKClRoZSBsYXR0ZXIgaXMgdXNlZnVsIGlmIHlvdSB3YW50IHB5dGhvbjMg
KHdoaWNoIHNob3VsZCBwcm9iYWJseSBiZSB0aGUKZGVmYXVsdCwgYnV0IGRvZXMgbm90IHdvcmsg
cmlnaHQgbm93KS4gIFRoZSBmb3JtZXIgaXMgdXNlZnVsIGlmIHlvdQp3YW50IHB5dGhvbjIgYnV0
IHlvdXIgZGlzdHJvIGhhcyBmb29saXNobHkgbWFkZSAicHl0aG9uIiByZWZlciB0bwpweXRob24z
LgoKQ0M6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KQ0M6IFdlaSBMaXUgPHds
QHhlbi5vcmc+CkNDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+ClNp
Z25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0K
IHRvb2xzL2NvbmZpZ3VyZSAgICB8IDEzICsrKysrKystLS0tLS0KIHRvb2xzL2NvbmZpZ3VyZS5h
YyB8IDEwICsrKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvY29uZmlndXJlIGIvdG9vbHMvY29uZmln
dXJlCmluZGV4IDFiYWFjZWE5YWMuLmYyYzY2ZGZjZTkgMTAwNzU1Ci0tLSBhL3Rvb2xzL2NvbmZp
Z3VyZQorKysgYi90b29scy9jb25maWd1cmUKQEAgLTY5MjUsMTYgKzY5MjUsMTcgQEAgdGhlbgog
ICAgIGFzX2ZuX2Vycm9yICQ/ICJVbmFibGUgdG8gZmluZCBiYXNoLCBwbGVhc2UgaW5zdGFsbCBi
YXNoIiAiJExJTkVOTyIgNQogZmk7OwogZXNhYworaWYgdGVzdCAteiAiJFBZVEhPTiI7IHRoZW4g
OgorICBQWVRIT049InB5dGhvbiIKK2ZpCiBpZiBlY2hvICIkUFlUSE9OIiB8IGdyZXAgLXEgIl4v
IjsgdGhlbiA6CiAKLSAgICBQWVRIT05QQVRIPSRQWVRIT04KLSAgICBQWVRIT049YGJhc2VuYW1l
ICRQWVRIT05QQVRIYAotCi1lbGlmIHRlc3QgLXogIiRQWVRIT04iOyB0aGVuIDoKLSAgUFlUSE9O
PSJweXRob24iCiBlbHNlCi0gIGFzX2ZuX2Vycm9yICQ/ICJQWVRIT04gc3BlY2lmaWVkLCBidXQg
aXMgbm90IGFuIGFic29sdXRlIHBhdGgiICIkTElORU5PIiA1CisgIFBZVEhPTj1gdHlwZSAtcCAi
JFBZVEhPTiJgCiBmaQorUFlUSE9OUEFUSD0kUFlUSE9OCitQWVRIT049YGJhc2VuYW1lICRQWVRI
T05QQVRIYAorCiAjIEV4dHJhY3QgdGhlIGZpcnN0IHdvcmQgb2YgIiRQWVRIT04iLCBzbyBpdCBj
YW4gYmUgYSBwcm9ncmFtIG5hbWUgd2l0aCBhcmdzLgogc2V0IGR1bW15ICRQWVRIT047IGFjX3dv
cmQ9JDIKIHsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogY2hlY2tpbmcg
Zm9yICRhY193b3JkIiA+JjUKZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZpZ3VyZS5hYyBiL3Rvb2xz
L2NvbmZpZ3VyZS5hYwppbmRleCAzZmUwNDkwN2EyLi42NzRiZDU4MDlkIDEwMDY0NAotLS0gYS90
b29scy9jb25maWd1cmUuYWMKKysrIGIvdG9vbHMvY29uZmlndXJlLmFjCkBAIC0zMzcsMTEgKzMz
NywxMSBAQCBjYXNlICIkaG9zdF9vcyIgaW4KICAgZnJlZWJzZCopIDs7CiAgICopIEFYX1BBVEhf
UFJPR19PUl9GQUlMKFtCQVNIXSwgW2Jhc2hdKTs7CiBlc2FjCi1BU19JRihbZWNobyAiJFBZVEhP
TiIgfCBncmVwIC1xICJeLyJdLCBbCi0gICAgUFlUSE9OUEFUSD0kUFlUSE9OCi0gICAgUFlUSE9O
PWBiYXNlbmFtZSAkUFlUSE9OUEFUSGAKLV0sW3Rlc3QgLXogIiRQWVRIT04iXSwgW1BZVEhPTj0i
cHl0aG9uIl0sCi1bQUNfTVNHX0VSUk9SKFtQWVRIT04gc3BlY2lmaWVkLCBidXQgaXMgbm90IGFu
IGFic29sdXRlIHBhdGhdKV0pCitBU19JRihbdGVzdCAteiAiJFBZVEhPTiJdLCBbUFlUSE9OPSJw
eXRob24iXSkKK0FTX0lGKFtlY2hvICIkUFlUSE9OIiB8IGdyZXAgLXEgIl4vIl0sIFtdLCBbUFlU
SE9OPWB0eXBlIC1wICIkUFlUSE9OImBdKQorUFlUSE9OUEFUSD0kUFlUSE9OCitQWVRIT049YGJh
c2VuYW1lICRQWVRIT05QQVRIYAorCiBBWF9QQVRIX1BST0dfT1JfRkFJTChbUFlUSE9OUEFUSF0s
IFskUFlUSE9OXSkKIEFYX0NIRUNLX1BZVEhPTl9WRVJTSU9OKFsyXSwgWzZdKQogCi0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
