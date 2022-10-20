Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0636B606436
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 17:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426919.675698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olXMV-0001a3-SO; Thu, 20 Oct 2022 15:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426919.675698; Thu, 20 Oct 2022 15:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olXMV-0001YC-PD; Thu, 20 Oct 2022 15:21:35 +0000
Received: by outflank-mailman (input) for mailman id 426919;
 Thu, 20 Oct 2022 15:21:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tgfI=2V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1olXMT-0001Y6-TJ
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 15:21:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0cceb99-508a-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 17:21:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 31EB72297E;
 Thu, 20 Oct 2022 15:21:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0ED8A13AF5;
 Thu, 20 Oct 2022 15:21:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +AvIAXxnUWPNAgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Oct 2022 15:21:32 +0000
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
X-Inumbo-ID: e0cceb99-508a-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666279292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QC9m1VpFs9r8xDls23EuZfsJn9t70xMkXds0AA3F3Yw=;
	b=fzeGH+Duk5mBFk0nxtNDggSy6uM8vLqpzY4PRYBUtLcDCAJYMsiceBx7d+BWE1IApyOk3w
	Je8GeBb0DiTnk/J3GVe0MdVPV+Y9AqKYast14xUcPzKtneJerKX5vdzz4aWE6bhddsWuB8
	BpiHuQ2iv0H8jNbonWfrh1BtkegCG4o=
Message-ID: <edd2d799-9f38-966d-868c-26b8cdd7ea16@suse.com>
Date: Thu, 20 Oct 2022 17:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Xen RTDS scheduler locking
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
References: <6cccc8b6-4073-69bb-e414-2b38d5081004@suse.com>
In-Reply-To: <6cccc8b6-4073-69bb-e414-2b38d5081004@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dhwI3UwiCWabhA0JsCLLYg04"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dhwI3UwiCWabhA0JsCLLYg04
Content-Type: multipart/mixed; boundary="------------UGfnP38sPzGBWqMHK2TT9TSx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <edd2d799-9f38-966d-868c-26b8cdd7ea16@suse.com>
Subject: Re: Xen RTDS scheduler locking
References: <6cccc8b6-4073-69bb-e414-2b38d5081004@suse.com>
In-Reply-To: <6cccc8b6-4073-69bb-e414-2b38d5081004@suse.com>

--------------UGfnP38sPzGBWqMHK2TT9TSx
Content-Type: multipart/mixed; boundary="------------k8S9G3UmxXFxscm39w66JxPn"

--------------k8S9G3UmxXFxscm39w66JxPn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMTAuMjIgMTU6MjYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IExvb2tpbmcgYXQg
dGVzdCBmYWlsdXJlcyB3aXRoIFJURFMgc2NoZWR1bGVyIGluIFhlbiBbMV0gSSB0aGluayBJ
J3ZlIGZvdW5kDQo+IGEgbWFqb3IgaXNzdWUgd2l0aCBsb2NraW5nIGluIHRoZSBSVERTIHNj
aGVkdWxlcjoNCj4gDQo+IHN2Yy0+ZmxhZ3Mgc2VlbXMgdG8gYmUgbm90IHByb3RlY3RlZCBw
cm9wZXJseSwgYXMgZGlmZmVyZW50IGxvY2tzIGFyZQ0KPiB1c2VkIHdoZW4gZG9pbmcgbm9u
LWF0b21pYyB1cGRhdGVzOiBwcnYtPmxvY2sgKHRoZSBSVERTIGdsb2JhbCBsb2NrKSwNCj4g
b3IgdGhlIHBlci1zY2hlZHVsZXItcmVzb3VyY2Ugc2NoZWR1bGluZyBsb2NrLg0KPiANCj4g
SSdtIG5vdCBzdXJlIHdoYXQgd291bGQgYmUgdGhlIGJlc3Qgd2F5IHRvIGZpeCB0aGF0LiBP
bmUgcmF0aGVyIGVhc3kgd2F5DQo+IG1pZ2h0IGJlIHRvIGxldCB0aGUgc2NoZWR1bGluZyBs
b2NrIHBvaW50ZXIgcG9pbnQgYXQgcHJ2LT5sb2NrIChtZXJnaW5nDQo+IG9mIHRoZSB0d28g
bG9ja3MpLCB3aGljaCBpcyBlYXN5IGRvYWJsZSAoY3JlZGl0MiBpcyB1c2luZyBhIHNpbWls
YXIgc2NoZW1lDQo+IHRvIG1ha2UgdGhlIHNjaGVkdWxpbmcgbG9jayBwZXItcnVucXVldWUp
LiBJJ20gbm90IHN1cmUgd2hldGhlciB0aGlzDQo+IHdvdWxkbid0IHJlc3VsdCBpbiBpbGxl
Z2FsIGxvY2sgbmVzdGluZyAodHJ5aW5nIHRvIGdyYWIgcHJ2LT5sb2NrIGluc2lkZQ0KPiB0
aGUgc2NoZWR1bGluZyBsb2NrKSwgdGhvdWdoLg0KDQpNZWgsIHNlZW1zIHRoaXMgd2FzIHdy
b25nIHRoaW5raW5nIG9uIG15IHNpZGUuIFJURFMgaXMgYWxyZWFkeSBzd2l0Y2hpbmcgdGhl
DQpzY2hlZHVsaW5nIGxvY2sgdG8gcHJ2LT5sb2NrLg0KDQpTb3JyeSBmb3IgdGhlIG5vaXNl
Lg0KDQoNCkp1ZXJnZW4NCg0KPiBbMV06IA0KPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTczNDg4L3Rlc3QtYXJtaGYtYXJtaGYteGwtcnRk
cy9zZXJpYWwtY3ViaWV0cnVjay1waWNhc3NvLmxvZw0KDQo=
--------------k8S9G3UmxXFxscm39w66JxPn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------k8S9G3UmxXFxscm39w66JxPn--

--------------UGfnP38sPzGBWqMHK2TT9TSx--

--------------dhwI3UwiCWabhA0JsCLLYg04
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNRZ3sFAwAAAAAACgkQsN6d1ii/Ey/f
+Qf+OC4lPDl64l0ouv2l5/zIOHS+JfJXYoWQwF2yA22Zog00rHdMh83fc2bV6pZP6fipTi4pEnDd
+7+EszRFnnN1A1eVcnj0Me4H1v3ELNH8tKGbyXZhb+fq16L5WcRoUUvRMdFoqNOvt1T6x8szZBm7
YgLBomQl7Lmx7g1SabuCX0J2ww9yME7pHiRowWj5j2Xpwihh6m62Afojm7QOB95JVU0Bc8YeP2WE
DzEoHSNNKGNNSle3Q1PgoYfRy5z5ODJznAjW8k2Fnx3IvbF6um/zpgpy2MwH/epPHuuYFbJ1F+8m
MglzxfwwOm3pbXyqYH862lhsPw1/gb5Oa8NvQ2ecgA==
=8E7p
-----END PGP SIGNATURE-----

--------------dhwI3UwiCWabhA0JsCLLYg04--

