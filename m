Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22CD526542
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 16:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328579.551634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWek-0005iX-6L; Fri, 13 May 2022 14:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328579.551634; Fri, 13 May 2022 14:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWek-0005fm-23; Fri, 13 May 2022 14:52:38 +0000
Received: by outflank-mailman (input) for mailman id 328579;
 Fri, 13 May 2022 14:52:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fm8U=VV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1npWei-0005ff-HM
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 14:52:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52d7e891-d2cc-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 16:52:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6990D1F934;
 Fri, 13 May 2022 14:52:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25B9513446;
 Fri, 13 May 2022 14:52:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2IODB7JwfmI8FgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 May 2022 14:52:34 +0000
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
X-Inumbo-ID: 52d7e891-d2cc-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652453554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=koEOM3h7/R3NDqH0fHkFJ1NW9T6GdDGxJk/oyNP0TXk=;
	b=HBU87oYtKofNUuejg2toY7PWM97P+UP5EOBScLkOdiQ2rInqrX2PUruAIzWOm5BuygRQt3
	RfyatPiw1TeqANtfE5wUNwCvhO55+oJJO18qLUMGLUD/jrYpvrgs/QfCozYzqwWc5Vm+CL
	dVoPG9eVpWWZnXh671Sl3ZVt7XmSb6k=
Message-ID: <2f2f10c1-e0cb-7274-1879-6f88c2517c47@suse.com>
Date: Fri, 13 May 2022 16:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Process for cherry-picking patches from other projects
In-Reply-To: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DTYvJ1VvoSduojKAKcTwKUyf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DTYvJ1VvoSduojKAKcTwKUyf
Content-Type: multipart/mixed; boundary="------------hRDkSaG02XbLQ0AEQt8wIkbn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <2f2f10c1-e0cb-7274-1879-6f88c2517c47@suse.com>
Subject: Re: Process for cherry-picking patches from other projects
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
In-Reply-To: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>

--------------hRDkSaG02XbLQ0AEQt8wIkbn
Content-Type: multipart/mixed; boundary="------------JBVR0CAezDxEU1RICpqItuu2"

