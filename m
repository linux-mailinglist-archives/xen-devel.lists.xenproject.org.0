Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FEE50C7B6
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 07:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311428.528651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni8jv-0002ub-1G; Sat, 23 Apr 2022 05:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311428.528651; Sat, 23 Apr 2022 05:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni8ju-0002rY-Sl; Sat, 23 Apr 2022 05:55:26 +0000
Received: by outflank-mailman (input) for mailman id 311428;
 Sat, 23 Apr 2022 05:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JeyS=VB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ni8jt-0002rS-W0
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 05:55:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7b0da6d-c2c9-11ec-8fc2-03012f2f19d4;
 Sat, 23 Apr 2022 07:55:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B979D1F388;
 Sat, 23 Apr 2022 05:55:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 698E613AD8;
 Sat, 23 Apr 2022 05:55:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cghtGMuUY2LTDgAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 23 Apr 2022 05:55:23 +0000
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
X-Inumbo-ID: f7b0da6d-c2c9-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650693323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7zn4Dd4I99qMEB3R07m+sR/CWx3UUvE0Rb/eZDjb15o=;
	b=bA0B6XE67+88fzl+7E820ikzw2i5a/j4YUkKPj0NercpkvOXEic1REgtPT28H3wxInkTd4
	68yVbevqm5dk/Ku8UdjUj94iSoQjBJSl3RLAQVzBdn9x7NLRTZSYaIBuQt6jnRBNJcAREK
	awxUvKW88j4vfwE75b5eso6C25Z5qDA=
Message-ID: <dcce470b-56ad-c82a-bfe0-3eae2f460e24@suse.com>
Date: Sat, 23 Apr 2022 07:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220420055736.27901-1-jgross@suse.com>
 <927d3bbd-64db-15dc-9bec-270711b9c1a8@suse.com>
 <a2489d58-883e-01e7-1b7d-0413b4006fbe@suse.com>
 <74f6105d-d3a3-6508-3c6f-3aac53285c5f@suse.com>
 <7f55e68c-17ed-c682-9ba7-4835d8e1a79b@citrix.com>
 <a83fc8db-f8c0-5a17-a668-1a00cb1fdc2a@suse.com>
 <a39c8975-b331-8d3b-a09d-688a91fa8fb1@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
In-Reply-To: <a39c8975-b331-8d3b-a09d-688a91fa8fb1@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5GTn4F5ytGxLroBDrRFN0nbM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5GTn4F5ytGxLroBDrRFN0nbM
Content-Type: multipart/mixed; boundary="------------4ExohZE7IxYE9OEipBWd98mr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <dcce470b-56ad-c82a-bfe0-3eae2f460e24@suse.com>
Subject: Re: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
References: <20220420055736.27901-1-jgross@suse.com>
 <927d3bbd-64db-15dc-9bec-270711b9c1a8@suse.com>
 <a2489d58-883e-01e7-1b7d-0413b4006fbe@suse.com>
 <74f6105d-d3a3-6508-3c6f-3aac53285c5f@suse.com>
 <7f55e68c-17ed-c682-9ba7-4835d8e1a79b@citrix.com>
 <a83fc8db-f8c0-5a17-a668-1a00cb1fdc2a@suse.com>
 <a39c8975-b331-8d3b-a09d-688a91fa8fb1@citrix.com>
In-Reply-To: <a39c8975-b331-8d3b-a09d-688a91fa8fb1@citrix.com>

--------------4ExohZE7IxYE9OEipBWd98mr
Content-Type: multipart/mixed; boundary="------------i8J04AFYXRuU0UN4lSTMfTuP"

