Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA24B6991
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272995.468027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvGW-00036d-VG; Tue, 15 Feb 2022 10:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272995.468027; Tue, 15 Feb 2022 10:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvGW-00033n-RE; Tue, 15 Feb 2022 10:41:00 +0000
Received: by outflank-mailman (input) for mailman id 272995;
 Tue, 15 Feb 2022 10:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=az2O=S6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nJvGV-00033h-Mp
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:40:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2c98d55-8e4b-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 11:40:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1D4011F38A;
 Tue, 15 Feb 2022 10:40:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB05713C16;
 Tue, 15 Feb 2022 10:40:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RecLKDmDC2LbJQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 15 Feb 2022 10:40:57 +0000
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
X-Inumbo-ID: c2c98d55-8e4b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644921658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BbO/aayJKv3Edm7OrsXCQNm2PQ9c9b2VI12YMdtOxDQ=;
	b=fjU3hXf82yGKyDHm0TBKa6EWnw3FMFPeAy5R0OVTxMXVHbYBEDbjd3tlyilEqV3OsEKp4P
	ATEd1XYPF1WEsF+wQBWeeUU59wKi2Q7JjZPfI5ZW61+ZAbhCjrv12YQfew4WZzsPM7Bgb+
	bZwsOntmEW6ZIN4oW0hdyliaNBIg9ng=
Message-ID: <5207b025-5b92-682e-5904-4e5014f76d7c@suse.com>
Date: Tue, 15 Feb 2022 11:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 3/5] xen/sched: retrieve scheduler id by name
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-4-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220215101551.23101-4-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NPpFmFhxoc0w4u0zo0wi0lZM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NPpFmFhxoc0w4u0zo0wi0lZM
Content-Type: multipart/mixed; boundary="------------IbhXjPvjkeV2iY1PMQFN536w";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <5207b025-5b92-682e-5904-4e5014f76d7c@suse.com>
Subject: Re: [PATCH 3/5] xen/sched: retrieve scheduler id by name
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-4-luca.fancellu@arm.com>
In-Reply-To: <20220215101551.23101-4-luca.fancellu@arm.com>

--------------IbhXjPvjkeV2iY1PMQFN536w
Content-Type: multipart/mixed; boundary="------------BoNXMU0BuUrcqVs0mAx688c0"

--------------BoNXMU0BuUrcqVs0mAx688c0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjIgMTE6MTUsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IEFkZCBhIHB1Ymxp
YyBmdW5jdGlvbiB0byByZXRyaWV2ZSB0aGUgc2NoZWR1bGVyIGlkIGJ5IHRoZSBzY2hlZHVs
ZXINCj4gbmFtZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2Eu
ZmFuY2VsbHVAYXJtLmNvbT4NCj4gLS0tDQo+ICAgeGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMg
fCAxMSArKysrKysrKysrKw0KPiAgIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIHwgMTEgKysr
KysrKysrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYyBiL3hlbi9jb21tb24vc2No
ZWQvY29yZS5jDQo+IGluZGV4IDhmNGIxY2ExMGQxYy4uOTY5NmQzYzFkNzY5IDEwMDY0NA0K
PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPiArKysgYi94ZW4vY29tbW9uL3Nj
aGVkL2NvcmUuYw0KPiBAQCAtMjk0Nyw2ICsyOTQ3LDE3IEBAIHZvaWQgc2NoZWR1bGVyX2Vu
YWJsZSh2b2lkKQ0KPiAgICAgICBzY2hlZHVsZXJfYWN0aXZlID0gdHJ1ZTsNCj4gICB9DQo+
ICAgDQo+ICtpbnQgX19pbml0IHNjaGVkX2dldF9pZF9ieV9uYW1lKGNvbnN0IGNoYXIgKnNj
aGVkX25hbWUpDQo+ICt7DQo+ICsgICAgdW5zaWduZWQgaW50IGk7DQo+ICsNCj4gKyAgICBm
b3IgKCBpID0gMDsgaSA8IE5VTV9TQ0hFRFVMRVJTOyBpKysgKQ0KPiArICAgICAgICBpZiAo
IHNjaGVkdWxlcnNbaV0gJiYgIXN0cmNtcChzY2hlZHVsZXJzW2ldLT5vcHRfbmFtZSwgc2No
ZWRfbmFtZSkgKQ0KPiArICAgICAgICAgICAgcmV0dXJuIHNjaGVkdWxlcnNbaV0tPnNjaGVk
X2lkOw0KPiArDQo+ICsgICAgcmV0dXJuIC0xOw0KPiArfQ0KPiArDQoNClBsZWFzZSBtYWtl
IHVzZSBvZiB0aGlzIGZ1bmN0aW9uIGluIHNjaGVkdWxlcl9pbml0KCksIGFzIHRoaXMNCmZ1
bmN0aW9uYWxpdHkgaXMgb3BlbiBjb2RlZCB0aGVyZSwgdG9vLg0KDQoNCkp1ZXJnZW4NCg==

--------------BoNXMU0BuUrcqVs0mAx688c0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BoNXMU0BuUrcqVs0mAx688c0--

--------------IbhXjPvjkeV2iY1PMQFN536w--

--------------NPpFmFhxoc0w4u0zo0wi0lZM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmILgzkFAwAAAAAACgkQsN6d1ii/Ey8u
hgf+IPOj1pOB4hA63+QYio8Qi4x5h7Sks3WXWfk2NLcVTjpy7z3JqMyZk2dNZsgVakM5PSnLJx/h
bOGVlsVt5GonFpE3b14SumGQCO81tXY3Uf04nsWq7XDRrlSTGiMzZIm6xOuC2MB2J4nvptlEQE6C
NwE4vqSIFOdEwlZL3G0vLsZ4MtEtMmf/aMmvJTWNKsJh7cgPS1PF2mgDhi/OtQRmreVFuws+NnqI
2PxbHIdv9NsgT5rNgOMmBGnqhehMLkdbJ/fZ5y5DHti73hYuJdz+KUUxMgeWjwJFxSvZ9Dst386a
EXNTAv/uxcFfQARqnJKY8kTkUHR+HG/klVOCjfD9fw==
=c5dQ
-----END PGP SIGNATURE-----

--------------NPpFmFhxoc0w4u0zo0wi0lZM--

