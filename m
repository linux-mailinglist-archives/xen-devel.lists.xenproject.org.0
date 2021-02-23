Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCB4322B52
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 14:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88770.167083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEXYp-0004Cz-4U; Tue, 23 Feb 2021 13:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88770.167083; Tue, 23 Feb 2021 13:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEXYp-0004Cc-1C; Tue, 23 Feb 2021 13:17:07 +0000
Received: by outflank-mailman (input) for mailman id 88770;
 Tue, 23 Feb 2021 13:17:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YqHm=HZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lEXYm-0004CX-NF
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 13:17:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bb4cb0a-575c-4282-ba87-36ab84c555a9;
 Tue, 23 Feb 2021 13:17:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6EC73AC1D;
 Tue, 23 Feb 2021 13:17:02 +0000 (UTC)
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
X-Inumbo-ID: 7bb4cb0a-575c-4282-ba87-36ab84c555a9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614086222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z+J582orrVnsRLIqlpO3tJmmbKvU/Cbzk7PWqQR3xW4=;
	b=ud5J3HS1ScZjLvxLA8FllI448k+t7T0k1udgUce48ll/Xzq/LtmlqeqUQ3usk/WXmqwEP4
	fki/aKthdk6+fTycJJL/Wkz9zORQpYQx1Fmec3AXbApe3T6ewfqxlFnXIMGDJUu8ftwqW6
	dXFOm974eAKDchsmd4oOySrTN9Em3f0=
To: Roman Shaposhnik <roman@zededa.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
 <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com>
 <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
 <49344e8d-5518-68c6-a417-68522a915e72@suse.com>
 <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
Message-ID: <b6b694f6-61ed-c0b7-5980-88ddb5e1616c@suse.com>
Date: Tue, 23 Feb 2021 14:17:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EfbhKDrrZMU0yIsOqJCQ9lW9F0ukvuujF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EfbhKDrrZMU0yIsOqJCQ9lW9F0ukvuujF
Content-Type: multipart/mixed; boundary="cGb9T0xPG40UEkZk4U8nke1dy7oVuq52N";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roman Shaposhnik <roman@zededa.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Message-ID: <b6b694f6-61ed-c0b7-5980-88ddb5e1616c@suse.com>
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
 <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com>
 <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
 <49344e8d-5518-68c6-a417-68522a915e72@suse.com>
 <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
In-Reply-To: <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>

--cGb9T0xPG40UEkZk4U8nke1dy7oVuq52N
Content-Type: multipart/mixed;
 boundary="------------048EBAE9B46709486A8C459F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------048EBAE9B46709486A8C459F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.02.21 06:21, Roman Shaposhnik wrote:
> On Wed, Feb 17, 2021 at 12:29 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com=
=20
> <mailto:jgross@suse.com>> wrote:
>=20
>     On 17.02.21 09:12, Roman Shaposhnik wrote:
>      > Hi J=C3=BCrgen, thanks for taking a look at this. A few comments=
 below:
>      >
>      > On Tue, Feb 16, 2021 at 10:47 PM J=C3=BCrgen Gro=C3=9F <jgross@s=
use.com
>     <mailto:jgross@suse.com>> wrote:
>      >>
>      >> On 16.02.21 21:34, Stefano Stabellini wrote:
>      >>> + x86 maintainers
>      >>>
>      >>> It looks like the tlbflush is getting stuck?
>      >>
>      >> I have seen this case multiple times on customer systems now, b=
ut
>      >> reproducing it reliably seems to be very hard.
>      >
>      > It is reliably reproducible under my workload but it take a long=
 time
>      > (~3 days of the workload running in the lab).
>=20
>     This is by far the best reproduction rate I have seen up to now.
>=20
>     The next best reproducer seems to be a huge installation with sever=
al
>     hundred hosts and thousands of VMs with about 1 crash each week.
>=20
>      >
>      >> I suspected fifo events to be blamed, but just yesterday I've b=
een
>      >> informed of another case with fifo events disabled in the guest=
=2E
>      >>
>      >> One common pattern seems to be that up to now I have seen this
>     effect
>      >> only on systems with Intel Gold cpus. Can it be confirmed to be=
 true
