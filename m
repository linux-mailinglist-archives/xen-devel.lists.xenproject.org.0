Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DE44EA90
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:27:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heKTf-0000AH-Fo; Fri, 21 Jun 2019 14:25:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7rzm=UU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1heKTe-00009v-8N
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:25:18 +0000
X-Inumbo-ID: 63be3e94-9430-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 63be3e94-9430-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 14:25:16 +0000 (UTC)
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
IronPort-SDR: Sbi811uP9kKIT6ROykH343mz4aMXxlmH6W2VFRrweixlvkxJua6Txft1cicamMr/xttl86QAr3
 cMP/y4HvFgO+ZVzsVDunWvo0v2OauUm0XAehK+Y+Y72SutfRGUBcp7h4Dqo4xOUMu5PldiBNrc
 6UU+ckxyi//BNMFtQVLtSkjSDiWv0RnTO52y2gdlZCwDEdc8rW2dN7eNiPzLOARCvcF0+saLp0
 jj/+MAIuIolUwbfWa6cu0PUeG2b8RRDQ8/AkB4ZlYhQH2N/WrkbHVbm6pqLD16uTMeijm1Hz5p
 h7k=
X-SBRS: 2.7
X-MesageID: 2062907
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2062907"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 15:22:56 +0100
Message-ID: <20190621142258.1543-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
References: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 6/8] mg-repro-setup: New mode
 --autoalloc
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBqdXN0IGludm9sdmVzIHR1cm5pbmcgYXV0b2FsbG9jIG9uIGFuZCBzdGF0aWN0YXNrIG9m
Zi4KSXQgaXMgbW9zdCB1c2VmdWwgd2l0aCBtZy10cmFuc2llbnQtdGFzaywgYXMgZG9jdW1lbnRl
ZC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KIG1nLXJlcHJvLXNldHVwIHwgMTQgKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21nLXJlcHJv
LXNldHVwIGIvbWctcmVwcm8tc2V0dXAKaW5kZXggNDVjNTZmNmEuLmI1NWYwMjFlIDEwMDc1NQot
LS0gYS9tZy1yZXByby1zZXR1cAorKysgYi9tZy1yZXByby1zZXR1cApAQCAtMjgsNyArMjgsNyBA
QCB1c2FnZSAoKSB7IGNhdCA8PEVORAogIEhPU1RTUEVDIGlzCiAgICBbPGlkZW50Pj1dW3JldXNl
Ol08aG9zdG5hbWU+ICAgIGhvc3QgbXVzdCBiZSBhbGxvY2F0ZWQsIHNraXAgaG9zdC1pbnN0YWxs
CiAgICBbPGlkZW50Pj1dd2lwZTo8aG9zdG5hbWU+ICAgICAgIGhvc3QgbXVzdCBiZSBhbGxvY2F0
ZWQsIHdpcGUgaXQKLSAgIFs8aWRlbnQ+PV1hbGxvYzo8cmVzb3VyY2Utc3BlYz4gXGBtZy1hbGxv
Y2F0ZSA8cmVzb3VyY2Utc3BlYz4nLCBhbmQgd2lwZQorICAgWzxpZGVudD49XWFsbG9jOjxyZXNv
dXJjZS1zcGVjPiBcYG1nLWFsbG9jYXRlIDxyZXNvdXJjZS1zcGVjPicsIGFuZCB3aXBlWypdCiAg
ICBub25lOiAgICAgICAgICAgICAgICAgICAgICAgICAgIG5vIGhvc3RzIChzaG91bGQgYmUgb25s
eSBIT1NUUFNFQykKICAgIChkZWZhdWx0IDxpZGVudD4gaXMgXGBob3N0JykKIApAQCAtNDIsNiAr
NDIsMTMgQEAgdXNhZ2UgKCkgeyBjYXQgPDxFTkQKICAgIC1FLi4uIC1mLi4uIC1QICAgICAgIGFz
IGZvciBtZy1leGVjdXRlLWZsaWdodAogICAgLS1hdXRvYWxsb2Mtbm9mcmVlICAgYWxsb2NhdGUg
aG9zdHMgYXMgZm9yIHByb2R1Y3Rpb24sIGJ1dCBrZWVwIHRoZW0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAoc3BlY2lmeSBubyBIT1NUU1BFQ1M7IHJlbWVtYmVyIHRvIGRlYWxsb2NhdGUgbGF0
ZXIpCisgICAtLWF1dG9hbGxvYyAgICAgICAgICB1c2UgaG9zdHMgYXMgZm9yIHByb2R1Y3Rpb24g
KHNwZWNpZnkgbm8gSE9TVFNQRUNTKQorICAgICAgICAgICAgICAgICAgICAgICAgIGFuZCBmcmVl
IHRoZW0gYWZ0ZXJ3YXJkc1sqXQorCisgWypdIElmIFwkT1NTVEVTVF9UQVNLIGlzIHNldCBvbiBl
bnRyeSwgaXQgd2lsbCBiZSB1c2VkIGZvciB0aGVzZQorICAgICBhbGxvY2F0aW9ucy4gIFNvLCBp
biBwYXJ0aWN1bGFyLAorICAgICAgICAuL21nLXRyYW5zaWVudC10YXNrIC4vbWctcmVwcm8tc2V0
dXAgLi4uLiBhbGxvYzouLi4KKyAgICAgd2lsbCBhbGxvY2F0ZSBhcyBzcGVjaWZpZWQsIGJ1dCBk
aXNjYXJkIHRoZSBob3N0cyB3aGVuIGRvbmUuCiAKICBSRUJVSUxEIGlzCiAgICAtLXJlYnVpbGQg
Wy1CPGJsZXNzaW5nPl0gWy1yLi4uXQpAQCAtMTA0LDYgKzExMSw4IEBAIHNraXBjYXB0dXJlPXRy
dWUKIGF1dG9hbGxvYz1mYWxzZQogc3RhdGljdGFzaz10cnVlCiAKK2lmIFsgIngkT1NTVEVTVF9U
QVNLIiAhPSB4IF07IHRoZW4gc3RhdGljdGFzaz1mYWxzZTsgZmkKKwogd2hpbGUgdHJ1ZTsgZG8K
IAljYXNlICIkMSIgaW4KIAktKikJCQk7OwpAQCAtMTE3LDYgKzEyNiw3IEBAIHdoaWxlIHRydWU7
IGRvCiAJLXQ/KikJCWR1cmF0aW9uPSR7YXJnIy10fQkJOzsKIAktLXJvZ3VlKQlkdXJhdGlvbj0n
JwkJCTs7CiAJLS1jYXB0dXJlKQlza2lwY2FwdHVyZT1mYWxzZQkJOzsKKyAJLS1hdXRvYWxsb2Mp
ICAgICAgICBhdXRvYWxsb2M9dHJ1ZTsgc3RhdGljdGFzaz1mYWxzZSA7OwogCS0tYXV0b2FsbG9j
LW5vZnJlZSkgYXV0b2FsbG9jPXRydWU7IHN0YXRpY3Rhc2s9dHJ1ZSA7OwogCS1sKikJCWxvZ2Zp
bGU9JHthcmcjLWx9CQk7OwogCS1yXip8LXIhKikJYWRqdXN0c2V0cys9KCIke2FyZyMtcn0iKQk7
OwpAQCAtMjk3LDcgKzMwNyw3IEBAIGlmIFsgIiR7YWxsb2NfaWRlbnRzWypdfSIgXTsgdGhlbgog
CXByb2dyZXNzZiAiXG4iCiAJaWYgJGF1dG9hbGxvYzsgdGhlbgogCQllY2hvID4mMiBcCi0gJ3dh
cm5pbmc6IC0tYXV0b2FsbG9jLW5vZnJlZSBhbmQgSE9TVFNQRUNzIGFyZSBkbyBub3Qgd29yayB3
ZWxsIHRvZ2V0aGVyJworICd3YXJuaW5nOiAtLWF1dG9hbGxvY1stbm9mcmVlXSBhbmQgSE9TVFNQ
RUNzIGFyZSBkbyBub3Qgd29yayB3ZWxsIHRvZ2V0aGVyJwogCWZpCiBmaQogCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
