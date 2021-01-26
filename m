Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3523304383
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 17:14:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75266.135477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4QyU-0003QL-Km; Tue, 26 Jan 2021 16:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75266.135477; Tue, 26 Jan 2021 16:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4QyU-0003Pw-Hf; Tue, 26 Jan 2021 16:13:50 +0000
Received: by outflank-mailman (input) for mailman id 75266;
 Tue, 26 Jan 2021 16:13:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4QyT-0003Pr-7d
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:13:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a4139b1-bc25-45e8-af44-f627c272a40f;
 Tue, 26 Jan 2021 16:13:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19F11AB92;
 Tue, 26 Jan 2021 16:13:47 +0000 (UTC)
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
X-Inumbo-ID: 3a4139b1-bc25-45e8-af44-f627c272a40f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611677627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RLJLIMLsKavuqFKq7beKULubAhkwt+v1KlfaoupVfA=;
	b=H+6QXyEp9Rat6/oDIc+imcRVmteDXaA5hT4RwcdkF/qIZS1Ab/oF/sSaMviK4EqTS/5C9V
	jrwDrzUXWiddx5mYFsz66+/9P9CbuLcWYs9BZhAawU6yr7zJFU7poJ7NC4LGxVscaGlGhC
	vdt5YWXA9GOjS5S/TGZY7Qq0i/K9ZPc=
Subject: Re: [PATCH 1/3] x86/irq: remove duplicated clear_domain_irq_pirq
 calls
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126110606.21741-1-roger.pau@citrix.com>
 <20210126110606.21741-2-roger.pau@citrix.com>
 <10af3f2a-6f4f-372c-6d9a-c02fc730af4b@suse.com>
 <20210126160851.3ocxqnkmmxzojrar@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6726c520-bb0d-7ed7-21c9-aca31b6721f5@suse.com>
Date: Tue, 26 Jan 2021 17:13:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126160851.3ocxqnkmmxzojrar@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 17:08, Roger Pau Monné wrote:
> On Tue, Jan 26, 2021 at 03:38:27PM +0100, Jan Beulich wrote:
>> On 26.01.2021 12:06, Roger Pau Monne wrote:
>>> There are two duplicated calls to cleanup_domain_irq_pirq in
>>> unmap_domain_pirq.
>>>
>>> The first one in the for loop will be called with exactly the same
>>> arguments as the call placed closer to the loop start.
>>
>> I'm having trouble figuring out which two instances you refer
>> to: To me "first one" and "closer to the start" are two ways
>> of expressing the same thing. You don't refer to the call to
>> clear_domain_irq_pirq(), do you, when the two calls you
>> remove are to cleanup_domain_irq_pirq()? Admittedly quite
>> similar names, but entirely different functions.
> 
> Urg, yes, that's impossible to parse sensibly, sorry.
> 
> Also the subject is wrong, should be cleanup_domain_irq_pirq, not
> clear_domain_irq_pirq.
> 
> This should instead be:
> 
> "There are two duplicated calls to cleanup_domain_irq_pirq in
> unmap_domain_pirq.
> 
> The first removed call to cleanup_domain_irq_pirq will be called with
> exactly the same arguments as the previous call placed above it."

And which one is "the previous call"? I'm still getting the
impression you're mixing up cleanup_domain_irq_pirq() and
clear_domain_irq_pirq(). (I guess we need to resort to line
numbers in current staging or master, to avoid
misunderstandings. Not for the commit message [if any], but
for the discussion.)

> It's hard to explain this in a commit message.
> 
> Do you agree that the removed calls are duplicated though? I might have
> as well missed part of the logic here and be wrong about this.

No, for the moment I don't agree yet, because I don't see
the redundancy so far.

>>> The logic used in the loop seems extremely complex to follow IMO,
>>> there are several breaks for exiting the loop, and the index (i) is
>>> also updated in different places.
>>
>> Indeed, and it didn't feel well already back at the time when
>> I much extended this to support multi-vector MSI. I simply
>> didn't have any good idea how to streamline all of this
>> (short of rewriting it altogether, which would have made
>> patch review quite difficult). If you have thoughts, I'm all
>> ears.
> 
> I would just rewrite it altogether. Code like this is very prone to
> cause mistakes in the future IMO. If you want I can try to.

I wouldn't mind, but yes, besides review difficulties ...

> I guess the problem with this is that we would lose the history of the
> code for no functional change.

... this also wouldn't be overly nice (but can be dealt with
via a few more steps wading through git history).

Jan

