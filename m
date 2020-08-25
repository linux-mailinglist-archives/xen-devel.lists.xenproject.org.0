Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DAF251344
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 09:35:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kATTK-0003oJ-BY; Tue, 25 Aug 2020 07:34:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kATTI-0003oE-Bt
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 07:34:20 +0000
X-Inumbo-ID: 05e9a9cb-4df0-4136-87b1-0dca3560d0ec
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05e9a9cb-4df0-4136-87b1-0dca3560d0ec;
 Tue, 25 Aug 2020 07:34:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5303AC82;
 Tue, 25 Aug 2020 07:34:44 +0000 (UTC)
Subject: Re: Kconfig vs tool chain capabilities
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <6d5a2014-5184-04f0-62f9-60ddd7537886@suse.com>
 <fb43a537-7b0d-0622-6e52-39e1a9e87b91@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4449ee1b-6d2c-70f2-d8e9-80397aeffa41@suse.com>
Date: Tue, 25 Aug 2020 09:34:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <fb43a537-7b0d-0622-6e52-39e1a9e87b91@suse.com>
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

On 25.08.2020 09:12, Jürgen Groß wrote:
> On 25.08.20 08:31, Jan Beulich wrote:
>> 1) Does it make sense for tool chain capabilities to be recorded?
>>
>> 2) Does the recording actually work reliably?
>>
>> As to 1), I'm personally of the opinion that the original model
>> was the better one, even if I can see advantages from downstream
>> (distro in particular) pov. Yet even for them it may mean they
>> would not get presented certain options which they may want to
>> enable, if only they knew they'd need to upgrade their tool
>> chain. For developers otoh, I don't think this model is a helpful
>> one: They absolutely should be aware of pieces they end up not
>> building (and which hence they're also not going test).
>>
>> (I'd like to note that there may certainly be cases where during
>> the building of the tree features get enabled/disabled by other
>> means without the person doing the build becoming aware. I think
>> such should equally be converted to Kconfig selections, with the
>> build simply failing if tool chain prereqs aren't met. The
>> typical case though is a choice between different ways of
>> generating code, with no effect on resulting functionality
>> beyond a possible difference in performance.)
>>
>> Additionally the answer to 2) is, I'm afraid, continuing to be
>> "No", as there is - afaict - no way for a once recorded .config
>> to get updated if the underlying tool chain changed. All options
>> to overcome this that I have been able to think of so far
>> (unconditional invocation of kconfig; hashing of involved [tool
>> chain] binaries) come with a pretty heavy overhead on build time
>> and/or other complications.
> 
> I think both problems can be solved at the same time via the following
> approach:
> 
> - collect the data which is reflected in today's CONFIG_ variables in a
>    single script and store it in a file, e.g in a format like:
> 
>    CC_IS_GCC y
>    GCC_VERSION 70500
>    CLANG_VERSION 0
>    CC_HAS_VISIBILITY_ATTRIBUTE y
> 
> - check the tool data at each build to match the contents of that file
>    and either fail the build or update the file and rerun kconfig if they
>    don't match (I think failing the build and requiring to run a
>    "make config" would be the better approach)
> 
> - fill the CONFIG_ variable contents from that file in kconfig instead
>    of issuing the single shell commands

While I agree this is a possible model to use (but still not the
one we've inherited from Linux), I fail to see how this addresses
my "developers should be aware of what they do (not) build and
test" concern: There'd still be dependencies of Kconfig options
on the tool chain capabilities, and their prompts therefore would
still be invisible without the tool chain having the needed
capabilities. IOW I only see this to address 2), but not 1).

Jan

