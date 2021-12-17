Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D87478992
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 12:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248553.428720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myBAA-0003Eq-Hb; Fri, 17 Dec 2021 11:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248553.428720; Fri, 17 Dec 2021 11:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myBAA-0003CC-EH; Fri, 17 Dec 2021 11:12:34 +0000
Received: by outflank-mailman (input) for mailman id 248553;
 Fri, 17 Dec 2021 11:12:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NBDy=RC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1myBA8-0003C6-BZ
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 11:12:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39e22d97-5f2a-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 12:12:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 61DD021115;
 Fri, 17 Dec 2021 11:12:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1813913DC1;
 Fri, 17 Dec 2021 11:12:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JK2BBJ5wvGHyQgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Dec 2021 11:12:30 +0000
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
X-Inumbo-ID: 39e22d97-5f2a-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639739550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QX2w6H9s04ofNrM2nkdF+F1SZFw7leVbGd2JhJcnoQc=;
	b=ECGGtFVJCOqUslqyvRd4BmrubAutIZpC5ko6ibaddcotAQg05o5tzP9chpmeoAHNDryTuF
	MaJH/PGEeXpjLAHD756/OMSq7bP/T2pA0SnAD2X83FwEDapQ4hfTerwn5e99a+Nc7u3zV9
	07dQWu2PKJV6iKmU8CXSR+KskYa1Hnk=
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
 <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
 <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
 <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop>
 <29c14fd7-4ae2-a277-2413-faa330afc49b@suse.com>
 <67d3c4da-9a20-24ca-543f-02ecf4676277@suse.com>
 <287c8fba-b22f-95ec-21d4-e440e7e7fb36@suse.com>
 <e41d26aa-9ef5-459a-c143-caf28e43c47c@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
Message-ID: <a91217dc-8f97-2882-ce08-2a408654295e@suse.com>
Date: Fri, 17 Dec 2021 12:12:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e41d26aa-9ef5-459a-c143-caf28e43c47c@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IoDOwhz3q6ZxpmhMJNlX4RzT3LAF6f2Nv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IoDOwhz3q6ZxpmhMJNlX4RzT3LAF6f2Nv
Content-Type: multipart/mixed; boundary="fKTrddbMzShsGJXe1srn4K7HK1sHn75es";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <a91217dc-8f97-2882-ce08-2a408654295e@suse.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
 <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
 <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
 <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop>
 <29c14fd7-4ae2-a277-2413-faa330afc49b@suse.com>
 <67d3c4da-9a20-24ca-543f-02ecf4676277@suse.com>
 <287c8fba-b22f-95ec-21d4-e440e7e7fb36@suse.com>
 <e41d26aa-9ef5-459a-c143-caf28e43c47c@xen.org>
In-Reply-To: <e41d26aa-9ef5-459a-c143-caf28e43c47c@xen.org>

--fKTrddbMzShsGJXe1srn4K7HK1sHn75es
Content-Type: multipart/mixed;
 boundary="------------6C299E3B67F103C2A1546EC0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6C299E3B67F103C2A1546EC0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.12.21 11:41, Julien Grall wrote:
> Hi Juergen,
>=20
> On 17/12/2021 08:50, Juergen Gross wrote:
>> On 17.12.21 08:45, Jan Beulich wrote:
>>> On 17.12.2021 06:34, Juergen Gross wrote:
>>>> On 16.12.21 22:15, Stefano Stabellini wrote:
>>>>> On Thu, 16 Dec 2021, Stefano Stabellini wrote:
>>>>>> On Thu, 16 Dec 2021, Juergen Gross wrote:
>>>>>>> On 16.12.21 03:10, Stefano Stabellini wrote:
>>>>>>>> The case of XENMEM_maximum_ram_page is interesting but it is not=
 a
>>>>>>>> problem in reality because the max physical address size is only=
=20
>>>>>>>> 40-bit
>>>>>>>> for aarch32 guests, so 32-bit are always enough to return the=20
>>>>>>>> highest
>>>>>>>> page in memory for 32-bit guests.
>>>>>>>
>>>>>>> You are aware that this isn't the guest's max page, but the host'=
s?
>>>>>
>>>>> I can see now that you meant to say that, no matter what is the max=

>>>>> pseudo-physical address supported by the VM,=20
>>>>> XENMEM_maximum_ram_page is
>>>>> supposed to return the max memory page, which could go above the
>>>>> addressibility limit of the VM.
>>>>>
>>>>> So XENMEM_maximum_ram_page should potentially be able to return=20
>>>>> (1<<44)
>>>>> even when called by an aarch32 VM, with max IPA 40-bit.
>>>>>
>>>>> I would imagine it could be useful if dom0 is 32-bit but domUs are
>>>>> 64-bit on a 64-bit hypervisor (which I think it would be a very rar=
e
>>>>> configuration on ARM.)
>>>>>
>>>>> Then it looks like XENMEM_maximum_ram_page needs to be able to=20
>>>>> return a
>>>>> value > 32-bit when called by a 32-bit guest.
>>>>>
>>>>> The hypercall ABI follows the ARM C calling convention, so a 64-bit=

