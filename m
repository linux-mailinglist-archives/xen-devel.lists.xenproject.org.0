Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBAB1EBDBC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 16:14:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg7fk-0002i1-9i; Tue, 02 Jun 2020 14:13:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg7fi-0002ht-Na
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 14:13:42 +0000
X-Inumbo-ID: 42d43434-a4db-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42d43434-a4db-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 14:13:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4BF6AAC12;
 Tue,  2 Jun 2020 14:13:43 +0000 (UTC)
Subject: Re: [PATCH v2 03/14] x86/shstk: Introduce Supervisor Shadow Stack
 support
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-4-andrew.cooper3@citrix.com>
 <4f535d4c-b3b3-fe5b-8b57-af736dc0a360@suse.com>
 <ad95944a-bd21-2ba8-6214-49d86050e816@citrix.com>
 <c3c3aea0-806f-4058-c1aa-cdc0f75007e2@suse.com>
 <f6ec0a0e-c7d0-22b5-b633-458a7fe2375f@citrix.com>
 <b3f62c64-9845-22b9-6855-91a3ecde421c@suse.com>
 <20200602122614.GN2105@perard.uk.xensource.com>
 <3328fabd-c133-00a9-2ec0-addcf15dbff5@suse.com>
 <20200602135010.GO2105@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54ea28e3-0a07-a296-4328-62633b76d5c3@suse.com>
Date: Tue, 2 Jun 2020 16:13:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602135010.GO2105@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.2020 15:50, Anthony PERARD wrote:
> On Tue, Jun 02, 2020 at 02:41:30PM +0200, Jan Beulich wrote:
>> On 02.06.2020 14:26, Anthony PERARD wrote:
>>> On Tue, Jun 02, 2020 at 02:06:11PM +0200, Jan Beulich wrote:
>>>> I don't recall; perhaps I was in another parallel session? If it's
>>>> the one with notes at
>>>> https://lists.xenproject.org/archives/html/xen-devel/2019-07/msg00786.html
>>>> then a remark close to the top suggests I was there, but there's no
>>>> sign of this aspect having got discussed. There is, among the issues
>>>> listed, "Xen build re-evaluates compiler support for every translation
>>>> unit", but that's only remotely related.
>>>
>>> What is a "translation unit"? What would that have to do with Kconfig?
>>
>> A translation unit is the collective input from all source and
>> header files seen by the compiler during the processing of one
>> top level input file's worth of compilation.
> 
> Thanks. Now it feels like the issue listed in the design session note
> isn't exactly correct, compiler didn't used to be evaluated once per CU,
> but only once per Makefile loaded/executed.
> 
>> The connection to
>> Kconfig here is that by switching to it, the compiler flags
>> don't get re-constructed once per CU. Of course doing it via
>> Kconfig is not the only possible solution to the problem (as
>> can be seen from the patch that I had intermediately submitted
>> to get at least the HAVE_AS_* out of that set), but for us the
>> change in behavior is one intended (side-)effect of the switch
>> to newer Kconfig.
> 
> Well, with a recent patch of mine, tool chain support should already be
> only evaluated only once in the root Makefile. So I do also think that
> we don't need to move all of them to Kconfig.
> 
> So advantage of evaluating some compiler flags in Kconfig is that we
> can have other CONFIG_* depends on those flags;

I'm not even certain this is an advantage: CET-SS is going a
different direction than the majority of cases we have had in
the tree so far (INDIRECT_THUNK is another such case). In the
majority of cases, though, the tool chain capabilities don't
affect functionality, but just code quality. And indeed I
think that's how Kconfig should be used: When configuring Xen,
it ought to be specified what functionality is wanted,
irrespective of compilers used/available. In particular a
syncconfig run would better not require a host compiler to be
available at all, such that configurations for targets for
which there's no cross compiler can also be produced. (Not
sure whether that's still the case, but our internal kernel
processing used to work that way, without requiring everyone
to have compilers for all target architectures our kernels
support.)

It would be the responsibility of the person doing the config
to ensure only options get enabled that can actually be built
in the environment that the full build is actually to be run
in. (That is, for the case it's inconvenient [CET-SS] or
impossible [INDIRECT_THUNK] to build without suitable tool
chain support, I'm not questioning the desire to have certain
features outright unavailable. It's just that I don't see why
this unavailability needs to be expressed at the Kconfig
level.)

Jan

> the inconvenient is to
> figure out when do we need to re-evaluate the .config.
> 


