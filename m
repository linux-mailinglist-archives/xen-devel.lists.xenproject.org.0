Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029821AAC62
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 17:55:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOkNs-00020g-55; Wed, 15 Apr 2020 15:55:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOkNq-00020Y-HN
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 15:55:26 +0000
X-Inumbo-ID: 85209668-7f31-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85209668-7f31-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 15:55:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 794D3ACCE;
 Wed, 15 Apr 2020 15:55:23 +0000 (UTC)
Subject: Re: [XEN PATCH v4 06/18] xen/build: have the root Makefile generates
 the CFLAGS
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-7-anthony.perard@citrix.com>
 <a2b16a74-4eed-eeae-d791-fa9fd4e63d08@suse.com>
 <20200415141045.GB4088@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <adf71966-541b-d9b5-39f1-d30eb10c84f2@suse.com>
Date: Wed, 15 Apr 2020 17:55:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415141045.GB4088@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 16:10, Anthony PERARD wrote:
> On Wed, Apr 08, 2020 at 01:50:33PM +0200, Jan Beulich wrote:
>> On 31.03.2020 12:30, Anthony PERARD wrote:
>>>  # Always build obj-bin files as binary even if they come from C source. 
>>> -$(obj-bin-y): CFLAGS := $(filter-out -flto,$(CFLAGS))
>>> +# FIXME LTO broken, but we would need a different way to filter -flto out
>>> +# $(obj-bin-y): CFLAGS := $(filter-out -flto,$(CFLAGS))
>>
>> While you mention this in the description, I'm still not overly
>> happy with it getting commented out. What's wrong with making the
>> construct simply act on c_flags?
> 
> It doesn't work.
> 
> I tried
>     $(obj-bin-y): c_flags := $(filter-out -flto,$(c_flags))
> but the $@ expansion was empty.

Hmm, yes, presumably because of having to use :=. But the old
code gives the appearance of having worked despite this fact.

> I guess we could do:
>     $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
> that's probably enough for now. Even if we can't test it properly.

If -flto gets added to XEN_CFLAGS (not c_flags) - why not?

Jan

