Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7C92CDA22
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 16:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43781.78647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqXb-0002VO-4y; Thu, 03 Dec 2020 15:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43781.78647; Thu, 03 Dec 2020 15:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqXb-0002Uz-1e; Thu, 03 Dec 2020 15:29:07 +0000
Received: by outflank-mailman (input) for mailman id 43781;
 Thu, 03 Dec 2020 15:29:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkqXZ-0002Uu-Fg
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 15:29:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b10b02d5-7f06-4ec1-972c-e5f0a41e5e86;
 Thu, 03 Dec 2020 15:29:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3C8CABCE;
 Thu,  3 Dec 2020 15:29:03 +0000 (UTC)
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
X-Inumbo-ID: b10b02d5-7f06-4ec1-972c-e5f0a41e5e86
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607009343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rozxxHWvd4WD/sJly2e0flB1+mp+wjGgFoB1B01LzY=;
	b=Om3iCYJcZiBku6VQBJx64lrNacSpxXs80HWGAy770fLH2L3X/SVPZGjK0CW3dkaXF3T8uM
	COEQkJGV/XWJVsEiA50E5aF17DIJIGvWPUeAjoZoirpadrcAYH0P++GF/NXHTatTM2lFGd
	uTt5vn50SCN+HVD9KHBrwrFPF5BrE/Q=
Subject: Re: [PATCH v2 12/17] xen/hypfs: add new enter() and exit() per node
 callbacks
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-13-jgross@suse.com>
 <0c57dd86-36d9-c378-6bdb-50221a7812b8@suse.com>
 <2503547c-1b3c-2224-c4a9-c647d9d1a058@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6593ed01-23d0-70ac-faa3-556c69adec2b@suse.com>
Date: Thu, 3 Dec 2020 16:29:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <2503547c-1b3c-2224-c4a9-c647d9d1a058@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.12.2020 16:14, Jürgen Groß wrote:
> On 03.12.20 15:59, Jan Beulich wrote:
>> On 01.12.2020 09:21, Juergen Gross wrote:
>>> @@ -100,11 +112,58 @@ static void hypfs_unlock(void)
>>>       }
>>>   }
>>>   
>>> +const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry *entry)
>>> +{
>>> +    return entry;
>>> +}
>>> +
>>> +void hypfs_node_exit(const struct hypfs_entry *entry)
>>> +{
>>> +}
>>> +
>>> +static int node_enter(const struct hypfs_entry *entry)
>>> +{
>>> +    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
>>> +
>>> +    entry = entry->funcs->enter(entry);
>>> +    if ( IS_ERR(entry) )
>>> +        return PTR_ERR(entry);
>>> +
>>> +    ASSERT(!*last || *last == entry->parent);
>>> +
>>> +    *last = entry;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void node_exit(const struct hypfs_entry *entry)
>>> +{
>>> +    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
>>> +
>>> +    if ( !*last )
>>> +        return;
>>
>> Under what conditions is this legitimate to happen? IOW shouldn't
>> there be an ASSERT_UNREACHABLE() here?
> 
> This is for the "/" node.

I.e. would ASSERT(!entry->parent) be appropriate to add here, at
the same time serving as documentation of what you've just said?

Jan

