Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B573D194135
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:23:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTNT-0000S0-J8; Thu, 26 Mar 2020 14:20:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHTNS-0000Rt-78
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:20:58 +0000
X-Inumbo-ID: 027ac4dc-6f6d-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 027ac4dc-6f6d-11ea-92cf-bc764e2007e4;
 Thu, 26 Mar 2020 14:20:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A0847B1A2;
 Thu, 26 Mar 2020 14:20:56 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <2c83b876-6fd8-1315-3b28-b45e877187aa@suse.com>
 <7147e3a1-b237-7a2b-d623-b364704d0096@citrix.com>
 <bdeb57d1-71b4-6908-096f-d536b4bacbba@suse.com>
 <20200326134241.GP4088@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e15044f1-c711-baf2-324d-0cec06b5b254@suse.com>
Date: Thu, 26 Mar 2020 15:20:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200326134241.GP4088@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v5 03/10] x86: determine HAVE_AS_* just once
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.2020 14:42, Anthony PERARD wrote:
> On Thu, Mar 26, 2020 at 10:50:48AM +0100, Jan Beulich wrote:
>> On 25.03.2020 22:12, Andrew Cooper wrote:
>>> All the requisite infrastructure looks to be already present.
>>
>> ... there's the one open prereq question of what happens upon
>> tool chain updates. It's not clear to me if/how kconfig would
>> get invoked despite none of the recorded dependencies having
>> changed in such a case. (I'm sure you realize there's no issue
>> with this when the determination occurs out of a makefile.)
> 
> We might need one small change for this to happen, it is to add a
> comment in .config which display the output of `$(CC) --version | head
> -1`. Simple :-).
> If the output of `$(CC) --version` changes, kconfig will run again. That
> would be enough to detect tool chain updates, right?

I'm afraid it's not that simple: For one I'm not sure that line
would indeed change when a distro issues a gcc update. Even the
minor version may not change in this case; recall as an example
the backport of the compiler support backing INDIRECT_THUNK.
And then gcc isn't the tool chain - it may well be that e.g. gas
gets updated (supporting new insns or directives) without gcc
getting touched at all. Plus finally I don't think a comment
like you suggest would do - while processing it kconfig would
find that $(CC) gets used, but aiui it would then record just
$(CC) as needing tracking, not the output of the command. But
maybe I'm lacking some further detail here.

> Have a look at "include/config/auto.conf.cmd" to find out how kconfig is
> forced to run again.

Oh, that's good to know. Thanks for the pointer.

Jan

