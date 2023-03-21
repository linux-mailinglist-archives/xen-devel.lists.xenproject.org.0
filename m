Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2906C3616
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 16:44:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512815.793067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pee9k-0000uT-FS; Tue, 21 Mar 2023 15:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512815.793067; Tue, 21 Mar 2023 15:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pee9k-0000s1-Bj; Tue, 21 Mar 2023 15:44:12 +0000
Received: by outflank-mailman (input) for mailman id 512815;
 Tue, 21 Mar 2023 15:44:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YM/b=7N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pee9j-0000rv-Fk
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 15:44:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37ad581d-c7ff-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 16:44:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 02D25201D5;
 Tue, 21 Mar 2023 15:44:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C804413451;
 Tue, 21 Mar 2023 15:44:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B4k+L8fQGWTeYwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Mar 2023 15:44:07 +0000
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
X-Inumbo-ID: 37ad581d-c7ff-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679413448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cs0RIVOuOrRExxACRp7tinOrmRFwUbNcPjHfU20lu24=;
	b=i1npv0uuQt27ofu/NZWTJhu/ouizJpfXXtSlKsKJJxlOYzhf9aHNS6jMMua36NF2cZj8An
	k2k93byO3gcG2iBS8OZg4TRfFhsQSjSwZ6bAhZb76Ombh+RfV07Xq2Gjtf9A/FdOmUxDj4
	ngXhk2KjAEf+M9sEWwQOQZ/dfPpag5U=
Message-ID: <6882959a-2231-f3d9-ae6e-2d8ea15bf4b3@suse.com>
Date: Tue, 21 Mar 2023 16:44:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <ZBRNWhExetXH1OaS@Air-de-Roger>
 <011cb7d8-fb32-74b1-2b06-f57be67f5c6a@citrix.com>
 <f1b0e3be-cf23-6471-7a59-c130380be0f8@suse.com>
 <ZBnF2oTLQjJtfZiK@Air-de-Roger>
 <e18b997f-48ba-4090-0c0e-67475f5b3329@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e18b997f-48ba-4090-0c0e-67475f5b3329@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0CSo0th7XjUyej916pgs0GMo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0CSo0th7XjUyej916pgs0GMo
Content-Type: multipart/mixed; boundary="------------nozffwBIoxK8YREfFeIjB0KR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Message-ID: <6882959a-2231-f3d9-ae6e-2d8ea15bf4b3@suse.com>
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <ZBRNWhExetXH1OaS@Air-de-Roger>
 <011cb7d8-fb32-74b1-2b06-f57be67f5c6a@citrix.com>
 <f1b0e3be-cf23-6471-7a59-c130380be0f8@suse.com>
 <ZBnF2oTLQjJtfZiK@Air-de-Roger>
 <e18b997f-48ba-4090-0c0e-67475f5b3329@suse.com>
In-Reply-To: <e18b997f-48ba-4090-0c0e-67475f5b3329@suse.com>

--------------nozffwBIoxK8YREfFeIjB0KR
Content-Type: multipart/mixed; boundary="------------xLIlOx5t0M64KDhNyxp2k7jk"

