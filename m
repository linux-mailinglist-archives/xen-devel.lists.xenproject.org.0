Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E3B254441
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:24:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBG15-0003Ty-W8; Thu, 27 Aug 2020 11:24:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i4js=CF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBG15-0003Ts-E9
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:24:27 +0000
X-Inumbo-ID: 0b4fbc2c-5c6f-40de-b17f-f5ddc448b473
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b4fbc2c-5c6f-40de-b17f-f5ddc448b473;
 Thu, 27 Aug 2020 11:24:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D24DACDF;
 Thu, 27 Aug 2020 11:24:57 +0000 (UTC)
Subject: Re: [PATCH v3 00/38] tools: move most libraries into tools/libs
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Yang Hongyang <imhy.yang@gmail.com>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200827110709.pj4aaa3roviekuyu@liuwe-devbox-debian-v2>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <13373c0a-4209-7f34-8495-8d47f3ba0e95@suse.com>
Date: Thu, 27 Aug 2020 13:24:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827110709.pj4aaa3roviekuyu@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.08.20 13:07, Wei Liu wrote:
> On Sun, Aug 23, 2020 at 11:34:41AM +0200, Juergen Gross wrote:
>> Move most remaining libraries under tools/libs, including libxenctrl
>> and libxl. This is resulting in a lot of cleanup work regarding
>> building libs and restructuring of the tools directory.
>>
> 
> One thing to point out is that libs was originally only supposed to be
> the home for _stable_ libraries.
> 
> I have no objection to turning it into the home for all libraries
> though. I think this series is definitely an improvement over the status
> quo.
> 
>> After this huge cleanup all dependencies between libraries are defined
>> in a single rather small file tools/libs/uselibs.mk, which is used to
>> create the needed make variables and to control the stubdom build
>> dependencies as well.
>>
>> Another bonus of the rework is the automation of setting the versions
>> of unstable libraries. This removes the need to bump those versions
>> manually for each Xen release.
>>
>> libfsimage is not moved by this series, as IMO there are some open
>> questions:
>> - should it really be unstable?
>> - is the support of adding external fs-support used in practice, i.e.
>>    shouldn't the fs-specific sub-libraries be just included into
>>    libfsimage instead of being loaded dynamically?
> 
> My impression is that nowadays it is only consumed by pygrub, so it
> wouldn't really make a difference if we make it stable or not. It surely
> has not been changed for years though.

Making it stable would have the advantage not having to bump the lib
versions for each release (note that this is the last library left for
which that is still necessary after this series).

> Not entirely sure why it is designed to load dynamically different
> modules either. I don't have an opinion on this one way or another.

I have the vague feeling this might be related to the (IMO now very
questionable) support of Solaris, as it was introduced by a Sun
employee.

> 
> I think your energy will have better ROI if you spend it somewhere else
> than trying to figure out definitive answers to these two questions.

:-)


Juergen


