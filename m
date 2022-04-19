Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29201506928
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 12:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308021.523500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nglSI-0006Tn-Dq; Tue, 19 Apr 2022 10:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308021.523500; Tue, 19 Apr 2022 10:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nglSI-0006Qw-AZ; Tue, 19 Apr 2022 10:51:34 +0000
Received: by outflank-mailman (input) for mailman id 308021;
 Tue, 19 Apr 2022 10:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Io9b=U5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nglSG-0006Qo-1d
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 10:51:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abcd5b86-bfce-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 12:51:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 948E021100;
 Tue, 19 Apr 2022 10:51:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4865F139BE;
 Tue, 19 Apr 2022 10:51:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DAgpEDKUXmKrOwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Apr 2022 10:51:30 +0000
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
X-Inumbo-ID: abcd5b86-bfce-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650365490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0KXDOlOAsbfRkUsP9+BhcYu9O+w7nHCoNL3lK1Qw0/k=;
	b=W6SbBAKjEt5kstoGANYjYJnz2xDOcBtYB+fkhGnz9Tm3XGeQPXBDic8c7/tIuWZYV6/Wzt
	3D7MnjnmGpT+zs3qA7VeRIzVBj4wqzYhyqdTIaHQbhIO0cJdpXb6t9bX6NEmv6tkbAQVQs
	xmk3DsFHR7ofYEO6+u5ROUsI1pwiX0I=
Message-ID: <b10ad983-de3e-029c-6fa4-6aa646671fc5@suse.com>
Date: Tue, 19 Apr 2022 12:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Cheyenne Wills <cheyenne.wills@gmail.com>
References: <20220419101850.3045-1-jgross@suse.com>
 <5c6f75d7-d5d1-856f-c8d0-da1bd823be63@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
In-Reply-To: <5c6f75d7-d5d1-856f-c8d0-da1bd823be63@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Y2Ln0wTLdp7PiMy7E00vVYCY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Y2Ln0wTLdp7PiMy7E00vVYCY
Content-Type: multipart/mixed; boundary="------------esl6dE34kW9zwp5zUqFjuXnO";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Cheyenne Wills <cheyenne.wills@gmail.com>
Message-ID: <b10ad983-de3e-029c-6fa4-6aa646671fc5@suse.com>
Subject: Re: [PATCH v2] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
References: <20220419101850.3045-1-jgross@suse.com>
 <5c6f75d7-d5d1-856f-c8d0-da1bd823be63@citrix.com>
In-Reply-To: <5c6f75d7-d5d1-856f-c8d0-da1bd823be63@citrix.com>

--------------esl6dE34kW9zwp5zUqFjuXnO
Content-Type: multipart/mixed; boundary="------------Xy9LY9zJk6M7F6A7jbaHMel0"

