Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45FD5B442B
	for <lists+xen-devel@lfdr.de>; Sat, 10 Sep 2022 06:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404653.647219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWsAX-00005L-9u; Sat, 10 Sep 2022 04:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404653.647219; Sat, 10 Sep 2022 04:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWsAX-0008UK-6V; Sat, 10 Sep 2022 04:32:37 +0000
Received: by outflank-mailman (input) for mailman id 404653;
 Sat, 10 Sep 2022 04:32:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWsAV-0008UE-KN
 for xen-devel@lists.xenproject.org; Sat, 10 Sep 2022 04:32:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96aafc08-30c1-11ed-a31c-8f8a9ae3403f;
 Sat, 10 Sep 2022 06:32:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CBC1122788;
 Sat, 10 Sep 2022 04:32:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E174133B7;
 Sat, 10 Sep 2022 04:32:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rCZRIWATHGOgRQAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 10 Sep 2022 04:32:32 +0000
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
X-Inumbo-ID: 96aafc08-30c1-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662784352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wmu5TuTQuFgZ9n+X2iSXvYVVuycazGCWPVsz4mGNJqY=;
	b=HXjQbKsHhQ4rbu+d3AkNHr10NgTIYeGImb3ltNxpGvVGdJ6799P0hP7f5/zvpPYOHcSxb0
	1rUIykIvwuiaOXlyqpLf8xrAWEWZ3x6C9tIrP10+LQrYX3Ir5GfL9j+MpNfDb7x9EkOb3a
	J3SmdKIV6B54kT1M7R88Y6z5h6f5elU=
Message-ID: <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com>
Date: Sat, 10 Sep 2022 06:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Linux pin_user_pages_fast fails on Xen
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 JESHWANTHKUMAR.NK@amd.com, Devaraj.Rangasamy@amd.com,
 Mythri.Pandeshwarakrishna@amd.com, SivaSangeetha.SK@amd.com,
 Rijo-john.Thomas@amd.com
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
 <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
 <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cxyZwa0kxLiD11n73B49tcjJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cxyZwa0kxLiD11n73B49tcjJ
Content-Type: multipart/mixed; boundary="------------QuWShdp0uLCnMsTW24i0CAVC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 JESHWANTHKUMAR.NK@amd.com, Devaraj.Rangasamy@amd.com,
 Mythri.Pandeshwarakrishna@amd.com, SivaSangeetha.SK@amd.com,
 Rijo-john.Thomas@amd.com
Message-ID: <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com>
Subject: Re: Linux pin_user_pages_fast fails on Xen
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
 <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
 <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>

--------------QuWShdp0uLCnMsTW24i0CAVC
Content-Type: multipart/mixed; boundary="------------67TaJGPtP0swgRswPKXriKVi"

