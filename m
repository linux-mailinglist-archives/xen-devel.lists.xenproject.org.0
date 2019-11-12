Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B590AF8F69
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 13:12:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUUz2-0003j8-Mn; Tue, 12 Nov 2019 12:09:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WcyK=ZE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iUUz1-0003iw-Az
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 12:09:19 +0000
X-Inumbo-ID: 4042d30a-0545-11ea-a21a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4042d30a-0545-11ea-a21a-12813bfff9fa;
 Tue, 12 Nov 2019 12:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573560558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=kTx4xEnm4GeHAVmA3bHYjYZOs7Te4PMHMwxju8yK0JE=;
 b=h2vF51+gLXsI1r1VUXE6Jvm680THzrJQAyb1a23jngJzJ0LQTgb4ioOr
 cNfxrbXLA3sMQrKidDPvejir6T+twJ2GzaPju9GwJRCAT16QvJv/fSt6U
 Emn+CAIPRhhA5M3ct3/LMvEZ4ROufVP7DotfepkDupaw/opNf2/tVNi6B E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: khAKUS8rR/xBwMoxmNKSRB+PzDssTwtctRLiYJ1RrUWxQoYiuZZEkc6AmCNXKl5qHHI+zIX2BD
 3hW1UOaDRLafb08q5Bh+mDpE3aVNa7C4RB/MuFngCtZtZT15v6tJO5/lfe90BddBkq6XR188SX
 VnsZtQhHFZg1kDD3L0OQ8Exiy6f80AesZd9EXFYeS1Hbs/UzFZctoM/dQ/DJjjzjfQ/UjBMGhE
 AjQQCIWF9D+YToNSeOxpu9ewzw2lO9SLNSm8Hb0M9/ExEbF1FYHAaT01dHvOzqUxa7WVWDwzc3
 +7Y=
X-SBRS: 2.7
X-MesageID: 8541390
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,296,1569297600"; 
   d="scan'208";a="8541390"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 12 Nov 2019 12:09:13 +0000
Message-ID: <20191112120913.25864-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191112120913.25864-1-ian.jackson@eu.citrix.com>
References: <20191112120913.25864-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/2] ts-libvirt-build: Do an out-of-tree
 build
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
 Jim Fehlig <jfehlig@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVjZW50IHZlcnNpb25zIG9mIGxpYnZpcnQgZG8gbm90IHN1cHBvcnQgaW4tdHJlZSBidWlsZHMg
