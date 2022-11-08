Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50B3620AF3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 09:10:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439777.693822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osJfq-00019J-RI; Tue, 08 Nov 2022 08:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439777.693822; Tue, 08 Nov 2022 08:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osJfq-00017W-OO; Tue, 08 Nov 2022 08:09:34 +0000
Received: by outflank-mailman (input) for mailman id 439777;
 Tue, 08 Nov 2022 08:09:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MYs3=3I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1osJfp-00017Q-KD
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 08:09:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acd791fc-5f3c-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 09:09:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B7C931F897;
 Tue,  8 Nov 2022 08:09:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 94C9013398;
 Tue,  8 Nov 2022 08:09:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FLQOI7sOamMdQAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Nov 2022 08:09:31 +0000
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
X-Inumbo-ID: acd791fc-5f3c-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667894971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VnE69RIgdgJHM+8fSXDgm4w33N9GC5eL7EZqtGOttqM=;
	b=fuPIBuqpNslspv0DGUwFf+a9VjoMb6ZNTzYWT82Rc65NkN700pEcZHXFzTGhnFx7B8ga5j
	Bb34h9Rci9xsD0Sy1V03EKmKvEehRzYZITcQ7R7VHJ0dmBS9ERpGGNJAAOv0cjhi58lblA
	YCYsEdDZ4ryKWf5BgjTbglwgXF1GLwA=
Message-ID: <ceda3142-f5c0-f1b1-19c4-40aade11fa63@suse.com>
Date: Tue, 8 Nov 2022 09:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 13/20] tools/xenstore: don't allow creating too many nodes
 in a transaction
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-14-jgross@suse.com>
 <32f61945-08fa-f095-02c4-9d52b66b6c04@xen.org>
 <a55a6433-d49f-2963-0f79-ee98441afe5f@suse.com>
 <c878e5dc-1cfc-fc7f-f535-9d1afb99f378@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <c878e5dc-1cfc-fc7f-f535-9d1afb99f378@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GSASEPLasic2yKIarumM0rBX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GSASEPLasic2yKIarumM0rBX
Content-Type: multipart/mixed; boundary="------------huXD5UNIeO8dDV86X2gJkF4q";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <ceda3142-f5c0-f1b1-19c4-40aade11fa63@suse.com>
Subject: Re: [PATCH 13/20] tools/xenstore: don't allow creating too many nodes
 in a transaction
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-14-jgross@suse.com>
 <32f61945-08fa-f095-02c4-9d52b66b6c04@xen.org>
 <a55a6433-d49f-2963-0f79-ee98441afe5f@suse.com>
 <c878e5dc-1cfc-fc7f-f535-9d1afb99f378@xen.org>
In-Reply-To: <c878e5dc-1cfc-fc7f-f535-9d1afb99f378@xen.org>

--------------huXD5UNIeO8dDV86X2gJkF4q
Content-Type: multipart/mixed; boundary="------------vT4HUou0EdhusR8rM2GCcmUM"

