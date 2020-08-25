Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E28C8251845
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 14:08:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXkJ-0006Oq-5y; Tue, 25 Aug 2020 12:08:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAXkG-0006Oi-UA
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 12:08:08 +0000
X-Inumbo-ID: c0c3ec98-a3fc-4530-8613-7161a7676620
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0c3ec98-a3fc-4530-8613-7161a7676620;
 Tue, 25 Aug 2020 12:08:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D592B15F;
 Tue, 25 Aug 2020 12:08:37 +0000 (UTC)
Subject: Re: Kconfig vs tool chain capabilities
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <6d5a2014-5184-04f0-62f9-60ddd7537886@suse.com>
 <fb43a537-7b0d-0622-6e52-39e1a9e87b91@suse.com>
 <4449ee1b-6d2c-70f2-d8e9-80397aeffa41@suse.com>
 <f37d135a-d66a-450c-0b97-98c86de6f489@suse.com>
 <b783915a-9d64-4c68-7b71-f3b042b1201e@suse.com>
 <61d2adc1-c28f-7ed6-237e-45444249173c@suse.com>
 <cf7e8e5f-de4b-3046-8ffc-7ae4502d06c9@suse.com>
 <d4326ef6-d1bc-abd0-b428-00eabb04f761@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eee8748d-ccb9-a853-7759-3a61be74b815@suse.com>
Date: Tue, 25 Aug 2020 14:08:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d4326ef6-d1bc-abd0-b428-00eabb04f761@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.08.2020 11:49, Jürgen Groß wrote:
> On 25.08.20 10:48, Jan Beulich wrote:
>> On 25.08.2020 10:08, Jürgen Groß wrote:
>>> Correct me if I'm wrong, but assuming my suggested changes being made,
>>> wouldn't a .config file setup once with CET enabled (and I assume you'd
>>> try to enable CET on purpose when trying to test CET and you'd realize
>>> not being able to do so in case your tools don't support CET) ensure
>>> you'd never been hit by surprise when some tool updates would remove
>>> CET support?
>>
>> Probably, but that's not my point. With a CET-incapable tool chain
>> you're not prompted whether to enable CET in the first place, when
>> creating the initial .config. It is this unawareness of a crucial
>> part of code not getting built and tested (and likely unknowingly)
>> that I dislike. In fact, after Andrew's patches had gone in, it
>> had taken me a while to realize that in certain of my builds I don't
>> have CET enabled (despite me having done nothing to disable it), and
>> hence those builds working fine are meaningless for any changes
>> affecting CET code in any way.
> 
> Yes, this is the result of letting some options depend on others.
> 
> This is what I meant regarding the architecture: there are e.g. multiple
> source files in drivers/char/ being built only for ARM or X86, in spite
> of being located outside arch/. And yet you don't see this as a problem,
> even if you are not able to select those drivers to be built when using
> "the other" arch.

But they can't be enabled at all on x86.

> So IMO either we ban "depends on" from our Kconfig files (no, I don't
> want to do that), or we use it as designed and make it as user friendly
> as possible.

"depends on" can be quite useful without hiding anything from the
person configuring Xen: You can have dependent features be disabled
by disabling a top level feature (via answering a respective prompt).
There are only certain kinds of "depends on" which are problematic in
this regard.

> And BTW, I can't see how setting the tolls' capabilities from e.g.
> arch/x86/Rules.mk is better in any way (see how CONFIG_INDIRECT_THUNK
> got its value in older Xen versions like 4.12).

I've alluded to this not being any better in my initial mail.

Jan