--------------xLIlOx5t0M64KDhNyxp2k7jk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDMuMjMgMTY6MzUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wMy4yMDIz
IDE1OjU3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4gT24gTW9uLCBNYXIgMjAsIDIw
MjMgYXQgMTA6NDg6NDVBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTcu
MDMuMjAyMyAxMzoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+Pj4gT24gMTcvMDMvMjAy
MyAxMToyMiBhbSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9uIE1vbiwgSnVs
IDE1LCAyMDE5IGF0IDAyOjM5OjA0UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+
Pj4+IFRoaXMgaXMgZmFzdGVyIHRoYW4gdXNpbmcgdGhlIHNvZnR3YXJlIGltcGxlbWVudGF0
aW9uLCBhbmQgdGhlIGluc24gaXMNCj4+Pj4+PiBhdmFpbGFibGUgb24gYWxsIGhhbGYtd2F5
IHJlY2VudCBoYXJkd2FyZS4gVGhlcmVmb3JlIGNvbnZlcnQNCj4+Pj4+PiBnZW5lcmljX2h3
ZWlnaHQ8Tj4oKSB0byBvdXQtb2YtbGluZSBmdW5jdGlvbnMgKHdpdGhvdXQgYWZmZWN0aW5n
IEFybSkNCj4+Pj4+PiBhbmQgdXNlIGFsdGVybmF0aXZlcyBwYXRjaGluZyB0byByZXBsYWNl
IHRoZSBmdW5jdGlvbiBjYWxscy4NCj4+Pj4+Pg0KPj4+Pj4+IE5vdGUgdGhhdCB0aGUgYXBw
cm9hY2ggZG9lc24jdCB3b3JrIGZvciBjbGFuZywgZHVlIHRvIGl0IG5vdCByZWNvZ25pemlu
Zw0KPj4+Pj4+IC1mZml4ZWQtKi4NCj4+Pj4+IEkndmUgYmVlbiBnaXZpbmcgdGhpcyBhIGxv
b2ssIGFuZCBJIHdvbmRlciBpZiBpdCB3b3VsZCBiZSBmaW5lIHRvDQo+Pj4+PiBzaW1wbHkg
cHVzaCBhbmQgcG9wIHRoZSBzY3JhdGNoIHJlZ2lzdGVycyBpbiB0aGUgJ2NhbGwnIHBhdGgg
b2YgdGhlDQo+Pj4+PiBhbHRlcm5hdGl2ZSwgYXMgdGhhdCB3b24ndCByZXF1aXJlIGFueSBz
cGVjaWZpYyBjb21waWxlciBvcHRpb24uDQo+Pj4NCj4+PiBIbW0sIC4uLg0KPj4+DQo+Pj4+
IEl0J3MgYmVlbiBhIGxvbmcgd2hpbGUsIGFuZCBpbiB0aGF0IHRpbWUgSSd2ZSBsZWFybnQg
YSBsb3QgbW9yZSBhYm91dA0KPj4+PiBwZXJmb3JtYW5jZSwgYnV0IG15IHJvb3Qgb2JqZWN0
aW9uIHRvIHRoZSBhcHByb2FjaCB0YWtlbiBoZXJlIHN0aWxsDQo+Pj4+IHN0YW5kcyAtIGl0
IGlzIHBlbmFsaXNpbmcgdGhlIGNvbW1vbiBjYXNlIHRvIG9wdGltaXNlIHNvbWUgcG9pbnRs
ZXNzDQo+Pj4+IGNvcm5lciBjYXNlcy4NCj4+Pj4NCj4+Pj4gWWVzIC0gb24gdGhlIGNhbGwg
cGF0aCwgYW4gZXh0cmEgcHVzaC9wb3AgcGFpciAob3IgZmV3KSB0byBnZXQgdGVtcA0KPj4+
PiByZWdpc3RlcnMgaXMgYmFzaWNhbGx5IGZyZWUuDQo+Pj4NCj4+PiAuLi4gd2hhdCBpcyAi
YSBmZXciPyBXZSdkIG5lZWQgdG8gcHVzaC9wb3AgYWxsIGNhbGwtY2xvYmJlcmVkIHJlZ2lz
dGVycw0KPj4+IGV4Y2VwdCAlcmF4LCBpLmUuIGEgdG90YWwgb2YgZWlnaHQuIEkgY29uc2lk
ZXIgdGhpcyB0b28gbXVjaC4gVW5sZXNzLA0KPj4+IGFzIHlvdSBzdWdnZXN0IGZ1cnRoZXIg
ZG93biwgd2Ugd3JvdGUgdGhlIGZhbGxiYWNrIGluIGFzc2VtYmx5LiBXaGljaCBJDQo+Pj4g
aGF2ZSB0byBhZG1pdCBJJ20gc3VycHJpc2VkIHlvdSBwcm9wb3NlIHdoZW4gd2Ugc3RyaXZl
IHRvIHJlZHVjZSB0aGUNCj4+PiBhbW91bnQgb2YgYXNzZW1ibHkgd2UgaGF2ZSB0byBtYWlu
dGFpbi4NCj4+DQo+PiBBTUQgYWRkZWQgcG9wY250IGluIDIwMDcgYW5kIEludGVsIGluIDIw
MDguICBXaGlsZSB3ZSBzaG91bGRuJ3QNCj4+IG1hbmRhdGUgcG9wY250IHN1cHBvcnQsIEkg
dGhpbmsgd2UgYWxzbyBzaG91bGRuJ3Qgb3Zlcmx5IHdvcnJ5IGFib3V0DQo+PiB0aGUgbm9u
LXBvcGNudCBwYXRoLg0KPiANCj4gV2UgYWdyZWUgaGVyZS4NCj4gDQo+PiBBbHNvLCBob3cg
Y2FuIHlvdSBhc3NlcnQgdGhhdCB0aGUgY29kZSBnZW5lcmF0ZWQgd2l0aG91dCB0aGUgc2Ny
YXRjaA0KPj4gcmVnaXN0ZXJzIGJlaW5nIHVzYWJsZSB3b24ndCBiZSB3b3JzZSB0aGFuIHRo
ZSBwZW5hbHR5IG9mIHB1c2hpbmcgYW5kDQo+PiBwb3BwaW5nIHN1Y2ggcmVnaXN0ZXJzIG9u
IHRoZSBzdGFjayBhbmQgbGV0dGluZyB0aGUgcm91dGluZXMgdXNlIGFsbA0KPj4gcmVnaXN0
ZXJzIGZyZWVseT8NCj4gDQo+IElycmVzcGVjdGl2ZSBvZiB0aGUgLWZmaXhlZC0qIHRoZSBj
b21waWxlciBjYW4gbWFrZSBpdHNlbGYgc3VmZmljaWVudGx5DQo+IG1hbnkgcmVnaXN0ZXJz
IGF2YWlsYWJsZSB0byB1c2UsIGJ5IHByZXNlcnZpbmcganVzdCB0aGUgb25lcyBpdCBhY3R1
YWxseQ0KPiB1c2VzLiBTbyB0aGF0J3MgcHJldHR5IGNlcnRhaW5seSBub3QgbW9yZSBQVVNI
L1BPUCB0aGFuIHdoZW4gd2Ugd291bGQNCj4gYmxpbmRseSBwcmVzZXJ2ZSBhbGwgd2hpY2gg
bWF5IG5lZWQgcHJlc2VydmluZyAobm8gbWF0dGVyIHdoZXRoZXINCj4gdGhleSdyZSBhY3R1
YWxseSB1c2VkKS4NCj4gDQo+IFlldCB0aGVuIGJvdGggdGhpcyBxdWVzdGlvbiBhbmQgLi4u
DQo+IA0KPj4gSSB2ZXJ5IG11Y2ggcHJlZmVyIHRvIGhhdmUgYSBub24tb3B0aW1hbCBub24t
cG9wY250IHBhdGgsIGJ1dCBoYXZlDQo+PiBwb3BjbnQgc3VwcG9ydCBmb3IgYm90aCBnY2Mg
YW5kIGNsYW5nLCBhbmQgd2l0aG91dCByZXF1aXJpbmcgYW55DQo+PiBjb21waWxlciBvcHRp
b25zLg0KPiANCj4gLi4uIHRoaXMgbWFrZXMgbWUgd29uZGVyIHdoZXRoZXIgd2UncmUgdGhp
bmtpbmcgb2YgZnVuZGFtZW50YWxseQ0KPiBkaWZmZXJlbnQgZ2VuZXJhdGVkIGNvZGUgdGhh
dCB3ZSB3b3VsZCBlbmQgdXAgd2l0aC4gU2luY2UgdGhlDQo+IChhcHBhcmVudGx5IGFncmVl
ZCB1cG9uKSBnb2FsIGlzIHRvIG9wdGltaXplIGZvciB0aGUgInBvcGNudA0KPiBhdmFpbGFi
bGUiIGNhc2UsIG1haW5saW5lIGNvZGUgc2hvdWxkIGJlIG5vdCBzaWduaWZpY2FudGx5IGxv
bmdlciB0aGF0DQo+IHdoYXQncyBuZWVkZWQgZm9yIHRoZSBzaW5nbGUgaW5zdHJ1Y3Rpb24g
aXRzZWxmLCBvciBhbHRlcm5hdGl2ZWx5IGENCj4gQ0FMTCBpbnNuLiBBZGRpbmcgcHVzaGVz
L3BvcHMgb2YgYWxsIGNhbGwgY2xvYmJlcmVkIHJlZ2lzdGVycyBhcm91bmQNCj4gdGhlIENB
TEwgd291bGQgZ3JvdyBtYWlubGluZSBjb2RlIHRvbyBtdWNoIChmb3IgbXkgdGFzdGUpLCBp
LmUuDQo+IGlycmVzcGVjdGl2ZSBvZiB0aGVzZSBQVVNIL1BPUCBhbGwgZ2V0dGluZyBOT1At
ZWQgb3V0IGJ5IGFsdGVybmF0aXZlcw0KPiBwYXRjaGluZy4gKEFzIGFuIGFzaWRlIEkgY29u
c2lkZXIgZmlkZGxpbmcgd2l0aCB0aGUgc3RhY2sgcG9pbnRlciBpbg0KPiBpbmxpbmUgYXNt
KCkgcmlza3ksIGFuZCBoZW5jZSBJIHdvdWxkIHByZWZlciB0byBhdm9pZCBzdWNoIHdoZW5l
dmVyDQo+IHBvc3NpYmxlLiBZZXMsIGl0IGNhbiBiZSB3cml0dGVuIHNvIGl0J3MgaW5kZXBl
bmRlbnQgb2Ygd2hhdCB0aGUNCj4gY29tcGlsZXIgdGhpbmtzIHRoZSBzdGFjayBwb2ludGVy
IHBvaW50cyBhdCwgYnV0IHN1Y2ggY29uc3RydWN0cyBhcmUNCj4gZnJhZ2lsZSBhcyBzb29u
IGFzIG9uZSB3YW50cyB0byBjaGFuZ2UgdGhlbSBhIGxpdHRsZSBsYXRlciBvbi4pDQo+IA0K
PiBBcmUgeW91IHBlcmhhcHMgdGhpbmtpbmcgb2YgaW5kZWVkIGhhdmluZyB0aGUgUFVTSC9Q
T1AgaW4gbWFpbmxpbmUNCj4gY29kZT8gT3Igc29tZSBlbnRpcmVseSBkaWZmZXJlbnQgbW9k
ZWw/DQo+IA0KPiBXaGF0IEkgY291bGQgc2VlIHVzIGRvaW5nIHRvIGFjY29tbW9kYXRlIENs
YW5nIGlzIHRvIGhhdmUgd3JhcHBlcnMNCj4gYXJvdW5kIHRoZSBhY3R1YWwgZnVuY3Rpb25z
IHdoaWNoIGRvIGFzIHlvdSBzdWdnZXN0IGFuZCBwcmVzZXJ2ZSBhbGwNCj4gcmVsZXZhbnQg
cmVnaXN0ZXJzLCBubyBtYXR0ZXIgd2hldGhlciB0aGV5J3JlIHVzZWQuDQoNCllvdSBjb3Vs
ZCBqdXN0IGNvcHkgdGhlIFBWX0NBTExFRV9TQVZFX1JFR1NfVEhVTksoKSBtYWNybyBmcm9t
IHRoZSBMaW51eA0Ka2VybmVsLCB3aGljaCBpcyBkb2luZyBleGFjdGx5IHRoYXQuDQoNCg0K
SnVlcmdlbg0K
--------------xLIlOx5t0M64KDhNyxp2k7jk
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------xLIlOx5t0M64KDhNyxp2k7jk--

--------------nozffwBIoxK8YREfFeIjB0KR--

--------------0CSo0th7XjUyej916pgs0GMo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQZ0McFAwAAAAAACgkQsN6d1ii/Ey8a
2Qf+OjnyXy2pjtZfZB24P1ncgiULTIGRioSz5TXi1PhRAIzg3qIn4Ji3cN4W2CoitATvPYVQRRre
WS5zqskl1jLAAOQy4qsVC4wvDPh4Tx7RP4cj0L9AFy2dHXVrU8JP6qkyFYF/hKXrjojB4Huek/he
57XdRDlfBZI6Q0DLy5En+BXTAJikP4jIbA1RW0YOIKwF6q9qyLOKO6xtDGylxBNv/R2nPBa7EuND
ltQ+0cPOBCdQ8PakJ/JkDfUmDtC9G7+NP0GAzGMGJBCIfhPZ5AmFvQvrNADEq4NjlSC0+vW0M5oK
HWRDzdEVHlU+SpINYtOEV67Fl6NtsccHsGSKMGpBeg==
=hfVr
-----END PGP SIGNATURE-----

--------------0CSo0th7XjUyej916pgs0GMo--

