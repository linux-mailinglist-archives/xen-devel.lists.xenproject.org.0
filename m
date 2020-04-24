Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091371B6DCD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 08:12:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRrYa-0001DK-7H; Fri, 24 Apr 2020 06:11:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qtr=6I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRrYZ-0001DF-Gw
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 06:11:23 +0000
X-Inumbo-ID: 6b9a08ec-85f2-11ea-9466-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b9a08ec-85f2-11ea-9466-12813bfff9fa;
 Fri, 24 Apr 2020 06:11:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B07F5ADEB;
 Fri, 24 Apr 2020 06:11:20 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/pv: Options to disable and/or compile out 32bit
 PV support
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-2-andrew.cooper3@citrix.com>
 <5dc9dbd9-fbeb-46ef-4d4e-7916c3219bb3@suse.com>
 <4e732f90-1d5f-7ae5-0f02-6b313a381df7@citrix.com>
 <6b4e5b50-51f7-566f-2a18-4bb5f4f43d59@suse.com>
 <62b51cff-4d6f-690b-371a-e6772ea327ab@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0671e13-85ea-aeaf-722c-dcfee8b7e930@suse.com>
Date: Fri, 24 Apr 2020 08:11:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <62b51cff-4d6f-690b-371a-e6772ea327ab@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.04.2020 19:35, Andrew Cooper wrote:
> On 21/04/2020 07:02, Jan Beulich wrote:
>> On 20.04.2020 20:05, Andrew Cooper wrote:
>>> On 20/04/2020 15:05, Jan Beulich wrote:
>>>> I'm in particular
>>>> concerned that we may gain a large number of such printk()s over
>>>> time, if we added them in such cases.
>>> The printk() was a bit of an afterthought, but deliberately avoiding the
>>> -EINVAL path was specifically not.
>>>
>>> In the case that the user tries to use `pv=no-32` without CONFIG_PV32,
>>> they should see something other than
>>>
>>> (XEN) parameter "pv=no-32" unknown!
>> Why - to this specific build of Xen the parameter is unknown.
> 
> Because it is unnecessarily problematic and borderline obnoxious to
> users, as well as occasional Xen developers.
> 
> "you've not got the correct CONFIG_$X for that to be meaningful" is
> specifically useful to separate from "I've got no idea".
> 
>>> I don't think overloading the return value is a clever move, because
>>> then every parse function has to take care of ensuring that -EOPNOTSUPP
>>> (or ENODEV?) never clobbers -EINVAL.
>> I didn't suggest overloading the return value. Instead I
>> specifically want this to go the -EINVAL path.
>>
>>> We could have a generic helper which looks like:
>>>
>>> static inline void ignored_param(const char *cfg, const char *name,
>>> const char *s, const char *ss)
>>> {
>>>     printk(XENLOG_INFO "%s disabled - ignoring '%s=%*.s' setting\n",
>>> cfg, name, s, (int)(ss - s));
>>> }
>>>
>>> which at least would keep all the users consistent.
>> Further bloating the binary with (almost) useless string literals.
>> I'd specifically like to avoid this.
> 
> I don't accept that as a valid argument.
> 
> We're talking about literally tens of bytes (which will merge anyway, so
> 0 in practice), and a resulting UI which helps people get out of
> problems rather than penalises them for having gotten into a problem to
> begin with.

How will they merge? The different instances of the format string
above may/should, yes, but the different "CONFIG_xyz" literals the
callers pass won't, for example.

> I will absolutely prioritise a more helpful UI over a handful of bytes.

This "a handful of bytes doesn't matter" attitude has lead to
imo unacceptable growth of various software packages over the
years.

Anyway - I don't want to block this change over this argument,
so I'm willing to ack a patch with the helper introduced (and
preferably the "CONFIG_" part of the cfg arguments moved into
the helper's format string), as long as we plan to then make
consistent use of the helper everywhere. That said, I don't
immediately see what would be passed for "cfg" in some of
parse_iommu_param()'s cases.

Jan

