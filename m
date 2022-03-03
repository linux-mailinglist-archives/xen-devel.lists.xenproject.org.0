Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9534CB91B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 09:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282848.481671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPguF-0005U1-Bv; Thu, 03 Mar 2022 08:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282848.481671; Thu, 03 Mar 2022 08:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPguF-0005Qy-8h; Thu, 03 Mar 2022 08:33:51 +0000
Received: by outflank-mailman (input) for mailman id 282848;
 Thu, 03 Mar 2022 08:33:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhVD=TO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nPguE-0005Qo-58
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 08:33:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5857eb4-9acc-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 09:33:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1D0731F381;
 Thu,  3 Mar 2022 08:33:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3928139BD;
 Thu,  3 Mar 2022 08:33:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id icI0Nmt9IGIdTgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Mar 2022 08:33:47 +0000
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
X-Inumbo-ID: a5857eb4-9acc-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646296428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUKGJfs0EvBYUjC7tfioxcddtexeJOZCeh42/Z2L458=;
	b=F51A8HuHjKwQ2IGmUMDVEf2Mz6qz4fr63tC9Y19LAQB29qfpOLQr9viRqBn7jk/AktiTxf
	tbnL0GhH9StdmVAbWQobBPWGiyFfe9MllTxzm1iISVWmUxDuB80jlvMu2ac49Z0MOwuCLu
	sdkId35DqZIb79yQxc7SgpZh1MgtXM0=
Message-ID: <4270d03c-50a9-b1aa-dc2e-53e998153a6b@suse.com>
Date: Thu, 3 Mar 2022 09:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC] xen/sched: Optimise when only one scheduler is
 compiled in
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220303004015.17688-1-andrew.cooper3@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220303004015.17688-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GY0iOlkfCj5hpHZ3UPAhwCGH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GY0iOlkfCj5hpHZ3UPAhwCGH
Content-Type: multipart/mixed; boundary="------------8x6d9n40t4efqE43aOy37GAo";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <4270d03c-50a9-b1aa-dc2e-53e998153a6b@suse.com>
Subject: Re: [PATCH RFC] xen/sched: Optimise when only one scheduler is
 compiled in
References: <20220303004015.17688-1-andrew.cooper3@citrix.com>
In-Reply-To: <20220303004015.17688-1-andrew.cooper3@citrix.com>

--------------8x6d9n40t4efqE43aOy37GAo
Content-Type: multipart/mixed; boundary="------------20mGi2E6RGIm6zeZHk0XsRee"

