Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0260F1CF63F
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 15:55:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYVN9-0006NQ-6l; Tue, 12 May 2020 13:55:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYVN7-0006NL-K8
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 13:55:01 +0000
X-Inumbo-ID: 2b3eab6d-9458-11ea-a2ad-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b3eab6d-9458-11ea-a2ad-12813bfff9fa;
 Tue, 12 May 2020 13:55:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EC6DDAE8C;
 Tue, 12 May 2020 13:55:01 +0000 (UTC)
Subject: Re: [PATCH 05/16] x86/shstk: Introduce Supervisor Shadow Stack support
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-6-andrew.cooper3@citrix.com>
 <d0347fec-3ccb-daa7-5c4d-f0e74b5fb247@suse.com>
 <00302d53-499a-7f6e-76a5-a5eec4e11252@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dc585fec-e325-70a4-94e3-32205d84b1ea@suse.com>
Date: Tue, 12 May 2020 15:54:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <00302d53-499a-7f6e-76a5-a5eec4e11252@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.2020 17:46, Andrew Cooper wrote:
> On 04/05/2020 14:52, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -34,6 +34,9 @@ config ARCH_DEFCONFIG
>>>  config INDIRECT_THUNK
>>>  	def_bool $(cc-option,-mindirect-branch-register)
>>>  
>>> +config HAS_AS_CET
>>> +	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy;endbr64)
>> I see you add as-instr here as a side effect. Until the other
>> similar checks get converted, I think for the time being we should
>> use the old model, to have all such checks in one place. I realize
>> this means you can't have a Kconfig dependency then.
> 
> No.  That's like asking me to keep on using bool_t, and you are the
> first person to point out and object to that in newly submitted patches.

These are entirely different things. The bool_t => bool
conversion is agreed upon. The conversion to record tool chain
capabilities in xen/.config isn't. I've raised my reservations
against this elsewhere. I can be convinced, but not by trying to
introduce such functionality as a side effect of an unrelated
change.

>> Also why do you check multiple insns, when just one (like we do
>> elsewhere) would suffice?
> 
> Because CET-SS and CET-IBT are orthogonal ABIs, but you wanted a single
> CET symbol, rather than a CET_SS symbol.
> 
> I picked a sample of various instructions to get broad coverage of CET
> without including every instruction.

I wanted HAS_AS_CET rather than HAS_AS_CET_SS and HAS_AS_CET_IBT
because both got added to gas at the same time, and hence there's
little point in having separate symbols. If there was a reason to
assume assemblers might be out there which support one but not
the other, then we indeed ought to have two symbols.

>> The crucial insns to check are those which got changed pretty
>> close before the release of 2.29 (in the cover letter you
>> mention 2.32): One of incssp{d,q}, setssbsy, or saveprevssp.
>> There weren't official binutils releases with the original
>> insns, but distros may still have picked up intermediate
>> snapshots.
> 
> I've got zero interest in catering to distros which are still using
> obsolete pre-release toolchains.  Bleeding edge toolchains are one
> thing, but this is like asking us to support the middle changeset of the
> series introducing CET, which is absolutely a non-starter.
> 
> If the instructions were missing from real binutils releases, then
> obviously we should exclude those releases, but that doesn't appear to
> be the case.

But you realize that there's no special effort needed? We merely
need to check for the right insns. Their operands not matching
for binutils from the intermediate time window is enough for our
purposes. With my remark I merely meant to guide which of the
three insns you've picked needs to remain, and which would imo
better be dropped.

>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -95,6 +95,36 @@ unsigned long __initdata highmem_start;
>>>  size_param("highmem-start", highmem_start);
>>>  #endif
>>>  
>>> +static bool __initdata opt_xen_shstk = true;
>>> +
>>> +static int parse_xen(const char *s)
>>> +{
>>> +    const char *ss;
>>> +    int val, rc = 0;
>>> +
>>> +    do {
>>> +        ss = strchr(s, ',');
>>> +        if ( !ss )
>>> +            ss = strchr(s, '\0');
>>> +
>>> +        if ( (val = parse_boolean("shstk", s, ss)) >= 0 )
>>> +        {
>>> +#ifdef CONFIG_XEN_SHSTK
>>> +            opt_xen_shstk = val;
>>> +#else
>>> +            no_config_param("XEN_SHSTK", "xen", s, ss);
>>> +#endif
>>> +        }
>>> +        else
>>> +            rc = -EINVAL;
>>> +
>>> +        s = ss + 1;
>>> +    } while ( *ss );
>>> +
>>> +    return rc;
>>> +}
>>> +custom_param("xen", parse_xen);
>> What's the idea here going forward, i.e. why the new top level
>> "xen" option? Almost all options are for Xen itself, after all.
>> Did you perhaps mean this to be "cet"?
> 
> I forgot an RFC for this, as I couldn't think of anything better.  "cet"
> as a top level option isn't going to gain more than {no-}shstk and
> {no-}ibt as suboptions.

Imo that's still better than "xen=".

>>> --- a/xen/scripts/Kconfig.include
>>> +++ b/xen/scripts/Kconfig.include
>>> @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
>>>  # Return y if the linker supports <flag>, n otherwise
>>>  ld-option = $(success,$(LD) -v $(1))
>>>  
>>> +# $(as-instr,<instr>)
>>> +# Return y if the assembler supports <instr>, n otherwise
>>> +as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
>> CLANG_FLAGS caught my eye here, then noticing that cc-option
>> also uses it. Anthony - what's the deal with this? It doesn't
>> look to get defined anywhere, and I also don't see what clang-
>> specific about these constructs.
> 
> This is as it inherits from Linux.  There is obviously a reason.
> 
> However, I'm not interested in diving into that rabbit hole in an
> unrelated series.

That's fine - my question was directed at Anthony after all.

Jan

