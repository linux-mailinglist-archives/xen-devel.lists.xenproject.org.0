Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAFD6F44FF
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528641.822067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptq53-0000hj-Hp; Tue, 02 May 2023 13:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528641.822067; Tue, 02 May 2023 13:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptq53-0000fz-El; Tue, 02 May 2023 13:30:09 +0000
Received: by outflank-mailman (input) for mailman id 528641;
 Tue, 02 May 2023 13:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zdoi=AX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ptq52-0008BD-FV
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:30:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 747642f8-e8ed-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 15:30:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 61F521F8D7;
 Tue,  2 May 2023 13:30:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 205A5134FB;
 Tue,  2 May 2023 13:30:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JueEBl8QUWQHXQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 02 May 2023 13:30:07 +0000
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
X-Inumbo-ID: 747642f8-e8ed-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683034207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D8QP5oT7WEw35VAPIubP9M44ZYf0Ip836qmoZQvEDUY=;
	b=lqXRg8nSHcy9ZmF7LlAJqfMVeNbMFmHdiLtbk1hnVxn96+P/oS1ew/7SYgmHu5H4Jrzb+J
	w0sK/wgslyq2mZvlWhntQFZTUI6B1Gfbuf0xRpAD7ZWHR/pyV4Ab1MG8w2L90Zn6vrid9G
	5gomh/5y3f1pXNn7opEu6Eu4he3cjrY=
Message-ID: <b6550b56-fcb5-42a2-93c3-7fe486a215ba@suse.com>
Date: Tue, 2 May 2023 15:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] xen/sysctl: fix XEN_SYSCTL_getdomaininfolist handling
 with XSM
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230430144646.13624-1-jgross@suse.com>
 <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>
 <ca098773-5428-c97f-87ae-402fffd114bb@suse.com>
 <25876523-8d03-7e7d-e70f-b88d52f2b270@apertussolutions.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <25876523-8d03-7e7d-e70f-b88d52f2b270@apertussolutions.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wahdxtmcljEBJZ4CSpgT7zTZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wahdxtmcljEBJZ4CSpgT7zTZ
Content-Type: multipart/mixed; boundary="------------yeCflqXKhgW6Hjn7xizoBghT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <b6550b56-fcb5-42a2-93c3-7fe486a215ba@suse.com>
Subject: Re: [PATCH] xen/sysctl: fix XEN_SYSCTL_getdomaininfolist handling
 with XSM
References: <20230430144646.13624-1-jgross@suse.com>
 <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>
 <ca098773-5428-c97f-87ae-402fffd114bb@suse.com>
 <25876523-8d03-7e7d-e70f-b88d52f2b270@apertussolutions.com>
In-Reply-To: <25876523-8d03-7e7d-e70f-b88d52f2b270@apertussolutions.com>

--------------yeCflqXKhgW6Hjn7xizoBghT
Content-Type: multipart/mixed; boundary="------------87nHJ0dLWt40XxySAT8iMUHX"

