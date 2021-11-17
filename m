Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D545455C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226736.391912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIlK-0007lc-Fr; Wed, 17 Nov 2021 11:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226736.391912; Wed, 17 Nov 2021 11:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIlK-0007jt-Cg; Wed, 17 Nov 2021 11:05:58 +0000
Received: by outflank-mailman (input) for mailman id 226736;
 Wed, 17 Nov 2021 11:05:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Swqu=QE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mnIlJ-0007jn-6D
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:05:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 561597c9-4796-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 12:05:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B7801FD29;
 Wed, 17 Nov 2021 11:05:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0076113BDD;
 Wed, 17 Nov 2021 11:05:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sJdQOhLilGFYIgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 17 Nov 2021 11:05:54 +0000
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
X-Inumbo-ID: 561597c9-4796-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637147155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yM+TQQJa3NQZ4UutNZgtDAxadzrQBnF7u4I8rifL1A8=;
	b=ogG/KwsEA4hAoxSrTQ5+Xqufr8ARakFYuoGZ4UTOdDnAA2KuBahX6pLd3UIT6gmJEUBpBC
	i/ptleuNk+w9n/hRj324YZesIKF8xNYjk3FZ8KS4D9M1Dd6PzRflzoFrQ+R9uGDaHdtk74
	v1PBQHV4pzIxnR8i+WwLwyD8hdibdSo=
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <20211117095711.26596-2-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 1/2] xen/cpupool: Create different cpupools at boot
 time
Message-ID: <eef43ca6-dce1-9d24-7ee6-7ced8a709f00@suse.com>
Date: Wed, 17 Nov 2021 12:05:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211117095711.26596-2-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6si69ii0rMH9X91Jv7XbStgEM0mIfpi9A"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6si69ii0rMH9X91Jv7XbStgEM0mIfpi9A
Content-Type: multipart/mixed; boundary="dX9muPziiOppkhpMdUXUsVT5hsQIRImod";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <eef43ca6-dce1-9d24-7ee6-7ced8a709f00@suse.com>
Subject: Re: [RFC PATCH 1/2] xen/cpupool: Create different cpupools at boot
 time
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <20211117095711.26596-2-luca.fancellu@arm.com>
In-Reply-To: <20211117095711.26596-2-luca.fancellu@arm.com>

--dX9muPziiOppkhpMdUXUsVT5hsQIRImod
Content-Type: multipart/mixed;
 boundary="------------72FFA587828DECC2EF3CC606"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------72FFA587828DECC2EF3CC606
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.11.21 10:57, Luca Fancellu wrote:
> Introduce an architecture specific way to create different
> cpupool at boot time, this is particularly useful on ARM
> biglittle system where there might be the need to have
> different cpupools for each type of core, but also systems
> using NUMA can have different cpu pool for each node.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/Kconfig       | 15 +++++++
>   xen/arch/arm/Makefile      |  1 +
>   xen/arch/arm/cpupool.c     | 84 +++++++++++++++++++++++++++++++++++++=
+
>   xen/common/sched/cpupool.c |  5 ++-
>   xen/include/xen/cpupool.h  | 30 ++++++++++++++
>   5 files changed, 134 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/arm/cpupool.c
>   create mode 100644 xen/include/xen/cpupool.h
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..4d7cc9f3bc 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -33,6 +33,21 @@ config ACPI
>   	  Advanced Configuration and Power Interface (ACPI) support for Xen =
is
>   	  an alternative to device tree on ARM64.
>  =20
> +config BOOT_TIME_CPUPOOLS
> +	bool "Create cpupools per cpu type at boot time."
> +	depends on ARM
> +	default n
> +	help
> +
> +	  Creates, during boot, a cpu pool for each type of CPU found on
> +	  the system. This option is useful on system with heterogeneous
> +	  types of core.
> +
> +config MAX_BOOT_TIME_CPUPOOLS
> +	depends on BOOT_TIME_CPUPOOLS
> +	int "Maximum number of cpupools that can be created at boot time."
> +	default 16
> +
>   config GICV3
>   	bool "GICv3 driver"
>   	depends on ARM_64 && !NEW_VGIC
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 07f634508e..0bb8b84750 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
>   obj-y +=3D bootfdt.init.o
>   obj-y +=3D cpuerrata.o
>   obj-y +=3D cpufeature.o
> +obj-$(CONFIG_BOOT_TIME_CPUPOOLS) +=3D cpupool.o
>   obj-y +=3D decode.o
>   obj-y +=3D device.o
>   obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
> diff --git a/xen/arch/arm/cpupool.c b/xen/arch/arm/cpupool.c
> new file mode 100644
> index 0000000000..550521e352
> --- /dev/null
> +++ b/xen/arch/arm/cpupool.c
> @@ -0,0 +1,84 @@
> +/*********************************************************************=
*********
> + * cpupool.c
> + *
> + * (C) 2021, arm
> + */
> +
> +#include <xen/cpumask.h>
> +#include <xen/cpupool.h>
> +#include <xen/err.h>
> +#include <xen/sched.h>
> +#include <asm/cpufeature.h>
> +#include <asm/processor.h>
> +#include "../../common/sched/private.h"

