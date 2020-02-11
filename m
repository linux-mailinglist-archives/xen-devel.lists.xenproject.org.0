Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E0D1595D6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 18:01:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Yss-00078C-VU; Tue, 11 Feb 2020 16:59:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lVjU=37=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1Ysr-000784-Nm
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 16:59:37 +0000
X-Inumbo-ID: e22e1f20-4cef-11ea-9d6c-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e22e1f20-4cef-11ea-9d6c-bc764e2007e4;
 Tue, 11 Feb 2020 16:59:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C9892B235;
 Tue, 11 Feb 2020 16:59:35 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200211155155.17396-1-andrew.cooper3@citrix.com>
 <20200211163104.GM4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a3deb893-69e5-a9f9-656b-7867364d2ccc@suse.com>
Date: Tue, 11 Feb 2020 17:59:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211163104.GM4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/amd: Avoid cpu_has_hypervisor
 evaluating true on native hardware
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Claudia <claudia1@disroot.org>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAyMCAxNzozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAxMSwgMjAyMCBhdCAwMzo1MTo1NFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBD
dXJyZW50bHkgd2hlbiBib290aW5nIG5hdGl2ZSBvbiBBTUQgaGFyZHdhcmUsIGNwdWlkbWFza19k
ZWZhdWx0cy5fMWNkIGdldHMKPj4gY29uZmlndXJlZCB3aXRoIHRoZSBIWVBFUlZJU09SIGJpdCBi
ZWZvcmUgbmF0aXZlIENQVUlEIGlzIHNjYW5uZWQgZm9yIGZlYXR1cmUKPj4gYml0cy4KPj4KPj4g
VGhpcyByZXN1bHRzIGluIGNwdV9oYXNfaHlwZXJ2aXNvciBiZWNvbWluZyBzZXQgYXMgcGFydCBv
ZiBpZGVudGlmeV9jcHUoKSwgYW5kCj4+IGVuZHMgdXAgYXBwZWFyaW5nIGluIHRoZSByYXcgYW5k
IGhvc3QgQ1BVIHBvbGljaWVzLgo+Pgo+PiBBIGNvbWJpbmF0aW9uIG9mIHRoaXMgYnVnLCBhbmQg
Yy9zIGJiNTAyYThjYTU5ICJ4ODY6IGNoZWNrIGZlYXR1cmUgZmxhZ3MgYWZ0ZXIKPj4gcmVzdW1l
IiB3aGljaCBjaGVja3MgdGhhdCBmZWF0dXJlIGJpdHMgZG9uJ3QgZ28gbWlzc2luZywgcmVzdWx0
cyBpbiBicm9rZW4gUzMKPj4gb24gQU1EIGhhcmR3YXJlLgo+Pgo+PiBBbHRlciBhbWRfaW5pdF9s
ZXZlbGxpbmcoKSB0byBleGNsdWRlIHRoZSBIWVBFUlZJU09SIGJpdCBmcm9tCj4+IGNwdW1hc2tf
ZGVmYXVsdHMsIGFuZCB1cGRhdGUgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZCgpIHRvIGFsbG93
IGl0IHRvIGJlCj4+IGV4cGxpY2l0bHkgZm9yd2FyZGVkLgo+Pgo+PiBUaGlzIGFsc28gZml4ZXMg
YSBidWcgb24ga2V4ZWMsIHdoZXJlIHRoZSBoeXBlcnZpc29yIGJpdCBpcyBsZWZ0IGVuYWJsZWQg
Zm9yCj4+IHRoZSBuZXcga2VybmVsIHRvIGZpbmQuCj4+Cj4+IFRoZXNlIGNoYW5nZXMgaGlnaGxp
Z2h0IGEgZnVydGhlciBidXQgLSBkb20wIGNvbnN0cnVjdGlvbiBpcyBhc3ltZXRyaWMgd2l0aAo+
PiBkb21VIGNvbnN0cnVjdGlvbiwgYnkgbm90IGhhdmluZyBhbnkgY2FsbHMgdG8gZG9tYWluX2Nw
dV9wb2xpY3lfY2hhbmdlZCgpLgo+PiBFeHRlbmQgYXJjaF9kb21haW5fY3JlYXRlKCkgdG8gYWx3
YXlzIGNhbGwgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZCgpLgo+Pgo+PiBSZXBvcnRlZC1ieTog
SWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IC0tLQo+PiBD
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+PiBDQzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KPj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBD
QzogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+IENDOiBNYXJl
ayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+
Cj4+IENDOiBDbGF1ZGlhIDxjbGF1ZGlhMUBkaXNyb290Lm9yZz4KPj4KPj4gdjI6Cj4+ICAqIFJl
d3JpdGUgdGhlIGNvbW1pdCBtZXNzYWdlLiAgTm8gY2hhbmdlIHRvIHRoZSBwYXRjaCBjb250ZW50
Lgo+Pgo+PiBNYXJlay9DbGF1ZGlhOiBEbyBlaXRoZXIgb2YgeW91IHdhbnQgYSBSZXBvcnRlZC1i
eSB0YWcgc2VlaW5nIGFzIHlvdSBmb3VuZCBhCj4+IGJyYW5kIG5ldyB3YXkgdGhhdCB0aGlzIHdh
cyBicm9rZW4/CgpJIHVuZGVyc3RhbmQgdGhpcyBpcyBhZGRyZXNzaW5nIG9ubHkgb25lIGhhbGYg
b2YgdGhlaXIgaXNzdWUuIFNpbmNlCnlvdSBzYWlkIHlvdSBkb24ndCBmaW5kIGl0IHN1cnByaXNp
bmcsIGRvIHlvdSBoYXZlIGFueSBpZGVhIHdoeSB0aGUKT1NYU0FWRSBiaXQgaXMgYmVoYXZpbmcg
ZGlmZmVyZW50bHkgb24gQU1EIGFuZCBvbiBJbnRlbD8KCj4+IEBAIC0xMDYsNiArMTA2LDEzIEBA
IHN0YXRpYyB2b2lkIGRvbWFpbl9jcHVfcG9saWN5X2NoYW5nZWQoc3RydWN0IGRvbWFpbiAqZCkK
Pj4gICAgICAgICAgICAgICAgICAgICAgZWN4ID0gMDsKPj4gICAgICAgICAgICAgICAgICBlZHgg
PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfQVBJQyk7Cj4+ICAKPj4gKyAgICAgICAgICAgICAg
ICAvKgo+PiArICAgICAgICAgICAgICAgICAqIElmIHRoZSBIeXBlcnZpc29yIGJpdCBpcyBzZXQg
aW4gdGhlIHBvbGljeSwgd2UgY2FuIGFsc28KPj4gKyAgICAgICAgICAgICAgICAgKiBmb3J3YXJk
IGl0IGludG8gcmVhbCBDUFVJRC4KPj4gKyAgICAgICAgICAgICAgICAgKi8KPj4gKyAgICAgICAg
ICAgICAgICBpZiAoIHAtPmJhc2ljLmh5cGVydmlzb3IgKQo+PiArICAgICAgICAgICAgICAgICAg
ICBlY3ggfD0gY3B1ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hZUEVSVklTT1IpOwo+IAo+IEFGQUlD
VCBkb20wIHdpbGwgYWxzbyBnZXQgdGhlIGh5cGVydmlzb3IgYml0IHNldCBieSBkZWZhdWx0LCBh
cyB0aGF0J3MKPiBwYXJ0IG9mIGJvdGggdGhlIEhWTSBhbmQgdGhlIFBWIG1heCBwb2xpY3k/Cj4g
Cj4gSWYgc286Cj4gCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
