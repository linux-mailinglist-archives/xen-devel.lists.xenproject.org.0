Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A701712F6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 09:35:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hppHD-0003ck-9v; Tue, 23 Jul 2019 07:31:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AY50=VU=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hppHA-0003cf-V5
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 07:31:56 +0000
X-Inumbo-ID: f269b031-ad1b-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f269b031-ad1b-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 07:31:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF63085539;
 Tue, 23 Jul 2019 07:31:54 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-52.ams2.redhat.com
 [10.36.117.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 489745D9DE;
 Tue, 23 Jul 2019 07:31:53 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-33-anthony.perard@citrix.com>
 <5ce18fa6-100f-e792-199f-cdecf6b04177@redhat.com>
 <20190722170643.GH1208@perard.uk.xensource.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ad29e58d-3bf1-0a05-5a76-25294776988f@redhat.com>
Date: Tue, 23 Jul 2019 09:31:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190722170643.GH1208@perard.uk.xensource.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 23 Jul 2019 07:31:55 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 32/35] OvmfPkg/PlatformBootManagerLib:
 Use a Xen console for ConOut/ConIn
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
Cc: xen-devel@lists.xenproject.org, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMjIvMTkgMTk6MDYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDEw
LCAyMDE5IGF0IDEyOjQ4OjU3UE0gKzAyMDAsIExhc3psbyBFcnNlayB3cm90ZToKPj4gT24gMDcv
MDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gT24gYSBYZW4gUFZIIGd1ZXN0
LCBub25lIG9mIHRoZSBleGlzdGluZyBzZXJpYWwgb3IgY29uc29sZSBpbnRlcmZhY2UKPj4+IHdv
cmtzLCBzbyB3ZSBhZGQgYSBuZXcgb25lLCBiYXNlZCBvbiBYZW5Db25zb2xlU2VyaWFsUG9ydExp
YiwgYW5kCj4+PiBpbXBsZW1lbnRlZCB2aWEgU2VyaWFsRHhlLgo+Pj4KPj4+IFRoYXQgaXMgYSBz
aW1wbGUgY29uc29sZSBpbXBsZW1lbnRhdGlvbiB0aGF0IGNhbiB3b3JrcyBvbiBib3RoIFBWSAo+
Pj4gZ3Vlc3QgYW5kIEhWTSBndWVzdHMsIGV2ZW4gaWYgaXQgcmFyZWx5IGdvaW5nIHRvIGJlIHVz
ZSBvbiBIVk0uCj4+Pgo+Pj4gSGF2ZSBQbGF0Zm9ybUJvb3RNYW5hZ2VyTGliIGxvb2sgZm9yIHRo
ZSBuZXcgY29uc29sZSwgd2hlbiBydW5uaW5nIGFzIGEKPj4+IFhlbiBndWVzdC4KPj4+Cj4+PiBS
ZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQo+
Pj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+Cj4+PiAtLS0KPiAKPj4+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1C
b290TWFuYWdlckxpYi9QbGF0Zm9ybURhdGEuYyBiL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJv
b3RNYW5hZ2VyTGliL1BsYXRmb3JtRGF0YS5jCj4+PiBpbmRleCAzNmFhYjc4NGQ3Li5hOWIxZmUy
NzRhIDEwMDY0NAo+Pj4gLS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJM
aWIvUGxhdGZvcm1EYXRhLmMKPj4+ICsrKyBiL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RN
YW5hZ2VyTGliL1BsYXRmb3JtRGF0YS5jCj4+PiBAQCAtOSwxOCArOSwxOSBAQAo+Pj4gIAo+Pj4g
ICNpbmNsdWRlICJCZHNQbGF0Zm9ybS5oIgo+Pj4gICNpbmNsdWRlIDxHdWlkL1FlbXVSYW1mYi5o
Pgo+Pj4gKyNpbmNsdWRlIDxHdWlkL1NlcmlhbFBvcnRMaWJWZW5kb3IuaD4KPj4+ICAKPj4+ICAv
Lwo+Pj4gIC8vIERlYnVnIEFnZW50IFVBUlQgRGV2aWNlIFBhdGggc3RydWN0dXJlCj4+PiAgLy8K
Pj4+IC0jcHJhZ21hIHBhY2soMSkKPj4+ICsjcHJhZ21hIHBhY2sgKDEpCj4+PiAgdHlwZWRlZiBz
dHJ1Y3Qgewo+Pj4gICAgVkVORE9SX0RFVklDRV9QQVRIICAgICAgICBWZW5kb3JIYXJkd2FyZTsK
Pj4+ICAgIFVBUlRfREVWSUNFX1BBVEggICAgICAgICAgVWFydDsKPj4+ICAgIFZFTkRPUl9ERVZJ
Q0VfUEFUSCAgICAgICAgVGVybWluYWxUeXBlOwo+Pj4gICAgRUZJX0RFVklDRV9QQVRIX1BST1RP
Q09MICBFbmQ7Cj4+PiAgfSBWRU5ET1JfVUFSVF9ERVZJQ0VfUEFUSDsKPj4+IC0jcHJhZ21hIHBh
Y2soKQo+Pj4gKyNwcmFnbWEgcGFjayAoKQo+Pj4gIAo+Pj4gIC8vCj4+PiAgLy8gVVNCIEtleWJv
YXJkIERldmljZSBQYXRoIHN0cnVjdHVyZQo+Pj4gQEAgLTQzLDYgKzQ0LDE4IEBAIHR5cGVkZWYg
c3RydWN0IHsKPj4+ICB9IFZFTkRPUl9SQU1GQl9ERVZJQ0VfUEFUSDsKPj4+ICAjcHJhZ21hIHBh
Y2sgKCkKPj4+ICAKPj4+ICsvLwo+Pj4gKy8vIFhlbiBDb25zb2xlIERldmljZSBQYXRoIHN0cnVj
dHVyZQo+Pj4gKy8vCj4+PiArI3ByYWdtYSBwYWNrKDEpCj4+PiArdHlwZWRlZiBzdHJ1Y3Qgewo+
Pj4gKyAgVkVORE9SX0RFVklDRV9QQVRIICAgICAgICBWZW5kb3JIYXJkd2FyZTsKPj4+ICsgIFVB
UlRfREVWSUNFX1BBVEggICAgICAgICAgVWFydDsKPj4+ICsgIFZFTkRPUl9ERVZJQ0VfUEFUSCAg
ICAgICAgVGVybWluYWxUeXBlOwo+Pj4gKyAgRUZJX0RFVklDRV9QQVRIX1BST1RPQ09MICBFbmQ7
Cj4+PiArfSBYRU5fQ09OU09MRV9ERVZJQ0VfUEFUSDsKPj4+ICsjcHJhZ21hIHBhY2soKQo+Pj4g
Kwo+Pgo+PiBUaGlzIHZlcnNpb24gb2YgdGhlIHBhdGNoIGFkZHJlc3NlcyBhbGwgb2YgbXkgdjIg
cmV2aWV3IGNvbW1lbnRzIChlaXRoZXIKPj4gYnkgY29kZSBjaGFuZ2VzIG9yIGJ5IGV4cGxhbmF0
aW9ucyBpbiB0aGUgTm90ZXMgc2VjdGlvbikgLS0gdGhhbmtzIGZvciB0aGF0Lgo+Pgo+PiBIb3dl
dmVyLCB3aGVuIHlvdSBhcnJpdmVkIGF0IG15IHJldXFlc3QgKDYpIGluCj4+IDxodHRwOi8vbWlk
Lm1haWwtYXJjaGl2ZS5jb20vN2Q2YWRmNWQtYmFjYS03ZTljLTY4ZWYtMmY4NDc5YmJkOTAyQHJl
ZGhhdC5jb20+LAo+PiBhbmQgc2VhcmNoZWQgdGhlIHNvdXJjZSBmaWxlIGZvciAicGFjaygiIC0t
IGluIG9yZGVyIHRvIGluc2VydCBhIHNwYWNlCj4+IGNoYXJhY3RlciBiZWZvcmUgdGhlIG9wZW5p
bmcgcGFyZW4gLS0sIHRoZSBtYXRjaCB3YXMgKm5vdCogYXJvdW5kIHRoZQo+PiBuZXcgWEVOX0NP
TlNPTEVfREVWSUNFX1BBVEggc3RydWN0dXJlLiBJbnN0ZWFkLCBpdCB3YXMgYXJvdW5kIHRoZQo+
PiBwcmVleGlzdGVudCBWRU5ET1JfVUFSVF9ERVZJQ0VfUEFUSCBzdHJ1Y3R1cmUuIEFuZCBzbyB5
b3UgZml4ZWQgdGhlCj4+IHN0eWxlIGZvciB0aGUgb2xkIGNvZGUsIGFuZCBub3QgdGhlIG5ldyBj
b2RlLgo+Pgo+PiBCdXQ6IHRoYXQncyBhY3R1YWxseSB1c2VmdWwuIEJlY2F1c2Ugbm93IHRoYXQg
SSdtIGxvb2tpbmcgYXQKPj4gVkVORE9SX1VBUlRfREVWSUNFX1BBVEgsIGl0IHNlZW1zIHRoYXQg
d2UgZG9uJ3QgbmVlZCB0aGUgbmV3IHR5cGUKPj4gWEVOX0NPTlNPTEVfREVWSUNFX1BBVEggYXQg
YWxsLiBJcyB0aGF0IHJpZ2h0PyBTbzoKPj4KPj4gKDEpIFBsZWFzZSBkcm9wIFhFTl9DT05TT0xF
X0RFVklDRV9QQVRILgo+Pgo+PiAoMikgUGxlYXNlIHJlcGxhY2UgdGhlIGNvbW1lbnQKPj4KPj4g
ICBEZWJ1ZyBBZ2VudCBVQVJUIERldmljZSBQYXRoIHN0cnVjdHVyZQo+Pgo+PiB3aXRoCj4+Cj4+
ICAgVmVuZG9yIFVBUlQgRGV2aWNlIFBhdGggc3RydWN0dXJlCj4+Cj4+IG9uIFZFTkRPUl9VQVJU
X0RFVklDRV9QQVRILgo+Pgo+PiAoMykgUGxlYXNlIHByZXNlcnZlIHRoZSAibWlzcGxhY2VkIiB3
aGl0ZXNwYWNlIGZpeCwgZm9yICJwYWNrKCIsIGFyb3VuZAo+PiBWRU5ET1JfVUFSVF9ERVZJQ0Vf
UEFUSC4KPj4KPj4gKDQpIFBsZWFzZSB1c2UgVkVORE9SX1VBUlRfREVWSUNFX1BBVEggYXMgdGhl
IHR5cGUgb2YgZ1hlbkNvbnNvbGVEZXZpY2VQYXRoLgo+Pgo+PiBXaXRoIHRob3NlOgo+Pgo+PiBS
ZXZpZXdlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KPiAKPiBJJ20gZ29p
bmcgdG8gYWRkIHRoZSBmb2xsb3dpbmcgdG8gdGhlIGNvbW1pdCBtZXNzYWdlOgo+IAo+ICAgU2lu
Y2Ugd2UgdXNlIFZFTkRPUl9VQVJUX0RFVklDRV9QQVRILCBmaXggaXRzIGRlc2NyaXB0aW9uIGFu
ZAo+ICAgY29kaW5nIHN0eWxlLgo+IAo+IAoKVGhhbmtzIQpMYXN6bG8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
