Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9431C1E79EA
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 11:56:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebkq-0004i0-HQ; Fri, 29 May 2020 09:56:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ub4=7L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jebko-0004hq-FY
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 09:56:42 +0000
X-Inumbo-ID: b226005c-a192-11ea-a884-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b226005c-a192-11ea-a884-12813bfff9fa;
 Fri, 29 May 2020 09:56:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7AFF1ACC3;
 Fri, 29 May 2020 09:56:40 +0000 (UTC)
Subject: Re: [PATCH v10 07/12] xen: provide version information in hypfs
To: Jan Beulich <jbeulich@suse.com>
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-8-jgross@suse.com>
 <88b80e61-3fb4-8f89-0597-d6959033478b@suse.com>
 <65af43c0-2ed4-4330-501f-d561468b7a0e@suse.com>
 <efb1abe3-781e-8f17-0bdd-bb15e78f05e0@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6b54a551-d42d-33fa-bcc7-4b9c249e5b84@suse.com>
Date: Fri, 29 May 2020 11:56:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <efb1abe3-781e-8f17-0bdd-bb15e78f05e0@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.20 11:53, Jan Beulich wrote:
> On 29.05.2020 11:19, Jürgen Groß wrote:
>> On 29.05.20 10:34, Jan Beulich wrote:
>>> On 19.05.2020 09:21, Juergen Gross wrote:
>>>> @@ -373,6 +374,52 @@ void __init do_initcalls(void)
>>>>            (*call)();
>>>>    }
>>>>    
>>>> +#ifdef CONFIG_HYPFS
>>>> +static unsigned int __read_mostly major_version;
>>>> +static unsigned int __read_mostly minor_version;
>>>> +
>>>> +static HYPFS_DIR_INIT(buildinfo, "buildinfo");
>>>> +static HYPFS_DIR_INIT(compileinfo, "compileinfo");
>>>> +static HYPFS_DIR_INIT(version, "version");
>>>> +static HYPFS_UINT_INIT(major, "major", major_version);
>>>> +static HYPFS_UINT_INIT(minor, "minor", minor_version);
>>>
>>> These two lines fail to build with gcc 4.1 ("unknown field 'content'
>>> specified in initializer"), which I've deliberately tried as a last
>>> minute post-commit, pre-push check. I therefore reverted this change
>>> before pushing.
>>>
>>> Paul, Jürgen - please advise how to proceed, considering today's
>>> deadline. I'd accept pushing the rest of the series, if a fix for
>>> the issue will then still be permitted in later. Otherwise I'd have
>>> to wait for a fixed (incremental) version
>>
>> The attached patch should fix this problem (assuming the anonymous
>> union is to blame).
>>
>> Could you verify that, please?
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Jan Beulich <jbeulich@suse.com>
> 
>> In case the patch is fine, I'll resend the rest of the series with
>> that patch included, as there are adaptions in later patches needed.
> 
> No need to, if you trust me to have made the right changes - I've
> also verified the rest of the series builds fine there.

Thanks, of course I trust you. :-)


Juergen