--------------20mGi2E6RGIm6zeZHk0XsRee
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDMuMjIgMDE6NDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IFdoZW4gb25seSBv
bmUgc2NoZWR1bGVyIGlzIGNvbXBpbGVkIGluLCBmdW5jdGlvbiBwb2ludGVycyBjYW4gYmUg
b3B0aW1pc2VkIHRvDQo+IGRpcmVjdCBjYWxscywgYW5kIHRoZSBob29rcyBoYXJkZW5lZCBh
Z2FpbnN0IGNvbnRyb2xmbG93IGhpamFja2luZy4NCj4gDQo+IFJGQyBmb3Igc2V2ZXJhbCBy
ZWFzb25zLg0KPiANCj4gMSkgVGhlcmUncyBhbiBhbG1vc3QgYmVhdXRpZnVsIHdheSBvZiBu
b3QgaW50cm9kdWNpbmcgTUFZQkVfU0NIRUQoKSBhbmQgaGlkaW5nDQo+ICAgICB0aGUgbWFn
aWMgaW4gUkVHSVNURVJfU0NIRURVTEVSKCksIGV4Y2VwdCBpdCBmYWxscyBvdmVyDQo+ICAg
ICBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD05MTc2NSB3
aGljaCBoYXMgbm8gY29tbWVudCBvcg0KPiAgICAgcmVzb2x1dGlvbiBhdCBhbGwuDQo+IA0K
PiAyKSBBIGRpZmZlcmVudCBhbHRlcm5hdGl2ZSB3aGljaCBhbG1vc3Qgd29ya3MgaXMgdG8g
cmVtb3ZlIHRoZSBpbmRpcmVjdGlvbiBpbg0KPiAgICAgLmRhdGEuc2NoZWR1bGVycywgYnV0
IHRoZSBzaW5nbGV0b24gc2NoZWR1bGVyIG9iamVjdCBjYW4ndCBiZSBib3RoIHRoZXJlDQo+
ICAgICBhbmQgaW4gLmluaXQucm9kYXRhLmNmX2Nsb2JiZXIuDQo+IA0KPiAzKSBJIGNhbid0
IHRoaW5rIG9mIGEgd2F5IG9mIGJ1aWxkIHRpbWUgY2hlY2sgdG8gZW5mb3JjZSB0aGF0IG5l
dyBzY2hlZHVsZXJzDQo+ICAgICBnZXQgYWRkZWQgdG8gdGhlIHByZXByb2Nlc3NvciBtYWdp
Yy4NCj4gDQo+IEFuZCB0aGUgYmxvY2tlcjoNCj4gNCkgVGhpcyBpc24ndCBjb21wYXRpYmxl
IHdpdGggaG93IHNjaGVkX2lkbGVfb3BzIGdldCB1c2VkIGZvciBncmFudWxhcml0eSA+IDEu
DQo+IA0KPiBTdWdnZXN0aW9ucyB2ZXJ5IHdlbGNvbWUuDQoNCkRpZCB5b3UgY29uc2lkZXIg
dG8gZ2VuZXJhdGUgdGhlIG5lZWRlZCBjb2RlIGR5bmFtaWNhbGx5IGluc3RlYWQ/DQoNCkkg
Z3Vlc3MgdGhpcyBjb3VsZCBldmVuIGJlIGV4dGVuZGVkIHRvIGF2b2lkIGZ1bmN0aW9uIHBv
aW50ZXJzDQpjb21wbGV0ZWx5IHVzaW5nIHRoZSBzYW1lIHRlY2huaXF1ZSBhcyBpbiBteSBo
eXBlcmNhbGwgc2VyaWVzLg0KDQpJbiBvcmRlciB0byBhdm9pZCB0aGUgbmVlZCBmb3IgYSBj
ZW50cmFsIHRhYmxlIHRoZSBwZXItc2NoZWR1bGVyDQpob29rcyBjb3VsZCB1c2Ugc3RhbmRh
cmQgbmFtZXMgKGFzIG1vc3Qgb2YgdGhlbSBkbyBhbHJlYWR5KS4NCg0KSSB0aGluayBJIGNv
dWxkIGNvbWUgdXAgd2l0aCBhIHBhdGNoIGluIGEgZmV3IGhvdXJzIGlmIHlvdSBsaWtlDQp0
aGF0IGFwcHJvYWNoLg0KDQoNCkp1ZXJnZW4NCg==
--------------20mGi2E6RGIm6zeZHk0XsRee
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------20mGi2E6RGIm6zeZHk0XsRee--

--------------8x6d9n40t4efqE43aOy37GAo--

--------------GY0iOlkfCj5hpHZ3UPAhwCGH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIgfWsFAwAAAAAACgkQsN6d1ii/Ey+k
gQgAjefk8/MwHvw2O5bp8Z/e3itJitYJbeFR+74ABvJR11HdL+un4jardgetFYaX1c4k7u2zQRoR
l3jT3XEejVX6htEPy9NmmylETm6jyvttIND5AjpfzZZRDgs8Z4GHBhUZAIpd44s7VBeFIz/izhpi
9ZgsqBWzVDrCSlGyPmfBehXrwB+9tOfA7kZBW1cBu1FXKCi9nxeiFXPCT54b3SfMxL+GGlZS4twA
E9nL4e0Axp3OPLBK2OwWkBMI7NLsVrx7n6ctZ1v8PCgMRIf1LS3xsMHT/NLqEpERpKCV3kW2sccG
WhbGjew64SQKb5KELMT7cOH15HgCACaW3Gax3/tkdg==
=Dvnk
-----END PGP SIGNATURE-----

--------------GY0iOlkfCj5hpHZ3UPAhwCGH--