KCEpCgpDb3BlIHdpdGggdGhpcyBieSBhbHdheXMgYnVpbGRpbmcgaW4gYSBzdWJkaXJlY3Rvcnkg
YGJ1aWxkJyAoYQpzdWJkaXJlY3Rvcnkgb2YgdGhlIHNvdXJjZSB0cmVlKTsgdGhpcyBpcyB0aGUg
YXJyYW5nZW1lbnQgd2hpY2ggdGhlCmxpYnZpcnQgdXBzdHJlYW0gbWVzc2FnZXMgYW5kIGRvY3Vt
ZW50YXRpb24gbm93IHNlZW0gdG8gcmVjb21tZW5kIChhdApsZWFzdCB3aGVyZSB0aGluZ3MgaGF2
ZSBiZWVuIHVwZGF0ZWQpLgoKSSBjb21wYXJlZCB0aGUgZGlmZmVyZW5jZXMgaW4gYnVpbGQgb3V0
cHV0IGJldHdlZW4gdGhlIHJlc3VsdHMgb2YgdGhpcwpicmFuY2ggYW5kIGEgcHJldmlvdXMgcGFz
c2luZyB4ZW4tdW5zdGFibGUgZmxpZ2h0LiAgVGhlIGxpYnZpcnQKbGlicmFyeSB2ZXJzaW9uIGlu
Y3JlYXNlZCBhbmQgYSBmaWxlCiAgdXNyL2xvY2FsL3NoYXJlL2xpYnZpcnQvY3B1X21hcC9hcm1f
ZmVhdHVyZXMueG1sCmFwcGVhcmVkLiAgSSB0aGluayB0aGlzIGlzIGp1c3QgZHVlIHRvIGNoYW5n
ZXMgaW4gdGhlIGxpYnZpcnQgdmVyc2lvbiwKMmNmZjY1ZTRjNjBlLi43MDIxOGUxMGJjZGUsIGlu
IHBhcnRpY3VsYXIgMGRlNTQxYmZjNTc1CiAgY3B1X21hcDogU2hpcCBhcm1fZmVhdHVyZXMueG1s
CgpJIGFsc28gdGVzdGVkIHRoYXQgYSB0ZXN0IGpvYiwgYnVpbHQgd2l0aCBjdXJyZW50IGxpYnZp
cnQgYW5kIHRoZXNlCm9zc3Rlc3QgY2hhbmdlcywgcGFzc2VzIGFzIGV4cGVjdGVkLgoKQ0M6IEpp
bSBGZWhsaWcgPGpmZWhsaWdAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgpUZXN0ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLWxpYnZpcnQtYnVpbGQgfCAxMiArKysrKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdHMtbGlidmlydC1idWlsZCBiL3RzLWxpYnZpcnQtYnVpbGQKaW5kZXggMmEzNjNm
NDMuLmU3OTlmMDAzIDEwMDc1NQotLS0gYS90cy1saWJ2aXJ0LWJ1aWxkCisrKyBiL3RzLWxpYnZp
cnQtYnVpbGQKQEAgLTU4LDExICs1OCwxMyBAQCBzdWIgY29uZmlnKCkgewogICAgIG15ICRnbnVs
aWIgPSBzdWJtb2R1bGVfZmluZCgkc3VibW9kdWxlcywgImdudWxpYiIpOwogICAgIHRhcmdldF9j
bWRfYnVpbGQoJGhvLCAzNjAwLCAkYnVpbGRkaXIsIDw8RU5EKTsKICAgICAgICAgY2QgbGlidmly
dAorCW1rZGlyIGJ1aWxkCisJY2QgYnVpbGQKICAgICAgICAgQ0ZMQUdTPSItZyAtSSR4ZW5wcmVm
aXgvaW5jbHVkZS8iIFxcCiAgICAgICAgIExERkxBR1M9Ii1nIC1MJHhlbnByZWZpeC9saWIvIC1X
bCwtcnBhdGgtbGluaz0keGVucHJlZml4L2xpYi8iIFxcCiAgICAgICAgIFBLR19DT05GSUdfUEFU
SD0iJHhlbnByZWZpeC9saWIvcGtnY29uZmlnLyIgXFwKICAgICAgICAgR05VTElCX1NSQ0RJUj0k
YnVpbGRkaXIvbGlidmlydC8kZ251bGliLT57UGF0aH0gXFwKLSAgICAgICAgICAgIC4vYXV0b2dl
bi5zaCAtLW5vLWdpdCBcXAorICAgICAgICAgICAgLi4vYXV0b2dlbi5zaCAtLW5vLWdpdCBcXAog
ICAgICAgICAgICAgICAgICAgICAgICAgIC0td2l0aC1saWJ4bCAtLXdpdGhvdXQteGVuIC0td2l0
aG91dC14ZW5hcGkgLS13aXRob3V0LXNlbGludXggXFwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLXdpdGhvdXQtbHhjIC0td2l0aG91dC12Ym94IC0td2l0aG91dC11bWwgXFwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLXdpdGhvdXQtcWVtdSAtLXdpdGhvdXQtb3BlbnZ6IC0td2l0aG91
dC12bXdhcmUgXFwKQEAgLTcyLDkgKzc0LDkgQEAgRU5ECiAKIHN1YiBidWlsZCgpIHsKICAgICB0
YXJnZXRfY21kX2J1aWxkKCRobywgMzYwMCwgJGJ1aWxkZGlyLCA8PEVORCk7Ci0gICAgICAgIGNk
IGxpYnZpcnQKLSAgICAgICAgKG1ha2UgJG1ha2VmbGFncyAyPiYxICYmIHRvdWNoIC4uL2J1aWxk
LW9rLXN0YW1wKSB8dGVlIC4uL2xvZwotICAgICAgICB0ZXN0IC1mIC4uL2J1aWxkLW9rLXN0YW1w
ICMvCisgICAgICAgIGNkIGxpYnZpcnQvYnVpbGQKKyAgICAgICAgKG1ha2UgJG1ha2VmbGFncyAy
PiYxICYmIHRvdWNoIC4uLy4uL2J1aWxkLW9rLXN0YW1wKSB8dGVlIC4uL2xvZworICAgICAgICB0
ZXN0IC1mIC4uLy4uL2J1aWxkLW9rLXN0YW1wICMvCiAgICAgICAgIGVjaG8gb2suCiBFTkQKIH0K
QEAgLTgyLDcgKzg0LDcgQEAgRU5ECiBzdWIgaW5zdGFsbCgpIHsKICAgICB0YXJnZXRfY21kX2J1
aWxkKCRobywgMzAwLCAkYnVpbGRkaXIsIDw8RU5EKTsKICAgICAgICAgbWtkaXIgLXAgZGlzdAot
ICAgICAgICBjZCBsaWJ2aXJ0CisgICAgICAgIGNkIGxpYnZpcnQvYnVpbGQKICAgICAgICAgbWFr
ZSAkbWFrZWZsYWdzIGluc3RhbGwgREVTVERJUj0kYnVpbGRkaXIvZGlzdAogICAgICAgICBta2Rp
ciAtcCAkYnVpbGRkaXIvZGlzdC9ldGMvaW5pdC5kCiBFTkQKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
