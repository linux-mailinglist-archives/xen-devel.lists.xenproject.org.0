Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC2DAC5E9A
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 03:00:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998907.1379604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK59P-0007Rm-K0; Wed, 28 May 2025 01:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998907.1379604; Wed, 28 May 2025 01:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK59P-0007MG-H2; Wed, 28 May 2025 01:00:11 +0000
Received: by outflank-mailman (input) for mailman id 998907;
 Wed, 28 May 2025 01:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8Hg=YM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uK59N-0006hB-Ps
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 01:00:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1601bb86-3b5f-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 03:00:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DEFDF5C5527;
 Wed, 28 May 2025 00:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF16C4CEE9;
 Wed, 28 May 2025 00:59:59 +0000 (UTC)
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
X-Inumbo-ID: 1601bb86-3b5f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748394000;
	bh=bKPm1y3NFIvS3iIJFfSjTTplJBpzzVHrcWXO3eeajEE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u0L440G0by+6XYvoIoO7QzLHWSpyOJcQNHatVqCdQ2tJES6k5nxg86pKj0BLJq+Y6
	 G68VRUxXHD7AEuK2Zv4a7f8JsjqYGFJCGLbrc2k32hJhIvmJcV0a65EIDo2gvK0qQ2
	 xCeslOR12Kfek2WG81lKO5XOi6q1BUcXjsvepTBilw0cS32ZHb2p4TvaWFlSFy4CnO
	 bxvcWEMsP4m+k9dg/UbBSLMGbaFRRcGMc5Gq8gNCEDsnaNPEB0Aaw19tu2Fa0FR6Gr
	 PfD+0EddeQ2s43d1sDUsfc0jkW8SLJ+WU7s8ovg6cJcl76+nD71GnpVXMMoDygxHal
	 mhVGfmRr5IEPQ==
Date: Tue, 27 May 2025 17:59:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 3/3] CI: Adjust how domU is packaged in dom0
In-Reply-To: <a49d8ce2-d2d9-4f86-9f74-1234ca33e4e0@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505271757250.135336@ubuntu-linux-20-04-desktop>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com> <20250522173640.575452-4-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2505271727170.135336@ubuntu-linux-20-04-desktop> <a49d8ce2-d2d9-4f86-9f74-1234ca33e4e0@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1730604225-1748394000=:135336"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1730604225-1748394000=:135336
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 28 May 2025, Andrew Cooper wrote:
> On 28/05/2025 1:30 am, Stefano Stabellini wrote:
> > On Thu, 22 May 2025, Andrew Cooper wrote:
> >> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> >> index 1dd3f48b3d29..17a37134f46a 100755
> >> --- a/automation/scripts/qubes-x86-64.sh
> >> +++ b/automation/scripts/qubes-x86-64.sh
> >> @@ -185,12 +185,24 @@ Kernel \r on an \m (\l)
> >>      find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
> >>      cd ..
> >>      rm -rf rootfs
> >> +
> >> +    # Package domU kernel+rootfs in /root for dom0 (uncompressed)
> >> +    mkdir -p rootfs/root
> >> +    cd rootfs
> >> +    cp ../binaries/bzImage root/vmlinuz-domU
> >> +    cp ../binaries/domU-rootfs.cpio.gz root/initrd-domU
> >> +    find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
> >> +    cd ..
> >> +    rm -rf rootfs
> >>  fi
> >>  
> >>  # Dom0 rootfs.  The order or concatination is important; ucode wants to come
> >>  # first, and all uncompressed must be ahead of compressed.
> >>  parts=(
> >>      binaries/ucode.cpio
> >> +)
> >> +[ -n "$domU_check" ] && parts+=(binaries/domU-in-dom0.cpio)
> > This is a NIT but I have been trying to avoid this format in favor of
> >
> > if [ -n "$domU_check" ]
> > then
> >     parts+=(binaries/domU-in-dom0.cpio)
> > fi
> >
> > for readibility.
> 
> This is a weird one, because the (relevant) readability is the
> components of parts, and it's easier to scan without the extra blank
> lines.  Nevertheless, ...
> 
> >
> >
> > I can see the patch is correct. It adds a bit of complexity in exchange
> > for a small improvement. I am not sure if the trade off is worth it, but
> > I'll ack it anyway.
> 
> ... see the thread on the previous patch.  This was the RFC "I'd like to
> find a nicer way of doing it", and Anthony has made a suggestion which I
> need to experiment with.

OK


> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Thanks, but do you have any input on the /boot vs /root question on the
> other part of the thread?

I saw it. I don't have a strong opinion either way. Technically /boot is
correct but then things gets mixed up with Dom0 kernel and ramdisk.
/root allows it to be more clearly separated so I am OK with it.
--8323329-1730604225-1748394000=:135336--

