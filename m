Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00D050F021
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 07:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313436.530957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njDYk-0007OD-L6; Tue, 26 Apr 2022 05:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313436.530957; Tue, 26 Apr 2022 05:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njDYk-0007MO-I2; Tue, 26 Apr 2022 05:16:22 +0000
Received: by outflank-mailman (input) for mailman id 313436;
 Tue, 26 Apr 2022 05:16:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YDip=VE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njDYi-0007MH-W0
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 05:16:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00b3a8ab-c520-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 07:16:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C9084210E8;
 Tue, 26 Apr 2022 05:16:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4315913223;
 Tue, 26 Apr 2022 05:16:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K1XhDiGAZ2LFRwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 26 Apr 2022 05:16:17 +0000
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
X-Inumbo-ID: 00b3a8ab-c520-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650950177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCoeM4JLJRZv91zVqOeQJ5/8H6MTwPNt5+hI8rEBIkQ=;
	b=FlUkqw3Ln42pNuaVZf+kmf/aR9cWXGsmQEKD97mh3r6JbfW0u3oMjgCmWKi38Kkt4d660F
	qs6klxlojz1emAoKpJ0SefGfQ+uGjWi9UDCeNTz33wBn2AZoDgaJbvmlyEDTcWg2DX9Kpu
	SQzfr8ELHJmexAo+VX1ZdJQmVRYjgZk=
Message-ID: <7d89848a-3a1c-415d-957a-564ffdd3712d@suse.com>
Date: Tue, 26 Apr 2022 07:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, Oleksandr <olekstysh@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
 <YmQsFb36UEH9BUnN@infradead.org>
 <6c5042fe-dafc-eb4f-c1fa-03b0faf252de@gmail.com>
 <abc5d23d-3d38-d198-4646-e886df2e83d4@suse.com>
 <YmZUpua3hkCPdbfx@infradead.org>
 <147f68f6-7d67-1884-bd14-5040639b3396@suse.com>
 <67c7460a-3001-35a6-8e5b-f367270b257a@gmail.com> <YmcR5bfaYh1z7VUq@zn.tnic>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
In-Reply-To: <YmcR5bfaYh1z7VUq@zn.tnic>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0OFpyagCUbHUsEPp0MKRIkcF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0OFpyagCUbHUsEPp0MKRIkcF
Content-Type: multipart/mixed; boundary="------------Lg4Hw02qSJPGaq60PuAa8cdb";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>, Oleksandr <olekstysh@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <7d89848a-3a1c-415d-957a-564ffdd3712d@suse.com>
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
 <YmQsFb36UEH9BUnN@infradead.org>
 <6c5042fe-dafc-eb4f-c1fa-03b0faf252de@gmail.com>
 <abc5d23d-3d38-d198-4646-e886df2e83d4@suse.com>
 <YmZUpua3hkCPdbfx@infradead.org>
 <147f68f6-7d67-1884-bd14-5040639b3396@suse.com>
 <67c7460a-3001-35a6-8e5b-f367270b257a@gmail.com> <YmcR5bfaYh1z7VUq@zn.tnic>
In-Reply-To: <YmcR5bfaYh1z7VUq@zn.tnic>

--------------Lg4Hw02qSJPGaq60PuAa8cdb
Content-Type: multipart/mixed; boundary="------------akIgyRCybXfK1tmLdSdEvfDU"

