Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC6C4130ED
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 11:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191614.341698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mScNw-00016P-JS; Tue, 21 Sep 2021 09:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191614.341698; Tue, 21 Sep 2021 09:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mScNw-00014G-FZ; Tue, 21 Sep 2021 09:48:20 +0000
Received: by outflank-mailman (input) for mailman id 191614;
 Tue, 21 Sep 2021 09:48:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x95K=OL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mScNv-00014A-QG
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 09:48:19 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5981b4f1-ee6a-4685-8616-83124753625e;
 Tue, 21 Sep 2021 09:48:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5BD2F220BA;
 Tue, 21 Sep 2021 09:48:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E18313BC1;
 Tue, 21 Sep 2021 09:48:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z/0YBmGqSWFMSgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Sep 2021 09:48:17 +0000
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
X-Inumbo-ID: 5981b4f1-ee6a-4685-8616-83124753625e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632217697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khBP5Zy8ajCKmjZXYuuEWqwWY+FnzYb7goWddflULL4=;
	b=uP0bDIOa1vdrFWX5tbC1ORxxW51mcw2hGcNfCafYyxL/4phrpIpbDaUInwwT+m9Qb5c/g9
	bdwZ/E5pumq/H7R+NyM4nUxC77hNQT7OZKFdxCX2ZHk8amZT7P8pMwQB4Q4b7ulZwvxB70
	GmD8u9B1fmZutBjndtKoMIscvn+Pz4Y=
To: Peter Zijlstra <peterz@infradead.org>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20210921070226.32021-1-jgross@suse.com>
 <YUmXdEGhgEoukk80@hirez.programming.kicks-ass.net>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen: remove unneeded preempt_disable() from
 xen_irq_enable()
Message-ID: <f1e90e32-e6b0-ee50-0687-fce941a5f267@suse.com>
Date: Tue, 21 Sep 2021 11:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YUmXdEGhgEoukk80@hirez.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Vh7Yxb9qoqtYbSyuCWcNvkXyPfc6kq7dc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Vh7Yxb9qoqtYbSyuCWcNvkXyPfc6kq7dc
Content-Type: multipart/mixed; boundary="05v0w8Smqz5QkDQaHGDvhROvgr5dsKewm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <f1e90e32-e6b0-ee50-0687-fce941a5f267@suse.com>
Subject: Re: [PATCH] x86/xen: remove unneeded preempt_disable() from
 xen_irq_enable()
References: <20210921070226.32021-1-jgross@suse.com>
 <YUmXdEGhgEoukk80@hirez.programming.kicks-ass.net>
In-Reply-To: <YUmXdEGhgEoukk80@hirez.programming.kicks-ass.net>

