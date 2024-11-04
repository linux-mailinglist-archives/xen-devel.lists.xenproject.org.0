Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D839BBA0A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 17:18:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830100.1245022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7zlv-0000gl-Bz; Mon, 04 Nov 2024 16:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830100.1245022; Mon, 04 Nov 2024 16:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7zlv-0000f1-9E; Mon, 04 Nov 2024 16:17:43 +0000
Received: by outflank-mailman (input) for mailman id 830100;
 Mon, 04 Nov 2024 16:17:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8Ql=R7=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t7zlu-0000ev-5v
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 16:17:42 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cf8949d-9ac8-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 17:17:34 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5cacb76e924so5724312a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 08:17:34 -0800 (PST)
Received: from jmerino-thinkstation ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb181398bsm251166b.196.2024.11.04.08.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 08:17:33 -0800 (PST)
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
X-Inumbo-ID: 4cf8949d-9ac8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzUiLCJoZWxvIjoibWFpbC1lZDEteDUzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRjZjg5NDlkLTlhYzgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzM3MDU0LjkyMTY5Mywic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730737054; x=1731341854; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GM4S3rkfGIkFbByj9y2vDhzkBKnIdzm7im7yKcE6maI=;
        b=LE6o7E5WrivBSPhVdTxOSCJt9g+h/yXnJUQmuJfMdg4MWaLR9bLQfVq/VJTUJWzM7h
         Y9UNlr0sDbyvBKN2NbfJAHoBkrqJmHonWWZW5YyZIa621LbxYf9udZuhZXm8FLvdCYUo
         iPFCTju7o3UkCp1NhmQXL3uriRhAvK3NnZWFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730737054; x=1731341854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM4S3rkfGIkFbByj9y2vDhzkBKnIdzm7im7yKcE6maI=;
        b=mvOII1xq7opK7kzg0l/h8N3XqlxUJLbjF/tIXCg1oo/Uf1ZMODzbq5kSAg/wu+7IXN
         kkb2JfY9eE4Kyi6Md2jRVoWtSzX/2+uSWLHg1HCr3mm5LX+uTBByjnDee2D+xvV4b8O1
         /zg9oV13QiXgzHskg+o1ugYMGc6vjAMvQsZ8d+p/CifE+6jiBEPOKs2v1ihQE7znBcrl
         /7fzReA7sxR5rhdjz2psOfJCPonqYLX7RGaqzJ0nM7wXk46aVioHBfW5OZ6am1aAcwoy
         dw6G+/KBPBxeBzPP0SgYjD947jFAL1fPQj9Y0yKbdNB4JEdH6ZfN5eOhGo1/MaJhbfxU
         pJ/A==
X-Gm-Message-State: AOJu0YyzCQnDnDCTWPGsDzpCqWmtrbUN7X0WLgYyZMnoGEGj+bo0+iW+
	3GltrUWLCjfUAJ+D/uYwY2liJdzzEnxVeQSSCjsfZkTDk0FKwjbK1yHHzEt20SHhSq5hv9gwpML
	cYTg=
X-Google-Smtp-Source: AGHT+IHboPmdIkGiR30pH16F9NksPKYBw/4lGLaR3OAQOloeKpLE7rQUfykng94NZ12gYDqrQ6nCTw==
X-Received: by 2002:a17:907:d2a:b0:a9a:4e7d:b0a1 with SMTP id a640c23a62f3a-a9e6587e1e9mr1097782766b.49.1730737054228;
        Mon, 04 Nov 2024 08:17:34 -0800 (PST)
Date: Mon, 4 Nov 2024 16:17:32 +0000
From: Javi Merino <javi.merino@cloud.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v1 3/6] CI: Refresh the Debian 12 arm64 container
Message-ID: <bev6ggo45o6jjiqgnfkxrnq4sjvbh4ssyx2bhf3cfjd5k32akv@o7jio3uidok3>
References: <cover.1729760501.git.javi.merino@cloud.com>
 <50c1ec986787c8fe3bf975b0003069b67e885032.1729760501.git.javi.merino@cloud.com>
 <alpine.DEB.2.22.394.2410241601480.3833@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2410241601480.3833@ubuntu-linux-20-04-desktop>

On Thu, Oct 24, 2024 at 04:03:56PM -0700, Stefano Stabellini wrote:
> On Thu, 24 Oct 2024, Javi Merino wrote:
> > Rework the container to use heredocs for readability and use apt-get
> > --no-install-recommends to keep the size down.  Rename the job to
> > debian-12-arm64-* to follow the naming scheme of all the other CI jobs.
> > 
> > This reduces the size of the debian:12-arm64v8 from 2.25GB down to 1.62GB.
> 
> Hi Javi, I am a bit confused by the new list of packages. I diff'ed the
> old list with the new list, and I appended the difference below. Maybe I
> ask how did you manage to make the new list?

I started from scratch.  I dropped everything and only added the
packages that were needed.

> As an example, are bcc and
> bin86 necessary?

They are not, that's why I dropped them.  The list you generated shows
as "+" the things that were in the old container and "-" are the ones
in the new container that were not in the old container.

If this helps, for the next series I will add a diff of the packages
added and removed.

Cheers,
Javi

>  acpica-tools
> +bcc
> +bin86
>  bison
>  build-essential
>  busybox-static
> -ca-certificates
>  checkpolicy
> +clang
>  cpio
>  curl
>  device-tree-compiler
>  expect
> -file
>  flex
> -git-core
> -golang-go
> -libbz2-dev
> -libext2fs-dev
> +git
> +libaio-dev
>  libfdt-dev
> +libfindlib-ocaml-dev
>  libglib2.0-dev
>  liblzma-dev
> -liblzo2-dev
> +libncurses5-dev
> +libnl-3-dev
>  libpixman-1-dev
>  libyajl-dev
> -libzstd-dev
> -ocaml-findlib
> +markdown
> +nasm
>  ocaml-nox
> +pandoc
>  pkg-config
>  python3-dev
>  python3-setuptools
> +transfig
>  u-boot-qemu
>  u-boot-tools
>  uuid-dev
>  wget
> +zlib1g-dev

