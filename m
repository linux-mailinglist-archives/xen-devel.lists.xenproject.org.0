Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA4F4C406E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:48:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278861.476272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWGN-0007jS-Hl; Fri, 25 Feb 2022 08:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278861.476272; Fri, 25 Feb 2022 08:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWGN-0007h5-ER; Fri, 25 Feb 2022 08:47:43 +0000
Received: by outflank-mailman (input) for mailman id 278861;
 Fri, 25 Feb 2022 08:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d3I2=TI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nNWGM-0007gx-67
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:47:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9760cf61-9617-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 09:47:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5953212BF;
 Fri, 25 Feb 2022 08:47:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DE3713B65;
 Fri, 25 Feb 2022 08:47:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f4f+IKyXGGKbRAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 25 Feb 2022 08:47:40 +0000
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
X-Inumbo-ID: 9760cf61-9617-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645778860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BlaTZRJRXNesrFzBAHf17w8XerLFn10CsrD8MIBovvg=;
	b=BlE+SxpjCPyRI+90lzFdbqk7eoDxDQ76uEg2z3Ca4uQ74RTtYISFhdkXMHFZsxgClS9XgP
	BN+SwF50DjKwjX3US6d2k9B+pzOn1sI7E/0Ay/yqJDOmB4a4eGVlADvxcmNIj8HB+mPlc5
	VTgPav5v/ct2cje1bZ2GXt/V2LgViv0=
Message-ID: <fec22cee-d8f4-676c-7ec4-7f65f93af061@suse.com>
Date: Fri, 25 Feb 2022 09:47:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] xen/spinlock: use lock address for lock debug
 functions
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220224105436.1480-1-jgross@suse.com>
 <20220224105436.1480-2-jgross@suse.com>
 <7009dbf4-d814-6181-7315-a4fce21ee338@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <7009dbf4-d814-6181-7315-a4fce21ee338@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0F61St06QKinIR7enVadyATd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0F61St06QKinIR7enVadyATd
Content-Type: multipart/mixed; boundary="------------Ar7FXG7mzEMPPo36IiJ1T0TU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <fec22cee-d8f4-676c-7ec4-7f65f93af061@suse.com>
Subject: Re: [PATCH 1/2] xen/spinlock: use lock address for lock debug
 functions
References: <20220224105436.1480-1-jgross@suse.com>
 <20220224105436.1480-2-jgross@suse.com>
 <7009dbf4-d814-6181-7315-a4fce21ee338@suse.com>
In-Reply-To: <7009dbf4-d814-6181-7315-a4fce21ee338@suse.com>

--------------Ar7FXG7mzEMPPo36IiJ1T0TU
Content-Type: multipart/mixed; boundary="------------WAQT3iSH1H7Sffeokqf5Bt6g"

--------------WAQT3iSH1H7Sffeokqf5Bt6g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDIuMjIgMTc6MTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wMi4yMDIy
IDExOjU0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW5zdGVhZCBvZiBvbmx5IHBhc3Np
bmcgdGhlIGxvY2tfZGVidWcgYWRkcmVzcyB0byBjaGVja19sb2NrKCkgZXQgYWwNCj4+IHVz
ZSB0aGUgYWRkcmVzcyBvZiB0aGUgc3BpbmxvY2suDQo+IA0KPiBJJ20gdW5jZXJ0YWluIGFi
b3V0IHRoaXMgZnVsbCBleHBvc3VyZS4gVGhlIG5leHQgcGF0Y2ggbG9va3MgdG8gYWdhaW4N
Cj4gb25seSB1c2UgdGhlIG5ldyAiZGF0YSIgc3ViZmllbGQgaW4gdGhlc2UgZGVidWdnaW5n
IGhlbHBlcnMuDQoNCk5ldmVydGhlbGVzcyBJIGRvbid0IHRoaW5rIHRoYXQgdGhpcyBkZXRh
aWwgc2hvdWxkIGJlIGV4cG9ydGVkLA0KZXNwZWNpYWxseSBhcyBjaGVja19sb2NrKCkgaXMg
YmVpbmcgdXNlZCBmb3Igcndsb2NrcywgdG9vLg0KDQoNCkp1ZXJnZW4NCg==
--------------WAQT3iSH1H7Sffeokqf5Bt6g
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WAQT3iSH1H7Sffeokqf5Bt6g--

--------------Ar7FXG7mzEMPPo36IiJ1T0TU--

--------------0F61St06QKinIR7enVadyATd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIYl6wFAwAAAAAACgkQsN6d1ii/Ey8G
aAf/Up0PyJq156Zlxg2QQfJq+x8RgJ2el2gFpsYjZ0eP6O/MV+eWOdVdqreRX1dayKcEr9xpxc2a
NAxFx+LI3JlXjAHqg5zLCDLgJfeOOXGZOamlaaORXciSvpk0Imjo69s8ZCu17mC+FN2MVSu4iwgn
EC8aE03o1laOrA/gPhMSgL66IJ976GIlgSS43XEPvkAL+hLA9U/BlmUyfnZp+OEWvkfgrwCiXY/Q
jSmGH7MdCM1KyNgU9KGBajXLd6aoVagI6auy1ILfP9xhuBYf5bKQqFtKXF0hFWduGIWCuwiVVg/4
9oXE5TMawDTy+RY8lf6htfWTPSojh+I0fZVG0I0IbQ==
=USBx
-----END PGP SIGNATURE-----

--------------0F61St06QKinIR7enVadyATd--

