Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B8592EEDA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 20:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757665.1166758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRyUp-000850-8z; Thu, 11 Jul 2024 18:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757665.1166758; Thu, 11 Jul 2024 18:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRyUp-00082x-5k; Thu, 11 Jul 2024 18:26:23 +0000
Received: by outflank-mailman (input) for mailman id 757665;
 Thu, 11 Jul 2024 18:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hOEV=OL=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sRyUn-00082r-Il
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 18:26:21 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11b312b0-3fb3-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 20:26:20 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77e85cb9b4so165198166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 11:26:20 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7985483a9bsm137094966b.109.2024.07.11.11.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 11:26:19 -0700 (PDT)
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
X-Inumbo-ID: 11b312b0-3fb3-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720722379; x=1721327179; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=je0/Bkll77NiKCHV4lqS5GAkdrrYNzHbF5T9RvLsqXE=;
        b=QiJaFUZstUAOfsesqUBWW/gWZL2i52xQol2u8kGVx3nJoOey+FSyFIEXAI8U3MD2r/
         LRSXvKypJqsAcUCYhcR5ZSct0cWTGC86h04KyI6AW17InOx8y0zyfcInKVEeOejgwvOS
         i2X16hkni/T6dLFyGAnPfMkMl1kCpoWr7S/kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720722379; x=1721327179;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=je0/Bkll77NiKCHV4lqS5GAkdrrYNzHbF5T9RvLsqXE=;
        b=MDDSkLxxvFo+8DY7050W787DpmmrePjo+uyNKf0//VXWe00oln+z4tW10gSyr0jVFg
         2aLCBNQfcgRJAPGDit7zNrNnTHi0PdOFOwW8UtyFs/eg0h/c0+D1pAuH8Bk5k/fgVzqH
         ZuN4cJXZteoGX4IOO4fmqDS8nowFUPct3Mtg/xqIg4AHW7zFvAT/fkIskEsJlYdq1eBa
         qglLCyv3RCiTlyt3P/DCz1D9YZ6Wv5XfoXNibO2hhV/l+dgcO/8seYjBHXKe74fk2wH7
         NbgvepQc65XZHfnWtPiQL5kQpPRFz85un3I2F5cGVO34UYS0Tgx0911vC3LvA7h7r8Rk
         n/2g==
X-Forwarded-Encrypted: i=1; AJvYcCXnyxpFZ8bs2qo4I95U0rzKhLzmIjs5u+hxacPSOudGaBwJ/PykErqIf+GnStwFvjwafV8lAfnZbk8DLwRBqpm+jFKBsLRv6UJqwGI/wv0=
X-Gm-Message-State: AOJu0Yz1FrHTo4xUS9l2PtAcDJlu8uLNXVwduN8DBd/S5alkr1J3e51n
	oY4a5jhoaDlpozreY5IIo3ctkC/9uH6o0W65Y+mGBrrpitLQoQ8pPubMT/V7FSA=
X-Google-Smtp-Source: AGHT+IE6eDccAacDHiPyTo3vtaJj+9V3xvLQqnp1N1FTINIAaJhRRbJtOlc7TISo5hKDZQgFOwv3MQ==
X-Received: by 2002:a17:906:2a14:b0:a77:e48d:bae with SMTP id a640c23a62f3a-a780b6b2f4dmr484782866b.28.1720722379492;
        Thu, 11 Jul 2024 11:26:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jul 2024 19:26:17 +0100
Message-Id: <D2MX6BEZAYQG.27FQPQ45OAEHA@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>, =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC XEN PATCH v3 1/5] docs/designs: Add a design document for
 PV-IOMMU
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <cover.1720703078.git.teddy.astie@vates.tech>
 <cf749c46f9d3d91bc116c96ee2fd1869164fbe5b.1720703078.git.teddy.astie@vates.tech>
In-Reply-To: <cf749c46f9d3d91bc116c96ee2fd1869164fbe5b.1720703078.git.teddy.astie@vates.tech>

Disclaimer: I haven't looked at the code yet.

On Thu Jul 11, 2024 at 3:04 PM BST, Teddy Astie wrote:
> Some operating systems want to use IOMMU to implement various features (e=
.g
> VFIO) or DMA protection.
> This patch introduce a proposal for IOMMU paravirtualization for Dom0.
>
> Signed-off-by Teddy Astie <teddy.astie@vates.tech>
> ---
>  docs/designs/pv-iommu.md | 105 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 docs/designs/pv-iommu.md
>
> diff --git a/docs/designs/pv-iommu.md b/docs/designs/pv-iommu.md
> new file mode 100644
> index 0000000000..c01062a3ad
> --- /dev/null
> +++ b/docs/designs/pv-iommu.md
> @@ -0,0 +1,105 @@
> +# IOMMU paravirtualization for Dom0
> +
> +Status: Experimental
> +
> +# Background
> +
> +By default, Xen only uses the IOMMU for itself, either to make device ad=
ress
> +space coherent with guest adress space (x86 HVM/PVH) or to prevent devic=
es
> +from doing DMA outside it's expected memory regions including the hyperv=
isor
> +(x86 PV).

