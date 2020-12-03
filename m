Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3169D2CD233
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 10:12:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43208.77720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkkf8-0000qK-Ai; Thu, 03 Dec 2020 09:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43208.77720; Thu, 03 Dec 2020 09:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkkf8-0000py-7X; Thu, 03 Dec 2020 09:12:30 +0000
Received: by outflank-mailman (input) for mailman id 43208;
 Thu, 03 Dec 2020 09:12:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkkf6-0000ps-Q1
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 09:12:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72e06943-f101-4894-9b98-f1cbf67ec185;
 Thu, 03 Dec 2020 09:12:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 154A6ACBA;
 Thu,  3 Dec 2020 09:12:27 +0000 (UTC)
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
X-Inumbo-ID: 72e06943-f101-4894-9b98-f1cbf67ec185
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606986747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vZoaX6FrvsFfqFY3RLjHKLoWyrIICRzm5Z+5BGTjc68=;
	b=nXlagQr+vJ+E7Ojn2gJG4tdm5Esg1pCh5JvKLU/J7p8Pfhi+mow8l+kI+jcsYHGQb8Gmdd
	3ex5Zo+i4nbdS0Q2H+zUNWHZN4jAmaGQbJbo+jaPTvnJGZCutik9rgEXNGc48s4METR16I
	0/3oz3RXRxbXEL1YKl25KV1ZTTKH76c=
Subject: Re: [PATCH v2 09/17] xen/hypfs: move per-node function pointers into
 a dedicated struct
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-10-jgross@suse.com>
 <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>
 <c645058b-3e40-46a2-7110-58faa6ff3c6e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4ddee6b8-36bb-63ae-2221-78c1768b3355@suse.com>
Date: Thu, 3 Dec 2020 10:12:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c645058b-3e40-46a2-7110-58faa6ff3c6e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.12.2020 09:47, Jürgen Groß wrote:
> On 02.12.20 16:36, Jan Beulich wrote:
>> On 01.12.2020 09:21, Juergen Gross wrote:
>>>   static int hypfs_write(struct hypfs_entry *entry,
>>>                          XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
>>
>> As a tangent, is there a reason these write functions don't take
>> handles of "const void"? (I realize this likely is nothing that
>> wants addressing right here.)
> 
> Uh, this is harder than I thought.
> 
> guest_handle_cast() doesn't handle const guest handle types currently:
> 
> hypfs.c:447:58: error: unknown type name ‘const_void’; did you mean ‘const’?
>           ret = hypfs_write(entry, guest_handle_cast(arg3, const_void), 
> arg4);
>                                                            ^
> /home/gross/xen/unstable/xen/include/xen/guest_access.h:26:5: note: in 
> definition of macro ‘guest_handle_cast’
>       type *_x = (hnd).p;                         \
>       ^~~~
> 
> Currently my ideas would be to either:
> 
> - add a new macro for constifying a guest handle (type -> const_type)
> - add a new macro for casting a guest handle to a const_type
> - add typedefs for the const_* types (typedef const x const_x)
> - open code the cast
> 
> Or am I missing an existing variant?

I don't think you are. Both of your first two suggestions look good
to me - ultimately we may want to have both anyway, eventually. For
its (presumed) type safety I may have a slight preference for
option 1, albeit afaics guest_handle_cast() doesn't allow
conversion between arbitrary types either (only to/from void).

It's quite unfortunate that this requires an explicit cast in the
first place, but what do you do.

Jan

