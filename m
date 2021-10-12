Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A027942A051
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206947.362645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDSr-00017R-3u; Tue, 12 Oct 2021 08:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206947.362645; Tue, 12 Oct 2021 08:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDSr-000159-01; Tue, 12 Oct 2021 08:48:49 +0000
Received: by outflank-mailman (input) for mailman id 206947;
 Tue, 12 Oct 2021 08:48:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xSmm=PA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1maDSp-00014x-9W
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 08:48:47 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63b71ba4-e2eb-4760-8809-e28a8837e41c;
 Tue, 12 Oct 2021 08:48:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 70AF32018C;
 Tue, 12 Oct 2021 08:48:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 05920132D4;
 Tue, 12 Oct 2021 08:48:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yUgdAO1LZWERUwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 12 Oct 2021 08:48:45 +0000
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
X-Inumbo-ID: 63b71ba4-e2eb-4760-8809-e28a8837e41c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634028525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q3KUcXkQJ10FRCj4YgZOCN8rFwXTQD7vMOH9ik9p7iA=;
	b=sffvnVCB3QQpIpRny0e7FcxRcmpQxsvWaFUCOBST3H+ud49L5hRYNM+aVaQgL57tjSvpjB
	byOEVLiToOADDY50a4JDCeRMv0UyxRC7Z+sqmHkPTitdCKEh9EJGVcAxUR+dpWoUpnszDf
	/GiwMMbQcoOjMbS5bC8ueMd5W5DNqbQ=
Subject: Re: [PATCH linux 1/2] xen: delay xen_hvm_init_time_ops() if kdump is
 boot on vcpu>=32
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 iwj@xenproject.org, jbeulich@suse.com, julien@xen.org, wl@xen.org,
 joe.jin@oracle.com
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
 <20211012072428.2569-2-dongli.zhang@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c58fe0bb-d1be-4dac-acf1-040cceb1271a@suse.com>
Date: Tue, 12 Oct 2021 10:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211012072428.2569-2-dongli.zhang@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MqMswA9vGM6pPMxHJ3Nj3XxEnoTGHrXao"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MqMswA9vGM6pPMxHJ3Nj3XxEnoTGHrXao
Content-Type: multipart/mixed; boundary="5J4vDOXKh5d9mCnHws61KPXU9QUYI7STa";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 iwj@xenproject.org, jbeulich@suse.com, julien@xen.org, wl@xen.org,
 joe.jin@oracle.com
Message-ID: <c58fe0bb-d1be-4dac-acf1-040cceb1271a@suse.com>
Subject: Re: [PATCH linux 1/2] xen: delay xen_hvm_init_time_ops() if kdump is
 boot on vcpu>=32
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
 <20211012072428.2569-2-dongli.zhang@oracle.com>
In-Reply-To: <20211012072428.2569-2-dongli.zhang@oracle.com>

--5J4vDOXKh5d9mCnHws61KPXU9QUYI7STa
Content-Type: multipart/mixed;
 boundary="------------4AF84FE6AF4427206B1EC4B0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4AF84FE6AF4427206B1EC4B0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.10.21 09:24, Dongli Zhang wrote:
> The sched_clock() can be used very early since upstream
> commit 857baa87b642 ("sched/clock: Enable sched clock early"). In addit=
ion,
> with upstream commit 38669ba205d1 ("x86/xen/time: Output xen sched_cloc=
k
> time from 0"), kdump kernel in Xen HVM guest may panic at very early st=
age
> when accessing &__this_cpu_read(xen_vcpu)->time as in below:
>=20
> setup_arch()
>   -> init_hypervisor_platform()
>       -> x86_init.hyper.init_platform =3D xen_hvm_guest_init()
>           -> xen_hvm_init_time_ops()
>               -> xen_clocksource_read()
>                   -> src =3D &__this_cpu_read(xen_vcpu)->time;
>=20
> This is because Xen HVM supports at most MAX_VIRT_CPUS=3D32 'vcpu_info'=

> embedded inside 'shared_info' during early stage until xen_vcpu_setup()=
 is
> used to allocate/relocate 'vcpu_info' for boot cpu at arbitrary address=
=2E
>=20
> However, when Xen HVM guest panic on vcpu >=3D 32, since
> xen_vcpu_info_reset(0) would set per_cpu(xen_vcpu, cpu) =3D NULL when
> vcpu >=3D 32, xen_clocksource_read() on vcpu >=3D 32 would panic.
>=20
> This patch delays xen_hvm_init_time_ops() to later in
> xen_hvm_smp_prepare_boot_cpu() after the 'vcpu_info' for boot vcpu is
> registered when the boot vcpu is >=3D 32.
>=20
> This issue can be reproduced on purpose via below command at the guest
> side when kdump/kexec is enabled:
>=20
> "taskset -c 33 echo c > /proc/sysrq-trigger"
>=20
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>   arch/x86/xen/enlighten_hvm.c | 20 +++++++++++++++++++-
>   arch/x86/xen/smp_hvm.c       |  3 +++
>   2 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.=
c
> index e68ea5f4ad1c..152279416d9a 100644
> --- a/arch/x86/xen/enlighten_hvm.c
> +++ b/arch/x86/xen/enlighten_hvm.c
> @@ -216,7 +216,25 @@ static void __init xen_hvm_guest_init(void)
>   	WARN_ON(xen_cpuhp_setup(xen_cpu_up_prepare_hvm, xen_cpu_dead_hvm));
>   	xen_unplug_emulated_devices();
>   	x86_init.irqs.intr_init =3D xen_init_IRQ;
> -	xen_hvm_init_time_ops();
> +
> +	/*
> +	 * Only MAX_VIRT_CPUS 'vcpu_info' are embedded inside 'shared_info'
> +	 * and the VM would use them until xen_vcpu_setup() is used to
> +	 * allocate/relocate them at arbitrary address.
> +	 *
> +	 * However, when Xen HVM guest panic on vcpu >=3D MAX_VIRT_CPUS,
> +	 * per_cpu(xen_vcpu, cpu) is still NULL at this stage. To access
> +	 * per_cpu(xen_vcpu, cpu) via xen_clocksource_read() would panic.
> +	 *
> +	 * Therefore we delay xen_hvm_init_time_ops() to
> +	 * xen_hvm_smp_prepare_boot_cpu() when boot vcpu is >=3D MAX_VIRT_CPU=
S.
> +	 */
> +	if (xen_vcpu_nr(0) >=3D MAX_VIRT_CPUS)
> +		pr_info("Delay xen_hvm_init_time_ops() as kernel is running on vcpu=3D=
%d\n",
> +			xen_vcpu_nr(0));
> +	else
> +		xen_hvm_init_time_ops();
> +
>   	xen_hvm_init_mmu_ops();
>  =20
>   #ifdef CONFIG_KEXEC_CORE
> diff --git a/arch/x86/xen/smp_hvm.c b/arch/x86/xen/smp_hvm.c
> index 6ff3c887e0b9..60cd4fafd188 100644
> --- a/arch/x86/xen/smp_hvm.c
> +++ b/arch/x86/xen/smp_hvm.c
> @@ -19,6 +19,9 @@ static void __init xen_hvm_smp_prepare_boot_cpu(void)=

>   	 */
>   	xen_vcpu_setup(0);
>  =20
> +	if (xen_vcpu_nr(0) >=3D MAX_VIRT_CPUS)
> +		xen_hvm_init_time_ops();
> +

Please add a comment referencing the related code in
xen_hvm_guest_init().


Juergen

--------------4AF84FE6AF4427206B1EC4B0
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

--------------4AF84FE6AF4427206B1EC4B0--

--5J4vDOXKh5d9mCnHws61KPXU9QUYI7STa--

--MqMswA9vGM6pPMxHJ3Nj3XxEnoTGHrXao
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFlS+wFAwAAAAAACgkQsN6d1ii/Ey96
Fgf/cUeloFlsH/cedS7E2oehk/aXw62ESyjJVfKjNl9tW7JE6CX0NxvqARl4VepSr/Tk4k7LZc88
75QR6XX+pGqB1jX+zIy6tXKuK48yi1tBwkFsLSn11FJ0yV+g+084fTDw48TwxolaSLV2J8ev4YKR
Ny+KDA+FokyXtdzHt363NFj3cafY+f0PuXISN4sLOkQhRs//ZcAnaLwvclmoUsrlyO25LTk5fL6N
zeg/ryClEy5zMHy14Df9pXEA5NQuh+7rohYTH2virh+w4487Id/i54Pd6SzK0LNWoMJcKy1UE0f2
mtco8lWymvneU+91zgTtCVwkU9AqiY6KOAj/lUlTaw==
=xKpQ
-----END PGP SIGNATURE-----

--MqMswA9vGM6pPMxHJ3Nj3XxEnoTGHrXao--

