Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE07901E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:00:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82n-0003RJ-1c; Mon, 29 Jul 2019 15:58:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82l-0003PV-Iz
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:35 +0000
X-Inumbo-ID: b6c30ce0-b219-11e9-bd15-cbdacc86706a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6c30ce0-b219-11e9-bd15-cbdacc86706a;
 Mon, 29 Jul 2019 15:58:32 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AqIrsI5ADWYqY0VAD6upqbDBG1D83CtiNmVTW7ZasPHGZ8aMA7fV1kHJVifcf78JkFuX/2OVQV
 S8Tde8oOAYPV37BluAZBbkRPk8p4Eqia1xxPl9Cjp8W24CgVF9llnfVOAcOeSQmNzQdsair9C8
 EHQG5f+x/osjIzeKWnuxXaCaoboxt8ZTJrm4f7c0ydNZIfudo4ZAdAZlPrdlxGYDZPgquPRi/m
 IDmW3ylPOBmJsrCx0uohB791HSmcHqIHgW8N6MgbT25CR8NReeEpab6EJ8A8Oz4rV0peVM8se2
 028=
X-SBRS: 2.7
X-MesageID: 3710535
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3710535"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:39 +0100
Message-ID: <20190729153944.24239-31-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 30/35] OvmfPkg/OvmfXen: Introduce XenTimerDxe
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ik92bWZQa2cvODI1NFRpbWVyRHhlIiBpcyByZXBsYWNlZCB3aXRoIGEgWGVuLXNwZWNpZmljCkVG
SV9USU1FUl9BUkNIX1BST1RPQ09MIGltcGxlbWVudGF0aW9uLiBBbHNvIHJlbW92ZQo4MjU5SW50
ZXJydXB0Q29udHJvbGxlckR4ZSBhcyBpdCBpcyBub3QgdXNlZCBhbnltb3JlLgoKVGhpcyBUaW1l
ciB1c2VzIHRoZSBsb2NhbCBBUElDIHRpbWVyIGFzIHRpbWUgc291cmNlIGFzIGl0IGNhbiB3b3Jr
IG9uCmJvdGggYSBYZW4gUFZIIGd1ZXN0IGFuZCBhbiBIVk0gb25lLgoKQmFzZWQgb24gdGhlICJP
dm1mUGtnLzgyNTRUaW1lckR4ZSIgaW1wbGVtZW50YXRpb24uCgpSZWY6IGh0dHBzOi8vYnVnemls
bGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQpTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQWNrZWQtYnk6IExhc3psbyBF
cnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2NDoKICAgIC0gZml4IHRo
ZSBjb21taXQgbWVzc2FnZSB0byByZWZsZWN0IHRoZSBmYWN0IHRoYXQgdGhlIG9yaWdpbmFsIGNv
ZGUgYXMKICAgICAgbW92ZWQuCiAgICAtIFVwZGF0ZSBNYWludGFpbmVycy50eHQKICAgIAogICAg
djM6CiAgICAtIHJlYmFzZWQsIFNQRFgsIGNvcHlyaWdodAogICAgCiAgICB2MjoKICAgIC0gVXNl
IEluaXRpYWxpemVBcGljVGltZXIgaW5zdGVhZCBvZiBXcml0ZUxvY2FsQXBpY1JlZwogICAgLSBy
ZXdvcmsgY29tbWVudHMgKHJlbW92ZSBtYW55IHRoYXQgZG9uJ3QgYXBwbHkpCiAgICAtIHJlbW92
ZSB1bnVzZWQgaW5jbHVkZXMsIGFuZCBsaWJzCiAgICAtIGhhdmUgYSBtYWNybyB0byB0aGUgdGlt
ZXJ2ZWN0b3IuCiAgICAtIGNsZWFudXAsIGNvcHlyaWdodAogICAgLSByZXdvcmsgY2FsY3VsYXRp
b24gb2YgVGltZXJDb3VudCwgdmFsdWUgdG8gYmUgdXNlIGJ5IHRoZSBBUElDIHRpbWVyCiAgICAt
IGNoZWNrIGZvciBvdmVyZmxvdyBvZiBUaW1lclBlcmlvZCwgd2l0aCB0aGUgYXBpYyB0aW1lciwg
dGhlIHBlcmlvZCBjYW4KICAgICAgYmUgdXAgdG8gYWJvdXQgNDJzIG9uIFhlbiAob3IgZXZlbiBo
aWdoZXIgYnkgY2hhbmdpbmcgdGhlIERpdmlkZVZhbHVlKS4KCiBPdm1mUGtnL092bWZYZW4uZHNj
ICAgICAgICAgICAgICAgICB8ICAgMyArLQogT3ZtZlBrZy9Pdm1mWGVuLmZkZiAgICAgICAgICAg
ICAgICAgfCAgIDMgKy0KIE92bWZQa2cvWGVuVGltZXJEeGUvWGVuVGltZXJEeGUuaW5mIHwgIDQy
ICsrKysKIE92bWZQa2cvWGVuVGltZXJEeGUvWGVuVGltZXJEeGUuaCAgIHwgMTc3ICsrKysrKysr
KysrKysrCiBPdm1mUGtnL1hlblRpbWVyRHhlL1hlblRpbWVyRHhlLmMgICB8IDM1NSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiBNYWludGFpbmVycy50eHQgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCiA2IGZpbGVzIGNoYW5nZWQsIDU3NyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IE92bWZQa2cvWGVuVGltZXJEeGUvWGVuVGltZXJEeGUu
aW5mCiBjcmVhdGUgbW9kZSAxMDA2NDQgT3ZtZlBrZy9YZW5UaW1lckR4ZS9YZW5UaW1lckR4ZS5o
CiBjcmVhdGUgbW9kZSAxMDA2NDQgT3ZtZlBrZy9YZW5UaW1lckR4ZS9YZW5UaW1lckR4ZS5jCgpk
aWZmIC0tZ2l0IGEvT3ZtZlBrZy9Pdm1mWGVuLmRzYyBiL092bWZQa2cvT3ZtZlhlbi5kc2MKaW5k
ZXggNDc3ZDhjNzZhMS4uNTRhYzkxMGQ4ZSAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9Pdm1mWGVuLmRz
YworKysgYi9Pdm1mUGtnL092bWZYZW4uZHNjCkBAIC01NDcsMTAgKzU0Nyw5IEBAIFtDb21wb25l
bnRzXQogICBNZGVNb2R1bGVQa2cvVW5pdmVyc2FsL1NlY3VyaXR5U3R1YkR4ZS9TZWN1cml0eVN0
dWJEeGUuaW5mDQogDQogICBNZGVNb2R1bGVQa2cvVW5pdmVyc2FsL0ViY0R4ZS9FYmNEeGUuaW5m
DQotICBPdm1mUGtnLzgyNTlJbnRlcnJ1cHRDb250cm9sbGVyRHhlLzgyNTkuaW5mDQorICBPdm1m
UGtnL1hlblRpbWVyRHhlL1hlblRpbWVyRHhlLmluZg0KICAgVWVmaUNwdVBrZy9DcHVJbzJEeGUv
Q3B1SW8yRHhlLmluZg0KICAgVWVmaUNwdVBrZy9DcHVEeGUvQ3B1RHhlLmluZg0KLSAgT3ZtZlBr
Zy84MjU0VGltZXJEeGUvODI1NFRpbWVyLmluZg0KICAgT3ZtZlBrZy9JbmNvbXBhdGlibGVQY2lE
ZXZpY2VTdXBwb3J0RHhlL0luY29tcGF0aWJsZVBjaURldmljZVN1cHBvcnQuaW5mDQogICBPdm1m
UGtnL1BjaUhvdFBsdWdJbml0RHhlL1BjaUhvdFBsdWdJbml0LmluZg0KICAgTWRlTW9kdWxlUGtn
L0J1cy9QY2kvUGNpSG9zdEJyaWRnZUR4ZS9QY2lIb3N0QnJpZGdlRHhlLmluZiB7DQpkaWZmIC0t
Z2l0IGEvT3ZtZlBrZy9Pdm1mWGVuLmZkZiBiL092bWZQa2cvT3ZtZlhlbi5mZGYKaW5kZXggNDk5
OTdmZWU5Yi4uZmEwODMwYTMyNCAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9Pdm1mWGVuLmZkZgorKysg
Yi9Pdm1mUGtnL092bWZYZW4uZmRmCkBAIC0yOTgsMTAgKzI5OCw5IEBAIFtGVi5EWEVGVl0KIElO
RiAgTWRlTW9kdWxlUGtnL0NvcmUvUnVudGltZUR4ZS9SdW50aW1lRHhlLmluZg0KIElORiAgTWRl
TW9kdWxlUGtnL1VuaXZlcnNhbC9TZWN1cml0eVN0dWJEeGUvU2VjdXJpdHlTdHViRHhlLmluZg0K
IElORiAgTWRlTW9kdWxlUGtnL1VuaXZlcnNhbC9FYmNEeGUvRWJjRHhlLmluZg0KLUlORiAgT3Zt
ZlBrZy84MjU5SW50ZXJydXB0Q29udHJvbGxlckR4ZS84MjU5LmluZg0KK0lORiAgT3ZtZlBrZy9Y
ZW5UaW1lckR4ZS9YZW5UaW1lckR4ZS5pbmYNCiBJTkYgIFVlZmlDcHVQa2cvQ3B1SW8yRHhlL0Nw
dUlvMkR4ZS5pbmYNCiBJTkYgIFVlZmlDcHVQa2cvQ3B1RHhlL0NwdUR4ZS5pbmYNCi1JTkYgIE92
bWZQa2cvODI1NFRpbWVyRHhlLzgyNTRUaW1lci5pbmYNCiBJTkYgIE92bWZQa2cvSW5jb21wYXRp
YmxlUGNpRGV2aWNlU3VwcG9ydER4ZS9JbmNvbXBhdGlibGVQY2lEZXZpY2VTdXBwb3J0LmluZg0K
IElORiAgT3ZtZlBrZy9QY2lIb3RQbHVnSW5pdER4ZS9QY2lIb3RQbHVnSW5pdC5pbmYNCiBJTkYg
IE1kZU1vZHVsZVBrZy9CdXMvUGNpL1BjaUhvc3RCcmlkZ2VEeGUvUGNpSG9zdEJyaWRnZUR4ZS5p
bmYNCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblRpbWVyRHhlL1hlblRpbWVyRHhlLmluZiBiL092
bWZQa2cvWGVuVGltZXJEeGUvWGVuVGltZXJEeGUuaW5mCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmFkZDFkMDFiYmYKLS0tIC9kZXYvbnVsbAorKysgYi9Pdm1mUGtnL1hl
blRpbWVyRHhlL1hlblRpbWVyRHhlLmluZgpAQCAtMCwwICsxLDQyIEBACisjIyBAZmlsZQ0KKyMg
TG9jYWwgQVBJQyB0aW1lciBkcml2ZXIgdGhhdCBwcm92aWRlcyBUaW1lciBBcmNoIHByb3RvY29s
Lg0KKyMNCisjIENvcHlyaWdodCAoYykgMjAwNSAtIDIwMTksIEludGVsIENvcnBvcmF0aW9uLiBB
bGwgcmlnaHRzIHJlc2VydmVkLjxCUj4NCisjIENvcHlyaWdodCAoYykgMjAxOSwgQ2l0cml4IFN5
c3RlbXMsIEluYy4NCisjDQorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNl
LVBhdGVudA0KKyMNCisjIw0KKw0KK1tEZWZpbmVzXQ0KKyAgSU5GX1ZFUlNJT04gICAgICAgICAg
ICAgICAgICAgID0gMHgwMDAxMDAwNQ0KKyAgQkFTRV9OQU1FICAgICAgICAgICAgICAgICAgICAg
ID0gWGVuVGltZXJEeGUNCisgIEZJTEVfR1VJRCAgICAgICAgICAgICAgICAgICAgICA9IDUyZmU4
MTk2LWY5ZGUtNGQwNy1iMjJmLTUxZjc3YTBlN2M0MQ0KKyAgTU9EVUxFX1RZUEUgICAgICAgICAg
ICAgICAgICAgID0gRFhFX0RSSVZFUg0KKyAgVkVSU0lPTl9TVFJJTkcgICAgICAgICAgICAgICAg
ID0gMS4wDQorDQorICBFTlRSWV9QT0lOVCAgICAgICAgICAgICAgICAgICAgPSBUaW1lckRyaXZl
ckluaXRpYWxpemUNCisNCitbUGFja2FnZXNdDQorICBNZGVQa2cvTWRlUGtnLmRlYw0KKyAgVWVm
aUNwdVBrZy9VZWZpQ3B1UGtnLmRlYw0KKyAgT3ZtZlBrZy9Pdm1mUGtnLmRlYw0KKw0KK1tMaWJy
YXJ5Q2xhc3Nlc10NCisgIFVlZmlCb290U2VydmljZXNUYWJsZUxpYg0KKyAgQmFzZUxpYg0KKyAg
RGVidWdMaWINCisgIFVlZmlEcml2ZXJFbnRyeVBvaW50DQorICBMb2NhbEFwaWNMaWINCisNCitb
U291cmNlc10NCisgIFhlblRpbWVyRHhlLmgNCisgIFhlblRpbWVyRHhlLmMNCisNCitbUHJvdG9j
b2xzXQ0KKyAgZ0VmaUNwdUFyY2hQcm90b2NvbEd1aWQgICAgICAgIyMgQ09OU1VNRVMNCisgIGdF
ZmlUaW1lckFyY2hQcm90b2NvbEd1aWQgICAgICMjIFBST0RVQ0VTDQorW1BjZF0NCisgIGdFZmlN
ZGVQa2dUb2tlblNwYWNlR3VpZC5QY2RGU0JDbG9jayAgIyMgQ09OU1VNRVMNCitbRGVwZXhdDQor
ICBnRWZpQ3B1QXJjaFByb3RvY29sR3VpZA0KZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuVGltZXJE
eGUvWGVuVGltZXJEeGUuaCBiL092bWZQa2cvWGVuVGltZXJEeGUvWGVuVGltZXJEeGUuaApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5lMGEzZDk1ZmQwCi0tLSAvZGV2L251
bGwKKysrIGIvT3ZtZlBrZy9YZW5UaW1lckR4ZS9YZW5UaW1lckR4ZS5oCkBAIC0wLDAgKzEsMTc3
IEBACisvKiogQGZpbGUNCisgIFByaXZhdGUgZGF0YSBzdHJ1Y3R1cmVzDQorDQorQ29weXJpZ2h0
IChjKSAyMDA1IC0gMjAxOCwgSW50ZWwgQ29ycG9yYXRpb24uIEFsbCByaWdodHMgcmVzZXJ2ZWQu
PEJSPg0KK0NvcHlyaWdodCAoYykgMjAxOSwgQ2l0cml4IFN5c3RlbXMsIEluYy4NCisNCitTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlLVBhdGVudA0KKyoqLw0KKw0KKyNpZm5k
ZWYgX1RJTUVSX0hfDQorI2RlZmluZSBfVElNRVJfSF8NCisNCisjaW5jbHVkZSA8UGlEeGUuaD4N
CisNCisjaW5jbHVkZSA8UHJvdG9jb2wvQ3B1Lmg+DQorI2luY2x1ZGUgPFByb3RvY29sL1RpbWVy
Lmg+DQorDQorI2luY2x1ZGUgPFJlZ2lzdGVyL0xvY2FsQXBpYy5oPg0KKw0KKyNpbmNsdWRlIDxM
aWJyYXJ5L1VlZmlCb290U2VydmljZXNUYWJsZUxpYi5oPg0KKyNpbmNsdWRlIDxMaWJyYXJ5L0Jh
c2VMaWIuaD4NCisjaW5jbHVkZSA8TGlicmFyeS9EZWJ1Z0xpYi5oPg0KKyNpbmNsdWRlIDxMaWJy
YXJ5L0xvY2FsQXBpY0xpYi5oPg0KKyNpbmNsdWRlIDxMaWJyYXJ5L1BjZExpYi5oPg0KKw0KKy8v
IFRoZSBkZWZhdWx0IHRpbWVyIHRpY2sgZHVyYXRpb24gaXMgc2V0IHRvIDEwIG1zID0gMTAwMDAw
IDEwMCBucyB1bml0cw0KKy8vDQorI2RlZmluZSBERUZBVUxUX1RJTUVSX1RJQ0tfRFVSQVRJT04g
MTAwMDAwDQorDQorLy8NCisvLyBUaGUgVGltZXIgVmVjdG9yIHVzZSBmb3IgaW50ZXJydXB0DQor
Ly8NCisjZGVmaW5lIExPQ0FMX0FQSUNfVElNRVJfVkVDVE9SIDMyDQorDQorLy8NCisvLyBGdW5j
dGlvbiBQcm90b3R5cGVzDQorLy8NCisvKioNCisgIEluaXRpYWxpemUgdGhlIFRpbWVyIEFyY2hp
dGVjdHVyYWwgUHJvdG9jb2wgZHJpdmVyDQorDQorICBAcGFyYW0gSW1hZ2VIYW5kbGUgICAgIElt
YWdlSGFuZGxlIG9mIHRoZSBsb2FkZWQgZHJpdmVyDQorICBAcGFyYW0gU3lzdGVtVGFibGUgICAg
IFBvaW50ZXIgdG8gdGhlIFN5c3RlbSBUYWJsZQ0KKw0KKyAgQHJldHZhbCBFRklfU1VDQ0VTUyAg
ICAgICAgICAgIFRpbWVyIEFyY2hpdGVjdHVyYWwgUHJvdG9jb2wgY3JlYXRlZA0KKyAgQHJldHZh
bCBFRklfT1VUX09GX1JFU09VUkNFUyAgIE5vdCBlbm91Z2ggcmVzb3VyY2VzIGF2YWlsYWJsZSB0
byBpbml0aWFsaXplIGRyaXZlci4NCisgIEByZXR2YWwgRUZJX0RFVklDRV9FUlJPUiAgICAgICBB
IGRldmljZSBlcnJvciBvY2N1cnJlZCBhdHRlbXB0aW5nIHRvIGluaXRpYWxpemUgdGhlIGRyaXZl
ci4NCisNCisqKi8NCitFRklfU1RBVFVTDQorRUZJQVBJDQorVGltZXJEcml2ZXJJbml0aWFsaXpl
ICgNCisgIElOIEVGSV9IQU5ETEUgICAgICAgIEltYWdlSGFuZGxlLA0KKyAgSU4gRUZJX1NZU1RF
TV9UQUJMRSAgKlN5c3RlbVRhYmxlDQorICApDQorOw0KKw0KKy8qKg0KKw0KKyAgVGhpcyBmdW5j
dGlvbiBhZGp1c3RzIHRoZSBwZXJpb2Qgb2YgdGltZXIgaW50ZXJydXB0cyB0byB0aGUgdmFsdWUg
c3BlY2lmaWVkDQorICBieSBUaW1lclBlcmlvZC4gIElmIHRoZSB0aW1lciBwZXJpb2QgaXMgdXBk
YXRlZCwgdGhlbiB0aGUgc2VsZWN0ZWQgdGltZXINCisgIHBlcmlvZCBpcyBzdG9yZWQgaW4gRUZJ
X1RJTUVSLlRpbWVyUGVyaW9kLCBhbmQgRUZJX1NVQ0NFU1MgaXMgcmV0dXJuZWQuICBJZg0KKyAg
dGhlIHRpbWVyIGhhcmR3YXJlIGlzIG5vdCBwcm9ncmFtbWFibGUsIHRoZW4gRUZJX1VOU1VQUE9S
VEVEIGlzIHJldHVybmVkLg0KKyAgSWYgYW4gZXJyb3Igb2NjdXJzIHdoaWxlIGF0dGVtcHRpbmcg
dG8gdXBkYXRlIHRoZSB0aW1lciBwZXJpb2QsIHRoZW4gdGhlDQorICB0aW1lciBoYXJkd2FyZSB3
aWxsIGJlIHB1dCBiYWNrIGluIGl0cyBzdGF0ZSBwcmlvciB0byB0aGlzIGNhbGwsIGFuZA0KKyAg
RUZJX0RFVklDRV9FUlJPUiBpcyByZXR1cm5lZC4gIElmIFRpbWVyUGVyaW9kIGlzIDAsIHRoZW4g
dGhlIHRpbWVyIGludGVycnVwdA0KKyAgaXMgZGlzYWJsZWQuICBUaGlzIGlzIG5vdCB0aGUgc2Ft
ZSBhcyBkaXNhYmxpbmcgdGhlIENQVSdzIGludGVycnVwdHMuDQorICBJbnN0ZWFkLCBpdCBtdXN0
IGVpdGhlciB0dXJuIG9mZiB0aGUgdGltZXIgaGFyZHdhcmUsIG9yIGl0IG11c3QgYWRqdXN0IHRo
ZQ0KKyAgaW50ZXJydXB0IGNvbnRyb2xsZXIgc28gdGhhdCBhIENQVSBpbnRlcnJ1cHQgaXMgbm90
IGdlbmVyYXRlZCB3aGVuIHRoZSB0aW1lcg0KKyAgaW50ZXJydXB0IGZpcmVzLg0KKw0KKw0KKyAg
QHBhcmFtIFRoaXMgICAgICAgICAgICBUaGUgRUZJX1RJTUVSX0FSQ0hfUFJPVE9DT0wgaW5zdGFu
Y2UuDQorICBAcGFyYW0gTm90aWZ5RnVuY3Rpb24gIFRoZSByYXRlIHRvIHByb2dyYW0gdGhlIHRp
bWVyIGludGVycnVwdCBpbiAxMDAgblMgdW5pdHMuICBJZg0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICB0aGUgdGltZXIgaGFyZHdhcmUgaXMgbm90IHByb2dyYW1tYWJsZSwgdGhlbiBFRklfVU5T
VVBQT1JURUQgaXMNCisgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuZWQuICBJZiB0aGUg
dGltZXIgaXMgcHJvZ3JhbW1hYmxlLCB0aGVuIHRoZSB0aW1lciBwZXJpb2QNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgd2lsbCBiZSByb3VuZGVkIHVwIHRvIHRoZSBuZWFyZXN0IHRpbWVyIHBl
cmlvZCB0aGF0IGlzIHN1cHBvcnRlZA0KKyAgICAgICAgICAgICAgICAgICAgICAgICBieSB0aGUg
dGltZXIgaGFyZHdhcmUuICBJZiBUaW1lclBlcmlvZCBpcyBzZXQgdG8gMCwgdGhlbiB0aGUNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgdGltZXIgaW50ZXJydXB0cyB3aWxsIGJlIGRpc2FibGVk
Lg0KKw0KKyAgQHJldHZhbCAgICAgICAgRUZJX1NVQ0NFU1MgICAgICAgVGhlIHRpbWVyIHBlcmlv
ZCB3YXMgY2hhbmdlZC4NCisgIEByZXR2YWwgICAgICAgIEVGSV9VTlNVUFBPUlRFRCAgIFRoZSBw
bGF0Zm9ybSBjYW5ub3QgY2hhbmdlIHRoZSBwZXJpb2Qgb2YgdGhlIHRpbWVyIGludGVycnVwdC4N
CisgIEByZXR2YWwgICAgICAgIEVGSV9ERVZJQ0VfRVJST1IgIFRoZSB0aW1lciBwZXJpb2QgY291
bGQgbm90IGJlIGNoYW5nZWQgZHVlIHRvIGEgZGV2aWNlIGVycm9yLg0KKw0KKyoqLw0KK0VGSV9T
VEFUVVMNCitFRklBUEkNCitUaW1lckRyaXZlclJlZ2lzdGVySGFuZGxlciAoDQorICBJTiBFRklf
VElNRVJfQVJDSF9QUk9UT0NPTCAgKlRoaXMsDQorICBJTiBFRklfVElNRVJfTk9USUZZICAgICAg
ICAgTm90aWZ5RnVuY3Rpb24NCisgICkNCis7DQorDQorLyoqDQorDQorICBUaGlzIGZ1bmN0aW9u
IGFkanVzdHMgdGhlIHBlcmlvZCBvZiB0aW1lciBpbnRlcnJ1cHRzIHRvIHRoZSB2YWx1ZSBzcGVj
aWZpZWQNCisgIGJ5IFRpbWVyUGVyaW9kLiAgSWYgdGhlIHRpbWVyIHBlcmlvZCBpcyB1cGRhdGVk
LCB0aGVuIHRoZSBzZWxlY3RlZCB0aW1lcg0KKyAgcGVyaW9kIGlzIHN0b3JlZCBpbiBFRklfVElN
RVIuVGltZXJQZXJpb2QsIGFuZCBFRklfU1VDQ0VTUyBpcyByZXR1cm5lZC4gIElmDQorICB0aGUg
dGltZXIgaGFyZHdhcmUgaXMgbm90IHByb2dyYW1tYWJsZSwgdGhlbiBFRklfVU5TVVBQT1JURUQg
aXMgcmV0dXJuZWQuDQorICBJZiBhbiBlcnJvciBvY2N1cnMgd2hpbGUgYXR0ZW1wdGluZyB0byB1
cGRhdGUgdGhlIHRpbWVyIHBlcmlvZCwgdGhlbiB0aGUNCisgIHRpbWVyIGhhcmR3YXJlIHdpbGwg
YmUgcHV0IGJhY2sgaW4gaXRzIHN0YXRlIHByaW9yIHRvIHRoaXMgY2FsbCwgYW5kDQorICBFRklf
REVWSUNFX0VSUk9SIGlzIHJldHVybmVkLiAgSWYgVGltZXJQZXJpb2QgaXMgMCwgdGhlbiB0aGUg
dGltZXIgaW50ZXJydXB0DQorICBpcyBkaXNhYmxlZC4gIFRoaXMgaXMgbm90IHRoZSBzYW1lIGFz
IGRpc2FibGluZyB0aGUgQ1BVJ3MgaW50ZXJydXB0cy4NCisgIEluc3RlYWQsIGl0IG11c3QgZWl0
aGVyIHR1cm4gb2ZmIHRoZSB0aW1lciBoYXJkd2FyZSwgb3IgaXQgbXVzdCBhZGp1c3QgdGhlDQor
ICBpbnRlcnJ1cHQgY29udHJvbGxlciBzbyB0aGF0IGEgQ1BVIGludGVycnVwdCBpcyBub3QgZ2Vu
ZXJhdGVkIHdoZW4gdGhlIHRpbWVyDQorICBpbnRlcnJ1cHQgZmlyZXMuDQorDQorDQorICBAcGFy
YW0gVGhpcyAgICAgICAgICAgIFRoZSBFRklfVElNRVJfQVJDSF9QUk9UT0NPTCBpbnN0YW5jZS4N
CisgIEBwYXJhbSBUaW1lclBlcmlvZCAgICAgVGhlIHJhdGUgdG8gcHJvZ3JhbSB0aGUgdGltZXIg
aW50ZXJydXB0IGluIDEwMCBuUyB1bml0cy4gIElmDQorICAgICAgICAgICAgICAgICAgICAgICAg
IHRoZSB0aW1lciBoYXJkd2FyZSBpcyBub3QgcHJvZ3JhbW1hYmxlLCB0aGVuIEVGSV9VTlNVUFBP
UlRFRCBpcw0KKyAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm5lZC4gIElmIHRoZSB0aW1l
ciBpcyBwcm9ncmFtbWFibGUsIHRoZW4gdGhlIHRpbWVyIHBlcmlvZA0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICB3aWxsIGJlIHJvdW5kZWQgdXAgdG8gdGhlIG5lYXJlc3QgdGltZXIgcGVyaW9k
IHRoYXQgaXMgc3VwcG9ydGVkDQorICAgICAgICAgICAgICAgICAgICAgICAgIGJ5IHRoZSB0aW1l
ciBoYXJkd2FyZS4gIElmIFRpbWVyUGVyaW9kIGlzIHNldCB0byAwLCB0aGVuIHRoZQ0KKyAgICAg
ICAgICAgICAgICAgICAgICAgICB0aW1lciBpbnRlcnJ1cHRzIHdpbGwgYmUgZGlzYWJsZWQuDQor
DQorICBAcmV0dmFsICAgICAgICBFRklfU1VDQ0VTUyAgICAgICBUaGUgdGltZXIgcGVyaW9kIHdh
cyBjaGFuZ2VkLg0KKyAgQHJldHZhbCAgICAgICAgRUZJX1VOU1VQUE9SVEVEICAgVGhlIHBsYXRm
b3JtIGNhbm5vdCBjaGFuZ2UgdGhlIHBlcmlvZCBvZiB0aGUgdGltZXIgaW50ZXJydXB0Lg0KKyAg
QHJldHZhbCAgICAgICAgRUZJX0RFVklDRV9FUlJPUiAgVGhlIHRpbWVyIHBlcmlvZCBjb3VsZCBu
b3QgYmUgY2hhbmdlZCBkdWUgdG8gYSBkZXZpY2UgZXJyb3IuDQorDQorKiovDQorRUZJX1NUQVRV
Uw0KK0VGSUFQSQ0KK1RpbWVyRHJpdmVyU2V0VGltZXJQZXJpb2QgKA0KKyAgSU4gRUZJX1RJTUVS
X0FSQ0hfUFJPVE9DT0wgICpUaGlzLA0KKyAgSU4gVUlOVDY0ICAgICAgICAgICAgICAgICAgIFRp
bWVyUGVyaW9kDQorICApDQorOw0KKw0KKy8qKg0KKw0KKyAgVGhpcyBmdW5jdGlvbiByZXRyaWV2
ZXMgdGhlIHBlcmlvZCBvZiB0aW1lciBpbnRlcnJ1cHRzIGluIDEwMCBucyB1bml0cywNCisgIHJl
dHVybnMgdGhhdCB2YWx1ZSBpbiBUaW1lclBlcmlvZCwgYW5kIHJldHVybnMgRUZJX1NVQ0NFU1Mu
ICBJZiBUaW1lclBlcmlvZA0KKyAgaXMgTlVMTCwgdGhlbiBFRklfSU5WQUxJRF9QQVJBTUVURVIg
aXMgcmV0dXJuZWQuICBJZiBhIFRpbWVyUGVyaW9kIG9mIDAgaXMNCisgIHJldHVybmVkLCB0aGVu
IHRoZSB0aW1lciBpcyBjdXJyZW50bHkgZGlzYWJsZWQuDQorDQorDQorICBAcGFyYW0gVGhpcyAg
ICAgICAgICAgIFRoZSBFRklfVElNRVJfQVJDSF9QUk9UT0NPTCBpbnN0YW5jZS4NCisgIEBwYXJh
bSBUaW1lclBlcmlvZCAgICAgQSBwb2ludGVyIHRvIHRoZSB0aW1lciBwZXJpb2QgdG8gcmV0cmll
dmUgaW4gMTAwIG5zIHVuaXRzLiAgSWYNCisgICAgICAgICAgICAgICAgICAgICAgICAgMCBpcyBy
ZXR1cm5lZCwgdGhlbiB0aGUgdGltZXIgaXMgY3VycmVudGx5IGRpc2FibGVkLg0KKw0KKyAgQHJl
dHZhbCBFRklfU1VDQ0VTUyAgICAgICAgICAgIFRoZSB0aW1lciBwZXJpb2Qgd2FzIHJldHVybmVk
IGluIFRpbWVyUGVyaW9kLg0KKyAgQHJldHZhbCBFRklfSU5WQUxJRF9QQVJBTUVURVIgIFRpbWVy
UGVyaW9kIGlzIE5VTEwuDQorDQorKiovDQorRUZJX1NUQVRVUw0KK0VGSUFQSQ0KK1RpbWVyRHJp
dmVyR2V0VGltZXJQZXJpb2QgKA0KKyAgSU4gRUZJX1RJTUVSX0FSQ0hfUFJPVE9DT0wgICAqVGhp
cywNCisgIE9VVCBVSU5UNjQgICAgICAgICAgICAgICAgICAgKlRpbWVyUGVyaW9kDQorICApDQor
Ow0KKw0KKy8qKg0KKw0KKyAgVGhpcyBmdW5jdGlvbiBnZW5lcmF0ZXMgYSBzb2Z0IHRpbWVyIGlu
dGVycnVwdC4gSWYgdGhlIHBsYXRmb3JtIGRvZXMgbm90IHN1cHBvcnQgc29mdA0KKyAgdGltZXIg
aW50ZXJydXB0cywgdGhlbiBFRklfVU5TVVBQT1JURUQgaXMgcmV0dXJuZWQuIE90aGVyd2lzZSwg
RUZJX1NVQ0NFU1MgaXMgcmV0dXJuZWQuDQorICBJZiBhIGhhbmRsZXIgaGFzIGJlZW4gcmVnaXN0
ZXJlZCB0aHJvdWdoIHRoZSBFRklfVElNRVJfQVJDSF9QUk9UT0NPTC5SZWdpc3RlckhhbmRsZXIo
KQ0KKyAgc2VydmljZSwgdGhlbiBhIHNvZnQgdGltZXIgaW50ZXJydXB0IHdpbGwgYmUgZ2VuZXJh
dGVkLiBJZiB0aGUgdGltZXIgaW50ZXJydXB0IGlzDQorICBlbmFibGVkIHdoZW4gdGhpcyBzZXJ2
aWNlIGlzIGNhbGxlZCwgdGhlbiB0aGUgcmVnaXN0ZXJlZCBoYW5kbGVyIHdpbGwgYmUgaW52b2tl
ZC4gVGhlDQorICByZWdpc3RlcmVkIGhhbmRsZXIgc2hvdWxkIG5vdCBiZSBhYmxlIHRvIGRpc3Rp
bmd1aXNoIGEgaGFyZHdhcmUtZ2VuZXJhdGVkIHRpbWVyDQorICBpbnRlcnJ1cHQgZnJvbSBhIHNv
ZnR3YXJlLWdlbmVyYXRlZCB0aW1lciBpbnRlcnJ1cHQuDQorDQorDQorICBAcGFyYW0gVGhpcyAg
ICAgICAgICAgICAgVGhlIEVGSV9USU1FUl9BUkNIX1BST1RPQ09MIGluc3RhbmNlLg0KKw0KKyAg
QHJldHZhbCBFRklfU1VDQ0VTUyAgICAgICBUaGUgc29mdCB0aW1lciBpbnRlcnJ1cHQgd2FzIGdl
bmVyYXRlZC4NCisgIEByZXR2YWwgRUZJX1VOU1VQUE9SVEVEICAgVGhlIHBsYXRmb3JtIGRvZXMg
bm90IHN1cHBvcnQgdGhlIGdlbmVyYXRpb24gb2Ygc29mdCB0aW1lciBpbnRlcnJ1cHRzLg0KKw0K
KyoqLw0KK0VGSV9TVEFUVVMNCitFRklBUEkNCitUaW1lckRyaXZlckdlbmVyYXRlU29mdEludGVy
cnVwdCAoDQorICBJTiBFRklfVElNRVJfQVJDSF9QUk9UT0NPTCAgKlRoaXMNCisgICkNCis7DQor
DQorI2VuZGlmDQpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5UaW1lckR4ZS9YZW5UaW1lckR4ZS5j
IGIvT3ZtZlBrZy9YZW5UaW1lckR4ZS9YZW5UaW1lckR4ZS5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjlmOWUwNDc2NmMKLS0tIC9kZXYvbnVsbAorKysgYi9Pdm1mUGtn
L1hlblRpbWVyRHhlL1hlblRpbWVyRHhlLmMKQEAgLTAsMCArMSwzNTUgQEAKKy8qKiBAZmlsZQ0K
KyAgVGltZXIgQXJjaGl0ZWN0dXJhbCBQcm90b2NvbCBhcyBkZWZpbmVkIGluIHRoZSBEWEUgQ0lT
DQorDQorQ29weXJpZ2h0IChjKSAyMDA1IC0gMjAxOCwgSW50ZWwgQ29ycG9yYXRpb24uIEFsbCBy
aWdodHMgcmVzZXJ2ZWQuPEJSPg0KK0NvcHlyaWdodCAoYykgMjAxOSwgQ2l0cml4IFN5c3RlbXMs
IEluYy4NCisNCitTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlLVBhdGVudA0K
Kw0KKyoqLw0KKw0KKyNpbmNsdWRlICJYZW5UaW1lckR4ZS5oIg0KKw0KKy8vDQorLy8gVGhlIGhh
bmRsZSBvbnRvIHdoaWNoIHRoZSBUaW1lciBBcmNoaXRlY3R1cmFsIFByb3RvY29sIHdpbGwgYmUg
aW5zdGFsbGVkDQorLy8NCitFRklfSEFORExFICAgICAgICAgICAgICAgIG1UaW1lckhhbmRsZSA9
IE5VTEw7DQorDQorLy8NCisvLyBUaGUgVGltZXIgQXJjaGl0ZWN0dXJhbCBQcm90b2NvbCB0aGF0
IHRoaXMgZHJpdmVyIHByb2R1Y2VzDQorLy8NCitFRklfVElNRVJfQVJDSF9QUk9UT0NPTCAgIG1U
aW1lciA9IHsNCisgIFRpbWVyRHJpdmVyUmVnaXN0ZXJIYW5kbGVyLA0KKyAgVGltZXJEcml2ZXJT
ZXRUaW1lclBlcmlvZCwNCisgIFRpbWVyRHJpdmVyR2V0VGltZXJQZXJpb2QsDQorICBUaW1lckRy
aXZlckdlbmVyYXRlU29mdEludGVycnVwdA0KK307DQorDQorLy8NCisvLyBQb2ludGVyIHRvIHRo
ZSBDUFUgQXJjaGl0ZWN0dXJhbCBQcm90b2NvbCBpbnN0YW5jZQ0KKy8vDQorRUZJX0NQVV9BUkNI
X1BST1RPQ09MICAgICAqbUNwdTsNCisNCisvLw0KKy8vIFRoZSBub3RpZmljYXRpb24gZnVuY3Rp
b24gdG8gY2FsbCBvbiBldmVyeSB0aW1lciBpbnRlcnJ1cHQuDQorLy8gQSBidWcgaW4gdGhlIGNv
bXBpbGVyIHByZXZlbnRzIHVzIGZyb20gaW5pdGlhbGl6aW5nIHRoaXMgaGVyZS4NCisvLw0KK0VG
SV9USU1FUl9OT1RJRlkgbVRpbWVyTm90aWZ5RnVuY3Rpb247DQorDQorLy8NCisvLyBUaGUgY3Vy
cmVudCBwZXJpb2Qgb2YgdGhlIHRpbWVyIGludGVycnVwdA0KKy8vDQordm9sYXRpbGUgVUlOVDY0
ICAgICAgICAgICBtVGltZXJQZXJpb2QgPSAwOw0KKw0KKy8vDQorLy8gV29ya2VyIEZ1bmN0aW9u
cw0KKy8vDQorLyoqDQorICBJbnRlcnJ1cHQgSGFuZGxlci4NCisNCisgIEBwYXJhbSBJbnRlcnJ1
cHRUeXBlICAgIFRoZSB0eXBlIG9mIGludGVycnVwdCB0aGF0IG9jY3VycmVkDQorICBAcGFyYW0g
U3lzdGVtQ29udGV4dCAgICBBIHBvaW50ZXIgdG8gdGhlIHN5c3RlbSBjb250ZXh0IHdoZW4gdGhl
IGludGVycnVwdCBvY2N1cnJlZA0KKyoqLw0KK1ZPSUQNCitFRklBUEkNCitUaW1lckludGVycnVw
dEhhbmRsZXIgKA0KKyAgSU4gRUZJX0VYQ0VQVElPTl9UWVBFICAgSW50ZXJydXB0VHlwZSwNCisg
IElOIEVGSV9TWVNURU1fQ09OVEVYVCAgIFN5c3RlbUNvbnRleHQNCisgICkNCit7DQorICBFRklf
VFBMIE9yaWdpbmFsVFBMOw0KKw0KKyAgT3JpZ2luYWxUUEwgPSBnQlMtPlJhaXNlVFBMIChUUExf
SElHSF9MRVZFTCk7DQorDQorICBTZW5kQXBpY0VvaSgpOw0KKw0KKyAgaWYgKG1UaW1lck5vdGlm
eUZ1bmN0aW9uICE9IE5VTEwpIHsNCisgICAgLy8NCisgICAgLy8gQGJ1ZyA6IFRoaXMgZG9lcyBu
b3QgaGFuZGxlIG1pc3NlZCB0aW1lciBpbnRlcnJ1cHRzDQorICAgIC8vDQorICAgIG1UaW1lck5v
dGlmeUZ1bmN0aW9uIChtVGltZXJQZXJpb2QpOw0KKyAgfQ0KKw0KKyAgZ0JTLT5SZXN0b3JlVFBM
IChPcmlnaW5hbFRQTCk7DQorfQ0KKw0KKy8qKg0KKw0KKyAgVGhpcyBmdW5jdGlvbiByZWdpc3Rl
cnMgdGhlIGhhbmRsZXIgTm90aWZ5RnVuY3Rpb24gc28gaXQgaXMgY2FsbGVkIGV2ZXJ5IHRpbWUN
CisgIHRoZSB0aW1lciBpbnRlcnJ1cHQgZmlyZXMuICBJdCBhbHNvIHBhc3NlcyB0aGUgYW1vdW50
IG9mIHRpbWUgc2luY2UgdGhlIGxhc3QNCisgIGhhbmRsZXIgY2FsbCB0byB0aGUgTm90aWZ5RnVu
Y3Rpb24uICBJZiBOb3RpZnlGdW5jdGlvbiBpcyBOVUxMLCB0aGVuIHRoZQ0KKyAgaGFuZGxlciBp
cyB1bnJlZ2lzdGVyZWQuICBJZiB0aGUgaGFuZGxlciBpcyByZWdpc3RlcmVkLCB0aGVuIEVGSV9T
VUNDRVNTIGlzDQorICByZXR1cm5lZC4gIElmIHRoZSBDUFUgZG9lcyBub3Qgc3VwcG9ydCByZWdp
c3RlcmluZyBhIHRpbWVyIGludGVycnVwdCBoYW5kbGVyLA0KKyAgdGhlbiBFRklfVU5TVVBQT1JU
RUQgaXMgcmV0dXJuZWQuICBJZiBhbiBhdHRlbXB0IGlzIG1hZGUgdG8gcmVnaXN0ZXIgYSBoYW5k
bGVyDQorICB3aGVuIGEgaGFuZGxlciBpcyBhbHJlYWR5IHJlZ2lzdGVyZWQsIHRoZW4gRUZJX0FM
UkVBRFlfU1RBUlRFRCBpcyByZXR1cm5lZC4NCisgIElmIGFuIGF0dGVtcHQgaXMgbWFkZSB0byB1
bnJlZ2lzdGVyIGEgaGFuZGxlciB3aGVuIGEgaGFuZGxlciBpcyBub3QgcmVnaXN0ZXJlZCwNCisg
IHRoZW4gRUZJX0lOVkFMSURfUEFSQU1FVEVSIGlzIHJldHVybmVkLiAgSWYgYW4gZXJyb3Igb2Nj
dXJzIGF0dGVtcHRpbmcgdG8NCisgIHJlZ2lzdGVyIHRoZSBOb3RpZnlGdW5jdGlvbiB3aXRoIHRo
ZSB0aW1lciBpbnRlcnJ1cHQsIHRoZW4gRUZJX0RFVklDRV9FUlJPUg0KKyAgaXMgcmV0dXJuZWQu
DQorDQorDQorICBAcGFyYW0gVGhpcyAgICAgICAgICAgICBUaGUgRUZJX1RJTUVSX0FSQ0hfUFJP
VE9DT0wgaW5zdGFuY2UuDQorICBAcGFyYW0gTm90aWZ5RnVuY3Rpb24gICBUaGUgZnVuY3Rpb24g
dG8gY2FsbCB3aGVuIGEgdGltZXIgaW50ZXJydXB0IGZpcmVzLiAgVGhpcw0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgZnVuY3Rpb24gZXhlY3V0ZXMgYXQgVFBMX0hJR0hfTEVWRUwuICBUaGUg
RFhFIENvcmUgd2lsbA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnaXN0ZXIgYSBoYW5k
bGVyIGZvciB0aGUgdGltZXIgaW50ZXJydXB0LCBzbyBpdCBjYW4ga25vdw0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgaG93IG11Y2ggdGltZSBoYXMgcGFzc2VkLiAgVGhpcyBpbmZvcm1hdGlv
biBpcyB1c2VkIHRvDQorICAgICAgICAgICAgICAgICAgICAgICAgICBzaWduYWwgdGltZXIgYmFz
ZWQgZXZlbnRzLiAgTlVMTCB3aWxsIHVucmVnaXN0ZXIgdGhlIGhhbmRsZXIuDQorDQorICBAcmV0
dmFsICAgICAgICBFRklfU1VDQ0VTUyAgICAgICAgICAgIFRoZSB0aW1lciBoYW5kbGVyIHdhcyBy
ZWdpc3RlcmVkLg0KKyAgQHJldHZhbCAgICAgICAgRUZJX1VOU1VQUE9SVEVEICAgICAgICBUaGUg
cGxhdGZvcm0gZG9lcyBub3Qgc3VwcG9ydCB0aW1lciBpbnRlcnJ1cHRzLg0KKyAgQHJldHZhbCAg
ICAgICAgRUZJX0FMUkVBRFlfU1RBUlRFRCAgICBOb3RpZnlGdW5jdGlvbiBpcyBub3QgTlVMTCwg
YW5kIGEgaGFuZGxlciBpcyBhbHJlYWR5DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZ2lzdGVyZWQuDQorICBAcmV0dmFsICAgICAgICBFRklfSU5WQUxJRF9QQVJB
TUVURVIgIE5vdGlmeUZ1bmN0aW9uIGlzIE5VTEwsIGFuZCBhIGhhbmRsZXIgd2FzIG5vdA0KKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmV2aW91c2x5IHJlZ2lzdGVy
ZWQuDQorICBAcmV0dmFsICAgICAgICBFRklfREVWSUNFX0VSUk9SICAgICAgIFRoZSB0aW1lciBo
YW5kbGVyIGNvdWxkIG5vdCBiZSByZWdpc3RlcmVkLg0KKw0KKyoqLw0KK0VGSV9TVEFUVVMNCitF
RklBUEkNCitUaW1lckRyaXZlclJlZ2lzdGVySGFuZGxlciAoDQorICBJTiBFRklfVElNRVJfQVJD
SF9QUk9UT0NPTCAgKlRoaXMsDQorICBJTiBFRklfVElNRVJfTk9USUZZICAgICAgICAgTm90aWZ5
RnVuY3Rpb24NCisgICkNCit7DQorICAvLw0KKyAgLy8gQ2hlY2sgZm9yIGludmFsaWQgcGFyYW1l
dGVycw0KKyAgLy8NCisgIGlmIChOb3RpZnlGdW5jdGlvbiA9PSBOVUxMICYmIG1UaW1lck5vdGlm
eUZ1bmN0aW9uID09IE5VTEwpIHsNCisgICAgcmV0dXJuIEVGSV9JTlZBTElEX1BBUkFNRVRFUjsN
CisgIH0NCisNCisgIGlmIChOb3RpZnlGdW5jdGlvbiAhPSBOVUxMICYmIG1UaW1lck5vdGlmeUZ1
bmN0aW9uICE9IE5VTEwpIHsNCisgICAgcmV0dXJuIEVGSV9BTFJFQURZX1NUQVJURUQ7DQorICB9
DQorDQorICBtVGltZXJOb3RpZnlGdW5jdGlvbiA9IE5vdGlmeUZ1bmN0aW9uOw0KKw0KKyAgcmV0
dXJuIEVGSV9TVUNDRVNTOw0KK30NCisNCisvKioNCisNCisgIFRoaXMgZnVuY3Rpb24gYWRqdXN0
cyB0aGUgcGVyaW9kIG9mIHRpbWVyIGludGVycnVwdHMgdG8gdGhlIHZhbHVlIHNwZWNpZmllZA0K
KyAgYnkgVGltZXJQZXJpb2QuICBJZiB0aGUgdGltZXIgcGVyaW9kIGlzIHVwZGF0ZWQsIHRoZW4g
dGhlIHNlbGVjdGVkIHRpbWVyDQorICBwZXJpb2QgaXMgc3RvcmVkIGluIEVGSV9USU1FUi5UaW1l
clBlcmlvZCwgYW5kIEVGSV9TVUNDRVNTIGlzIHJldHVybmVkLiAgSWYNCisgIHRoZSB0aW1lciBo
YXJkd2FyZSBpcyBub3QgcHJvZ3JhbW1hYmxlLCB0aGVuIEVGSV9VTlNVUFBPUlRFRCBpcyByZXR1
cm5lZC4NCisgIElmIGFuIGVycm9yIG9jY3VycyB3aGlsZSBhdHRlbXB0aW5nIHRvIHVwZGF0ZSB0
aGUgdGltZXIgcGVyaW9kLCB0aGVuIHRoZQ0KKyAgdGltZXIgaGFyZHdhcmUgd2lsbCBiZSBwdXQg
YmFjayBpbiBpdHMgc3RhdGUgcHJpb3IgdG8gdGhpcyBjYWxsLCBhbmQNCisgIEVGSV9ERVZJQ0Vf
RVJST1IgaXMgcmV0dXJuZWQuICBJZiBUaW1lclBlcmlvZCBpcyAwLCB0aGVuIHRoZSB0aW1lciBp
bnRlcnJ1cHQNCisgIGlzIGRpc2FibGVkLiAgVGhpcyBpcyBub3QgdGhlIHNhbWUgYXMgZGlzYWJs
aW5nIHRoZSBDUFUncyBpbnRlcnJ1cHRzLg0KKyAgSW5zdGVhZCwgaXQgbXVzdCBlaXRoZXIgdHVy
biBvZmYgdGhlIHRpbWVyIGhhcmR3YXJlLCBvciBpdCBtdXN0IGFkanVzdCB0aGUNCisgIGludGVy
cnVwdCBjb250cm9sbGVyIHNvIHRoYXQgYSBDUFUgaW50ZXJydXB0IGlzIG5vdCBnZW5lcmF0ZWQg
d2hlbiB0aGUgdGltZXINCisgIGludGVycnVwdCBmaXJlcy4NCisNCisNCisgIEBwYXJhbSBUaGlz
ICAgICAgICAgICAgVGhlIEVGSV9USU1FUl9BUkNIX1BST1RPQ09MIGluc3RhbmNlLg0KKyAgQHBh
cmFtIFRpbWVyUGVyaW9kICAgICBUaGUgcmF0ZSB0byBwcm9ncmFtIHRoZSB0aW1lciBpbnRlcnJ1
cHQgaW4gMTAwIG5TIHVuaXRzLiAgSWYNCisgICAgICAgICAgICAgICAgICAgICAgICAgdGhlIHRp
bWVyIGhhcmR3YXJlIGlzIG5vdCBwcm9ncmFtbWFibGUsIHRoZW4gRUZJX1VOU1VQUE9SVEVEIGlz
DQorICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybmVkLiAgSWYgdGhlIHRpbWVyIGlzIHBy
b2dyYW1tYWJsZSwgdGhlbiB0aGUgdGltZXIgcGVyaW9kDQorICAgICAgICAgICAgICAgICAgICAg
ICAgIHdpbGwgYmUgcm91bmRlZCB1cCB0byB0aGUgbmVhcmVzdCB0aW1lciBwZXJpb2QgdGhhdCBp
cyBzdXBwb3J0ZWQNCisgICAgICAgICAgICAgICAgICAgICAgICAgYnkgdGhlIHRpbWVyIGhhcmR3
YXJlLiAgSWYgVGltZXJQZXJpb2QgaXMgc2V0IHRvIDAsIHRoZW4gdGhlDQorICAgICAgICAgICAg
ICAgICAgICAgICAgIHRpbWVyIGludGVycnVwdHMgd2lsbCBiZSBkaXNhYmxlZC4NCisNCisgIEBy
ZXR2YWwgICAgICAgIEVGSV9TVUNDRVNTICAgICAgIFRoZSB0aW1lciBwZXJpb2Qgd2FzIGNoYW5n
ZWQuDQorICBAcmV0dmFsICAgICAgICBFRklfVU5TVVBQT1JURUQgICBUaGUgcGxhdGZvcm0gY2Fu
bm90IGNoYW5nZSB0aGUgcGVyaW9kIG9mIHRoZSB0aW1lciBpbnRlcnJ1cHQuDQorICBAcmV0dmFs
ICAgICAgICBFRklfREVWSUNFX0VSUk9SICBUaGUgdGltZXIgcGVyaW9kIGNvdWxkIG5vdCBiZSBj
aGFuZ2VkIGR1ZSB0byBhIGRldmljZSBlcnJvci4NCisNCisqKi8NCitFRklfU1RBVFVTDQorRUZJ
QVBJDQorVGltZXJEcml2ZXJTZXRUaW1lclBlcmlvZCAoDQorICBJTiBFRklfVElNRVJfQVJDSF9Q
Uk9UT0NPTCAgKlRoaXMsDQorICBJTiBVSU5UNjQgICAgICAgICAgICAgICAgICAgVGltZXJQZXJp
b2QNCisgICkNCit7DQorICBVSU5UNjQgIFRpbWVyQ291bnQ7DQorICBVSU5UMzIgIFRpbWVyRnJl
cXVlbmN5Ow0KKyAgVUlOVE4gICBEaXZpZGVWYWx1ZSA9IDE7DQorDQorICBpZiAoVGltZXJQZXJp
b2QgPT0gMCkgew0KKyAgICAvLw0KKyAgICAvLyBEaXNhYmxlIHRpbWVyIGludGVycnVwdCBmb3Ig
YSBUaW1lclBlcmlvZCBvZiAwDQorICAgIC8vDQorICAgIERpc2FibGVBcGljVGltZXJJbnRlcnJ1
cHQoKTsNCisgIH0gZWxzZSB7DQorICAgIFRpbWVyRnJlcXVlbmN5ID0gUGNkR2V0MzIoUGNkRlNC
Q2xvY2spIC8gRGl2aWRlVmFsdWU7DQorDQorICAgIC8vDQorICAgIC8vIENvbnZlcnQgVGltZXJQ
ZXJpb2QgaW50byBsb2NhbCBBUElDIGNvdW50cw0KKyAgICAvLw0KKyAgICAvLyBUaW1lclBlcmlv
ZCBpcyBpbiAxMDBucw0KKyAgICAvLyBUaW1lclBlcmlvZC8xMDAwMDAwMCB3aWxsIGJlIGluIHNl
Y29uZHMuDQorICAgIFRpbWVyQ291bnQgPSBEaXZVNjR4MzIgKE11bHRVNjR4MzIgKFRpbWVyUGVy
aW9kLCBUaW1lckZyZXF1ZW5jeSksDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEwMDAw
MDAwKTsNCisNCisgICAgLy8gQ2hlY2sgZm9yIG92ZXJmbG93DQorICAgIGlmIChUaW1lckNvdW50
ID4gTUFYX1VJTlQzMikgew0KKyAgICAgIFRpbWVyQ291bnQgPSBNQVhfVUlOVDMyOw0KKyAgICAg
IC8qIFRpbWVyUGVyaW9kID0gKE1BWF9VSU5UMzIgLyBUaW1lckZyZXF1ZW5jeSkgKiAxMDAwMDAw
MDsgKi8NCisgICAgICBUaW1lclBlcmlvZCA9IDQyOTQ5NjczMDsNCisgICAgfQ0KKw0KKyAgICAv
Lw0KKyAgICAvLyBQcm9ncmFtIHRoZSB0aW1lciB3aXRoIHRoZSBuZXcgY291bnQgdmFsdWUNCisg
ICAgLy8NCisgICAgSW5pdGlhbGl6ZUFwaWNUaW1lcihEaXZpZGVWYWx1ZSwgVGltZXJDb3VudCwg
VFJVRSwgTE9DQUxfQVBJQ19USU1FUl9WRUNUT1IpOw0KKw0KKyAgICAvLw0KKyAgICAvLyBFbmFi
bGUgdGltZXIgaW50ZXJydXB0DQorICAgIC8vDQorICAgIEVuYWJsZUFwaWNUaW1lckludGVycnVw
dCgpOw0KKyAgfQ0KKyAgLy8NCisgIC8vIFNhdmUgdGhlIG5ldyB0aW1lciBwZXJpb2QNCisgIC8v
DQorICBtVGltZXJQZXJpb2QgPSBUaW1lclBlcmlvZDsNCisNCisgIHJldHVybiBFRklfU1VDQ0VT
UzsNCit9DQorDQorLyoqDQorDQorICBUaGlzIGZ1bmN0aW9uIHJldHJpZXZlcyB0aGUgcGVyaW9k
IG9mIHRpbWVyIGludGVycnVwdHMgaW4gMTAwIG5zIHVuaXRzLA0KKyAgcmV0dXJucyB0aGF0IHZh
bHVlIGluIFRpbWVyUGVyaW9kLCBhbmQgcmV0dXJucyBFRklfU1VDQ0VTUy4gIElmIFRpbWVyUGVy
aW9kDQorICBpcyBOVUxMLCB0aGVuIEVGSV9JTlZBTElEX1BBUkFNRVRFUiBpcyByZXR1cm5lZC4g
IElmIGEgVGltZXJQZXJpb2Qgb2YgMCBpcw0KKyAgcmV0dXJuZWQsIHRoZW4gdGhlIHRpbWVyIGlz
IGN1cnJlbnRseSBkaXNhYmxlZC4NCisNCisNCisgIEBwYXJhbSBUaGlzICAgICAgICAgICAgVGhl
IEVGSV9USU1FUl9BUkNIX1BST1RPQ09MIGluc3RhbmNlLg0KKyAgQHBhcmFtIFRpbWVyUGVyaW9k
ICAgICBBIHBvaW50ZXIgdG8gdGhlIHRpbWVyIHBlcmlvZCB0byByZXRyaWV2ZSBpbiAxMDAgbnMg
dW5pdHMuICBJZg0KKyAgICAgICAgICAgICAgICAgICAgICAgICAwIGlzIHJldHVybmVkLCB0aGVu
IHRoZSB0aW1lciBpcyBjdXJyZW50bHkgZGlzYWJsZWQuDQorDQorICBAcmV0dmFsIEVGSV9TVUND
RVNTICAgICAgICAgICAgVGhlIHRpbWVyIHBlcmlvZCB3YXMgcmV0dXJuZWQgaW4gVGltZXJQZXJp
b2QuDQorICBAcmV0dmFsIEVGSV9JTlZBTElEX1BBUkFNRVRFUiAgVGltZXJQZXJpb2QgaXMgTlVM
TC4NCisNCisqKi8NCitFRklfU1RBVFVTDQorRUZJQVBJDQorVGltZXJEcml2ZXJHZXRUaW1lclBl
cmlvZCAoDQorICBJTiBFRklfVElNRVJfQVJDSF9QUk9UT0NPTCAgICpUaGlzLA0KKyAgT1VUIFVJ
TlQ2NCAgICAgICAgICAgICAgICAgICAqVGltZXJQZXJpb2QNCisgICkNCit7DQorICBpZiAoVGlt
ZXJQZXJpb2QgPT0gTlVMTCkgew0KKyAgICByZXR1cm4gRUZJX0lOVkFMSURfUEFSQU1FVEVSOw0K
KyAgfQ0KKw0KKyAgKlRpbWVyUGVyaW9kID0gbVRpbWVyUGVyaW9kOw0KKw0KKyAgcmV0dXJuIEVG
SV9TVUNDRVNTOw0KK30NCisNCisvKioNCisNCisgIFRoaXMgZnVuY3Rpb24gZ2VuZXJhdGVzIGEg
c29mdCB0aW1lciBpbnRlcnJ1cHQuIElmIHRoZSBwbGF0Zm9ybSBkb2VzIG5vdCBzdXBwb3J0IHNv
ZnQNCisgIHRpbWVyIGludGVycnVwdHMsIHRoZW4gRUZJX1VOU1VQUE9SVEVEIGlzIHJldHVybmVk
LiBPdGhlcndpc2UsIEVGSV9TVUNDRVNTIGlzIHJldHVybmVkLg0KKyAgSWYgYSBoYW5kbGVyIGhh
cyBiZWVuIHJlZ2lzdGVyZWQgdGhyb3VnaCB0aGUgRUZJX1RJTUVSX0FSQ0hfUFJPVE9DT0wuUmVn
aXN0ZXJIYW5kbGVyKCkNCisgIHNlcnZpY2UsIHRoZW4gYSBzb2Z0IHRpbWVyIGludGVycnVwdCB3
aWxsIGJlIGdlbmVyYXRlZC4gSWYgdGhlIHRpbWVyIGludGVycnVwdCBpcw0KKyAgZW5hYmxlZCB3
aGVuIHRoaXMgc2VydmljZSBpcyBjYWxsZWQsIHRoZW4gdGhlIHJlZ2lzdGVyZWQgaGFuZGxlciB3
aWxsIGJlIGludm9rZWQuIFRoZQ0KKyAgcmVnaXN0ZXJlZCBoYW5kbGVyIHNob3VsZCBub3QgYmUg
YWJsZSB0byBkaXN0aW5ndWlzaCBhIGhhcmR3YXJlLWdlbmVyYXRlZCB0aW1lcg0KKyAgaW50ZXJy
dXB0IGZyb20gYSBzb2Z0d2FyZS1nZW5lcmF0ZWQgdGltZXIgaW50ZXJydXB0Lg0KKw0KKw0KKyAg
QHBhcmFtIFRoaXMgICAgICAgICAgICAgIFRoZSBFRklfVElNRVJfQVJDSF9QUk9UT0NPTCBpbnN0
YW5jZS4NCisNCisgIEByZXR2YWwgRUZJX1NVQ0NFU1MgICAgICAgVGhlIHNvZnQgdGltZXIgaW50
ZXJydXB0IHdhcyBnZW5lcmF0ZWQuDQorICBAcmV0dmFsIEVGSV9VTlNVUFBPUlRFRCAgIFRoZSBw
bGF0Zm9ybSBkb2VzIG5vdCBzdXBwb3J0IHRoZSBnZW5lcmF0aW9uIG9mIHNvZnQgdGltZXIgaW50
ZXJydXB0cy4NCisNCisqKi8NCitFRklfU1RBVFVTDQorRUZJQVBJDQorVGltZXJEcml2ZXJHZW5l
cmF0ZVNvZnRJbnRlcnJ1cHQgKA0KKyAgSU4gRUZJX1RJTUVSX0FSQ0hfUFJPVE9DT0wgICpUaGlz
DQorICApDQorew0KKyAgRUZJX1RQTCAgICAgT3JpZ2luYWxUUEw7DQorDQorICBpZiAoR2V0QXBp
Y1RpbWVySW50ZXJydXB0U3RhdGUoKSkgew0KKyAgICAvLw0KKyAgICAvLyBJbnZva2UgdGhlIHJl
Z2lzdGVyZWQgaGFuZGxlcg0KKyAgICAvLw0KKyAgICBPcmlnaW5hbFRQTCA9IGdCUy0+UmFpc2VU
UEwgKFRQTF9ISUdIX0xFVkVMKTsNCisNCisgICAgaWYgKG1UaW1lck5vdGlmeUZ1bmN0aW9uICE9
IE5VTEwpIHsNCisgICAgICAvLw0KKyAgICAgIC8vIEBidWcgOiBUaGlzIGRvZXMgbm90IGhhbmRs
ZSBtaXNzZWQgdGltZXIgaW50ZXJydXB0cw0KKyAgICAgIC8vDQorICAgICAgbVRpbWVyTm90aWZ5
RnVuY3Rpb24gKG1UaW1lclBlcmlvZCk7DQorICAgIH0NCisNCisgICAgZ0JTLT5SZXN0b3JlVFBM
IChPcmlnaW5hbFRQTCk7DQorICB9IGVsc2Ugew0KKyAgICByZXR1cm4gRUZJX1VOU1VQUE9SVEVE
Ow0KKyAgfQ0KKw0KKyAgcmV0dXJuIEVGSV9TVUNDRVNTOw0KK30NCisNCisvKioNCisgIEluaXRp
YWxpemUgdGhlIFRpbWVyIEFyY2hpdGVjdHVyYWwgUHJvdG9jb2wgZHJpdmVyDQorDQorICBAcGFy
YW0gSW1hZ2VIYW5kbGUgICAgIEltYWdlSGFuZGxlIG9mIHRoZSBsb2FkZWQgZHJpdmVyDQorICBA
cGFyYW0gU3lzdGVtVGFibGUgICAgIFBvaW50ZXIgdG8gdGhlIFN5c3RlbSBUYWJsZQ0KKw0KKyAg
QHJldHZhbCBFRklfU1VDQ0VTUyAgICAgICAgICAgIFRpbWVyIEFyY2hpdGVjdHVyYWwgUHJvdG9j
b2wgY3JlYXRlZA0KKyAgQHJldHZhbCBFRklfT1VUX09GX1JFU09VUkNFUyAgIE5vdCBlbm91Z2gg
cmVzb3VyY2VzIGF2YWlsYWJsZSB0byBpbml0aWFsaXplIGRyaXZlci4NCisgIEByZXR2YWwgRUZJ
X0RFVklDRV9FUlJPUiAgICAgICBBIGRldmljZSBlcnJvciBvY2N1cnJlZCBhdHRlbXB0aW5nIHRv
IGluaXRpYWxpemUgdGhlIGRyaXZlci4NCisNCisqKi8NCitFRklfU1RBVFVTDQorRUZJQVBJDQor
VGltZXJEcml2ZXJJbml0aWFsaXplICgNCisgIElOIEVGSV9IQU5ETEUgICAgICAgIEltYWdlSGFu
ZGxlLA0KKyAgSU4gRUZJX1NZU1RFTV9UQUJMRSAgKlN5c3RlbVRhYmxlDQorICApDQorew0KKyAg
RUZJX1NUQVRVUyAgU3RhdHVzOw0KKw0KKyAgLy8NCisgIC8vIEluaXRpYWxpemUgdGhlIHBvaW50
ZXIgdG8gb3VyIG5vdGlmeSBmdW5jdGlvbi4NCisgIC8vDQorICBtVGltZXJOb3RpZnlGdW5jdGlv
biA9IE5VTEw7DQorDQorICAvLw0KKyAgLy8gTWFrZSBzdXJlIHRoZSBUaW1lciBBcmNoaXRlY3R1
cmFsIFByb3RvY29sIGlzIG5vdCBhbHJlYWR5IGluc3RhbGxlZCBpbiB0aGUgc3lzdGVtDQorICAv
Lw0KKyAgQVNTRVJUX1BST1RPQ09MX0FMUkVBRFlfSU5TVEFMTEVEIChOVUxMLCAmZ0VmaVRpbWVy
QXJjaFByb3RvY29sR3VpZCk7DQorDQorICAvLw0KKyAgLy8gRmluZCB0aGUgQ1BVIGFyY2hpdGVj
dHVyYWwgcHJvdG9jb2wuDQorICAvLw0KKyAgU3RhdHVzID0gZ0JTLT5Mb2NhdGVQcm90b2NvbCAo
JmdFZmlDcHVBcmNoUHJvdG9jb2xHdWlkLCBOVUxMLCAoVk9JRCAqKikgJm1DcHUpOw0KKyAgQVNT
RVJUX0VGSV9FUlJPUiAoU3RhdHVzKTsNCisNCisgIC8vDQorICAvLyBGb3JjZSB0aGUgdGltZXIg
dG8gYmUgZGlzYWJsZWQNCisgIC8vDQorICBTdGF0dXMgPSBUaW1lckRyaXZlclNldFRpbWVyUGVy
aW9kICgmbVRpbWVyLCAwKTsNCisgIEFTU0VSVF9FRklfRVJST1IgKFN0YXR1cyk7DQorDQorICAv
Lw0KKyAgLy8gSW5zdGFsbCBpbnRlcnJ1cHQgaGFuZGxlciBmb3IgTG9jYWwgQVBJQyBUaW1lcg0K
KyAgLy8NCisgIFN0YXR1cyA9IG1DcHUtPlJlZ2lzdGVySW50ZXJydXB0SGFuZGxlciAobUNwdSwg
TE9DQUxfQVBJQ19USU1FUl9WRUNUT1IsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFRpbWVySW50ZXJydXB0SGFuZGxlcik7DQorICBBU1NFUlRfRUZJX0VSUk9S
IChTdGF0dXMpOw0KKw0KKyAgLy8NCisgIC8vIEZvcmNlIHRoZSB0aW1lciB0byBiZSBlbmFibGVk
IGF0IGl0cyBkZWZhdWx0IHBlcmlvZA0KKyAgLy8NCisgIFN0YXR1cyA9IFRpbWVyRHJpdmVyU2V0
VGltZXJQZXJpb2QgKCZtVGltZXIsIERFRkFVTFRfVElNRVJfVElDS19EVVJBVElPTik7DQorICBB
U1NFUlRfRUZJX0VSUk9SIChTdGF0dXMpOw0KKw0KKyAgLy8NCisgIC8vIEluc3RhbGwgdGhlIFRp
bWVyIEFyY2hpdGVjdHVyYWwgUHJvdG9jb2wgb250byBhIG5ldyBoYW5kbGUNCisgIC8vDQorICBT
dGF0dXMgPSBnQlMtPkluc3RhbGxNdWx0aXBsZVByb3RvY29sSW50ZXJmYWNlcyAoDQorICAgICAg
ICAgICAgICAgICAgJm1UaW1lckhhbmRsZSwNCisgICAgICAgICAgICAgICAgICAmZ0VmaVRpbWVy
QXJjaFByb3RvY29sR3VpZCwgJm1UaW1lciwNCisgICAgICAgICAgICAgICAgICBOVUxMDQorICAg
ICAgICAgICAgICAgICAgKTsNCisgIEFTU0VSVF9FRklfRVJST1IgKFN0YXR1cyk7DQorDQorICBy
ZXR1cm4gU3RhdHVzOw0KK30NCisNCmRpZmYgLS1naXQgYS9NYWludGFpbmVycy50eHQgYi9NYWlu
dGFpbmVycy50eHQKaW5kZXggZjUxNzMxYTZiNi4uNzhlOWY4ODlhYiAxMDA2NDQKLS0tIGEvTWFp
bnRhaW5lcnMudHh0CisrKyBiL01haW50YWluZXJzLnR4dApAQCAtMzg1LDYgKzM4NSw3IEBAIEY6
IE92bWZQa2cvWGVuSW9QY2lEeGUvCiBGOiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpLw0KIEY6IE92
bWZQa2cvWGVuUHZCbGtEeGUvDQogRjogT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci8NCitGOiBPdm1m
UGtnL1hlblRpbWVyRHhlLw0KIFI6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPg0KIFI6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQogDQotLSAK
QW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