No, please don't do that.

You should try to add architecture agnostic service functions in
common/sched/cpupool.c removing the need to include that file here.

> +
> +typedef struct {
> +    register_t     midr;
> +    struct cpupool *pool;
> +} pool_t;
> +
> +static pool_t __initdata pool_cpu_map[CONFIG_MAX_BOOT_TIME_CPUPOOLS];
> +
> +void __init arch_allocate_cpupools(const cpumask_t *cpu_online_map,
> +                                   cpupool_create_t cpupool_create)

Drop the cpupool_create parameter here and ...

> +{
> +    unsigned int cpu, i;
> +
> +    /* First pool is the default pool0 associated with midr of the boo=
t core */
> +    pool_cpu_map[0].midr =3D system_cpuinfo.midr.bits;
> +    pool_cpu_map[0].pool =3D cpupool0;
> +
> +    for_each_cpu ( cpu, cpu_online_map )
> +    {
> +        for ( i =3D 0; i < CONFIG_MAX_BOOT_TIME_CPUPOOLS; i++ )
> +            if ( !pool_cpu_map[i].pool ||
> +                 (cpu_data[cpu].midr.bits =3D=3D pool_cpu_map[i].midr)=
 )
> +                break;
> +
> +        if ( i < CONFIG_MAX_BOOT_TIME_CPUPOOLS )
> +        {
> +            if ( !pool_cpu_map[i].pool )
> +            {
> +                /* There is no pool for this cpu midr, create it */
> +                pool_cpu_map[i].midr =3D cpu_data[cpu].midr.bits;
> +                debugtrace_printk("Create pool %u for cpu MIDR: 0x%"
> +                                  PRIregister"\n", i, pool_cpu_map[i].=
midr);
> +                pool_cpu_map[i].pool =3D
> +                    cpupool_create(i, scheduler_get_default()->sched_i=
d);
> +                BUG_ON(IS_ERR(pool_cpu_map[i].pool));
> +                cpupool_put(pool_cpu_map[i].pool);

=2E.. call a new wrapper in common/sched/cpupool.c taking just the id as
parameter (e.g. "cpupool *cpupool_create_default(unsigned int id)")
which will use the default scheduler and do the cpupool_create() and
cpupool_put() calls internally.

> +            }
> +        }
> +        else
> +            panic("Could not create cpupool, maximum number reached (%=
u)",
> +                  (unsigned int)(CONFIG_MAX_BOOT_TIME_CPUPOOLS));
> +    }
> +
> +    /* Print useful information about the pools */
> +    for ( i =3D 0; i < CONFIG_MAX_BOOT_TIME_CPUPOOLS; i++ )
> +        if ( pool_cpu_map[i].pool )
> +            printk(XENLOG_INFO "Pool-%u contains cpu with MIDR: 0x%"
> +                   PRIregister"\n", i, pool_cpu_map[i].midr);
> +}
> +
> +struct cpupool *__init arch_get_cpupool(unsigned int cpu)
> +{
> +    unsigned int i;
> +
> +    for ( i =3D 0; i < CONFIG_MAX_BOOT_TIME_CPUPOOLS; i++ )
> +        if ( pool_cpu_map[i].pool &&
> +             (cpu_data[cpu].midr.bits =3D=3D pool_cpu_map[i].midr) )
> +            return pool_cpu_map[i].pool;
> +
> +    return cpupool0;
> +}
I don't think this return can be reached.

