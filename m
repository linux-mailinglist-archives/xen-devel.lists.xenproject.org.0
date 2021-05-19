Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA3388AA4
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 11:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129957.243694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljIWW-0001Pt-4Y; Wed, 19 May 2021 09:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129957.243694; Wed, 19 May 2021 09:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljIWW-0001Nr-1M; Wed, 19 May 2021 09:29:52 +0000
Received: by outflank-mailman (input) for mailman id 129957;
 Wed, 19 May 2021 09:29:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljIWU-0001Nj-IJ
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 09:29:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5c28893-fc35-4c89-8241-fac1070c28d8;
 Wed, 19 May 2021 09:29:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84F3BAE39;
 Wed, 19 May 2021 09:29:48 +0000 (UTC)
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
X-Inumbo-ID: d5c28893-fc35-4c89-8241-fac1070c28d8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621416588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70fZJvNZqwFm//PLmJ2D6mSvvED+4URflxvX5wyUEiw=;
	b=UcrhyrzPWpUdVWTzvspsKzKq7tHfVXSF3pQQieM4GqdTK/6zK97L9U8oqfEUAtyQ/3JCtd
	/x8bQmv9YGusAr5cNsprTkCBWAM0LLPFZ3TARRzMo6w2F9qbVFA9uvbyZeicCR8zCaz73b
	gkWOBVM/In89PBmVi2WskOt3TLHe9jw=
Subject: Re: [PATCH v3 2/5] xen/x86: manually build xen.mb.efi binary
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
 <3c621726-31c4-6a79-a020-88c59644111b@suse.com>
 <74ea104d-3826-d80d-3af5-f444d065c73f@gmail.com>
 <a183a5f9-0f36-187d-fd06-8d6db99cbe43@suse.com>
 <20210517132039.6czppjfge27x4mwg@tomti.i.net-space.pl>
 <ee89a22d-5f46-51ed-4c46-63cfc60cbafc@suse.com>
 <20210518174633.spo5kmgcbuo6dg5k@tomti.i.net-space.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51333867-d693-38e2-bd1c-fce28241a604@suse.com>
Date: Wed, 19 May 2021 11:29:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518174633.spo5kmgcbuo6dg5k@tomti.i.net-space.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 19:46, Daniel Kiper wrote:
> On Mon, May 17, 2021 at 03:24:28PM +0200, Jan Beulich wrote:
>> On 17.05.2021 15:20, Daniel Kiper wrote:
>>> On Mon, May 17, 2021 at 08:48:32AM +0200, Jan Beulich wrote:
>>>> On 07.05.2021 22:26, Bob Eshleman wrote:
>>>>> What is your intuition WRT the idea that instead of trying add a PE/COFF hdr
>>>>> in front of Xen's mb2 bin, we instead go the route of introducing valid mb2
>>>>> entry points into xen.efi?
>>>>
>>>> At the first glance I think this is going to be less intrusive, and hence
>>>> to be preferred. But of course I haven't experimented in any way ...
>>>
>>> When I worked on this a few years ago I tried that way. Sadly I failed
>>> because I was not able to produce "linear" PE image using binutils
>>> exiting that days.
>>
>> What is a "linear" PE image?
> 
> The problem with Multiboot family protocols is that all code and data
> sections have to be glued together in the image and as such loaded into
> the memory (IIRC BSS is an exception but it has to live behind the
> image). So, you cannot use PE image which has different representation
> in file and memory. IIRC by default at least code and data sections in
> xen.efi have different sizes in PE file and in memory. I tried to fix
> that using linker script and objcopy but it did not work. Sadly I do
> not remember the details but there is pretty good chance you can find
> relevant emails in Xen-devel archive with me explaining what kind of
> problems I met.

Ah, this rings a bell. Even the .bss-is-last assumption doesn't hold,
because .reloc (for us as well as in general) comes later, but needs
loading (in the right place). Since even xen.gz isn't simply the
compressed linker output, but a post-processed (by mkelf32) image,
maybe what we need is a build tool doing similar post-processing on
xen.efi? Otoh getting disk image and in-memory image aligned ought
to be possible by setting --section-alignment= and --file-alignment=
to the same value (resulting in a much larger file) - adjusting file
positions would effectively be what a post-processing tool would need
to do (like with mkelf32 perhaps we could then at least save the
first ~2Mb of space). Which would still leave .reloc to be dealt with
- maybe we could place this after .init, but still ahead of
__init_end (such that the memory would get freed late in the boot
process). Not sure whether EFI loaders would "like" such an unusual
placement.

Also not sure what to do with Dwarf debug info, which just recently
we managed to avoid needing to strip unconditionally.

>>> Maybe
>>> newer binutils are more flexible and will be able to produce a PE image
>>> with properties required by Multiboot2 protocol.
>>
>> Isn't all you need the MB2 header within the first so many bytes of the
>> (disk) image? Or was it the image as loaded into memory? Both should be
>> possible to arrange for.
> 
> IIRC Multiboot2 protocol requires the header in first 32 kiB of an image.
> So, this is not a problem.

I was about to ask "Disk image or in-memory image?" But this won't
matter if the image as a whole got linearized, as long as the first
section doesn't start to high up. I notice that xen-syms doesn't fit
this requirement either, only the output of mkelf32 does. Which
suggests that there may not be a way around a post-processing tool.

Jan

