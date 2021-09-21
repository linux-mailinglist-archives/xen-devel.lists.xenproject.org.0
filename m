Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF13412AAE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 03:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191271.341229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSUsV-0002JO-Hs; Tue, 21 Sep 2021 01:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191271.341229; Tue, 21 Sep 2021 01:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSUsV-0002Gv-Dq; Tue, 21 Sep 2021 01:47:23 +0000
Received: by outflank-mailman (input) for mailman id 191271;
 Tue, 21 Sep 2021 01:47:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvEq=OL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mSUsT-0002Gp-WF
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 01:47:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbc527f2-1a7d-11ec-b893-12813bfff9fa;
 Tue, 21 Sep 2021 01:47:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4D8F60F6D;
 Tue, 21 Sep 2021 01:47:19 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: dbc527f2-1a7d-11ec-b893-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632188839;
	bh=I5VKcWngTdDEZip7JAp1tRcAkJbmXfrVY13T3xHXOaw=;
	h=Date:From:To:cc:Subject:From;
	b=UArsbmKda49UVQo/ke0IZJ4ZLMBO6LDdGfa2hHqPsAg8bzzSv6AvvNvDQ6H1/Rc5a
	 6IaWCq+zlJutCd2Fl6aSGiKMJYgW6lXyFfmUobVI17nUq9u3pD7O+mvtzpgYgcSDti
	 4UpcI2RkXEFHYzpxB97pVp+gR9Xs8tAMikiLrTUD8JLJjgkYROKqKb1ruvFPR63ri+
	 pETojKK/bGQU541yqjQhetswKmPeyaDyWUbPaeiLaWcpWNOrfN2jlSGRZVJr3LP0dZ
	 R89HMt3S/5ubbWZv4YpYrN/ST4soZrY3xhNhXTC/Kpgp3fxKUYjWiUsiDydpGfqr2w
	 zsgEZFoCJRigQ==
Date: Mon, 20 Sep 2021 18:47:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Bertrand.Marquis@arm.com
Subject: Example patch to send SGIs with a hypercall 
Message-ID: <alpine.DEB.2.21.2109201835220.17979@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-238579627-1632188254=:17979"
Content-ID: <alpine.DEB.2.21.2109201837440.17979@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-238579627-1632188254=:17979
Content-Type: text/plain; CHARSET=US-ASCII
Content-ID: <alpine.DEB.2.21.2109201837441.17979@sstabellini-ThinkPad-T480s>

Hi all,

Next week I'll be giving a talk about VM-to-VM communication mechanisms
at Embedded Linux Conf in Seattle.

One of the techniques I'll discuss, also the simplest, is shared memory
and interrupts. Although there is no binding to share memory between
dom0less VMs yet, it is already possible to do that with a workaround.
But it is not possible to send interrupts between dom0less VMs yet.

The attached patch introduces a trivial hypercall to inject SGI
interrupts into other Dom0less VMs. It is easy to use for baremetal
guests and other kernels without Xen support (no Xen drivers needed).
I'd like to share the patch publicly in advance of the talk, so that I
can reference it during the presentation. The patch is not meant for
upstreaming at this point.

Beware that it comes with no usage restrictions (no rate limiting
and/or no target limits).

Cheers,

Stefano
--8323329-238579627-1632188254=:17979
Content-Type: text/x-diff; name=xen-sgi.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.21.2109201847190.17979@sstabellini-ThinkPad-T480s>
Content-Description: 
Content-Disposition: attachment; filename=xen-sgi.patch

