Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63A25170D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:06:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAWmL-0007Mj-K4; Tue, 25 Aug 2020 11:06:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h2I2=CD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kAWmJ-0007Me-C1
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:06:11 +0000
X-Inumbo-ID: af287de5-54e9-4a42-be3b-d21649547ada
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af287de5-54e9-4a42-be3b-d21649547ada;
 Tue, 25 Aug 2020 11:06:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B62F6ABA2;
 Tue, 25 Aug 2020 11:06:39 +0000 (UTC)
Subject: Re: Kconfig vs tool chain capabilities
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, nd <nd@arm.com>
References: <6d5a2014-5184-04f0-62f9-60ddd7537886@suse.com>
 <fb43a537-7b0d-0622-6e52-39e1a9e87b91@suse.com>
 <4449ee1b-6d2c-70f2-d8e9-80397aeffa41@suse.com>
 <f37d135a-d66a-450c-0b97-98c86de6f489@suse.com>
 <b783915a-9d64-4c68-7b71-f3b042b1201e@suse.com>
 <61d2adc1-c28f-7ed6-237e-45444249173c@suse.com>
 <cf7e8e5f-de4b-3046-8ffc-7ae4502d06c9@suse.com>
 <d4326ef6-d1bc-abd0-b428-00eabb04f761@suse.com>
 <B6E80F54-20D1-4ABF-AA19-8B3D0566DA7B@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7075bb73-4682-4d17-97ab-3b04e245795a@suse.com>
