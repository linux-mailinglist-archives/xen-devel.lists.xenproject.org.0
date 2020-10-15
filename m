Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2EF28ED4E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 09:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7108.18629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSxFF-00028D-8I; Thu, 15 Oct 2020 07:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7108.18629; Thu, 15 Oct 2020 07:00:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSxFF-00027o-4g; Thu, 15 Oct 2020 07:00:13 +0000
Received: by outflank-mailman (input) for mailman id 7108;
 Thu, 15 Oct 2020 07:00:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSxFD-00027j-L1
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 07:00:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1e7be84-3501-444e-b44b-ac9151109f10;
 Thu, 15 Oct 2020 07:00:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52FC8AD83;
 Thu, 15 Oct 2020 07:00:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSxFD-00027j-L1
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 07:00:11 +0000
X-Inumbo-ID: f1e7be84-3501-444e-b44b-ac9151109f10
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f1e7be84-3501-444e-b44b-ac9151109f10;
	Thu, 15 Oct 2020 07:00:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602745209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stXzUWWNNn0tlYniH0/+yke3yDVk8S39bV2uE3ntIgc=;
	b=GoiSPSALtfp/uFpw8+LcU0TRAdcuBcEoQlikDW7cWDqBLxvZD7zfSMY9QXM+6vumg2WGHE
	7e4Hs4JFbvg18QxBT45Tz/S0JReTZKlCi2t5B3h1h5RLx8hNj1PQp7aX4bcnx1pQHn1LGj
	078BOWyRNhkLuWechv9gpKESz08raic=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 52FC8AD83;
	Thu, 15 Oct 2020 07:00:09 +0000 (UTC)
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20201014153150.83875-1-jandryuk@gmail.com>
 <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
 <CAKf6xpv5GNjw0pjOxEqdVj2+C6v+O5PDZG5yYkNfytDjUT_r5w@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4229544b-e98d-6f3c-14aa-a884c403ba74@suse.com>
Date: Thu, 15 Oct 2020 09:00:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAKf6xpv5GNjw0pjOxEqdVj2+C6v+O5PDZG5yYkNfytDjUT_r5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.10.2020 18:27, Jason Andryuk wrote:
> On Wed, Oct 14, 2020 at 12:02 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 14.10.2020 17:31, Jason Andryuk wrote:
>>> Linux kernels only have an ENTRY elfnote when built with CONFIG_PV.  A
>>> kernel build CONFIG_PVH=y CONFIG_PV=n lacks the note.  In this case,
>>> virt_entry will be UNSET_ADDR, overwritten by the ELF header e_entry,
>>> and fail the check against the virt address range.
> 
> Oh, these should be CONFIG_XEN_PVH=y and CONFIG_XEN_PV=n
> 
>>> Change the code to only check virt_entry against the virtual address
>>> range if it was set upon entry to the function.
>>
>> Not checking at all seems wrong to me. The ELF spec anyway says
>> "virtual address", so an out of bounds value is at least suspicious.
>>
>>> Maybe the overwriting of virt_entry could be removed, but I don't know
>>> if there would be unintended consequences where (old?) kernels don't
>>> have an elfnote, but do have an in-range e_entry?  The failing kernel I
>>> just looked at has an e_entry of 0x1000000.
>>
>> And if you dropped the overwriting, what entry point would we use
>> in the absence of an ELF note?
> 
> elf_xen_note_check currently has:
> 
>     /* PVH only requires one ELF note to be set */
>     if ( parms->phys_entry != UNSET_ADDR32 )
>     {
>         elf_msg(elf, "ELF: Found PVH image\n");
>         return 0;
>     }
> 
>> I'd rather put up the option of adjusting the entry (or the check),
>> if it looks like a valid physical address.
> 
> The function doesn't know if the image will be booted PV or PVH, so I
> guess we do all the checks, but use 'parms->phys_entry != UNSET_ADDR32
> && parms->virt_entry == UNSET_ADDR' to conditionally skip checking
> virt?

Like Jürgen, the purpose of the patch hadn't become clear to me
from reading the description. As I understand it now, we're currently
refusing to boot such a kernel for no reason. If that's correct,
perhaps you could say so in the description in a more direct way?

As far as actual code adjustments go - how much of
elf_xen_addr_calc_check() is actually applicable when booting PVH?

And why is there no bounds check of ->phys_entry paralleling the
->virt_entry one?

On the whole, as long as we don't know what mode we're planning to
boot in, we can't skip any checks, as the mere presence of
XEN_ELFNOTE_PHYS32_ENTRY doesn't mean that's also what gets used.
Therefore simply bypassing any of the checks is not an option. In
particular what you suggest would lead to failure to check
e_entry-derived ->virt_entry when the PVH-specific note is
present but we're booting in PV mode. For now I don't see how to
address this without making the function aware of the intended
booting mode.

Jan

