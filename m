Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DC073FA6A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 12:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556047.868275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE6Cb-0002YC-9a; Tue, 27 Jun 2023 10:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556047.868275; Tue, 27 Jun 2023 10:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE6Cb-0002W3-6w; Tue, 27 Jun 2023 10:45:41 +0000
Received: by outflank-mailman (input) for mailman id 556047;
 Tue, 27 Jun 2023 10:45:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EZfr=CP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qE6CZ-0002Vw-N8
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 10:45:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c04f1f2b-14d7-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 12:45:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DEB89211C5;
 Tue, 27 Jun 2023 10:45:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C111F13276;
 Tue, 27 Jun 2023 10:45:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id atOPLdC9mmS9CwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 27 Jun 2023 10:45:36 +0000
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
X-Inumbo-ID: c04f1f2b-14d7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687862736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=021za+vfJxfdr2UPb7JBd3HhtPhFVlrLJhgcmd2b+8g=;
	b=uYwgrRo9JPxfmYASz6lkxK1zqmt4pmc9nUzyK0ThPfrfSRPXMnVRQ6xVMQvNorvEh3tZQp
	ze8jx4ocyxkUaN5C32PugKlsgRTwVYGnIFAVPtkTgyYrHDsB4fQZS/dufKbWKY7ZKYPuEf
	24sjha6zJ3CDAktD6Gexl7ygtKCy58s=
Message-ID: <e7e8b829-11df-9137-94a9-07c0db729aac@suse.com>
Date: Tue, 27 Jun 2023 12:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: xen summit 2023 design session: Using only stable interfaces for
 (o)xenstored
Content-Language: en-US
To: Edwin Torok <edwin.torok@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <C94DAB91-C664-43CC-A84B-E0AEB3381FE4@cloud.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <C94DAB91-C664-43CC-A84B-E0AEB3381FE4@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ik4Au7oDRCjz1DchtyjbF00S"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ik4Au7oDRCjz1DchtyjbF00S
Content-Type: multipart/mixed; boundary="------------gHLfNmJfF0TAN2EnRwojFgiH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Edwin Torok <edwin.torok@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <e7e8b829-11df-9137-94a9-07c0db729aac@suse.com>
Subject: Re: xen summit 2023 design session: Using only stable interfaces for
 (o)xenstored
References: <C94DAB91-C664-43CC-A84B-E0AEB3381FE4@cloud.com>
In-Reply-To: <C94DAB91-C664-43CC-A84B-E0AEB3381FE4@cloud.com>

--------------gHLfNmJfF0TAN2EnRwojFgiH
Content-Type: multipart/mixed; boundary="------------Q1CEqYcgmaB6SAOSRfAloC3y"