Date: Tue, 25 Aug 2020 13:06:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <B6E80F54-20D1-4ABF-AA19-8B3D0566DA7B@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.08.20 12:17, Bertrand Marquis wrote:
> 
> 
>> On 25 Aug 2020, at 10:49, Jürgen Groß <jgross@suse.com> wrote:
>>
>> On 25.08.20 10:48, Jan Beulich wrote:
>>> On 25.08.2020 10:08, Jürgen Groß wrote:
>>>> On 25.08.20 09:48, Jan Beulich wrote:
>>>>> On 25.08.2020 09:43, Jürgen Groß wrote:
>>>>>> On 25.08.20 09:34, Jan Beulich wrote:
>>>>>>> On 25.08.2020 09:12, Jürgen Groß wrote:
>>>>>>>> I think both problems can be solved at the same time via the following
>>>>>>>> approach:
>>>>>>>>
>>>>>>>> - collect the data which is reflected in today's CONFIG_ variables in a
>>>>>>>>       single script and store it in a file, e.g in a format like:
>>>>>>>>
>>>>>>>>       CC_IS_GCC y
>>>>>>>>       GCC_VERSION 70500
>>>>>>>>       CLANG_VERSION 0
>>>>>>>>       CC_HAS_VISIBILITY_ATTRIBUTE y
>>>>>>>>
>>>>>>>> - check the tool data at each build to match the contents of that file
>>>>>>>>       and either fail the build or update the file and rerun kconfig if they
>>>>>>>>       don't match (I think failing the build and requiring to run a
>>>>>>>>       "make config" would be the better approach)
>>>>>>>>
>>>>>>>> - fill the CONFIG_ variable contents from that file in kconfig instead
>>>>>>>>       of issuing the single shell commands
>>>>>>>
>>>>>>> While I agree this is a possible model to use (but still not the
>>>>>>> one we've inherited from Linux), I fail to see how this addresses
>>>>>>> my "developers should be aware of what they do (not) build and
>>>>>>> test" concern: There'd still be dependencies of Kconfig options
>>>>>>> on the tool chain capabilities, and their prompts therefore would
>>>>>>> still be invisible without the tool chain having the needed
>>>>>>> capabilities. IOW I only see this to address 2), but not 1).
>>>>>>
>>>>>> Sorry, I fail to see a problem here.
>>>>>>
>>>>>> What sense does it make to be able to configure an option which the
>>>>>> tools don't support?
>>>>>
>>>>> Take CET as an example (chosen because that's the one which
>>>>> already uses the Kconfig approach, despite my disagreement): It's
>>>>> quite relevant to know whether you're testing Xen with it enabled,
>>>>> or with it disabled (and hence you potentially missing changes you
>>>>> need to make to relevant code portions).
>>>>
>>>> Correct me if I'm wrong, but assuming my suggested changes being made,
>>>> wouldn't a .config file setup once with CET enabled (and I assume you'd
>>>> try to enable CET on purpose when trying to test CET and you'd realize
>>>> not being able to do so in case your tools don't support CET) ensure
>>>> you'd never been hit by surprise when some tool updates would remove
>>>> CET support?
>>> Probably, but that's not my point. With a CET-incapable tool chain
>>> you're not prompted whether to enable CET in the first place, when
>>> creating the initial .config. It is this unawareness of a crucial
>>> part of code not getting built and tested (and likely unknowingly)
>>> that I dislike. In fact, after Andrew's patches had gone in, it
>>> had taken me a while to realize that in certain of my builds I don't
>>> have CET enabled (despite me having done nothing to disable it), and
>>> hence those builds working fine are meaningless for any changes
>>> affecting CET code in any way.
>>
>> Yes, this is the result of letting some options depend on others.
>>
>> This is what I meant regarding the architecture: there are e.g. multiple
>> source files in drivers/char/ being built only for ARM or X86, in spite
>> of being located outside arch/. And yet you don't see this as a problem,
>> even if you are not able to select those drivers to be built when using
>> "the other" arch. They are silently disabled. Just like CET in case of
>> an incapable tool chain.
>>
>> So IMO either we ban "depends on" from our Kconfig files (no, I don't
>> want to do that), or we use it as designed and make it as user friendly
>> as possible. In case we as developers have a special test case then we
>> need to check the .config whether the desired settings are really
>> present. Having those settings depending on tool capabilities in a
>> specific file will make this check much easier.
>>
>> And BTW, I can't see how setting the tolls' capabilities from e.g.
>> arch/x86/Rules.mk is better in any way (see how CONFIG_INDIRECT_THUNK
>> got its value in older Xen versions like 4.12).
>>
>> We can't have everything and I believe automatically disabling features
>> which can't work with the current tools is a sane decision. Doing this
>> via Kconfig is the better approach compared to Makefile sniplets IMO.
> 
> That sounds like a nice feature to have some compiler or tools options that
> can be selected or activated in Kconfig. There are some compiler options
> mandatory to handle some erratas or XSA that one might want to explicitely
> select.
> 
> I am bit unsure about the part where some kconfig options would only
> be available or not depending on some tests with the compiler being doing
> prior to opening the editor. I would guess the menuconfig process would
> have to first run some tests and then generated some HAS_ configuration
> options depending on the result of the tests.
> Did i got the idea right here ?
> Is this something somebody tried to do ?
> 
> As a user I would more expect that the build process would tell me that my
> configuration is invalid because i selected something that is not supported
> by my compiler. I might have the chance to just fix my build to use the right
> compiler (like by mistake using x86 toolchain to compile for arm).
> 
> We should also be careful not to silently ignore some configuration option if
> one is changing the compiler and the new one does not support an option.
> A user would have his configuration and compile using it without
> passing through the editor interface and might need to be aware that a part
> of his configuration is not valid anymore because the tools he is using changed.
> This is something that could occur a lot when using a distribution toolchain.
> 
> Also there are some compiler option changing so i would more think that
> there should be generic configuration options so that in the makefiles we
> could have the opportunity to add different compiler options for different
> toolchains depending on the version or the type of the toolchain.
> 
> To be clear i would see something like:
> 
> in kconfig:
> COMPILER_OPTION_XXX
> 	bool “activate XXX compiler flag
> 
> in Makefile:
> ifeq ($(CONFIG_COMPILER_OPTION_XXX), true)
> test_compiler_cxx:
> 	$(CC) -xxx dummy.c -o dummy || $(error Your compiler does not support -xxx)
> 
> cc-flags += -xxx
> endif
> 
> The syntax is wrong here but you get the idea :-)

Ah, okay, this is another approach, which might be even more flexible.
It would allow to control compiler flags instead of more high level
features.

In case we want to go that route we should default COMPILER_OPTION_XXX
to the current tool capabilities in order to avoid longer try-and-error
loops.


Juergen

