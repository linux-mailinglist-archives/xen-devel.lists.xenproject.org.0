Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4E52B7B4
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331903.555525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGr4-0007R5-VK; Wed, 18 May 2022 10:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331903.555525; Wed, 18 May 2022 10:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGr4-0007OM-Ry; Wed, 18 May 2022 10:24:34 +0000
Received: by outflank-mailman (input) for mailman id 331903;
 Wed, 18 May 2022 10:24:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQHP=V2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nrGr3-0007OF-TJ
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:24:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b53f994d-d694-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 12:24:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F29521B61;
 Wed, 18 May 2022 10:24:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DEA1133F5;
 Wed, 18 May 2022 10:24:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id skRgCWDJhGJwLgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 May 2022 10:24:32 +0000
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
X-Inumbo-ID: b53f994d-d694-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652869472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vn6FkSbw2QpthMl9zFPwFfLa2MAKW+KZG9juhuh2fI4=;
	b=sSogkIdlVn65TzwUI8TlikhFrv5Q4WbjMILyEqZvjYwsRjd+GTTIzsPWZ0b4fNmeJb67si
	+Rkf/QV/QhdUIezFoCxPMZPB7tmCvFWFYCCSLk97YwBFe8K04gaFVihNQXKHoo4ttjQNyz
	hOmHVVNC/S/EH1VOmI3MIegDk6T2yjQ=
Message-ID: <067cc1f8-bd82-f52f-3c01-b71fd7f82e6f@suse.com>
Date: Wed, 18 May 2022 12:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] xen/cpupool: Reject attempts to add a domain to
 CPUPOOLID_NONE
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
References: <20220517194113.2574-1-andrew.cooper3@citrix.com>
 <20220517194113.2574-2-andrew.cooper3@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220517194113.2574-2-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yy07CPsTfRFxp8fZtyapMmLo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yy07CPsTfRFxp8fZtyapMmLo
Content-Type: multipart/mixed; boundary="------------kz2ofvdFMmWo0cE0fcay5vl0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
Message-ID: <067cc1f8-bd82-f52f-3c01-b71fd7f82e6f@suse.com>
Subject: Re: [PATCH 1/2] xen/cpupool: Reject attempts to add a domain to
 CPUPOOLID_NONE
References: <20220517194113.2574-1-andrew.cooper3@citrix.com>
 <20220517194113.2574-2-andrew.cooper3@citrix.com>
In-Reply-To: <20220517194113.2574-2-andrew.cooper3@citrix.com>

--------------kz2ofvdFMmWo0cE0fcay5vl0
Content-Type: multipart/mixed; boundary="------------KkU0MVIU5lG3Xg0G84ZpjvW0"

--------------KkU0MVIU5lG3Xg0G84ZpjvW0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDUuMjIgMjE6NDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IGMvcyBjZmM1MjE0
ODQ0NGYgKCJ4ZW4vZG9tYWluOiBSZWR1Y2UgdGhlIHF1YW50aXR5IG9mIGluaXRpYWxpc2F0
aW9uIGZvcg0KPiBzeXN0ZW0gZG9tYWlucyIpIHJlbW92ZWQgdGhlIHBhdGggaW4gZG9tYWlu
X2NyZWF0ZSgpIHdoaWNoIGNhbGxlZA0KPiBzY2hlZF9pbml0X2RvbWFpbigpIHdpdGggQ1BV
UE9PTElEX05PTkUgZm9yIHN5c3RlbSBkb21haW5zLg0KPiANCj4gQXJndWFibHksIHRoYXQg
Y2hhbmdlc2V0IHNob3VsZCBoYXZlIGNsZWFuZWQgdXAgdGhpcyBwYXRoIHRvby4NCj4gDQo+
IEhvd2V2ZXIsIGMvcyA5MmVhOWM1NGZjODEgKCJhcm0vZG9tMGxlc3M6IGFzc2lnbiBkb20w
bGVzcyBndWVzdHMgdG8gY3B1cG9vbHMiKQ0KPiBjaGFuZ2VkIGRvbWFpbl9jcmVhdGUoKSBm
cm9tIHVzaW5nIGEgaGFyZGNvZGVkIHBvb2xpZCBvZiAwLCB0byB1c2luZyBhIHZhbHVlDQo+
IHBhc3NlZCBieSB0aGUgdG9vbHN0YWNrLg0KPiANCj4gV2hpbGUgQ1BVUE9PTElEX05PTkUg
aXMgYW4gaW50ZXJuYWwgY29uc3RhbnQsIHVzZXJzcGFjZSBjYW4gcGFzcyAtMSBmb3IgdGhl
DQo+IGNwdXBvb2xfaWQgcGFyYW1ldGVyIGFuZCBhdHRlbXB0IHRvIGNvbnN0cnVjdCBhIHJl
YWwgZG9tYWluIHVzaW5nIGRlZmF1bHQgb3BzLA0KPiB3aGljaCBhdCBhIG1pbmltdW0gd2ls
bCBmYWlsIHRoZSBhc3NlcnRpb24gaW4gZG9tX3NjaGVkdWxlcigpLg0KPiANCj4gRml4ZXM6
IDkyZWE5YzU0ZmM4MSAoImFybS9kb20wbGVzczogYXNzaWduIGRvbTBsZXNzIGd1ZXN0cyB0
byBjcHVwb29scyIpDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------KkU0MVIU5lG3Xg0G84ZpjvW0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------KkU0MVIU5lG3Xg0G84ZpjvW0--

--------------kz2ofvdFMmWo0cE0fcay5vl0--

--------------yy07CPsTfRFxp8fZtyapMmLo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKEyV8FAwAAAAAACgkQsN6d1ii/Ey+J
UQf/XSgty4RWRAZu3/0V1ZBLw+7WggfGyJKRQW3FJ3PNTo5Ri0DAocaMSwir3CIzvR/nbEGpr2ej
eMWZDK99S4Apr25TZFtrTRM99xKqP70zwIvES8rzJT2WvkTMuZZO1756Bn7GXkHLKmSCQaKrPTCs
95pQDF/Ki23WQW4VBtycUfp7q5fXXCqq6tNaQ5mXXTqlKa6A6tHRfQFuMOmDjHNTRMk+syATAIBB
cT3v5sTCjXzu9moPgIUgudkWELNsUR2kQ5352MLnb/ux3c/UDH70dzJdV4mA7GLl4KpFAhVTL0ja
mEPoJ7mjtUvXTn6mmA7v/Ms8ykp/etCClq6qeBeKEg==
=XN3H
-----END PGP SIGNATURE-----

--------------yy07CPsTfRFxp8fZtyapMmLo--