"By default...": Do you mean "currently"?

> +
> +A limitation is that guests (especially privildged ones) may want to use
> +IOMMU hardware in order to implement features such as DMA protection and
> +VFIO [1] as IOMMU functionality is not available outside of the hypervis=
or
> +currently.

s/privildged/privileged/

> +
> +[1] VFIO - "Virtual Function I/O" - https://www.kernel.org/doc/html/late=
st/driver-api/vfio.html
> +
> +# Design
> +
> +The operating system may want to have access to various IOMMU features s=
uch as
> +context management and DMA remapping. We can create a new hypercall that=
 allows
> +the guest to have access to a new paravirtualized IOMMU interface.
> +
> +This feature is only meant to be available for the Dom0, as DomU have so=
me
> +emulated devices that can't be managed on Xen side and are not hardware,=
 we
> +can't rely on the hardware IOMMU to enforce DMA remapping.

Is that the reason though? While it's true we can't mix emulated and real
devices under the same emulated PCI bus covered by an IOMMU, nothing preven=
ts us
from stating "the IOMMU(s) configured via PV-IOMMU cover from busN to busM"=
.

AFAIK, that already happens on systems with several IOMMUs, where they migh=
t
affect partially disjoint devices. But I admit I'm no expert on this.

I can definitely see a lot of interesting use cases for a PV-IOMMU interfac=
e
exposed to domUs (it'd be a subset of that of dom0, obviously); that'd
allow them to use the IOMMU without resorting to 2-stage translation, which=
 has
terrible IOTLB miss costs.

> +
> +This interface is exposed under the `iommu_op` hypercall.
> +
> +In addition, Xen domains are modified in order to allow existence of sev=
eral
> +IOMMU context including a default one that implement default behavior (e=
.g
> +hardware assisted paging) and can't be modified by guest. DomU cannot ha=
ve
> +contexts, and therefore act as if they only have the default domain.
> +
> +Each IOMMU context within a Xen domain is identified using a domain-spec=
ific
> +context number that is used in the Xen IOMMU subsystem and the hypercall
> +interface.
> +
> +The number of IOMMU context a domain can use is predetermined at domain =
creation
> +and is configurable through `dom0-iommu=3Dnb-ctx=3DN` xen cmdline.

nit: I think it's more typical within Xen to see "nr" rather than "nb"

> +
> +# IOMMU operations
> +
> +## Alloc context
> +
> +Create a new IOMMU context for the guest and return the context number t=
o the
> +guest.
> +Fail if the IOMMU context limit of the guest is reached.

or -ENOMEM, I guess.

I'm guessing from this dom0 takes care of the contexts for guests? Or are t=
hese
contexts for use within dom0 exclusively?

> +
> +A flag can be specified to create a identity mapping.
> +
> +## Free context
> +
> +Destroy a IOMMU context created previously.
> +It is not possible to free the default context.
> +
> +Reattach context devices to default context if specified by the guest.
> +
> +Fail if there is a device in the context and reattach-to-default flag is=
 not
> +specified.
> +
> +## Reattach device
> +
> +Reattach a device to another IOMMU context (including the default one).
> +The target IOMMU context number must be valid and the context allocated.
> +
> +The guest needs to specify a PCI SBDF of a device he has access to.
> +
> +## Map/unmap page
> +
> +Map/unmap a page on a context.
> +The guest needs to specify a gfn and target dfn to map.

And an "order", I hope; to enable superpages and hugepages without having t=
o
find out after the fact that the mappings are in fact mergeable and the lea=
f PTs
can go away.

> +
> +Refuse to create the mapping if one already exist for the same dfn.
> +
> +## Lookup page
> +
> +Get the gfn mapped by a specific dfn.
> +
> +# Implementation considerations
> +
> +## Hypercall batching
> +
> +In order to prevent unneeded hypercalls and IOMMU flushing, it is advisa=
ble to
> +be able to batch some critical IOMMU operations (e.g map/unmap multiple =
pages).

See above for an additional way of reducing the load.

> +
> +## Hardware without IOMMU support
> +
> +Operating system needs to be aware on PV-IOMMU capability, and whether i=
t is
> +able to make contexts. However, some operating system may critically fai=
l in
> +case they are able to make a new IOMMU context. Which is supposed to hap=
pen
> +if no IOMMU hardware is available.
> +
> +The hypercall interface needs a interface to advertise the ability to cr=
eate
> +and manage IOMMU contexts including the amount of context the guest is a=
ble
> +to use. Using these informations, the Dom0 may decide whether to use or =
not
> +the PV-IOMMU interface.

We could just return -ENOTSUPP when there's no IOMMU, then encapsulate a ra=
ndom
lookup with pv_iommu_is_present() and return true or false depending on rc.

> +
> +## Page pool for contexts
> +
> +In order to prevent unexpected starving on the hypervisor memory with a
> +buggy Dom0. We can preallocate the pages the contexts will use and make
> +map/unmap use these pages instead of allocating them dynamically.
> +

That seems dangerous should we need to shatter a superpage asynchronously (=
i.e:
due to HW misbehaving and requiring it) and have no more pages in the pool.

Cheers,
Alejandro

