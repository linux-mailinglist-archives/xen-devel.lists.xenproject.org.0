Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441A94D5D41
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 09:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288858.489952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaax-0002yX-5x; Fri, 11 Mar 2022 08:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288858.489952; Fri, 11 Mar 2022 08:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaax-0002wA-2I; Fri, 11 Mar 2022 08:25:55 +0000
Received: by outflank-mailman (input) for mailman id 288858;
 Fri, 11 Mar 2022 08:25:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nSaav-0002w4-Rb
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 08:25:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd64011e-a114-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 09:25:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92AE51F381;
 Fri, 11 Mar 2022 08:25:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A27513A85;
 Fri, 11 Mar 2022 08:25:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pEPJEJAHK2IyOQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 11 Mar 2022 08:25:52 +0000
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
X-Inumbo-ID: dd64011e-a114-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646987152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tq/mZqBDSm+MJQBgs9+hcoWxWqGgZpUACfqcB9eXLxk=;
	b=il/krjpVHnilQE7ry6rG/+lgzNSPFrlkHSVISHTtzzYCJ7zgsSXzoZ5INjTRXumDVu6CC7
	iYOOoyw9lbJqC4Dwnui0aF7shAI4uTDQmld9BCtlA6QoCLq76lSn/Des9AjskS8llC+pA8
	lJIWCMm1RqBwzlQIbZcigOuHKiwwrhs=
Message-ID: <2dedbb44-83cd-f491-35e2-8e6b5e884b26@suse.com>
Date: Fri, 11 Mar 2022 09:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/6] xen/cpupool: Allow cpupool0 to use different
 scheduler
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-7-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220310171019.6170-7-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Am6gw1Jg7lVY8nZ5C3XeOQ8G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Am6gw1Jg7lVY8nZ5C3XeOQ8G
Content-Type: multipart/mixed; boundary="------------iyl9VfiiLzYg24mfKf4dvmKe";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <2dedbb44-83cd-f491-35e2-8e6b5e884b26@suse.com>
Subject: Re: [PATCH v2 6/6] xen/cpupool: Allow cpupool0 to use different
 scheduler
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-7-luca.fancellu@arm.com>
In-Reply-To: <20220310171019.6170-7-luca.fancellu@arm.com>

--------------iyl9VfiiLzYg24mfKf4dvmKe
Content-Type: multipart/mixed; boundary="------------PE81kw7pdMX86qNeEIKH2D1C"

--------------PE81kw7pdMX86qNeEIKH2D1C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDMuMjIgMTg6MTAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IEN1cnJlbnRseSBj
cHVwb29sMCBjYW4gdXNlIG9ubHkgdGhlIGRlZmF1bHQgc2NoZWR1bGVyLCBhbmQNCj4gY3B1
cG9vbF9jcmVhdGUgaGFzIGFuIGhhcmNvZGVkIGJlaGF2aW9yIHdoZW4gY3JlYXRpbmcgdGhl
IHBvb2wgMA0KDQpOaXQ6IHMvaGFyY29kZWQvaGFyZGNvZGVkLw0KDQo+IHRoYXQgZG9lc24n
dCBhbGxvY2F0ZSBuZXcgbWVtb3J5IGZvciB0aGUgc2NoZWR1bGVyLCBidXQgdXNlcyB0aGUN
Cj4gZGVmYXVsdCBzY2hlZHVsZXIgc3RydWN0dXJlIGluIG1lbW9yeS4NCj4gDQo+IFdpdGgg
dGhpcyBjb21taXQgaXQgaXMgcG9zc2libGUgdG8gYWxsb2NhdGUgYSBkaWZmZXJlbnQgc2No
ZWR1bGVyIGZvcg0KPiB0aGUgY3B1cG9vbDAgd2hlbiB1c2luZyB0aGUgYm9vdCB0aW1lIGNw
dXBvb2wuDQo+IFRvIGFjaGlldmUgdGhpcyB0aGUgaGFyZGNvZGVkIGJlaGF2aW9yIGluIGNw
dXBvb2xfY3JlYXRlIGlzIHJlbW92ZWQNCj4gYW5kIHRoZSBjcHVwb29sMCBjcmVhdGlvbiBp
cyBtb3ZlZC4NCj4gDQo+IFdoZW4gY29tcGlsaW5nIHdpdGhvdXQgYm9vdCB0aW1lIGNwdXBv
b2xzIGVuYWJsZWQsIHRoZSBjdXJyZW50DQo+IGJlaGF2aW9yIGlzIG1haW50YWluZWQgKGV4
Y2VwdCB0aGF0IGNwdXBvb2wwIHNjaGVkdWxlciBtZW1vcnkgd2lsbCBiZQ0KPiBhbGxvY2F0
ZWQpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxs
dUBhcm0uY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------PE81kw7pdMX86qNeEIKH2D1C
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------PE81kw7pdMX86qNeEIKH2D1C--

--------------iyl9VfiiLzYg24mfKf4dvmKe--

--------------Am6gw1Jg7lVY8nZ5C3XeOQ8G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIrB48FAwAAAAAACgkQsN6d1ii/Ey8e
RQf/WiC621Lt3J/LLSbZYIB+f9U3W70vyHlWlgoADHqokFbAiUovGEDqf3EUsjcXe/CBlt03sqEp
SKwFL/zEngQp2FJIxXhtO6/k5DOSIxvIZOe7qnteAAbWE4kyk2XKva+ymNxhldYIihXQQyErSvq5
dJErVhsL9g8TulR4OvzP20emFuDj91f7Cc+HRndb8Wacbx2wkCDUOHEOwnOMFdODH6OtaFcqFPZk
BOknuejT1ZD56leTJHVPBhclCw8Zmj277KKwh38kRBWRcCQbKanfjiOX1pc4TCQaDkNQkl1yv1es
kzIxRf2V/G8VouDKYcE4DqP+oIxItDPfiuiA4ZA86Q==
=Vere
-----END PGP SIGNATURE-----

--------------Am6gw1Jg7lVY8nZ5C3XeOQ8G--