--------------87nHJ0dLWt40XxySAT8iMUHX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDUuMjMgMTU6MjMsIERhbmllbCBQLiBTbWl0aCB3cm90ZToNCj4gT24gNS8yLzIz
IDA5OjEzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDIuMDUuMjMgMTU6MDMsIERh
bmllbCBQLiBTbWl0aCB3cm90ZToNCj4+PiBPbiA0LzMwLzIzIDEwOjQ2LCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOg0KPj4+PiBJbiBjYXNlIFhTTSBpcyBhY3RpdmUsIHRoZSBoYW5kbGluZyBv
ZiBYRU5fU1lTQ1RMX2dldGRvbWFpbmluZm9saXN0DQo+Pj4+IGNhbiBmYWlsIGlmIHRoZSBs
YXN0IGRvbWFpbiBzY2FubmVkIGlzbid0IGFsbG93ZWQgdG8gYmUgYWNjZXNzZWQgYnkNCj4+
Pj4gdGhlIGNhbGxpbmcgZG9tYWluIChpLmUuIHhzbV9nZXRkb21haW5pbmZvKFhTTV9IT09L
LCBkKSBpcyBmYWlsaW5nKS4NCj4+Pj4NCj4+Pj4gRml4IHRoYXQgYnkganVzdCBpZ25vcmlu
ZyBzY2FubmVkIGRvbWFpbnMgd2hlcmUgeHNtX2dldGRvbWFpbmluZm8oKQ0KPj4+PiBpcyBy
ZXR1cm5pbmcgYW4gZXJyb3IsIGxpa2UgaXQgaXMgZWZmZWN0aXZlbHkgZG9uZSB3aGVuIHN1
Y2ggYQ0KPj4+PiBzaXR1YXRpb24gb2NjdXJzIGZvciBhIGRvbWFpbiBub3QgYmVpbmcgdGhl
IGxhc3Qgb25lIHNjYW5uZWQuDQo+Pj4+DQo+Pj4+IEZpeGVzOiBkMDQ2ZjM2MWRjOTMgKCJY
ZW4gU2VjdXJpdHkgTW9kdWxlczogWFNNIikNCj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+PiAtLS0NCj4+Pj4gwqAgeGVuL2NvbW1v
bi9zeXNjdGwuYyB8IDMgKy0tDQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vc3lzY3RsLmMgYi94ZW4vY29tbW9uL3N5c2N0bC5jDQo+Pj4+IGluZGV4IDAyNTA1YWIw
NDQuLjBjYmZlOGJkNDQgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vc3lzY3RsLmMN
Cj4+Pj4gKysrIGIveGVuL2NvbW1vbi9zeXNjdGwuYw0KPj4+PiBAQCAtODksOCArODksNyBA
QCBsb25nIGRvX3N5c2N0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9zeXNjdGxfdCkg
dV9zeXNjdGwpDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggbnVtX2Rv
bWFpbnMgPT0gb3AtPnUuZ2V0ZG9tYWluaW5mb2xpc3QubWF4X2RvbWFpbnMgKQ0KPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXQgPSB4c21fZ2V0ZG9tYWluaW5mbyhYU01fSE9PSywgZCk7
DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggcmV0ICkNCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKCB4c21fZ2V0ZG9tYWluaW5mbyhYU01fSE9PSywgZCkg
KQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0K
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnZXRkb21haW5pbmZvKGQsICZpbmZv
KTsNCj4+Pg0KPj4+DQo+Pj4gVGhpcyBjaGFuZ2UgZG9lcyBub3QgbWF0Y2ggdGhlIGNvbW1p
dCBtZXNzYWdlLiBUaGlzIHNheXMgaXQgZml4ZXMgYW4gaXNzdWUsIA0KPj4+IGJ1dCB1bmxl
c3MgSSBhbSB0b3RhbGx5IG1pc3Npbmcgc29tZXRoaW5nLCB0aGlzIGNoYW5nZSBpcyBub3Ro
aW5nIG1vcmUgdGhhbiANCj4+PiBmb3JtYXR0aW5nIHRoYXQgZHJvcHMgdGhlIHVzZSBvZiBh
biBpbnRlcm1lZGlhdGUgdmFyaWFibGUuIFBsZWFzZSBmZWVsIGZyZWUgDQo+Pj4gdG8gY29y
cmVjdCBtZSBpZiBJIGFtIHdyb25nIGhlcmUsIG90aGVyd2lzZSBJIGJlbGlldmUgdGhlIGNv
bW1pdCBtZXNzYWdlIA0KPj4+IHNob3VsZCBiZSBjaGFuZ2VkIHRvIHJlZmxlY3QgdGhlIGNv
ZGUgY2hhbmdlLg0KPj4NCj4+IFlvdSBhcmUgbWlzc2luZyB0aGUgZmFjdCB0aGF0IHJldCBn
ZXR0aW5nIHNldCBieSBhIGZhaWxpbmcgeHNtX2dldGRvbWFpbmluZm8oKQ0KPj4gY2FsbCBt
aWdodCByZXN1bHQgaW4gdGhlIHJldCB2YWx1ZSBiZWluZyBwcm9wYWdhdGVkIHRvIHRoZSBz
eXNjdGwgY2FsbGVyLiBBbmQNCj4+IHRoaXMgc2hvdWxkIG5vdCBoYXBwZW4uIFNvIHRoZSBm
aXggaXMgdG8gTk9UIG1vZGlmeSByZXQgaGVyZS4NCj4gDQo+IFlvdSBhcmUgY29ycmVjdCwg
bXkgYXBvbG9naWVzIGZvciB0aGF0Lg0KDQpObyBuZWVkIHRvIGFwb2xvZ2l6ZS4gOi0pDQoN
Cj4+PiBTZWNvbmQsIGFzIGZhciBhcyB0aGUgcHJvYmxlbSBkZXNjcmlwdGlvbiBnb2VzLiBU
aGUgKm9ubHkqIHRpbWUgdGhlIGNhbGwgdG8gDQo+Pj4geHNtX2dldGRvbWFpbmluZm8oKSBh
dCB0aGlzIGxvY2F0aW9uIHdpbGwgcmV0dXJuIGFueXRoaW5nIG90aGVyIHRoYW4gMCwgaXMg
DQo+Pj4gd2hlbiBGTEFTSyBpcyBiZWluZyB1c2VkIGFuZCBhIGRvbWFpbiB3aG9zZSB0eXBl
IGlzIG5vdCBhbGxvd2VkIGdldGRvbWFpbmluZm8gDQo+Pj4gaXMgbWFraW5nIHRoZSBjYWxs
LiBYU01fSE9PSyBzaWduYWxzIGEgbm8tb3AgY2hlY2sgZm9yIHRoZSBkZWZhdWx0L2R1bW15
IA0KPj4+IHBvbGljeSwgYW5kIHRoZSBTSUxPIHBvbGljeSBkb2VzIG5vdCBvdmVycmlkZSB0
aGUgZGVmYXVsdC9kdW1teSBwb2xpY3kgZm9yIA0KPj4+IHRoaXMgY2hlY2suDQo+Pg0KPj4g
WW91ciBzdGF0ZW1lbnQgc291bmRzIGFzIGlmIHhzbV9nZXRkb21haW5pbmZvKCkgd291bGQg
YWx3YXlzIHJldHVybiB0aGUgc2FtZQ0KPj4gdmFsdWUgZm9yIGEgZ2l2ZW4gY2FsbGVyIGRv
bWFpbi4gSXNuJ3QgdGhhdCByZXR1cm4gdmFsdWUgYWxzbyBkZXBlbmRpbmcgb24gdGhlDQo+
PiBkb21haW4gc3BlY2lmaWVkIHZpYSB0aGUgc2Vjb25kIHBhcmFtZXRlcj8gSW4gY2FzZSBp
dCBpc24ndCwgd2h5IGRvZXMgdGhhdA0KPj4gcGFyYW1ldGVyIGV2ZW4gZXhpc3Q/DQo+IA0K
PiBJdCB3b3VsZCBpZiB0aGUgZGVmYXVsdCBhY3Rpb24gd2FzIHNvbWV0aGluZyBvdGhlciB0
aGFuIFhTTV9IT09LLiBMb29rIGF0IGxpbmUgDQo+IDgyIG9mIGluY2x1ZGUveHNtL2R1bW15
LmguIFhTTV9IT09LIHdpbGwgYWx3YXlzIHJldHVybiAwIHJlZ2FyZGxlc3Mgb2YgdGhlIHNy
YyANCj4gb3IgZGVzdCBkb21haW5zLiBUaGUgZnVuY3Rpb24geHNtX2RlZnVhbHRfYWN0aW9u
KCkgaXMgdGhlIHBvbGljeSBmb3IgYm90aCANCj4gZGVmYXVsdC9kdW1teSBhbmQgU0lMTyB3
aXRoIHRoZSBleGNlcHRpb24gZm9yIGV2bnRjaG4sIGdyYW50cywgYW5kIGFyZ28gY2hlY2tz
IA0KPiBmb3IgU0lMTy4NCg0KQWgsIG9rYXkuIEkgZGlkbid0IGFuYWx5emUgYWxsIG9mIHRo
ZSBpbnZvbHZlZCB4c20gY29kZS4NCg0KDQpKdWVyZ2VuDQo=
--------------87nHJ0dLWt40XxySAT8iMUHX
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

