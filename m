Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494FC339C85
	for <lists+xen-devel@lfdr.de>; Sat, 13 Mar 2021 08:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97445.185137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKyXI-0004CX-WB; Sat, 13 Mar 2021 07:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97445.185137; Sat, 13 Mar 2021 07:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKyXI-0004C7-SY; Sat, 13 Mar 2021 07:18:08 +0000
Received: by outflank-mailman (input) for mailman id 97445;
 Sat, 13 Mar 2021 07:18:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6GBH=IL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lKyXH-0004C1-Um
 for xen-devel@lists.xenproject.org; Sat, 13 Mar 2021 07:18:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa71889a-7bad-411f-90a4-3f2b7533791e;
 Sat, 13 Mar 2021 07:18:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95276AB8C;
 Sat, 13 Mar 2021 07:18:05 +0000 (UTC)
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
X-Inumbo-ID: aa71889a-7bad-411f-90a4-3f2b7533791e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615619885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tK+2KPlvdnxoxCN1IqL7t+VhSxDK3e++sQZ+b/LG2AQ=;
	b=L/i5OCvYOqP5D8uqCdbr4wLifKRpYhSZwRuy9BAND9qHO0TkH2ZyIJ3W7H2SdaezKm3IlS
	lKv0dr5Tp9lWduplvIMQJTCIkdFwZLDnrmziHuWD/ceJJFJfPMgmiEjupxId3SUTGmI9Ca
	czHk9+lAdJkv0wWyDSdFx/2XppuEAq8=
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
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
 <b6b694f6-61ed-c0b7-5980-88ddb5e1616c@suse.com>
 <CAMmSBy8pSZROdPo+gee8oxrU9EL=k+QTJj0UxZTi3Bh+S_g2_w@mail.gmail.com>
 <CAMmSBy_0zCa1D5dpw4VFAcJwSiE6RAQoBk5vAJzW1ZPk5Zaxww@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a283c8a6-96ef-870e-095a-0b7adacb34a0@suse.com>
Date: Sat, 13 Mar 2021 08:18:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_0zCa1D5dpw4VFAcJwSiE6RAQoBk5vAJzW1ZPk5Zaxww@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yV3e29qlJVkORLytCzreFdCYGTtHvPy3w"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yV3e29qlJVkORLytCzreFdCYGTtHvPy3w
Content-Type: multipart/mixed; boundary="Th5NOkwgHWvSfXtUiZgknvENl1HWsptWi";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roman Shaposhnik <roman@zededa.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Message-ID: <a283c8a6-96ef-870e-095a-0b7adacb34a0@suse.com>
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
 <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com>
 <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
 <49344e8d-5518-68c6-a417-68522a915e72@suse.com>
 <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
 <b6b694f6-61ed-c0b7-5980-88ddb5e1616c@suse.com>
 <CAMmSBy8pSZROdPo+gee8oxrU9EL=k+QTJj0UxZTi3Bh+S_g2_w@mail.gmail.com>
 <CAMmSBy_0zCa1D5dpw4VFAcJwSiE6RAQoBk5vAJzW1ZPk5Zaxww@mail.gmail.com>
In-Reply-To: <CAMmSBy_0zCa1D5dpw4VFAcJwSiE6RAQoBk5vAJzW1ZPk5Zaxww@mail.gmail.com>

--Th5NOkwgHWvSfXtUiZgknvENl1HWsptWi
Content-Type: multipart/mixed;
 boundary="------------54DB922F4707F86C347D4B5C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------54DB922F4707F86C347D4B5C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.03.21 22:33, Roman Shaposhnik wrote:
> Hi J=C3=BCrgen,
>=20
> just wanted to give you (and everyone who may be keeping an eye on
> this) an update.
>=20
> Somehow, after applying your kernel patch -- the VM is now running 10
> days+ without a problem.

Can you check the kernel console messages, please? There are messages
printed when a potential hang is detected, and the hanging cpu is
tried to be woken up via another interrupt again.

Look for messages containing "csd", so e.g. do

dmesg | grep csd

in the VM.

Thanks,


Juergen

