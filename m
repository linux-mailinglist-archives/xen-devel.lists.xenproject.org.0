Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A275A0E10
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 12:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393262.632110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRAIR-0002MV-TM; Thu, 25 Aug 2022 10:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393262.632110; Thu, 25 Aug 2022 10:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRAIR-0002Ki-QZ; Thu, 25 Aug 2022 10:41:11 +0000
Received: by outflank-mailman (input) for mailman id 393262;
 Thu, 25 Aug 2022 10:41:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K3TS=Y5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oRAIP-0002Kc-TQ
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 10:41:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c4ef620-2462-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 12:41:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF66A5C187;
 Thu, 25 Aug 2022 10:41:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFA3B13517;
 Thu, 25 Aug 2022 10:41:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Er11KcFRB2MwZgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Aug 2022 10:41:05 +0000
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
X-Inumbo-ID: 6c4ef620-2462-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661424065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CEVSRI9+O+pZRknFID66CerYtS8o2E1m6hHCv/aV+uw=;
	b=Y+GEzFmNSh7gKRKoo6Bg5k4J4Z7D+ge7Vp9Rg+iqgHZFvF5jflO68kpxGgYNVBRNWQaEpE
	iDhvcFh1ip11waIFFfH8hcuR7KfISqqbvSQBSu5yzr8jr32JhB34J3TVOTsV8MzXuolvKZ
	QZjdnnkZopA8CKUU7Sw130/iYKlvtIY=
Message-ID: <aff049cb-ebdd-68ad-5597-d22f87026297@suse.com>
Date: Thu, 25 Aug 2022 12:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/10] x86/mtrr: remove unused cyrix_set_all() function
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20220820092533.29420-1-jgross@suse.com>
 <20220820092533.29420-3-jgross@suse.com> <YwdPb4pWqppgzIpm@zn.tnic>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YwdPb4pWqppgzIpm@zn.tnic>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S95tpyEx0wJ1btdqyQ5gJi7k"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S95tpyEx0wJ1btdqyQ5gJi7k
Content-Type: multipart/mixed; boundary="------------iTrUJKTUNhlCbrkkwuXRQP7T";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <aff049cb-ebdd-68ad-5597-d22f87026297@suse.com>
Subject: Re: [PATCH v2 02/10] x86/mtrr: remove unused cyrix_set_all() function
References: <20220820092533.29420-1-jgross@suse.com>
 <20220820092533.29420-3-jgross@suse.com> <YwdPb4pWqppgzIpm@zn.tnic>
In-Reply-To: <YwdPb4pWqppgzIpm@zn.tnic>

--------------iTrUJKTUNhlCbrkkwuXRQP7T
Content-Type: multipart/mixed; boundary="------------UHXB2KjXMx2f2bX5WUQCvkHp"