--------------Xy9LY9zJk6M7F6A7jbaHMel0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDQuMjIgMTI6NDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE5LzA0LzIw
MjIgMTE6MTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBBIGh5cGVydmlzb3IgYnVpbHQg
d2l0aG91dCBDT05GSUdfR0RCU1ggd2lsbCBjcmFzaCBpbiBjYXNlIHRoZQ0KPj4gWEVOX0RP
TUNUTF9nZGJzeF9ndWVzdG1lbWlvIGRvbWN0bCBpcyBiZWluZyBjYWxsZWQsIGFzIHRoZSBj
YWxsIHdpbGwNCj4+IGVuZCB1cCBpbiBpb21tdV9kb19kb21jdGwoKSB3aXRoIGQgPT0gTlVM
TDoNCj4+DQo+PiAoWEVOKSBDUFU6ICAgIDYNCj4+IChYRU4pIFJJUDogICAgZTAwODpbPGZm
ZmY4MmQwNDAyNjk5ODQ+XSBpb21tdV9kb19kb21jdGwrMHg0LzB4MzANCj4+IChYRU4pIFJG
TEFHUzogMDAwMDAwMDAwMDAxMDIwMiAgIENPTlRFWFQ6IGh5cGVydmlzb3IgKGQwdjApDQo+
PiAoWEVOKSByYXg6IDAwMDAwMDAwMDAwMDAzZTggICByYng6IGZmZmY4MzA4NTYyNzdlZjgg
ICByY3g6IGZmZmY4MzA4NTYyNzdmZmYNCj4+IC4uLg0KPj4gKFhFTikgWGVuIGNhbGwgdHJh
Y2U6DQo+PiAoWEVOKSAgICBbPGZmZmY4MmQwNDAyNjk5ODQ+XSBSIGlvbW11X2RvX2RvbWN0
bCsweDQvMHgzMA0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMzVjZDVmPl0gUyBhcmNoX2Rv
X2RvbWN0bCsweDdmLzB4MjMzMA0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjM5ZTQ2Pl0g
UyBkb19kb21jdGwrMHhlNTYvMHgxOTMwDQo+PiAoWEVOKSAgICBbPGZmZmY4MmQwNDAyMzhm
ZjA+XSBTIGRvX2RvbWN0bCswLzB4MTkzMA0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMmY4
YzU5Pl0gUyBwdl9oeXBlcmNhbGwrMHg5OS8weDExMA0KPj4gKFhFTikgICAgWzxmZmZmODJk
MDQwMmY1MTYxPl0gUyBhcmNoL3g4Ni9wdi9kb21haW4uYyNfdG9nZ2xlX2d1ZXN0X3B0KzB4
MTEvMHg5MA0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMzY2Mjg4Pl0gUyBsc3Rhcl9lbnRl
cisweDEyOC8weDEzMA0KPj4gKFhFTikNCj4+IChYRU4pIFBhZ2V0YWJsZSB3YWxrIGZyb20g
MDAwMDAwMDAwMDAwMDE0NDoNCj4+IChYRU4pICBMNFsweDAwMF0gPSAwMDAwMDAwMDAwMDAw
MDAwIGZmZmZmZmZmZmZmZmZmZmYNCj4+IChYRU4pDQo+PiAoWEVOKSAqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+PiAoWEVOKSBQYW5pYyBvbiBDUFUgNjoN
Cj4+IChYRU4pIEZBVEFMIFBBR0UgRkFVTFQNCj4+IChYRU4pIFtlcnJvcl9jb2RlPTAwMDBd
DQo+PiAoWEVOKSBGYXVsdGluZyBsaW5lYXIgYWRkcmVzczogMDAwMDAwMDAwMDAwMDE0NA0K
Pj4NCj4+IEZpeCB0aGlzIGlzc3VlIGJ5IG1vZGlmeWluZyB0aGUgaW50ZXJmYWNlIG9mIGdk
YnN4X2d1ZXN0X21lbV9pbygpIHRvDQo+PiB0YWtlIHRoZSBhbHJlYWR5IGtub3duIGRvbWFp
biBwb2ludGVyIGluc3RlYWQgb2YgdGhlIGRvbWlkLg0KPiANCj4gVGhlcmUgaXMgc29tZSBl
eHBsYW5hdGlvbiBtaXNzaW5nIGhlcmUuwqAgVGhlIGFkanVzdG1lbnRzIHlvdSBtYWtlIGFy
ZQ0KPiB3aXRoaW4gQ09ORklHX0dEQlNYLCB3aXRoIHRoZSBleGNlcHRpb24gb2YgdGhlIGZp
bmFsIGh1bmsuDQoNClllYWgsIGFuZCB0aGlzIGlzIHRoZSBvbmUgcmVhbGx5IGZpeGluZyB0
aGUgaXNzdWUsIHdoaWxlIHRoZQ0Kb3RoZXIgaHVua3MgYXJlIG5lZWRlZCB0byBjb3BlIHdp
dGggdGhlIHdheSB0aGUgcHJvYmxlbSBpcw0KZml4ZWQuDQoNCj4gVGhlIGFjdHVhbCBidWcg
aXMgdGhhdCBub24tSU9NTVUgc3Vib3BzIGVuZCB1cCBpbiBpb21tdV9kb19kb21jdGwoKSwg
c28NCj4gd2hpbGUgdGhpcyBpcyBnb29kIGNsZWFudXAgdG8gZ2Ric3hfZ3Vlc3RfbWVtX2lv
KCkgaXQsIGFsb25nIHdpdGggSmFuJ3MNCj4gYWRqdXN0bWVudCB0byBpb21tdV9kb19kb21j
dGwoKSwgYXJlIG5vdCBzdWl0YWJsZSBmaXhlcyB0byB0aGUgY3Jhc2ggYXMNCj4gcmVwb3J0
ZWQuDQoNClRoZSBzYW1lIHdheSBub24tYXJjaCBzdWJvcHMgbWlnaHQgZW5kIHVwIGluIGFy
Y2hfZG9fZG9tY3RsKCkuDQoNCldoYXQgd291bGQgYmUgdGhlIHJpZ2h0IHdheSB0byBmaXgg
dGhhdCBpbiB5b3VyIG9waW5pb24/DQoNCklNTyBhbnkgc3Vib3AgaGFuZGxlciBjYWxsZWQg
dW5kZXIgdGhlIGRlZmF1bHQgbGFiZWwgb2YgYSBzd2l0Y2goKSBzaG91bGQNCmJlIGFibGUg
dG8gaGFuZGxlIHVua25vd24gc3Vib3BzLiBUaGlzIGlzIGRvbmUgZm9yIGlvbW11X2RvX2Rv
bWN0bCgpIGluDQpKYW4ncyBwYXRjaCBieSBub3QgZGVyZWZlcmVuY2luZyBkIHVuY29uZGl0
aW9uYWxseS4NCg0KTXkgcGF0Y2ggaXMgZml4aW5nIHRoZSBvcmlnaW5hbCBwYXRjaCByZWZl
cnJlZCB0byBpbiB0aGUgRml4ZXM6IHRhZy4NClYxIHdhcyBhbm90aGVyIHdheSB0byBmaXgg
dGhhdCwgYnV0IFYyIGlzIElNTyB0aGUgYmV0dGVyIHZhcmlhbnQsIGFzIGl0DQppcyBldmVu
IHNpbXBsaWZ5aW5nIHRoZSBjb2RlLg0KDQoNCkp1ZXJnZW4NCg==
--------------Xy9LY9zJk6M7F6A7jbaHMel0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Xy9LY9zJk6M7F6A7jbaHMel0--

--------------esl6dE34kW9zwp5zUqFjuXnO--

--------------Y2Ln0wTLdp7PiMy7E00vVYCY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJelDEFAwAAAAAACgkQsN6d1ii/Ey+O
Nwf+JNOG4Z3JdOq4z0jkXDSulV/m1RiT65/a0PhEz5+acscEds7Tp5Elx8OinFjFTbqav6+oIsRG
6ayhfdPOvd9RJcSjJg4F+aerAZtoVFhmzznDPbhJv/yEttedCUBmrWo2xib5a3THZX6257IQLmpP
/2yBeJp+vQ8VRbXJccYgOIRRyEc9ywg5kf5Am9mWJCXdThI0hcrz4moh3g/H8WMbdIUkHtUJzE49
M/E6U3L1nsPKXijM4Ar9pbbzIq+fg4dSWkF6q8XDgBVfqMD5lGINVEHwa0xDKB88qK0vU9kUbxKi
abgUvZnZZXb/zqH+6jDt9C4r80Bm3FLvcQxOcoQtHw==
=jHc9
-----END PGP SIGNATURE-----

--------------Y2Ln0wTLdp7PiMy7E00vVYCY--

