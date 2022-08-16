Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C15859541D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 09:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388046.624582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNrL8-00010i-Tg; Tue, 16 Aug 2022 07:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388046.624582; Tue, 16 Aug 2022 07:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNrL8-0000xU-Qr; Tue, 16 Aug 2022 07:50:18 +0000
Received: by outflank-mailman (input) for mailman id 388046;
 Tue, 16 Aug 2022 07:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NQK8=YU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNrL7-0000xO-3f
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 07:50:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10f1d289-1d38-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 09:50:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 939221F889;
 Tue, 16 Aug 2022 07:50:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6AB9C1345B;
 Tue, 16 Aug 2022 07:50:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2B23GDdM+2LYTQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 16 Aug 2022 07:50:15 +0000
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
X-Inumbo-ID: 10f1d289-1d38-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660636215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfhdCxuRjBmEi0cPWrL407a8Px41IL9+wtz+98T2aJ0=;
	b=PgOhkd+uM+CYoMdeVAJ9NKFzdXTdbgDIKKA0iqHrTn29YGyXOqKT/Ii4ZhNhoOOCvyk1WK
	N7QdQQL3eIlv7BgO2BfFA+Yq1O5tFZNFApNfI8Zo9P1hc9G0hD8OcwcOS8L7E3/F4knuje
	CQ3TdMoq+kdR/Fqavl5JXdTHWjDDSKQ=
Message-ID: <c35db0b9-f355-4312-c856-5361c9558d34@suse.com>
Date: Tue, 16 Aug 2022 09:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] x86: rework hypercall argument count table
 instantiation & use
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6f5f7adb-d34d-e753-0880-92eccccfb75a@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <6f5f7adb-d34d-e753-0880-92eccccfb75a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Dz4p9oBvOiXAuc0Wiow7Gzl0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Dz4p9oBvOiXAuc0Wiow7Gzl0
Content-Type: multipart/mixed; boundary="------------Hxd23eMhA7bpOVySPorp2Q7L";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <c35db0b9-f355-4312-c856-5361c9558d34@suse.com>
Subject: Re: [PATCH v2] x86: rework hypercall argument count table
 instantiation & use
References: <6f5f7adb-d34d-e753-0880-92eccccfb75a@suse.com>
In-Reply-To: <6f5f7adb-d34d-e753-0880-92eccccfb75a@suse.com>

--------------Hxd23eMhA7bpOVySPorp2Q7L
Content-Type: multipart/mixed; boundary="------------mhgrTAUQigLHzFz0wwbb3O7z"

--------------mhgrTAUQigLHzFz0wwbb3O7z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDguMjIgMDg6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBUaGUgaW5pdGlhbCBv
YnNlcnZhdGlvbiB3ZXJlIGR1cGxpY2F0ZSBzeW1ib2xzIHRoYXQgb3VyIGNoZWNraW5nIHdh
cm5zDQo+IGFib3V0LiBJbnN0ZWFkIG9mIG1lcmVseSByZW5hbWluZyBvbmUgb3IgYm90aCBw
YWlyKHMpIG9mIHN5bWJvbHMsDQo+IHJlZHVjZSAjaWZkZWYtYXJ5IGF0IHRoZSBzYW1lIHRp
bWUgYnkgbW92aW5nIHRoZSBpbnN0YW50aWF0aW9uIG9mIHRoZQ0KPiBhcnJheXMgaW50byBh
IG1hY3JvLiBXaGlsZSBkb2luZyB0aGUgY29udmVyc2lvbiBhbHNvIHN0b3Agb3Blbi1jb2Rp
bmcNCj4gYXJyYXlfYWNjZXNzX25vc3BlYygpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------mhgrTAUQigLHzFz0wwbb3O7z
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mhgrTAUQigLHzFz0wwbb3O7z--

--------------Hxd23eMhA7bpOVySPorp2Q7L--

--------------Dz4p9oBvOiXAuc0Wiow7Gzl0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL7TDcFAwAAAAAACgkQsN6d1ii/Ey+q
wAf+IwtSmJQK9fZEFcKLv28F1b9Fa+ukENbevw4zSiZrNC0GNo0Z2LIR+PHG6mHJd9O8gblDd/Nq
S3By3WyZYzayk/ZEr3CRcsaV4YqNVhvlmBCnLKK5TabUTJwZiQx9BjoQyI+PFX0pmyCk+qjvFF60
oHU+PJGV0fagPxEoLO2A1tZ0+7sYjIjmkCcKQ8kTdb3xVMmmJKCsoB5+DdyR/EFWbaky3HfiElWC
vWWLPJdjmRTwZo2oPhO7nI9ZmXhuVSiH681cTvgJcq/yeVPUjai18yUNAdCMUPvrvf+SRyCcP6p5
7xJIRseF7xxd0gzCbSDkSyrxnKSbtwWta8iM1iGSsg==
=7m/+
-----END PGP SIGNATURE-----

--------------Dz4p9oBvOiXAuc0Wiow7Gzl0--

