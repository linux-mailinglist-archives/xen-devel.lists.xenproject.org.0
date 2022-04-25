Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EED250EB4B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 23:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313290.530807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj6Dp-00019H-94; Mon, 25 Apr 2022 21:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313290.530807; Mon, 25 Apr 2022 21:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj6Dp-00016v-5Q; Mon, 25 Apr 2022 21:26:17 +0000
Received: by outflank-mailman (input) for mailman id 313290;
 Mon, 25 Apr 2022 21:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dJ7t=VD=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1nj6Dk-00016p-Kb
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 21:26:15 +0000
Received: from mail.skyhub.de (mail.skyhub.de [2a01:4f8:190:11c2::b:1457])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5119f943-c4de-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 23:26:07 +0200 (CEST)
Received: from zn.tnic (p5de8eeb4.dip0.t-ipconnect.de [93.232.238.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B81DA1EC04A6;
 Mon, 25 Apr 2022 23:26:01 +0200 (CEST)
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
X-Inumbo-ID: 5119f943-c4de-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1650921961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VzCRn9yN2ByyCFR5QKv9+K8B8VcoQwcA3ZVz2Ifi7JQ=;
	b=fNnh8YiUMApB0I9iM+V6r0nvmh8FA7oNdMa5U7S15/LCpqbI1/jM6tKwfyZ0aDGbo5ZAAv
	UISb+73NpqVJqWCi+Fa1hLJKqxhd+c42n4JjVcHL1lptzDXi9IsAxaLj9BDartlz8vh+99
	YmQB5O8tl20QGO/Fbc7aZfQyJMnzDYU=
Date: Mon, 25 Apr 2022 23:25:57 +0200
From: Borislav Petkov <bp@alien8.de>
To: Oleksandr <olekstysh@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Christoph Hellwig <hch@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
Message-ID: <YmcR5bfaYh1z7VUq@zn.tnic>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
 <YmQsFb36UEH9BUnN@infradead.org>
 <6c5042fe-dafc-eb4f-c1fa-03b0faf252de@gmail.com>
 <abc5d23d-3d38-d198-4646-e886df2e83d4@suse.com>
 <YmZUpua3hkCPdbfx@infradead.org>
 <147f68f6-7d67-1884-bd14-5040639b3396@suse.com>
 <67c7460a-3001-35a6-8e5b-f367270b257a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67c7460a-3001-35a6-8e5b-f367270b257a@gmail.com>

On Mon, Apr 25, 2022 at 11:38:36PM +0300, Oleksandr wrote:
> diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
> index efd8205..d06bc7a 100644
> --- a/include/linux/cc_platform.h
> +++ b/include/linux/cc_platform.h
> @@ -72,6 +72,19 @@ enum cc_attr {
>          * Examples include TDX guest & SEV.
>          */
>         CC_ATTR_GUEST_UNROLL_STRING_IO,
> +
> +       /**
> +        * @CC_ATTR_GUEST_MEM_ACCESS_RESTRICTED: Restricted memory access to
> +        *                                       Guest memory is active
> +        *
> +        * The platform/OS is running as a guest/virtual machine and uses
> +        * the restricted access to its memory. This attribute is set if
> either
> +        * Guest memory encryption or restricted memory access using Xen
> grant
> +        * mappings is active.
> +        *
> +        * Examples include Xen guest and SEV.

Wait, whaaat?

The cc_platform* stuff is for *confidential computing* guests to check
different platform aspects.

From quickly skimming over this, this looks like a misuse to me.

Why can't you query this from the hypervisor just like you do your other
querying about what is supported, etc? Hypercalls, CPUID, whatever...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