--------------i8J04AFYXRuU0UN4lSTMfTuP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDQuMjIgMjE6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDIyLzA0LzIw
MjIgMDg6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjEuMDQuMjAyMiAxOTo0Nywg
QW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBPbiAyMC8wNC8yMDIyIDA3OjI3LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4gT24gMjAuMDQuMjAyMiAwODoyMiwgSnVlcmdlbiBHcm9zcyB3
cm90ZToNCj4+Pj4+IE9uIDIwLjA0LjIyIDA4OjExLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
Pj4+PiBPbiAyMC4wNC4yMDIyIDA3OjU3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+
PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaA0KPj4+Pj4+PiArKysgYi94ZW4vaW5j
bHVkZS94ZW4vaW9tbXUuaA0KPj4+Pj4+PiBAQCAtMzQxLDggKzM0MSwxNyBAQCBzdHJ1Y3Qg
ZG9tYWluX2lvbW11IHsNCj4+Pj4+Pj4gICAgLyogRG9lcyB0aGUgSU9NTVUgcGFnZXRhYmxl
IG5lZWQgdG8gYmUga2VwdCBzeW5jaHJvbml6ZWQgd2l0aCB0aGUgUDJNICovDQo+Pj4+Pj4+
ICAgICNpZmRlZiBDT05GSUdfSEFTX1BBU1NUSFJPVUdIDQo+Pj4+Pj4+ICAgICNkZWZpbmUg
bmVlZF9pb21tdV9wdF9zeW5jKGQpICAgICAoZG9tX2lvbW11KGQpLT5uZWVkX3N5bmMpDQo+
Pj4+Pj4+ICsNCj4+Pj4+Pj4gK2ludCBpb21tdV9kb19kb21jdGwoc3RydWN0IHhlbl9kb21j
dGwgKmRvbWN0bCwgc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKTsN
Cj4+Pj4+Pj4gICAgI2Vsc2UNCj4+Pj4+Pj4gICAgI2RlZmluZSBuZWVkX2lvbW11X3B0X3N5
bmMoZCkgICAgICh7ICh2b2lkKShkKTsgZmFsc2U7IH0pDQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4g
K3N0YXRpYyBpbmxpbmUgaW50IGlvbW11X2RvX2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAq
ZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLA0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1
X2RvbWN0bCkNCj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4gKyAgICByZXR1cm4gLUVOT1NZUzsNCj4+
Pj4+Pj4gK30NCj4+Pj4+PiBBcyBzYWlkIGluIHJlcGx5IHRvIEFuZHJldyBhcyB3ZWxsIGFz
IGluIGEgbnVtYmVyIG9yIGVhcmxpZXIgb2NjYXNpb25zLA0KPj4+Pj4+IEkgZmlybWx5IHRo
aW5rIHRoYXQgdGhpcyB3YW50cyB0byBiZSAtRU9QTk9UU1VQUCwgbm90IC1FTk9TWVMuIFZp
ZXdzDQo+Pj4+PiBJbiBsaWJ4bCB0aGVyZSBpcyBhbiBleHBsaWNpdCBjaGVjayBmb3IgRU5P
U1lTIGJlaW5nIHJldHVybmVkIGZvcg0KPj4+Pj4gYXNzaWduaW5nL2RlYXNzaWduaW5nIGEg
ZGV2aWNlLCBzYW1lIGluIHRoZSB4YyBweXRob24gYmluZGluZ3MuDQo+Pj4+IFVyZ2guDQo+
Pj4gSG9uZXN0bHksIEkgd2Fzbid0IHBhcnRpY3VsYXJseSBoYXBweSB3aXRoIHlvdXIgcHVz
aCB0byBzd2FwIEVOT1NZUyBvdXQNCj4+PiBmb3IgRU9QTk9UU1VQUC7CoCBUaGlzIHNob3dz
IHBsYWlubHkgd2h5IGl0J3MgYSBiYWQgbW92ZS4NCj4+Pg0KPj4+IEFuIGVuZCB1c2VyIGRv
ZXNuJ3QgZ2l2ZSB0d28gaG9vdHMgYWJvdXQgdGhlIGRpc3RpbmN0aW9uIGJldHdlZW4NCj4+
PiBoeXBlcmNhbGwgbm90IHN1cHBvcnRlZCBhbmQgc3Vib3BzIG5vdCBzdXBwb3J0ZWQ7IHRo
ZXkgY2FyZSBhYm91dA0KPj4+IHdoZXRoZXIgWGVuIGNhbiBwZXJmb3JtIHRoZSByZXF1ZXN0
ZWQgYWN0aW9uIG9yIG5vdC7CoCBFTk9TWVMgaXMgdGhlIG1vcmUNCj4+PiBjb21tb24gd2F5
IG9mIHNpZ25hbGxpbmcgdGhpcywgYW5kIGhhdmluZyBvbmx5IG9uZSBlcnJubyB2YWx1ZSB0
byBjaGVjaw0KPj4+IGlzIGJldHRlciBmb3IgZXZlcnlvbmUgaW52b2x2ZWQuDQo+PiBFbmQg
dXNlcnMgYXJlIG9mIGxpdHRsZSBpbnRlcmVzdCBoZXJlLiBDb2RlIGxvb2tpbmcgZm9yIEVO
T1NZUyBpcyB3aGF0DQo+PiBpcyBvZiBpbnRlcmVzdCwgd2hlbiB0aGUgbWVhbmluZyBvZiBF
Tk9TWVMgaXMgcXVpdGUgd2VsbCBkZWZpbmVkIGFzDQo+PiAic3lzdGVtIGNhbGwgbm90IGlt
cGxlbWVudGVkIg0KPiANCj4gUE9TSVggc3BlY2lmaWVzIGl0IGFzICJGdW5jdGlvbmFsaXR5
IG5vdCBzdXBwb3J0ZWQiIHdoaWNoIGlzIHdoeSBvdGhlcg0KPiBjb21wbGltZW50IHN5c3Rl
bXMgdXNlIGl0IGZvciBzbWFsbGVyIGdyYW51bGFyaXR5IHRoYW4gYSBzeXN0ZW0gY2FsbC4N
Cg0KVGhpbmtpbmcgYSBsaXR0bGUgYml0IG1vcmUgYWJvdXQgdGhpcyB0b3BpYywgSSdkIGxp
a2UgdG8gcmV0dXJuIEVOT1NZUy4NCg0KRU9QTk9UU1VQUCBzaG91bGQgYmUgcmV0dXJuZWQg
aW4gY2FzZSBhbiBvcGVyYXRpb24gaXMgbm90IHN1aXRhYmxlDQpmb3IgdGhlIGdpdmVuIHBh
cmFtZXRlciBjb21iaW5hdGlvbiAoZS5nLiBhbiBJT01NVSByZWxhdGVkIG9wZXJhdGlvbg0K
Zm9yIGEgZ3Vlc3Qgbm90IGJlaW5nIHN1YmplY3QgdG8gSU9NTVUgaGFuZGxpbmcpLiBUaGUg
c2FtZSBvcGVyYXRpb24NCmNhbiBiZSBzdWNjZXNzZnVsIG9uIHRoZSBnaXZlbiBzeXN0ZW0g
d2l0aCBvdGhlciBwYXJhbWV0ZXIgY29tYmluYXRpb25zLg0KDQpFTk9TWVMgc2hvdWxkIGJl
IHJldHVybmVkIGlmIHRoZSBjdXJyZW50IGh5cGVydmlzb3IgZG9lc24ndCBzdXBwb3J0IHRo
ZQ0KcmVxdWVzdGVkIG9wZXJhdGlvbiAoaHlwZXJjYWxsIG9yIGh5cGVyY2FsbCArIHN1Yi1v
cCkgb24gdGhlIGdpdmVuIHN5c3RlbQ0KYXQgYWxsLiBUaGUgaGlnaCBsZXZlbCBjYWxsZXIg
KGUuZy4gYSB1c2VyIG9mIGxpYnhjKSBkb2Vzbid0IGNhcmUsIHdoZXRoZXINCmEgcmVxdWVz
dGVkIG9wZXJhdGlvbiBpcyBhIGRlZGljYXRlZCBoeXBlcmNhbGwgb3IgYSBzdWItb3Agb2Yg
YSBoeXBlcmNhbGwuDQpUaGUgb25seSBpbnRlcmVzdGluZyBhc3BlY3QgaXMgd2hldGhlciB0
aGUgb3BlcmF0aW9uIGlzIHVuYXZhaWxhYmxlLCBvcg0KanVzdCBmYWlsaW5nIGR1ZSB0byB0
aGUgY3VycmVudCBzaXR1YXRpb24uDQoNCg0KSnVlcmdlbg0K
--------------i8J04AFYXRuU0UN4lSTMfTuP
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

--------------i8J04AFYXRuU0UN4lSTMfTuP--

--------------4ExohZE7IxYE9OEipBWd98mr--

--------------5GTn4F5ytGxLroBDrRFN0nbM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJjlMsFAwAAAAAACgkQsN6d1ii/Ey/U
iAf/eaRdEImoZ8hctljtdLhfU94TuK7i24bzFkP0daFaEMXbtIqSU12j4gVE76JeghOhFQq0j34o
XnaR6kOGPDh33ichWXg8re5p9+XUyb4J+R2OCPGnNjAQYNNW1l2ShFX5UopVQ5jshCjYZpQpsafB
lm8Eu5W96R5/Ug4D3S/rxWrLW9TuXlBe+bcHowLQ8JEQvKXrt4/wPNFWg6MarJuuo5FjsZWASLOc
kQ/Ait6kLN6uIYCU1BIQJ5foVOVorF/4P1hrOfXUQH2VC4iTEzGawn7Nft9uT/twacoWFH+JT5vO
LPOjDkTJfZSNInvuKeRQtUIz2h2TPjvnt/C0VdfdSA==
=9ruF
-----END PGP SIGNATURE-----

--------------5GTn4F5ytGxLroBDrRFN0nbM--

