Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B77A52B677
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 11:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331818.555426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGFJ-0006Ar-GN; Wed, 18 May 2022 09:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331818.555426; Wed, 18 May 2022 09:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGFJ-00066w-DJ; Wed, 18 May 2022 09:45:33 +0000
Received: by outflank-mailman (input) for mailman id 331818;
 Wed, 18 May 2022 09:45:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQHP=V2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nrGFH-00065t-Ez
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 09:45:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 410ea23d-d68f-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 11:45:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 28E5E21878;
 Wed, 18 May 2022 09:45:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5EC7133F5;
 Wed, 18 May 2022 09:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sIgpJznAhGL/FgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 May 2022 09:45:29 +0000
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
X-Inumbo-ID: 410ea23d-d68f-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652867130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vgh2DJ2U6GGAabUnXtzA3pqoeQ6tzdrlj8IUMiOVaC0=;
	b=MPeHqxPN39ru+c2m2fBxTrsooSx7ryDQNBBfRRKaPUXWLZGgcx2Ev80j3tbuRtjfNlNp0H
	KtmtWiCwu4kBHVW13rvYrzyLgBOEc6eTfC/5wMFsJcf4w1YaQ8nkj3iP48m6MSJc7BpdV7
	NtIREBFK20tvek34Y8M1Z6SnDggLdN4=
Message-ID: <db7f5c3e-894a-1700-e0a4-5893bd70c205@suse.com>
Date: Wed, 18 May 2022 11:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 0/9] xen: drop hypercall function tables
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20220324140139.5899-1-jgross@suse.com>
 <06edd55a-86f2-52e3-e275-ee928a956fdf@suse.com>
 <8baf689f-2a20-cf07-6878-9f9459063a25@suse.com>
In-Reply-To: <8baf689f-2a20-cf07-6878-9f9459063a25@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------G0qgR06KuFB2qBY0T0ObdUAh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------G0qgR06KuFB2qBY0T0ObdUAh
Content-Type: multipart/mixed; boundary="------------cnGKimcGzxMJGLHsV0PlSzxz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <db7f5c3e-894a-1700-e0a4-5893bd70c205@suse.com>
Subject: Re: [PATCH v6 0/9] xen: drop hypercall function tables
References: <20220324140139.5899-1-jgross@suse.com>
 <06edd55a-86f2-52e3-e275-ee928a956fdf@suse.com>
 <8baf689f-2a20-cf07-6878-9f9459063a25@suse.com>
In-Reply-To: <8baf689f-2a20-cf07-6878-9f9459063a25@suse.com>

--------------cnGKimcGzxMJGLHsV0PlSzxz
Content-Type: multipart/mixed; boundary="------------HqcUWNgB0A7sZ9zWfrVXDoRW"

