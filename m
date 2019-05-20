Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A14C23C7B
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 17:45:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSkRs-0006to-Mi; Mon, 20 May 2019 15:43:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSkRq-0006tE-EF
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:43:34 +0000
X-Inumbo-ID: 051f4696-7b16-11e9-977c-dfdf6955942d
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 051f4696-7b16-11e9-977c-dfdf6955942d;
 Mon, 20 May 2019 15:43:32 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: CvriHBnSUOXdgJsFi7ILPQNE/HTV6fOfo4YTtj0RTj4/xibtLnnADhuY8cVZ0X7SrFmh5Qt2VR
 +NsJMZbml+o1wKk1FKw/HZaVDGIpkvv6JA+IDU0q5qbeey/IWW94f4wbZ3++GCRjYqkCjrj2Z2
 H+Be0+9JYkkCpz4dZeH8lCH+/uzw4Verz26VGxFRXnJHbWEHD6183b2hV0ZZKBrUCEluvl4Mjl
 UXDV28fFTsJg6mnzBRatpNSwmVVCP0qc8vNP+JoEFIzObeX5g7KW5CCZQFZkpFMecrFBV3i4cw
 +4o=
X-SBRS: 2.7
X-MesageID: 647680
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="647680"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 20 May 2019 16:41:47 +0100
Message-ID: <20190520154147.30675-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190520154147.30675-1-ian.jackson@eu.citrix.com>
References: <20190520154147.30675-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 4/4] mg-repro-setup: New mode --autoalloc
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
LXNldHVwIGIvbWctcmVwcm8tc2V0dXAKaW5kZXggYjYwMzg5ZDguLmU2MjY1YjMyIDEwMDc1NQot
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
Wy1CPGJsZXNzaW5nPl0gWy1yLi4uXQpAQCAtMTA1LDYgKzExMiw4IEBAIHNraXBjYXB0dXJlPXRy
dWUKIGF1dG9hbGxvYz1mYWxzZQogc3RhdGljdGFzaz10cnVlCiAKK2lmIFsgIngkT1NTVEVTVF9U
QVNLIiAhPSB4IF07IHRoZW4gc3RhdGljdGFzaz1mYWxzZTsgZmkKKwogd2hpbGUgdHJ1ZTsgZG8K
IAljYXNlICIkMSIgaW4KIAktKikJCQk7OwpAQCAtMTE4LDYgKzEyNyw3IEBAIHdoaWxlIHRydWU7
IGRvCiAJLXQ/KikJCWR1cmF0aW9uPSR7YXJnIy10fQkJOzsKIAktLXJvZ3VlKQlkdXJhdGlvbj0n
JwkJCTs7CiAJLS1jYXB0dXJlKQlza2lwY2FwdHVyZT1mYWxzZQkJOzsKKyAJLS1hdXRvYWxsb2Mp
ICAgICAgICBhdXRvYWxsb2M9dHJ1ZTsgc3RhdGljdGFzaz1mYWxzZSA7OwogCS0tYXV0b2FsbG9j
LW5vZnJlZSkgYXV0b2FsbG9jPXRydWU7IHN0YXRpY3Rhc2s9dHJ1ZSA7OwogCS1sKikJCWxvZ2Zp
bGU9JHthcmcjLWx9CQk7OwogCS1yXip8LXIhKikJYWRqdXN0c2V0cys9KCIke2FyZyMtcn0iKQk7
OwpAQCAtMjk4LDcgKzMwOCw3IEBAIGlmIFsgIiR7YWxsb2NfaWRlbnRzWypdfSIgXTsgdGhlbgog
CXByb2dyZXNzZiAiXG4iCiAJaWYgJGF1dG9hbGxvYzsgdGhlbgogCQllY2hvID4mMiBcCi0gJ3dh
cm5pbmc6IC0tYXV0b2FsbG9jLW5vZnJlZSBhbmQgSE9TVFNQRUNzIGFyZSBkbyBub3Qgd29yayB3
ZWxsIHRvZ2V0aGVyJworICd3YXJuaW5nOiAtLWF1dG9hbGxvY1stbm9mcmVlXSBhbmQgSE9TVFNQ
RUNzIGFyZSBkbyBub3Qgd29yayB3ZWxsIHRvZ2V0aGVyJwogCWZpCiBmaQogCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
