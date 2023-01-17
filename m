Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB6E66DA51
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:50:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479281.743030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiby-0008IE-GK; Tue, 17 Jan 2023 09:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479281.743030; Tue, 17 Jan 2023 09:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiby-0008GX-DW; Tue, 17 Jan 2023 09:50:34 +0000
Received: by outflank-mailman (input) for mailman id 479281;
 Tue, 17 Jan 2023 09:50:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRIs=5O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHibx-0008Fj-LT
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:50:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6238fded-964c-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 10:50:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 84D9568445;
 Tue, 17 Jan 2023 09:50:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B6A013357;
 Tue, 17 Jan 2023 09:50:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EPInEWhvxmN4BwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 Jan 2023 09:50:32 +0000
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
X-Inumbo-ID: 6238fded-964c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673949032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zqrp1waze+l6MnoF1JRnlebPy+aayXNcunsZEaOJgeA=;
	b=L2YOTC6amVLyNdJ6lAEod11A46DbykGyQ6w6TO6c9IGf6QG89eUP3euBtHO4rL0eGx5fLJ
	uNR1VNyBObyYSGIAw/RnCIjVUlaqNDZV8t10zBXvaW5AvfoxI2KBQSd4T/ECJArHMQ4POt
	6IIBQq1wTKDLzKhMLAForwD1iv7qjsA=
Message-ID: <f37c0d1b-ecb7-ef8b-cfa2-4bfad35d4452@suse.com>
Date: Tue, 17 Jan 2023 10:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230117091124.22170-1-jgross@suse.com>
 <aceeec22-2183-2a60-7a68-58f43d8da493@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 00/17] tools/xenstore: do some cleanup and fixes
In-Reply-To: <aceeec22-2183-2a60-7a68-58f43d8da493@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Fomdzzbz6bKegKT1Z7H1MP4j"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Fomdzzbz6bKegKT1Z7H1MP4j
Content-Type: multipart/mixed; boundary="------------Zp29MsLUiejaAPf36SeEAiiy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <f37c0d1b-ecb7-ef8b-cfa2-4bfad35d4452@suse.com>
Subject: Re: [PATCH v3 00/17] tools/xenstore: do some cleanup and fixes
References: <20230117091124.22170-1-jgross@suse.com>
 <aceeec22-2183-2a60-7a68-58f43d8da493@suse.com>
In-Reply-To: <aceeec22-2183-2a60-7a68-58f43d8da493@suse.com>

--------------Zp29MsLUiejaAPf36SeEAiiy
Content-Type: multipart/mixed; boundary="------------ml1ZGpVaOztQd3fcIeOgP7j0"

--------------ml1ZGpVaOztQd3fcIeOgP7j0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDEuMjMgMTA6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wMS4yMDIz
IDEwOjExLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhpcyBpcyBhIGZpcnN0IHJ1biBv
ZiBwb3N0LVhTQSBwYXRjaGVzIHdoaWNoIHBpbGVkIHVwIGR1cmluZyB0aGUNCj4+IGRldmVs
b3BtZW50IHBoYXNlIG9mIGFsbCB0aGUgcmVjZW50IFhlbnN0b3JlIHJlbGF0ZWQgWFNBIHBh
dGNoZXMuDQo+Pg0KPj4gQXQgbGVhc3QgdGhlIGZpcnN0IDUgcGF0Y2hlcyBhcmUgY29tcGxl
dGVseSBpbmRlcGVuZGVudCBmcm9tIGVhY2gNCj4+IG90aGVyLiBBZnRlciB0aG9zZSB0aGUg
ZGVwZW5kZW5jaWVzIGFyZSBzdGFydGluZyB0byBiZSBtb3JlIGNvbXBsZXguDQo+IA0KPiBU
aGUgc2FtZSB3YXMgc2FpZCBpbiB2MiwgeWV0IHRocmVlKD8pIG9mIHRoZSBlYXJseSBwYXRj
aGVzIHdlcmUNCj4gY29tbWl0dGVkIGFscmVhZHkuIEhlbmNlIHdpdGggYSBsb29rIHRvd2Fy
ZHMgY29tbWl0dGluZyBJIHdvbmRlciBpbg0KPiBob3cgZmFyIHRoZSA1IGFib3ZlIGlzIGFj
Y3VyYXRlLg0KDQpJIHRoaW5rIGl0IGlzIHN0aWxsIHRydWUsIG1heWJlIGV2ZW4gcGF0Y2gg
NiBjb3VsZCBiZSBhcHBsaWVkLCBidXQgdGhhdA0Kb25lIHdvdWxkIHJlcXVpcmUgYXQgbGVh
c3Qgc29tZSBjb250ZXh0IGVkaXRpbmcgKGNoYW5nZXMgb2YgcGF0Y2ggNCBhcmUNCnZpc2li
bGUgaW4gdGhlIHBhdGNoIGZpbGUpLg0KDQoNCkp1ZXJnZW4NCg==
--------------ml1ZGpVaOztQd3fcIeOgP7j0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ml1ZGpVaOztQd3fcIeOgP7j0--

--------------Zp29MsLUiejaAPf36SeEAiiy--

--------------Fomdzzbz6bKegKT1Z7H1MP4j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPGb2cFAwAAAAAACgkQsN6d1ii/Ey/m
UAf7Bzx9L+jY5jLeEftdC9EmwFeGABNyTVam9RERX9YqLzdgYDM7ESy7dx5B4dvfenifpuTpE6UD
SAQ2DGcz00/D6wK57siN4NXfsj4n5+3BBfqm6z3b6mn8bWGTyrWC/bTgWNN82HfxPwWSaZDaGo7K
SmWyJykPess3Hv50qocGM8LAzfA1fxXQupuaR4j8ZJTiv1V7PcLEis8boRY49ssHsTY2xEkYHlEv
lDZ1nm+iZw0083aGVbpilGz701UTVWa0xck3H2RlQdIZ9S4ysO2CmXG7IZ3BJM/Jj41cGVRNxXZ2
WM/Hjfeok/xb367epbphSdF/1gFWs4JVYNAYJQr7ig==
=lmVR
-----END PGP SIGNATURE-----

--------------Fomdzzbz6bKegKT1Z7H1MP4j--

