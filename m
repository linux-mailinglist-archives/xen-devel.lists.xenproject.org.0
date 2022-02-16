Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6AE4B806E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 07:16:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273682.468936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKDbi-0000UU-DN; Wed, 16 Feb 2022 06:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273682.468936; Wed, 16 Feb 2022 06:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKDbi-0000Rq-9X; Wed, 16 Feb 2022 06:16:06 +0000
Received: by outflank-mailman (input) for mailman id 273682;
 Wed, 16 Feb 2022 06:16:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BoLq=S7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nKDbh-0000Ri-AP
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 06:16:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb869da7-8eef-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 07:16:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B0721F37D;
 Wed, 16 Feb 2022 06:16:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B137113A3E;
 Wed, 16 Feb 2022 06:16:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VpkTKaOWDGJgHAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Feb 2022 06:16:03 +0000
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
X-Inumbo-ID: eb869da7-8eef-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644992164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nFkZWLYCBmOpifjImb/h0YhbHGDEqjtB1FTk8XnPyIo=;
	b=aRgSZDaZ3ZczqM3+RrpPxnhgHV83eecGGbx2WJ7nsJbimHmsnDpKjAvZoG9O+NPmv8W7Bs
	NLt7HUe2tnukvYgUQZhZMmmJERNXGA0v/lXVP7V2HOH81gXNgsIG0QYNoi9DO0o+WT+VrQ
	Nm4/LD8bfE/mG+j6T5J6C0mU1f/arp8=
Message-ID: <de879504-7779-5f4a-4dea-4be61f4da167@suse.com>
Date: Wed, 16 Feb 2022 07:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 2/5] xen/sched: create public function for cpupools
 creation
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-3-luca.fancellu@arm.com>
 <50ad5e74-c8b6-bdb3-2a9b-fa118610d07d@suse.com>
 <3E27F91F-F97A-443D-BBA8-8400FA3FF377@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <3E27F91F-F97A-443D-BBA8-8400FA3FF377@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h8p9Lxr5j94PYC3iIMzfpSl3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h8p9Lxr5j94PYC3iIMzfpSl3
Content-Type: multipart/mixed; boundary="------------XGB80665lt2LZVxDxLXd8o2U";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <de879504-7779-5f4a-4dea-4be61f4da167@suse.com>
Subject: Re: [PATCH 2/5] xen/sched: create public function for cpupools
 creation
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-3-luca.fancellu@arm.com>
 <50ad5e74-c8b6-bdb3-2a9b-fa118610d07d@suse.com>
 <3E27F91F-F97A-443D-BBA8-8400FA3FF377@arm.com>
In-Reply-To: <3E27F91F-F97A-443D-BBA8-8400FA3FF377@arm.com>

--------------XGB80665lt2LZVxDxLXd8o2U
Content-Type: multipart/mixed; boundary="------------qdy0Hqr2fuNf2pk0bcGCYF6Y"

--------------qdy0Hqr2fuNf2pk0bcGCYF6Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjIgMTg6NTAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IA0KPiANCj4+IE9u
IDE1IEZlYiAyMDIyLCBhdCAxMDozOCwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PiB3cm90ZToNCj4+DQo+PiBPbiAxNS4wMi4yMiAxMToxNSwgTHVjYSBGYW5jZWxsdSB3cm90
ZToNCj4+PiBDcmVhdGUgbmV3IHB1YmxpYyBmdW5jdGlvbiB0byBjcmVhdGUgY3B1cG9vbHMs
IGl0IGNoZWNrcyBmb3IgcG9vbCBpZA0KPj4+IHVuaXF1ZW5lc3MgYmVmb3JlIGNyZWF0aW5n
IHRoZSBwb29sIGFuZCBjYW4gdGFrZSBhIHNjaGVkdWxlciBpZCBvcg0KPj4+IGEgbmVnYXRp
dmUgdmFsdWUgdGhhdCBtZWFucyB0aGUgZGVmYXVsdCBYZW4gc2NoZWR1bGVyIHdpbGwgYmUg
dXNlZC4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1
QGFybS5jb20+DQo+Pg0KPj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4NCj4+DQo+PiB3aXRoIG9uZSBmdXJ0aGVyIHF1ZXN0aW9uOiB5b3UgYXJlIGFs
bG93aW5nIHRvIHVzZSBhbm90aGVyIHNjaGVkdWxlciwNCj4+IGJ1dCB3aGF0IGlmIHNvbWVv
bmUgd2FudHMgdG8gc2V0IG5vbi1zdGFuZGFyZCBzY2hlZHVsaW5nIHBhcmFtZXRlcnMNCj4+
IChlLmcuIGFub3RoZXIgdGltZSBzbGljZSk/DQo+IA0KPiBJIGd1ZXNzIGZvciBub3cgcGFy
YW1ldGVycyBjYW4gYmUgdHVuZWQgb25seSBieSB4bCB0b29sLCBob3dldmVyIGl0IHdvdWxk
DQo+IGJlIHBvc3NpYmxlIGFzIGZ1dHVyZSB3b3JrIHRvIGFsbG93IHBhcmFtZXRlcnMgaW4g
dGhlIGRldmljZSB0cmVlIGZvciBlYWNoDQo+IHNjaGVkdWxlci4NCg0KVGhhdCBpcyBiYXNp
Y2FsbHkgbXkgY29uY2VybiBoZXJlOiBBIHRydWUgZG9tMGxlc3Mgc2V0dXAgd29uJ3QgaGF2
ZSB0aGUNCnBvc3NpYmlsaXR5IHRvIHVzZSB4bC4uLg0KDQpJIGRvbid0IG1pbmQgdGhpcyBz
ZXJpZXMgbm90IHN1cHBvcnRpbmcgdGhhdCBzY2hlbWUsIGJ1dCB0aGUgY2hvc2VuDQpzeW50
YXggZm9yIHRoZSBkZXZpY2UgdHJlZSBzaG91bGQgc3VwcG9ydCB0aGF0IGV4dGVuc2lvbiAo
SSBoYXZlIG5vdA0KbG9va2VkIGludG8gdGhhdCwgYXMgSSBoYXZlIG5vIGRldGFpbGVkIGtu
b3dsZWRnZSBhYm91dCB0aGF0IHRvcGljKS4NCg0KDQpKdWVyZ2VuDQo=
--------------qdy0Hqr2fuNf2pk0bcGCYF6Y
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------qdy0Hqr2fuNf2pk0bcGCYF6Y--

--------------XGB80665lt2LZVxDxLXd8o2U--

--------------h8p9Lxr5j94PYC3iIMzfpSl3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIMlqMFAwAAAAAACgkQsN6d1ii/Ey9C
uAf9FJYmfkpv2IP5F+ajIe8tcx5qttSXtvkO0/H4pVDkESX9Wi5qQAepw6kON2ViPc30o/gYhsHQ
JhCEKKTo5363lUWFvi4woHg+1nngfRiQYyCEF2Uvk7wA/NcIX1mmC95cVSvqEJnU36whQUOZizsG
JEBxkIu++hkXsNlo8NO0WL++XMIOq1LhwHlY0yk+Kw45TK20G42wSBPiAPWHXQqzFk7cbpCMZvcc
p7CMj+hXEpQkQNZQjA/qpXlkbGfVQ3Axw73Hd42Q96IdHxrGC7oARN7MZdVQr9lQSJhiulh+leBO
vtGc6nYl6N7glJ5KyrW+/sGf/ajH/VVK+WR1zJVY/Q==
=6KaN
-----END PGP SIGNATURE-----

--------------h8p9Lxr5j94PYC3iIMzfpSl3--

