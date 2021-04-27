Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C73436C723
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 15:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118529.224703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNwy-0000fO-Mt; Tue, 27 Apr 2021 13:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118529.224703; Tue, 27 Apr 2021 13:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNwy-0000ez-JT; Tue, 27 Apr 2021 13:40:28 +0000
Received: by outflank-mailman (input) for mailman id 118529;
 Tue, 27 Apr 2021 13:40:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbNwx-0000eu-6C
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 13:40:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0deed7d-9c02-4296-a84b-c5553139defb;
 Tue, 27 Apr 2021 13:40:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DFF2B1A6;
 Tue, 27 Apr 2021 13:40:25 +0000 (UTC)
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
X-Inumbo-ID: d0deed7d-9c02-4296-a84b-c5553139defb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619530825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e0K88bY66T/sELGaa669kb2WYhoeCelsVAdFOgrePek=;
	b=B2h62G1DSzLbn36CgDtN9js73koLTE+aiFaHVnjtgc0CxpvknOVghWdklQFOFX5aWIQT5o
	qcSI4JQ3O+G9rC3T93DcLHNlxyV8vmDzp/2JO4p0L5fBnJB/g8ILkOebi0Fi5Wwno+R5Tu
	9J0SEZm70GTwiYo+Yh55l4+BSMerPTs=
Subject: Re: [PATCH] build: centralize / unify asm-offsets generation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
 <YH7zXpPz03+kLzEr@Air-de-Roger>
 <e9de883b-604b-1193-b748-5a59795a9f31@suse.com>
 <YH7/SvkrB2yGgRij@Air-de-Roger>
 <5170aa51-8e34-3a45-5bf6-c0a187b1c427@suse.com>
 <YIfTyT4rvD9yEqiM@Air-de-Roger>
 <5018479d-b566-a32b-9a01-5ccf01fe0880@suse.com>
 <YIgSNRq2w7KSSaiD@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9a7b3c5-db38-76d8-64ec-2cfd9f46f1fd@suse.com>
Date: Tue, 27 Apr 2021 15:40:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIgSNRq2w7KSSaiD@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.04.2021 15:31, Roger Pau Monné wrote:
> On Tue, Apr 27, 2021 at 02:30:35PM +0200, Jan Beulich wrote:
>> On 27.04.2021 11:05, Roger Pau Monné wrote:
>>> On Wed, Apr 21, 2021 at 04:09:03PM +0200, Jan Beulich wrote:
>>>> On 20.04.2021 18:20, Roger Pau Monné wrote:
>>>>> On Tue, Apr 20, 2021 at 05:47:49PM +0200, Jan Beulich wrote:
>>>>>> On 20.04.2021 17:29, Roger Pau Monné wrote:
>>>>>>> On Thu, Apr 01, 2021 at 10:33:47AM +0200, Jan Beulich wrote:
>>>>>>>> @@ -399,7 +399,11 @@ include/xen/compile.h: include/xen/compi
>>>>>>>>  	@sed -rf tools/process-banner.sed < .banner >> $@.new
>>>>>>>>  	@mv -f $@.new $@
>>>>>>>>  
>>>>>>>> -include/asm-$(TARGET_ARCH)/asm-offsets.h: arch/$(TARGET_ARCH)/asm-offsets.s
>>>>>>>> +asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
>>>>>>>> +	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
>>>>>>>> +	$(call move-if-changed,$@.new,$@)
>>>>>>>
>>>>>>> Won't it be more natural to keep the .s file in arch/$(TARGET_ARCH)?
>>>>>>
>>>>>> Yes and no: Yes as far as the actual file location is concerned.
>>>>>> No when considering where it gets generated: I generally consider
>>>>>> it risky to generate files outside of the directory where make
>>>>>> currently runs. There may be good reasons for certain exceptions,
>>>>>> but personally I don't see this case as good enough a reason.
>>>>>>
>>>>>> Somewhat related - if doing as you suggest, which Makefile's
>>>>>> clean: rule should clean up that file in your opinion?
>>>>>
>>>>> The clean rule should be in the makefile where it's generated IMO,
>>>>> same as asm-offsets.h clean rule currently in xen/Makefile.
>>>>>
>>>>>> Nevertheless, if there's general agreement that keeping the file
>>>>>> there is better, I'd make the change and simply ignore my unhappy
>>>>>> feelings about it.
>>>>>
>>>>> I don't have a strong opinion, it just feels weird to have this IMO
>>>>> stray asm-offsets.s outside of it's arch directory, taking into
>>>>> account that we have asm-offsets.h generated from xen/Makefile into an
>>>>> arch specific directory already as a precedent in that makefile.
>>>>
>>>> Well, asm-offsets.h generation doesn't involve the compiler, hence
>>>> no .*.d files get generated and want including later. For
>>>> asm-offsets.s to have dependencies properly honored, if we
>>>> generated it in xen/arch/<arch>, .asm-offsets.d would also end up
>>>> there, and hence including of it would need separately taking care
>>>> of.
>>>
>>> I'm not sure I understand what do you mean with inclusion need taking
>>> care of separately. Isn't it expected for .d file to reside in the
>>> same directory as the output,
>>
>> Yes, ...
>>
>>> and hence picked up automatically?
>>
>> ... and hence they _wouldn't_ be picked up automatically while
>> building in xen/ if the .s file got created in xen/arch/<arch>/.
> 
> Hm, so that would prevent re-building the target when the dependencies
> changed as the .d file being in the arch directory would attempt the
> rebuild from there instead of the top level xen/?

No, in the arch directory nothing should happen at all, as there's
no rule to rebuild asm-offsets.s. And if we built it in the subarch
directory (where asm-offsets.c lives), the wrong rule would kick in
(the general one compiling C to assembly).

> I guess the alternative would be to force a rebuild of the target
> every time, in order to not depend on the .d logic?

Simply rebuilding always is not going to be good: There should be
no re-building at all when actually just installing Xen. Hence
while move-if-changed would be able to suppress the bulk of the
fallout, this would still be too much rebuilding for my taste in
that specific case.

The option I've been hinting at was to explicitly include the .d
files from the arch dir. But I don't really like this either ...

Jan

