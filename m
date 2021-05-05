Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74393373E11
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 17:01:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123170.232347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leJ1B-0006wY-Cs; Wed, 05 May 2021 15:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123170.232347; Wed, 05 May 2021 15:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leJ1B-0006ty-9T; Wed, 05 May 2021 15:00:53 +0000
Received: by outflank-mailman (input) for mailman id 123170;
 Wed, 05 May 2021 15:00:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leJ1A-0006ts-B1
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 15:00:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50acb3b7-c15b-4179-8b82-9ee63b785d3b;
 Wed, 05 May 2021 15:00:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9FF0AC2C;
 Wed,  5 May 2021 15:00:50 +0000 (UTC)
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
X-Inumbo-ID: 50acb3b7-c15b-4179-8b82-9ee63b785d3b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620226850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPZwS1jNW6X3xDIu0uFqYhK1qaYZcQoLoCHFd9oWP38=;
	b=aAbN8fQbGZSseffMb6iMpLqeLFM26cNHcN8JoA1TedST5b7NOYqJ9J0WF9Q9LULDt6zAn3
	7IIm+4J8Iw/u67eGn1C9vLfKxrRw8FTqL0rM/pogrk/69BZsQspmn7r4yEXAIgF/xjneC+
	aJIE7kzzUB1/w9LjzAqvHRnKVPpM7t4=
Subject: Re: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible()
 with MSR_ARCH_CAPS handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210504213120.4179-1-andrew.cooper3@citrix.com>
 <YJJtqyDOIkMxjvxW@Air-de-Roger>
 <8f6f339b-f025-2cd0-e666-a3083e79af3a@citrix.com>
 <YJKXZyCHpRg32tyc@Air-de-Roger>
 <38f5b74f-b005-784b-a92d-8ddb9e1b8d3c@citrix.com>
 <bb2089cf-74f3-a7f2-7001-21a0d009440f@suse.com>
 <8d786331-0d9a-2ec7-0fe5-ba86d4a2547c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9e03aa4-bbf4-a1ef-bfab-2803e707f498@suse.com>
Date: Wed, 5 May 2021 17:00:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8d786331-0d9a-2ec7-0fe5-ba86d4a2547c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.05.2021 16:50, Andrew Cooper wrote:
> On 05/05/2021 15:48, Jan Beulich wrote:
>> On 05.05.2021 16:29, Andrew Cooper wrote:
>>> Technically, MCXSR_MASK is also a hard blocker to migration, but we
>>> don't even have that data in a consumable form, and we just might be
>>> extremely lucky and discover that it is restricted to non-64-bit CPUs.
>> "it" being what here? The value's presence / absence in an {F,}XSAVE
>> image? Or the precise value of it?
> 
> The precise value of it.

Not sure whether DAZ is new enough, but relatively sure MM isn't.

>  Migrating across the boundary where the
> default changed will cause {F,}RSTOR instructions to #GP.

That's understood. Is there actually anything standing in the way
of treating MXCSR_MASK like yet another feature flag group?

Jan

