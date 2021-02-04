Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A5730F0D1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 11:33:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81219.149674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bwQ-0005qv-0z; Thu, 04 Feb 2021 10:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81219.149674; Thu, 04 Feb 2021 10:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bwP-0005qW-Tz; Thu, 04 Feb 2021 10:32:49 +0000
Received: by outflank-mailman (input) for mailman id 81219;
 Thu, 04 Feb 2021 10:32:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7bwO-0005qR-5L
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 10:32:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9d6f668-b172-4497-8aec-48daf2cac748;
 Thu, 04 Feb 2021 10:32:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F529AC97;
 Thu,  4 Feb 2021 10:32:41 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d9d6f668-b172-4497-8aec-48daf2cac748
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612434761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnF5trDr1uTkUTu8gx7sd1TkJnEHMHIZ76LpR10QX3o=;
	b=TrLtbT0ngKyEANYqfa1pmaXovxTA0aw0yCtfApfH+3UIuOzO4KL0VLoAIJX0Q2o3+ysDh5
	r3YmChoWIJWTvkl8TwaoKYZZfxMEN3oHMh12YLeoop9Yhg0CIi5ZglOxHQ7m9iVHBfx133
	VjsqWTo+dnWphcqL/dWXEsUeX9ZJTpY=
Subject: Re: [PATCH for-4.15] autoconf: check endian.h include path
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20210204093833.91190-1-roger.pau@citrix.com>
 <26522f21-4714-c29d-5ca4-baf012c51ac8@suse.com>
 <YBvFbbnje+Dt7CfD@Air-de-Roger>
 <0e3576d3-4565-9898-e954-4a888b21d92f@suse.com>
 <YBvKwNiIopKKZx/F@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <10e334fe-eb02-e771-8404-cbcda9534383@suse.com>
Date: Thu, 4 Feb 2021 11:32:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YBvKwNiIopKKZx/F@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.02.2021 11:21, Roger Pau Monné wrote:
> On Thu, Feb 04, 2021 at 11:13:43AM +0100, Jan Beulich wrote:
>> On 04.02.2021 10:59, Roger Pau Monné wrote:
>>> On Thu, Feb 04, 2021 at 10:46:58AM +0100, Jan Beulich wrote:
>>>> On 04.02.2021 10:38, Roger Pau Monne wrote:
>>>>> --- a/tools/configure.ac
>>>>> +++ b/tools/configure.ac
>>>>> @@ -74,6 +74,7 @@ m4_include([../m4/ax_compare_version.m4])
>>>>>  m4_include([../m4/paths.m4])
>>>>>  m4_include([../m4/systemd.m4])
>>>>>  m4_include([../m4/golang.m4])
>>>>> +m4_include([../m4/header.m4])
>>>>>  
>>>>>  AX_XEN_EXPAND_CONFIG()
>>>>>  
>>>>> @@ -517,4 +518,6 @@ AC_ARG_ENABLE([pvshim],
>>>>>  ])
>>>>>  AC_SUBST(pvshim)
>>>>>  
>>>>> +AX_FIND_HEADER([INCLUDE_ENDIAN_H], [endian.h sys/endian.h])
>>>>
>>>> Instead of a new macro, can't you use AC_CHECK_HEADERS()?
>>>
>>> AC_CHECK_HEADERS doesn't do what we want here: it will instead produce
>>> a HAVE_header-file define for each header on the list that's present,
>>> and the action-if-found doesn't get passed the path of the found
>>> header according to the documentation.
>>>
>>> Here I want the variable to be set to the include path of the first
>>> header on the list that's present on the system.
>>
>> I was thinking of
>>
>> #if defined(HAVE_SYS_ENDIAN_H)
>> # include <sys/endian.h>
>> #elif defined(HAVE_ENDIAN_H)
>> # include <endian.h>
>> #else
>> # error ...
>> #endif
> 
> I think having to replicate this logic in all places that include
> endian.h is cumbersome.

Right - I would further encapsulate this in a local header.

>>>> I'm also not certain about the order of checks - what if both
>>>> exist?
>>>
>>> With my macro the first one will be picked.
>>
>> And which one is to be the first one? IOW how likely is it that
>> on a system having both the first one is what we're after vs
>> the second one?
> 
> Not sure, but the same will happen with your proposal above: in your
> chunk sys/endian.h will be picked over endian.h.

Oh, sure - the two points are entirely orthogonal. And I'm
also not certain at all whether checking sys/ first is
better, equal, or worse. I simply don't know what the
conventions are. As a result I wonder whether we shouldn't
check that the header provides what we need.

Jan

> If we think that's
> the right precedence I can adjust AX_FIND_HEADER to be:
> 
> AX_FIND_HEADER([INCLUDE_ENDIAN_H], [sys/endian.h endian.h])
> 
> Which will achieve the same as your proposed snipped.
> 
> I can also add a comment to the macro that the first match will be the
> one that gets set.
> 
> Thanks, Roger.
> 


