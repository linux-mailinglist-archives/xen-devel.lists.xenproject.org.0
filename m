Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D572B983E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:41:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31161.61427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmzm-0004Uf-Q2; Thu, 19 Nov 2020 16:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31161.61427; Thu, 19 Nov 2020 16:41:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmzm-0004UF-M2; Thu, 19 Nov 2020 16:41:18 +0000
Received: by outflank-mailman (input) for mailman id 31161;
 Thu, 19 Nov 2020 16:41:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfmzl-0004U6-KN
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:41:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5438bd50-1e91-4067-933c-827eb51a63ac;
 Thu, 19 Nov 2020 16:41:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1053AC2D;
 Thu, 19 Nov 2020 16:41:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfmzl-0004U6-KN
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:41:17 +0000
X-Inumbo-ID: 5438bd50-1e91-4067-933c-827eb51a63ac
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5438bd50-1e91-4067-933c-827eb51a63ac;
	Thu, 19 Nov 2020 16:41:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605804075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwpxDHOqqKFXjl+2b+i8GLr9f2p0gPevl0IRQU3xjg0=;
	b=IXC6vshs5jO4mQjsPVoKXO4YiOcZKqSyA03SO9VSchfxB3nuVL0iZgXGfvJhMAZY7S8zU5
	GxYpZllh461lMWdrgVjzsgydJJITfjbmaHS3a2X7WneaWZme9mIU8NZLonkw/ehJ1bnViT
	D/NIWK20N8UgMtcFJjDNfGxVj5rZwUs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E1053AC2D;
	Thu, 19 Nov 2020 16:41:14 +0000 (UTC)
Subject: Re: [PATCH 03/10] viridian: introduce a per-cpu hypercall_vpmask and
 accessor functions...
To: paul@xen.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-4-paul@xen.org>
 <01c7747e-70d0-e32b-45a6-afc1688c1741@suse.com>
 <00c901d6be8d$6d7a5c10$486f1430$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ec90042-cb19-320e-1676-409b68b73a51@suse.com>
Date: Thu, 19 Nov 2020 17:41:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <00c901d6be8d$6d7a5c10$486f1430$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.11.2020 17:02, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com
>> Sent: 12 November 2020 08:46
>>
>> On 11.11.2020 21:07, Paul Durrant wrote:
>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>> @@ -507,15 +507,41 @@ void viridian_domain_deinit(struct domain *d)
>>>      XFREE(d->arch.hvm.viridian);
>>>  }
>>>
>>> +struct hypercall_vpmask {
>>> +    DECLARE_BITMAP(mask, HVM_MAX_VCPUS);
>>> +};
>>> +
>>> +static DEFINE_PER_CPU(struct hypercall_vpmask, hypercall_vpmask);
>>> +
>>> +static void vpmask_empty(struct hypercall_vpmask *vpmask)
>>
>> const?
> 
> Yes, I suppose that's ook for all these since the outer struct is
> not changing... It's a bit misleading though.

I'd be curious to learn about that "misleading" aspect.

Jan

