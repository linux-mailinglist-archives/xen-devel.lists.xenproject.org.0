Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84C974D575
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 14:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561206.877598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIq1F-0003lr-EX; Mon, 10 Jul 2023 12:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561206.877598; Mon, 10 Jul 2023 12:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIq1F-0003iv-Bp; Mon, 10 Jul 2023 12:29:33 +0000
Received: by outflank-mailman (input) for mailman id 561206;
 Mon, 10 Jul 2023 12:29:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIq1E-0003ip-Em
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 12:29:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ac77390-1f1d-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 14:29:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B23191FF2F;
 Mon, 10 Jul 2023 12:29:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 37E1F13A05;
 Mon, 10 Jul 2023 12:29:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CvAmDKn5q2REAgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 12:29:29 +0000
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
X-Inumbo-ID: 6ac77390-1f1d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688992169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZLkluv/6AIU//IIXEFXPkZ4djC4dKJZJnHAbR0i6pk=;
	b=JG5+ERTkzAQOeVmd6vOM39GiJh3EAB+8yxS5Rf9WPiIEloosOhiTyzlrUyo+DNozK13Jy9
	+hS/sZmXsGOoRU7Rszus8GXPfIQFmYimrZbGO8VaaTB6gM8hbcZttx5Eql00VSSIuBQTZ4
	d+c+N+dhgdi33rQJVKrx8yuOdfL2xDw=
Message-ID: <acda7276-234b-9036-c178-ca2b441f3998@suse.com>
Date: Mon, 10 Jul 2023 14:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 0/3] x86/paravirt: Get rid of paravirt patching
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
 Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20230608140333.4083-1-jgross@suse.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230608140333.4083-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IvHaIO3XNlEm8DU31AArNzOS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IvHaIO3XNlEm8DU31AArNzOS
Content-Type: multipart/mixed; boundary="------------ZR3DgzkYsvFZdf0BczSBdOFl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
 Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Message-ID: <acda7276-234b-9036-c178-ca2b441f3998@suse.com>
Subject: Re: [RFC PATCH 0/3] x86/paravirt: Get rid of paravirt patching
References: <20230608140333.4083-1-jgross@suse.com>
In-Reply-To: <20230608140333.4083-1-jgross@suse.com>

--------------ZR3DgzkYsvFZdf0BczSBdOFl
Content-Type: multipart/mixed; boundary="------------XavUypI85MKZWCdNgx90L6n0"