--------------67TaJGPtP0swgRswPKXriKVi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDkuMjIgMjI6MjUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gRnJp
LCA5IFNlcCAyMDIyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDkuMDkuMjIgMDQ6
MTEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+PiBBZGRpbmcgbW9yZSBwZW9wbGUg
aW4gQ0MNCj4+Pg0KPj4+IE9uIFRodSwgOCBTZXAgMjAyMiwgU3RlZmFubyBTdGFiZWxsaW5p
IHdyb3RlOg0KPj4+PiBIaSBKdWVyZ2VuLA0KPj4+Pg0KPj4+PiBBIGNvbGxlYWd1ZSBpcyBz
ZWVpbmcgYSBmYWlsdXJlIG9uIHg4NiBpbiBMaW51eCBEb20wLiBUaGUgZmFpbHVyZSBpcw0K
Pj4+PiBwaW5fdXNlcl9wYWdlc19mYXN0IHdpdGggYWRkcmVzc2VzIHRoYXQgY29ycmVzcG9u
ZCB0byBmb3JlaWduIG1lbW9yeQ0KPj4+PiBwYWdlczoNCj4+Pj4NCj4+Pj4gLSBRRU1VIG1h
cHMgYSBkb21VIGFkZHJlc3MgdXNpbmcgZG1hX21lbW9yeV9tYXAgKHhlbl9tYXBfY2FjaGUp
DQo+Pj4+IC0gUUVNVSBjYWxscyBhbiBJT0NUTCB0byB0aGUgVEVFIHN1YnN5c3RlbSB3aXRo
IHRoZSBWaXJ0dWFsIEFkZHJlc3MNCj4+Pj4gICAgIHJldHVybmVkIGJ5IGRtYV9tZW1vcnlf
bWFwDQo+Pj4+IC0gTGludXggdGVlX3NobV9yZWdpc3Rlci0+cGluX3VzZXJfcGFnZXNfZmFz
dCBSZXR1cm5zIC0xNCAtDQo+Pj4+IGRyaXZlcnMvdGVlL3RlZV9zaG0uYw0KPj4+Pg0KPj4+
PiBPbmNlIHVwb24gYSB0aW1lIGl0IHVzZWQgdG8gYmUgdGhlIGNhc2UgdGhhdCBnZXRfdXNl
cl9wYWdlc19mYXN0IHdvdWxkDQo+Pj4+IGZhaWwgb24gWGVuIGJlY2F1c2Ugd2UgZGlkbid0
IGhhdmUgYSBzdHJ1Y3QgcGFnZSBjb3JyZXNwb25kaW5nIHRvDQo+Pj4+IGZvcmVpZ24gbWVt
b3J5IG1hcHBpbmdzLiBCdXQgdGhhdCBoYXNuJ3QgYmVlbiB0aGUgY2FzZSBmb3IgeWVhcnMg
bm93Lg0KPj4+Pg0KPj4+PiBBbnkgb3RoZXIgaWRlYXMgd2h5IGl0IHdvdWxkIGZhaWw/DQo+
Pg0KPj4gSSB0aGluayB3ZSBjYW4gZXhwZWN0IHRoYXQgYWNjZXNzX29rKCkgaXNuJ3QgZmFp
bGluZy4NCj4+DQo+PiBJIGFzc3VtZSB0aGUgbWFwcGluZyB3YXMgZG9uZSBhbGxvd2luZyB3
cml0ZXMgKHNvcnJ5IGZvciBwYXJhbm9pYSBtb2RlKT8NCj4gICANCj4gSSB3YXMgdG9sZCBp
dCB3YXMgdmVyaWZpZWQ6IFFFTVUgY291bGQgcmVhZCBhbmQgd3JpdGUgdG8gdGhlIFZBIHJl
dHVybmVkDQo+IGJ5IGRtYV9tZW1vcnlfbWFwLiBGcm9tIC9wcm9jLzxxZW11LXBpZD4vbWFw
cywgdGhlIFZBIGFzc2lnbmVkIGFmdGVyIHRoZQ0KPiBtYXBwaW5nIGlzIHBvaW50aW5nIHRv
IC9kZXYveGVuL3ByaXZjbWQuDQo+IA0KPiANCj4+IE90aGVyIHRoYW4gdGhhdCBJJ20gbm90
IGhhdmluZyBlbm91Z2ggbWVtb3J5IG1hbmFnZW1lbnQgc2tpbGxzLiBJdCBtaWdodCBiZQ0K
Pj4gcmVsYXRlZCB0byBtbWFwKCktZWQgZm9yZWlnbiBwYWdlcyBoYXZpbmcgX1BBR0VfU1BF
Q0lBTCBzZXQsIHRob3VnaC4NCj4gDQo+IERvIHdlIHN0aWxsIHNldCBQQUdFX1NQRUNJQUwg
Zm9yIGZvcmVpZ24gbWFwcGVkIHBhZ2VzPyBJdCBsb29rcyBsaWtlIGl0DQo+IGlzIG5vdCB0
aGVyZSBhbnltb3JlPyBJZiBQQUdFX1NQRUNJQUwgaXMgbm90IHRoZXJlLCB0aGVuIHRoZXkg
cmVhbGx5DQo+IHNob3VsZCBsb29rIGxpa2UgcmVndWxhciBwYWdlcz8NCg0KU2VlIHRoZSBj
YWxsIG9mIHB0ZV9ta3NwZWNpYWwoKSBpbiByZW1hcF9hcmVhX3Bmbl9wdGVfZm4oKSAobW11
X3B2LmMpLg0KDQoNCkp1ZXJnZW4NCg==
--------------67TaJGPtP0swgRswPKXriKVi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------67TaJGPtP0swgRswPKXriKVi--

--------------QuWShdp0uLCnMsTW24i0CAVC--

--------------cxyZwa0kxLiD11n73B49tcjJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMcE2AFAwAAAAAACgkQsN6d1ii/Ey8n
cAgAmCvjodBMa4eQr+1J2FIngIC1uhX29hrN4OBktSrNWHN2Jkg29dh2/J4PwA/N/5HJ7YERC1oJ
4ByTU/S9QYF4o1ZokG7b11Mi0ughKNqKQXde/WY79aHM+mRNGeUcfhRLvLrmeM4VTgJmKgPiDghi
bem0vwxYq43HUG7FLC7kW2bCOZSWmd6Jp+sfg35KFigucO1h6dv8HHk+49deS0zkVQcoNzwUVgLE
n690hUkKldfqNxJRB3iFmQhj4OaTSxll18HrZ6TBuEu8p/WBY09k8P/gNSQ6GZLRRMWeZa1xe8a7
DkxKqQsoxqAX7fEYTXkTQrNDCBQ1W0LCHoH6br6lgw==
=IkZR
-----END PGP SIGNATURE-----

--------------cxyZwa0kxLiD11n73B49tcjJ--

