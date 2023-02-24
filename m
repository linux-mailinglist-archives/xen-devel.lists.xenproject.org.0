Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA246A1F31
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501240.772900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVaUl-0006fu-HB; Fri, 24 Feb 2023 16:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501240.772900; Fri, 24 Feb 2023 16:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVaUl-0006cW-EO; Fri, 24 Feb 2023 16:00:27 +0000
Received: by outflank-mailman (input) for mailman id 501240;
 Fri, 24 Feb 2023 16:00:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3H5S=6U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pVaUj-0006XQ-GK
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:00:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5938015b-b45c-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 17:00:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E82238E9F;
 Fri, 24 Feb 2023 16:00:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5299113A3A;
 Fri, 24 Feb 2023 16:00:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kFFMEhjf+GOSIgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Feb 2023 16:00:24 +0000
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
X-Inumbo-ID: 5938015b-b45c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677254424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7s0FzallCl4DMp0OPykuiav5YheiBDCtlUCgqseXlg=;
	b=Xa0oXrxTFjC6T6uFSgopVWfmshOyxkNf2VtegPsWWLa2NiaMmy3gHpuI71OjEjFtAs/Wz6
	j2Ci6qbydhWHFzulqPrYM+6jKALQmH0FMP1rnRY2conY6v0BoYVrx8psnnjom2EQgKwA+Y
	SoUeQNgLaWnvxw4xq8ZJ/oB9WRpcYUw=
Message-ID: <338d9214-fce4-6158-7696-bf8a7421ee9a@suse.com>
Date: Fri, 24 Feb 2023 17:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: xenstored: Interaction bettwen SET_PERMS and transaction
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AxBQ4fhrkxEndD0ig1IdeC8H"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AxBQ4fhrkxEndD0ig1IdeC8H
Content-Type: multipart/mixed; boundary="------------29rgvCpnShdsq6g0XYa674Uc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <338d9214-fce4-6158-7696-bf8a7421ee9a@suse.com>
Subject: Re: xenstored: Interaction bettwen SET_PERMS and transaction
References: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>
In-Reply-To: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>

--------------29rgvCpnShdsq6g0XYa674Uc
Content-Type: multipart/mixed; boundary="------------PC5BAo6d1bCldXb1zoWdQsBd"

