Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4752DC45C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 17:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55340.96459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZmE-00061c-8M; Wed, 16 Dec 2020 16:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55340.96459; Wed, 16 Dec 2020 16:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZmE-00061D-5D; Wed, 16 Dec 2020 16:35:46 +0000
Received: by outflank-mailman (input) for mailman id 55340;
 Wed, 16 Dec 2020 16:35:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZEz=FU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpZmC-000616-Uh
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 16:35:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3d35508-293d-484c-8971-33ee2a0a6b72;
 Wed, 16 Dec 2020 16:35:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05A83AE86;
 Wed, 16 Dec 2020 16:35:43 +0000 (UTC)
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
X-Inumbo-ID: d3d35508-293d-484c-8971-33ee2a0a6b72
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608136543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bnPekGeKuPbFJ1TL9eKBy1yLcE8aaa9z6PSjb6epRNU=;
	b=Tt7oKcbJndpFvBnEYrt4yt1aWjMBMwsFIlCXROQP5AeOa88az9kJ+vGmhXhv+8oMBglHOD
	y70tRnVC6AYqHJUCoLVNptIAbBt3wgfcytQ/G9AYg+6KkzF1i5jDRmmIzehNf9UZA+wCeo
	ICZyKROYwfKPXW/erZx/VKvX+9WJCOw=
Subject: Re: [PATCH v3 2/8] xen/hypfs: switch write function handles to const
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-3-jgross@suse.com>
 <bdd553b4-968a-ff71-4bac-2824f86ba869@suse.com>
 <be37658b-2a56-8506-70d0-e74328b61c5a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b9910ee-9663-fc8f-8323-f483cd51b6f9@suse.com>
Date: Wed, 16 Dec 2020 17:35:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <be37658b-2a56-8506-70d0-e74328b61c5a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16.12.2020 17:17, Jürgen Groß wrote:
> On 16.12.20 17:08, Jan Beulich wrote:
>> On 09.12.2020 17:09, Juergen Gross wrote:
>>> --- a/xen/include/xen/guest_access.h
>>> +++ b/xen/include/xen/guest_access.h
>>> @@ -26,6 +26,11 @@
>>>       type *_x = (hnd).p;                         \
>>>       (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
>>>   })
>>> +/* Same for casting to a const type. */
>>> +#define guest_handle_const_cast(hnd, type) ({       \
>>> +    const type *_x = (const type *)((hnd).p);       \
>>> +    (XEN_GUEST_HANDLE_PARAM(const_##type)) { _x };  \
>>> +})
>>
>> Afaict this allow casting from e.g. uint to const_ulong. We
>> don't want to permit this (i.e. if really needed one is to
>> go through two steps). I think all it takes is dropping the
>> cast:
>>
>> #define guest_handle_const_cast(hnd, type) ({      \
>>      const type *_x = (hnd).p;                      \
>>      (XEN_GUEST_HANDLE_PARAM(const_##type)) { _x }; \
>> })
>>
>> With this
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> and I'd be okay making the adjustment while committing
>> (provided it works and I didn't overlook anything).
> 
> At least it is still compiling, and I guess that was the main
> concern.

Indeed. Thanks for checking.

Jan

