Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270E6661EB6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 07:36:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473322.733843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pElkq-0005yy-Cz; Mon, 09 Jan 2023 06:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473322.733843; Mon, 09 Jan 2023 06:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pElkq-0005wA-AF; Mon, 09 Jan 2023 06:35:32 +0000
Received: by outflank-mailman (input) for mailman id 473322;
 Mon, 09 Jan 2023 06:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CfuE=5G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pElkp-0005w4-1K
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 06:35:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceac5909-8fe7-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 07:35:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 44CC329395;
 Mon,  9 Jan 2023 06:35:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4B0F134AD;
 Mon,  9 Jan 2023 06:35:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hsJENq+1u2OUIwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 09 Jan 2023 06:35:27 +0000
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
X-Inumbo-ID: ceac5909-8fe7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673246128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3cpNAoTzx4mYIaRdBrMGabQXSJ35A+xG9+z4dCYHRHs=;
	b=s9ErdALrW00XQok62mNw/8rTGW2CPZT5VanCuBOfU2t9SX+O6twaig4ldnBCmbu7svcodi
	US61xk/DSj01wra/MEW1iw7TNmjm7kUe+tYDIsj+Ppv8hn8+JgPTXbe2lnwv3FGuGpiN8B
	XZXqWn9q/4KE7jDM+I11RfMfvjnbh9Y=
Message-ID: <fe81a331-530d-9328-ebc4-1da2c4ec4571@suse.com>
Date: Mon, 9 Jan 2023 07:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] x86/xen: Remove the unused function p2m_index()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: boris.ostrovsky@oracle.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20230105090141.36248-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230105090141.36248-1-jiapeng.chong@linux.alibaba.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EewI0ZGsy7qxZ2dMrnpmluuY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EewI0ZGsy7qxZ2dMrnpmluuY
Content-Type: multipart/mixed; boundary="------------K0aOUOdipexF2AKtyJOa40IA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: boris.ostrovsky@oracle.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
Message-ID: <fe81a331-530d-9328-ebc4-1da2c4ec4571@suse.com>
Subject: Re: [PATCH v2] x86/xen: Remove the unused function p2m_index()
References: <20230105090141.36248-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230105090141.36248-1-jiapeng.chong@linux.alibaba.com>

--------------K0aOUOdipexF2AKtyJOa40IA
Content-Type: multipart/mixed; boundary="------------GKoe8SjNPT20lOoePu2aELwU"

--------------GKoe8SjNPT20lOoePu2aELwU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDEuMjMgMTA6MDEsIEppYXBlbmcgQ2hvbmcgd3JvdGU6DQo+IFRoZSBmdW5jdGlv
biBwMm1faW5kZXggaXMgZGVmaW5lZCBpbiB0aGUgcDJtLmMgZmlsZSwgYnV0IG5vdCBjYWxs
ZWQNCj4gZWxzZXdoZXJlLCBzbyByZW1vdmUgdGhpcyB1bnVzZWQgZnVuY3Rpb24uDQo+IA0K
PiBhcmNoL3g4Ni94ZW4vcDJtLmM6MTM3OjI0OiB3YXJuaW5nOiB1bnVzZWQgZnVuY3Rpb24g
J3AybV9pbmRleCcuDQo+IA0KPiBMaW5rOiBodHRwczovL2J1Z3ppbGxhLm9wZW5hbm9saXMu
Y24vc2hvd19idWcuY2dpP2lkPTM1NTcNCj4gUmVwb3J0ZWQtYnk6IEFiYWNpIFJvYm90IDxh
YmFjaUBsaW51eC5hbGliYWJhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmlhcGVuZyBDaG9u
ZyA8amlhcGVuZy5jaG9uZ0BsaW51eC5hbGliYWJhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------GKoe8SjNPT20lOoePu2aELwU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------GKoe8SjNPT20lOoePu2aELwU--

--------------K0aOUOdipexF2AKtyJOa40IA--

--------------EewI0ZGsy7qxZ2dMrnpmluuY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmO7tXcFAwAAAAAACgkQsN6d1ii/Ey+N
sgf/XR9GrAGEdbpZ0hQ7Pwqb9n7fjbuBP/LRDat2KloqfIVY/g6wXVpazTu/pP9QBbKfsKbmwGZT
JldRX6f91xy+xKl2Rh/9fOIHKL19uvNmKJMNmMTIXcVGDH8lLffBNngyqVDMGNCGjV9CI4AtoIfq
rD/FcfL+EiSsjITwBoqdH1oIaYolfrlGccPZ7v1+c5vSN6UzflBVmGU8buZrSdslq0tMHBtwPuAQ
XetoH09lULfGo83mmNTZ6/O+gXOt3hzKFxkLIdcRRUMPCFtibqQSe2TadpuPCS0gw/oOwcFGUO0z
y0618kgsKF+yPhL7B2wPVAe/MydQ3LsUex1kdax1JA==
=qHuF
-----END PGP SIGNATURE-----

--------------EewI0ZGsy7qxZ2dMrnpmluuY--

