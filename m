Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B472513D9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 10:09:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAU0Y-0007fy-Ef; Tue, 25 Aug 2020 08:08:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h2I2=CD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kAU0X-0007ft-Kf
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 08:08:41 +0000
X-Inumbo-ID: 761a0939-de7e-40cf-9db2-3ea7ad24052f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 761a0939-de7e-40cf-9db2-3ea7ad24052f;
 Tue, 25 Aug 2020 08:08:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56CA6B1E9;
 Tue, 25 Aug 2020 08:09:10 +0000 (UTC)
Subject: Re: Kconfig vs tool chain capabilities
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <6d5a2014-5184-04f0-62f9-60ddd7537886@suse.com>
 <fb43a537-7b0d-0622-6e52-39e1a9e87b91@suse.com>
 <4449ee1b-6d2c-70f2-d8e9-80397aeffa41@suse.com>
 <f37d135a-d66a-450c-0b97-98c86de6f489@suse.com>
 <b783915a-9d64-4c68-7b71-f3b042b1201e@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <61d2adc1-c28f-7ed6-237e-45444249173c@suse.com>
Date: Tue, 25 Aug 2020 10:08:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b783915a-9d64-4c68-7b71-f3b042b1201e@suse.com>
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

On 25.08.20 09:48, Jan Beulich wrote:
> On 25.08.2020 09:43, Jürgen Groß wrote:
>> On 25.08.20 09:34, Jan Beulich wrote:
>>> On 25.08.2020 09:12, Jürgen Groß wrote:
>>>> I think both problems can be solved at the same time via the following
>>>> approach:
>>>>
>>>> - collect the data which is reflected in today's CONFIG_ variables in a
>>>>      single script and store it in a file, e.g in a format like:
>>>>
>>>>      CC_IS_GCC y
>>>>      GCC_VERSION 70500
>>>>      CLANG_VERSION 0
>>>>      CC_HAS_VISIBILITY_ATTRIBUTE y
>>>>
>>>> - check the tool data at each build to match the contents of that file
>>>>      and either fail the build or update the file and rerun kconfig if they
>>>>      don't match (I think failing the build and requiring to run a
>>>>      "make config" would be the better approach)
>>>>
>>>> - fill the CONFIG_ variable contents from that file in kconfig instead
>>>>      of issuing the single shell commands
>>>
>>> While I agree this is a possible model to use (but still not the
>>> one we've inherited from Linux), I fail to see how this addresses
>>> my "developers should be aware of what they do (not) build and
>>> test" concern: There'd still be dependencies of Kconfig options
>>> on the tool chain capabilities, and their prompts therefore would
>>> still be invisible without the tool chain having the needed
>>> capabilities. IOW I only see this to address 2), but not 1).
>>
>> Sorry, I fail to see a problem here.
>>
>> What sense does it make to be able to configure an option which the
>> tools don't support?
> 
> Take CET as an example (chosen because that's the one which
> already uses the Kconfig approach, despite my disagreement): It's
> quite relevant to know whether you're testing Xen with it enabled,
> or with it disabled (and hence you potentially missing changes you
> need to make to relevant code portions).

Correct me if I'm wrong, but assuming my suggested changes being made,
wouldn't a .config file setup once with CET enabled (and I assume you'd
try to enable CET on purpose when trying to test CET and you'd realize
not being able to do so in case your tools don't support CET) ensure
you'd never been hit by surprise when some tool updates would remove
CET support?

> 
>> Why aren't you concerned that you can't configure
>> ARM-specific options in an x86 build then?
> 
> I can't see how this is related.

You are asking for a way to select options not supported by the tools.
This is very similar to asking for the possibility to select options
not supported by the architecture.


Juergen

