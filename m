Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC27C9492
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 14:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617059.959494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrddT-0003w4-Cs; Sat, 14 Oct 2023 12:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617059.959494; Sat, 14 Oct 2023 12:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrddT-0003uO-AA; Sat, 14 Oct 2023 12:20:51 +0000
Received: by outflank-mailman (input) for mailman id 617059;
 Sat, 14 Oct 2023 12:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DaQa=F4=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1qrddR-0003uI-6X
 for xen-devel@lists.xenproject.org; Sat, 14 Oct 2023 12:20:49 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19130497-6a8c-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 14:20:45 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D9E165C0288;
 Sat, 14 Oct 2023 08:20:43 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Sat, 14 Oct 2023 08:20:43 -0400
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6EC65B6008D; Sat, 14 Oct 2023 08:20:43 -0400 (EDT)
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
X-Inumbo-ID: 19130497-6a8c-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1697286043; x=1697372443; bh=nZ
	iSaf+2rKUZmRmaI+hHKAfBctJh+V32I+xRn4B5yaM=; b=DMW+athuAfhfxrMpLC
	q6fqoed/7uX/mQHSbMR9RebUkAwQN8SRxLbcbUb9TCfjETOaCz1UcuQzyfkjupCG
	37vWO7Gj3ZM6I7OgNerhAR3bdD+2qyfgzOoe/KSTp9oaTrdWOX4dzr3pFAOC+Tyn
	HIk+1hKIyyKnf9saGXX0+NEEvehgAbSmzhlj8IJ/n0kWlxJuuqQ0aJDOi6Gu6PSd
	vxCpdLpLRBYHLiY4mKgljlkkE0YuCFfMCOsVUuAWBHU9izSeLKs4xhdYt0T3eEJ/
	KvoS5zH7X/7H39WfjkVkGacluJRYX6+2FytfyFCO9YvgBUmoeDmAoFg6eIjLXOje
	oY3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1697286043; x=1697372443; bh=nZiSaf+2rKUZm
	RmaI+hHKAfBctJh+V32I+xRn4B5yaM=; b=XmVc3oRK5xPIG+LC89BayxU//H3dA
	15HdljrBlx5vfugHwIgHCZ81WuegEXJri7T/ACzuyzUcsRHaEI7DB5bm3N+jM+jt
	jThIUfClB+A5Dc+MD01TuRpZC+3Li6gB9/DC5zQBc7L/3wPMbIqR0zaVWPe7aOGp
	z1A+dyo9LhOXdncC2ZoxOWvmdvGPgYwiO3kUyGS9m3bwUNdkJi8C6Be6jlC/7XsG
	StGUotCR1e12EVsdSGrfqkm19lUDtkIKDC5x24TCnNftg2m27LlEljRQKYEKRmy1
	Yh3oaNNHlWeQUlomoQayDHiMP/H7Tm4CsBbq9MGEBhnb3RhHUwxeHSW5A==
X-ME-Sender: <xms:m4cqZdSeswWWvO027zq8PS0N9IfdsxN0i8f4d_HHUzLWN0qCFWkXWA>
    <xme:m4cqZWw0k1kGXAc4iu6z2-ja-hPSLRVLK3hpx5tVkMpG2dEgIqsZ_VtTcM2Goj_AB
    5suOAUDdeZLtGVidNU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrieehgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:m4cqZS2ytldwAXeJP2PaXElU6rm5WO4IqLfA8v6jj1_1ewCRt4HR1w>
    <xmx:m4cqZVC3PQlDUr3F-AZaImYU3DG_Jle3dFQxnD-KUyRnkNjlvgmdbg>
    <xmx:m4cqZWix_PsRLPtMETcHcLKMTGronhRIV_Zi0OpkHtHMjwwp6H0fHA>
    <xmx:m4cqZRVhVv0aNDlcqNSdu3vGQn6-thVaJ6om4XZj63ZJ931YmzZWUQ>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <268a2031-63b8-4c7d-b1e5-8ab83ca80b4a@app.fastmail.com>
In-Reply-To: 
 <52b07a3861a34fb0deb6251bae8bd885815c6944.1693311370.git.viresh.kumar@linaro.org>
References: <cover.1693311370.git.viresh.kumar@linaro.org>
 <52b07a3861a34fb0deb6251bae8bd885815c6944.1693311370.git.viresh.kumar@linaro.org>
Date: Sat, 14 Oct 2023 14:19:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Juergen Gross" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
Cc: "Stratos Mailing List" <stratos-dev@op-lists.linaro.org>,
 "Erik Schilling" <erik.schilling@linaro.org>,
 "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [Stratos-dev] [PATCH 2/2] xen: privcmd: Add support for ioeventfd
Content-Type: text/plain

On Tue, Aug 29, 2023, at 14:29, Viresh Kumar via Stratos-dev wrote:

> +/* For privcmd_ioeventfd::flags */
> +#define PRIVCMD_IOEVENTFD_FLAG_DEASSIGN (1 << 0)
> +
> +struct privcmd_ioeventfd {
> +	void __user *ioreq;
> +	unsigned int __user *ports;
> +	__u64 addr;
> +	__u32 addr_len;
> +	__u32 event_fd;
> +	__u32 vcpus;
> +	__u32 vq;
> +	__u32 flags;
> +	domid_t dom;
> +	__u8 pad[2];
> +};

Using indirect pointers in an ioctl command argument means that
the layout is architecture specific, in particular you can't
use the same one from 32-bit compat tasks. The general recommendation
is to have __u64 members and use u64_to_user_ptr() to access it
from the kernel if you are unable to avoid the pointers altogether.

>  /*
>   * @cmd: IOCTL_PRIVCMD_HYPERCALL
>   * @arg: &privcmd_hypercall_t
> @@ -139,5 +155,7 @@ struct privcmd_irqfd {
>  	_IOC(_IOC_NONE, 'P', 7, sizeof(struct privcmd_mmap_resource))
>  #define IOCTL_PRIVCMD_IRQFD					\
>  	_IOC(_IOC_NONE, 'P', 8, sizeof(struct privcmd_irqfd))
> +#define IOCTL_PRIVCMD_IOEVENTFD					\
> +	_IOC(_IOC_NONE, 'P', 9, sizeof(struct privcmd_ioeventfd))

_IOC() an internal helper that you should not use in driver code.
In particular, you go the data direction wrong here, which breaks
a number of tools, as having "_IOC_NONE" should never be paired with
a nonzero size.

Instead, you should use the existing _IOWR() or _IOR() macros without
the 'sizeof()' like

#define IOCTL_PRIVCMD_IOEVENTFD _IOWR('P', 9, struct privcmd_ioeventfd)

You clearly copied this from the other ioctl command definitions in
the same file that we can't easily fix without breaking the user
ABI, but I still think you should try to do it correctly for new
commands.

     Arnd

