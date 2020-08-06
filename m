Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC02223DA30
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 14:05:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3edX-0001CW-TE; Thu, 06 Aug 2020 12:04:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3edW-0001CO-E4
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 12:04:42 +0000
X-Inumbo-ID: 5ccde9d2-8749-4329-9cb7-b4be8137846f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ccde9d2-8749-4329-9cb7-b4be8137846f;
 Thu, 06 Aug 2020 12:04:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3417ACC6;
 Thu,  6 Aug 2020 12:04:57 +0000 (UTC)
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
To: Trammell Hudson <hudson@trmm.net>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
 <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
Date: Thu, 6 Aug 2020 14:04:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 13:44, Trammell Hudson wrote:
> On Thursday, August 6, 2020 9:57 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> Overall I think it might help if this PE parsing code (if UEFI
>> doesn't offer a protocol to do it for us) was put into its own
>> source file.
> 
> I tried to putting it into a separate file and ran into link issues,
> seems that it needs to be mentioned in both arch/x86/Makefile and
> arch/x86/pe/Makefile, so this was a "just make it work" for the PoC.
> Now that it is working, I'll go back to see if I can figure out the
> makefile magic.

I was rather thinking of e.g. xen/common/efi/pe.c.

>> I also wonder if it wouldn't better be optional
>> (i.e. depend on a Kconfig option).
> 
> My preference would be to have it always on so that any Xen
> executable can be unified and signed by the end user, rather than
> requiring the user to do a separate build from source. For instance,
> the Qubes install DVD has a normal xen.efi, but I can generate my own
> signed version for my system by unifying it with the kernel and
> initrd.

It's still a choice that can be left to the distro imo. In particular
embedded use cases may want to save the extra logic.

>>> -   if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, NULL, &size, buf) != EFI_SUCCESS )
>>> -          return false;
>>> -   return buf[0] != 0;
>>
>> I.e. "SecureBoot=N" still means "enabled"?
> 
> Maybe? UEFI 2.8, section 3.3 "Global Variables" says for SecureBoot:
> 
> "Whether the platform firmware is operating in Secure boot mode (1) or not (0). All other values
> are reserved. Should be treated as read-only."

But in your expression that's then presumably '0', not 0?

>> Also, considering kernel and initrd are embedded, is there really a
>> strict need for a config file? It would seem to me that you could
>> boot the system fine without.
> 
> The config file is still necessary for Xen options (console, etc) as
> well as the kernel command line.

But command line options are optional. Yes, you need a config file if
you want to pass any options. But you may be able to get away without
command line options, and hence without config file.

>> [...]
>> Once you know whether you're dealing with a "unified" image, you
>> shouldn't have a need to make logic dependent upon read_section()
>> finding a particular section: Either you find all of them (and
>> don't even try to interpret respective config file settings), or
>> you read everything from disk.
> 
> Another option that might be better would be to have a "special"
> file name -- if the config file has a leading "." then read_file()
> could do the PE section search instead of going to the disk.
> That way the config file could have some things on disk, and
> some things unified.

The config file name can by supplied on the xen.efi command line.
There's nothing keeping a user from choosing a "special" file name.
Hence your only option here would be to pick something which is
guaranteed to not be a valid file name, not matter what file system.
IOW - I'm unconvinced this is the route to go.

>> [...]
>>> +# Xen goes up to a pad at 00400000
>>
>> "pad at 00400000"?
> 
> $ objdump -h xen.efi
> 
> xen.efi:     file format pei-x86-64
> 
> Sections:
> Idx Name          Size      VMA               LMA               File off  Algn
> [...]
>   8 .pad          00400000  ffff82d040c00000  ffff82d040c00000  00000000  2**2
>                   ALLOC
> 
> There is this pad at the end of the image; I wasn't sure if it was important,
> so I had the script deposit the extra sections after it.  Hopefully there is
> someway to automatically figure out the correct address for the additional
> segments.

There's no useful data in this section - see the linker script for
why it exists. But an important issue here again is that there
shouldn't be hard coded numbers. The size of this section can
easily change over time.

>>> +objcopy \
>>> -   --add-section .kernel="$KERNEL" \
>>> -   --add-section .ramdisk="$RAMDISK" \
>>> -   --add-section .config="$CONFIG" \
>>> -   --change-section-vma .config=0xffff82d041000000 \
>>> -   --change-section-vma .kernel=0xffff82d041010000 \
>>> -   --change-section-vma .ramdisk=0xffff82d042000000 \
>>
>> Of course these hard coded numbers will be eliminated in the
>> long run?
> 
> Ideally.  We could try to parse out the address based on the objdump output,
> although oddly systemd-boot has hardcoded ones as well.

Perhaps the Linux kernel (or whatever else they work on) doesn't
ever change addresses. The addresses shown here have changed just
recently (they moved down by 1Gb). Earlier today I've submitted a
patch where, in the course of putting together, I did consider
whether I'd change the virtual memory layout again (and then even
conditionally upon CONFIG_PV32).

Jan

