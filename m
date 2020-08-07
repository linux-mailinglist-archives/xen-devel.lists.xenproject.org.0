Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023CC23E8EC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 10:30:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3xkV-0005uO-LW; Fri, 07 Aug 2020 08:29:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3xkT-0005uJ-W9
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 08:29:10 +0000
X-Inumbo-ID: 75d6fa44-6226-4554-89e2-2c4716fd734a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75d6fa44-6226-4554-89e2-2c4716fd734a;
 Fri, 07 Aug 2020 08:29:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1AA53AAC7;
 Fri,  7 Aug 2020 08:29:26 +0000 (UTC)
Subject: Re: EFI executable corruption when live patching is turned off
To: Trammell Hudson <hudson@trmm.net>
References: <3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=@trmm.net>
 <a72c87a1-c725-04d0-2b1c-4092c4170a34@suse.com>
 <aqOz6WXf04xXyZWiHQBxn5cS1V3ZdgCYb4DFVCGULA8ZPqG-0QAd_eg-Rgti5SK1-K9uxrcZTjXEp-CUPqCd5muymPLqPH2UJgUsyIPa0nQ=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8429c8d0-053a-ea57-bf6b-3d515f2cfb6a@suse.com>
Date: Fri, 7 Aug 2020 10:29:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <aqOz6WXf04xXyZWiHQBxn5cS1V3ZdgCYb4DFVCGULA8ZPqG-0QAd_eg-Rgti5SK1-K9uxrcZTjXEp-CUPqCd5muymPLqPH2UJgUsyIPa0nQ=@trmm.net>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 20:10, Trammell Hudson wrote:
> On Thursday, August 6, 2020 6:40 PM, Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 05.08.2020 20:19, Trammell Hudson wrote:
>> [...]
>>> ~/build/xen-clean/xen$ objcopy xen.efi test.efi
>>> objcopy: test.efi: Data Directory size (1c) exceeds space left in section (18)
>>> objcopy: test.efi: error copying private BFD data: file in wrong format
>>> ~/build/xen-clean/xen$ objcopy --version | head -1
>>> GNU objcopy (GNU Binutils for Ubuntu) 2.34
>>
>> I've tried to find a sensible way to fix this in objcopy, but could
>> come up with only a somewhat hackish variant:
>> https://sourceware.org/pipermail/binutils/2020-August/112746.html
>> Let's see what the maintainers there think, or if they have better
>> suggestions (or are willing to address this themselves). The issue
>> is pretty certainly not tied to LIVEPATCH, but rather to how much
>> padding space there is at the end of the .rodata section.
> 
> Thanks for tracking that down!  I was also almost certain it was not a livepatch issue, although that was the easiest minimal test case that I could produce.
> 
> As a workaround for the Xen project, what do you think of forcing alignment on .buildid so that the tool is happy:
> 
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 111edb5..712ffc8 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -161,6 +161,7 @@ SECTIONS
>         __note_gnu_build_id_end = .;
>    } :note :text
>  #elif defined(BUILD_ID_EFI)
> +  . = ALIGN(4096);
>    DECL_SECTION(.buildid) {
>         __note_gnu_build_id_start = .;
>         *(.buildid)

Only as a last resort, when it gets in the way of something that's in
the upstream tree. I.e. suitably described and commented you could
make this part of your future submission. I don't think a full 4096
bytes of alignment are actually needed, though - afaict 32 bytes ought
to suffice.

Jan

