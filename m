Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095D269CEE1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 15:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498139.768957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU6oT-0000L7-WA; Mon, 20 Feb 2023 14:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498139.768957; Mon, 20 Feb 2023 14:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU6oT-0000IO-SN; Mon, 20 Feb 2023 14:06:41 +0000
Received: by outflank-mailman (input) for mailman id 498139;
 Mon, 20 Feb 2023 14:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HMXb=6Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pU6oS-0000ID-It
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 14:06:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cac65a0b-b127-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 15:06:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BED4B20386;
 Mon, 20 Feb 2023 14:06:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 998DB139DB;
 Mon, 20 Feb 2023 14:06:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id soizI21+82N9JwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Feb 2023 14:06:37 +0000
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
X-Inumbo-ID: cac65a0b-b127-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676901997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqAH6ORw5HLmrIpb6r+CEEpRnc+4B+xJeQaoDxNgZtU=;
	b=mKhJgBA0jU/f3KbFzs/0MSCW9gZp6Ihz9GfAqJ1qwLvUZwxap8i5PI3s7kjH2CNDY+14Qi
	re1m7D7SbK6+VaQVmZjHB+AQ/yXkueWLQVDQ3syRy50SHjBQBNcsZR50zuSSiBrdWuv694
	XbLv/Q4oFv0Wt4i+PhmJbAgZ8ZXuirY=
Message-ID: <b4ecaa1f-af3a-9e32-bb73-21baed098b45@suse.com>
Date: Mon, 20 Feb 2023 15:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
In-Reply-To: <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Fl4I02dU0tlOkRNWqupb4JQ8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Fl4I02dU0tlOkRNWqupb4JQ8
Content-Type: multipart/mixed; boundary="------------A1mY2TX5d00bB9Ip66ugj35V";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <b4ecaa1f-af3a-9e32-bb73-21baed098b45@suse.com>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
In-Reply-To: <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>

--------------A1mY2TX5d00bB9Ip66ugj35V
Content-Type: multipart/mixed; boundary="------------DqrIEip04WgyrN4fR2wiwaJf"

--------------DqrIEip04WgyrN4fR2wiwaJf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDIuMjMgMTQ6NDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IEFzc3VtZSBub2Rl
IHF1b3RhIGlzIDEwMDAsIGFuZCBhdCBzdGFydCBvZiB0aGUgdHJhbnNhY3Rpb24gdGhlIGd1
ZXN0IGlzIG93bmluZw0KPiA5OTkgbm9kZXMuIEluIHRoZSB0cmFuc2FjdGlvbiB0aGUgZ3Vl
c3QgaXMgZGVsZXRpbmcgMTAgbm9kZXMsIHRoZW4gZG9tMCBpcw0KPiBjcmVhdGluZyA1IGFk
ZGl0aW9uYWwgbm9kZXMgb3duZWQgYnkgdGhlIGd1ZXN0LiBUaGUgY2VudHJhbCBub2RlIGNv
dW50ZXIgaXMgbm93DQo+IDEwMDQgKG92ZXIgcXVvdGEpLCB3aGlsZSB0aGUgaW4tdHJhbnNh
Y3Rpb24gY291bnQgaXMgOTk0LiBJbiB0aGUgdHJhbnNhY3Rpb24gdGhlDQo+IGd1ZXN0IGNh
biBub3cgaGFwcGlseSBjcmVhdGUgYSBuZXcgbm9kZSAoIzk5NSkgd2l0aCBteSBwYXRjaCwg
YnV0IHdpbGwgZmFpbCB0bw0KPiBkbyBzbyB3aXRob3V0IChpdCBzZWVzIHRoZSAxMDA0IGR1
ZSB0byB0aGUgdHJhbnNhY3Rpb24gY291bnQgYmVpbmcgaWdub3JlZCkuDQoNCkl0IGlzIGV2
ZW4gd29yc2UsIHNvIEknZCBsaWtlIHRvIHN1Z2dlc3QgdGhlIGZvbGxvd2luZyBjb21taXQg
bWVzc2FnZToNCg0KICAgdG9vbHMveGVuc3RvcmU6IHRha2UgdHJhbnNhY3Rpb24gaW50ZXJu
YWwgbm9kZXMgaW50byBhY2NvdW50IGZvciBxdW90YQ0KDQogICBUaGUgYWNjb3VudGluZyBm
b3IgdGhlIG51bWJlciBvZiBub2RlcyBvZiBhIGRvbWFpbiBpbiBhbiBhY3RpdmUNCiAgIHRy
YW5zYWN0aW9uIGlzIG5vdCB3b3JraW5nIGNvcnJlY3RseSwgYXMgaXQgaXMgY2hlY2tpbmcg
dGhlIG5vZGUgcXVvdGENCiAgIG9ubHkgYWdhaW5zdCB0aGUgbnVtYmVyIG9mIG5vZGVzIG91
dHNpZGUgdGhlIHRyYW5zYWN0aW9uLg0KDQogICBUaGlzIGNhbiByZXN1bHQgaW4gdGhlIHRy
YW5zYWN0aW9uIGZpbmFsbHkgZmFpbGluZywgYXMgbm9kZSBxdW90YSBpcw0KICAgY2hlY2tl
ZCBhdCB0aGUgZW5kIG9mIHRoZSB0cmFuc2FjdGlvbiBhZ2Fpbi4NCg0KICAgT24gdGhlIG90
aGVyIGhhbmQgZXZlbiBpbiBhIHRyYW5zYWN0aW9uIGRlbGV0aW5nIG1hbnkgbm9kZXMsIG5l
dyBub2Rlcw0KICAgbWlnaHQgbm90IGJlIGNyZWF0YWJsZSwgaW4gY2FzZSB0aGUgbm9kZSBx
dW90YSB3YXMgYWxyZWFkeSByZWFjaGVkIGF0DQogICB0aGUgc3RhcnQgb2YgdGhlIHRyYW5z
YWN0aW9uLg0KDQoNCkp1ZXJnZW4NCg==
--------------DqrIEip04WgyrN4fR2wiwaJf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------DqrIEip04WgyrN4fR2wiwaJf--

--------------A1mY2TX5d00bB9Ip66ugj35V--

--------------Fl4I02dU0tlOkRNWqupb4JQ8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPzfm0FAwAAAAAACgkQsN6d1ii/Ey8i
WQf7BBtaS1JRoXZaL8+wTHcRreOYlC8ZBqkunTdDngAHYur3yC2f+S7eKFt2dBT6QHPbwyMJWwne
pAQlOX5d6g1BpjrhRlpvqFgDXjPXJ5f/14PIQ7mwNMCsUnrfWLmoBbI+MPLnOSIXNOfxpdZac4P0
F7nf15JFhtIlvvrKZVZvLUKkDlWU4OOf6XlM8t3fqaGjMfOzJayrnBXOqzkCjEDjo7wgkWc5EQ7v
vMRavidGY0xUuHebTB/Cvu8lKovh60pnUwzA+8Fqez1egHEu6+d+J0s/0gFT0F+t9cqeOHHxdFPa
lapkkKHhlwpepWNZByTVOqThF8MzA7XXwiWL+n8u6Q==
=pg5U
-----END PGP SIGNATURE-----

--------------Fl4I02dU0tlOkRNWqupb4JQ8--

