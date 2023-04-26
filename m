Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AABB6EEF35
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 09:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526522.818336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZRV-0003Pk-FM; Wed, 26 Apr 2023 07:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526522.818336; Wed, 26 Apr 2023 07:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZRV-0003NZ-CE; Wed, 26 Apr 2023 07:19:57 +0000
Received: by outflank-mailman (input) for mailman id 526522;
 Wed, 26 Apr 2023 07:19:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDOC=AR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1prZRT-0003NT-VH
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 07:19:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdf1c4ba-e402-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 09:19:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 54EE521A0D;
 Wed, 26 Apr 2023 07:19:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13C88138F0;
 Wed, 26 Apr 2023 07:19:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hKEGA5rQSGRecgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 26 Apr 2023 07:19:54 +0000
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
X-Inumbo-ID: bdf1c4ba-e402-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682493594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+PlWFiHV5a4YliXjXOzC7vj4vlQL5aM6zw9+kkyleqY=;
	b=QDwa69+tZc+ndop6WVrqDaweyUtlg7SSFbWt0sVBGaYdJgQUUXNyAxEyyRAoNJlmU80OSx
	Orr4yJnI/qZUsJJZcqPk0iVxwpFbh+zwUetWL8xW3htevds4opGgTvP8MyUMgqdbmQ0JGh
	ZItGQ0WAK15+/WVfo8bILZK+io0XrhU=
Message-ID: <6807cae6-16e1-b041-5492-15eda6732275@suse.com>
Date: Wed, 26 Apr 2023 09:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230405070349.25293-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 00/13] tools/xenstore: rework internal accounting
In-Reply-To: <20230405070349.25293-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N2AiyT4Sy18ABM1cQdpB07nL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N2AiyT4Sy18ABM1cQdpB07nL
Content-Type: multipart/mixed; boundary="------------YiLzASuUI6vzbXFOcs2XHep2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <6807cae6-16e1-b041-5492-15eda6732275@suse.com>
Subject: Re: [PATCH v4 00/13] tools/xenstore: rework internal accounting
References: <20230405070349.25293-1-jgross@suse.com>
In-Reply-To: <20230405070349.25293-1-jgross@suse.com>

--------------YiLzASuUI6vzbXFOcs2XHep2
Content-Type: multipart/mixed; boundary="------------00bIc8B1PT0vCMA93olUOaDm"

--------------00bIc8B1PT0vCMA93olUOaDm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDQuMjMgMDk6MDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFRoaXMgc2VyaWVz
IHJld29ya3MgdGhlIFhlbnN0b3JlIGludGVybmFsIGFjY291bnRpbmcgdG8gdXNlIGEgdW5p
Zm9ybQ0KPiBnZW5lcmljIGZyYW1ld29yay4gSXQgaXMgYWRkaW5nIHNvbWUgYWRkaXRpb25h
bCB1c2VmdWwgZGlhZ25vc3RpYw0KPiBpbmZvcm1hdGlvbiwgbGlrZSBhY2NvdW50aW5nIHRy
YWNlIGFuZCBtYXguIHBlci1kb21haW4gYW5kIGdsb2JhbCBxdW90YQ0KPiB2YWx1ZXMgc2Vl
bi4NCj4gDQo+IENoYW5nZXMgaW4gVjI6DQo+IC0gYWRkZWQgcGF0Y2ggMSAobGVmdG92ZXIg
ZnJvbSBwcmV2aW91cyBzZXJpZXMpDQo+IC0gcmViYXNlDQo+IA0KPiBDaGFuZ2VzIGluIFYz
Og0KPiAtIGFkZHJlc3NlZCBjb21tZW50cw0KPiANCj4gQ2hhbmdlcyBpbiBWNDoNCj4gLSBm
aXhlZCBwYXRjaCAzDQoNCkFub3RoZXIgdGhvdWdodCBmb3IgdGhpcyBzZXJpZXMgYW5kIGZv
bGxvd3VwIG9uZToNCg0KRG8gd2Ugd2FudCB0byBrZWVwIGN1cnJlbnQgY29kaW5nIHN0eWxl
IGluIHRvb2xzL3hlbnN0b3JlIChiYXNpY2FsbHkNCkxpbnV4IGtlcm5lbCBzdHlsZSksIG9y
IGRvIHdlIHdhbnQgdG8gc3dpdGNoIHRvIFhlbiBzdHlsZSBpbnN0ZWFkPw0KDQpJZiBhIHN3
aXRjaCB0byBYZW4gc3R5bGUgaXMgcHJlZmVycmVkIChJIGRvIHByZWZlciB0aGF0IHN3aXRj
aCksIEknZA0KbGlrZSB0byBzdWdnZXN0IHRoYXQgSSBkbyBhIHJld29yayBvZiB0aGlzIHNl
cmllcyBhbmQgdGhlIGZvbGxvd3VwIG9uZQ0KdG8gdXNlIHRoZSBYZW4gc3R5bGUgZm9yIG5l
dyBvciBtb3ZlZCBmdW5jdGlvbnMuDQoNCkEgbW9yZSByYWRpY2FsIGFwcHJvYWNoIHdvdWxk
IGJlIHRvIGRvIGEgbGFyZ2Ugc3R5bGUgc3dpdGNoIHNlcmllcw0KYWZ0ZXIgdGhlIHR3byBz
ZXJpZXMsIGJ1dCBJJ20gaGVzaXRhbnQgYXMgdGhpcyB3b3VsZCBhZmZlY3QgYmFja3BvcnRz
DQpyYXRoZXIgYmFkbHkuDQoNCg0KSnVlcmdlbg0KDQo=
--------------00bIc8B1PT0vCMA93olUOaDm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------00bIc8B1PT0vCMA93olUOaDm--

--------------YiLzASuUI6vzbXFOcs2XHep2--

--------------N2AiyT4Sy18ABM1cQdpB07nL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRI0JkFAwAAAAAACgkQsN6d1ii/Ey+C
qgf/SshbV+8/GfftbZLMrnTCF0qihI8HyYQxqcVL0/SXGLr+Tma1Eyd95hRt97GJG6B81obHH4++
sF11mSzOEVzWlIYNTwyc33Z2Rqnk44QwmvXQgrIxs4qB2SCB5i6gY3T91Nzq8+fB0s9UpFuJLPmI
TCN0aFEBNualGZ3Co3JcO9VYtzi7zlykdhGn2ECW2yqEp3X7x84hL108fZQj4yY/v8UF+EBoOlqK
hxrlAHQ3pUhrz1+RR0L0KglKMwwCPy3aRBSdTWdPs/RddZxBjNwXDWFKqL8AnfqKU335aPUSY6x+
iZofwFgAxjEqJikJHTA642a9YW86vytotLd9oRd3Fg==
=SwGC
-----END PGP SIGNATURE-----

--------------N2AiyT4Sy18ABM1cQdpB07nL--

