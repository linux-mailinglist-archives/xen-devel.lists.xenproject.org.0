Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F459220FAC
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 16:41:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvib9-0000h0-Fz; Wed, 15 Jul 2020 14:41:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U57p=A2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jvib7-0000gv-U0
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 14:41:25 +0000
X-Inumbo-ID: 42140728-c6a9-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42140728-c6a9-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 14:41:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD406AF70;
 Wed, 15 Jul 2020 14:41:27 +0000 (UTC)
Subject: Re: [PATCH v2] docs: specify stability of hypfs path documentation
To: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
References: <20200713140338.16172-1-jgross@suse.com>
 <8a96b1b9-cbcb-557a-5b82-661bbe40fe25@suse.com>
 <68F727A8-29B8-4846-8BE9-BD4F6E0DC60D@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8505ec1a-bc50-ea16-306f-998c27045e30@suse.com>
Date: Wed, 15 Jul 2020 16:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <68F727A8-29B8-4846-8BE9-BD4F6E0DC60D@citrix.com>
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
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.20 16:37, George Dunlap wrote:
> 
> 
>> On Jul 13, 2020, at 3:47 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>
>> On 13.07.2020 16:03, Juergen Gross wrote:
>>> In docs/misc/hypfs-paths.pandoc the supported paths in the hypervisor
>>> file system are specified. Make it more clear that path availability
>>> might change, e.g. due to scope widening or narrowing (e.g. being
>>> limited to a specific architecture).
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Release-acked-by: Paul Durrant <paul@xen.org>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> However, I'd like agreement by at least one other REST maintainer on
>> ...
>>
>>> @@ -55,6 +58,11 @@ tags enclosed in square brackets.
>>> * CONFIG_* -- Path is valid only in case the hypervisor was built with
>>>    the respective config option.
>>>
>>> +In case a tag for a path indicates that this path is available in some
>>> +case only, this availability might be extended or reduced in future by
>>> +modification or removal of the tag. A path once assigned meaning won't go
>>> +away altogether or change its meaning, though.
>>
>> ... the newly imposed guarantee we're now making. We really want to
>> avoid declaring something as stable without being quite certain we
>> can keep it stable.
> 
> The declaration of new nodes must all happen in this file, right?  So as long as the maintainer(s) fo this file are aware of that, and it’s commented so that people know that expecation, I think it’s OK.
> 
> But I think this paragraph isn’t very clear to me what “might be extended or reduced …but won’t go away altogether”.
> 
> IT sounds like you’re saying:
> 
> 1. Paths listed without conditions will always be available
> 
> 2. Paths listed with conditions may be extended: i.e., a node currently listed as PV might also become available for HVM guests
> 
> 3. Paths listed with conditions might have those conditions reduced, but will never entirely disappear.  So something currently listed as PV might be reduced to CONFIG_HAS_FOO, but won’t be completely removed.
> 
> Is that what you meant?

Yes.


Juergen

