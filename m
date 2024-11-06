Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16719BF112
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 16:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831191.1246383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hYR-0005Dg-26; Wed, 06 Nov 2024 15:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831191.1246383; Wed, 06 Nov 2024 15:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hYQ-0005Bf-Vi; Wed, 06 Nov 2024 15:02:42 +0000
Received: by outflank-mailman (input) for mailman id 831191;
 Wed, 06 Nov 2024 15:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bDCL=SB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8hYP-0005BZ-Gr
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 15:02:41 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28236dfe-9c50-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 16:02:35 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a99eb8b607aso890715766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 07:02:35 -0800 (PST)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16a2e91sm296077866b.26.2024.11.06.07.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 07:02:33 -0800 (PST)
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
X-Inumbo-ID: 28236dfe-9c50-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI4MjM2ZGZlLTljNTAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTA1MzU1LjgyNTA0OSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730905355; x=1731510155; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYQnvUg8qXmqxZhe4pOZg0z4JIsPnilcJseYQw9ea+4=;
        b=PKj4XJOIxlm+MFpuH96hH3euls9klIItIdFbDSbYccX1FDuzgVsChCd2uDKsb5djvM
         /QEpHtcQcbzax0XsYzErAdC5suDgDlZtuZtG8y4gwwpuTyE1QPqpre8wISxCl2EjxYDw
         X+y4S8r521rhF2PWEJZkseZH+dfZZNU5mhwxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730905355; x=1731510155;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MYQnvUg8qXmqxZhe4pOZg0z4JIsPnilcJseYQw9ea+4=;
        b=jqRJhbxF5lDoN/49cosht5peEjdFfwKykcAyevmzaqWJt+lpWeyvku53nKwH1Nybd5
         /cj6lA72s9i1eE3Hr4nUEyqb2nAecf+h03bEO97CwmHi78CNkkll6nW2PyKeAOyeX+qg
         +1BfOfB4kQZXw4X7Pez0Au88gb+tiQNj6D3kzXP6HqR500U3KPmIvFdCQL9gUfMBhpqB
         ib8RZdrW2m6xDHUfaIxhA7z7pHAkQmqQKL0kESzkFEbb5xkZbvRyqAtmpctRc7O6Krma
         QUQjR69U5rmZ2+P861JZXii4t+b6bMP31dlccsq6sYn9j+yplGkH5b4B2w5tb7KZq4Ra
         qCKg==
X-Forwarded-Encrypted: i=1; AJvYcCVHC+n9lEA/Q8UZBMYUNEt8sMYeAU11d+ikfFgpMVC/dk0ULo6KEYi0LjzQqdHML0grBpfr1Dd/xI0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKcSe07c7BHVriN5/hO5boYGMucwallVnXts8x6yXW5R7RQgqj
	cq55qB0xFhZ0Qob2SsnP4qSu7wh+19SModDoij8zXdQfrZxya1I3XM6YFRvuJmA=
X-Google-Smtp-Source: AGHT+IGsMslr/DP7vLv8ZqbYWDljs+y+FwqJPeYKz5O+f2AsWvem7B9bwuuEByoKAoDkZeAXy9Xw9A==
X-Received: by 2002:a17:907:2d28:b0:a9e:c442:2c15 with SMTP id a640c23a62f3a-a9ec4423328mr304508966b.38.1730905354395;
        Wed, 06 Nov 2024 07:02:34 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 15:02:31 +0000
Message-Id: <D5F6QL236EKV.Q4U5DC28EOO4@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>
Subject: Re: [XEN RFC PATCH v4 2/5] docs/designs: Add a design document for
 IOMMU subsystem redesign
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <cover.1730718102.git.teddy.astie@vates.tech>
 <b847b3653a7410600e9e4bf87b515bdccd6d9496.1730718102.git.teddy.astie@vates.tech>
In-Reply-To: <b847b3653a7410600e9e4bf87b515bdccd6d9496.1730718102.git.teddy.astie@vates.tech>

Hi,

I have absolutely no idea how much of the code is yours, vs what was there
before. I'm just going to infodump as I go and hope that proves helpful in =
some
way.

