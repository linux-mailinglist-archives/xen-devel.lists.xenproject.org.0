Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E754522797E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 09:32:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxmkC-0005W3-Ba; Tue, 21 Jul 2020 07:31:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxmkA-0005Vv-Cf
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 07:31:18 +0000
X-Inumbo-ID: 2a051d96-cb24-11ea-84f6-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a051d96-cb24-11ea-84f6-bc764e2007e4;
 Tue, 21 Jul 2020 07:31:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 803A2AD1A;
 Tue, 21 Jul 2020 07:31:23 +0000 (UTC)
Subject: Re: [PATCH 5/8] bitmap: move to/from xenctl_bitmap conversion helpers
To: Julien Grall <julien@xen.org>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
 <5835147f-8428-1d74-7d6e-bbb5522289c7@suse.com>
 <fef25c94-a3ce-c17e-966c-a7e479566fc5@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e2b3be4-d11c-3fa7-2ffe-8db5ebdb91b8@suse.com>
Date: Tue, 21 Jul 2020 09:31:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fef25c94-a3ce-c17e-966c-a7e479566fc5@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.07.2020 18:20, Julien Grall wrote:
> On 15/07/2020 11:40, Jan Beulich wrote:
>> A subsequent change will exclude domctl.c from getting built for a
>> particular configuration, yet the two functions get used from elsewhere.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/bitmap.c
>> +++ b/xen/common/bitmap.c
>> @@ -9,6 +9,9 @@
>>   #include <xen/errno.h>
>>   #include <xen/bitmap.h>
>>   #include <xen/bitops.h>
>> +#include <xen/cpumask.h>
>> +#include <xen/domain.h>
> 
> The inclusion of xen/domain.h in common/bitmap.c seems a bit odd to me. 
> Would it make sense to move the prototype of 
> bitmap_to_xenctl_bitmap()/xenctl_bitmap_to_bitmap() to bitmap.h?

Ah yes, no idea why it didn't occur to me to do it this way; like you
I didn't really like the domain.h inclusion here. (This was what the
Arm side cleanup was needed for, which I guess is a nice side effect,
but now no longer strictly needed. You've committed that one already
anyway.)

Jan

