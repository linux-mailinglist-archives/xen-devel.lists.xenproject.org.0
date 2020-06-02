Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB6E1EBB33
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:06:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg5gP-0005Ib-PB; Tue, 02 Jun 2020 12:06:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg5gN-0005IW-Nc
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:06:15 +0000
X-Inumbo-ID: 74d990da-a4c9-11ea-9dbe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74d990da-a4c9-11ea-9dbe-bc764e2007e4;
 Tue, 02 Jun 2020 12:06:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 37B31ACA3;
 Tue,  2 Jun 2020 12:06:16 +0000 (UTC)
Subject: Re: [PATCH v2 03/14] x86/shstk: Introduce Supervisor Shadow Stack
 support
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-4-andrew.cooper3@citrix.com>
 <4f535d4c-b3b3-fe5b-8b57-af736dc0a360@suse.com>
 <ad95944a-bd21-2ba8-6214-49d86050e816@citrix.com>
 <c3c3aea0-806f-4058-c1aa-cdc0f75007e2@suse.com>
 <f6ec0a0e-c7d0-22b5-b633-458a7fe2375f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3f62c64-9845-22b9-6855-91a3ecde421c@suse.com>
Date: Tue, 2 Jun 2020 14:06:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <f6ec0a0e-c7d0-22b5-b633-458a7fe2375f@citrix.com>
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

On 29.05.2020 20:36, Andrew Cooper wrote:
> On 29/05/2020 12:59, Jan Beulich wrote:
>> On 28.05.2020 20:10, Andrew Cooper wrote:
>>> On 28/05/2020 11:25, Jan Beulich wrote:
>>>> On 27.05.2020 21:18, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/Kconfig
>>>>> +++ b/xen/arch/x86/Kconfig
>>>>> @@ -34,6 +34,10 @@ config ARCH_DEFCONFIG
>>>>>  config INDIRECT_THUNK
>>>>>  	def_bool $(cc-option,-mindirect-branch-register)
>>>>>  
>>>>> +config HAS_AS_CET
>>>>> +	# binutils >= 2.29 and LLVM >= 7
>>>>> +	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy;endbr64)
>>>> So you put me in a really awkward position: I'd really like to see
>>>> this series go in for 4.14, yet I've previously indicated I want the
>>>> underlying concept to first be agreed upon, before any uses get
>>>> introduced.
>>> There are already users.  One of them is even in context.
>> Hmm, indeed. I clearly didn't notice this aspect when reviewing
>> Anthony's series.
>>
>>> I don't see that there is anything open for dispute in the first place. 
>>> Being able to do exactly this was a one key driving factor to a newer
>>> Kconfig, because it is superior mechanism to the ad-hoc mess we had
>>> previously (not to mention, a vast detriment to build time).
>> This "key driving factor" was presumably from your perspective.
>> Could you point me to a discussion (and resulting decision) that
>> this is an explicit goal of that work? I don't recall any, and
>> hence I also don't recall having been given a chance in influence
>> the direction, decision, and overall outcome.
> 
> It took up a large chunk of the build system design session in Chicago.

I don't recall; perhaps I was in another parallel session? If it's
the one with notes at
https://lists.xenproject.org/archives/html/xen-devel/2019-07/msg00786.html
then a remark close to the top suggests I was there, but there's no
sign of this aspect having got discussed. There is, among the issues
listed, "Xen build re-evaluates compiler support for every translation
unit", but that's only remotely related.

Jan