--------------vT4HUou0EdhusR8rM2GCcmUM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTEuMjIgMTk6MzcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAw
Ny8xMS8yMDIyIDA4OjM0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDYuMTEuMjIg
MjM6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+Pj4g
T24gMDEvMTEvMjAyMiAxNToyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gVGhlIGFj
Y291bnRpbmcgZm9yIHRoZSBudW1iZXIgb2Ygbm9kZXMgb2YgYSBkb21haW4gaW4gYW4gYWN0
aXZlDQo+Pj4+IHRyYW5zYWN0aW9uIGlzIG5vdCB3b3JraW5nIGNvcnJlY3RseSwgYXMgaXQg
YWxsb3dzIHRvIGNyZWF0ZSBhcmJpdHJhcnkNCj4+Pj4gbnVtYmVyIG9mIG5vZGVzLiBUaGUg
dHJhbnNhY3Rpb24gd2lsbCBmaW5hbGx5IGZhaWwgZHVlIHRvIGV4Y2VlZGluZw0KPj4+PiB0
aGUgbnVtYmVyIG9mIG5vZGVzIHF1b3RhLCBidXQgYmVmb3JlIGNsb3NpbmcgdGhlIHRyYW5z
YWN0aW9uIGFuDQo+Pj4+IHVucHJpdmlsZWdlZCBndWVzdCBjb3VsZCBjYXVzZSBYZW5zdG9y
ZSB0byB1c2UgYSBsb3Qgb2YgbWVtb3J5Lg0KPj4+DQo+Pj4gSSBoYXZlIGFscmVhZHkgbWFk
ZSBzb21lIG9mIGNvbW1lbnRzIG9uIHRoZSBzZWN1cml0eSBNTCB3aGVuIHRoaXMgd2FzIA0K
Pj4+IGluaXRpYWxseSBzZXQuIFRoZSBhcmd1bWVudHMgc3RpbGwgZG9uJ3Qgc291bmQgcmln
aHQgdG8gbWUuDQo+Pj4NCj4+PiBGb3IgYSBmaXJzdCwgc2luY2UgWFNBLTMyNiwgd2UgaGF2
ZSBhIGNhcCBpbiBwbGFjZSBmb3IgdGhlIG1lbW9yeSBhIGRvbWFpbiANCj4+PiBjYW4gY29u
c3VtZS4gU28gdGhpcyBzdXJlbHkgY2FuJ3QgYmUgYSAibG90IG9mIG1lbW9yeSIuIE90aGVy
d2lzZSB3ZSBhcmUgDQo+Pj4gc2F5aW5nIHRoYXQgb3VyIGxpbWl0ICh0aGVyZSBhcmUgb3Ro
ZXIgd2F5IHRvIGhpdCBpdCkgd2VyZSB3cm9uZy4uLg0KPj4NCj4+IFllYWgsIG1heWJlIEkg
c2hvdWxkIHJld29yayB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+Pg0KPj4gVGhlIHJlYXNvbiBJ
IHN0aWxsIHdhbnQgdG8ga2VlcCB0aGUgcGF0Y2ggaXMgdGhhdCBpbiBhIHRyYW5zYWN0aW9u
IHdpdGhvdXQgYW55DQo+PiBjb25mbGljdHMgYW5kIHdpdGhvdXQgaGl0dGluZyBhbnkgdHJh
bnNhY3Rpb24gc3BlY2lmaWMgbGltaXRzIChudW1iZXIgb2Ygbm9kZXMNCj4+IGFjY2Vzc2Vk
KSwgdGhlIGVycm9ycyByZXR1cm5lZCBkdWUgdG8gYSBzaW5nbGUgb3BlcmF0aW9uIHNob3Vs
ZCBiZSB0aGUgc2FtZSBhcw0KPj4gd2l0aCB0aGUgc2FtZSBvcGVyYXRpb24gcGVyZm9ybWVk
IG91dHNpZGUgYSB0cmFuc2FjdGlvbi4NCj4gDQo+IFRoaXMgc2VlbXMgdG8gYmUgYSB2ZXJ5
IG5pY2hlIHVzZSBjYXNlLiBTbyBpdCBpcyBub3QgY2xlYXIgdG8gbWUgd2h5IHRoaXMgbWF0
dGVyIA0KPiBhbmQgd2Ugd2FudCB0byBhZGQgZXh0cmEgY2hlY2sgZm9yIGV2ZXJ5b25lLg0K
DQpJdCBpcyBhIG1hdHRlciBvZiBjb3JyZWN0bmVzcy4NCg0KQWRkaXRpb25hbGx5LCBhZnRl
ciB0aGUgaW50ZXJuYWwgYWNjb3VudGluZyByZXdvcmsgdGhpcyBtYWtlcyBldmVuIG1vcmUN
CnNlbnNlLCBhcyB0aGUgbWF4aW11bSB2YWx1ZXMgcGVyIGRvbWFpbiBzZWVuIGFyZSByZWFs
bHkgY29ycmVjdCwgZXZlbiB3aGVuDQpxdWVyaWVkIHdoaWxlIHRyYW5zYWN0aW9ucyBhcmUg
YWN0aXZlLg0KDQoNCkp1ZXJnZW4NCg==
--------------vT4HUou0EdhusR8rM2GCcmUM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------vT4HUou0EdhusR8rM2GCcmUM--

--------------huXD5UNIeO8dDV86X2gJkF4q--

--------------GSASEPLasic2yKIarumM0rBX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNqDrsFAwAAAAAACgkQsN6d1ii/Ey/6
dAf/a3ooQ6UjjbWbzrdCfmElZkzwUEuMX57OZhNBmxxyiOgsQRqEmuGPpEeGhdl3p5oPiDSWZwmc
x+98mTF3Roa9F/yoSbsiEhCATlfHPGuOptJBYh3hkwTzVhVBEVG87Yn4S0gDt5ixB7+Amqt7qaaF
2PwEhifGARBvX85QZsNzIaQQdxbq2i19piyx7F4Vk9ATGNoIxcz+xkOFho/1YYluzmFR+0xgZ4RG
KqP2A/2F+xZPbXMcKqchewYvdo/QgCmjwHhlzrnna5Qw0ydw4LJdzfYiQ/4a64TeMQyyY/ynOVSM
jMaeILcAGQ4yLEJkoNOnBQcZZ7oUJ+rQqMEs33TfrA==
=F4my
-----END PGP SIGNATURE-----

--------------GSASEPLasic2yKIarumM0rBX--

