Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1DA2670A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 23:43:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881006.1291110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf59v-0005hc-4Y; Mon, 03 Feb 2025 22:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881006.1291110; Mon, 03 Feb 2025 22:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf59v-0005f6-1u; Mon, 03 Feb 2025 22:43:15 +0000
Received: by outflank-mailman (input) for mailman id 881006;
 Mon, 03 Feb 2025 22:43:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijIa=U2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tf59s-0005f0-Pm
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 22:43:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e449c8c-e280-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 23:43:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B58A5C659B;
 Mon,  3 Feb 2025 22:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC262C4CED2;
 Mon,  3 Feb 2025 22:43:06 +0000 (UTC)
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
X-Inumbo-ID: 3e449c8c-e280-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738622588;
	bh=w5vf9cG5VK6b/SnMprT06cGeL1SqYhsAOQKm3TDtL3o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zn39Xx+LWRwbeiAtmL8Y+Fm2zomYFjVAgcPxHtXy6C9CvcdLac5DmRK6uxcnD7wJQ
	 Bh+q8L/UeOKN1OMSkJutspLeRq+qezb/FDNANW6ko3d5Uz/tmMPB10CCrHpGLxcT1c
	 yDKbEefk89GG0W3MZxl4E+aknG7aYc2XE7x1r6SLaIVNWpBb73pbXE2OUa4v/HZGAZ
	 lvLaIPR0P6eKfgsN62v/lgwfmXxcQTxuYePaZs8barJtIh6Ov5OXn+ltSVa+3ubdDx
	 0qBRBxNbQsYR8/NnEHu4qcIFFSNxbOYptO+mTYJlOajTx/TV0qiG1sI4+nn5vvDIej
	 pwoAHSZ7lMj1g==
Date: Mon, 3 Feb 2025 14:43:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Richard Henderson <richard.henderson@linaro.org>
cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
    Stefano Stabellini <sstabellini@kernel.org>, mark.cave-ayland@ilande.co.uk, 
    berrange@redhat.com, philmd@linaro.org, thuth@redhat.com, 
    andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, 
    jbeulich@suse.com, julien@xen.org, roger.pau@citrix.com, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com
Subject: Re: [PATCH v2 00/14] meson: Deprecate 32-bit host support
In-Reply-To: <e40c39d4-425c-4566-af41-373941894045@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop>
References: <20250203031821.741477-1-richard.henderson@linaro.org> <467a5a58-952e-4930-8e91-744eda6d87d9@redhat.com> <e40c39d4-425c-4566-af41-373941894045@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-12469339-1738622583=:11632"
Content-ID: <alpine.DEB.2.22.394.2502031443030.11632@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-12469339-1738622583=:11632
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2502031443031.11632@ubuntu-linux-20-04-desktop>

+Xen maintainers


On Mon, 3 Feb 2025, Richard Henderson wrote:
> On 2/3/25 04:54, Paolo Bonzini wrote:
> > On 2/3/25 04:18, Richard Henderson wrote:
> > > v1: 20250128004254.33442-1-richard.henderson@linaro.org
> > > 
> > > For v2, immediately disable 64-on-32 TCG.
> > > 
> > > I *suspect* that we should disable 64-on-32 for *all* accelerators.
> > > The idea that an i686 binary on an x86_64 host may be used to spawn
> > > an x86_64 guest via kvm is silly and a bit more than niche.
> > 
> > At least Xen used to be commonly used with 32-bit dom0, because it saved
> > memory and dom0 would map in guest buffers as needed.  I'm not sure how
> > common that is these days, perhaps Stefano knows.
> 
> As a data-point, debian does not ship libxen-dev for i686.
> We cannot build-test this configuration at all.
> 
> I can build-test Xen for armhf, and I guess it would use i386-softmmu; it's
> unclear whether x86_64-softmmu and aarch64-softmmu are relevant or useful for
> an armhf host, or as an armhf binary running on an aarch64 host.


On the Xen side, there are two different use cases: x86 32-bit and ARM
32-bit.  

For x86 32-bit, while it was a very important use case in the past, I
believe it is far less so now. I will let the x86 maintainers comment on
how important it is today. 

For ARM 32-bit, I do not think we ever had many deployments, as most are
64-bit. Even when there are deployments, they do not typically use QEMU,
as QEMU is less important for Xen on ARM compared to x86. Therefore, I
would not block your cleanup and deprecation because of that. I will let
the other ARM maintainers chime in.
--8323329-12469339-1738622583=:11632--