RnJvbSBjMTY5ZTJjMjg3YzE2ZDZjZGVmNmYwNzNkMTJmYTAyY2JkODAwODZj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCkRhdGU6
IE1vbiwgMjAgU2VwIDIwMjEgMTg6MzM6NDUgLTA3MDANClN1YmplY3Q6IFtQ
QVRDSF0geGVuL2FybTogaW50cm9kdWNlIFBIWVNERVZfc2dpX3NlbmQNCg0K
SW50cm9kdWNlIGEgc2ltcGxlIGh5cGVyY2FsbCB0byBpbmplY3QgYW4gU0dJ
IGludGVycnVwdCBpbnRvIGEgdGFyZ2V0DQpkb21haW4vdmNwdS4gUGxlYXNl
IG5vdGUgdGhhdCB0aGUgaW1wbGVtZW50YXRpb24gZG9lc24ndCBjb21lIHdp
dGggYW55DQpyYXRlIGxpbWl0aW5nLg0KDQpTaWduZWQtb2ZmLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29t
Pg0KLS0tDQogeGVuL2FyY2gvYXJtL3BoeXNkZXYuYyAgICAgICAgICB8IDM0
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KIHhlbi9hcmNo
L2FybS90cmFwcy5jICAgICAgICAgICAgfCAgMiArLQ0KIHhlbi9pbmNsdWRl
L2FzbS1hcm0vaHlwZXJjYWxsLmggfCAgMyArKy0NCiB4ZW4vaW5jbHVkZS9w
dWJsaWMvcGh5c2Rldi5oICAgIHwgMTkgKysrKysrKysrKysrKysrKysrDQog
NCBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQ0KDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BoeXNkZXYuYyBi
L3hlbi9hcmNoL2FybS9waHlzZGV2LmMNCmluZGV4IGU5MTM1NWZlMjIuLjJl
ZTI5OTM5ZDIgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vcGh5c2Rldi5j
DQorKysgYi94ZW4vYXJjaC9hcm0vcGh5c2Rldi5jDQpAQCAtMTEsMTAgKzEx
LDM4IEBADQogI2luY2x1ZGUgPGFzbS9oeXBlcmNhbGwuaD4NCiANCiANCi1p
bnQgZG9fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BB
UkFNKHZvaWQpIGFyZykNCitpbnQgZG9fcGh5c2Rldl9vcChpbnQgY21kLCB1
aW50OF90IHNnaSwgdWludDE2X3QgZG9taWQsIHVpbnQzMl90IHZjcHVpZCkN
CiB7DQotICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywgIlBIWVNERVZPUCBj
bWQ9JWQ6IG5vdCBpbXBsZW1lbnRlZFxuIiwgY21kKTsNCi0gICAgcmV0dXJu
IC1FTk9TWVM7DQorICAgIGludCByYyA9IDA7DQorICAgIHN0cnVjdCBkb21h
aW4gKmQ7DQorDQorICAgIGlmICggY21kICE9IFBIWVNERVZfc2dpX3NlbmQg
KQ0KKyAgICB7DQorICAgICAgICBnZHByaW50ayhYRU5MT0dfREVCVUcsICJQ
SFlTREVWT1AgY21kPSVkOiBub3QgaW1wbGVtZW50ZWRcbiIsIGNtZCk7DQor
ICAgICAgICByZXR1cm4gLUVOT1NZUzsNCisgICAgfQ0KKw0KKyAgICBpZiAo
IHNnaSA+PSAxNiApDQorICAgIHsNCisgICAgICAgIGdkcHJpbnRrKFhFTkxP
R19ERUJVRywgIlBIWVNERVZPUF9zZ2lfc2VuZCBpbnZhbGlkIHNnaT0ldVxu
Iiwgc2dpKTsNCisgICAgICAgIHJldHVybiAtRUlOVkFMOw0KKyAgICB9DQor
DQorDQorICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lkKGRvbWlk
KTsNCisgICAgaWYgKCBkID09IE5VTEwgKQ0KKyAgICAgICAgcmV0dXJuIC1F
U1JDSDsNCisgICAgaWYgKCB2Y3B1aWQgPj0gZC0+bWF4X3ZjcHVzICkNCisg
ICAgew0KKyAgICAgICAgcmMgPSAtRUlOVkFMOw0KKyAgICAgICAgZ290byBv
dXQ7DQorICAgIH0NCisNCisgICAgdmdpY19pbmplY3RfaXJxKGQsIGQtPnZj
cHVbdmNwdWlkXSwgc2dpLCB0cnVlKTsNCisNCitvdXQ6DQorICAgIHJjdV91
bmxvY2tfZG9tYWluKGQpOw0KKyAgICByZXR1cm4gcmM7DQogfQ0KIA0KIC8q
DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RyYXBzLmMgYi94ZW4vYXJj
aC9hcm0vdHJhcHMuYw0KaW5kZXggMjE5YWIzYzNmYi4uMzc0ZWQ0OTBhMiAx
MDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS90cmFwcy5jDQorKysgYi94ZW4v
YXJjaC9hcm0vdHJhcHMuYw0KQEAgLTEzNzcsNyArMTM3Nyw3IEBAIHN0YXRp
YyBhcm1faHlwZXJjYWxsX3QgYXJtX2h5cGVyY2FsbF90YWJsZVtdID0gew0K
ICAgICBIWVBFUkNBTEwoeHNtX29wLCAxKSwNCiAgICAgSFlQRVJDQUxMKGV2
ZW50X2NoYW5uZWxfb3AsIDIpLA0KICAgICBIWVBFUkNBTExfREVQUkVDQVRF
RChldmVudF9jaGFubmVsX29wX2NvbXBhdCwgMSksDQotICAgIEhZUEVSQ0FM
TChwaHlzZGV2X29wLCAyKSwNCisgICAgSFlQRVJDQUxMKHBoeXNkZXZfb3As
IDQpLA0KICAgICBIWVBFUkNBTExfREVQUkVDQVRFRChwaHlzZGV2X29wX2Nv
bXBhdCwgMSksDQogICAgIEhZUEVSQ0FMTChzeXNjdGwsIDIpLA0KICAgICBI
WVBFUkNBTEwoaHZtX29wLCAyKSwNCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20tYXJtL2h5cGVyY2FsbC5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9o
eXBlcmNhbGwuaA0KaW5kZXggYTBjNWEzMWEyZi4uNDI5OTU0ODkwNyAxMDA2
NDQNCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaHlwZXJjYWxsLmgNCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaHlwZXJjYWxsLmgNCkBAIC0yLDcg
KzIsOCBAQA0KICNkZWZpbmUgX19BU01fQVJNX0hZUEVSQ0FMTF9IX18NCiAN
CiAjaW5jbHVkZSA8cHVibGljL2RvbWN0bC5oPiAvKiBmb3IgYXJjaF9kb19k
b21jdGwgKi8NCi1pbnQgZG9fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZyk7DQorDQoraW50IGRvX3BoeXNk
ZXZfb3AoaW50IGNtZCwgdWludDhfdCBzZ2ksIHVpbnQxNl90IGRvbWlkLCB1
aW50MzJfdCB2Y3B1aWQpOw0KIA0KIGxvbmcgZG9fYXJtX3ZjcHVfb3AoaW50
IGNtZCwgdW5zaWduZWQgaW50IHZjcHVpZCwgWEVOX0dVRVNUX0hBTkRMRV9Q
QVJBTSh2b2lkKSBhcmcpOw0KIA0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9waHlzZGV2LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvcGh5c2Rl
di5oDQppbmRleCBkMjcxNzY2YWQwLi42NDQ1OGZlN2ExIDEwMDY0NA0KLS0t
IGEveGVuL2luY2x1ZGUvcHVibGljL3BoeXNkZXYuaA0KKysrIGIveGVuL2lu
Y2x1ZGUvcHVibGljL3BoeXNkZXYuaA0KQEAgLTM0MCw2ICszNDAsMjUgQEAg
c3RydWN0IHBoeXNkZXZfZGJncF9vcCB7DQogdHlwZWRlZiBzdHJ1Y3QgcGh5
c2Rldl9kYmdwX29wIHBoeXNkZXZfZGJncF9vcF90Ow0KIERFRklORV9YRU5f
R1VFU1RfSEFORExFKHBoeXNkZXZfZGJncF9vcF90KTsNCiANCisvKg0KKyAq
IEFSTSBvbmx5IGh5cGVyY2FsbCB0byBzZW5kIGFuIFNHSSB0byBhbm90aGVy
IFZNDQorICoNCisgKiBpbnQgcGh5c2Rldl9vcChpbnQgY21kLCB1aW50OF90
IHNnaSwgdWludDE2X3QgZG9taWQsIHVpbnQzMl90IHZjcHVpZCkNCisgKg0K
KyAqIHNnaTogU0dJIG51bWJlciBvZiB0aGUgaW50ZXJydXB0IHRvIGluamVj
dA0KKyAqIGRvbWlkOiB0YXJnZXQgZG9taWQNCisgKiB2Y3B1aWQ6IHRhcmdl
dCB2Y3B1c2lkDQorICoNCisgKiBleGFtcGxlOg0KKyAqICAgICBtb3YgeDAs
ICMzMCAgLy8gUEhZU0RFVl9zZ2lfc2VuZCBjb21tYW5kDQorICogICAgIG1v
diB4MSwgIzUgICAvLyBTR0kgbnVtYmVyIDUsIGNhbiBjaG9zZSBhbnkgaW4g
dGhlIHJhbmdlIDAtMTUNCisgKiAgICAgbW92IHgyLCAjMSAgIC8vIGRlc3Rp
bmF0aW9uIGRvbWFpbiBpZCAoZS5nLiAwIGZvciBkb20wLCAxIGZvciBmaXJz
dCBkb21VKQ0KKyAqICAgICBtb3YgeDMsICMwICAgLy8gZGVzdGluYXRpb24g
dmNwdSBpZCAobm90IHBoeXNpY2FsIGNwdSksIHR5cGljYWxseSAwDQorICog
ICAgIG1vdiB4MTYsICMzMyAvLyBoeXBlcmNhbGwgcGh5c2Rldl9vcCBudW1i
ZXIgMzMNCisgKiAgICAgaHZjIDB4RUExICAgIC8vIGh5cGVyY2FsbCBjb21t
YW5kDQorICovDQorI2RlZmluZSBQSFlTREVWX3NnaV9zZW5kIDMwDQorDQog
LyoNCiAgKiBOb3RpZnkgdGhhdCBzb21lIFBJUlEtYm91bmQgZXZlbnQgY2hh
bm5lbHMgaGF2ZSBiZWVuIHVubWFza2VkLg0KICAqICoqIFRoaXMgY29tbWFu
ZCBpcyBvYnNvbGV0ZSBzaW5jZSBpbnRlcmZhY2UgdmVyc2lvbiAweDAwMDMw
MjAyIGFuZCBpcyAqKg0KLS0gDQoyLjE3LjENCg0K

--8323329-238579627-1632188254=:17979--

