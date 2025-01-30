Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9066FA2365E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 22:14:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879771.1289978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdbrX-0000tz-Mj; Thu, 30 Jan 2025 21:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879771.1289978; Thu, 30 Jan 2025 21:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdbrX-0000sC-K7; Thu, 30 Jan 2025 21:14:11 +0000
Received: by outflank-mailman (input) for mailman id 879771;
 Thu, 30 Jan 2025 21:14:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URkf=UW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tdbrW-0000s6-L2
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 21:14:10 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 244e7c12-df4f-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 22:14:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 81594A4252D;
 Thu, 30 Jan 2025 21:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4038CC4CED2;
 Thu, 30 Jan 2025 21:14:05 +0000 (UTC)
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
X-Inumbo-ID: 244e7c12-df4f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738271646;
	bh=PeQxpJiFJJfVnOrZDjcv8XKQguXVUUIzW+NyAJvnnP4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NB1K4AW+goFqcl1V5r8kTv08pXGIVSd+VJ9vcxrfT6A6fjNeR1mglNChyFJwILpMS
	 SZOnbGFLTa+pg4yyjPiFRO/FgsZdWLRe8qoiI8XsPMCFA669TuQ60ZYmcOiKgRx4hu
	 XnodUz5c/vX/o+V0+GECLZfSUyOjRVkPg9zzNLmydB/pC8NkMUrkZckQYqA0JaDVyn
	 GF86NSLkGpvFU3JCXC0i+hZq1JxidxAUfTaKWsRQgQTRWyqa73B/0JCC+O1nOC+njV
	 rVAqmjRU4Ey7RUk9KsxMI13zJKq8huT5rAU+RuS0CspuUeDjz9nG3TovxaZHKoZ72H
	 8wSmGp34AGtkA==
Date: Thu, 30 Jan 2025 13:14:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, jason.andryuk@amd.com, 
    christopher.w.clark@gmail.com, stefano.stabellini@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 08/15] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
In-Reply-To: <efc352d6-e686-435c-98b3-2333b6dee6a3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501301250410.11632@ubuntu-linux-20-04-desktop>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com> <20241226165740.29812-9-dpsmith@apertussolutions.com> <efc352d6-e686-435c-98b3-2333b6dee6a3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Jan 2025, Jan Beulich wrote:
> On 26.12.2024 17:57, Daniel P. Smith wrote:
> > Look for a subnode of type `multiboot,kernel` within a domain node. If found,
> > process the reg property for the MB1 module index. If the bootargs property is
> > present and there was not an MB1 string, then use the command line from the
> > device tree definition.
> 
> While multiboot is apparently the first x86-specific part (as far as Xen goes)
> to be put under domain-builder/, I wonder:
> - Wouldn't looking for "multiboot,kernel" simply yield nothing on non-x86,
>   so having the code under common/ would still be okay?

One small clarification: multiboot,kernel is actually common between
both ARM and x86. It is "module-index" which is x86-specific and would
"simply yield nothing on non-x86", as you wrote.

I'll let Dan address your point that "having the code under common/
would still be okay".


> - What's "multiboot" describing here? The origin of the module? (What other
>   origins would then be possible? How would MB1 and MB2 be distinguished?
>   What about a native xen.efi boot?) A property of the kernel (when Linux
>   doesn't use MB)?

Each device tree node has a compatible string to qualify what kind of
information the node is describing. The compatible string for device
tree nodes describing a kernel binary or a ramdisk previously loaded
into memory by a bootloader have a "multiboot," prefix. See
docs/misc/arm/device-tree/booting.txt. This is unrelated to the binary
multiboot protocol Grub uses on x86 to boot Xen.

A distinction between MB1 and MB2 is not needed in device tree, that
information is retrieved via the Grub multiboot protocol as usual. The
only thing needed here in device tree is the location of the kernel,
either by RAM address, or by Grub multiboot module index. This last
option (Grub multiboot module index) is the "module-index" property I
mentioned above.