>      >> in this case, too?
>      >
>      > I am pretty sure mine isn't -- I can get you full CPU specs if
>     that's useful.
>=20
>     Just the output of "grep model /proc/cpuinfo" should be enough.
>=20
>=20
> processor: 3
> vendor_id: GenuineIntel
> cpu family: 6
> model: 77
> model name: Intel(R) Atom(TM) CPU =C2=A0C2550 =C2=A0@ 2.40GHz
> stepping: 8
> microcode: 0x12d
> cpu MHz: 1200.070
> cache size: 1024 KB
> physical id: 0
> siblings: 4
> core id: 3
> cpu cores: 4
> apicid: 6
> initial apicid: 6
> fpu: yes
> fpu_exception: yes
> cpuid level: 11
> wp: yes
> flags: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pa=
t=20
> pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp=
=20
> lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology=20
> nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx es=
t=20
> tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 movbe popcnt tsc_deadline_timer =

> aes rdrand lahf_lm 3dnowprefetch cpuid_fault epb pti ibrs ibpb stibp=20
> tpr_shadow vnmi flexpriority ept vpid tsc_adjust smep erms dtherm ida=20
> arat md_clear
> vmx flags: vnmi preemption_timer invvpid ept_x_only flexpriority=20
> tsc_offset vtpr mtf vapic ept vpid unrestricted_guest
> bugs: cpu_meltdown spectre_v1 spectre_v2 mds msbds_only
> bogomips: 4800.19
> clflush size: 64
> cache_alignment: 64
> address sizes: 36 bits physical, 48 bits virtual
> power management:
>=20
>      >
>      >> In case anybody has a reproducer (either in a guest or dom0) wi=
th a
>      >> setup where a diagnostic kernel can be used, I'd be _very_
>     interested!
>      >
>      > I can easily add things to Dom0 and DomU. Whether that will
>     disrupt the
>      > experiment is, of course, another matter. Still please let me
>     know what
>      > would be helpful to do.
>=20
>     Is there a chance to switch to an upstream kernel in the guest? I'd=
 like
>     to add some diagnostic code to the kernel and creating the patches =
will
>     be easier this way.
>=20
>=20
> That's a bit tough -- the VM is based on stock Ubuntu and if I upgrade =

> the kernel I'll have fiddle with a lot things to make workload=20
> functional again.
>=20
> However, I can install debug kernel (from Ubuntu, etc. etc.)
>=20
> Of course, if patching the kernel is the only way to make progress --=20
> lets try that -- please let me know.

I have been able to gather some more data.

I have contacted the author of the upstream kernel patch I've been using
for our customer (and that helped, by the way).

It seems as if the problem is occurring when running as a guest at least
under Xen, KVM, and VMWare, and there have been reports of bare metal
cases, too. Hunting this bug is going on for several years now, the
patch author is at it since 8 months.

So we can rule out a Xen problem.

Finding the root cause is still important, of course, and your setup
seems to have the best reproduction rate up to now.

So any help would really be appreciated.

Is the VM self contained? Would it be possible to start it e.g. on a
test system on my side? If yes, would you be allowed to pass it on to
me?


Juergen

--------------048EBAE9B46709486A8C459F
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

--------------048EBAE9B46709486A8C459F--

--cGb9T0xPG40UEkZk4U8nke1dy7oVuq52N--

--EfbhKDrrZMU0yIsOqJCQ9lW9F0ukvuujF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmA1AE0FAwAAAAAACgkQsN6d1ii/Ey9W
9wf9HGMuph0lLE6x9JVzEtP/Obz5jVV6MO4AWC1v8DVXKHOmSIy/IPGAB3HJzLAFyoejLFFcgs2i
wtaTh19J7OFYXkjibxK1N8WI6j7yhpyBVVRdg3mSV1RSoTRwSizd3Si/1Ir2TZJCVtzEEgWk3Cad
HSgF3WejZQK79IFQe25SHvTo7Ns6H9IRawr5oHOCek4bKpWRt/UfkBgP4f/Pb6PIXr5Bn4ADmKx/
0ELH+pbnyEHYU16qoUBPGIqnH1E/z+LWl7ox/nRYiAvyhbt8AUnAddOJiB/+nozt5J/dWNYNn08G
+yxf9aIJCT0amOe7DE2yPc3phKaZ+g0+JoayFeOKOg==
=p/OO
-----END PGP SIGNATURE-----

--EfbhKDrrZMU0yIsOqJCQ9lW9F0ukvuujF--

