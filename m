Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC25591F1D
	for <lists+xen-devel@lfdr.de>; Sun, 14 Aug 2022 10:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386628.622590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oN97Y-0001LW-5D; Sun, 14 Aug 2022 08:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386628.622590; Sun, 14 Aug 2022 08:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oN97Y-0001Iu-1g; Sun, 14 Aug 2022 08:37:20 +0000
Received: by outflank-mailman (input) for mailman id 386628;
 Sun, 14 Aug 2022 08:37:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AepH=YS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oN97X-0001CC-61
 for xen-devel@lists.xenproject.org; Sun, 14 Aug 2022 08:37:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d20974c-1bac-11ed-bd2e-47488cf2e6aa;
 Sun, 14 Aug 2022 10:37:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF3E234485;
 Sun, 14 Aug 2022 08:37:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7063613AAE;
 Sun, 14 Aug 2022 08:37:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e1MAGTu0+GLrNgAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 14 Aug 2022 08:37:15 +0000
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
X-Inumbo-ID: 4d20974c-1bac-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660466235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=COPY/iZmQz2XndCaf2cuzaayLMhChE0e5+Z2alyBwlI=;
	b=RN2RCzUwfOtsRaQG+wxrHD8BtAANyau94kw6iUni5ahKQBRKl1QsPyMv/2stp9z4wtbM5U
	jKguhofp19/bBw8YNcwn4/4i0FL0N9ZfN5aToYwHnUgiKC+VwCYyNx4/kt1dZCfDE5qT1l
	n1kluX3rprfAeiF9F/1ca5Dl7F/3OVM=
Message-ID: <fd2b0509-9110-2061-590a-a58e65f5fe01@suse.com>
Date: Sun, 14 Aug 2022 10:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] x86/xen: Add support for
 HVMOP_set_evtchn_upcall_vector
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Maximilian Heyne <mheyne@amazon.de>,
 xen-devel@lists.xenproject.org
References: <20220729070416.23306-1-jane.malalane@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220729070416.23306-1-jane.malalane@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------y4RL8sLfKCJHY6zxWWcHyQUo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------y4RL8sLfKCJHY6zxWWcHyQUo
Content-Type: multipart/mixed; boundary="------------u4CaT1Zv2JuCuvqaICDVoS01";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jane Malalane <jane.malalane@citrix.com>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Maximilian Heyne <mheyne@amazon.de>,
 xen-devel@lists.xenproject.org
Message-ID: <fd2b0509-9110-2061-590a-a58e65f5fe01@suse.com>
Subject: Re: [PATCH v4] x86/xen: Add support for
 HVMOP_set_evtchn_upcall_vector
References: <20220729070416.23306-1-jane.malalane@citrix.com>
In-Reply-To: <20220729070416.23306-1-jane.malalane@citrix.com>

--------------u4CaT1Zv2JuCuvqaICDVoS01
Content-Type: multipart/mixed; boundary="------------yVZ6gWfJx0WUYm6qypOPzSai"

--------------yVZ6gWfJx0WUYm6qypOPzSai
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDcuMjIgMDk6MDQsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+IEltcGxlbWVudCBz
dXBwb3J0IGZvciB0aGUgSFZNT1Bfc2V0X2V2dGNobl91cGNhbGxfdmVjdG9yIGh5cGVyY2Fs
bCBpbg0KPiBvcmRlciB0byBzZXQgdGhlIHBlci12Q1BVIGV2ZW50IGNoYW5uZWwgdmVjdG9y
IGNhbGxiYWNrIG9uIExpbnV4IGFuZA0KPiB1c2UgaXQgaW4gcHJlZmVyZW5jZSBvZiBIVk1f
UEFSQU1fQ0FMTEJBQ0tfSVJRLg0KPiANCj4gSWYgdGhlIHBlci1WQ1BVIHZlY3RvciBzZXR1
cCBpcyBzdWNjZXNzZnVsIG9uIEJTUCwgdXNlIHRoaXMgbWV0aG9kDQo+IGZvciB0aGUgQVBz
LiBJZiBub3QsIGZhbGxiYWNrIHRvIHRoZSBnbG9iYWwgdmVjdG9yLXR5cGUgY2FsbGJhY2su
DQo+IA0KPiBBbHNvIHJlZ2lzdGVyIGNhbGxiYWNrX2lycSBhdCBwZXItdkNQVSBldmVudCBj
aGFubmVsIHNldHVwIHRvIHRyaWNrDQo+IHRvb2xzdGFjayB0byB0aGluayB0aGUgZG9tYWlu
IGlzIGVubGlnaHRlbmVkLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiAiUm9nZXIgUGF1IE1vbm7D
qSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW5lIE1hbGFs
YW5lIDxqYW5lLm1hbGFsYW5lQGNpdHJpeC5jb20+DQo+IFJldmlld2VkLWJ5OiBCb3JpcyBP
c3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPg0KDQpQdXNoZWQgdG8geGVu
L3RpcC5naXQgZm9yLWxpbnVzLTYuMA0KDQoNCkp1ZXJnZW4NCg==
--------------yVZ6gWfJx0WUYm6qypOPzSai
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------yVZ6gWfJx0WUYm6qypOPzSai--

--------------u4CaT1Zv2JuCuvqaICDVoS01--

--------------y4RL8sLfKCJHY6zxWWcHyQUo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL4tDsFAwAAAAAACgkQsN6d1ii/Ey8c
7wgAmD3HflxaLI+RyQYyPhRbE9ir9iI4btAOPDg5nQ/lO3EdA37XW3O4RQpfIS+kSmqJT17bvGXV
dJgOaSwpGzvTL8E1jgyhw4XwLF5hu/4fLdOoK59fhASHr0Fni/2D7eEH9FjVaVyo+fVID5vGekvD
X4tXhyKHRFap5ReuOdRvktI80vxlv0fahS+6rRxkSkGSKvuL0IwvZ9Vz6UZZx5J+tyBrLTt0smB3
KAOffYvViedF/ocwO7AHZcsHyjEsz7L8ZmiUitRf8jsdwI8TQXRP3G35MRssdTfvGdeLYr2O4ppK
RKe6lU7S7cAeEP8u4O6xaNIvyO7vPQbQKK4pGi35Uw==
=1ayz
-----END PGP SIGNATURE-----

--------------y4RL8sLfKCJHY6zxWWcHyQUo--