--------------HqcUWNgB0A7sZ9zWfrVXDoRW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDUuMjIgMDk6NTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDE5LjA0LjIy
IDEwOjAxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjQuMDMuMjIgMTU6MDEsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gSW4gb3JkZXIgdG8gYXZvaWQgaW5kaXJlY3QgZnVu
Y3Rpb24gY2FsbHMgb24gdGhlIGh5cGVyY2FsbCBwYXRoIGFzDQo+Pj4gbXVjaCBhcyBwb3Nz
aWJsZSB0aGlzIHNlcmllcyBpcyByZW1vdmluZyB0aGUgaHlwZXJjYWxsIGZ1bmN0aW9uIHRh
Ymxlcw0KPj4+IGFuZCBpcyByZXBsYWNpbmcgdGhlIGh5cGVyY2FsbCBoYW5kbGVyIGNhbGxz
IHZpYSB0aGUgZnVuY3Rpb24gYXJyYXkNCj4+PiBieSBhdXRvbWF0aWNhbGx5IGdlbmVyYXRl
ZCBjYWxsIG1hY3Jvcy4NCj4+Pg0KPj4+IEFub3RoZXIgYnktcHJvZHVjdCBvZiBnZW5lcmF0
aW5nIHRoZSBjYWxsIG1hY3JvcyBpcyB0aGUgYXV0b21hdGljDQo+Pj4gZ2VuZXJhdGluZyBv
ZiB0aGUgaHlwZXJjYWxsIGhhbmRsZXIgcHJvdG90eXBlcyBmcm9tIHRoZSBzYW1lIGRhdGEg
YmFzZQ0KPj4+IHdoaWNoIGlzIHVzZWQgdG8gZ2VuZXJhdGUgdGhlIG1hY3Jvcy4NCj4+Pg0K
Pj4+IFRoaXMgaGFzIHRoZSBhZGRpdGlvbmFsIGFkdmFudGFnZSBvZiB1c2luZyB0eXBlIHNh
ZmUgY2FsbHMgb2YgdGhlDQo+Pj4gaGFuZGxlcnMgYW5kIHRvIGVuc3VyZSByZWxhdGVkIGhh
bmRsZXIgKGUuZy4gUFYgYW5kIEhWTSBvbmVzKSBzaGFyZQ0KPj4+IHRoZSBzYW1lIHByb3Rv
dHlwZXMuDQo+Pj4NCj4+PiBBIHZlcnkgYnJpZWYgcGVyZm9ybWFuY2UgdGVzdCAocGFyYWxs
ZWwgYnVpbGQgb2YgdGhlIFhlbiBoeXBlcnZpc29yDQo+Pj4gaW4gYSA2IHZjcHUgZ3Vlc3Qp
IHNob3dlZCBhIHZlcnkgc2xpbSBpbXByb3ZlbWVudCAobGVzcyB0aGFuIDElKSBvZg0KPj4+
IHRoZSBwZXJmb3JtYW5jZSB3aXRoIHRoZSBwYXRjaGVzIGFwcGxpZWQuIFRoZSB0ZXN0IHdh
cyBwZXJmb3JtZWQgdXNpbmcNCj4+PiBhIFBWIGFuZCBhIFBWSCBndWVzdC4NCj4+DQo+PiBB
IGdlbnRsZSBwaW5nIHJlZ2FyZGluZyB0aGlzIHNlcmllcy4NCj4+DQo+PiBJIHRoaW5rIHBh
dGNoIDEgc3RpbGwgbGFja3MgYW4gQWNrIGZyb20geDg2IHNpZGUuIE90aGVyIHRoYW4gdGhh
dA0KPj4gcGF0Y2hlcyAxLCAyIGFuZCA0IHNob3VsZCBiZSBmaW5lIHRvIGdvIGluLCBhcyB0
aGV5IGFyZSBjbGVhbnVwcyB3aGljaA0KPj4gYXJlIGZpbmUgb24gdGhlaXIgb3duIElNSE8u
DQo+Pg0KPj4gQW5kcmV3LCB5b3Ugd2FudGVkIHRvIGdldCBzb21lIHBlcmZvcm1hbmNlIG51
bWJlcnMgb2YgdGhlIHNlcmllcyB1c2luZw0KPj4gdGhlIENpdHJpeCB0ZXN0IGVudmlyb25t
ZW50LiBBbnkgbmV3cyBvbiB0aGUgcHJvZ3Jlc3MgaGVyZT8NCj4gDQo+IEFuZCBhbm90aGVy
IHBpbmcuDQo+IA0KPiBBbmRyZXcsIGNvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBzb21lIGZlZWRi
YWNrIHJlZ2FyZGluZyBwZXJmb3JtYW5jZQ0KPiB0ZXN0aW5nIHByb2dyZXNzPw0KDQpUaGlz
IGlzIGJlY29taW5nIHJpZGljdWxvdXMuIEFuZHJldywgSSBrbm93IHlvdSBhcmUgYnVzeSwg
YnV0IG5vdCByZWFjdGluZw0KYXQgYWxsIHRvIGV4cGxpY2l0IHF1ZXN0aW9ucyBpcyBraW5k
IG9mIGFubm95aW5nLg0KDQpCVFcsIHRoZSBxdWVzdGlvbiByZWdhcmRpbmcgcGF0Y2hlcyAx
LCAyIGFuZCA0IHRvIGdvIGluIGFzIGJlaW5nIGNsZWFudXBzDQpzdGlsbCBzdGFuZHMuDQoN
Cg0KSnVlcmdlbg0K
--------------HqcUWNgB0A7sZ9zWfrVXDoRW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------HqcUWNgB0A7sZ9zWfrVXDoRW--

--------------cnGKimcGzxMJGLHsV0PlSzxz--

--------------G0qgR06KuFB2qBY0T0ObdUAh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKEwDkFAwAAAAAACgkQsN6d1ii/Ey9r
Owf/cp4MHflNhWUdeLg9tP8B1EaucYVRezqaE7yUiQst6B4G6w1hHnTaewZCgol0Xz7eHGFmg/wq
6mBbV0ER3bK5rvt2e3UyqqKnBKEbWHS32pvssqKDYRSNgOSbgD3gV+aR2x87+wNPRJUncgMzzPZK
F44PEnOz400KToMbOov9FT/qiTupjX37Y723Wu+iLr8AfyakNRWxAsfpXRqIOvUL6gaFEiI4PZgo
VTPIm87znAS1gNYoa8D5d5ZFcFHsSWquvkd2X0ANma3B1b3nkYj90Q4JYXnI5jU1ZNEKht+4mWXh
fyZJZZQyV5VNuOKUrdO0u/tjHU+Rzo1bu3hlZV3/yw==
=CWAS
-----END PGP SIGNATURE-----

--------------G0qgR06KuFB2qBY0T0ObdUAh--

