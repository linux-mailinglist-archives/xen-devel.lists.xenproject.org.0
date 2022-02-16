Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F8D4B8064
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 07:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273675.468925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKDZ5-0008Iw-VL; Wed, 16 Feb 2022 06:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273675.468925; Wed, 16 Feb 2022 06:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKDZ5-0008GB-Rj; Wed, 16 Feb 2022 06:13:23 +0000
Received: by outflank-mailman (input) for mailman id 273675;
 Wed, 16 Feb 2022 06:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BoLq=S7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nKDZ3-0008G5-9f
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 06:13:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8935e0ac-8eef-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 07:13:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF29121135;
 Wed, 16 Feb 2022 06:13:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3C9813A3E;
 Wed, 16 Feb 2022 06:13:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id F3x3Jv6VDGJxGwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Feb 2022 06:13:18 +0000
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
X-Inumbo-ID: 8935e0ac-8eef-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644991998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VjIr01KmfBi8JXLJ0DZ7y+wj+HDdIgLiV68pwBKcPIU=;
	b=uDmODVZLDSRpJFReVLRj97nX8vzQAauUdiqln5sMTKlQgqZQwqVRL47vhqEob1U4RqKnAL
	0HM1oOCumhw68uQkBORSbY8a40PxsJXilbepIIETXZUUpVTluS145c7QuEe8AB3JKDGDAg
	pl3r0QF3KU+KtD0ROg+Zg1pujVPoqoY=
Message-ID: <8763ed2b-ce5d-12eb-1ea2-542e8024764b@suse.com>
Date: Wed, 16 Feb 2022 07:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-2-luca.fancellu@arm.com>
 <efd968bb-e3f6-9e16-3826-4cab25127718@suse.com>
 <71460E15-5D09-4CE6-99ED-4858147BB0D0@arm.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/5] tools/cpupools: Give a name to unnamed cpupools
In-Reply-To: <71460E15-5D09-4CE6-99ED-4858147BB0D0@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------f8jLpR5yK0hQCSz6BGFTM4fn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------f8jLpR5yK0hQCSz6BGFTM4fn
Content-Type: multipart/mixed; boundary="------------UoADL6uQTsce8rUFlf4S061d";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <8763ed2b-ce5d-12eb-1ea2-542e8024764b@suse.com>
Subject: Re: [PATCH 1/5] tools/cpupools: Give a name to unnamed cpupools
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-2-luca.fancellu@arm.com>
 <efd968bb-e3f6-9e16-3826-4cab25127718@suse.com>
 <71460E15-5D09-4CE6-99ED-4858147BB0D0@arm.com>
In-Reply-To: <71460E15-5D09-4CE6-99ED-4858147BB0D0@arm.com>

--------------UoADL6uQTsce8rUFlf4S061d
Content-Type: multipart/mixed; boundary="------------Ngf64dvZ52G9OR9qcytKDqUk"

