Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F168D6F1260
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 09:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527177.819468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psIY2-0006fB-86; Fri, 28 Apr 2023 07:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527177.819468; Fri, 28 Apr 2023 07:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psIY2-0006ct-5A; Fri, 28 Apr 2023 07:29:42 +0000
Received: by outflank-mailman (input) for mailman id 527177;
 Fri, 28 Apr 2023 07:29:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ym/r=AT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1psIY1-0006cm-1d
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 07:29:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6edfb62a-e596-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 09:29:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E00521CF4;
 Fri, 28 Apr 2023 07:29:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01B4A1390E;
 Fri, 28 Apr 2023 07:29:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x2p0OuF1S2RIVgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Apr 2023 07:29:37 +0000
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
X-Inumbo-ID: 6edfb62a-e596-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682666978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YcQhtP+aozoW4wXflHn0Stmz4XFnsMTpU25EOuSUzqs=;
	b=nfbti+m+sf/Nbbd+JKbsxEhOnbXOPMcpCdmaq0hWqUV85ujMaaTFK3tOm017O2wCKsV34+
	E68kU8uEbHhM0x0oPlP/HeRbZM0BVOZsX+EZ0HGexWVruz2G9OGs4dHO9pzpLryMz1+Jlt
	QQY0r2BMoOBrplL2lXt8o6zAWsS09ks=
Message-ID: <02859744-da6e-0811-5d14-43b4225d6383@suse.com>
Date: Fri, 28 Apr 2023 09:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230405070349.25293-1-jgross@suse.com>
 <6807cae6-16e1-b041-5492-15eda6732275@suse.com>
 <d9c6df98-2b38-4a4b-8228-04ce072b3b56@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 00/13] tools/xenstore: rework internal accounting
In-Reply-To: <d9c6df98-2b38-4a4b-8228-04ce072b3b56@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WEkgQ0Db38CwmIwJ9xg2ZPBM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WEkgQ0Db38CwmIwJ9xg2ZPBM
Content-Type: multipart/mixed; boundary="------------lT0MadlvBg02Uhl6U9mjGjWN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <02859744-da6e-0811-5d14-43b4225d6383@suse.com>
Subject: Re: [PATCH v4 00/13] tools/xenstore: rework internal accounting
References: <20230405070349.25293-1-jgross@suse.com>
 <6807cae6-16e1-b041-5492-15eda6732275@suse.com>
 <d9c6df98-2b38-4a4b-8228-04ce072b3b56@xen.org>
In-Reply-To: <d9c6df98-2b38-4a4b-8228-04ce072b3b56@xen.org>

--------------lT0MadlvBg02Uhl6U9mjGjWN
Content-Type: multipart/mixed; boundary="------------jurzqmzzDcWtknf0eArusff6"

