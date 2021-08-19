Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D84E3F1B99
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 16:30:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168873.308384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGj3A-0002Qm-3t; Thu, 19 Aug 2021 14:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168873.308384; Thu, 19 Aug 2021 14:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGj3A-0002O4-0T; Thu, 19 Aug 2021 14:29:44 +0000
Received: by outflank-mailman (input) for mailman id 168873;
 Thu, 19 Aug 2021 14:29:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/7+2=NK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGj38-0002Nx-K8
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 14:29:42 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff396cc9-ca22-47fc-ba10-b2c8d0f139ad;
 Thu, 19 Aug 2021 14:29:41 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B7A9C1FDA7;
 Thu, 19 Aug 2021 14:29:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7056413A10;
 Thu, 19 Aug 2021 14:29:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id tSboGdRqHmFXCwAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 19 Aug 2021 14:29:40 +0000
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
X-Inumbo-ID: ff396cc9-ca22-47fc-ba10-b2c8d0f139ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629383380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+hha0WK4MGSbErqnpiDyGubQ7lCqoDx3pKTyzY9GuGA=;
	b=h8KkCnflI5JHXAeG5mykE+w5uQK6FCeVJoA8k6DG8MBvUTDsv0tX+94mWY1KREXw/aOCHq
	Nlvv9IyPj8T2n7SYYnGzBjR1E6qzI8GcDzb2d56sUTFYwLMop6lfqBZuYgINLpavCaFCON
	t9M7NLyDVcPI7IQjMbz25NIWJVm7Xqc=
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
 <f69e5a2b-cd8c-3534-ab7b-427fb1fc1cdc@suse.com>
 <f0e9c8ad-dfa2-77ac-b3db-02cba59e843c@suse.com>
 <347edc1f-a104-1bc3-0cb2-2cfffcb6214a@suse.com>
 <a9fbd7c1-1675-50ae-6106-8a8625643930@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4441fb9f-d3eb-d443-b04a-534545671ff4@suse.com>
Date: Thu, 19 Aug 2021 16:29:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a9fbd7c1-1675-50ae-6106-8a8625643930@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Y7HHd6IA1lFKkx72IQJmwiPikEen7LfMB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Y7HHd6IA1lFKkx72IQJmwiPikEen7LfMB
Content-Type: multipart/mixed; boundary="Lnr00Y0f6XIijPBfqCSzNvjbvAqjc9RW2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <4441fb9f-d3eb-d443-b04a-534545671ff4@suse.com>
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
 <f69e5a2b-cd8c-3534-ab7b-427fb1fc1cdc@suse.com>
 <f0e9c8ad-dfa2-77ac-b3db-02cba59e843c@suse.com>
 <347edc1f-a104-1bc3-0cb2-2cfffcb6214a@suse.com>
 <a9fbd7c1-1675-50ae-6106-8a8625643930@suse.com>
In-Reply-To: <a9fbd7c1-1675-50ae-6106-8a8625643930@suse.com>

--Lnr00Y0f6XIijPBfqCSzNvjbvAqjc9RW2
Content-Type: multipart/mixed;
 boundary="------------742C01FE52AAAED5C3D73417"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------742C01FE52AAAED5C3D73417
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.08.21 13:51, Jan Beulich wrote:
> On 19.08.2021 13:25, Juergen Gross wrote:
>> On 19.08.21 13:06, Jan Beulich wrote:
>>> On 19.08.2021 12:20, Juergen Gross wrote:
>>>> On 05.07.21 17:13, Jan Beulich wrote:
>>>>> In send_memory_live() the precise value the dirty_count struct fiel=
d
>>>>> gets initialized to doesn't matter much (apart from the triggering =
of
>>>>> the log message in send_dirty_pages(), see below), but it is import=
ant
>>>>> that it not be zero on the first iteration (or else send_dirty_page=
s()
>>>>> won't get called at all). Saturate the initializer value at the max=
imum
>>>>> value the field can hold.
>>>>>
>>>>> While there also initialize struct precopy_stats' respective field =
to a
>>>>> more sane value: We don't really know how many dirty pages there ar=
e at
>>>>> that point.
>>>>>
>>>>> In suspend_and_send_dirty() and verify_frames() the local variables=

>>>>> don't need initializing at all, as they're only an output from the
>>>>> hypercall which gets invoked first thing.
>>>>>
>>>>> In send_checkpoint_dirty_pfn_list() the local variable can be dropp=
ed
>>>>> altogether: It's optional to xc_logdirty_control() and not used any=
where
>>>>> else.
>>>>>
>>>>> Note that in case the clipping actually takes effect, the "Bitmap
>>>>> contained more entries than expected..." log message will trigger. =
This
>>>>> being just an informational message, I don't think this is overly
>>>>> concerning.
>>>>
>>>> Is there any real reason why the width of the stats fields can't be
>>>> expanded to avoid clipping? This could avoid the need to set the
>>>> initial value to -1, which seems one of the more controversial chang=
es.
>>>
>>> While not impossible, it comes with a price tag, as we'd either need
>>> to decouple xc_shadow_op_stats_t from struct xen_domctl_shadow_op_sta=
ts
>>> or alter the underlying domctl. Neither of which looked either
>>
>> I was thinking about the domctl.
>>
>> Apart of struct xen_sysctl_page_offline_op this seems to be the only
>> left domctl/sysctl structure limiting guest or host size to values
>> being relevant. Changing those would be a sensible thing to do IMO.
>=20
> Yet in the context of v1 of this series, which included "x86/paging:
> deal with log-dirty stats overflow" (now commit 17e91570c5a4) we
> settled on these fields not needing widening. This doesn't prevent
> us doing what you suggest, but it would look pretty odd to me at
> least.

Sorry I was too busy at that time to have a detailed look at the
patches.

TBH I'd rather undo the stats overflow handling and widen the fields.
This is a rather simple patch and a much cleaner solution in the end.

I'm not insisting on that, but in case I had to decide this would be my
preferred way to handle it.


Juergen

--------------742C01FE52AAAED5C3D73417
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------742C01FE52AAAED5C3D73417--

--Lnr00Y0f6XIijPBfqCSzNvjbvAqjc9RW2--

--Y7HHd6IA1lFKkx72IQJmwiPikEen7LfMB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEeatMFAwAAAAAACgkQsN6d1ii/Ey/5
Ywf+LcJsUgGDT0ulyu/EHwhNzvlWxyS8JCQm+kd1fzbxcRfBfbwr04FIl232KE2NNhQ1WHEmNkId
VwY81mwg9yoDtbcsXMtb/5pf/Okm9uBGE1upbaH8kzFC5TLjcxzNhbU7rBcv7/kM+Wh5Lj30WI4k
86x5/yYAr7q2q6DooRtDO115A2F2QyaSCmSIFE15e+iKEdNt/YPye1XOn3/x/ML/zBqCDVaPlbTx
rIRbltVZ1oWIjFk5Bg1DlZGJNsNW4aaCdbvuL9qt9I2SU2J7U1jQ2HTBG0/omTPT6HT59AssTppO
YMZG4FfZFf5JJYuiCC/01lwB7DRof9rLSnDBFZvIMw==
=i2FB
-----END PGP SIGNATURE-----

--Y7HHd6IA1lFKkx72IQJmwiPikEen7LfMB--

