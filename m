Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8601BE01D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 16:05:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTnL6-0004nK-Sc; Wed, 29 Apr 2020 14:05:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTnL5-0004nB-M1
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 14:05:27 +0000
X-Inumbo-ID: 79ab65fa-8a22-11ea-994f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79ab65fa-8a22-11ea-994f-12813bfff9fa;
 Wed, 29 Apr 2020 14:05:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B29E3AF92;
 Wed, 29 Apr 2020 14:05:24 +0000 (UTC)
Subject: Re: [PATCH] pvcalls: Document explicitly the padding for all arches
To: Julien Grall <julien@xen.org>
References: <20200419104948.31200-1-julien@xen.org>
 <e07dbb22-1300-ae87-4065-824938caec48@suse.com>
 <78288649-5930-9d01-bb8f-85e15406e4ef@xen.org>
 <6fc59120-664e-6a07-5196-57e1dbfb0dde@suse.com>
 <alpine.DEB.2.21.2004211609410.24585@sstabellini-ThinkPad-T480s>
 <240bc5e8-f8fd-217a-fa10-7628ac9d4e6e@suse.com>
 <9eb39857-2e33-4a6b-1825-f9dc537a6515@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <423c0369-9c90-dbfe-2f90-d49a2ce5b283@suse.com>
Date: Wed, 29 Apr 2020 16:05:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9eb39857-2e33-4a6b-1825-f9dc537a6515@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.2020 16:01, Julien Grall wrote:
> Hi,
> 
> On 22/04/2020 10:20, Jan Beulich wrote:
>>> Even if it was possible to use the sub-structs defined in the header
>>> that way, keep in mind that we also wrote:
>>>
>>>          /* dummy member to force sizeof(struct xen_pvcalls_request)
>>>           * to match across archs */
>>>          struct xen_pvcalls_dummy {
>>>              uint8_t dummy[56];
>>>          } dummy;
>>
>> This has nothing to do with how a consumer may use the structs.
>>
>>> And the spec also clarifies that the size of each specific request is
>>> always 56 bytes.
>>
>> Sure, and I didn't mean to imply that a consumer would be allowed
>> to break this requirement. Still something like this
>>
>> int pvcall_new_socket(struct xen_pvcalls_socket *s) {
>>      struct xen_pvcalls_request req = {
>>          .req_id = REQ_ID,
>>          .cmd = PVCALLS_SOCKET,
>>          .u.socket = *s,
>>      };
>>
>>      return pvcall(&req);
>> }
>>
>> may break.
> 
> I think I understand your concern now. So yes I agree this would break 32-bit consumer.
> 
> As the padding is at the end of the structure, I think a 32-bit frontend and 64-bit backend (or vice-versa) should currently work without any trouble. The problem would come later if we decide to extend a command.

Can commands be extended at all, i.e. don't extensions require new
commands? The issue I've described has nothing to do with future
extending of any of the affected structures.

Jan