--------------jurzqmzzDcWtknf0eArusff6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDQuMjMgMTk6MzcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI2LzA0LzIwMjMgMDg6MTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwNS4wNC4yMyAwOTowMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+PiBUaGlzIHNlcmll
cyByZXdvcmtzIHRoZSBYZW5zdG9yZSBpbnRlcm5hbCBhY2NvdW50aW5nIHRvIHVzZSBhIHVu
aWZvcm0NCj4+PiBnZW5lcmljIGZyYW1ld29yay4gSXQgaXMgYWRkaW5nIHNvbWUgYWRkaXRp
b25hbCB1c2VmdWwgZGlhZ25vc3RpYw0KPj4+IGluZm9ybWF0aW9uLCBsaWtlIGFjY291bnRp
bmcgdHJhY2UgYW5kIG1heC4gcGVyLWRvbWFpbiBhbmQgZ2xvYmFsIHF1b3RhDQo+Pj4gdmFs
dWVzIHNlZW4uDQo+Pj4NCj4+PiBDaGFuZ2VzIGluIFYyOg0KPj4+IC0gYWRkZWQgcGF0Y2gg
MSAobGVmdG92ZXIgZnJvbSBwcmV2aW91cyBzZXJpZXMpDQo+Pj4gLSByZWJhc2UNCj4+Pg0K
Pj4+IENoYW5nZXMgaW4gVjM6DQo+Pj4gLSBhZGRyZXNzZWQgY29tbWVudHMNCj4+Pg0KPj4+
IENoYW5nZXMgaW4gVjQ6DQo+Pj4gLSBmaXhlZCBwYXRjaCAzDQo+Pg0KPj4gQW5vdGhlciB0
aG91Z2h0IGZvciB0aGlzIHNlcmllcyBhbmQgZm9sbG93dXAgb25lOg0KPj4NCj4+IERvIHdl
IHdhbnQgdG8ga2VlcCBjdXJyZW50IGNvZGluZyBzdHlsZSBpbiB0b29scy94ZW5zdG9yZSAo
YmFzaWNhbGx5DQo+PiBMaW51eCBrZXJuZWwgc3R5bGUpLCBvciBkbyB3ZSB3YW50IHRvIHN3
aXRjaCB0byBYZW4gc3R5bGUgaW5zdGVhZD8NCj4gDQo+IEkgYW0gYSBiaXQgc3BsaXQgb24g
dGhpcyBvbmUuIEkgZG9uJ3QgcGFydGljdWxhcmx5IGxpa2UgdGhlIExpbnV4IGNvZGluZyBz
dHlsZSwgDQo+IGJ1dCBpdCBoYXMgdGhlIGFkdmFudGFnZSB0byBiZSB3ZWxsLWRvY3VtZW50
ZWQgKGlmIHdlIGNvbXBhcmUgdG8gdGhlIFhlbiBvbmUpLg0KDQpJIGhhdmUgcmFpc2VkIHRo
ZSBpZGVhIHRvIHN3aXRjaCB0byB0aGUgTGludXggc3R5bGUgZm9yIHRoYXQgcmVhc29uLCBi
dXQgaXQgd2FzDQpyZWplY3RlZCByYXRoZXIgZmlybWx5Lg0KDQpTbyB3ZSB3b24ndCBnZXQg
cmlkIG9mIHRoZSBYZW4gc3R5bGUuDQoNCj4gTWF5IEkgYXNrIHdoYXQgd291bGQgYmUgdGhl
IHJlYXNvbiB0byBzd2l0Y2g/DQoNCkFjY29yZGluZyB0byBDT0RJTkdfU1RZTEUgaXQgaXMg
dGhlIHN0eWxlIHRvIGJlIHVzZWQuIFdlIGNvdWxkIGFkZCBhIGxvY2FsIHN0eWxlDQpoaW50
IGluIHRvb2xzL3hlbnN0b3JlZCwgYnV0IEknZCByYXRoZXIgbm90IGFkZCBhbm90aGVyIGxv
Y2FsIHN0eWxlLg0KDQpJbiB0aGUgZW5kIGl0IGlzIGFib3V0IGNvbnNpc3RlbmN5Lg0KDQo+
PiBJZiBhIHN3aXRjaCB0byBYZW4gc3R5bGUgaXMgcHJlZmVycmVkIChJIGRvIHByZWZlciB0
aGF0IHN3aXRjaCksIEknZA0KPj4gbGlrZSB0byBzdWdnZXN0IHRoYXQgSSBkbyBhIHJld29y
ayBvZiB0aGlzIHNlcmllcyBhbmQgdGhlIGZvbGxvd3VwIG9uZQ0KPj4gdG8gdXNlIHRoZSBY
ZW4gc3R5bGUgZm9yIG5ldyBvciBtb3ZlZCBmdW5jdGlvbnMuDQo+IA0KPiBJIHRoaW5rIHRo
aXMgaXMgYSBiYWQgaWRlYSBiZWNhdXNlIGl0IHdvdWxkIG1ha2UgZGlmZmljdWx0IGZvciBh
IA0KPiBkZXZlbG9wZXIvcmV2aWV3ZXIgdG8ga25vdyB3aGF0IGlzIHRoZSBjb2Rpbmcgc3R5
bGUgb2YgYSBnaXZlbiBmdW5jdGlvbi4NCj4gDQo+IEF0IGxlYXN0IGluIG15IHdvcmtmbG93
LCBpdCB3b3VsZCBhbHNvIG1lYW5zIHRoYXQgSSBuZWVkIHR3byBvcGVuIHRoZSBmaWxlIHR3
aWNlIA0KPiB3aXRoIGRpZmZlcmVudCBzZXR0aW5ncyAoZS5nLiBzb2Z0IHZzIGhhcmQgdGFi
KS4NCg0KT2theS4gVGhpcyBpcyBhIHJhdGhlciBnb29kIHJlYXNvbiBub3QgdG8gdXNlIGRp
ZmZlcmVudCBzdHlsZXMgaW4gb25lIHNvdXJjZS4NCg0KPj4gQSBtb3JlIHJhZGljYWwgYXBw
cm9hY2ggd291bGQgYmUgdG8gZG8gYSBsYXJnZSBzdHlsZSBzd2l0Y2ggc2VyaWVzDQo+PiBh
ZnRlciB0aGUgdHdvIHNlcmllcywgYnV0IEknbSBoZXNpdGFudCBhcyB0aGlzIHdvdWxkIGFm
ZmVjdCBiYWNrcG9ydHMNCj4+IHJhdGhlciBiYWRseS4NCj4gDQo+IEluIGdlbmVyYWwsIEkg
d291bGQgYWdyZWUgd2l0aCB0aGF0LiBCdXQsIGFmdGVyIHlvdXIgd29yaywgSSBhbSB1bmRl
ciB0aGUgDQo+IGltcHJlc3Npb24gdGhhdCBYZW5zdG9yZWQgd2lsbCBiZWNvbWUgcXVpdGUg
ZGlmZmVyZW50LiBTbyBJIGFtIG5vdCBjb252aW5jZSB3ZSANCj4gd2lsbCBiZSBhYmxlIHRv
IGJhY2twb3J0cyBhIGxvdCBvZiBwYXRjaCB3aXRob3V0IHNpZ25pZmljYW50IHJld29yay4N
Cj4gDQo+IFRoZXJlZm9yZSwgY29udmVydGluZyBhbGwgdGhlIGZpbGVzIGluIG9uZSBwYXNz
IG1heSBub3QgYmUgdG9vIGJhZCAoYXNzdW1pbmcgd2UgDQo+IGFncmVlIG9uIHN3aXRjaGlu
ZyB0byB0aGUgbmV3IGNvZGluZyBzdHlsZSkuDQoNCkZpbmUgd2l0aCBtZS4gSW4gYW55IGNh
c2UgdGhpcyBzaG91bGQgYmUgZG9uZSBpbiB0aGUgc2FtZSBYZW4gcmVsZWFzZSBhcyB0aGUN
Cm1ham9yIHJld29yay4gT3RoZXJ3aXNlIHRoZSBiYWNrcG9ydCBwcm9ibGVtIHdpbGwgYmUg
YSByZWFsIG9uZS4NCg0KDQpKdWVyZ2VuDQo=
--------------jurzqmzzDcWtknf0eArusff6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------jurzqmzzDcWtknf0eArusff6--

--------------lT0MadlvBg02Uhl6U9mjGjWN--

--------------WEkgQ0Db38CwmIwJ9xg2ZPBM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRLdeEFAwAAAAAACgkQsN6d1ii/Ey/C
9Qf9EOwf6SASfETGPCmL699MJPXVA98NIBtrjvCEena4PwhCsKGq+z258I0PYtFSlW9P9r+3POYe
6keVB7ZCX2JfaG18HJaA0heKgbxJlk6T2eal3DYxAkYNckes6QmE+qOrIUazpdwUMOp6L70FH4Pt
zfEOGquPHGXpXL7PC0FxeubgUAiY8jhhNHRt+rqchiAf7Ay2endx3y69NhElR3wGTCSRb50LKdYj
L4xFsHyZNAvha/GrHAN8gK13Kj8F00huldErqpbJqOA/I+W+m5iaE0kVAc/Cirth08W0RvLXZHag
2doDy26BRHZhNODCqLJOeGzS+Ieg4Qa9ARjbdy8rQg==
=Iizg
-----END PGP SIGNATURE-----

--------------WEkgQ0Db38CwmIwJ9xg2ZPBM--