>>>>> value should be returned using r0 and r1. But looking at
>>>>> xen/arch/arm/traps.c:do_trap_hypercall, it doesn't seem it ever=20
>>>>> sets r1
>>>>> today. Only r0 is set, so effectively we only support 32-bit return=

>>>>> values on aarch32 and for aarch32 guests.
>>>>>
>>>>> In other words, today all hypercalls on ARM return 64-bit to 64-bit=

>>>>> guests and 32-bit to 32-bit guests. Which in the case of memory_op =
is
>>>>> "technically" the correct thing to do because it matches the C
>>>>> declaration in xen/include/xen/hypercall.h:
>>>>>
>>>>> extern long
>>>>> do_memory_op(
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long cmd,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_GUEST_HANDLE_PARAM(void) arg);
>>>>>
>>>>> So...=C2=A0 I guess the conclusion is that on ARM do_memory_op shou=
ld=20
>>>>> return
>>>>> "long" although it is not actually enough for a correct implementat=
ion
>>>>> of XENMEM_maximum_ram_page for aarch32 guests ?
>>>>>
>>>>
>>>> Hence my suggestion to check the return value of _all_ hypercalls to=
 be
>>>> proper sign extended int values for 32-bit guests. This would fix al=
l
>>>> potential issues without silently returning truncated values.
>>>
>>> Are we absolutely certain we have no other paths left where a possibl=
y
>>> large unsigned values might be returned? In fact while
>>> compat_memory_op() does the necessary saturation, I've never been ful=
ly
>>> convinced of this being the best way of dealing with things. The rang=
e
>>> of error indicators is much smaller than [-INT_MIN,-1], so almost
>>> double the range of effectively unsigned values could be passed back
>>> fine. (Obviously we can't change existing interfaces, so this mem-op
>>> will need to remain as is.)
>>
>> In fact libxenctrl tries do deal with this fact by wrapping a memory_o=
p
>> for a 32-bit environment into a multicall. This will work fine for a
>> 32-bit Arm guest, as xen_ulong_t is a uint64 there.
>>
>> So do_memory_op should return long on Arm, yes. OTOH doing so will
>> continue to be a problem in case a 32-bit guest doesn't use the
>> multicall technique for handling possible 64-bit return values.
>>
>> So I continue to argue that on Arm the return value of a hypercall
>> should be tested to fit into 32 bits.=20
>=20
> It would make sense. But what would you return if the value doesn't fit=
?

I guess some errno value would be appropriate, like -EDOM, -ERANGE or
-E2BIG.

>=20
>> The only really clean alternative
>> would be to have separate hypercall function classes for Arm 32- and
>> 64-bit guests (which still could share most of the functions by lettin=
g
>> those return "int"). This would allow to use the 64-bit variant even f=
or
>> 32-bit guests in multicall (fine as the return field is 64-bit wide),
>> and a probably saturating compat version for the 32-bit guest direct
>> hypercall.
>=20
> I am not entirely sure to understand this proposal. Can you clarify it?=


1. In patch 5 modify the hypercall table by adding another column, so
    instead of:
    +table:           pv32     pv64     hvm32    hvm64    arm
    use:
    +table:           pv32     pv64     hvm32    hvm64    arm32    arm64

2. Let most of the hypercalls just return int instead of long:
    +rettype: do int

3. Have an explicit 64-bit variant of memory_op (the 32-bit one is the
    compat variant existing already):
    +rettype: do64 long
    +prefix: do64 PREFIX_hvm
    +memory_op(unsigned long cmd, void *arg)

4. Use the appropriate calls in each column:
    +memory_op         compat   do64     hvm      hvm      compat  do64

5. In the Arm hypercall trap handler do:
    if ( is_32bit_domain(current->domain) )
        call_handlers_arm32(...);
    else
        call_handlers_arm64(...);

6. In the multicall handler always do:
    call_handlers_arm64(...);


Juergen

--------------6C299E3B67F103C2A1546EC0
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

--------------6C299E3B67F103C2A1546EC0--

--fKTrddbMzShsGJXe1srn4K7HK1sHn75es--

--IoDOwhz3q6ZxpmhMJNlX4RzT3LAF6f2Nv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG8cJ0FAwAAAAAACgkQsN6d1ii/Ey9R
xAf+N68tC5wCHVsegfQBmziXerz9AcMzdxZUg8AkNLZ63LitFew02WzCwWNaFc0PpLB4O9q6LjCS
e4prRjZg8EEwClW2iG7tYICYHhQ1Lr/2yeEhcHhJ+9gNCxoRGJaitUyU6SisFPsvhQ4/R2DyUrNP
8oufR614YLIF4sD8dIQ/UGvfeHWNk+VtivKKA9kUN1Nsp1hhtWr55ENWlGqZi/GOZaTxU/vYXdWE
040rn1Tgy9teUscvjejP9X7M4yyLSDJOFvvZMSC93Lb3ZU4nDaGeBBbUCSpCQtXABPNY625+SQIs
+RM8+SK4eigYerK4nG4F1gBm6ETsm/hJ8WOJVvQ3JQ==
=8Cyj
-----END PGP SIGNATURE-----

--IoDOwhz3q6ZxpmhMJNlX4RzT3LAF6f2Nv--

