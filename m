Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999B544B03F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 16:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224030.387074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSvq-0006N5-Ui; Tue, 09 Nov 2021 15:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224030.387074; Tue, 09 Nov 2021 15:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSvq-0006KE-R4; Tue, 09 Nov 2021 15:21:06 +0000
Received: by outflank-mailman (input) for mailman id 224030;
 Tue, 09 Nov 2021 15:21:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uToR=P4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mkSvo-0006K8-Po
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 15:21:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6e65a46-4170-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 16:21:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 13B5B21AFE;
 Tue,  9 Nov 2021 15:21:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C6ACD13A5E;
 Tue,  9 Nov 2021 15:21:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uyldLt6RimFCEgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 09 Nov 2021 15:21:02 +0000
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
X-Inumbo-ID: a6e65a46-4170-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1636471263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=55UhGz8Xj0j4iIaZX9f4aP6c7CvX7PwH8pmV2s8Ghbs=;
	b=KiefXh08T6jTGlJe8bt0mb7jSRgDpNArAzowmPuJidarFpSnQ+QUz306utWr+Q3/xLJQ0G
	8k9BcsfK9q1EHCALVBTX3JBTU6B0+DjnE4SNbQdRkhbi0Eo3w0zcM3GFranzlWYWvWFeEC
	G1RER3NkC6JUvfxygiINWA1wVc7Hh04=
Subject: Re: [PATCH] x86/smp: Factor out parts of native_smp_prepare_cpus()
To: Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com
References: <1635896196-18961-1-git-send-email-boris.ostrovsky@oracle.com>
 <YYk+D17oIOGKWNtN@hirez.programming.kicks-ass.net>
 <48fb48fa-c65d-8e38-dabb-cf9be21365ca@oracle.com>
 <YYqPd1c9HIQH9k/9@hirez.programming.kicks-ass.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c8412f70-2968-a581-50ec-afe91e492fb2@suse.com>
Date: Tue, 9 Nov 2021 16:21:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YYqPd1c9HIQH9k/9@hirez.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xEJShmZjvMUyfJGOcun23tdXfcAqZIez2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xEJShmZjvMUyfJGOcun23tdXfcAqZIez2
Content-Type: multipart/mixed; boundary="sA2iziL2ShqpjLP5KpMzUsSWpuovyAuFW";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com
Message-ID: <c8412f70-2968-a581-50ec-afe91e492fb2@suse.com>
Subject: Re: [PATCH] x86/smp: Factor out parts of native_smp_prepare_cpus()
References: <1635896196-18961-1-git-send-email-boris.ostrovsky@oracle.com>
 <YYk+D17oIOGKWNtN@hirez.programming.kicks-ass.net>
 <48fb48fa-c65d-8e38-dabb-cf9be21365ca@oracle.com>
 <YYqPd1c9HIQH9k/9@hirez.programming.kicks-ass.net>
In-Reply-To: <YYqPd1c9HIQH9k/9@hirez.programming.kicks-ass.net>

--sA2iziL2ShqpjLP5KpMzUsSWpuovyAuFW
Content-Type: multipart/mixed;
 boundary="------------ED979D15ED11F536DBB61649"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------ED979D15ED11F536DBB61649
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.11.21 16:10, Peter Zijlstra wrote:
> On Mon, Nov 08, 2021 at 12:20:26PM -0500, Boris Ostrovsky wrote:
>>
>> On 11/8/21 10:11 AM, Peter Zijlstra wrote:
>>> On Tue, Nov 02, 2021 at 07:36:36PM -0400, Boris Ostrovsky wrote:
>>>> Commit 66558b730f25 ("sched: Add cluster scheduler level for x86")
>>>> introduced cpu_l2c_shared_map mask which is expected to be initializ=
ed
>>>> by smp_op.smp_prepare_cpus(). That commit only updated
>>>> native_smp_prepare_cpus() version but not xen_pv_smp_prepare_cpus().=

>>>> As result Xen PV guests crash in set_cpu_sibling_map().
>>>>
>>>> While the new mask can be allocated in xen_pv_smp_prepare_cpus() one=
 can
>>>> see that both versions of smp_prepare_cpus ops share a number of com=
mon
>>>> operations that can be factored out. So do that instead.
>>>>
>>>> Fixes: 66558b730f25 ("sched: Add cluster scheduler level for x86")
>>>> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>> Thanks! I'll go stick that somewhere /urgent (I've had another report=
 on
>>> that here:
>>>
>>>     https://lkml.kernel.org/r/20211105074139.GE174703@worktop.program=
ming.kicks-ass.net
>>> )
>>
>>
>> Thank you. (I don't see this message btw)
>=20
> Urgh, that thread never went to lkml :/
>=20
>>> But looking at those functions; there seems to be more spurious
>>> differences. For example, the whole sched_topology thing.
>>
>>
>> I did look at that and thought this should be benign given that Xen PV=

>> is not really topology-aware. I didn't see anything that would be a
>> cause for concern but perhaps you can point me to things I missed.
>=20
> And me not being Xen aware... What does Xen-PV guests see of the CPUID
> topology fields? Does it fully sanitize the CPUID data, or is it a clea=
n
> pass-through from whatever CPU the vCPU happens to run on at the time?

The latter. :-(


Juergen

--------------ED979D15ED11F536DBB61649
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

--------------ED979D15ED11F536DBB61649--

--sA2iziL2ShqpjLP5KpMzUsSWpuovyAuFW--

--xEJShmZjvMUyfJGOcun23tdXfcAqZIez2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGKkd4FAwAAAAAACgkQsN6d1ii/Ey+Y
SAf+JT6M2djUTMOSiAHjZM91FpvKMCnWFrgof57TVfbCyxi7IqVAnSO1bf9e4U9Hpb51thZaQsRZ
vVN1FkJ3tNCFkhtwEfWMSGklt3kx8p/BOMRtcII4U1/tk39HhxJ+ezxyAUkJmGCQwnE5KwYuuYus
XWF26VOIuAJWpR7Nb5BVk9d37nuNPaRa7CMTcEarLsDAhUbEFGGX0sFW6RFMBdioidiDBB0GDWKt
ln1iW9KaXHBX7jbLewbQiSg6kob3IlD0M+YdTfHssEYqC2rALVYIlaxCuspqbdYZw7vi6MkIm7Ws
1qKXHxo+LGpC4wb9m48TCQxM0ikSJNx0Qr3gqALWXg==
=p9H+
-----END PGP SIGNATURE-----

--xEJShmZjvMUyfJGOcun23tdXfcAqZIez2--

