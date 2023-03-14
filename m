Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10F6B938C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 13:19:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509572.785569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3c4-0007ED-Id; Tue, 14 Mar 2023 12:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509572.785569; Tue, 14 Mar 2023 12:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3c4-0007CA-Ff; Tue, 14 Mar 2023 12:18:44 +0000
Received: by outflank-mailman (input) for mailman id 509572;
 Tue, 14 Mar 2023 12:18:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6q5S=7G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pc3c3-0007C0-NG
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 12:18:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b1b8788-c262-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 13:18:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A2B3821B12;
 Tue, 14 Mar 2023 12:18:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76D4E13A26;
 Tue, 14 Mar 2023 12:18:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1xCEGyBmEGQRUQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Mar 2023 12:18:40 +0000
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
X-Inumbo-ID: 5b1b8788-c262-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678796320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HDY7jcwI9dHCgL/OW2lTTFRBkD5jd0F5io+HlohS21I=;
	b=W2o/Sx0IV9q9sHrwyeQ8vvaSFabluCcDYybZfvzR5LNnbeEA9UG/HLEVe/BbgQgqqnoAF9
	93QxWvHDkEi5JqUSnxzXMkK8fm2161uJKCjU+8Y4S1cCWqRlHq/knnbSUbKmrfswMnv8uL
	f7UIybVZYr3JMNFcXrgBQAA1Ir2I2Bc=
Message-ID: <38816e91-3ed9-68d8-1c26-1830505a13f8@suse.com>
Date: Tue, 14 Mar 2023 13:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] xen/blkback: some cleanups
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org
References: <20221216145816.27374-1-jgross@suse.com>
 <055adce8-ceba-983a-19cc-b09ec30bb3c3@suse.com>
In-Reply-To: <055adce8-ceba-983a-19cc-b09ec30bb3c3@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yDupyS31ATbX9dfN5PReB1O4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yDupyS31ATbX9dfN5PReB1O4
Content-Type: multipart/mixed; boundary="------------59oIaAQLnuN0lZWZuus8u7md";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org
Message-ID: <38816e91-3ed9-68d8-1c26-1830505a13f8@suse.com>
Subject: Re: [PATCH 0/4] xen/blkback: some cleanups
References: <20221216145816.27374-1-jgross@suse.com>
 <055adce8-ceba-983a-19cc-b09ec30bb3c3@suse.com>
In-Reply-To: <055adce8-ceba-983a-19cc-b09ec30bb3c3@suse.com>

--------------59oIaAQLnuN0lZWZuus8u7md
Content-Type: multipart/mixed; boundary="------------gqUsVOBYzACHLsDfqUPvTAIK"

--------------gqUsVOBYzACHLsDfqUPvTAIK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDEuMjMgMTY6MDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDE2LjEyLjIy
IDE1OjU4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gU29tZSBzbWFsbCBjbGVhbnVwIHBh
dGNoZXMgSSBoYWQgbHlpbmcgYXJvdW5kIGZvciBzb21lIHRpbWUgbm93Lg0KPj4NCj4+IEp1
ZXJnZW4gR3Jvc3MgKDQpOg0KPj4gwqDCoCB4ZW4vYmxrYmFjazogZml4IHdoaXRlIHNwYWNl
IGNvZGUgc3R5bGUgaXNzdWVzDQo+PiDCoMKgIHhlbi9ibGtiYWNrOiByZW1vdmUgc3RhbGUg
cHJvdG90eXBlDQo+PiDCoMKgIHhlbi9ibGtiYWNrOiBzaW1wbGlmeSBmcmVlX3BlcnNpc3Rl
bnRfZ250cygpIGludGVyZmFjZQ0KPj4gwqDCoCB4ZW4vYmxrYmFjazogbW92ZSBibGtpZl9n
ZXRfeDg2XypfcmVxKCkgaW50byBibGtiYWNrLmMNCj4+DQo+PiDCoCBkcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL2Jsa2JhY2suYyB8IDEyNiArKysrKysrKysrKysrKysrKysrKysrKysr
LS0tDQo+PiDCoCBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5owqAgfCAxMDMg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTE4IGlu
c2VydGlvbnMoKyksIDExMSBkZWxldGlvbnMoLSkNCj4+DQo+IA0KPiBQaW5nPw0KDQpQaW5n
wrIgPw0KDQoNCkp1ZXJnZW4NCg0K
--------------gqUsVOBYzACHLsDfqUPvTAIK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------gqUsVOBYzACHLsDfqUPvTAIK--

--------------59oIaAQLnuN0lZWZuus8u7md--

--------------yDupyS31ATbX9dfN5PReB1O4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQQZiAFAwAAAAAACgkQsN6d1ii/Ey9K
NQf+JuxFSCUrGSXCueW3Ymoi+0baxwYJVlrAvTYJ3cOwbEDDcuVNmPpwtnnAgLLKusA6P8DrF9SG
2WvQCaVti0olXsZ/CGyuRKEx/Gcy9RrnD+dhbVpP0S2oRyY5RQJY59c87hPaGcibwkASLJzFXmBj
MHXz16eUo4ocHQvs1Z6PoObxuwLVlKDY4NdDlzWNoktitGdqtLeFS2ylg+ulRhJRiyj9zS1iyifz
Bp12tEJnr6dZb4uh8YvdZuT+pe8qN2pHBwTOhDJRWKWd/xbzIQdS7d9K1yq0j54MpMxRsVTyCyRw
iZuQN0b/kgraIaiCxy/kMsJtOst3LVPH9p1tNGCqPw==
=TlAT
-----END PGP SIGNATURE-----

--------------yDupyS31ATbX9dfN5PReB1O4--