--------------Ngf64dvZ52G9OR9qcytKDqUk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjIgMTg6NDgsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IA0KPiANCj4+IE9u
IDE1IEZlYiAyMDIyLCBhdCAxMDozMywgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PiB3cm90ZToNCj4+DQo+PiBPbiAxNS4wMi4yMiAxMToxNSwgTHVjYSBGYW5jZWxsdSB3cm90
ZToNCj4+PiBXaXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgYm9vdCB0aW1lIGNwdXBvb2xzLCBY
ZW4gY2FuIGNyZWF0ZSBtYW55DQo+Pj4gZGlmZmVyZW50IGNwdXBvb2xzIGF0IGJvb3QgdGlt
ZSBvdGhlciB0aGFuIGNwdXBvb2wgd2l0aCBpZCAwLg0KPj4+IFNpbmNlIHRoZXNlIG5ld2x5
IGNyZWF0ZWQgY3B1cG9vbHMgY2FuJ3QgaGF2ZSBhbg0KPj4+IGVudHJ5IGluIFhlbnN0b3Jl
LCBjcmVhdGUgdGhlIGVudHJ5IHVzaW5nIHhlbi1pbml0LWRvbTANCj4+PiBoZWxwZXIgd2l0
aCB0aGUgdXN1YWwgY29udmVudGlvbjogUG9vbC08Y3B1cG9vbCBpZD4uDQo+Pj4gR2l2ZW4g
dGhlIGNoYW5nZSwgcmVtb3ZlIHRoZSBjaGVjayBmb3IgcG9vbGlkID09IDAgZnJvbQ0KPj4+
IGxpYnhsX2NwdXBvb2xpZF90b19uYW1lKC4uLikuDQo+Pj4gU2lnbmVkLW9mZi1ieTogTHVj
YSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4+IC0tLQ0KPj4+ICAgdG9v
bHMvaGVscGVycy94ZW4taW5pdC1kb20wLmMgIHwgMjYgKysrKysrKysrKysrKysrKysrKysr
KysrKy0NCj4+PiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfdXRpbHMuYyB8ICAzICstLQ0K
Pj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPj4+IGRpZmYgLS1naXQgYS90b29scy9oZWxwZXJzL3hlbi1pbml0LWRvbTAuYyBiL3Rv
b2xzL2hlbHBlcnMveGVuLWluaXQtZG9tMC5jDQo+Pj4gaW5kZXggYzk5MjI0YTRiNjA3Li4z
NTM5ZjU2ZmFlYjAgMTAwNjQ0DQo+Pj4gLS0tIGEvdG9vbHMvaGVscGVycy94ZW4taW5pdC1k
b20wLmMNCj4+PiArKysgYi90b29scy9oZWxwZXJzL3hlbi1pbml0LWRvbTAuYw0KPj4+IEBA
IC00Myw3ICs0MywxMCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+Pj4g
ICAgICAgaW50IHJjOw0KPj4+ICAgICAgIHN0cnVjdCB4c19oYW5kbGUgKnhzaCA9IE5VTEw7
DQo+Pj4gICAgICAgeGNfaW50ZXJmYWNlICp4Y2ggPSBOVUxMOw0KPj4+IC0gICAgY2hhciAq
ZG9tbmFtZV9zdHJpbmcgPSBOVUxMLCAqZG9taWRfc3RyaW5nID0gTlVMTDsNCj4+PiArICAg
IGNoYXIgKmRvbW5hbWVfc3RyaW5nID0gTlVMTCwgKmRvbWlkX3N0cmluZyA9IE5VTEwsICpw
b29sX3N0cmluZyA9IE5VTEw7DQo+IA0KPiBIaSBKdWVyZ2VuLA0KPiANCj4+DQo+PiBwb29s
X3N0cmluZyBzZWVtcyB0byBiZSB1bnVzZWQuDQo+IA0KPiBJIHdpbGwgcmVtb3ZlIGl0DQo+
IA0KPj4NCj4+PiArICAgIGNoYXIgcG9vbF9wYXRoW3N0cmxlbigiL2xvY2FsL3Bvb2wiKSAr
IDEyXSwgcG9vbF9uYW1lW3N0cmxlbigiUG9vbC0iKSArIDVdOw0KPj4NCj4+IEkgZG9uJ3Qg
bGlrZSB0aGF0LiBXaHkgZG9uJ3QgeW91IHVzZSBwb2ludGVycyBhbmQgLi4uDQo+Pg0KPj4+
ICsgICAgeGNfY3B1cG9vbGluZm9fdCAqeGNpbmZvOw0KPj4+ICsgICAgdW5zaWduZWQgaW50
IHBvb2xfaWQgPSAwOw0KPj4+ICAgICAgIGxpYnhsX3V1aWQgdXVpZDsNCj4+PiAgICAgICAg
IC8qIEFjY2VwdCAwIG9yIDEgYXJndW1lbnQgKi8NCj4+PiBAQCAtMTE0LDYgKzExNywyNyBA
QCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+Pj4gICAgICAgICAgIGdvdG8g
b3V0Ow0KPj4+ICAgICAgIH0NCj4+PiAgICsgICAgLyogQ3JlYXRlIGFuIGVudHJ5IGluIHhl
bnN0b3JlIGZvciBlYWNoIGNwdXBvb2wgb24gdGhlIHN5c3RlbSAqLw0KPj4+ICsgICAgZG8g
ew0KPj4+ICsgICAgICAgIHhjaW5mbyA9IHhjX2NwdXBvb2xfZ2V0aW5mbyh4Y2gsIHBvb2xf
aWQpOw0KPj4+ICsgICAgICAgIGlmICh4Y2luZm8gIT0gTlVMTCkgew0KPj4+ICsgICAgICAg
ICAgICBpZiAoeGNpbmZvLT5jcHVwb29sX2lkICE9IHBvb2xfaWQpDQo+Pj4gKyAgICAgICAg
ICAgICAgICBwb29sX2lkID0geGNpbmZvLT5jcHVwb29sX2lkOw0KPj4+ICsgICAgICAgICAg
ICBzbnByaW50Zihwb29sX3BhdGgsIHNpemVvZihwb29sX3BhdGgpLCAiL2xvY2FsL3Bvb2wv
JWQvbmFtZSIsDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHBvb2xfaWQpOw0KPj4+ICsg
ICAgICAgICAgICBzbnByaW50Zihwb29sX25hbWUsIHNpemVvZihwb29sX25hbWUpLCAiUG9v
bC0lZCIsIHBvb2xfaWQpOw0KPj4NCj4+IC4uLiB1c2UgYXNwcmludGYoKSBoZXJlIGZvciBh
bGxvY2F0aW5nIHRoZSBzdHJpbmdzIGluIHRoZSBuZWVkZWQgc2l6ZT8NCj4gDQo+IFdoeSB3
b3VsZCB5b3UgbGlrZSBtb3JlIHRoaXMgYXBwcm9hY2g/IEkgd2FzIHRyeWluZyB0byBhdm9p
ZCBhbGxvY2F0aW9uL2ZyZWUNCj4gb3BlcmF0aW9ucyBpbiBhIGxvb3AgdGhhdCB3b3VsZCBu
ZWVkIGFsc28gbW9yZSBjb2RlIHRvIGNoZWNrIGNhc2VzIGluIHdoaWNoDQo+IG1lbW9yeSBp
cyBub3QgYWxsb2NhdGVkLiBJbnN0ZWFkIHdpdGggdGhlIGJ1ZmZlcnMgaW4gdGhlIHN0YWNr
IHdlIGRvbuKAmXQgaGF2ZSBwcm9ibGVtcy4NCg0KTXkgbWFpbiBjb25jZXJucyBhcmUgdGhl
IHVzYWdlIG9mIHN0cmxlbigpIGZvciBzaXppbmcgYW4gb24tc3RhY2sgYXJyYXksDQp0aGUg
ZHVwbGljYXRpb24gb2YgdGhlIGZvcm1hdCBzdHJpbmdzIChvbmNlIGluIHRoZSBhcnJheXMg
ZGVmaW5pdGlvbiBhbmQNCm9uY2UgaW4gdGhlIHNucHJpbnRmKCkpLCBhbmQgdGhlIG1peHR1
cmUgb2Ygc3RybGVuKCkgYW5kIGNvbnN0YW50cyBmb3INCnNpemluZyB0aGUgYXJyYXlzLg0K
DQpUaGVyZSBhcmUgYWN0dWFsbHkgc29tZSBlcnJvcnMgaW4geW91ciBhcHByb2FjaCBmb3Ig
c2l6aW5nIHRoZSBhcnJheXMsDQpzaG93aW5nIGhvdyBmcmFnaWxlIHlvdXIgc29sdXRpb24g
aXM6IHlvdSBhcmUgYWxsb3dpbmcgYSAicG9zaXRpdmUNCmludGVnZXIgbnVtYmVyIiBmb3Ig
YSBjcHVwb29sLWlkLCB3aGljaCBjb3VsZCBlYXNpbHkgbmVlZCAxMCBkaWdpdHMsDQp3aGls
ZSB5b3VyIGFycmF5cyBhbGxvdyBvbmx5IGZvciA1IG9yIDQgZGlnaXRzLCBkZXBlbmRpbmcg
b24gdGhlIGFycmF5Lg0KDQpBbmQgZG9pbmcgdGhlIHR3byBhc3ByaW50ZigpIGNhbGxzIGFu
ZCB0aGVuIGNoZWNraW5nIHRoYXQgYm90aCBhcnJheXMNCmFyZSBub3QgTlVMTCBpc24ndCB0
aGF0IG11Y2ggY29kZS4gQlRXLCB5b3VyIGFwcHJvYWNoIGlzIG1pc3NpbmcgdGhlDQp0ZXN0
IHRoYXQgdGhlIGFycmF5cyBoYXZlIGJlZW4gbGFyZ2UgZW5vdWdoLg0KDQpUaGUgcGVyZm9y
bWFuY2Ugb2YgdGhhdCBsb29wIHNob3VsZG4ndCBiZSB0aGF0IGNyaXRpY2FsIHRoYXQgYSBm
ZXcNCmFkZGl0aW9uYWwgbWljcm9zZWNvbmRzIHJlYWxseSBodXJ0LCBlc3BlY2lhbGx5IGFz
IEkgZG9uJ3QgdGhpbmsgYW55DQp1c2UgY2FzZSB3aWxsIGV4Y2VlZCBzaW5nbGUgZGlnaXQg
bG9vcCBpdGVyYXRpb25zLg0KDQo+IA0KPj4NCj4+PiArICAgICAgICAgICAgcG9vbF9pZCsr
Ow0KPj4+ICsgICAgICAgICAgICBpZiAoIXhzX3dyaXRlKHhzaCwgWEJUX05VTEwsIHBvb2xf
cGF0aCwgcG9vbF9uYW1lLA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cmxl
bihwb29sX25hbWUpKSkgew0KPj4+ICsgICAgICAgICAgICAgICAgZnByaW50ZihzdGRlcnIs
ICJjYW5ub3Qgc2V0IHBvb2wgbmFtZVxuIik7DQo+Pj4gKyAgICAgICAgICAgICAgICByYyA9
IDE7DQo+Pj4gKyAgICAgICAgICAgIH0NCj4+PiArICAgICAgICAgICAgeGNfY3B1cG9vbF9p
bmZvZnJlZSh4Y2gsIHhjaW5mbyk7DQo+Pj4gKyAgICAgICAgICAgIGlmIChyYykNCj4+PiAr
ICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4NCj4+IE1vdmluZyB0aGUgY2FsbCBvZiB4
Y19jcHVwb29sX2luZm9mcmVlKCkgYWhlYWQgb2YgdGhlIGNhbGwgb2YgeHNfd3JpdGUoKQ0K
Pj4gd291bGQgZHJvcCB0aGUgbmVlZCBmb3IgdGhpcyBsYXN0IGlmIHN0YXRlbWVudCwgYXMg
eW91IGNvdWxkIGFkZCB0aGUNCj4+IGdvdG8gdG8gdGhlIHVwcGVyIGlmLg0KPiANCj4gWWVz
IHlvdSBhcmUgcmlnaHQsIGl0IHdvdWxkIHNpbXBsaWZ5IHRoZSBjb2RlDQo+IA0KPj4NCj4+
PiArICAgICAgICB9DQo+Pj4gKyAgICB9IHdoaWxlKHhjaW5mbyAhPSBOVUxMKTsNCj4+PiAr
DQo+Pg0KPj4gV2l0aCBkb2luZyBhbGwgb2YgdGhpcyBmb3IgYmVpbmcgYWJsZSB0byBhc3Np
Z24gb3RoZXIgZG9tYWlucyBjcmVhdGVkDQo+PiBhdCBib290IHRvIGNwdXBvb2xzLCBzaG91
bGRuJ3QgeW91IGFkZCBuYW1lcyBmb3Igb3RoZXIgZG9tYWlucyB0aGFuIGRvbTANCj4+IGhl
cmUsIHRvbz8NCj4gDQo+IFRoaXMgc2VyaWUgaXMgbW9yZSBhYm91dCBjcHVwb29scywgbWF5
YmUgSSBjYW4gZG8gdGhhdCBpbiBhbm90aGVyIGNvbW1pdCBvdXQNCj4gb2YgdGhpcyBzZXJp
ZS4NCg0KRmluZSB3aXRoIG1lLg0KDQoNCkp1ZXJnZW4NCg==
--------------Ngf64dvZ52G9OR9qcytKDqUk
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Ngf64dvZ52G9OR9qcytKDqUk--

--------------UoADL6uQTsce8rUFlf4S061d--

--------------f8jLpR5yK0hQCSz6BGFTM4fn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIMlf4FAwAAAAAACgkQsN6d1ii/Ey+J
Pgf/fkd2Jj1ZQI3guH/E+K99+PwjhrxDEiXO9zHMqfd/VVVoZD2nJx7Uum/+ec00lsAep9m5yOBP
8Lx74+17gTv7g9FoJezQeWz+ekRBNErfYxiFbqNG2v2kNbqRdbh6ckYk9EaVkRVAtcvuuFlozs32
/w472eRbJ+P2Lf1qgdSg8Tbd7mBXyQ1hU0xKvGYwvyTVldiei97h6kt9i/bSL/R9D4siNQGDKi0D
8L+2naaJuiRchKROcvSX67Wj6NpgNMswpe4zqjPAPLwlfiKvU0JrN2ZlbPSKI5AxG6Uc0YTPCwiP
g3prvN+Y/r8bWKxyvjcesTrLppGzOZ5C1WCERk6QTg==
=qijX
-----END PGP SIGNATURE-----

--------------f8jLpR5yK0hQCSz6BGFTM4fn--

