Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE62576B9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 11:42:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCgIz-0008BP-LU; Mon, 31 Aug 2020 09:40:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTXF=CJ=gmail.com=pankaj.gupta.linux@srs-us1.protection.inumbo.net>)
 id 1kCgE9-0007RR-Go
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 09:35:49 +0000
X-Inumbo-ID: 36a58a0f-6a1f-4d2b-858d-94effe8981a9
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36a58a0f-6a1f-4d2b-858d-94effe8981a9;
 Mon, 31 Aug 2020 09:35:48 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id h10so5153487ioq.6
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2020 02:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HsNtRpi0XGja6Sj9lSJWoznoixc15RWCQVmmU4+oCGQ=;
 b=BkWe+B6D3lN045gds9IoFYUQ+o2juq6u/5mtP4qMWEZgN4V72MQv52x13zt+0Vagcw
 PiplKpJDZIg1gJ/K+PqleXk0+ms/PIwH4m04bUTXOP6LZe4mc4lUMCnaFMAZ1Nf7OH5R
 +TO1BAV2uJm4VdeFkABkZgYtRWdSxBF7MObhl58VcQjVfHSqlwYCoTT8LWmc7Hg5H7zn
 rFVALNyy0QNyyM9EWLw6uOxE4Uiqo6MEltvqGfVltYm+Lsi1MNLu6dooosPYw/1NDhKj
 0s2nGoPPTS/ePGpaVVkCc9/P0ug7/BLTlsgu0GElkFNNztt3JlZyxdTPXMRhtYmxlaLF
 /55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HsNtRpi0XGja6Sj9lSJWoznoixc15RWCQVmmU4+oCGQ=;
 b=Ov6Af92Y1+X4FNGftl/2BrAkOmcAIGe9BVm+9imwWluQxw85uMZjBZjzdHDR/V3pWl
 17Q/G3MuwQ6imHtor2LcnnL+ekVqKF0TgabpiPSLcKj6gXBjUwjgYXdbdm6GuUtIAvQZ
 9dJld5xXl9oUIhjOvQfXIptUjDAx45c7V7sXXs015MmtsoTj7HCBTYOhAu5WJ/2DiYhy
 XhoWdV5mC3tkg21yrzo+2oU4yPPAAFzmgeVr4CI1pgPOlwQrJ5UL4sE+bVK6eAXMLsLF
 aJ/HHElzMgYLI+P2AbpMZZCuNI3l8XdIhh0nJbVu0pQpMpb5RlH0kP9CbqzTzU/Zqu98
 xjMA==
X-Gm-Message-State: AOAM532WdbpqNIlywRyW003qNsKDd3QF0byAsKc6HJxUphgokEbDUcEf
 oJQBQaDdfyVbvty9Ic7jxa7QW74kb4t5PL0+1/Y=
X-Google-Smtp-Source: ABdhPJww8t42sUm+jGq9r4vVjstNF9Iiu7OItpZmQeVdogqBS81K4nUxuzik3G0XU545fyNmeFJRfcVCeSn7YUqh2/o=
X-Received: by 2002:a6b:b513:: with SMTP id e19mr547960iof.167.1598866548037; 
 Mon, 31 Aug 2020 02:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200821103431.13481-1-david@redhat.com>
 <20200821103431.13481-3-david@redhat.com>
In-Reply-To: <20200821103431.13481-3-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Mon, 31 Aug 2020 11:35:36 +0200
Message-ID: <CAM9Jb+hJ8YSB6XZi6CB3jU-LSdVhKGZw=6NESzFhY7bbU9uOSQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] kernel/resource: merge_system_ram_resources() to
 merge resources after hotplug
To: David Hildenbrand <david@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, 
 Linux MM <linux-mm@kvack.org>, linux-hyperv@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, 
 Michal Hocko <mhocko@suse.com>, Dan Williams <dan.j.williams@intel.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Kees Cook <keescook@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, 
 Wei Liu <wei.liu@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Julien Grall <julien@xen.org>, Baoquan He <bhe@redhat.com>, 
 Wei Yang <richardw.yang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:40:48 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Some add_memory*() users add memory in small, contiguous memory blocks.
