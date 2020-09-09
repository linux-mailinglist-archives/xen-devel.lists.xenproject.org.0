Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0332B26283F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 09:17:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFuLP-0001NF-G5; Wed, 09 Sep 2020 07:16:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R68z=CS=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1kFuLN-0001NA-Rv
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 07:16:37 +0000
X-Inumbo-ID: d84423e1-5121-4f5d-982c-aa7417468365
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d84423e1-5121-4f5d-982c-aa7417468365;
 Wed, 09 Sep 2020 07:16:36 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39FD22078E;
 Wed,  9 Sep 2020 07:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599635796;
 bh=cgJYGU4wKTC7wfOTHrBVxW9G6PPVfCPQISOiM0CtJZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D8bzNY5AAc+ge4VsqDlHaTWvHlUxUMZNv07KBF+9mMse15ddoezVYDSzNgvpVvLOG
 5AD54+u7x/tzwksrHF0e7jNgHCFsR6dxry9B1pk45W9CMkYBoBzMbnIYeqDF11fLlZ
 joqMonC+NDrTtcaqkc8jCjowbXUCS/sg/mJgfxow=
Date: Wed, 9 Sep 2020 09:16:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kees Cook <keescook@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Baoquan He <bhe@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org
Subject: Re: [PATCH v2 2/7] kernel/resource: move and rename
 IORESOURCE_MEM_DRIVER_MANAGED
Message-ID: <20200909071646.GC435421@kroah.com>
References: <20200908201012.44168-1-david@redhat.com>
 <20200908201012.44168-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908201012.44168-3-david@redhat.com>
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

On Tue, Sep 08, 2020 at 10:10:07PM +0200, David Hildenbrand wrote:
> IORESOURCE_MEM_DRIVER_MANAGED currently uses an unused PnP bit, which is
> always set to 0 by hardware. This is far from beautiful (and confusing),
> and the bit only applies to SYSRAM. So let's move it out of the
> bus-specific (PnP) defined bits.
> 
> We'll add another SYSRAM specific bit soon. If we ever need more bits for
> other purposes, we can steal some from "desc", or reshuffle/regroup what we
> have.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richardw.yang@linux.intel.com>
> Cc: Eric Biederman <ebiederm@xmission.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: kexec@lists.infradead.org
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/ioport.h | 4 +++-
>  kernel/kexec_file.c    | 2 +-
>  mm/memory_hotplug.c    | 4 ++--
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/ioport.h b/include/linux/ioport.h
> index 52a91f5fa1a36..d7620d7c941a0 100644
> --- a/include/linux/ioport.h
> +++ b/include/linux/ioport.h
> @@ -58,6 +58,9 @@ struct resource {
>  #define IORESOURCE_EXT_TYPE_BITS 0x01000000	/* Resource extended types */
>  #define IORESOURCE_SYSRAM	0x01000000	/* System RAM (modifier) */
>  
> +/* IORESOURCE_SYSRAM specific bits. */
> +#define IORESOURCE_SYSRAM_DRIVER_MANAGED	0x02000000 /* Always detected via a driver. */
> +

Can't you use BIT() here?

thanks,

greg k-h