What about adding an "ASSERT_UNREACHABLE()" here and return NULL instead?=


> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
> index 8c6e6eb9cc..7389f04e28 100644
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -13,6 +13,7 @@
>  =20
>   #include <xen/cpu.h>
>   #include <xen/cpumask.h>
> +#include <xen/cpupool.h>
>   #include <xen/guest_access.h>
>   #include <xen/hypfs.h>
>   #include <xen/init.h>
> @@ -1231,12 +1232,14 @@ static int __init cpupool_init(void)
>       cpupool_put(cpupool0);
>       register_cpu_notifier(&cpu_nfb);
>  =20
> +    arch_allocate_cpupools(&cpu_online_map, cpupool_create);
> +
>       spin_lock(&cpupool_lock);
>  =20
>       cpumask_copy(&cpupool_free_cpus, &cpu_online_map);
>  =20
>       for_each_cpu ( cpu, &cpupool_free_cpus )
> -        cpupool_assign_cpu_locked(cpupool0, cpu);
> +        cpupool_assign_cpu_locked(arch_get_cpupool(cpu), cpu);
>  =20
>       spin_unlock(&cpupool_lock);
>  =20
> diff --git a/xen/include/xen/cpupool.h b/xen/include/xen/cpupool.h
> new file mode 100644
> index 0000000000..4b50af9e3d
> --- /dev/null
> +++ b/xen/include/xen/cpupool.h
> @@ -0,0 +1,30 @@
> +#ifndef __XEN_CPUPOOL_H
> +#define __XEN_CPUPOOL_H
> +
> +#include <xen/sched.h>
> +
> +typedef struct cpupool* (*cpupool_create_t)(unsigned int, unsigned int=
);
> +
> +#ifdef CONFIG_BOOT_TIME_CPUPOOLS
> +
> +void arch_allocate_cpupools(const cpumask_t *cpu_online_map,
> +                            cpupool_create_t cpupool_create);
> +
> +struct cpupool *arch_get_cpupool(unsigned int cpu);
> +
> +#else
> +
> +static inline __init
> +void arch_allocate_cpupools(const cpumask_t *cpu_online_map,
> +                            cpupool_create_t cpupool_create)
> +{
> +}
> +
> +static inline struct cpupool *__init arch_get_cpupool(unsigned int cpu=
)
> +{
> +    return cpupool0;
> +}
> +
> +#endif
> +
> +#endif /* __XEN_CPUPOOL_H */
>=20

I think this can all go into include/xen/sched.h.


Juergen

--------------72FFA587828DECC2EF3CC606
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

--------------72FFA587828DECC2EF3CC606--

--dX9muPziiOppkhpMdUXUsVT5hsQIRImod--

--6si69ii0rMH9X91Jv7XbStgEM0mIfpi9A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGU4hIFAwAAAAAACgkQsN6d1ii/Ey9o
FAf9Ex0vrhykdvSCn+DIbPmAvnEKMOgpncg+X4LTfY2eWkXd3/WhgxwNsAAjZpNF57VeymSza4R5
IXCUf8nMR3u/osegB0lIsK9nzB1EZElH24IgLz0MK2LfV5ma/nFltVKvhGkeUvmIMm9PQs3p3ibl
5aoyujhTLBAAikIb8EeI/c5W+JjUycjYAPSSEBG/DPKQ/+qEJRMicpbPeFEU1ges0O4gtgzq68oa
mxXVTJSFZ+vVbjh+ur1QgNJWuNjwCCyB8VoCY4YVkcDsB28a8PMpKz5xc1qocUs9tA25o5oNDO5g
rCaWQcmkbtiNpRaiDmq7eu7WVio3tLZQhsGj92h2pQ==
=1rwx
-----END PGP SIGNATURE-----

--6si69ii0rMH9X91Jv7XbStgEM0mIfpi9A--

