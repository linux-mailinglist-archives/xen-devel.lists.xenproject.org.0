Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F66A43E3CC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 16:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218110.378419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg6Sa-0002iF-6F; Thu, 28 Oct 2021 14:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218110.378419; Thu, 28 Oct 2021 14:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg6Sa-0002gS-2z; Thu, 28 Oct 2021 14:32:52 +0000
Received: by outflank-mailman (input) for mailman id 218110;
 Thu, 28 Oct 2021 14:32:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfrR=PQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mg6SY-0002gM-OP
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 14:32:50 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fe34b82-edda-4c31-82b5-e264a555ac21;
 Thu, 28 Oct 2021 14:32:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 80F70218A9;
 Thu, 28 Oct 2021 14:32:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5859713E9D;
 Thu, 28 Oct 2021 14:32:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OCddFJC0emFAHwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Oct 2021 14:32:48 +0000
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
X-Inumbo-ID: 8fe34b82-edda-4c31-82b5-e264a555ac21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635431568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hV0aji8Xm0Y3NQ8V/Q2GT040OXgKsgKtfYIluob1gto=;
	b=C9TBG1FR5q5LUh/IhECIcWh0Yon6Hhp1B6JkQKRG4bSj27Yz1UI9JmPhjlqmqbGLgT6rCf
	d7DineDy9aVIT7+3eiykMFvw7meVR8nPE/yOguQbSxYJBv/4EfPKbLWfnkjrJQEHuCGB+1
	bNiCFGdRKgtf3+hXO3RYKltRDSMbBZY=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-11-jgross@suse.com>
 <88c3d815-912c-a92c-2e96-7eff6a454a75@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 10/12] xen/x86: call hypercall handlers via switch
 statement
Message-ID: <1ab4b64f-720c-4f9a-043b-eefc5f6c387e@suse.com>
Date: Thu, 28 Oct 2021 16:32:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <88c3d815-912c-a92c-2e96-7eff6a454a75@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7cG2FgSE4RgsDyogCrwlNbbcVVSFi5EqW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7cG2FgSE4RgsDyogCrwlNbbcVVSFi5EqW
Content-Type: multipart/mixed; boundary="MqJMvy4m2NmcYWeGVGFjuyoD71HE6JLXC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <1ab4b64f-720c-4f9a-043b-eefc5f6c387e@suse.com>
Subject: Re: [PATCH 10/12] xen/x86: call hypercall handlers via switch
 statement
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-11-jgross@suse.com>
 <88c3d815-912c-a92c-2e96-7eff6a454a75@suse.com>
In-Reply-To: <88c3d815-912c-a92c-2e96-7eff6a454a75@suse.com>

--MqJMvy4m2NmcYWeGVGFjuyoD71HE6JLXC
Content-Type: multipart/mixed;
 boundary="------------DC02056F439CAFA9B34248DA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------DC02056F439CAFA9B34248DA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.10.21 16:41, Jan Beulich wrote:
> On 15.10.2021 14:51, Juergen Gross wrote:
>> Instead of using a function table use the generated switch statement
>> macros for calling the appropriate hypercall handlers.
>>
>> This is beneficial to performance and avoids speculation issues.
>>
>> With calling the handlers using the correct number of parameters now
>> it is possible to do the parameter register clobbering in the NDEBUG
>> case after returning from the handler. This in turn removes the only
>> users of hypercall_args_table[] which can be removed now.
>=20
> "removed" reads misleading to me: You really replace it by new tables,
> using script-generated initializers. Also it looks like you're doubling=

> the data, as the same sets were previously used by pv64/hvm64 and
> pv32/hvm32 respectively.

Yes, I'll change that paragraph.

Regarding having 4 tables on x86 now: merging the pv/hvm tables would be
possible, but this would add some complexity to the script generating
the tables (it should test whether the number of parameters of pv and
hvm match). As the tables are present in debug build only I don't think
this is a real issue.

