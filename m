Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025615B0098
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 11:36:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401076.642761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrTM-0001Ec-Ms; Wed, 07 Sep 2022 09:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401076.642761; Wed, 07 Sep 2022 09:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrTM-0001B8-Jg; Wed, 07 Sep 2022 09:35:52 +0000
Received: by outflank-mailman (input) for mailman id 401076;
 Wed, 07 Sep 2022 09:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eRBh=ZK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oVrTK-0001Az-M5
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 09:35:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 750fb2df-2e90-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 11:35:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD16433C13;
 Wed,  7 Sep 2022 09:35:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8909313486;
 Wed,  7 Sep 2022 09:35:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id leEbIPRlGGPRMgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 07 Sep 2022 09:35:48 +0000
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
X-Inumbo-ID: 750fb2df-2e90-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662543348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rF+JRcok4JLZUfPKvKMuN4lbYAZA0bciyAcxX7wvPcA=;
	b=GtUt7sr3g6bZHyWSvvnxlZqTDuo4pPGUapwxQ9iIwUxbUWJrjoTc0HpikTPCtkziPSBIT9
	sA8ABNIa60BW+8wlj0uAKO8z3XIylz+t2Cokj/67BgkOcpU9di5J1+0L9sB135o+SBw9Th
	LJG0ogWL2wU7TzSF77JO15Ngp2SIBW4=
Message-ID: <4830f09f-71f3-6705-1b05-ad7983896b18@suse.com>
Date: Wed, 7 Sep 2022 11:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220905124746.1975-1-jgross@suse.com>
 <20220905124746.1975-5-jgross@suse.com>
 <adc4143d-9f75-bac7-19c0-debde8a710b9@xen.org>
 <48bdfa39-ce5a-6d48-0bb4-8a0270e181c9@suse.com>
 <1410d4ef-7b9a-6567-74f1-f900602f5d8f@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 4/4] tools/xenstore: add migration stream extensions
 for new features
In-Reply-To: <1410d4ef-7b9a-6567-74f1-f900602f5d8f@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eHeiiCBhJaOGD6XHzb0eUpQy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eHeiiCBhJaOGD6XHzb0eUpQy
Content-Type: multipart/mixed; boundary="------------UYLZzqWbJSRKsLNNktEGUerZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <4830f09f-71f3-6705-1b05-ad7983896b18@suse.com>
Subject: Re: [PATCH v4 4/4] tools/xenstore: add migration stream extensions
 for new features
References: <20220905124746.1975-1-jgross@suse.com>
 <20220905124746.1975-5-jgross@suse.com>
 <adc4143d-9f75-bac7-19c0-debde8a710b9@xen.org>
 <48bdfa39-ce5a-6d48-0bb4-8a0270e181c9@suse.com>
 <1410d4ef-7b9a-6567-74f1-f900602f5d8f@xen.org>
In-Reply-To: <1410d4ef-7b9a-6567-74f1-f900602f5d8f@xen.org>

--------------UYLZzqWbJSRKsLNNktEGUerZ
Content-Type: multipart/mixed; boundary="------------aKi3u2ckzrqiwx7qsLDX53dh"

