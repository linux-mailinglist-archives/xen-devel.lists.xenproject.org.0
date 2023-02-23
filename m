Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24BE6A0C7F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 16:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500502.771912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDAR-0008Ak-Ac; Thu, 23 Feb 2023 15:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500502.771912; Thu, 23 Feb 2023 15:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDAR-00088Y-7q; Thu, 23 Feb 2023 15:05:55 +0000
Received: by outflank-mailman (input) for mailman id 500502;
 Thu, 23 Feb 2023 15:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uapr=6T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pVDAP-00088S-Ug
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 15:05:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90a360dd-b38b-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 16:05:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A31037BE8;
 Thu, 23 Feb 2023 15:05:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF016139B5;
 Thu, 23 Feb 2023 15:05:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iKGXNM+A92OBMQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Feb 2023 15:05:51 +0000
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
X-Inumbo-ID: 90a360dd-b38b-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677164752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hzt+KmbRmYD50QuIrUrIr0eNQM15RZBAeybpNzPctRI=;
	b=ddv/eYPk3LeMZHsARuXhO/iQMuLtyhQ+LtbAf2SMYuqZpiLOUuRJI1q06ftyojxAianH6m
	q0Urbeqp34qUPg12NPTJ/1/2jLjOg/IWwtMBGlgAv7dGiVdduTqpti5ITbJ8UuyvZpp8ex
	A4q4UVS68u4DHrt2lxUWEJCTZksWXVw=
Message-ID: <2b4b0590-8327-3567-f4cd-e610d52fbf1c@suse.com>
Date: Thu, 23 Feb 2023 16:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] x86/paravirt: merge activate_mm and dup_mmap callbacks
Content-Language: en-US
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20230207075902.7539-1-jgross@suse.com>
 <dc5fbb2e-6a23-15e5-a451-e069e90a0656@csail.mit.edu>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <dc5fbb2e-6a23-15e5-a451-e069e90a0656@csail.mit.edu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NFgl39nKHzDiUPhSDQlQTM8u"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NFgl39nKHzDiUPhSDQlQTM8u
Content-Type: multipart/mixed; boundary="------------eTVzWK2dtVujaZI7b6l05T8D";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Message-ID: <2b4b0590-8327-3567-f4cd-e610d52fbf1c@suse.com>
Subject: Re: [PATCH v2] x86/paravirt: merge activate_mm and dup_mmap callbacks
References: <20230207075902.7539-1-jgross@suse.com>
 <dc5fbb2e-6a23-15e5-a451-e069e90a0656@csail.mit.edu>
In-Reply-To: <dc5fbb2e-6a23-15e5-a451-e069e90a0656@csail.mit.edu>

--------------eTVzWK2dtVujaZI7b6l05T8D
Content-Type: multipart/mixed; boundary="------------B8Dze1D9ZqSOJ01Oq0nj7iwI"

--------------B8Dze1D9ZqSOJ01Oq0nj7iwI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDIuMjMgMjI6MDksIFNyaXZhdHNhIFMuIEJoYXQgd3JvdGU6DQo+IE9uIDIvNi8y
MyAxMTo1OSBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IFRoZSB0d28gcGFyYXZpcnQg
Y2FsbGJhY2tzIC5tbXUuYWN0aXZhdGVfbW0gYW5kIC5tbXUuZHVwX21tYXAgYXJlDQo+PiBz
aGFyaW5nIHRoZSBzYW1lIGltcGxlbWVudGF0aW9ucyBpbiBhbGwgY2FzZXM6IGZvciBYZW4g
UFYgZ3Vlc3RzIHRoZXkNCj4+IGFyZSBwaW5uaW5nIHRoZSBQR0Qgb2YgdGhlIG5ldyBtbV9z
dHJ1Y3QsIGFuZCBmb3IgYWxsIG90aGVyIGNhc2VzDQo+PiB0aGV5IGFyZSBhIE5PUC4NCj4+
DQo+PiBJbiB0aGUgZW5kIGJvdGggY2FsbGJhY2tzIGFyZSBtZWFudCB0byByZWdpc3RlciBh
biBhZGRyZXNzIHNwYWNlIHdpdGgNCj4+IHRoZSB1bmRlcmx5aW5nIGh5cGVydmlzb3IsIHNv
IHRoZXJlIG5lZWRzIHRvIGJlIG9ubHkgYSBzaW5nbGUgY2FsbGJhY2sNCj4+IGZvciB0aGF0
IHB1cnBvc2UuDQo+Pg0KPj4gU28gbWVyZ2UgdGhlbSB0byBhIGNvbW1vbiBjYWxsYmFjayAu
bW11LmVudGVyX21tYXAgKGluIGNvbnRyYXN0IHRvIHRoZQ0KPj4gY29ycmVzcG9uZGluZyBh
bHJlYWR5IGV4aXN0aW5nIC5tbXUuZXhpdF9tbWFwKS4NCj4+DQo+PiBBcyB0aGUgZmlyc3Qg
cGFyYW1ldGVyIG9mIHRoZSBvbGQgY2FsbGJhY2tzIGlzbid0IHVzZWQsIGRyb3AgaXQgZnJv
bQ0KPj4gdGhlIHJlcGxhY2VtZW50IG9uZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0
cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4NCj4gDQo+IA0KPiBSZXZpZXdl
ZC1ieTogU3JpdmF0c2EgUy4gQmhhdCAoVk13YXJlKSA8c3JpdmF0c2FAY3NhaWwubWl0LmVk
dT4NCg0KeDg2IG1haW50YWluZXJzLCBJIHRoaW5rIHRoaXMgcGF0Y2ggc2hvdWxkIGJlIGNh
cnJpZWQgdmlhIHRoZSB0aXAgdHJlZS4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------B8Dze1D9ZqSOJ01Oq0nj7iwI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------B8Dze1D9ZqSOJ01Oq0nj7iwI--

--------------eTVzWK2dtVujaZI7b6l05T8D--

--------------NFgl39nKHzDiUPhSDQlQTM8u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP3gM8FAwAAAAAACgkQsN6d1ii/Ey+p
0AgAkFgCxYSr2aXRtl6/wIFPWgtskT4u9JW8PqapvCgS5jkwoWZXr0mKWsj+Lz37AgyAFWYhohlC
J1oWirtKROlOD4S5TWeZ99IyZtnUBJBWA7uzh21mJwF/XztKtj8SnpGANSZ1hR7UOFTzQpHslR4+
A1ZUplDdl9i/TT4jrml3kQ6CmyQN1twiVhPpzhp+n+h0/ErQ0P1qzTVeOu5HGf7chZhUlHUz8GJ3
7R2jDSij7OmrLDKBVNGYtYHdT7hxPUBsVqYDo4P2WyosJDAxE5UZ5owBELvsr0+/VLxJXCyHaVGS
XsgRjHIFgSGWP3wTHILbk7xbihRH5eMxPJ8kHq1wPQ==
=nMg1
-----END PGP SIGNATURE-----

--------------NFgl39nKHzDiUPhSDQlQTM8u--

