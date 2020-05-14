Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF001D2F3E
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 14:12:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZCig-0004H7-Cv; Thu, 14 May 2020 12:12:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WGWk=64=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZCie-0004H2-OY
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 12:12:08 +0000
X-Inumbo-ID: 2169f896-95dc-11ea-a480-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2169f896-95dc-11ea-a480-12813bfff9fa;
 Thu, 14 May 2020 12:12:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 06317B143;
 Thu, 14 May 2020 12:12:08 +0000 (UTC)
Subject: Re: [PATCH v8 04/12] xen: add basic hypervisor filesystem support
To: Jan Beulich <jbeulich@suse.com>
References: <20200508153421.24525-1-jgross@suse.com>
 <20200508153421.24525-5-jgross@suse.com>
 <db277779-5b1e-a2aa-3948-9e6dd8e8bef0@suse.com>
 <23938228-e947-fe36-8b19-0e89886db9ac@suse.com>
 <ef7d7ea1-e2ba-5f5f-5817-b7c29bc33f11@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3ff40c34-e2ad-a821-a3ee-2222224cfece@suse.com>
Date: Thu, 14 May 2020 14:12:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ef7d7ea1-e2ba-5f5f-5817-b7c29bc33f11@suse.com>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.20 13:58, Jan Beulich wrote:
> On 14.05.2020 11:50, Jürgen Groß wrote:
>> On 14.05.20 09:59, Jan Beulich wrote:
>>> On 08.05.2020 17:34, Juergen Gross wrote:
>>>> +#define HYPFS_FIXEDSIZE_INIT(var, typ, nam, contvar, wr) \
>>>> +    struct hypfs_entry_leaf __read_mostly var = {        \
>>>> +        .e.type = typ,                                   \
>>>> +        .e.encoding = XEN_HYPFS_ENC_PLAIN,               \
>>>> +        .e.name = nam,                                   \
>>>> +        .e.size = sizeof(contvar),                       \
>>>> +        .e.max_size = wr ? sizeof(contvar) : 0,          \
>>>> +        .e.read = hypfs_read_leaf,                       \
>>>> +        .e.write = wr,                                   \
>>>> +        .content = &contvar,                             \
>>>> +    }
>>>
>>> At the example of this, some of the macros look like they want
>>> parentheses added around uses of some of their parameters.
>>
>> Hmm, which ones? As I've understood from previous patch reviews by you
>> you only want those parameters with parantheses where they are really
>> needed.
>>
>> - var is a plain variable, so no parantheses
>> - typ _should_ be a XEN_HYPFS_TYPE_* define, so probably no parantheses
>>    (its usage in the macro doesn't call for using parantheses anyway)
>> - nam might be a candidate, but I can't come up with a reason to put it
>>    in parantheses here
>> - contvar has to be a variable (otherwise sizeof(contvar) wouldn't
>>    work), so no parantheses
>> - wr is a function pointer or NULL, so no parantheses
> 
> You have a point for uses as initializers, as there's no lower
> precedence operator than the assignment ones except comma,
> which would need parenthesizing in the macro invocation already.
> However, I disagree on what you say about contvar and wr -
> contvar is expected, but not required to be just an identifier.
> And wr in turn is expected but not required to by an identifier
> or NULL. I.e. the respective two lines where I think parentheses
> can't be avoided are
> 
>          .e.max_size = (wr) ? sizeof(contvar) : 0,
> 
> and
> 
>          .content = &(contvar),

Okay.


Juergen

