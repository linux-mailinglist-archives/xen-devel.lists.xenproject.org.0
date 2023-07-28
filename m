Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E0766933
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 11:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571409.895168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPK2A-0003da-LC; Fri, 28 Jul 2023 09:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571409.895168; Fri, 28 Jul 2023 09:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPK2A-0003aG-IA; Fri, 28 Jul 2023 09:45:18 +0000
Received: by outflank-mailman (input) for mailman id 571409;
 Fri, 28 Jul 2023 09:45:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qPK29-0003aA-OG
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 09:45:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73f7eecb-2d2b-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 11:45:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 63D7E1F37E;
 Fri, 28 Jul 2023 09:45:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A3BE13276;
 Fri, 28 Jul 2023 09:45:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zdKUDCqOw2TeEgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Jul 2023 09:45:14 +0000
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
X-Inumbo-ID: 73f7eecb-2d2b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690537514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uqp8N/7Hbf4okyPjjTbAGLxWbp2gkk8P51kIwaB2kx0=;
	b=DDUu7HAJznwhggZb+XZ6+MGO69r8/12X9kX+TRU8KuCyqtM9mqtRonkE+QXd91Vj6fOHKg
	jdIIOGC+lmXIT/Z2TfyUVRBbbsJcOECwRPAytRgDY0pxc+Q07yZVVnUTT/dF2Zd3D8UhjA
	V/L/DmIF5U8OnJOVUszE3icQftMRi8U=
Message-ID: <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
Date: Fri, 28 Jul 2023 11:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
 <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
 <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
In-Reply-To: <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------17mDiwR607KvbstlMoAZuT9X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------17mDiwR607KvbstlMoAZuT9X
Content-Type: multipart/mixed; boundary="------------03H3vGqobeBh7DdhUEBzaRcJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
 <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
 <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
In-Reply-To: <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>

--------------03H3vGqobeBh7DdhUEBzaRcJ
Content-Type: multipart/mixed; boundary="------------ft4v08KA0HEkr58kEkINkl0J"