--------------UHXB2KjXMx2f2bX5WUQCvkHp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDguMjIgMTI6MzEsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToNCj4gT24gU2F0LCBB
dWcgMjAsIDIwMjIgYXQgMTE6MjU6MjVBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToN
Cj4+IFRoZSBDeXJpeCBjcHUgc3BlY2lmaWMgTVRSUiBmdW5jdGlvbiBjeXJpeF9zZXRfYWxs
KCkgd2lsbCBuZXZlciBiZQ0KPj4gY2FsbGVkLCBhcyB0aGUgc3RydWN0IG10cnJfb3BzIHNl
dF9hbGwoKSBjYWxsYmFjayB3aWxsIG9ubHkgYmUgY2FsbGVkDQo+PiBpbiB0aGUgdXNlX2lu
dGVsKCkgY2FzZSwgd2hpY2ggd291bGQgcmVxdWlyZSB0aGUgdXNlX2ludGVsX2lmIG1lbWJl
cg0KPj4gb2Ygc3RydWN0IG10cnJfb3BzIHRvIGJlIHNldCwgd2hpY2ggaXNuJ3QgdGhlIGNh
c2UgZm9yIEN5cml4Lg0KPiANCj4gRG9pbmcgc29tZSBnaXQgYXJjaGVvbG9neToNCj4gDQo+
IFNvIHRoZSBjb21taXQgd2hpY2ggYWRkZWQgbXRycl9hcHNfZGVsYXllZF9pbml0IGlzDQo+
IA0KPiAgICBkMGFmOWVlZDVhYTkgKCJ4ODYsIHBhdC9tdHJyOiBSZW5kZXp2b3VzIGFsbCB0
aGUgY3B1cyBmb3IgTVRSUi9QQVQgaW5pdCIpDQo+IA0KPiBmcm9tIDIwMDkuDQo+IA0KPiBU
aGUgSVBJIGNhbGxiYWNrIGJlZm9yZSBpdCwgbG9va2VkIGxpa2UgdGhpczoNCj4gDQo+IHN0
YXRpYyB2b2lkIGlwaV9oYW5kbGVyKHZvaWQgKmluZm8pDQo+IHsNCj4gI2lmZGVmIENPTkZJ
R19TTVANCj4gCXN0cnVjdCBzZXRfbXRycl9kYXRhICpkYXRhID0gaW5mbzsNCj4gCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7DQo+IA0KPiAJbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOw0KPiANCj4g
CWF0b21pY19kZWMoJmRhdGEtPmNvdW50KTsNCj4gCXdoaWxlICghYXRvbWljX3JlYWQoJmRh
dGEtPmdhdGUpKQ0KPiAJCWNwdV9yZWxheCgpOw0KPiANCj4gCS8qICBUaGUgbWFzdGVyIGhh
cyBjbGVhcmVkIG1lIHRvIGV4ZWN1dGUgICovDQo+IAlpZiAoZGF0YS0+c21wX3JlZyAhPSB+
MFUpIHsNCj4gCQltdHJyX2lmLT5zZXQoZGF0YS0+c21wX3JlZywgZGF0YS0+c21wX2Jhc2Us
DQo+IAkJCSAgICAgZGF0YS0+c21wX3NpemUsIGRhdGEtPnNtcF90eXBlKTsNCj4gCX0gZWxz
ZSB7DQo+IAkJbXRycl9pZi0+c2V0X2FsbCgpOw0KPiAJCV5eXl5eXl5eXg0KPiANCj4gYW5k
IHRoYXQgZWxzZSBicmFuY2ggd291bGQgY2FsbCAtPnNldF9hbGwoKSBvbiBDeXJpeCB0b28u
DQo+IA0KPiBTdXJlc2gncyBwYXRjaCBjaGFuZ2VkIGl0IHRvIGRvOg0KPiANCj4gLQl9IGVs
c2Ugew0KPiArCX0gZWxzZSBpZiAobXRycl9hcHNfZGVsYXllZF9pbml0KSB7DQo+ICsJCS8q
DQo+ICsJCSAqIEluaXRpYWxpemUgdGhlIE1UUlJzIGluYWRkaXRpb24gdG8gdGhlIHN5bmNo
cm9uaXNhdGlvbi4NCj4gKwkJICovDQo+ICAgCQltdHJyX2lmLT5zZXRfYWxsKCk7DQo+IA0K
PiBCVVQgYmVsb3cgaW4gdGhlIHNldF9tdHJyKCkgY2FsbCwgaXQgZGlkOg0KPiANCj4gICAg
ICAgICAgLyoNCj4gICAgICAgICAgICogSEFDSyENCj4gICAgICAgICAgICogV2UgdXNlIHRo
aXMgc2FtZSBmdW5jdGlvbiB0byBpbml0aWFsaXplIHRoZSBtdHJycyBvbiBib290Lg0KPiAg
ICAgICAgICAgKiBUaGUgc3RhdGUgb2YgdGhlIGJvb3QgY3B1J3MgbXRycnMgaGFzIGJlZW4g
c2F2ZWQsIGFuZCB3ZSB3YW50DQo+ICAgICAgICAgICAqIHRvIHJlcGxpY2F0ZSBhY3Jvc3Mg
YWxsIHRoZSBBUHMuDQo+ICAgICAgICAgICAqIElmIHdlJ3JlIGRvaW5nIHRoYXQgQHJlZyBp
cyBzZXQgdG8gc29tZXRoaW5nIHNwZWNpYWwuLi4NCj4gICAgICAgICAgICovDQo+ICAgICAg
ICAgIGlmIChyZWcgIT0gfjBVKQ0KPiAgICAgICAgICAgICAgICAgIG10cnJfaWYtPnNldChy
ZWcsIGJhc2UsIHNpemUsIHR5cGUpOw0KPiAgICAgICAgICBlbHNlIGlmICghbXRycl9hcHNf
ZGVsYXllZF9pbml0KQ0KPiAgICAgICAgICAgICAgICAgIG10cnJfaWYtPnNldF9hbGwoKTsN
Cj4gCQleXl4NCj4gDQo+IGFuZCB0aGF0IHdvdWxkIGJlIHRoZSBDeXJpeCBjYXNlLg0KPiAN
Cj4gQnV0IHRoZW4NCj4gDQo+ICAgIDE5MmQ4ODU3NDI3ZCAoIng4NiwgbXRycjogdXNlIHN0
b3BfbWFjaGluZSBBUElzIGZvciBkb2luZyBNVFJSIHJlbmRlenZvdXMiKQ0KPiANCj4gY2Ft
ZSBhbmQgImNsZWFuZWQiIGFsbCB1cCBieSByZW1vdmluZyB0aGUgIkhBQ0siIGFuZCBkb2lu
ZyAtPnNldF9hbGwoKQ0KPiBvbmx5IGluIHRoZSByZW5kZXp2b3VzIGhhbmRsZXI6DQo+IA0K
PiArICAgICAgIH0gZWxzZSBpZiAobXRycl9hcHNfZGVsYXllZF9pbml0IHx8ICFjcHVfb25s
aW5lKHNtcF9wcm9jZXNzb3JfaWQoKSkpIHsNCj4gICAgICAgICAgICAgICAgICBtdHJyX2lm
LT5zZXRfYWxsKCk7DQo+ICAgICAgICAgIH0NCj4gDQo+IFdoaWNoIGJlZ3MgdGhlIHF1ZXN0
aW9uOiB3aHkgZG9lc24ndCB0aGUgc2Vjb25kIHBhcnQgb2YgdGhlIGVsc2UgdGVzdA0KPiBt
YXRjaCBvbiBDeXJpeD8gVGhlICJ8fCAhY3B1X29ubGluZShzbXBfcHJvY2Vzc29yX2lkKCkp
IiBjYXNlLg0KPiANCj4gSWYgb25seSB3ZSBoYWQgYSBDeXJpeCBtYWNoaW5lIHNvbWV3aGVy
ZS4uLg0KPiANCg0KTWF5YmUgdGhlIGFsdGVybmF0aXZlIHJlYXNvbmluZyBpcyBtdWNoIGZh
c3RlciB0byB1bmRlcnN0YW5kOiBpZiB0aGUNCkN5cml4IHNldF9hbGwoKSBjb3VsZCBiZSBj
YWxsZWQsIHRoZSBBTUQgYW5kIENlbnRhdXIgb25lcyB3b3VsZCBiZSBjYWxsYWJsZSwNCnRv
by4gVGhvc2UgYmVpbmcgY2FsbGVkIHdvdWxkIHJlc3VsdCBpbiBhIE5VTEwgZGVyZWYsIHNv
IHdoeSBzaG91bGQgd2Uga2VlcA0KdGhlIEN5cml4IG9uZT8NCg0KDQpKdWVyZ2VuDQo=
--------------UHXB2KjXMx2f2bX5WUQCvkHp
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

--------------UHXB2KjXMx2f2bX5WUQCvkHp--

--------------iTrUJKTUNhlCbrkkwuXRQP7T--

--------------S95tpyEx0wJ1btdqyQ5gJi7k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMHUcEFAwAAAAAACgkQsN6d1ii/Ey+C
6gf/REf0ALrA0RYVuEGmN5aE+ZzrlP4dr1c29VAaaYjufuLsFgxNKcWtTvREg4F2sdbkxRCU+NCS
jTB+67ojCeCAbGx399W3pd2vTTv9yED8/X77xj+vtGgYvLiVDg0TWdbyTb9S5IiMArVNwp7+uZwr
5WEVvcVi3kmXWSvahB7yPkiUdgn6ItojE+lLM8FMC7v5QVh+LAKOnnQIF+PAmO/WEyx64rPsdpEC
Lh2JC8KmuE/1ArdB+qj7f6c4EZBXroNJeqPxt6wD3MS9eQGtTyR3Z5zfeJUQfnXEIor4GJMNqyox
CJjSXaeMtBseUPeRaRtdgcivLWsxL8gaE/vYx4QBQQ==
=GFHs
-----END PGP SIGNATURE-----

--------------S95tpyEx0wJ1btdqyQ5gJi7k--