--------------aKi3u2ckzrqiwx7qsLDX53dh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDkuMjIgMTA6NDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA3LzA5LzIwMjIgMDc6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwNi4wOS4yMiAxOToyNywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAwNS8wOS8yMDIyIDEzOjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBFeHRlbmQgdGhlIGRlZmluaXRpb24gb2YgdGhlIFhlbnN0b3JlIG1pZ3JhdGlvbiBz
dHJlYW0gdG8gY292ZXIgbmV3DQo+Pj4+IGZlYXR1cmVzOg0KPj4+Pg0KPj4+PiAtIHBlciBk
b21haW4gZmVhdHVyZXMNCj4+Pj4gLSBleHRlbmRlZCB3YXRjaGVzICh3YXRjaCBkZXB0aCkN
Cj4+Pj4gLSBwZXIgZG9tYWluIHF1b3RhDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IFYzOg0KPj4+
PiAtIG5ldyBwYXRjaA0KPj4+PiBWNDoNCj4+Pj4gLSBhZGQgbmV3IHJlY29yZCB0eXBlcyBp
bnN0ZWFkIG9mIG1vZGlmeWluZyB0aGUgZXhpc3Rpbmcgb25lcw0KPj4+PiDCoMKgIChKdWxp
ZW4gR3JhbGwpDQo+Pj4+IC0tLQ0KPj4+PiDCoCBkb2NzL2Rlc2lnbnMveGVuc3RvcmUtbWln
cmF0aW9uLm1kIHwgMTYwICsrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+Pj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAxNTUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+
Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RvY3MvZGVzaWducy94ZW5zdG9yZS1taWdyYXRpb24u
bWQgDQo+Pj4+IGIvZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZA0KPj4+PiBp
bmRleCBlZmE1MjZmNDIwLi5jNzA1MDVjNDNhIDEwMDY0NA0KPj4+PiAtLS0gYS9kb2NzL2Rl
c2lnbnMveGVuc3RvcmUtbWlncmF0aW9uLm1kDQo+Pj4+ICsrKyBiL2RvY3MvZGVzaWducy94
ZW5zdG9yZS1taWdyYXRpb24ubWQNCj4+Pj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+Pj4+ICt8
IGBxdW90YS1uYW1lc2DCoCB8IDAgZGVsaW1pdGVkIHN0cmluZ3Mgb2YgdGhlIHF1b3RhIG5h
bWVzIGluwqDCoMKgIHwNCj4+Pj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCB0aGUgc2FtZSBzZXF1ZW5jZSBhcyB0aGUgYHF1b3RhLXZhbGAgdmFsdWVzLiB8DQo+Pj4+
ICsNCj4+Pj4gKw0KPj4+PiArQWxsb3dlZCBxdW90YSBuYW1lcyBhcmUgdGhvc2UgZXhwbGlj
aXRseSBuYW1lZCBpbiBbMl0gZm9yIHRoZSBgR0VUX1FVT1RBYA0KPj4+PiArYW5kIGBTRVRf
UVVPVEFgIGNvbW1hbmRzLCBwbHVzIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIG9uZXMuIFF1
b3RhIG5hbWVzIG5vdA0KPj4+PiArcmVjb2duaXplZCBieSB0aGUgcmVjZWl2aW5nIHNpZGUg
bXVzdCBiZSBpZ25vcmVkLg0KPiANCj4gLi4uIHRoaXMgaXMgc2VlbSB0byBkaXJlY3RseSBj
b25mbGljdCB3aXRoIHRoaXMgc2VudGVuY2UgYXMgdG8gbWUgImlnbm9yZSIgbWVhbnMgDQo+
IGRyb3AuIFdoYXQgeW91IHdhbnQgaXMgZm9yIFhlbnN0b3JlIHRvIG9wdGlvbmFsbHkgcHJl
c2VydmUuDQoNCkknbGwgcmVwaHJhc2UgdGhhdC4NCg0KPiANCj4gQWxzbywgSSB0aGluayB3
aGF0IHlvdSB3cm90ZSBhYm92ZSB3b3VsZCBiZSBoZWxwZnVsIGluIHRoZSBjb21taXQgbWVz
c2FnZS4gSXQgDQo+IGdpdmVzIHNvbWUgaW5zaWdodHMgZm9yIGZ1dHVyZSByZWFkZXIgb24g
aG93IHRoZSBzdHJlYW0gd2FzIGRlc2lnbmVkLg0KDQpPa2F5Lg0KDQo+IA0KPj4+PiArDQo+
Pj4+ICtccGFnZWJyZWFrDQo+Pj4+ICsNCj4+Pj4gKyMjIyBET01BSU5fREFUQQ0KPj4+PiAr
DQo+Pj4+ICtUaGlzIHJlY29yZCBpcyBvcHRpb25hbCBhbmQgY2FuIGJlIHByZXNlbnQgb25j
ZSBmb3IgZWFjaCBkb21haW4uDQo+Pj4+ICsNCj4+Pj4gKw0KPj4+PiArYGBgDQo+Pj4+ICvC
oMKgwqAgMMKgwqDCoMKgwqDCoCAxwqDCoMKgwqDCoMKgIDLCoMKgwqDCoMKgwqAgM8KgwqDC
oMKgIG9jdGV0DQo+Pj4+ICsrLS0tLS0tLSstLS0tLS0tKy0tLS0tLS0rLS0tLS0tLSsNCj4+
Pj4gK3wgZG9tYWluLWlkwqDCoMKgwqAgfCBuLXF1b3RhwqDCoMKgwqDCoMKgIHwNCj4+Pj4g
KystLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tKw0KPj4+PiArfCBmZWF0dXJlc8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+Pj4+ICsrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4gK3wgcXVvdGEtdmFsIDHCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4+PiArKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+Pj4+ICsuLi4NCj4+Pj4gKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tKw0KPj4+PiArfCBxdW90YS12YWwgTsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+Pj4+ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSsNCj4+Pj4gK3wgcXVvdGEtbmFtZXMNCj4+Pj4gKy4uLg0KPj4+PiArYGBg
DQo+Pj4+ICsNCj4+Pj4gKw0KPj4+PiArfCBGaWVsZMKgwqDCoMKgwqDCoMKgwqDCoCB8IERl
c2NyaXB0aW9uwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+Pj4gK3wtLS0tLS0tLS0tLS0tLS0tfC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18DQo+Pj4+ICt8IGBk
b21haW4taWRgwqDCoMKgIHwgVGhlIGRvbWFpbi1pZCBvZiB0aGUgZG9tYWluIHRoaXMgcmVj
b3JkwqDCoMKgwqDCoCB8DQo+Pj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgYmVsb25ncyB0by7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4+PiArfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwN
Cj4+Pj4gK3wgYG4tcXVvdGFgwqDCoMKgwqDCoCB8IE51bWJlciBvZiBxdW90YSB2YWx1ZXMu
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+Pj4gK3zC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8DQo+Pj4+ICt8IGBmZWF0dXJlc2DCoMKgwqDCoCB8IFZhbHVlIG9m
IHRoZSBmZWF0dXJlIGZpZWxkIHZpc2libGUgYnkgdGhlwqDCoMKgIHwNCj4+Pj4gK3zCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBndWVzdCBhdCBvZmZzZXQgMjA2NCBvZiB0
aGUgcmluZyBwYWdlLsKgwqDCoMKgwqDCoCB8DQo+Pj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgQWxpZ25lZCB0byB0aGUgbmV4dCA0IG9jdGV0IGJvdW5kYXJ5LsKg
wqDCoMKgwqDCoMKgIHwNCj4+Pg0KPj4+IFN0YWxlIHNlbnRlbmNlPw0KPj4NCj4+IE9oIHll
cywgYSBzdXJ2aXZvciBvZiBWMy4NCj4+DQo+Pj4NCj4+Pj4gK3zCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCBPbmx5IHZhbGlkIGZvciB2ZXJzaW9uIDIgYW5kIGxhdGVyLsKg
wqDCoMKgwqDCoMKgwqDCoCB8DQo+Pj4NCj4+PiBDYW4geW91IG1lbnRpb24gZXhwbGljaXRs
eSB3aGV0aGVyIHRoZSBmaWVsZCB3aWxsIHVua25vd24gb3IgMCBmb3IgdmVyc2lvbiAxPw0K
Pj4NCj4+IFdlIGhhdmUgdGhlIGdlbmVyYWwgbm90ZSAicGFkZGluZyBvY3RldHMgaGVyZSBh
bmQgaW4gYWxsIHN1YnNlcXVlbnQgZm9ybWF0DQo+PiBzcGVjaWZpY2F0aW9ucyBtdXN0IGJl
IHdyaXR0ZW4gYXMgemVybyIuIEkgdGhpbmsgdGhpcyBzaG91bGQgc3VmZmljZS4NCj4gDQo+
IEkgZG9uJ3QgdmlldyB0aGlzIGZpZWxkIGFzIHBhZGRpbmcgYmVjYXVzZSBpdCBoYXMgYSBt
ZWFuaW5nLiBTbyBJIGFyZ3VlIGl0IGlzIA0KPiBub3QgY292ZXIgYnkgdGhlIHNlbnRlbmNl
Lg0KDQpJJ2xsIHJlcGhyYXNlIHRoYXQgdG86ICJwYWRkaW5nIG9jdGV0cyBvciBmaWVsZHMg
bm90IHZhbGlkIGluIHRoZSB1c2VkIHZlcnNpb24NCmhlcmUgYW5kIGluIGFsbCAuLi4iDQoN
Cj4gDQo+IFRoZXJlZm9yZSBJIHdvdWxkIGFkZCAiT3RoZXJ3aXNlLCB0aGUgZmllbGQgaXMg
dW5rbm93bi8wIiAocGljayB0aGUgb25lIHlvdSANCj4gcHJlZmVyIGJldHdlZW4gMCBhbmQg
dW5rbm93bikuDQo+IA0KPj4NCj4+Pg0KPj4+PiArfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+Pj4g
K3wgYHF1b3RhLXZhbGDCoMKgwqAgfCBRdW90YSB2YWx1ZXMsIGEgdmFsdWUgb2YgMCBoYXMg
dGhlIHNlbWFudGljcyB8DQo+Pj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgInVubGltaXRlZCIuwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+Pj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0K
Pj4+PiArfCBgcXVvdGEtbmFtZXNgwqAgfCAwIGRlbGltaXRlZCBzdHJpbmdzIG9mIHRoZSBx
dW90YSBuYW1lcyBpbsKgwqDCoCB8DQo+Pj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgdGhlIHNhbWUgc2VxdWVuY2UgYXMgdGhlIGBxdW90YS12YWxgIHZhbHVlcy4g
fA0KPj4+PiArDQo+Pj4+ICtBbGxvd2VkIHF1b3RhIG5hbWVzIGFyZSB0aG9zZSBleHBsaWNp
dGx5IG5hbWVkIGluIFsyXSBmb3IgdGhlIGBHRVRfUVVPVEFgDQo+Pj4+ICthbmQgYFNFVF9R
VU9UQWAgY29tbWFuZHMsIHBsdXMgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgb25lcy4gUXVv
dGEgbmFtZXMgbm90DQo+Pj4+ICtyZWNvZ25pemVkIGJ5IHRoZSByZWNlaXZpbmcgc2lkZSBt
dXN0IGJlIGlnbm9yZWQuDQo+Pj4+ICsNCj4+Pj4gK1xwYWdlYnJlYWsNCj4+Pj4gKw0KPj4+
PiArIyMjIFdBVENIX0RBVEFfRVhURU5ERUQNCj4+Pg0KPj4+IE5JVDogSSB0aGluayBpdCB3
b3VsZCBiZSBtb3JlIGxvZ2ljYWwgaWYgdGhpcyBpcyBkZWZpbmVkIHJpZ2h0IG5leHQgYWZ0
ZXIgDQo+Pj4gV0FUQ0hfREFUQS4NCj4+DQo+PiBJIHdhcyBmb2xsb3dpbmcgdGhlIHJlY29y
ZCB0eXBlIG51bWJlcmluZywgYnV0IEkgY2FuIG1vdmUgdGhpcyByZWNvcmQNCj4+IGRlc2Ny
aXB0aW9uIHVwIGlmIHlvdSBsaWtlIHRoYXQgYmV0dGVyLg0KPj4NCj4+Pg0KPj4+PiArDQo+
Pj4+ICtUaGUgaW1hZ2UgZm9ybWF0IHdpbGwgY29udGFpbiBlaXRoZXIgYSBgV0FUQ0hfREFU
QWAgb3IgYSBgV0FUQ0hfREFUQV9FWFRFTkRFRGANCj4+Pj4gK3JlY29yZCBmb3IgZWFjaCB3
YXRjaCByZWdpc3RlcmVkIGJ5IGEgY29ubmVjdGlvbiBmb3Igd2hpY2ggdGhlcmUgaXMNCj4+
Pj4gK2BDT05ORUNUSU9OX0RBVEFgIHJlY29yZCBwcmV2aW91c2x5IHByZXNlbnQuIFRoZSBg
V0FUQ0hfREFUQV9FWFRFTkRFRGAgcmVjb3JkDQo+Pj4+ICt0eXBlIGlzIHZhbGlkIG9ubHkg
aW4gdmVyc2lvbiAyIGFuZCBsYXRlci4NCj4+Pj4gKw0KPj4+PiArYGBgDQo+Pj4+ICvCoMKg
wqAgMMKgwqDCoMKgwqDCoCAxwqDCoMKgwqDCoMKgIDLCoMKgwqDCoMKgwqAgM8KgwqDCoCBv
Y3RldA0KPj4+PiArKy0tLS0tLS0rLS0tLS0tLSstLS0tLS0tKy0tLS0tLS0rDQo+Pj4+ICt8
IGNvbm4taWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
DQo+Pj4+ICsrLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4gK3wgd3Bh
dGgtbGVuwqDCoMKgwqAgfCB0b2tlbi1sZW7CoMKgwqDCoCB8DQo+Pj4+ICsrLS0tLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4gK3wgZGVwdGjCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+Pj4gKystLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0tKw0KPj4+DQo+Pj4gSXQgaXMgbm90IGNsZWFyIHdoYXQgd291
bGQgYmUgdGhlIHZhbHVlIG9mIG9jdGV0IDItMy4gSXMgaXQgUkVTMCBvciBVTktOT1dOPw0K
Pj4NCj4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgcXVlc3Rpb24uIGNvbm4taWQgaXMgYSA0
LWJ5dGUgaXRlbS4NCj4gDQo+IEkgd2FzIHJlZmVycmluZyB0byB0aGUgYmxhbmsgYWZ0ZXIg
J2RlcHRoJy4gSW4gb3RoZXIgcmVjb3JkLCB3ZSB1c2UgJ3BhZCcuDQoNCk9rYXksIHdpbGwg
YWRkICJwYWQiIHRvIGl0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------aKi3u2ckzrqiwx7qsLDX53dh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------aKi3u2ckzrqiwx7qsLDX53dh--

--------------UYLZzqWbJSRKsLNNktEGUerZ--

--------------eHeiiCBhJaOGD6XHzb0eUpQy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMYZfQFAwAAAAAACgkQsN6d1ii/Ey8d
8wf/cYNU8tLdxC98ndq8r1yfXUt0UXvmC3o7shlv79XLflEKLdm1WfyfYq8mEacyNOYmpbSFE3uT
LOP5eOVj5y6knJDnI4pfWd2QfZ57VmfdlB7VPq/fSQzap/ewOzWzW8n0VJxCpxdmOAjD0yJFOau7
I44xpyRZUfgu3E5pY+WILxLwD99p4049yffpVhPwC4aVR6Wu4EQR0gEeF1EZ7HmyrGy3M2YOPEGZ
Nj5/JWdaQr0ffKt5rkB8aak9Q9906IUty4bOqmGb1u6k4uKVJ0rDdE2j+N2XdrZYgK/iDePq10Ev
opIpbXRGZSR7tETkc4a/TN7r7nW4sMNo7Xls9RiULA==
=5+BD
-----END PGP SIGNATURE-----

--------------eHeiiCBhJaOGD6XHzb0eUpQy--

