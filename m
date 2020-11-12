Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D943C2B0311
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 11:49:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25649.53549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdA9r-0005WS-AE; Thu, 12 Nov 2020 10:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25649.53549; Thu, 12 Nov 2020 10:48:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdA9r-0005W5-6m; Thu, 12 Nov 2020 10:48:51 +0000
Received: by outflank-mailman (input) for mailman id 25649;
 Thu, 12 Nov 2020 10:48:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kdA9p-0005W0-UL
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:48:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f298ee87-ce4d-4428-9a43-4a435f0e3e19;
 Thu, 12 Nov 2020 10:48:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71CB8AB95;
 Thu, 12 Nov 2020 10:48:47 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kdA9p-0005W0-UL
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:48:49 +0000
X-Inumbo-ID: f298ee87-ce4d-4428-9a43-4a435f0e3e19
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f298ee87-ce4d-4428-9a43-4a435f0e3e19;
	Thu, 12 Nov 2020 10:48:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605178127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+TeHY1R13WRoyhHo3LRKmu8LfoLlih3gwVHvO8daaCM=;
	b=ct/CIOsVJhrQGqTJfRH3J903tSyFhXryWj2f7Q+4s7K8H4tiVZ7Os99dwtfWmfpAHlCpy2
	YUsEemZM/jDffy8YoQ4TaQ8ZYL7dA4P89QJLl62uHZaHoGxT+RpGh9VcKKekEx53ODeWB4
	WZLtKoXOJlhI6xk5AGexBGR+E5NTAmk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 71CB8AB95;
	Thu, 12 Nov 2020 10:48:47 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-3-jgross@suse.com>
 <d55adbc0-8a98-dd5c-c204-2ec11955c356@suse.com>
 <288804e4-75e6-6600-9634-8c0ea7a06c22@suse.com>
 <b84d687e-0aab-d48f-c068-1852cc1075b2@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v4 2/3] xen/oprofile: use NMI continuation for sending
 virq to guest
Message-ID: <6229914c-bc76-2670-a272-ab0603f612cc@suse.com>
Date: Thu, 12 Nov 2020 11:48:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b84d687e-0aab-d48f-c068-1852cc1075b2@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="z5UMM1DSH3UQrECgOEAdM8MWgEganrny8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--z5UMM1DSH3UQrECgOEAdM8MWgEganrny8
Content-Type: multipart/mixed; boundary="og8ozsOwXYiS8ZgFuLDlghulTUxTHDiE9";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <6229914c-bc76-2670-a272-ab0603f612cc@suse.com>
Subject: Re: [PATCH v4 2/3] xen/oprofile: use NMI continuation for sending
 virq to guest
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-3-jgross@suse.com>
 <d55adbc0-8a98-dd5c-c204-2ec11955c356@suse.com>
 <288804e4-75e6-6600-9634-8c0ea7a06c22@suse.com>
 <b84d687e-0aab-d48f-c068-1852cc1075b2@suse.com>
In-Reply-To: <b84d687e-0aab-d48f-c068-1852cc1075b2@suse.com>

--og8ozsOwXYiS8ZgFuLDlghulTUxTHDiE9
Content-Type: multipart/mixed;
 boundary="------------828759602BE4AD8DB3314E1F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------828759602BE4AD8DB3314E1F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.11.20 11:23, Jan Beulich wrote:
> On 11.11.2020 16:48, J=C3=BCrgen Gro=C3=9F wrote:
>> On 11.11.20 16:45, Jan Beulich wrote:
>>> On 09.11.2020 10:50, Juergen Gross wrote:
>>>> @@ -83,14 +85,28 @@ void passive_domain_destroy(struct vcpu *v)
>>>>    		model->free_msr(v);
>>>>    }
>>>>   =20
>>>> +bool nmi_oprofile_send_virq(void)
>>>> +{
>>>> +	struct vcpu *v =3D this_cpu(nmi_cont_vcpu);
>>>> +
>>>> +	if ( v )
>>>> +		send_guest_vcpu_virq(v, VIRQ_XENOPROF);
>>>> +
>>>> +	this_cpu(nmi_cont_vcpu) =3D NULL;
>>>
>>> What if, by the time we make it here, a 2nd NMI has arrived? I
>>> agree the next overflow interrupt shouldn't arrive this
>>> quickly, but I also think you want to zap the per-CPU variable
>>> first here, and ...
>>
>> How could that happen? This function is activated only from NMI
>> context in case the NMI happened in guest mode. And it will be
>> executed with higher priority than any guest, so there is a zero
>> chance another NMI in guest mode can happen in between.
>=20
> While I'll admit I didn't pay attention to the bogus (as far as
> HVM is concerned) xen_mode check, my understanding is that the
> self-IPI will be delivered once we're back in guest mode, as
> that's the first time IRQs would be on again (even event checking
> gets deferred by sending a self-IPI). If another NMI was latched
> by that time, it would take precedence over the IRQ and would
> also be delivered on the guest mode insn that the IRET returned
> to.
>=20
> I agree though that this is benign, as the vCPU wouldn't have
> been context switched out yet, i.e. current is still the same
> and there'll then merely be two NMI instances folded into one.

Correct.

>=20
> However, I still think the ordering would better be changed, to
> set a good precedent.

Okay, if you want that.

>=20
>>>>    static int nmi_callback(const struct cpu_user_regs *regs, int cpu=
)
>>>>    {
>>>>    	int xen_mode, ovf;
>>>>   =20
>>>>    	ovf =3D model->check_ctrs(cpu, &cpu_msrs[cpu], regs);
>>>>    	xen_mode =3D ring_0(regs);
>=20
> Unrelated to the patch here (i.e. just as an observation), this
> use of ring_0() looks bogus when the NMI occurred in HVM guest
> mode.

An NMI in an HVM guest due to oprofile would be a VMEXIT with NMI
reason, or just be handled completely inside the guest, right?

I don't see how this test should ever result in xen_mode being
false for an HVM guest.


Juergen

--------------828759602BE4AD8DB3314E1F
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
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

--------------828759602BE4AD8DB3314E1F--

--og8ozsOwXYiS8ZgFuLDlghulTUxTHDiE9--

--z5UMM1DSH3UQrECgOEAdM8MWgEganrny8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+tEw4FAwAAAAAACgkQsN6d1ii/Ey9s
gwf9EvTPzBKdLdKl2WWr/mRM+S/7tJ69Ma8bwQSjN6KCiryRWNJ/W5y939vi+ffac0ib4MGew0lO
QEhoVpjkrXzIMqxwkZ/ks7m8ZAXhc1ZOiZ3O6SP1yU2op2jEp2YvlZYpuoxdteAO+o1gSZTv/+y2
Ahn9EHo+ponhd5h20iNqJ0klwo2VVfD5yu4dS25d95nxk6ojBwytIYTEJ9EukDAetonSxNDyUUKR
k8wDUHNABxBcYKa4aBEKQIL2lGBXJrvigJCmm0Pc2KWoW/J9uPeoyxahCgpIAZAesLK7AdAzQ9tO
V4+Tlqn+eHnBmpGfWjSjRPuAqwJWwMhTYlxuS018iw==
=wC+W
-----END PGP SIGNATURE-----

--z5UMM1DSH3UQrECgOEAdM8MWgEganrny8--