--------------Q1CEqYcgmaB6SAOSRfAloC3y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjMgMTI6MjEsIEVkd2luIFRvcm9rIHdyb3RlOg0KPiBCYWNrZ3JvdW5kOiBo
dHRwczovL2Rlc2lnbi1zZXNzaW9ucy54ZW5wcm9qZWN0Lm9yZy91aWQvZGlzY3Vzc2lvbi9k
aXNjX01FWHlVSVhWNmNsSThuMWtnelE5L3ZpZXcNCj4gDQo+IFBvc3NpYmxlIHNvbHV0aW9u
czoNCj4gQW5kcmV3IENvb3BlcjogdXNlIGdldCBkb21haW4gaW5mbyBsaXN0IGluc3RlYWQg
b2YgcXVlcnlpbmcgZG9tYWlucyBvbmUtYnktb25lIHRvIHJlZHVjZSBudW1iZXIgb2YgaHlw
ZXJjYWxscywgZXZlbiB0aG91Z2ggQWxlamFuZHJvJ3MgcGF0Y2ggbWFrZXMgdGhlIGdldF9k
b21haW5mbyBsb29rdXBzIE8oMSkuDQo+IFRvIGF2b2lkIGEgaHlwZXJjYWxsIGEgc2hhcmVk
IHJlYWQtb25seSBtZW1vcnkgcGFnZSBiZXR3ZWVuIFhlbiBhbmQgRG9tMCwgY29udGFpbmlu
ZyBhIGJpdG1hcCBvZiBkb21haW4gZXhpc3RlbmNlIGFuZCBzaHV0ZG93biBzdGF0ZS4NCj4g
V2UgaGF2ZSAzMmsgZG9tYWlucyBtYXggYW5kIHRoaXMgZml0cyBpbnRvIGEgc21hbGwgbnVt
YmVyIG9mIDRLIHBhZ2VzLg0KPiBIeXBlcnZpc29yIGNhbiB1cGRhdGUgaXQgdXNpbmcgYXRv
bWljIHNldC9jbGVhci1iaXQsIERvbTAgd2lsbCBtZW1jcHkgYW5kIHRoZW4gY2hlY2sgZm9y
IGRpZmZlcmVuY2VzDQo+IEJlcm5oYXJkdC9BbmRyZXc6IGRpc2N1c3Npb24gYWJvdXQgZWZm
aWNpZW5jeSBhbmQgZmluZCBmaXJzdCBiaXQgc2V0LCBYT1IuIEEgKmxvdCogbW9yZSBlZmZp
Y2llbnQgdGhhbiB1c2luZyBoeXBlcmNhbGxzIGFueXdheQ0KPiBFZHdpbjogZG8gSSBoYXZl
IHRvIGltcGxlbWVudCB0aGF0IGZvciB2YXJpb3VzIGFyY2hpdGVjdHVyZXM/DQo+IEFuZHJl
dyBDb29wZXI6IGFscmVhZHkgaW1wbGVtZW50ZWQgZm9yIGFsbCBhcmNoZXMuIFNvbWUgYXJj
aGl0ZWN0dXJlcyBjYW4gb25seSBkbyBhdG9taWMgdXBkYXRlcyBvbiBuYXR1cmFsIHJlZ2lz
dGVyIHdpZHRoIChSSVNDLVYpLCBidXQgdGhhdCBpcyBhbHJlYWR5IGhhbmRsZWQNCj4gRWR3
aW46IGhvdyB3b3VsZCB0aGUgc3RhYmxlIGludGVyZmFjZSBsb29rIGxpa2U/IE1lbW9yeSBs
YXlvdXQgZGVmaW5pdGlvbiBpbiB0aGUgaGVhZGVyIGFuZCAuLj8NCj4gQW5kcmV3IENvb3Bl
cjogdXNlIGFjcXVpcmVfcmVzb3VyY2Ugd2l0aCBhIG5ldyByZXNvdXJjZSB0eXBlLCBhbHJl
YWR5IGhhdmUgc3RhYmxlIHhlbiBsaWJzIGZvciByZXNvdXJjZSBtYXBwaW5nDQo+IA0KPiBD
aHJpc3RvcGhlciBDbGFya2UvRGFuaWVsIFNtaXRoICh2aXJ0dWFsbHkgZnJvbSBjaGF0cm9v
bSk6IGFsdGVybmF0aXZlcyB0byBiaXRtYXAsIGhvdyBpcyBpdCBpbmRleGVkPw0KPiBBbmRy
ZXcgQ29vb3BlcjogaW5kZXhlZCBieSBkb21pZCwgd2Ugb25seSBoYXZlIDMyaw0KPiBNYXJj
dXMgR3JhbmFkbzogd2hhdCBpZiB3ZSB3YW50IHRvIGluY3JlYXNlIHRoYXQ/DQo+IEFuZHJl
dyBDb29vcGVyOiAxNi1iaXQgZG9taWQgaXMgYmFrZWQgaW50byBzbyBtYW55IEFCSXMgdGhh
dCBpZiB3ZSB3YW50IHRvIGluY3JlYXNlIHRoYXQgdGhlbiB0aGlzIEFQSSB3b24ndCBiZSB0
aGUgYmxvY2tlci4gTm8gbmVlZCB0byB3b3JyeSBhYm91dCBtb3JlIHRoYW4gMzJrIGRvbWlk
cy4NCj4gQ2hyaXN0b3BoZXIgQ2xhcms6IGhvdyBhYm91dCB1c2luZyBhbiBBcmdvIHJpbmcN
Cj4gQW5kcmV3IENvb3BlcjogWGVuIG11c3QgTk9UIGJsb2NrIHdoZW4gZGVsaXZlcmluZyB0
aGUgbm90aWZpY2F0aW9uIGFuZCBub3RpZmljYXRpb24gZGVsaXZlcnkgY2Fubm90IGJlIGxv
c3N5LCBjYW5ub3QgYWZmb3JkIHRvIGRyb3AgZXZlbnRzOiB0b29sc3RhY2tzL3hlbnN0b3Jl
ZCBjcml0aWNhbGx5IHJlbHkgb24gdGhpcyBpbmZvcm1hdGlvbi4NCj4gQ2hyaXN0b3BoZXIg
Q2xhcms6IGJpcCBidWZmZXJzOiBodHRwczovL3d3dy5jb2RlcHJvamVjdC5jb20vQXJ0aWNs
ZXMvMzQ3OS9UaGUtQmlwLUJ1ZmZlci1UaGUtQ2lyY3VsYXItQnVmZmVyLXdpdGgtYS1Ud2lz
dCBhcyBwb3NzaWJsZSBzb2x1dGlvbiB0byBhdm9pZCBydW5uaW5nIG91dCBvZiBzcGFjZQ0K
PiBBbmRyZXcgQ29vcGVyOiBiaXRtYXAgYWxzbyBhdm9pZHMgaGF2aW5nIHRvIHRha2UgdGhl
IGRvbWN0bCBsb2NrIGFuZCByZWR1Y2UgYmFja2dyb3VuZCBpZGxlIENQVSB1c2FnZQ0KPiBF
ZHdpbjogb24gdGhhdCB0b3BpYzogd2Ugc2hvdWxkIGFsc28gZml4IHhjcC1ycmRkIHNvIGl0
IGRvZXNuJ3Qgc2hlbGwgb3V0IHRvIHhlbnBtIGV2ZXJ5IDVzIHRvIGNvbGxlY3Qgc3RhdGlz
dGljcy4uLg0KPiBBbmRyZXcgQ29vcGVyOiBzaG91bGQgYmUgcG9zc2libGUgdG8gdXNlIGxp
YnhlbmN0cmwgZGlyZWN0bHkgZm9yIHRoYXQNCj4gRWR3aW4gVG9yb2s6IHRoZXJlIGFyZSBv
dGhlciBpbnRlcmZhY3MgdGhhdCB3b3VsZCBuZWVkIHRvIGJlIHN0YWJpbGl6ZWQgKHNlZSB4
ZW5vcHNkKSwgYnV0IGxldHMgc3RhcnQgc21hbGwgYW5kIGZpeCBqdXN0IHRoaXMgb25lIGZv
ciBub3csIHdoaWNoIHdpbGwgcmVzdWx0IGluIGFuIGltbWVkaWF0ZSBpbXByb3ZlbWVudCBm
b3IgKG8peGVuc3RvcmVkIHNpbmNlIHRoaXMgd2FzIHRoZSBmaW5hbCBibG9ja2VyIHRvIGdl
dHRpbmcgb2ZmIHN0YWJsZSBpbnRlcmZhY2VzICh0aGVyZSBpcyBvbmUgb3RoZXIgdXNhZ2Us
IGJ1dCB0aGF0IGFscmVhZHkgaGFzIGEgcGF0Y2ggcG9zdGVkL3NvbHV0aW9uKQ0KPiANCj4g
RWR3aW4gVG9yb2s6IGhvdyBhYm91dCByZWxlYXNlIGNhZGVuY2U/IERvZXNuJ3QgbmVjZXNz
YXJpbHkgaGF2ZSB0byBnbyBpbnRvIGltbWVkaWF0ZWx5IG5leHQgWGVuIHJlbGVhc2UsIGJ1
dCBkb24ndCBrbm93IGluIHdoaWNoIHBoYXNlIHRoZSByZWxlYXNlIGlzIGluIHJpZ2h0IG5v
dw0KPiBBbmRyZXcgQ29vcGVyOiBwcm9iYWJseSBhYm91dCA2IHdlZWtzIHRpbWUgdG8gZ2V0
IGludG8gbmV4dCByZWxlYXNlDQoNClNlZSBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMS0wOS9tc2cwMTA5OC5odG1sDQoNCg0KSnVlcmdlbg0K
DQo=
--------------Q1CEqYcgmaB6SAOSRfAloC3y
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Q1CEqYcgmaB6SAOSRfAloC3y--

--------------gHLfNmJfF0TAN2EnRwojFgiH--

--------------ik4Au7oDRCjz1DchtyjbF00S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSavdAFAwAAAAAACgkQsN6d1ii/Ey9q
Pgf/Y5lhU1DAqjlK5ekyZLlSJhu+RaEPkWhOP7/LJmlkBO3Kvkk9OJWvqb+Zy6TrUZ1CEWPagS8/
GfIsogZikmLNDaRMwISjfOIvr60IMFfWM3/od0XuU/vcjTkzlXfcouGUXkIrxttoJzTC2NGPRNqE
8VXUGo0jRsulkJudtEQKN+i9nrLx399zdkKhieUdZGq9QDwsbGrCzJTfG7GW6xeUC0C0YirGMH/D
XrsLGGNr5qhq9tNkzZg74aDDEezWvuMK4YqDD/bRh//M+FD7/JUFAlkfgEPUeJRQEhwcf5X4+81d
X7vhSW18E8gJh+KJ997LLGmtUjVf8PD/hGlT5Y/dvg==
=cc0s
-----END PGP SIGNATURE-----

--------------ik4Au7oDRCjz1DchtyjbF00S--