>=20
> I'll keep experimenting (A/B-testing style) but at this point I'm
> actually pretty perplexed as to why this patch would make a difference
> (since it is basically just for observability). Any thoughts on that?
>=20
> Thanks,
> Roman.
>=20
> On Wed, Feb 24, 2021 at 7:06 PM Roman Shaposhnik <roman@zededa.com> wro=
te:
>>
>> Hi J=C3=BCrgen!
>>
>> sorry for the belated reply -- I wanted to externalize the VM before I=

>> do -- but let me at least reply to you:
>>
>> On Tue, Feb 23, 2021 at 5:17 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com=
> wrote:
>>>
>>> On 18.02.21 06:21, Roman Shaposhnik wrote:
>>>> On Wed, Feb 17, 2021 at 12:29 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.=
com
>>>> <mailto:jgross@suse.com>> wrote:
>>>>
>>>>      On 17.02.21 09:12, Roman Shaposhnik wrote:
>>>>       > Hi J=C3=BCrgen, thanks for taking a look at this. A few comm=
ents below:
>>>>       >
>>>>       > On Tue, Feb 16, 2021 at 10:47 PM J=C3=BCrgen Gro=C3=9F <jgro=
ss@suse.com
>>>>      <mailto:jgross@suse.com>> wrote:
>>>>       >>
>>>>       >> On 16.02.21 21:34, Stefano Stabellini wrote:
>>>>       >>> + x86 maintainers
>>>>       >>>
>>>>       >>> It looks like the tlbflush is getting stuck?
>>>>       >>
>>>>       >> I have seen this case multiple times on customer systems no=
w, but
>>>>       >> reproducing it reliably seems to be very hard.
>>>>       >
>>>>       > It is reliably reproducible under my workload but it take a =
long time
>>>>       > (~3 days of the workload running in the lab).
>>>>
>>>>      This is by far the best reproduction rate I have seen up to now=
=2E
>>>>
>>>>      The next best reproducer seems to be a huge installation with s=
everal
>>>>      hundred hosts and thousands of VMs with about 1 crash each week=
=2E
>>>>
>>>>       >
>>>>       >> I suspected fifo events to be blamed, but just yesterday I'=
ve been
>>>>       >> informed of another case with fifo events disabled in the g=
uest.
>>>>       >>
>>>>       >> One common pattern seems to be that up to now I have seen t=
his
>>>>      effect
>>>>       >> only on systems with Intel Gold cpus. Can it be confirmed t=
o be true
>>>>       >> in this case, too?
>>>>       >
>>>>       > I am pretty sure mine isn't -- I can get you full CPU specs =
if
>>>>      that's useful.
>>>>
>>>>      Just the output of "grep model /proc/cpuinfo" should be enough.=

>>>>
>>>>
>>>> processor: 3
>>>> vendor_id: GenuineIntel
>>>> cpu family: 6
>>>> model: 77
>>>> model name: Intel(R) Atom(TM) CPU  C2550  @ 2.40GHz
>>>> stepping: 8
>>>> microcode: 0x12d
>>>> cpu MHz: 1200.070
>>>> cache size: 1024 KB
>>>> physical id: 0
>>>> siblings: 4
>>>> core id: 3
>>>> cpu cores: 4
>>>> apicid: 6
>>>> initial apicid: 6
>>>> fpu: yes
>>>> fpu_exception: yes
>>>> cpuid level: 11
>>>> wp: yes
>>>> flags: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov=
 pat
>>>> pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdt=
scp
>>>> lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology
>>>> nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx=
 est
>>>> tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 movbe popcnt tsc_deadline_tim=
er
>>>> aes rdrand lahf_lm 3dnowprefetch cpuid_fault epb pti ibrs ibpb stibp=

>>>> tpr_shadow vnmi flexpriority ept vpid tsc_adjust smep erms dtherm id=
a
>>>> arat md_clear
>>>> vmx flags: vnmi preemption_timer invvpid ept_x_only flexpriority
>>>> tsc_offset vtpr mtf vapic ept vpid unrestricted_guest
>>>> bugs: cpu_meltdown spectre_v1 spectre_v2 mds msbds_only
>>>> bogomips: 4800.19
>>>> clflush size: 64
>>>> cache_alignment: 64
>>>> address sizes: 36 bits physical, 48 bits virtual
>>>> power management:
>>>>
>>>>       >
>>>>       >> In case anybody has a reproducer (either in a guest or dom0=
) with a
>>>>       >> setup where a diagnostic kernel can be used, I'd be _very_
>>>>      interested!
>>>>       >
>>>>       > I can easily add things to Dom0 and DomU. Whether that will
>>>>      disrupt the
>>>>       > experiment is, of course, another matter. Still please let m=
e
>>>>      know what
>>>>       > would be helpful to do.
>>>>
>>>>      Is there a chance to switch to an upstream kernel in the guest?=
 I'd like