On Mon Nov 4, 2024 at 2:28 PM GMT, Teddy Astie wrote:
> Current IOMMU subsystem has some limitations that make PV-IOMMU practical=
ly impossible.
> One of them is the assumtion that each domain is bound to a single "IOMMU=
 domain", which
> also causes complications with quarantine implementation.
>
> Moreover, current IOMMU subsystem is not entirely well-defined, for insta=
nce, the behavior
> of map_page between ARM SMMUv3 and x86 VT-d/AMD-Vi greatly differs. On AR=
M, it can modifies
> the domain page table while on x86, it may be forbidden (e.g using HAP wi=
th PVH), or only
> modifying the devices PoV (e.g using PV).
>
> The goal of this redesign is to define more explicitely the behavior and =
interface of the
> IOMMU subsystem while allowing PV-IOMMU to be effectively implemented.
>
> Signed-off-by Teddy Astie <teddy.astie@vates.tech>
> ---
> Changed in V2:
> * nit s/dettach/detach/
>
> Changed in v4:
> * updated for iommu_context locking changes
> ---
>  docs/designs/iommu-contexts.md | 403 +++++++++++++++++++++++++++++++++
>  1 file changed, 403 insertions(+)
>  create mode 100644 docs/designs/iommu-contexts.md
>
> diff --git a/docs/designs/iommu-contexts.md b/docs/designs/iommu-contexts=
.md
> new file mode 100644
> index 0000000000..9d6fb95549
> --- /dev/null
> +++ b/docs/designs/iommu-contexts.md
> @@ -0,0 +1,403 @@
> +# IOMMU context management in Xen
> +
> +Status: Experimental
> +Revision: 0
> +
> +# Background
> +
> +The design for *IOMMU paravirtualization for Dom0* [1] explains that som=
e guests may

nit: imo, either "explains why" or "states that".

> +want to access to IOMMU features. In order to implement this in Xen, sev=
eral adjustments
> +needs to be made to the IOMMU subsystem.

nit: s/needs/need

> +
> +This "hardware IOMMU domain" is currently implemented on a per-domain ba=
sis such as each

The "hardware IOMMU domain" is briefly mentioned in the commit message, but
wants defining before assuming it's known.

> +domain actually has a specific *hardware IOMMU domain*, this design aims=
 to allow a
> +single Xen domain to manage several "IOMMU context", and allow some doma=
ins (e.g Dom0
> +[1]) to modify their IOMMU contexts.

Without an adequate definition of "hardware IOMMU domain", I really don't
understand this paragraph. I don't know if it's explaining what we have or =
what
we want to have.

> +
> +In addition to this, quarantine feature can be refactored into using IOM=
MU contexts

nit: s/ quarantine/ the quarantine

Also, "can" or "will be"?

> +to reduce the complexity of platform-specific implementations and ensuri=
ng more
> +consistency across platforms.
> +
> +# IOMMU context
> +
> +We define a "IOMMU context" as being a *hardware IOMMU domain*, but name=
d as a context
> +to avoid confusion with Xen domains.

"hardware IOMMU domain" was never defined in the first place though. Are th=
ey
domains in the more abstract sense then?

If so, I definitely prefer the "context" name and it'd be very helpful to h=
ave
a note at beginning of the design note stating that a hardware IOMMU domain=
 in
the old nomenclature is conceptually the same as an IOMMU context in the ne=
w
one.

> +It represents some hardware-specific data structure that contains mappin=
gs from a device
> +frame-number to a machine frame-number (e.g using a pagetable) that can =
be applied to

e.g? or i.e? Is there any other way besides page tables in the intended des=
ign?

> +a device using IOMMU hardware.

nit: from "device frame numberS"

> +
> +This structure is bound to a Xen domain, but a Xen domain may have sever=
al IOMMU context.

nit: s/context/contexts

Is "this structure" a context?

> +These contexts may be modifiable using the interface as defined in [1] a=
side some
> +specific cases (e.g modifying default context).
> +
> +This is implemented in Xen as a new structure that will hold context-spe=
cific
> +data.

nit: Either "This is... that holds..." or "This will be... that will be".