--------------XavUypI85MKZWCdNgx90L6n0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW55IGNvbW1lbnRzPw0KDQpPbiAwOC4wNi4yMyAxNjowMywgSnVlcmdlbiBHcm9zcyB3cm90
ZToNCj4gVGhpcyBpcyBhIHNtYWxsIHNlcmllcyBnZXR0aW5nIHJpZCBvZiBwYXJhdmlydCBw
YXRjaGluZyBieSBzd2l0Y2hpbmcNCj4gY29tcGxldGVseSB0byBhbHRlcm5hdGl2ZSBwYXRj
aGluZyBmb3IgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eS4NCj4gDQo+IFRoZSBiYXNpYyBpZGVh
IGlzIHRvIGFkZCB0aGUgY2FwYWJpbGl0eSB0byBzd2l0Y2ggZnJvbSBpbmRpcmVjdCB0bw0K
PiBkaXJlY3QgY2FsbHMgdmlhIGEgc3BlY2lhbCBhbHRlcm5hdGl2ZSBwYXRjaGluZyBvcHRp
b24uDQo+IA0KPiBUaGlzIHJlbW92ZXMgX3NvbWVfIG9mIHRoZSBwYXJhdmlydCBtYWNybyBt
YXplLCBidXQgbW9zdCBvZiBpdCBuZWVkcw0KPiB0byBzdGF5IGR1ZSB0byB0aGUgbmVlZCBv
ZiBoaWRpbmcgdGhlIGNhbGwgaW5zdHJ1Y3Rpb25zIGZyb20gdGhlDQo+IGNvbXBpbGVyIGlu
IG9yZGVyIHRvIGF2b2lkIG5lZWRsZXNzIHJlZ2lzdGVyIHNhdmUvcmVzdG9yZS4NCj4gDQo+
IFdoYXQgaXMgZ29pbmcgYXdheSBpcyB0aGUgbmFzdHkgc3RhY2tpbmcgb2YgYWx0ZXJuYXRp
dmUgYW5kIHBhcmF2aXJ0DQo+IHBhdGNoaW5nIGFuZCAob2YgY291cnNlKSB0aGUgc3BlY2lh
bCAucGFyYWluc3RydWN0aW9ucyBsaW5rZXIgc2VjdGlvbi4NCj4gDQo+IEkgaGF2ZSB0ZXN0
ZWQgdGhlIHNlcmllcyBvbiBiYXJlIG1ldGFsIGFuZCBhcyBYZW4gUFYgZG9tYWluIHRvIHN0
aWxsDQo+IHdvcmsuDQo+IA0KPiBSRkMgYmVjYXVzZSBJJ20gcXVpdGUgc3VyZSB0aGVyZSB3
aWxsIGJlIHNvbWUgb2JqdG9vbCB3b3JrIG5lZWRlZA0KPiAoYXQgbGVhc3QgcmVtb3Zpbmcg
dGhlIHNwZWNpZmljIHBhcmF2aXJ0IGhhbmRsaW5nKS4NCj4gDQo+IEp1ZXJnZW4gR3Jvc3Mg
KDMpOg0KPiAgICB4ODYvcGFyYXZpcnQ6IG1vdmUgc29tZSBmdW5jdGlvbnMgYW5kIGRlZmlu
ZXMgdG8gYWx0ZXJuYXRpdmUNCj4gICAgeDg2L2FsdGVybmF0aXZlOiBhZGQgaW5kaXJlY3Qg
Y2FsbCBwYXRjaGluZw0KPiAgICB4ODYvcGFyYXZpcnQ6IHN3aXRjaCBtaXhlZCBwYXJhdmly
dC9hbHRlcm5hdGl2ZSBjYWxscyB0byBhbHRlcm5hdGl2ZV8yDQo+IA0KPiAgIGFyY2gveDg2
L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmggICAgICAgIHwgMjYgKysrKystDQo+ICAgYXJj
aC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaCAgICAgICAgICAgfCAzOSArKy0tLS0tLS0N
Cj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBlcy5oICAgICB8IDY4ICsr
Ky0tLS0tLS0tLS0tLS0NCj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9xc3BpbmxvY2tfcGFy
YXZpcnQuaCB8ICA0ICstDQo+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vdGV4dC1wYXRjaGlu
Zy5oICAgICAgfCAxMiAtLS0NCj4gICBhcmNoL3g4Ni9rZXJuZWwvYWx0ZXJuYXRpdmUuYyAg
ICAgICAgICAgICB8IDk5ICsrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAgYXJjaC94ODYv
a2VybmVsL2NhbGx0aHVua3MuYyAgICAgICAgICAgICAgfCAxNyArKy0tDQo+ICAgYXJjaC94
ODYva2VybmVsL2t2bS5jICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQ0KPiAgIGFyY2gv
eDg2L2tlcm5lbC9tb2R1bGUuYyAgICAgICAgICAgICAgICAgIHwgMjAgKystLS0NCj4gICBh
cmNoL3g4Ni9rZXJuZWwvcGFyYXZpcnQuYyAgICAgICAgICAgICAgICB8IDU0ICsrLS0tLS0t
LS0tLS0NCj4gICBhcmNoL3g4Ni9rZXJuZWwvdm1saW51eC5sZHMuUyAgICAgICAgICAgICB8
IDEzIC0tLQ0KPiAgIGFyY2gveDg2L3Rvb2xzL3JlbG9jcy5jICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0NCj4gICBhcmNoL3g4Ni94ZW4vaXJxLmMgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstDQo+ICAgMTMgZmlsZXMgY2hhbmdlZCwgMTExIGluc2VydGlvbnMoKyksIDI0
OSBkZWxldGlvbnMoLSkNCj4gDQoNCg==
--------------XavUypI85MKZWCdNgx90L6n0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------XavUypI85MKZWCdNgx90L6n0--

--------------ZR3DgzkYsvFZdf0BczSBdOFl--

--------------IvHaIO3XNlEm8DU31AArNzOS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSr+agFAwAAAAAACgkQsN6d1ii/Ey/t
GAf+PlDTj1lgofSxQ5KcWOBwEvtHpmSz2yX2+b71GPNP+EuwtH/phyc/lp4O2P/0nSbDx+4kStS8
iFWp0JVIje2K+ExMi5drxA3JZ26i6o2Xt/OpnPp+WULBrJaUOzIAoGU6Mo9rdHp6G0a5/kJesp7R
jI/sKpmZtm9Y5GWHb7oV7aRw1wwarUHgJw8mVnh7isDkQ8PpvKJssS7jrbBGURxhfviYtmV5wcqY
KaR5yFz97/9d042TFkPwtUMlgIFfWCIwZeKxB83CCRnmgBk+RP/TMQqqdky3VNE2zUbZCXQuippD
YCS91d0eFmCgRKI96MpgM3/thFOaIOr3uVPwE3rWcw==
=YrNk
-----END PGP SIGNATURE-----

--------------IvHaIO3XNlEm8DU31AArNzOS--