> Examples include virtio-mem, hyper-v balloon, and the XEN balloon.
>
> This can quickly result in a lot of memory resources, whereby the actual
> resource boundaries are not of interest (e.g., it might be relevant for
> DIMMs, exposed via /proc/iomem to user space). We really want to merge
> added resources in this scenario where possible.
>
> Let's provide an interface to trigger merging of applicable child
> resources. It will be, for example, used by virtio-mem to trigger
> merging of system ram resources it added to its resource container, but
> also by XEN and Hyper-V to trigger merging of system ram resources in
> iomem_resource.
>
> Note: We really want to merge after the whole operation succeeded, not
> directly when adding a resource to the resource tree (it would break
> add_memory_resource() and require splitting resources again when the
> operation failed - e.g., due to -ENOMEM).
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Stephen Hemminger <sthemmin@microsoft.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richardw.yang@linux.intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/ioport.h |  3 +++
>  kernel/resource.c      | 52 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
>
> diff --git a/include/linux/ioport.h b/include/linux/ioport.h
> index 52a91f5fa1a36..3bb0020cd6ddc 100644
> --- a/include/linux/ioport.h
> +++ b/include/linux/ioport.h
> @@ -251,6 +251,9 @@ extern void __release_region(struct resource *, resou=
rce_size_t,
>  extern void release_mem_region_adjustable(struct resource *, resource_si=
ze_t,
>                                           resource_size_t);
>  #endif
> +#ifdef CONFIG_MEMORY_HOTPLUG
> +extern void merge_system_ram_resources(struct resource *res);
> +#endif
>
>  /* Wrappers for managed devices */
>  struct device;
> diff --git a/kernel/resource.c b/kernel/resource.c
> index 1dcef5d53d76e..b4e0963edadd2 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -1360,6 +1360,58 @@ void release_mem_region_adjustable(struct resource=
 *parent,
>  }
>  #endif /* CONFIG_MEMORY_HOTREMOVE */
>
> +#ifdef CONFIG_MEMORY_HOTPLUG
> +static bool system_ram_resources_mergeable(struct resource *r1,
> +                                          struct resource *r2)
> +{
> +       return r1->flags =3D=3D r2->flags && r1->end + 1 =3D=3D r2->start=
 &&
> +              r1->name =3D=3D r2->name && r1->desc =3D=3D r2->desc &&
> +              !r1->child && !r2->child;
> +}
> +
> +/*
> + * merge_system_ram_resources - try to merge contiguous system ram resou=
rces
> + * @parent: parent resource descriptor
> + *
> + * This interface is intended for memory hotplug, whereby lots of contig=
uous
> + * system ram resources are added (e.g., via add_memory*()) by a driver,=
 and
> + * the actual resource boundaries are not of interest (e.g., it might be
> + * relevant for DIMMs). Only immediate child resources that are busy and
> + * don't have any children are considered. All applicable child resource=
s
> + * must be immutable during the request.
> + *
> + * Note:
> + * - The caller has to make sure that no pointers to resources that migh=
t
> + *   get merged are held anymore. Callers should only trigger merging of=
 child
> + *   resources when they are the only one adding system ram resources to=
 the
> + *   parent (besides during boot).
> + * - release_mem_region_adjustable() will split on demand on memory hotu=
nplug
> + */
> +void merge_system_ram_resources(struct resource *parent)
> +{
> +       const unsigned long flags =3D IORESOURCE_SYSTEM_RAM | IORESOURCE_=
BUSY;
> +       struct resource *cur, *next;
> +
> +       write_lock(&resource_lock);
> +
> +       cur =3D parent->child;
> +       while (cur && cur->sibling) {
> +               next =3D cur->sibling;
> +               if ((cur->flags & flags) =3D=3D flags &&

Maybe this can be changed to:
!(cur->flags & ~flags)

> +                   system_ram_resources_mergeable(cur, next)) {
> +                       cur->end =3D next->end;
> +                       cur->sibling =3D next->sibling;
> +                       free_resource(next);
> +                       next =3D cur->sibling;
> +               }
> +               cur =3D next;
> +       }
> +
> +       write_unlock(&resource_lock);
> +}
> +EXPORT_SYMBOL(merge_system_ram_resources);
> +#endif /* CONFIG_MEMORY_HOTPLUG */
> +
>  /*
>   * Managed region resource
>   */
> --
> 2.26.2
>