--------------JBVR0CAezDxEU1RICpqItuu2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDUuMjIgMTY6MzMsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IFN0YXJ0aW5nIGEg
bmV3IHRocmVhZCB0byBtYWtlIGl0IGNsZWFyIHRoYXQgd2XigJlyZSBkaXNjdXNzaW5nIGEg
d2lkZXIgcG9saWN5IGhlcmUuDQo+IA0KPiBUaGlzIHF1ZXN0aW9uIGlzIGFpbWVkIGF0IEph
biBhbmQgQW5keSBpbiBwYXJ0aWN1bGFyLCBhcyBJIHRoaW5rIHRoZXnigJl2ZSBwcm9iYWJs
eSBkb25lIHRoZSBtb3N0IG9mIHRoaXM7IHNvIEnigJltIGxvb2tpbmcgdG8gdGhlbSB0byBm
aW5kIG91dCB3aGF0IG91ciDigJxzdGFuZGFyZCBwcmFjdGljZeKAnSBpcy4NCj4gDQo+IFRo
ZXJlIGhhdmUgcmVjZW50bHkgYmVlbiBzb21lIHBhdGNoZXMgdGhhdCBCZXJ0cmFuZCBoYXMg
c3VibWl0dGVkIHdoaWNoIHB1bGwgaW4gY29kZSBmcm9tIExpbnV4ICgiW1BBVENIIDEvM10g
eGVuL2FybTogU3luYyBzeXNyZWdzIGFuZCBjcHVpbmZvIHdpdGggTGludXggNS4xOC1yYzPi
gJ0pLCB3aGljaCBoYXMgY2F1c2VkIGEgZGlzY3Vzc2lvbiBiZXR3ZWVuIGhpbSwgSnVsaWVu
LCBhbmQgU3RlZmFubyBhYm91dCB0aGUgcHJvcGVyIHdheSB0byBkbyBzdWNoIHBhdGNoZXMu
DQo+IA0KPiBUaGUg4oCcT3JpZ2luOuKAnSB0YWcgc2VjdGlvbiBvZiB4ZW4uZ2l0L2RvY3Mv
cHJvY2Vzcy9zZW5kaW5nLXBhdGNoZXMucGFuZG9jIHN1Z2dlc3RzIHRoYXQgdGhlcmUgYXJl
IHNvbWUgc3RhbmRhcmRzLCBidXQgZG9lc27igJl0IHNwZWxsIHRoZW0gb3V0Lg0KPiANCj4g
VGhlIHF1ZXN0aW9ucyBzZWVtIHRvIGJlOg0KPiANCj4gMSkgV2hlbiBkb2luZyB0aGlzIGtp
bmQgb2YgdXBkYXRlLCBpcyBpdCBwZXJtaXNzaWJsZSB0byBzZW5kIGEgc2luZ2xlIHBhdGNo
IHdoaWNoIOKAnGJhdGNoZXPigJ0gc2V2ZXJhbCB1cHN0cmVhbSBjb21taXRzIHRvZ2V0aGVy
LCBvciBzaG91bGQgZWFjaCBwYXRjaCBiZSBiYWNrcG9ydGVkIGluZGl2aWR1YWxseT8NCj4g
DQo+IDIpIElmIOKAnGJhdGNoZXPigJ0gYXJlIHBlcm1pc3NpYmxlLCB3aGVuPyAgV2hlbiB3
b3VsZCBpbmRpdmlkdWFsIHBhdGNoZXMgYmUgcHJlZmVycmVkPw0KPiANCj4gMykgRm9yIOKA
nGJhdGNoIHVwZGF0ZXPigJ0sIHdoYXQgdGFncyBhcmUgbmVjZXNzYXJ5PyAgRG8gd2UgbmVl
ZCB0byBub3RlIHRoZSBjaGFuZ2VzZXRzIG9mIGFsbCB0aGUgY29tbWl0cywgYW5kIGlmIHNv
LCBkbyB3ZSBuZWVkIG11bHRpcGxlIOKAnE9yaWdpbuKAnSB0YWdzPyAgRG8gd2UgbmVlZCB0
byBpbmNsdWRlIGFueXRoaW5nIGZyb20gdGhlIG9yaWdpbmFsIGNvbW1pdHMg4oCUIGNvbW1p
dCBtZXNzYWdlcz8gIFNpZ25lZC1vZmYtYnnigJlzPw0KPiANCj4gQW5kIGEgcmVsYXRlZCBx
dWVzdGlvbjoNCj4gDQo+IDQpIFdoZW4gaW1wb3J0aW5nIGFuIGVudGlyZSBmaWxlIGZyb20g
YW4gdXBzdHJlYW0gbGlrZSBMaW51eCwgd2hhdCB0YWdzIGRvIHdlIG5lZWQ/DQo+IA0KPiBN
eSByZWNvbGxlY3Rpb24gaXMgdGhhdCB3ZSBvZnRlbiB0byBhIOKAnGFjY3VtdWxhdGVkIHBh
dGNo4oCdIHRvIHVwZGF0ZSwgc2F5LCB0aGUgS2NvbmZpZyB0b29saW5nOyBzbyBpdCBzZWVt
cyBsaWtlIHRoZSBhbnN3ZXIgdG8gdGhpcyBpcyBzb21ldGltZXMg4oCceWVz4oCdLg0KPiAN
Cj4gSXQgc2VlbXMgdG8gbWUgdGhhdCBpbiBhIGNhc2Ugd2hlcmUgeW914oCZcmUgaW1wb3J0
aW5nIGEgaGFuZGZ1bCBvZiBwYXRjaGVzIOKAlCBzYXkgNS0xMCDigJQgdGhhdCBpbXBvcnRp
bmcgdGhlbSBvbmUtYnktb25lIG1pZ2h0IGJlIHByZWZlcnJlZDsgYnV0IGluIHRoaXMgY2Fz
ZSwgc2luY2UgdGhlIHN1Ym1pc3Npb24gd2FzIGFscmVhZHkgbWFkZSBhcyBhIGJhdGNoLCBJ
4oCZZCBhY2NlcHQgaGF2aW5nIGl0IGFzIGEgYmF0Y2guDQo+IA0KPiBJIHRoaW5rIGlmIEkg
d2VyZSB3cml0aW5nIHRoaXMgcGF0Y2gsIEnigJlkIG1ha2UgYSBzZXBhcmF0ZSDigJxPcmln
aW7igJ0gdGFnIGZvciBlYWNoIGNvbW1pdC4NCj4gDQo+IEkgd291bGRu4oCZdCBpbmNsdWRl
IHRoZSB1cHN0cmVhbSBjb21taXQgbWVzc2FnZXMgb3IgUy1vLWLigJlzOyBJIHdvdWxkIHdy
aXRlIG15IG93biBjb21taXQgbWVzc2FnZSBzdW1tYXJpemluZyB3aHkgSeKAmW0gaW1wb3J0
aW5nIHRoZSBjb21taXRzLCB0aGVuIGhhdmUgdGhlIOKAmG9yaWdpbuKAmSB0YWdzLCB0aGVu
IG15IG93biBTLW8tYiB0byBpbmRpY2F0ZSB0aGF0IEkgYW0gYXR0ZXN0aW5nIHRoYXQgaXQg
Y29tZXMgZnJvbSBhbiBvcGVuLXNvdXJjZSBwcm9qZWN0IChhbmQgZm9yIHdoYXRldmVyIGNv
cHlyaWdodCBjYW4gYmUgYXNzZXJ0ZWQgb24gdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCB0aGUg
cGF0Y2ggYXMgYSBjb2xsZWN0aW9uKS4NCj4gDQo+IEFuZCBmb3IgIzQsIEkgd291bGQgZG8g
c29tZXRoaW5nIHNpbWlsYXI6IEkgd291bGQgd3JpdGUgbXkgb3duIGNvbW1pdCBtZXNzYWdl
IGRlc2NyaWJpbmcgd2hhdCB0aGUgZmlsZSBpcyBmb3IgYW5kIHdoeSB3ZeKAmXJlIGltcG9y
dGluZyBpdDsgaGF2ZSB0aGUgT3JpZ2luIHRhZyBwb2ludCB0byB0aGUgY29tbWl0IGF0IHRo
ZSBwb2ludCBJIHRvb2sgdGhlIGZpbGU7IGFuZCBteSBvd24gUy1vLWIuDQoNCklNTyB3ZSBz
aG91bGQgYWRkIGFub3RoZXIgdGFnIGZvciB0aGF0IHB1cnBvc2UsIGUuZy46DQoNCkZpbGUt
b3JpZ2luOiA8cmVwb3NpdG9yeT4gPHRhZz4gPHBhdGg+IFsjIDxsb2NhbC1wYXRoPl0NCg0K
U3BlY2lmeWluZyB0aGUgcmVwb3NpdG9yeSB0aGUgZmlsZShzKSBhcmUgY29taW5nIGZyb20s
IHRoZSB0YWcgKGUuZy4gYQ0KdGFnZ2VkIHZlcnNpb24sIG9yIHRoZSB0b3AgZ2l0IGNvbW1p
dCksIGFuZCB0aGUgcGF0aCBvZiB0aGUgb3JpZ2luYWwNCmZpbGUocykgaW4gdGhhdCByZXBv
c2l0b3J5ICg8cGF0aD4gY291bGQgZWl0aGVyIGJlIGEgY29tbW9uIGRpcmVjdG9yeQ0Kb2Yg
bXVsdGlwbGUgZmlsZXMsIG9yIGEgc2luZ2xlIGZpbGU7IG11bHRpcGxlICJGaWxlLW9yaWdp
bjoiIHRhZ3Mgc2hvdWxkDQpiZSBwb3NzaWJsZSkuIEluIGNhc2UgdGhlIGZpbGUgaXMgYmVp
bmcgcmVuYW1lZCBsb2NhbGx5LCBpdHMgbmV3IG5hbWUNCmNhbiBiZSBhZGRlZCBhcyA8bG9j
YWwtcGF0aD4uDQoNClRoaXMgdmFyaWFudCBzaG91bGQgYmUgdXNlZCB0byBhZGQgX25ld18g
ZmlsZXMgdG8gWGVuLiBJbiBjYXNlIG9mDQp1cGRhdGluZyBhIGZpbGUgd2hpY2ggaGFzIHNl
ZW0gbG90cyBvZiBjb21taXRzIHNpbmNlIGl0cyBsYXN0IHVwZGF0ZSBvcg0KaW50cm9kdWN0
aW9uLCBpdCBtaWdodCBiZSBlYXNpZXIgdG8ganVzdCB1c2UgdGhlICJGaWxlLW9yaWdpbjoi
IHRhZywNCnByb2JhYmx5IHdpdGggYSBub3RlIGJlbG93IHRoZSAiLS0tIiBtYXJrZXIgdGhh
dCBsaXN0aW5nIG1vcmUgdGhhbiA8eD4NCnBhdGNoZXMgKHggPiAxMD8pIG9yIHNwbGl0dGlu
ZyBpbnRvIG1vcmUgdGhhbiA8eD4gcGF0Y2hlcyB3b3VsZCBiZQ0KanVzdCB1c2VsZXNzIHdv
cmsgKGNvbW1vbiBzZW5zZSBzaG91bGQgYXBwbHkgaGVyZSwgZXNwZWNpYWxseSByZWdhcmRp
bmcNCnRoZSByZWFkYWJpbGl0eSBvZiB0aGUgcGF0Y2ggYW5kIHRoZSByZWxhdGVkIHJldmll
dyBlZmZvcnQpLg0KDQoNCkp1ZXJnZW4NCg==
--------------JBVR0CAezDxEU1RICpqItuu2
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

--------------JBVR0CAezDxEU1RICpqItuu2--

--------------hRDkSaG02XbLQ0AEQt8wIkbn--

--------------DTYvJ1VvoSduojKAKcTwKUyf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJ+cLEFAwAAAAAACgkQsN6d1ii/Ey/O
0gf8CK/+vdH9ZYfytddVTsv+63q62uFziYj8z6V3xb+W/3ZZ9mvPtezxaOf/jYGLK0AM8gW8/z0n
/bls7+mRcBnAUox+u9avCxIVFU1NXAt7lOgKRwPEM+kwm//HVMuTNaCQWhnrn5iuaTj69owG5B8Y
WmQTxqEIv6cqXzKfmskRSBhFh+3/xGmeZWlC80dIOZLE3/ymA6OPFSYcFLqBvDiYv3K96ynbNuoS
e6xvdM1QhFax2yBID/LuMNpgfOEkkw+AqOFqwmMSw48Ca2Hm6x5RQ6Ar0Xd8NMNV4W6DkduOejkV
deP8N62GdtmAwC7ZzhCYRWY0CtUVe5yiL9QTMjXGXQ==
=ELhI
-----END PGP SIGNATURE-----

--------------DTYvJ1VvoSduojKAKcTwKUyf--