--05v0w8Smqz5QkDQaHGDvhROvgr5dsKewm
Content-Type: multipart/mixed;
 boundary="------------378369EEDDCE49808EB6A815"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------378369EEDDCE49808EB6A815
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.09.21 10:27, Peter Zijlstra wrote:
> On Tue, Sep 21, 2021 at 09:02:26AM +0200, Juergen Gross wrote:
>> Disabling preemption in xen_irq_enable() is not needed. There is no
>> risk of missing events due to preemption, as preemption can happen
>> only in case an event is being received, which is just the opposite
>> of missing an event.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   arch/x86/xen/irq.c | 18 +++++++-----------
>>   1 file changed, 7 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/x86/xen/irq.c b/arch/x86/xen/irq.c
>> index dfa091d79c2e..ba9b14a97109 100644
>> --- a/arch/x86/xen/irq.c
>> +++ b/arch/x86/xen/irq.c
>> @@ -57,24 +57,20 @@ asmlinkage __visible void xen_irq_enable(void)
>>   {
>>   	struct vcpu_info *vcpu;
>>  =20
>> -	/*
>> -	 * We may be preempted as soon as vcpu->evtchn_upcall_mask is
>> -	 * cleared, so disable preemption to ensure we check for
>> -	 * events on the VCPU we are still running on.
>> -	 */
>> -	preempt_disable();
>> -
>>   	vcpu =3D this_cpu_read(xen_vcpu);
>>   	vcpu->evtchn_upcall_mask =3D 0;
>>  =20
>> -	/* Doesn't matter if we get preempted here, because any
>> -	   pending event will get dealt with anyway. */
>> +	/*
>> +	 * Now preemption could happen, but this is only possible if an even=
t
>> +	 * was handled, so missing an event due to preemption is not
>> +	 * possible at all.
>> +	 * The worst possible case is to be preempted and then check events
>> +	 * pending on the old vcpu, but this is not problematic.
>> +	 */
>>  =20
>>   	barrier(); /* unmask then check (avoid races) */
>>   	if (unlikely(vcpu->evtchn_upcall_pending))
>>   		xen_force_evtchn_callback();
>> -
>> -	preempt_enable();
>>   }
>>   PV_CALLEE_SAVE_REGS_THUNK(xen_irq_enable);
>>  =20
>> --=20
>> 2.26.2
>>
>=20
> So the reason I asked about this is:
>=20
>    vmlinux.o: warning: objtool: xen_irq_disable()+0xa: call to preempt_=
count_add() leaves .noinstr.text section
>    vmlinux.o: warning: objtool: xen_irq_enable()+0xb: call to preempt_c=
ount_add() leaves .noinstr.text section
>=20
> as reported by sfr here:
>=20
>    https://lkml.kernel.org/r/20210920113809.18b9b70c@canb.auug.org.au
>=20
> (I'm still not entirely sure why I didn't see them in my build, or why
> 0day didn't either)
>=20
> Anyway, I can 'fix' xen_irq_disable(), see below, but I'm worried about=

> that still having a hole vs the preempt model. Consider:
>=20
> xen_irq_disable()
>    preempt_disable();
>    <IRQ>
>      set_tif_need_resched()
>    </IRQ no preemption because preempt_count!=3D0>
>    this_cpu_read(xen_vcpu)->evtchn_upcall_mask =3D 1; // IRQs are actua=
lly disabled
>    preempt_enable_no_resched(); // can't resched because IRQs are disab=
led
>=20
>    ...
>=20
> xen_irq_enable()
>    preempt_disable();
>    vcpu->evtch_upcall_mask =3D 0; // IRQs are on
>    preempt_enable() // catches the resched from above
>=20
>=20
> Now your patch removes that preempt_enable() and we'll have a missing
> preemption.
>=20
> Trouble is, because this is noinstr, we can't do schedule().. catch-22

I think it is even worse. Looking at xen_save_fl() there is clearly
a missing preempt_disable().

But I think this all can be resolved by avoiding the need of disabling
preemption in those calls (xen_save_fl(), xen_irq_disable() and
xen_irq_enable()).

Right now disabling preemption is needed, because the flag to be tested
or modified is reached via a pointer (xen_vcpu) stored in the percpu
area. Looking where it might point to reveals the target address is
either an array indexed by smp_processor_id() or a percpu variable of
the local cpu (xen_vcpu_info).

Nowadays (since Xen 3.4, which is older than our minimal supported Xen
version) the array indexed by smp_processor_id() is used only during
early boot (interrupts are always off, only boot cpu is running) and
just after coming back from suspending the system (e.g. when being
live migrated). Early boot should be no problem, and the suspend case
isn't either, as that is happening under control of stop_machine()
(interrupts off on all cpus).

So I think I can switch the whole mess to only need to work on the
local percpu xen_vcpu_info instance, which will access always the
"correct" area via %gs.

Let me have a try ...


Juergen

--------------378369EEDDCE49808EB6A815
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

--------------378369EEDDCE49808EB6A815--

--05v0w8Smqz5QkDQaHGDvhROvgr5dsKewm--

--Vh7Yxb9qoqtYbSyuCWcNvkXyPfc6kq7dc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFJqmAFAwAAAAAACgkQsN6d1ii/Ey8H
vAf/WNiR0DBxKqcEH+SPala7BeDu0AfOvpBXrSZ/mgLNOb5ztfLP0ShNfDx1uL7fQTofiHwhKsgz
rOCQ1ymAkpwVGtziFVKYCkNdksGqFHaCLboaopdrAnuRiCJNgVpwAJ1tuJu/goVuz5UN7WiIT1+/
vxsioI0uFQUlG3p+L5OJWrGjeoMlOez0VZhRzQ63XZ2+kzkkGdU2YCT2FZeCWpZsqHT74m+E1157
Rwk1oxEjIg8H5GBdij/71nj1hd5VZKPcnuiZYqyBhQ9L2gDeBX0DzT6JHJPXJyBtKYqDavOX2uUe
rZkl9UFUhF2c2iqlKa94BEwXzN6U58JHEEZGos0Xyg==
=XCVu
-----END PGP SIGNATURE-----

--Vh7Yxb9qoqtYbSyuCWcNvkXyPfc6kq7dc--