> +
> +```c
> +struct iommu_context {
> +    u16 id; /* Context id (0 means default context) */

s/u16/uint16_t/ here and elsewhere, but...

also, seeing how this is a new ABI, I'd avoid mistakes of the past and go f=
or a
64bit number. That way it'll never roll over in this universe's lifetime an=
d
we'll never have to care about how to track used context IDs.

Are there any hot paths that take it? (I'd hope not). Any reason not to wid=
en?

> +    struct list_head devices;
> +
> +    struct arch_iommu_context arch;
> +
> +    bool opaque; /* context can't be modified nor accessed (e.g HAP) */
> +};
> +```
> +
> +A context is identified by a number that is domain-specific and may be u=
sed by IOMMU
> +users such as PV-IOMMU by the guest.

nit: are there any other users? The identifier _is_ a PV-IOMMU context id,
right?

> +
> +struct arch_iommu_context is splited from struct arch_iommu

nit: s/is splitted/is split/

> +
> +```c
> +struct arch_iommu_context
> +{

Lots to say about the way data seems arranged, but I suspect I'll see it be=
tter
in context (pun intended) in PoC later on.

> +    spinlock_t pgtables_lock;
> +    struct page_list_head pgtables;
> +
> +    union {
> +        /* Intel VT-d */
> +        struct {
> +            uint64_t pgd_maddr; /* io page directory machine address */
> +            domid_t *didmap; /* per-iommu DID */
> +            unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the =
context uses */
> +        } vtd;
> +        /* AMD IOMMU */
> +        struct {
> +            struct page_info *root_table;
> +        } amd;
> +    };
> +};
> +
> +struct arch_iommu
> +{
> +    spinlock_t mapping_lock; /* io page table lock */
> +    struct {
> +        struct page_list_head list;
> +        spinlock_t lock;
> +    } pgtables;
> +
> +    struct list_head identity_maps;
> +
> +    union {
> +        /* Intel VT-d */
> +        struct {
> +            /* no more context-specific values */
> +            unsigned int agaw; /* adjusted guest address width, 0 is lev=
el 2 30-bit */
> +        } vtd;
> +        /* AMD IOMMU */
> +        struct {
> +            unsigned int paging_mode;
> +            struct guest_iommu *g_iommu;
> +        } amd;
> +    };
> +};
> +```
> +
> +IOMMU context information is now carried by iommu_context rather than be=
ing integrated to
> +struct arch_iommu.

That's good. I wonder about the concurrency story though, as every context =
in a
domain is gated by a single lock. Presumably we could make it per-context
instead? There's parallelism already on the IOMMU when operating on context=
s of
different domains, so I'm not sure why the limitation. Or whether there's a
restriction we're missing and we should have the lock be per IOMMU instead.

> +
> +# Xen domain IOMMU structure
> +
> +`struct domain_iommu` is modified to allow multiples context within a si=
ngle Xen domain

nit: s/multiples context/multiple contexts/

> +to exist :
> +
> +```c
> +struct iommu_context_list {
> +    uint16_t count; /* Context count excluding default context */
> +
> +    /* if count > 0 */
> +
> +    uint64_t *bitmap; /* bitmap of context allocation */
> +    struct iommu_context *map; /* Map of contexts */
> +};
> +
> +struct domain_iommu {
> +    /* ... */
> +
> +    struct iommu_context default_ctx;
> +    struct iommu_context_list other_contexts;
> +
> +    /* ... */
> +}
> +```
> +
> +default_ctx is a special context with id=3D0 that holds the page table m=
apping the entire
> +domain, which basically preserve the previous behavior. All devices are =
expected to be
> +bound to this context during initialization.

nit: "identity" seems better termed

> +
> +Along with this default context that always exist, we use a pool of cont=
exts that has a
> +fixed size at domain initialization, where contexts can be allocated (if=
 possible), and
> +have a id matching their position in the map (considering that id !=3D 0=
).
> +These contexts may be used by IOMMU contexts users such as PV-IOMMU or q=
uarantine domain
> +(DomIO).
> +

... I'll leave it here for the time being. I need time to digest the rest.

Cheers,
Alejandro

