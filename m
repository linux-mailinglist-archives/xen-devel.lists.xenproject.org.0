Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55288A5DA8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 00:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706512.1103685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwUcL-0002JN-7F; Mon, 15 Apr 2024 22:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706512.1103685; Mon, 15 Apr 2024 22:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwUcL-0002Hi-4R; Mon, 15 Apr 2024 22:16:01 +0000
Received: by outflank-mailman (input) for mailman id 706512;
 Mon, 15 Apr 2024 22:15:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNdO=LU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rwUcJ-0002Hb-Rg
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 22:15:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbc30da1-fb75-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 00:15:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 00ADD60BC6;
 Mon, 15 Apr 2024 22:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAFCC113CC;
 Mon, 15 Apr 2024 22:15:55 +0000 (UTC)
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
X-Inumbo-ID: bbc30da1-fb75-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713219356;
	bh=z32ELfh15OvDHpkNs+2nkc3lX79AaanhK2uT3Hg7c8g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SLsMhnYvz4uU6iIlInmEYqh64fJ8c4hiEoDJrNKvuH01V0AF6PVkEdWPEehAStLn8
	 YFokIwLzArnrHkoCH2OH8kqcqzpZFM2OSlYNqIBCEnMpOw36dl5owifVww3VB+F4Mk
	 ELdSnM25hj3eJmtEvi4v2qC7RqC8JjNjFj4VNWtw3LINCSbV72Wg/mzYrUlfrcHVjP
	 i2LheMGMfDRYZmSuMmDngt17EN80YjQg6FAEcVobG68mhg4JfCt22fqJN0ytWELs6v
	 ixon0VaIFIunN+WsJ4Wh08zdN0Mf7QQi85V/WGKZwOWLeyepN9naceGV/lIKCFidTN
	 d/sFhIv9CYZ5w==
Date: Mon, 15 Apr 2024 15:15:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH 4/4] xen/public: Use -Wpadding for public headers
In-Reply-To: <20240415154155.2718064-5-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404151456280.997881@ubuntu-linux-20-04-desktop>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com> <20240415154155.2718064-5-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Apr 2024, Andrew Cooper wrote:
> RFC.  In theory this is a great way to avoid some of the spiketraps involved
> with C being the official representation.
> 
> However, this doesn't build.  gnttab_transfer has a layout that requires a
> CONFIG_COMPAT if we want to satisfy -Wpadding for both forms of the structure.
> 
> Thoughts on whether this cross-check is worthwhile-enough to warrant the
> ifdefary?

I like this patch and I think we have no choice but going in this
direction and adding all the padding explicitly with any related
necessary ifdefary.

The only question for me is whether to:

1) add -Wpadding
2) add __packed__
3) do both

I think it is important to add __packed__ to the headers to clear out
any misconceptions about possible hidden paddings and get a
correct-by-default behavior for anyone that would import the headers
into their own projects.

The only issue is that __packed__ makes -Wpadding not useful. We could
technically add both if we disable __packed__ for the -Wpadding build.
For instance we could use __packed which is defined by Xen, and change
the definition of __packed to nothing for the -Wpadding build.

That way we get both the nice -Wpadding checks and also the nice
obvious-by-default __packed__.




> ~Andrew
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> ---
>  xen/common/Makefile              |  1 +
>  xen/common/hdr-chk.c             | 13 +++++++++++++
>  xen/include/public/grant_table.h |  7 +++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 xen/common/hdr-chk.c
> 
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index d512cad5243f..dbbda70829f1 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -15,6 +15,7 @@ obj-y += event_fifo.o
>  obj-$(CONFIG_GRANT_TABLE) += grant_table.o
>  obj-y += guestcopy.o
>  obj-y += gzip/
> +obj-y += hdr-chk.o
>  obj-$(CONFIG_HYPFS) += hypfs.o
>  obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
>  obj-y += irq.o
> diff --git a/xen/common/hdr-chk.c b/xen/common/hdr-chk.c
> new file mode 100644
> index 000000000000..1c7a509dcd06
> --- /dev/null
> +++ b/xen/common/hdr-chk.c
> @@ -0,0 +1,13 @@
> +#include <xen/stdint.h>
> +
> +#include <public/xen.h>
> +
> +#pragma GCC diagnostic error "-Wpadded"
> +
> +#include <public/grant_table.h>
> +
> +#ifdef CONFIG_COMPAT
> +
> +#include <compat/grant_table.h>
> +
> +#endif /* CONFIG_COMPAT */
> diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant_table.h
> index 1dfa17a6d02a..a66c77d0166c 100644
> --- a/xen/include/public/grant_table.h
> +++ b/xen/include/public/grant_table.h
> @@ -355,6 +355,7 @@ struct gnttab_unmap_grant_ref {
>      grant_handle_t handle;
>      /* OUT parameters. */
>      int16_t  status;              /* => enum grant_status */
> +    uint16_t _pad0;
>  };
>  typedef struct gnttab_unmap_grant_ref gnttab_unmap_grant_ref_t;
>  DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_grant_ref_t);
> @@ -371,6 +372,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_grant_ref_t);
>  struct gnttab_setup_table {
>      /* IN parameters. */
>      domid_t  dom;
> +    uint16_t _pad0;
>      uint32_t nr_frames;
>      /* OUT parameters. */
>      int16_t  status;              /* => enum grant_status */
> @@ -409,9 +411,12 @@ struct gnttab_transfer {
>      /* IN parameters. */
>      xen_pfn_t     mfn;
>      domid_t       domid;
> +    uint16_t      _pad0;
>      grant_ref_t   ref;
>      /* OUT parameters. */
>      int16_t       status;
> +    uint16_t      _pad1;
> +    /* XXX compat-dependent padding. */
>  };
>  typedef struct gnttab_transfer gnttab_transfer_t;
>  DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
> @@ -468,10 +473,12 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_copy_t);
>  struct gnttab_query_size {
>      /* IN parameters. */
>      domid_t  dom;
> +    uint16_t _ign1;
>      /* OUT parameters. */
>      uint32_t nr_frames;
>      uint32_t max_nr_frames;
>      int16_t  status;              /* => enum grant_status */
> +    uint16_t _ign2;
>  };
>  typedef struct gnttab_query_size gnttab_query_size_t;
>  DEFINE_XEN_GUEST_HANDLE(gnttab_query_size_t);
> -- 
> 2.30.2
> 