>=20
>> --- a/xen/arch/x86/hvm/hypercall.c
>> +++ b/xen/arch/x86/hvm/hypercall.c
>> @@ -108,56 +108,10 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PA=
RAM(void) arg)
>>           return compat_physdev_op(cmd, arg);
>>   }
>>  =20
>> -#define HYPERCALL(x)                                         \
>> -    [ __HYPERVISOR_ ## x ] =3D { (hypercall_fn_t *) do_ ## x,  \
>> -                               (hypercall_fn_t *) do_ ## x }
>> -
>> -#define HVM_CALL(x)                                          \
>> -    [ __HYPERVISOR_ ## x ] =3D { (hypercall_fn_t *) hvm_ ## x, \
>> -                               (hypercall_fn_t *) hvm_ ## x }
>> -
>> -#define COMPAT_CALL(x)                                       \
>> -    [ __HYPERVISOR_ ## x ] =3D { (hypercall_fn_t *) do_ ## x,  \
>> -                               (hypercall_fn_t *) compat_ ## x }
>> -
>> -static const struct {
>> -    hypercall_fn_t *native, *compat;
>> -} hvm_hypercall_table[] =3D {
>> -    HVM_CALL(memory_op),
>> -    COMPAT_CALL(multicall),
>> -#ifdef CONFIG_GRANT_TABLE
>> -    HVM_CALL(grant_table_op),
>> -#endif
>> -    HYPERCALL(vm_assist),
>> -    COMPAT_CALL(vcpu_op),
>> -    HVM_CALL(physdev_op),
>> -    COMPAT_CALL(xen_version),
>> -    HYPERCALL(console_io),
>> -    HYPERCALL(event_channel_op),
>> -    COMPAT_CALL(sched_op),
>> -    COMPAT_CALL(set_timer_op),
>> -    COMPAT_CALL(xsm_op),
>> -    HYPERCALL(hvm_op),
>> -    HYPERCALL(sysctl),
>> -    HYPERCALL(domctl),
>> -#ifdef CONFIG_ARGO
>> -    COMPAT_CALL(argo_op),
>> -#endif
>> -    COMPAT_CALL(platform_op),
>> -#ifdef CONFIG_PV
>> -    COMPAT_CALL(mmuext_op),
>> -#endif
>> -    HYPERCALL(xenpmu_op),
>> -    COMPAT_CALL(dm_op),
>> -#ifdef CONFIG_HYPFS
>> -    HYPERCALL(hypfs_op),
>> +#ifndef NDEBUG
>> +static unsigned char hypercall_args_64[] =3D hypercall_args_hvm64;
>> +static unsigned char hypercall_args_32[] =3D hypercall_args_hvm32;
>=20
> Irrespective of this being debugging-only: Const?

Yes.

>=20
>> @@ -239,33 +176,11 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>>           HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%lx, %lx, %lx, %lx, %=
lx)",
>>                       eax, rdi, rsi, rdx, r10, r8);
>>  =20
>> -#ifndef NDEBUG
>> -        /* Deliberately corrupt parameter regs not used by this hyper=
call. */
>> -        switch ( hypercall_args_table[eax].native )
>> -        {
>> -        case 0: rdi =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> -        case 1: rsi =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> -        case 2: rdx =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> -        case 3: r10 =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> -        case 4: r8 =3D 0xdeadbeefdeadf00dUL;
>> -        }
>> -#endif
>> -
>> -        regs->rax =3D hvm_hypercall_table[eax].native(rdi, rsi, rdx, =
r10, r8);
>> +        call_handlers_hvm64(eax, regs->rax, rdi, rsi, rdx, r10, r8);
>>  =20
>>   #ifndef NDEBUG
>> -        if ( !curr->hcall_preempted )
>> -        {
>> -            /* Deliberately corrupt parameter regs used by this hyper=
call. */
>> -            switch ( hypercall_args_table[eax].native )
>> -            {
>> -            case 5: regs->r8  =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> -            case 4: regs->r10 =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> -            case 3: regs->rdx =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> -            case 2: regs->rsi =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> -            case 1: regs->rdi =3D 0xdeadbeefdeadf00dUL;
>> -            }
>> -        }
>> +        if ( !curr->hcall_preempted && regs->rax !=3D -ENOSYS )
>> +            clobber_regs(regs, hypercall_args_64[eax]);
>=20
> I'm not fundamentally opposed, but sadly -ENOSYS comes back also in und=
ue
> situations, e.g. various hypercalls still produce this for "unknown
> sub-function". Hence the weakened clobbering wants at least mentioning,=

> perhaps also justifying, in the description.

Okay.

>=20
>> @@ -55,4 +42,34 @@ compat_common_vcpu_op(
>>  =20
>>   #endif /* CONFIG_COMPAT */
>>  =20
>> +#ifndef NDEBUG
>=20
> Hmm, I was actuall hoping for the conditional to actually live ...
>=20
>> +static inline void clobber_regs(struct cpu_user_regs *regs,
>> +                                unsigned int nargs)
>> +{
>=20
> ... here and ...
>=20
>> +    /* Deliberately corrupt used parameter regs. */
>> +    switch ( nargs )
>> +    {
>> +    case 5: regs->r8  =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> +    case 4: regs->r10 =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> +    case 3: regs->rdx =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> +    case 2: regs->rsi =3D 0xdeadbeefdeadf00dUL; fallthrough;
>> +    case 1: regs->rdi =3D 0xdeadbeefdeadf00dUL;
>> +    }
>> +}
>> +
>> +static inline void clobber_regs32(struct cpu_user_regs *regs,
>> +                                  unsigned int nargs)
>> +{
>=20
> ... here, such that the conditionals in the .c files could go away
> altogether.

I didn't do that in order to be able to have the tables with the
number of parameters inside #ifndef NDEBUG sections.

I think I can change that by using a macro for reading the table
values.

>=20
>> +    /* Deliberately corrupt used parameter regs. */
>> +    switch ( nargs )
>> +    {
>> +    case 5: regs->edi =3D 0xdeadf00dUL; fallthrough;
>> +    case 4: regs->esi =3D 0xdeadf00dUL; fallthrough;
>> +    case 3: regs->edx =3D 0xdeadf00dUL; fallthrough;
>> +    case 2: regs->ecx =3D 0xdeadf00dUL; fallthrough;
>> +    case 1: regs->ebx =3D 0xdeadf00dUL;
>=20
> No need for the UL suffixes here afaics; U ones may want to be there.

Okay.

> Overall, besides these mainly cosmetic aspects the main thing missing
> is an approach to prioritize the handful most frequently used functions=
,
> for them to be pulled out of the switch() so we don't depend on the
> compiler's choice for the order of comparisons done.

I have already prepared that step by generating the complete call
sequence, so any change for prioritizing some hypercalls can be local to
the generator script and the used input data.

The main question is how to do that. I've collected some hypercall
statistics data for PV and PVH guests running some simple tests (once a
build of the Xen hypervisor, and once a scp of a large file). The data
is split between guest and dom0 (PV) counts. There is no clear "winner"
which hypercall should be fastest, but several hypercalls are clearly
not important.

Here is the data:

PV-hypercall    PV-guest build   PV-guest scp    dom0 build     dom0 scp
mmu_update           186175729           2865         20936        33725
stack_switch           1273311          62381        108589       270764
multicall              2182803             50           302          524
update_va_mapping       571868             10            60           80
xen_version              73061            850           859         5432
grant_table_op               0              0         35557       139110
iret                  75673006         484132        268157       757958
vcpu_op                 453037          71199        138224       334988
set_segment_base       1650249          62387        108645       270823
mmuext_op             11225681            188          7239         3426
sched_op                280153         134645         70729       137943
event_channel_op        192327          66204         71409       214191
physdev_op                   0              0          7721         4315
(the dom0 values are for the guest running the build or scp test, so
dom0 acting as backend)

HVM-hypercall   PVH-guest build    PVH-guest scp
vcpu_op                  277684             2324
event_channel_op         350233            57383
(the related dom0 counter values are in the same range as with the test
running in the PV guest)

It should be noted that during boot of the guests the numbers for the PV
guest are more like the ones for the build test with the exception of
iret and sched_op being higher, while for PVH sched_op is by far the
most often used hypercall.

I'm not sure how to translate those numbers into a good algorithm for
generating the call sequence.

I could add priorities to each hypercall in hypercall-defs.c and have a
cascade of if (likely(foo)) call_foo; else if (likely(bla)) ... else
switch(rest).

Or I could have groups of hypercalls with a priority for each group and:

mask =3D 1ULL << num;
if (likely(mask & prio_1_mask)) switch(num) ...
else if (likely(mask & prio_2_mask)) switch (num) ...
=2E..
else switch (num) ...

Or I could combine those approaches using the mask variant for cases of
multiple entries having the same priority and the direct call variant
for the cases of only a single entry having a specific priority.

And then there is the problem to set the priorities (fairly simple for
HVM, PV is more diffcult).


Juergen

--------------DC02056F439CAFA9B34248DA
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

--------------DC02056F439CAFA9B34248DA--

--MqJMvy4m2NmcYWeGVGFjuyoD71HE6JLXC--

--7cG2FgSE4RgsDyogCrwlNbbcVVSFi5EqW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmF6tI8FAwAAAAAACgkQsN6d1ii/Ey/B
0Qf+Me8eWhB5u72RWK3P0oSkzd2Zdt6ZCrKCWBagKvPXOsmAgTTeiW1q1UnxDxZEOm6ZmxhhVY5U
CXe+kleiHbwQd5aEL1Nz+ef7SCEgOShI+H6SznTkh+exe8hvg7299HhAlkKlyrZDuXv2eFvW5iZm
fatlCCr5WRrSDS/hPZD5zdoXnQM4LtEmxAHTr1gzM5GIeCVvpXElBbENEL/kUAp3rVygmMb0erfy
TDHv2SilQ1xnljDpfhOghiHPjqZ73uXl6WzhiBf83aDy1pbmce7BKv2ctoWoa8uverZh/+OJ9y7M
wkA/Qn6VDL/kG+YEYOi18d7xWw99UmUt4UUQN9ZrGg==
=b9KM
-----END PGP SIGNATURE-----

--7cG2FgSE4RgsDyogCrwlNbbcVVSFi5EqW--

