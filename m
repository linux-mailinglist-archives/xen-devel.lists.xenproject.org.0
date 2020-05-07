Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94871C87EA
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 13:18:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWeX3-00005r-O9; Thu, 07 May 2020 11:17:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJJs=6V=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jWeX1-00005m-Tp
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 11:17:35 +0000
X-Inumbo-ID: 5996b340-9054-11ea-9f00-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5996b340-9054-11ea-9f00-12813bfff9fa;
 Thu, 07 May 2020 11:17:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D4D23B0B8;
 Thu,  7 May 2020 11:17:35 +0000 (UTC)
Subject: Re: [PATCH v7 03/12] docs: add feature document for Xen hypervisor
 sysfs-like support
To: George Dunlap <George.Dunlap@citrix.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-4-jgross@suse.com>
 <AB2368EA-FE62-4735-8064-98DE220B6F9E@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3d3f8302-5730-e7b7-ab91-7d9038472353@suse.com>
Date: Thu, 7 May 2020 13:17:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <AB2368EA-FE62-4735-8064-98DE220B6F9E@citrix.com>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.04.20 15:55, George Dunlap wrote:
> 
>> On Apr 2, 2020, at 4:46 PM, Juergen Gross <JGross@suse.com> wrote:
> [snip]
>> +* {VALUE, VALUE, ... } -- a list of possible values separated by "," and
>> +  enclosed in "{" and "}".
> [snip]
>> +So an entry could look like this:
>> +
>> +    /cpu-bugs/active-pv/xpti = ("No"|{"dom0", "domU", "PCID on"}) [w,X86,PV]
>> +
>> +Possible values would be "No" or a list of "dom0", "domU", and "PCID on".
> 
> One thing that wasn’t clear to me here:  Does the “list” look like
> 
>      “dom0", “domU", “PCID on”
> 
> or
> 
>      {dom0, domU, PCID on}
> 
> or
> 
>      {“dom0”, “domU”, “PCID on”}
> 
> ?

This is only the notation used.

The entry could then be e.g.

   dom0 domU

> 
> Another question that occurs to me from asking this question: in a case like this, are we generally expecting to have options with spaces in them (like “PCID on”)? And/or, are we expecting the strings themselves to have quotes in them? If so, commands to manipulate these will start to look a little gnarly:
> 
>      xenhypfs write <path> “{\”dom0\”, \”PCID on\”}”

You've got a point here. Spaces in single items seem to be a bad idea,
especially in lists.

And as said above: the '{', ',' and the quotes are notation only, they
are not part of the entry content.

> 
> It seems like it would be nicer to be able to write:
> 
>      xenhypfs write <path> "{dom0, PCID-on}”

This would be then:

   xenhypfs write <path> "dom0 PCID-on"

> 
> (Maybe this will be made more clear later in the series, just thought I’d share my thoughts / confusion here.)

I'll make this clearer.


Juergen