--------------akIgyRCybXfK1tmLdSdEvfDU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDQuMjIgMjM6MjUsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToNCj4gT24gTW9uLCBB
cHIgMjUsIDIwMjIgYXQgMTE6Mzg6MzZQTSArMDMwMCwgT2xla3NhbmRyIHdyb3RlOg0KPj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvY2NfcGxhdGZvcm0uaCBiL2luY2x1ZGUvbGlu
dXgvY2NfcGxhdGZvcm0uaA0KPj4gaW5kZXggZWZkODIwNS4uZDA2YmM3YSAxMDA2NDQNCj4+
IC0tLSBhL2luY2x1ZGUvbGludXgvY2NfcGxhdGZvcm0uaA0KPj4gKysrIGIvaW5jbHVkZS9s
aW51eC9jY19wbGF0Zm9ybS5oDQo+PiBAQCAtNzIsNiArNzIsMTkgQEAgZW51bSBjY19hdHRy
IHsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgICogRXhhbXBsZXMgaW5jbHVkZSBURFggZ3Vlc3Qg
JiBTRVYuDQo+PiAgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4gIMKgwqDCoMKgwqDCoMKgIEND
X0FUVFJfR1VFU1RfVU5ST0xMX1NUUklOR19JTywNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqAg
LyoqDQo+PiArwqDCoMKgwqDCoMKgwqAgKiBAQ0NfQVRUUl9HVUVTVF9NRU1fQUNDRVNTX1JF
U1RSSUNURUQ6IFJlc3RyaWN0ZWQgbWVtb3J5IGFjY2VzcyB0bw0KPj4gK8KgwqDCoMKgwqDC
oMKgICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEd1ZXN0IG1lbW9yeSBpcyBhY3RpdmUNCj4+
ICvCoMKgwqDCoMKgwqDCoCAqDQo+PiArwqDCoMKgwqDCoMKgwqAgKiBUaGUgcGxhdGZvcm0v
T1MgaXMgcnVubmluZyBhcyBhIGd1ZXN0L3ZpcnR1YWwgbWFjaGluZSBhbmQgdXNlcw0KPj4g
K8KgwqDCoMKgwqDCoMKgICogdGhlIHJlc3RyaWN0ZWQgYWNjZXNzIHRvIGl0cyBtZW1vcnku
IFRoaXMgYXR0cmlidXRlIGlzIHNldCBpZg0KPj4gZWl0aGVyDQo+PiArwqDCoMKgwqDCoMKg
wqAgKiBHdWVzdCBtZW1vcnkgZW5jcnlwdGlvbiBvciByZXN0cmljdGVkIG1lbW9yeSBhY2Nl
c3MgdXNpbmcgWGVuDQo+PiBncmFudA0KPj4gK8KgwqDCoMKgwqDCoMKgICogbWFwcGluZ3Mg
aXMgYWN0aXZlLg0KPj4gK8KgwqDCoMKgwqDCoMKgICoNCj4+ICvCoMKgwqDCoMKgwqDCoCAq
IEV4YW1wbGVzIGluY2x1ZGUgWGVuIGd1ZXN0IGFuZCBTRVYuDQo+IA0KPiBXYWl0LCB3aGFh
YXQ/DQo+IA0KPiBUaGUgY2NfcGxhdGZvcm0qIHN0dWZmIGlzIGZvciAqY29uZmlkZW50aWFs
IGNvbXB1dGluZyogZ3Vlc3RzIHRvIGNoZWNrDQo+IGRpZmZlcmVudCBwbGF0Zm9ybSBhc3Bl
Y3RzLg0KPiANCj4gIEZyb20gcXVpY2tseSBza2ltbWluZyBvdmVyIHRoaXMsIHRoaXMgbG9v
a3MgbGlrZSBhIG1pc3VzZSB0byBtZS4NCg0KQ2hyaXN0b3BoIHN1Z2dlc3RlZCAocmF0aGVy
IGZpcm1seSkgdGhpcyB3b3VsZCBiZSB0aGUgd2F5IHRvIGdvLg0KDQo+IA0KPiBXaHkgY2Fu
J3QgeW91IHF1ZXJ5IHRoaXMgZnJvbSB0aGUgaHlwZXJ2aXNvciBqdXN0IGxpa2UgeW91IGRv
IHlvdXIgb3RoZXINCj4gcXVlcnlpbmcgYWJvdXQgd2hhdCBpcyBzdXBwb3J0ZWQsIGV0Yz8g
SHlwZXJjYWxscywgQ1BVSUQsIHdoYXRldmVyLi4uDQoNClRoaXMgaXMgbmVlZGVkIG9uIGd1
ZXN0IHNpZGUgYXQgYSByYXRoZXIgaHlwZXJ2aXNvciBpbmRlcGVuZGVudCBwbGFjZS4NCg0K
U28gYSBjYXBhYmlsaXR5IG9mIHNvbWUgc29ydCBzZWVtcyBhcHByb3ByaWF0ZS4NCg0KQW5v
dGhlciBzdWdnZXN0aW9uIG9mIG1pbmUgd2FzIHRvIGhhdmUgYSBjYWxsYmFjayAob3IgZmxh
ZykgaW4NCnN0cnVjdCB4ODZfaHlwZXJfcnVudGltZSBmb3IgdGhhdCBwdXJwb3NlLg0KDQoN
Ckp1ZXJnZW4NCg==
--------------akIgyRCybXfK1tmLdSdEvfDU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------akIgyRCybXfK1tmLdSdEvfDU--

--------------Lg4Hw02qSJPGaq60PuAa8cdb--

--------------0OFpyagCUbHUsEPp0MKRIkcF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJngCAFAwAAAAAACgkQsN6d1ii/Ey8R
Fgf/cb5IBTZcx7aS+LRpOM25mHfb/IvUsF1FOM+Oqb5mC5sfdn9j8s5KfWbL7jR3pOYw932FG4B9
HibQvCEsGLrsOHmafIEeU1WPni37diDLE6B8/T3ZaXbp9xfFfx45jb9nQqn3xKZ0eTxSZwo/vJal
jgo54wIoFm3apt2GkDQTcwRxNZRtBASPqAmQ2pGpTkaewbT74E1HayVhOkjbZ1vvpVugEKI6I8Le
yTEt7zBzAdcU3wfCLCjA58ddXd4g2/Rs8iXky8Hdr2XSOQ1qIHCwhsEyLnjkfy7IVwZ5obUiV/4V
MOPVUmPZWdZjqpjJUw3SNiznFfzOXSRsxZMku4jQQQ==
=KXAT
-----END PGP SIGNATURE-----

--------------0OFpyagCUbHUsEPp0MKRIkcF--