--------------87nHJ0dLWt40XxySAT8iMUHX--

--------------yeCflqXKhgW6Hjn7xizoBghT--

--------------wahdxtmcljEBJZ4CSpgT7zTZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRREF4FAwAAAAAACgkQsN6d1ii/Ey9R
zwgAj1wqv9R7OHSXYkxFA+Ct5IcW2++ciFYuVCoqcZK8qy67jSIVBWxUY9mRDQZ6pXHowls5Cm7r
bJvxVKkJSyTQys0Hiv+SoG8LQQoX5dkfLAqG8AbnCCHyGhH8rMN6ABpYBfLGTDi+gaxDqRRFglEo
bXjW4SJiUS8AKrcUEemjJ/MvuYRfjW0ifi5r9HrdwBDwhI5sVKX9Sz5VRBNxr2yFJmjcp/Uaij1L
/EVVvMn5M8G0M2KuFaV/Oz6tsG+iJeP/MrG+yCY2QmyPXE6mDyRdrrT23o2LOIV7Rum4wZMOKYF1
to/KQQOAVZtm/zoSZk7cPOrnH7Yoc9P4uyJeyAbdsg==
=8Xqb
-----END PGP SIGNATURE-----

--------------wahdxtmcljEBJZ4CSpgT7zTZ--

