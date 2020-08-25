Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757ED25138A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 09:48:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAThA-0005BX-Qr; Tue, 25 Aug 2020 07:48:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kATh9-0005BO-F2
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 07:48:39 +0000
X-Inumbo-ID: 4d720dde-928c-4c26-a060-562ac1300288
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d720dde-928c-4c26-a060-562ac1300288;
 Tue, 25 Aug 2020 07:48:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68013ABD2;
 Tue, 25 Aug 2020 07:49:04 +0000 (UTC)
Subject: Re: Kconfig vs tool chain capabilities
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <6d5a2014-5184-04f0-62f9-60ddd7537886@suse.com>
 <fb43a537-7b0d-0622-6e52-39e1a9e87b91@suse.com>
 <4449ee1b-6d2c-70f2-d8e9-80397aeffa41@suse.com>
 <f37d135a-d66a-450c-0b97-98c86de6f489@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b783915a-9d64-4c68-7b71-f3b042b1201e@suse.com>
Date: Tue, 25 Aug 2020 09:48:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f37d135a-d66a-450c-0b97-98c86de6f489@suse.com>
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

On 25.08.2020 09:43, Jürgen Groß wrote:
> On 25.08.20 09:34, Jan Beulich wrote:
>> On 25.08.2020 09:12, Jürgen Groß wrote:
>>> I think both problems can be solved at the same time via the following
>>> approach:
>>>
>>> - collect the data which is reflected in today's CONFIG_ variables in a
>>>     single script and store it in a file, e.g in a format like:
>>>
>>>     CC_IS_GCC y
>>>     GCC_VERSION 70500
>>>     CLANG_VERSION 0
>>>     CC_HAS_VISIBILITY_ATTRIBUTE y
>>>
>>> - check the tool data at each build to match the contents of that file
>>>     and either fail the build or update the file and rerun kconfig if they
>>>     don't match (I think failing the build and requiring to run a
>>>     "make config" would be the better approach)
>>>
>>> - fill the CONFIG_ variable contents from that file in kconfig instead
>>>     of issuing the single shell commands
>>
>> While I agree this is a possible model to use (but still not the
>> one we've inherited from Linux), I fail to see how this addresses
>> my "developers should be aware of what they do (not) build and
>> test" concern: There'd still be dependencies of Kconfig options
>> on the tool chain capabilities, and their prompts therefore would
>> still be invisible without the tool chain having the needed
>> capabilities. IOW I only see this to address 2), but not 1).
> 
> Sorry, I fail to see a problem here.
> 
> What sense does it make to be able to configure an option which the
> tools don't support?

Take CET as an example (chosen because that's the one which
already uses the Kconfig approach, despite my disagreement): It's
quite relevant to know whether you're testing Xen with it enabled,
or with it disabled (and hence you potentially missing changes you
need to make to relevant code portions).

> Why aren't you concerned that you can't configure
> ARM-specific options in an x86 build then?

I can't see how this is related.

Jan

