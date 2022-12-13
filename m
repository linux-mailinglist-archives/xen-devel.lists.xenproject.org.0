Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154764B007
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 07:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460188.718054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4z2S-0007PR-47; Tue, 13 Dec 2022 06:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460188.718054; Tue, 13 Dec 2022 06:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4z2S-0007N2-1I; Tue, 13 Dec 2022 06:45:16 +0000
Received: by outflank-mailman (input) for mailman id 460188;
 Tue, 13 Dec 2022 06:45:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p4z2Q-0007Mb-J1
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 06:45:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1aa7ee4-7ab1-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 07:45:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5797F1FD94;
 Tue, 13 Dec 2022 06:45:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31DD4138EE;
 Tue, 13 Dec 2022 06:45:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Yn3ICngfmGPjbQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 06:45:12 +0000
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
X-Inumbo-ID: b1aa7ee4-7ab1-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670913912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9lFHTj0LDG7gzqJBbTVLmhXO1MhTkZbQKivlImrz7ko=;
	b=BN/pudGUrEaRrPyZE6UMuLN6FdDT88HsmyoXTHt9KwsrZtt08G1IBpz1dy8LlMFO68/GLn
	l4m4l5v36xykITsOy2R3tQ7P6wHUlXdADqvMBWR7kv51VzjL32xBiNaTI1BtcASsjs5O96
	UMWkrc0nQsbtDp+EUZSMMeBQyR6+/HU=
Message-ID: <3a560840-aa3d-fb9b-37dc-7b13f8f0bbad@suse.com>
Date: Tue, 13 Dec 2022 07:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 10/20] tools/xenstore: replace watch->relative_path with a
 prefix length
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-11-jgross@suse.com>
 <821a4970-2d21-e9c2-865a-868daeadc510@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <821a4970-2d21-e9c2-865a-868daeadc510@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0YjuLdMl5yPEYPRepmA9QCAO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0YjuLdMl5yPEYPRepmA9QCAO
Content-Type: multipart/mixed; boundary="------------E29VwqI3rj1gwiokb7rhv3x1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <3a560840-aa3d-fb9b-37dc-7b13f8f0bbad@suse.com>
Subject: Re: [PATCH 10/20] tools/xenstore: replace watch->relative_path with a
 prefix length
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-11-jgross@suse.com>
 <821a4970-2d21-e9c2-865a-868daeadc510@xen.org>
In-Reply-To: <821a4970-2d21-e9c2-865a-868daeadc510@xen.org>

--------------E29VwqI3rj1gwiokb7rhv3x1
Content-Type: multipart/mixed; boundary="------------8rr8ci0mECHnnCAgzWrdCoMX"

--------------8rr8ci0mECHnnCAgzWrdCoMX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTIuMjIgMjI6NTEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzExLzIwMjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBA
QCAtMzI0LDggKzMxMiw3IEBAIGNvbnN0IGNoYXIgKmR1bXBfc3RhdGVfd2F0Y2hlcyhGSUxF
ICpmcCwgc3RydWN0IGNvbm5lY3Rpb24gDQo+PiAqY29ubiwNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBoZWFkLmxlbmd0aCA9IHNpemVvZihzdyk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
c3cuY29ubl9pZCA9IGNvbm5faWQ7DQo+PiAtwqDCoMKgwqDCoMKgwqAgcGF0aCA9IGdldF93
YXRjaF9wYXRoKHdhdGNoLCB3YXRjaC0+bm9kZSk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgc3cu
cGF0aF9sZW5ndGggPSBzdHJsZW4ocGF0aCkgKyAxOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHN3
LnBhdGhfbGVuZ3RoID0gc3RybGVuKHdhdGNoLT5ub2RlICsgd2F0Y2gtPnByZWZpeF9sZW4p
ICsgMTsNCj4gDQo+IFdoeSBhcmUgeW91IG9wZW4tY29kaW5nIGdldF93YXRjaF9wYXRoKCk/
DQoNCldpbGwgZml4IGl0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------8rr8ci0mECHnnCAgzWrdCoMX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------8rr8ci0mECHnnCAgzWrdCoMX--

--------------E29VwqI3rj1gwiokb7rhv3x1--

--------------0YjuLdMl5yPEYPRepmA9QCAO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOYH3cFAwAAAAAACgkQsN6d1ii/Ey9w
2gf+MxPKE7cjap/SF19eucaemojHsVkNgADLekunNgpS7gweSuS31MIMTGMKfleFxUsHOAUYMkI5
xYy9DUcIPRSlGCgDKj6XQ+WMab5UqDNje0JKBumpumIrp9ivlwpJYt7Kk7QHhSNIcuD7Zf+Hoduw
fi3LF9SjtByEuVf0dwtvQAAijjmioTtUc6e29B7NzqOi6DMwKzMxsoRQ5837ImWktlovQf0jwUL2
qhA00202D9YDzoB3AtsFvFA93QJNgdoEeFAVveqrN/VT/dAJtvgfPF9vADw61BFSAKhTfFssFPIn
R25EnxrVuKmwhkEV5pkbuNQKw5EgGqyPr+n/L/r2Cg==
=MHA/
-----END PGP SIGNATURE-----

--------------0YjuLdMl5yPEYPRepmA9QCAO--

