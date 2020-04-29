Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368D1BDFDE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 16:01:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTnH8-0004ar-2t; Wed, 29 Apr 2020 14:01:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2IrC=6N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jTnH6-0004am-FI
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 14:01:20 +0000
X-Inumbo-ID: e628a857-8a21-11ea-994f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e628a857-8a21-11ea-994f-12813bfff9fa;
 Wed, 29 Apr 2020 14:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i/95LpClsUeFq99vq1tqBaMwmsXIXtcaN8D+iinWUmI=; b=oY1NApYZ0SqS6mQHCQZZ89OTj+
 aKrNwjoW3MaakxUxFg5QF8jPRShzedyUSdBdxcWWK4tZJK2Jqb8nXhA8Vp6DdLLIGM0Q8AoGUsWes
 rXzMBCHWe9KTjzKkPwOzdZQMgNOVwQpgL7TfXPDe6uwb2S02wYcJwuUDZqWTJQ9yHtXE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jTnH1-0002bx-0i; Wed, 29 Apr 2020 14:01:15 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jTnH0-0005zp-Pw; Wed, 29 Apr 2020 14:01:14 +0000
Subject: Re: [PATCH] pvcalls: Document explicitly the padding for all arches
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20200419104948.31200-1-julien@xen.org>
 <e07dbb22-1300-ae87-4065-824938caec48@suse.com>
 <78288649-5930-9d01-bb8f-85e15406e4ef@xen.org>
 <6fc59120-664e-6a07-5196-57e1dbfb0dde@suse.com>
 <alpine.DEB.2.21.2004211609410.24585@sstabellini-ThinkPad-T480s>
 <240bc5e8-f8fd-217a-fa10-7628ac9d4e6e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9eb39857-2e33-4a6b-1825-f9dc537a6515@xen.org>
Date: Wed, 29 Apr 2020 15:01:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <240bc5e8-f8fd-217a-fa10-7628ac9d4e6e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 22/04/2020 10:20, Jan Beulich wrote:
>> Even if it was possible to use the sub-structs defined in the header
>> that way, keep in mind that we also wrote:
>>
>>          /* dummy member to force sizeof(struct xen_pvcalls_request)
>>           * to match across archs */
>>          struct xen_pvcalls_dummy {
>>              uint8_t dummy[56];
>>          } dummy;
> 
> This has nothing to do with how a consumer may use the structs.
> 
>> And the spec also clarifies that the size of each specific request is
>> always 56 bytes.
> 
> Sure, and I didn't mean to imply that a consumer would be allowed
> to break this requirement. Still something like this
> 
> int pvcall_new_socket(struct xen_pvcalls_socket *s) {
>      struct xen_pvcalls_request req = {
>          .req_id = REQ_ID,
>          .cmd = PVCALLS_SOCKET,
>          .u.socket = *s,
>      };
> 
>      return pvcall(&req);
> }
> 
> may break.

I think I understand your concern now. So yes I agree this would break 
32-bit consumer.

As the padding is at the end of the structure, I think a 32-bit frontend 
and 64-bit backend (or vice-versa) should currently work without any 
trouble. The problem would come later if we decide to extend a command.

I will document the padding only for non 32-bit x86 guest and rework the 
documentation.

Cheers,

-- 
Julien Grall

