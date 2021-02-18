Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E220031EB29
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 15:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86668.162848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCkhu-00035m-Lk; Thu, 18 Feb 2021 14:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86668.162848; Thu, 18 Feb 2021 14:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCkhu-00035L-IK; Thu, 18 Feb 2021 14:55:06 +0000
Received: by outflank-mailman (input) for mailman id 86668;
 Thu, 18 Feb 2021 14:55:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3vz=HU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCkhs-00035G-JP
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 14:55:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fff36cdb-53c3-4362-923a-5b11829a516d;
 Thu, 18 Feb 2021 14:55:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3560FAECE;
 Thu, 18 Feb 2021 14:55:02 +0000 (UTC)
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
X-Inumbo-ID: fff36cdb-53c3-4362-923a-5b11829a516d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613660102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVOs/JzlefvQeAhcnj1Kr4X404vRAEhukY2mkTftP+c=;
	b=Y+zusE3y3dM0OYiS/bJpg3/4XHhFrlb7Estz9KSkVUOsDMwSB2qdYJqoPc1VyE9igaDw9U
	CmUirEl99R670nD24boM2mImnADv2lzMcfSXn0zB2xjrimJq2SbAuuau3QGilRUYLURVfa
	EmpQEtyD/Gw9aBKbfzMKfdqhUjmFuGA=
Subject: Re: ld 2.36 regression linking EFI binary from ELF input
To: Binutils <binutils@sourceware.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jeremy Drake <sourceware-bugzilla@jdrake.com>
References: <79812876-b43d-7729-da34-3b4cd1c31f24@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8467d4dd-c702-19e2-4511-92f26a7d7b1f@suse.com>
Date: Thu, 18 Feb 2021 15:55:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <79812876-b43d-7729-da34-3b4cd1c31f24@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.02.2021 14:21, Jan Beulich via Binutils wrote:
> the Xen project hypervisor build system includes building the
> hypervisor binary as an EFI application, as an option (i.e.
> as long as the tool chain supports this). Already when probing
> the linker we now suddenly get several "relocation truncated
> to fit:R_X86_64_32 against `.debug_...'" errors. I have not
> had  the time to figure out what exactly broke this, and I'm
> sending this mail in the hope that it may ring a bell for
> someone.
> 
> For reference, the probing is as simple as
> 
> $(LD) -mi386pep --subsystem=10 -o efi/check.efi efi/check.o
> 
> As was to be expected, the errors disappear with -S, but that's
> an option only for the probing, not for the actual linking of
> the binary.

Actually, that was just the easily visible problem. There's a
worse one, again resulting from 514b4e191d5f ("Change the
default characteristics of DLLs built by the linker to more
secure settings"): Prior to this a .reloc section would not
have been created by ld for executables. To work around this
we've been hand-crafting relocations (by linking the image at
two different base addresses and working out the delta). Now
that ld does this by default, we get two base relocations for
every field that needs relocating. Which obviously isn't
going to work.

We also can't easily use ld's way of populating .reloc, as
it's buggy (I'll send separate mail about that) and apart
from this the resulting relocations differ subtly for the
pre-populated page tables (using physical addresses, not
virtual ones) that the binary contains.

The immediate workaround at our end is therefore going to be
to use --disable-reloc-section when available, but I have to
admit that this is far worse breakage than I would have
expected from a single-step binutils version increment. I
wouldn't be surprised if Cygwin / MingW (or users thereof,
when they are creating their own programs on top) aren't
similarly affected. Luckily(?) the Windows loader looks to
fall back to ignoring .relocs when it encounters an error
processing one of the relocations, at least for executables
(for DLLs this may not be an option).

Jan

