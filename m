Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15462CBAE3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 11:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42610.76664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkPew-0003zi-J2; Wed, 02 Dec 2020 10:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42610.76664; Wed, 02 Dec 2020 10:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkPew-0003zJ-Fg; Wed, 02 Dec 2020 10:46:54 +0000
Received: by outflank-mailman (input) for mailman id 42610;
 Wed, 02 Dec 2020 10:46:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkPeu-0003zE-UZ
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 10:46:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e8a8fae-c4a8-4b0c-9c17-365c986087fe;
 Wed, 02 Dec 2020 10:46:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37B5EACB5;
 Wed,  2 Dec 2020 10:46:51 +0000 (UTC)
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
X-Inumbo-ID: 9e8a8fae-c4a8-4b0c-9c17-365c986087fe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606906011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTD3mEBlpAzVGMWs80SkdN2Ve9wTuxDg3Z7Z8vfRfMA=;
	b=Pl/nEvyVlgS7g3phEkB4jnf1kD9DofrUOkY5wCKfqpCoKGTl+2rAYumtiiwA0QD/7Ns+zD
	FCGjrpFkl6mS9hKbq02nj+FCF8EAxhOwd+o/HKJKQujS4X9skwIacOwPDlrUE2+D7WdNPD
	fpSb8SMkSHMvD+CuttsBGGufuH33dm8=
Subject: Re: [PATCH v2 06/17] xen/cpupool: use ERR_PTR() for returning error
 cause from cpupool_create()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-7-jgross@suse.com>
 <08f377a7-7862-0597-fe42-98851dc3db37@suse.com>
 <b130d75b-8cfa-7158-7f27-947ee50c579f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <841e972f-4b46-e606-3344-c6ba423acf5c@suse.com>
Date: Wed, 2 Dec 2020 11:46:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <b130d75b-8cfa-7158-7f27-947ee50c579f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.12.2020 10:56, Jürgen Groß wrote:
> On 02.12.20 09:58, Jan Beulich wrote:
>> On 01.12.2020 09:21, Juergen Gross wrote:
>>> Instead of a pointer to an error variable as parameter just use
>>> ERR_PTR() to return the cause of an error in cpupool_create().
>>>
>>> This propagates to scheduler_alloc(), too.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with one small question:
>>
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -3233,26 +3233,25 @@ struct scheduler *scheduler_get_default(void)
>>>       return &ops;
>>>   }
>>>   
>>> -struct scheduler *scheduler_alloc(unsigned int sched_id, int *perr)
>>> +struct scheduler *scheduler_alloc(unsigned int sched_id)
>>>   {
>>>       int i;
>>> +    int ret;
>>
>> I guess you didn't merge this with i's declaration because of a
>> plan/hope for i to be converted to unsigned int?
> 
> The main reason is I don't like overloading variables this way.

That's no what I asked. I was wondering why the new decl wasn't

    int i, ret;

Jan