--------------PC5BAo6d1bCldXb1zoWdQsBd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDIuMjMgMTY6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IEZvciBzb21lIGludGVybmFsIHB1cnBvc2UsIEkgbmVlZCB0byB3cml0ZSBhIHNj
cmlwdCB0aGF0IHdvdWxkIGRvIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiAgwqAgMSkgU3RhcnQg
YSB0cmFuc2FjdGlvbg0KPiAgwqAgMikgQ2FsbCBHRVRfUEVSTVMNCj4gIMKgIDMpIENhbGwg
U0VUX1BFUk1TIHdpdGggdGhlIHBlcm1pc3Npb24ganVzdCByZXRyaWV2ZWQNCj4gIMKgIDQp
IENvbW1pdCB0aGUgdHJhbnNhY3Rpb24NCj4gDQo+IChEb24ndCBhc2sgd2h5IDopKQ0KPiAN
Cj4gVGhpcyB3YXMgZXhlY3V0ZWQgZnJvbSBkb20wIG9uIGV2ZXJ5IG5vZGVzLiBJbiBzb21l
IGNhc2VzLCB3ZSBub3RpY2VkIHRoYXQgNCkgDQo+IHdvdWxkIHJldHVybiAtRU5PU1BDLg0K
PiANCj4gV2hlbiBkaWdnaW5nIHRocm91Z2ggdGhlIGNvZGUsIGl0IGxvb2tzIGxpa2UgdGhp
cyBpcyBiZWNhdXNlIA0KPiB0cmFuc2FjdGlvbl9maXhfZG9tYWlucygpIChub3cgY2FsbGVk
IGFjY19maXhfZG9tYWlucygpKSB3aWxsIGNoZWNrIHRoYXQgdGhlIA0KPiBxdW90YSBpcyBj
b3JyZWN0Lg0KPiANCj4gVGhlIGRvbWFpbiBpcyBxdWVzdGlvbiB3ZXJlIG92ZXIgaXRzIGxp
bWl0LCBidXQgZ2l2ZW4gdGhpcyBpcyBjYWxsZWQgYnkgZG9tMCwgSSANCj4gd291bGQgaGF2
ZSBleHBlY3RlZCB0aGF0IGl0IHNob3VsZCBub3QgbmV2ZXIgcmV0dXJuIC1FTk9TUEMgKG5v
dGUgdGhhdCBhIA0KPiBTRVRfUEVSTVMgb3V0c2lkZSBvZiBhIHRyYW5zYWN0aW9uIHdvdWxk
IHdvcmssIGJ1dCB0aGlzIGNhbid0IGJlIHVzZWQgb3VyIGNhc2UpLg0KPiANCj4gRnVydGhl
cm1vcmUsIHRoZSB0cmFuc2FjdGlvbiBpcyBub3QgY2hhbmdpbmcgYW55IGFjY291bnRpbmcu
IFNvIEkgZmluZCBhIGJpdCANCj4gc3RyYW5nZSB0aGF0IHdlIHdvdWxkIHByZXZlbnQgaXQg
ZXZlbiBpZiB0aGlzIHdhcyBydW4gZnJvbSBhbiB1bnByaXZpbGVnZWQgZG9tYWluLg0KPiAN
Cj4gRG8geW91IGtub3cgaWYgdGhpcyBpc3N1ZXMgd291bGQgYmUgZml4ZWQgYnkgeW91ciBj
dXJyZW50IHJld29yaz8NCj4gDQo+IElmIG5vdCwgdGhlbiBJIHRoaW5rIHdlIGF0IGxlYXN0
IHdhbnQgdG8gc2tpcCB0aGUgcXVvdGEgY2hlY2sgaWYgdGhlIGRvbWFpbiBpcyANCj4gcHJp
dmlsZWdlZC4NCj4gDQo+IEZvciBub24tcHJpdmlsZWdlZCBkb21haW4sIEkgYW0gbm90IGVu
dGlyZWx5IHN1cmUgd2hhdCB0byBkby4gSSB3YXMgb3JpZ2luYWxseSANCj4gdGhpbmtpbmcg
dG8gY2hlY2sgaWYgY2QtPm5iZW50cnkgaXMgMCBhbmQgdGhlbiBza2lwIHRoZSBxdW90YSBj
aGVjay4gQnV0IHRoaXMgDQo+IHdvdWxkIGFsbG93IGEgZG9tYWluIHRvIHJlbW92ZSBhIG5v
ZGUgYW5kIHRoZW4gcmVwbGFjZSBieSBhIG5ldyBvbmUgKEkgdGhpbmsgd2UgDQo+IHN0aWxs
IHdhbnQgdG8gZm9yYmlkIHRoYXQpLg0KPiANCj4gV2hhdCBkbyB5b3UgdGhpbms/DQoNClBh
dGNoIHNlbnQuIENvdWxkIHlvdSBwbGVhc2UgdGVzdCBpdCB3aXRoIHlvdXIgc2NyaXB0Pw0K
DQoNCkp1ZXJnZW4NCg0K
--------------PC5BAo6d1bCldXb1zoWdQsBd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------PC5BAo6d1bCldXb1zoWdQsBd--

--------------29rgvCpnShdsq6g0XYa674Uc--

--------------AxBQ4fhrkxEndD0ig1IdeC8H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP43xcFAwAAAAAACgkQsN6d1ii/Ey+p
twf6A63VKCXn7i+GGqR2lKNvL01o0X63dp1NcaW52wun6VnN9lLTcqL8uH+BzVCw1rp3Nhlt5YGk
E3+Ls0KPaMxrtSD70JynfVLthYe7Rtc4L+JUqY/RsUd3yVaWjurgbxXyK71NB9vg4PpFBoBT6YQZ
/hUwfAbiG82vrDfOYhI+Eky08aSVyvJ9m+pq32k1PwTUP2vhEs0DW6bet4G6mpEjBjkgbA/mbM5E
txyHDpLQP584EaCyCpEmPdpLz5Xe7Dq5InZZnfp0ir161YcTr9O4lUfFHrGCDFYP7clCZo/HuscN
MZWKU+opYDJzjQgr5lrYyHeKUk7W6dI2SfWmbdh9kA==
=cRJx
-----END PGP SIGNATURE-----

--------------AxBQ4fhrkxEndD0ig1IdeC8H--

