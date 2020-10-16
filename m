Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1E28FFCA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 10:12:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7817.20587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTKpo-00071q-PV; Fri, 16 Oct 2020 08:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7817.20587; Fri, 16 Oct 2020 08:11:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTKpo-00071T-Li; Fri, 16 Oct 2020 08:11:32 +0000
Received: by outflank-mailman (input) for mailman id 7817;
 Fri, 16 Oct 2020 08:11:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTKpn-00071K-6Y
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:11:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ef2b531-8f47-443a-a27a-964a5303cee3;
 Fri, 16 Oct 2020 08:11:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 448ACAC82;
 Fri, 16 Oct 2020 08:11:29 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTKpn-00071K-6Y
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:11:31 +0000
X-Inumbo-ID: 8ef2b531-8f47-443a-a27a-964a5303cee3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8ef2b531-8f47-443a-a27a-964a5303cee3;
	Fri, 16 Oct 2020 08:11:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602835889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LhAESMXcWXHrHyTv9HCT2odTQIqZ5fpcfL3ur13ve4=;
	b=G+hgR+kP5e0bg3o0f/WLp82y3VLdz19pcL93aZfFZpG1Rw0/Ucr4ZMWTvcyc2HLkAnXSeA
	AJNJQj2m5dmZeP6ozaZQPlKAiiD7RI5annWBiKQLgLm+AMn89wOoRBF9njHKvSW12zrp7B
	oF4RBC6MfY+mvMwCQ5KRqcEkyEX8GRQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 448ACAC82;
	Fri, 16 Oct 2020 08:11:29 +0000 (UTC)
Subject: Re: Getting rid of (many) dynamic link creations in the xen build
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <85f1eea2-0c8b-de06-b9d8-69f9a7e34ea8@suse.com>
 <5c9d5d97-10c4-f5de-e4eb-7ae933706240@suse.com>
 <abd6d752-9a7f-fcf6-3273-82512c590151@suse.com>
 <973eca36-d278-4c82-627a-e0d80a6055d5@suse.com>
 <f879dac7-35a5-f07b-a869-80abd1351c28@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <85d0e991-154c-c1d7-1071-ad7fd3acf196@suse.com>
Date: Fri, 16 Oct 2020 10:11:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <f879dac7-35a5-f07b-a869-80abd1351c28@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16.10.2020 09:25, Jürgen Groß wrote:
> On 16.10.20 08:58, Jan Beulich wrote:
>> On 15.10.2020 12:41, Jürgen Groß wrote:
>>> On 15.10.20 12:09, Jan Beulich wrote:
>>>> On 15.10.2020 09:58, Jürgen Groß wrote:
>>>>> - tools/include/xen/foreign -> tools/include/xen-foreign:
>>>>>      Get rid of tools/include/xen-foreign and generate the headers directly
>>>>>      in xen/include/public/foreign instead.
>>>>
>>>> Except that conceptually building in tools/ would better not alter
>>>> the xen/ subtree in any way.
>>>
>>> I meant to generate the headers from the hypervisor build instead.
>>
>> This would make the tools/ build dependent upon xen/ having got
>> built first aiui, which I think we want to avoid.
> 
> Today we have a mechanism to build tools/include (i.e. setup the links)
> from the main Makefile. The same rule could be used to create the needed
> headers in xen/include/public/foreign.

Oh, indeed.

>>>>> - tools/include/xen/lib/<arch>/* -> xen/include/xen/lib/<arch>/*:
>>>>>      Move xen/include/xen/lib/<arch> to xen/include/tools/lib/<arch> and
>>>>>      add "-Ixen/include/tools" to the CFLAGS of tools.
>>>>
>>>> Why not -Ixen/include/xen without any movement? Perhaps because
>>>
>>> This would open up most of the hypervisor private headers to be
>>> easily includable by tools.
>>
>> Without the xen/ prefix, yes. But if someone wants to violate the
>> naming scheme to get at them, adding a suitable number of ../ will
>> also work as soon as symlinks aren't being used, or symlinks of
>> full directories are used instead of ones referencing individual
>> files.
> 
> We'd need to be very careful regarding name collisions in this case
> (there is e.g. xen/list.h and we have at least one list.h in a local
> directory). I'm not sure we want to take that additional risk.

Well, header in local dirs aren't a big problem - they get included
via #include "xyz.h" anyway. But I see your point, and this imo is an
argument to stick to symlinks, as this avoids unnecessary dir levels
and allows to be as selective as we want/need to be.

Jan

