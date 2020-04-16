Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2691ABA13
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 09:36:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOz4R-00020V-1Q; Thu, 16 Apr 2020 07:36:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOz4P-00020P-BX
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 07:36:21 +0000
X-Inumbo-ID: f663a076-7fb4-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f663a076-7fb4-11ea-9e09-bc764e2007e4;
 Thu, 16 Apr 2020 07:36:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D4549AD1E;
 Thu, 16 Apr 2020 07:36:17 +0000 (UTC)
Subject: Re: [XEN PATCH v4 12/18] xen/build: factorise generation of the
 linker scripts
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-13-anthony.perard@citrix.com>
 <af0121cc-c282-ceb0-b5e8-44ac0ba6ebfb@suse.com>
 <20200415165832.GE4088@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6001a8a3-aed6-0e74-f82d-823853e44483@suse.com>
Date: Thu, 16 Apr 2020 09:36:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415165832.GE4088@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 18:58, Anthony PERARD wrote:
> On Wed, Apr 08, 2020 at 02:46:42PM +0200, Jan Beulich wrote:
>> On 31.03.2020 12:30, Anthony PERARD wrote:
>>>     - avoid using "define" for cmd_cc_lds_S, as adding '; \' on each line is
>>>       still mandatory for if_changed (or cmd) macro to work.
>>
>> I still don't believe in there being a need for "; \" there. This
>> actually breaks things, after all:
>>
>>> --- a/xen/Rules.mk
>>> +++ b/xen/Rules.mk
>>> @@ -236,6 +236,12 @@ cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
>>>  %.s: %.S FORCE
>>>  	$(call if_changed,cpp_s_S)
>>>  
>>> +# Linker scripts, .lds.S -> .lds
>>> +quiet_cmd_cc_lds_S = LDS     $@
>>> +cmd_cc_lds_S = $(CPP) -P $(filter-out -Wa$(comma)%,$(a_flags)) -o $@ $<; \
>>> +    sed -e 's/.*\.lds\.o:/$(@F):/g' <$(dot-target).d >$(dot-target).d.new; \
>>> +    mv -f $(dot-target).d.new $(dot-target).d
>>
>> if $(CPP) or sed fail, previously the whole rule would have failed,
>> which no longer is the case with your use of semicolons. There
>> ought to be a solution to this, ideally one better than adding
>> "set -e" as the first command ("define" would at least deal with
>> the multi-line make issue, but without it being clear to me why the
>> semicolons would be needed I don't think I can suggest anything
>> there at the moment).
> 
> The only macro that will consumes cmd_cc_lds_S (and other cmd_*) is
> "cmd", it is defined as:
>     cmd = @set -e; $(echo-cmd) $(cmd_$(1))
> So, "set -e" is already there, and using semicolons in commands is
> equivalent to using "&&".
> 
> With "cmd" alone, multi-line command would work as expected (unless
> $(echo-cmd) is is trying to print the command line).
> 
> It's "if_changed" macro that doesn't work with multi-line commands.
> It does:
>     $(cmd); printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd
> With a multiple line command, $(make-cmd) get's expanded to multiple
> line, so the second argument of "printf" is going to be spread over
> multiple line in make, and thus multiple shell. We run into this error:
>     /bin/sh: -c: line 0: unexpected EOF while looking for matching `''
>     /bin/sh: -c: line 1: syntax error: unexpected end of file
> 
> This is why we need to have commands on a single line.
> 
> I hope the explanation is clear enough.

Yes, thanks. One question remains though: Why do we need multiple
commands here in the first place, when Linux gets away with one?

Two other remarks: For one the command's name, aiui, ought to be
cmd_cpp_lds_S (see Linux). And there ought to be cpp_flags, which
would then also be used by e.g. cmd_s_S (instead of both having
$(filter-out -Wa$(comma)%,$(a_flags)) open-coded).

Jan