>>>>      to add some diagnostic code to the kernel and creating the patc=
hes will
>>>>      be easier this way.
>>>>
>>>>
>>>> That's a bit tough -- the VM is based on stock Ubuntu and if I upgra=
de
>>>> the kernel I'll have fiddle with a lot things to make workload
>>>> functional again.
>>>>
>>>> However, I can install debug kernel (from Ubuntu, etc. etc.)
>>>>
>>>> Of course, if patching the kernel is the only way to make progress -=
-
>>>> lets try that -- please let me know.
>>>
>>> I have found a nice upstream patch, which - with some modifications -=
 I
>>> plan to give our customer as a workaround.
>>>
>>> The patch is for kernel 4.12, but chances are good it will apply to a=

>>> 4.15 kernel, too.
>>
>> I'm slightly confused about this patch -- it seems to me that it needs=

>> to be applied to the guest kernel, correct?
>>
>> If that's the case -- the challenge I have is that I need to re-build
>> the Canonical (Ubuntu) distro kernel with this patch -- this seems
>> a bit daunting at first (I mean -- I'm pretty good at rebuilding kerne=
ls
>> I just never do it with the vendor ones ;-)).
>>
>> So... if there's anyone here who has any suggestions on how to do that=

>> -- I'd appreciate pointers.
>>
>>> I have been able to gather some more data.
>>>
>>> I have contacted the author of the upstream kernel patch I've been us=
ing
>>> for our customer (and that helped, by the way).
>>>
>>> It seems as if the problem is occurring when running as a guest at le=
ast
>>> under Xen, KVM, and VMWare, and there have been reports of bare metal=

>>> cases, too. Hunting this bug is going on for several years now, the
>>> patch author is at it since 8 months.
>>>
>>> So we can rule out a Xen problem.
>>>
>>> Finding the root cause is still important, of course, and your setup
>>> seems to have the best reproduction rate up to now.
>>>
>>> So any help would really be appreciated.
>>>
>>> Is the VM self contained? Would it be possible to start it e.g. on a
>>> test system on my side? If yes, would you be allowed to pass it on to=

>>> me?
>>
>> I'm working on externalizing the VM in a way that doesn't disclose any=
thing
>> about the customer workload. I'm almost there -- sans my question abou=
t
>> the vendor kernel rebuild. I plan to make that VM available this week.=

>>
>> Goes without saying, but I would really appreciate your help in chasin=
g this.
>>
>> Thanks,
>> Roman.
>=20


--------------54DB922F4707F86C347D4B5C
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

--------------54DB922F4707F86C347D4B5C--

--Th5NOkwgHWvSfXtUiZgknvENl1HWsptWi--

--yV3e29qlJVkORLytCzreFdCYGTtHvPy3w
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBMZywFAwAAAAAACgkQsN6d1ii/Ey8O
+gf+Kg0jDRrWXlTiahlvfhgVN5giOaJVp8SR6iDyVBuld+pX5idEebMOjyO9/SiaZyHdaT+MCuZy
n5+tajBjebZDgLlBDQEjfvH4pvJMCBiYbr/ckOHN1sAmyUMfF4nn820vhJIRFEAa1vs/IE/qkhhG
W+PlvQsBhSROXFsW/ZTx/REhnLKWdmQsZzbtWLeT/EDEHeBiFeIvbW80nyMW8+jBq2NyK2WrsIbd
mu3ft2auLlTnIKfpNuTYUaE+87HOQxQ2DBe1oaWbhNrIf/mvDXVWUc9N6Q50hohX2KclnUOnSr22
8+02/FA3ETuoFx/Rxr0IfNNXKF/xOgacrI6l8ut3zg==
=rdqw
-----END PGP SIGNATURE-----

--yV3e29qlJVkORLytCzreFdCYGTtHvPy3w--