--------------ft4v08KA0HEkr58kEkINkl0J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDcuMjMgMTE6MzgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI4LzA3LzIwMjMgMTA6MTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyOC4wNy4yMyAxMDo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAyOC8wNy8yMDIzIDA3OjIzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBPbiAyNy4wNy4yMyAyMzo1MywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gSGkg
SnVlcmdlbiwNCj4+Pj4+DQo+Pj4+PiBPbiAyNC8wNy8yMDIzIDEyOjAyLCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOg0KPj4+Pj4+IFN0cnVjdCB4c190ZGJfcmVjb3JkX2hkciBpcyB1c2VkIGZv
ciBub2RlcyBzdG9yZWQgaW4gdGhlIGRhdGEgYmFzZS4NCj4+Pj4+PiBXaGVuIHdvcmtpbmcg
b24gYSBub2RlLCBzdHJ1Y3Qgbm9kZSBpcyBiZWluZyB1c2VkLCB3aGljaCBpcyBpbmNsdWRp
bmcNCj4+Pj4+PiB0aGUgc2FtZSBpbmZvcm1hdGlvbiBhcyBzdHJ1Y3QgeHNfdGRiX3JlY29y
ZF9oZHIsIGJ1dCBpbiBhIGRpZmZlcmVudA0KPj4+Pj4+IGZvcm1hdC4gUmV3b3JrIHN0cnVj
dCB4c190ZGJfcmVjb3JkX2hkciBpbiBvcmRlciB0byBwcmVwYXJlIGluY2x1ZGluZw0KPj4+
Pj4+IGl0IGluIHN0cnVjdCBub2RlLg0KPj4+Pj4+DQo+Pj4+Pj4gRG8gdGhlIGZvbGxvd2lu
ZyBtb2RpZmljYXRpb25zOg0KPj4+Pj4+DQo+Pj4+Pj4gLSBtb3ZlIGl0cyBkZWZpbml0aW9u
IHRvIHhlbnN0b3JlZF9jb3JlLmgsIGFzIHRoZSByZWFzb24gdG8gcHV0IGl0IGludG8NCj4+
Pj4+PiDCoMKgIHV0aWxzLmggYXJlIG5vIGxvbmdlciBleGlzdGluZw0KPj4+Pj4+DQo+Pj4+
Pj4gLSByZW5hbWUgaXQgdG8gc3RydWN0IG5vZGVfaGRyLCBhcyB0aGUgInRkYiIgaW4gaXRz
IG5hbWUgaGFzIG9ubHkNCj4+Pj4+PiDCoMKgIGhpc3RvcmljYWwgcmVhc29ucw0KPj4+Pj4+
DQo+Pj4+Pj4gLSByZXBsYWNlIHRoZSBlbXB0eSBwZXJtaXNzaW9uIGFycmF5IGF0IHRoZSBl
bmQgd2l0aCBhIGNvbW1lbnQgYWJvdXQNCj4+Pj4+PiDCoMKgIHRoZSBsYXlvdXQgb2YgZGF0
YSBpbiB0aGUgZGF0YSBiYXNlIChjb25jYXRlbmF0aW9uIG9mIGhlYWRlciwNCj4+Pj4+PiDC
oMKgIHBlcm1pc3Npb25zLCBub2RlIGNvbnRlbnRzLCBhbmQgY2hpbGRyZW4gbGlzdCkNCj4+
Pj4+Pg0KPj4+Pj4+IC0gdXNlIG5hcnJvd2VyIHR5cGVzIGZvciBudW1fcGVybXMgYW5kIGRh
dGFsZW4sIGFzIHRob3NlIGFyZSBuYXR1cmFsbHkNCj4+Pj4+PiDCoMKgIGxpbWl0ZWQgdG8g
WEVOU1RPUkVfUEFZTE9BRF9NQVggKGNoaWxkbGVuIGlzIGRpZmZlcmVudCBoZXJlLCBhcyBp
dCBpcw0KPj4+Pj4+IMKgwqAgaW4gdGhlb3J5IGJhc2ljYWxseSB1bmxpbWl0ZWQpDQo+Pj4+
Pg0KPj4+Pj4gVGhlIGFzc3VtcHRpb24gaXMgWEVOU1RPUkVfUEFZTE9BRF9NQVggd2lsbCBu
ZXZlciBjaGFuZ2UgYW5kL29yIGFsd2F5cyANCj4+Pj4+IGFwcGx5IGZvciBhbGwgdGhlIGNv
bm5lY3Rpb24uIEkgYW0gYXdhcmUgb2YgYXQgbGVhc3Qgb25lIGRvd25zdHJlYW0gdXNlIA0K
Pj4+Pj4gd2hlcmUgdGhpcyBpcyBub3QgdGhlIGNhc2UuDQo+Pj4+Pg0KPj4+Pj4gSSBhbSBo
YXBweSB0byB1c2UgbmFycm93ZXIgdHlwZXMsIGJ1dCBJIHdvdWxkIGF0IGxlYXN0IGxpa2Ug
c29tZSBjaGVja3MgaW4gDQo+Pj4+PiBYZW5zdG9yZSB0byBlbnN1cmUgdGhlIGxpbWl0cyBh
cmUgbm90IHJlYWNoZWQuDQo+Pj4+DQo+Pj4+IEkgd2lsbCBhZGQgYSBCVUlMRF9CVUdfT04o
KS4NCj4+Pg0KPj4+IEluaXRpYWxseSBJIHdhcyB0aGlua2luZyBhYm91dCBhIHJ1bnRpbWUg
Y2hlY2ssIGJ1dCBJIGFtIGFsc28gZmluZSB3aXRoIGEgDQo+Pj4gQlVJTERfQlVHX09OKCkg
aWYgaXQgaXMgcmlnaHQgbmV4dCB0byBsZW5ndGggY2hlY2sgaW4gaGFuZGxlX2lucHV0KCku
IFNvIGlmIA0KPj4+IHNvbWVvbmUgZGVjaWRlZCB0byBhZGQgZGlmZmVyZW50IHBheWxvYWQg
c2l6ZSBkZXBlbmRpbmcgb24gdGhlIGRvbWFpbiAoc3VjaCANCj4+PiBhcyBwcml2aWxlZ2Vk
IGRvbWFpbiBjb3VsZCBkbyBtb3JlKSwgaXQgd291bGQgYmUgZWFzaWVyIHRvIHNwb3Qgd2hh
dCBlbHNlIA0KPj4+IG5lZWRzIHRvIGJlIGNoYW5nZWQuDQo+Pg0KPj4gSXMgdGhpcyByZWFs
bHkgdGhlIGNvcnJlY3QgcGxhY2VtZW50Pw0KPiANCj4gSSB0aGluayBzby4gQnkgYWRkaW5n
IHRoZSBCVUlMRF9PTl9CVUcoKSByaWdodCBhYm92ZSB0aGUgbGVuZ3RoIGNoZWNrLCBpdCB3
b3VsZCANCj4gYmUgZWFzaWVyIGZvciBldmVyeW9uZSB0byBrbm93IHRoYXQgdGhlIGRhdGFz
dHJ1Y3R1cmUgbWF5IGFsc28gbmVlZCB0byBjaGFuZ2UuIA0KPiBUaGlzIC4uLg0KPiANCj4+
DQo+PiBJJ3ZlIHB1dCBpdCBpbnRvIHdyaXRlX25vZGVfcmF3KCksIGFzIHRoaXMgaXMgd2hl
cmUgdGhlIHJlbGF0ZWQgZGF0YWxlbiBtZW1iZXINCj4+IGlzIGJlaW5nIGZpbGxlZC4gDQo+
IA0KPiAuLi4gd291bGQgYmUgbGVzcyBvYnZpb3VzIGhlcmUgYW5kIEkgdGhpbmsgaXQgbWln
aHQgYmUgbWlzcy4NCg0KQXNzdW1pbmcgdGhhdCBzb21lb25lIGNoYW5naW5nIFhFTlNUT1JF
X1BBWUxPQURfTUFYIHdvdWxkIGRvIGEgYnVpbGQgYWZ0ZXJ3YXJkcywNCkkgZG9uJ3Qgc2Vl
IGhvdyBzdWNoIGEgZmFpbHVyZSBjb3VsZCBiZSBtaXNzZWQuIEluIGNhc2Ugb2YgYSBydW50
aW1lIGNoZWNrIEkNCmFncmVlIHRoYXQgYSBtb3JlIGNlbnRyYWwgcGxhY2Ugd291bGQgYmUg
cHJlZmVycmVkLg0KDQpJbiB0aGUgZW5kIEkgZG9uJ3QgbWluZCB0aGF0IG11Y2gsIGJ1dA0K
DQoJQlVJTERfQlVHX09OKFhFTlNUT1JFX1BBWUxPQURfTUFYID49DQoJCSAgICAgKHR5cGVv
Zigoc3RydWN0IG5vZGVfaGRyICopTlVMTC0+ZGF0YWxlbikpKC0xKSk7DQoNCmlzIGEgbGl0
dGxlIGJpdCBjbHVtc3kgSU1ITy4NCg0KDQpKdWVyZ2VuDQo=
--------------ft4v08KA0HEkr58kEkINkl0J
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ft4v08KA0HEkr58kEkINkl0J--

--------------03H3vGqobeBh7DdhUEBzaRcJ--

--------------17mDiwR607KvbstlMoAZuT9X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTDjikFAwAAAAAACgkQsN6d1ii/Ey/s
Ogf/aSDSHFSB38cl/stNYg5ngm4QKs44qCaKWwWS5TBO4VeZi/2YHx5RN8W4rX5cvOfHB3oMhNs4
MJC47oT/x1uWhavR/64qaFmFjF38QKPxsQ7y4lzyOejTD9yZj+0zyq690RLu6XuQPji5hAxDry1w
fLYmxUq8JoxXzjX31Kmwr3IsKXp1x0sB7kW5WC692svd/u3x+jqKIIz1WASRFB0GXMNimGU+2Szs
4r90BKpCM7cBqL2/D4WTpUUsOYRzk7IcHYC/oC6eM57xfroc0A95ENzOisp1osY9tQ0mqXM4Ah3I
eHoC3s/9GUQOmVvdiLI8kzbVnBFjMAXP2svaSrNa+Q==
=GmMe
-----END PGP SIGNATURE-----

--------------17mDiwR607KvbstlMoAZuT9X--

