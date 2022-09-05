Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08CB5AD047
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 12:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398711.639631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV9VL-0007xj-8X; Mon, 05 Sep 2022 10:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398711.639631; Mon, 05 Sep 2022 10:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV9VL-0007uL-5o; Mon, 05 Sep 2022 10:38:59 +0000
Received: by outflank-mailman (input) for mailman id 398711;
 Mon, 05 Sep 2022 10:38:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XgUS=ZI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oV9VJ-0007uD-Oh
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 10:38:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1644748-2d06-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 12:38:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE65D5FAC0;
 Mon,  5 Sep 2022 10:38:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 984E813A66;
 Mon,  5 Sep 2022 10:38:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uuu4I7/RFWOSSwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 05 Sep 2022 10:38:55 +0000
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
X-Inumbo-ID: f1644748-2d06-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662374335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2UQUyshiHmhRVmAkIS2I9YEYcgvDF1j8Yi0DuFVp8FE=;
	b=dIXOXWKTTLJv6i28nU1F88iiTyEFqtBJEiHK2X8T2BPfD3SMHyISLWvMF5p1CHtlWA8kFC
	j6J7fDwn6Guc/5ecdzl2EHNq0N3fe3yZvF31vHiRWfjxaMZYl1JXhbnIIOlaIb0IyG5vue
	o4B54ff+99ak0pPnxjJbHW8E5Pvv3lA=
Message-ID: <334a0d3c-a7da-b03e-962a-1c6e31853c7c@suse.com>
Date: Mon, 5 Sep 2022 12:38:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/3] xen/sched: fix cpu hotplug
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20220905070005.16788-1-jgross@suse.com>
 <20220905070005.16788-4-jgross@suse.com>
 <8272d775-d8d8-b526-4e39-0d75ff2b5f92@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <8272d775-d8d8-b526-4e39-0d75ff2b5f92@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DRGhtZLJeSQlMkX1n57bNvoV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DRGhtZLJeSQlMkX1n57bNvoV
Content-Type: multipart/mixed; boundary="------------UeVSaT0mYYMlD5wnp4604KGW";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <334a0d3c-a7da-b03e-962a-1c6e31853c7c@suse.com>
Subject: Re: [PATCH v4 3/3] xen/sched: fix cpu hotplug
References: <20220905070005.16788-1-jgross@suse.com>
 <20220905070005.16788-4-jgross@suse.com>
 <8272d775-d8d8-b526-4e39-0d75ff2b5f92@citrix.com>
In-Reply-To: <8272d775-d8d8-b526-4e39-0d75ff2b5f92@citrix.com>

--------------UeVSaT0mYYMlD5wnp4604KGW
Content-Type: multipart/mixed; boundary="------------5i06FQAmsvPfmlVvOnkoYxkw"

--------------5i06FQAmsvPfmlVvOnkoYxkw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDkuMjIgMTI6MzYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA1LzA5LzIw
MjIgMDg6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBAQCAtMzMxMiwxNyArMzMyNSwx
OCBAQCB2b2lkIGZyZWVfY3B1X3JtX2RhdGEoc3RydWN0IGNwdV9ybV9kYXRhICptZW0sIHVu
c2lnbmVkIGludCBjcHUpDQo+PiAgICAqIFRoZSBjcHUgaXMgYWxyZWFkeSBtYXJrZWQgYXMg
ImZyZWUiIGFuZCBub3QgdmFsaWQgYW55IGxvbmdlciBmb3IgaXRzDQo+PiAgICAqIGNwdXBv
b2wuDQo+PiAgICAqLw0KPj4gLWludCBzY2hlZHVsZV9jcHVfcm0odW5zaWduZWQgaW50IGNw
dSkNCj4+ICtpbnQgc2NoZWR1bGVfY3B1X3JtKHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBj
cHVfcm1fZGF0YSAqZGF0YSkNCj4+ICAgew0KPj4gICAgICAgc3RydWN0IHNjaGVkX3Jlc291
cmNlICpzcjsNCj4+IC0gICAgc3RydWN0IGNwdV9ybV9kYXRhICpkYXRhOw0KPj4gICAgICAg
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXQ7DQo+PiAgICAgICBzcGlubG9ja190ICpvbGRfbG9j
azsNCj4+ICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+PiAgICAgICBpbnQgaWR4ID0g
MDsNCj4+ICAgICAgIHVuc2lnbmVkIGludCBjcHVfaXRlcjsNCj4+ICsgICAgYm9vbCBmcmVl
bWVtID0gIWRhdGE7DQo+IA0KPiB2NCBpcyBtdWNoIGNsZWFyZXIgdG8gZm9sbG93IHRoYW4g
djMuwqAgT25lIGZpbmFsIHN1Z2dlc3Rpb24sIGhhdmluZyByZWFkDQo+IHRocm91Z2ggdGhl
IHNlcmllcyBhZ2FpbjsgcmVuYW1lIHRoaXMgdG8gZnJlZV9kYXRhIHNvIGFzIHRvIHJlbGF0
ZSBtb3JlDQo+IGNsb3NlbHkgdG8gd2hhdCBpdCBkb2VzLg0KPiANCj4gSSBjYW4gZml4IG9u
IGNvbW1pdCBpZiB5b3UncmUgaGFwcHkuDQoNCk9oLCBwbGVhc2UsIGdvIGFoZWFkISBJJ20g
ZmluZSB3aXRoIHRoZSByZW5hbWUuDQoNCj4gDQo+IEV2ZXJ5dGhpbmcgQS9ULWJ5IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClRoYW5rcywNCg0KDQpK
dWVyZ2VuDQoNCg==
--------------5i06FQAmsvPfmlVvOnkoYxkw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------5i06FQAmsvPfmlVvOnkoYxkw--

--------------UeVSaT0mYYMlD5wnp4604KGW--

--------------DRGhtZLJeSQlMkX1n57bNvoV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMV0b8FAwAAAAAACgkQsN6d1ii/Ey+/
dAf9EdW4VPMxHNW8Ldm2eQHHOiZMKCMXY1YyS7UIQ8T2ypg/77jXNluLhV+jvFn50+hp9FawEobA
VNhRctwMMabvyGvym/Z821hVfkwGOHnc+QxMJOPdnkxHld07I+zPQa9qbmfYARJhE8gfB7VYEAps
Lyub6g0ORydpRFbt0gJGUYvYPWVnWd0MD7/EYR/k0KhBF+Dk3/EF6WOtkK0EVUHYvNJ/RMIEOAyK
wDlYQf262SDFezE7Mi1uIXq1HJGH8gfccKNwNSmtAD7ME1kSIl3zKjUUXMJwsbk4Zu9VRSxIxaON
uySW7+nPIR8SqWxWFnyskCkYwSnWWVeUoFHm28l3nw==
=6erF
-----END PGP SIGNATURE-----

--------------DRGhtZLJeSQlMkX1n57bNvoV--

