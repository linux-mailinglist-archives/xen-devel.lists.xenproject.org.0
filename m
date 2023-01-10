Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C00663A83
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474377.735524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9gJ-0005WH-C6; Tue, 10 Jan 2023 08:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474377.735524; Tue, 10 Jan 2023 08:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9gJ-0005Ta-8x; Tue, 10 Jan 2023 08:08:27 +0000
Received: by outflank-mailman (input) for mailman id 474377;
 Tue, 10 Jan 2023 08:08:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLW0=5H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pF9gH-0004IQ-OG
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:08:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3e1ec29-90bd-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:08:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1FE54676B3;
 Tue, 10 Jan 2023 08:08:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD4431358A;
 Tue, 10 Jan 2023 08:08:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GNjLLPYcvWO+BgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 10 Jan 2023 08:08:22 +0000
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
X-Inumbo-ID: f3e1ec29-90bd-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673338103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EOLvc5pnec6Qvz0IU+meu3lE65aCc308JtHNKiojSLY=;
	b=RdVtED4QkMdawYnUheFwonqrPjjaeMxanOr0oKCs0M9/UOFRKUnxjmXEqvW9/yH9KdH1jN
	rc3H8Mhp9GwaScjUMpfXNXZWSHUkwc+HSfMRBmMoyLwYk8q3mXAnRNNyaokzfo9lsWOJ5G
	3obgGgtI7piKJWWw/dclODpSkreYogY=
Message-ID: <7c844c39-2ca0-0ee7-0c05-66932403fa30@suse.com>
Date: Tue, 10 Jan 2023 09:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] x86/xen: Remove the unused function p2m_index()
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: boris.ostrovsky@oracle.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20230105090141.36248-1-jiapeng.chong@linux.alibaba.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230105090141.36248-1-jiapeng.chong@linux.alibaba.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0PNXtjnnvM7ewaD6a96IAjRq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0PNXtjnnvM7ewaD6a96IAjRq
Content-Type: multipart/mixed; boundary="------------F5pGtvD6Hmk9tBX0D0MdPuj0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: boris.ostrovsky@oracle.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
Message-ID: <7c844c39-2ca0-0ee7-0c05-66932403fa30@suse.com>
Subject: Re: [PATCH v2] x86/xen: Remove the unused function p2m_index()
References: <20230105090141.36248-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230105090141.36248-1-jiapeng.chong@linux.alibaba.com>

--------------F5pGtvD6Hmk9tBX0D0MdPuj0
Content-Type: multipart/mixed; boundary="------------pRGhk8J2LAf4W2eEJiqH0h3E"

--------------pRGhk8J2LAf4W2eEJiqH0h3E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDEuMjMgMTA6MDEsIEppYXBlbmcgQ2hvbmcgd3JvdGU6DQo+IFRoZSBmdW5jdGlv
biBwMm1faW5kZXggaXMgZGVmaW5lZCBpbiB0aGUgcDJtLmMgZmlsZSwgYnV0IG5vdCBjYWxs
ZWQNCj4gZWxzZXdoZXJlLCBzbyByZW1vdmUgdGhpcyB1bnVzZWQgZnVuY3Rpb24uDQo+IA0K
PiBhcmNoL3g4Ni94ZW4vcDJtLmM6MTM3OjI0OiB3YXJuaW5nOiB1bnVzZWQgZnVuY3Rpb24g
J3AybV9pbmRleCcuDQo+IA0KPiBMaW5rOiBodHRwczovL2J1Z3ppbGxhLm9wZW5hbm9saXMu
Y24vc2hvd19idWcuY2dpP2lkPTM1NTcNCj4gUmVwb3J0ZWQtYnk6IEFiYWNpIFJvYm90IDxh
YmFjaUBsaW51eC5hbGliYWJhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmlhcGVuZyBDaG9u
ZyA8amlhcGVuZy5jaG9uZ0BsaW51eC5hbGliYWJhLmNvbT4NCg0KUHVzaGVkIHRvIHhlbi90
aXAuZ2l0IGZvci1saW51cy02LjINCg0KDQpKdWVyZ2VuDQoNCg==
--------------pRGhk8J2LAf4W2eEJiqH0h3E
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------pRGhk8J2LAf4W2eEJiqH0h3E--

--------------F5pGtvD6Hmk9tBX0D0MdPuj0--

--------------0PNXtjnnvM7ewaD6a96IAjRq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmO9HPYFAwAAAAAACgkQsN6d1ii/Ey9F
lwgAimMoYe0xETfpgDsSG8zRtW6MWXY+2UTVahqK1Y1e7wgJxgCKy8vumEKadDLlxOl+z2e40y1q
RfL7syF3t6hhWbqt/VlsBSYSoaVdC0Wi9ML1VGcI5BGng7QNwr6alTmtUN4kqVY/z4Es2NDU14VK
Exnp2y4vK1J1jNcOOPLppcewbtbmC9beSlHAQ3Z2fHKOSJb/vejUAxXQPWc30LHZl8HgDjF2TMz7
sIhvRMVU5RcmQn/RlUBSEu08SWXrB86iFiuS33jMYC+iKU1INTDPLiV7iFQp//9GWR3EZkk+PbMf
i11oUoPUcXSQn0gNErHuNZLVAptfo9os5n2UvBpS1Q==
=IQpu
-----END PGP SIGNATURE-----

--------------0PNXtjnnvM7ewaD6a96IAjRq--

