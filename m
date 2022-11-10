Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5D962469A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 17:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441986.696022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otA5j-0002qO-EP; Thu, 10 Nov 2022 16:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441986.696022; Thu, 10 Nov 2022 16:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otA5j-0002nD-An; Thu, 10 Nov 2022 16:07:47 +0000
Received: by outflank-mailman (input) for mailman id 441986;
 Thu, 10 Nov 2022 16:07:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4mp0=3K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1otA5i-0002n7-CX
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 16:07:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce24a1ae-6111-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 17:07:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 13E231FE12;
 Thu, 10 Nov 2022 16:07:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 996B01332F;
 Thu, 10 Nov 2022 16:07:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9TMgJNAhbWMSXgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 10 Nov 2022 16:07:44 +0000
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
X-Inumbo-ID: ce24a1ae-6111-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1668096465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EV/Fk1WylZ737nbacAp1wmPRQUJJLl/hYoCm6tBJc+g=;
	b=nuCNQXMwMuX6G2Ywwfd8gVZ2wx1nduLSo8n016Ry6i7Ai2xJgEo5F7kImLJPYrEARtt5aR
	zicwAYOimOh1id6LFb/dlBRh8GSw7k/usqkL95l8ooNl96keOYmDkB8bWvVeTHxz228Hf3
	LfdewH9uHlZDWLzRL7zi6eNVDMgxnhM=
Message-ID: <66c5c5a8-7a8b-aefc-6466-c7d20236550e@suse.com>
Date: Thu, 10 Nov 2022 17:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/2] x86: Check return values from early_memremap calls
Content-Language: en-US
To: Ross Philipson <ross.philipson@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
 dave.hansen@linux.intel.com, kanth.ghatraju@oracle.com,
 trenchboot-devel@googlegroups.com, jailhouse-dev@googlegroups.com,
 jan.kiszka@siemens.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-2-ross.philipson@oracle.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221110154521.613472-2-ross.philipson@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mBxoMJgcAlsBu0oRWxNGGnrZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mBxoMJgcAlsBu0oRWxNGGnrZ
Content-Type: multipart/mixed; boundary="------------dd6c6hUQlWDPpqABWqQLDgwl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ross Philipson <ross.philipson@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
 dave.hansen@linux.intel.com, kanth.ghatraju@oracle.com,
 trenchboot-devel@googlegroups.com, jailhouse-dev@googlegroups.com,
 jan.kiszka@siemens.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
Message-ID: <66c5c5a8-7a8b-aefc-6466-c7d20236550e@suse.com>
Subject: Re: [PATCH v2 1/2] x86: Check return values from early_memremap calls
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-2-ross.philipson@oracle.com>
In-Reply-To: <20221110154521.613472-2-ross.philipson@oracle.com>

--------------dd6c6hUQlWDPpqABWqQLDgwl
Content-Type: multipart/mixed; boundary="------------5DbFnzzLZhZ4rEqvlNR47BD1"

--------------5DbFnzzLZhZ4rEqvlNR47BD1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjIgMTY6NDUsIFJvc3MgUGhpbGlwc29uIHdyb3RlOg0KPiBUaGVyZSBhcmUg
YSBudW1iZXIgb2YgcGxhY2VzIHdoZXJlIGVhcmx5X21lbXJlbWFwIGlzIGNhbGxlZA0KPiBi
dXQgdGhlIHJldHVybiBwb2ludGVyIGlzIG5vdCBjaGVja2VkIGZvciBOVUxMLiBUaGUgY2Fs
bA0KPiBjYW4gcmVzdWx0IGluIGEgTlVMTCBiZWluZyByZXR1cm5lZCBzbyB0aGUgY2hlY2tz
IG11c3QNCj4gYmUgYWRkZWQuDQo+IA0KPiBOb3RlIHRoYXQgdGhlIG1haW50YWluZXJzIGZv
ciBib3RoIHRoZSBKYWlsaG91c2UgYW5kIFhlbiBjb2RlDQo+IGFwcHJvdmVkIG9mIHVzaW5n
IHBhbmljKCkgdG8gaGFuZGxlIGFsbG9jYXRpb24gZmFpbHVyZXMuDQo+IA0KPiBJbiBhZGRp
dGlvbiB0byBjaGVja2luZyB0aGUgcmV0dXJuIHZhbHVlcywgYSBiaXQgb2YgZXh0cmENCj4g
Y2xlYW51cCBvZiBwcl8qIHVzYWdlcyB3YXMgZG9uZSBzaW5jZSB0aGUgcHJfZm10IG1hY3Jv
IHdhcw0KPiBpbnRyb2R1Y2VkIGluIHRoZSBtb2R1bGVzIHRvdWNoZWQgYnkgdGhpcyBwYXRj
aC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgUGhpbGlwc29uIDxyb3NzLnBoaWxpcHNv
bkBvcmFjbGUuY29tPg0KPiAtLS0NCj4gICBhcmNoL3g4Ni9rZXJuZWwvZGV2aWNldHJlZS5j
IHwgMTMgKysrKysrKysrKysNCj4gICBhcmNoL3g4Ni9rZXJuZWwvZTgyMC5jICAgICAgIHwg
MTIgKysrKysrKysrLS0NCj4gICBhcmNoL3g4Ni9rZXJuZWwvamFpbGhvdXNlLmMgIHwgIDYg
KysrKysrDQo+ICAgYXJjaC94ODYva2VybmVsL21wcGFyc2UuYyAgICB8IDUxICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+ICAgYXJjaC94ODYva2Vy
bmVsL3NldHVwLmMgICAgICB8IDE5ICsrKysrKysrKysrKysrLS0tDQo+ICAgYXJjaC94ODYv
eGVuL2VubGlnaHRlbl9odm0uYyB8ICAyICsrDQo+ICAgYXJjaC94ODYveGVuL21tdV9wdi5j
ICAgICAgICB8ICA4ICsrKysrKysNCj4gICBhcmNoL3g4Ni94ZW4vc2V0dXAuYyAgICAgICAg
IHwgIDIgKysNCj4gICA4IGZpbGVzIGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKyksIDE4IGRl
bGV0aW9ucygtKQ0KDQpGb3IgdGhlIFhlbiBwYXJ0czoNCg0KUmV2aWV3ZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------5DbFnzzLZhZ4rEqvlNR47BD1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------5DbFnzzLZhZ4rEqvlNR47BD1--

--------------dd6c6hUQlWDPpqABWqQLDgwl--

--------------mBxoMJgcAlsBu0oRWxNGGnrZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNtIdAFAwAAAAAACgkQsN6d1ii/Ey/Z
uwf9GfCYNTgYAn6tunrIu6M+RENPMwwvmUVC0CjrSU/ln3KvegZRL+VgXLxTe01E1j8c3VGle1xW
tzawO3vkDoilvke4V7OwBvIWKzgUJxNboCy5d9B2TOPbjZTi1qediSlKKv8K5Rckxe9ff/GLhcMr
yJzHkVbt8O1QzPN/sWEA0cKUG9DPRY5mKks9ysu1pF7gbaiRTKs8dSMg0q1XU7Cpaw33aozsaYlu
DMfWdMzGQFfQooVaJzJl2nHQR6RSb5lKouJ8lps4g0dZzGoFLD3SUIKfiMhRwQFltl7ej8S6W8U+
j7qVorWMIVyGqkPQFDZhgGI89ST+XlCqNVonfOCz6w==
=AnkP
-----END PGP SIGNATURE-----

--------------mBxoMJgcAlsBu0oRWxNGGnrZ--

