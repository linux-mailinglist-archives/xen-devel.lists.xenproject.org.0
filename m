Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76C31B75C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 11:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85137.159635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBbJv-00027X-M8; Mon, 15 Feb 2021 10:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85137.159635; Mon, 15 Feb 2021 10:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBbJv-000278-IT; Mon, 15 Feb 2021 10:41:35 +0000
Received: by outflank-mailman (input) for mailman id 85137;
 Mon, 15 Feb 2021 10:41:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lBbJu-000273-E2
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 10:41:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f561364-0321-47ab-b597-8b002a93bc22;
 Mon, 15 Feb 2021 10:41:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08991AC32;
 Mon, 15 Feb 2021 10:41:31 +0000 (UTC)
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
X-Inumbo-ID: 9f561364-0321-47ab-b597-8b002a93bc22
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613385691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+tRXwQ5Ct7R9Eny+tyaBcKdcNvbILR4Ppv/xJyxewI=;
	b=sKprtr3aGelwXzmVxyVFToWNO0aOctFxCQ4A0nzA77WkL30Vf3gyh6KEIoye5KkxGnlcBG
	uYnCLWfBw2i7QXP7Atqbu4W8fNzoj4/81pp85OMU8ektMjvUYtJtzwR0VWNgQkJ7wD8+wP
	VZHJ/UfB98FEWZxeqppiA07uLUZGRvU=
Subject: Re: Boot time and 3 sec in warning_print
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?Q?Anders_T=c3=b6rnqvist?=
 <anders.tornqvist@codiax.se>
References: <fcc14668-b07d-aec8-1587-bc2d7add84da@codiax.se>
 <4f256544-7e1a-1a65-4942-04b3bc00e373@suse.com>
 <d9d4ebf7-09b3-29f2-1359-cd9db73f9c94@suse.com>
 <84a8cc60-e63d-24db-750c-39bb6049c045@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <29a1b91f-891c-2a9e-a5f0-b7b01296c880@suse.com>
Date: Mon, 15 Feb 2021 11:41:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <84a8cc60-e63d-24db-750c-39bb6049c045@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.02.2021 11:35, Julien Grall wrote:
> On 15/02/2021 08:38, Jan Beulich wrote:
>> On 15.02.2021 09:13, Jürgen Groß wrote:
>>> On 15.02.21 08:37, Anders Törnqvist wrote:
>>>> I would like to shorten the boot time in our system if possible.
>>>>
>>>> In xen/common/warning.c there is warning_print() which contains a 3
>>>> seconds loop that calls  process_pending_softirqs().
>>>>
>>>> What would the potential problems be if that loop is radically shortened?
>>>
>>> A user might not notice the warning(s) printed.
>>>
>>> But I can see your point. I think adding a boot option for setting
>>> another timeout value (e.g. 0) would do the job without compromising
>>> the default case.
>>
>> I don't think I agree - the solution to this is to eliminate the
>> reason leading to the warning. 
>  >
>> The delay is intentionally this way
>> to annoy the admin and force them to take measures.
> Given they are warning, an admin may have assessed them and considered 
> there is no remediation necessary.
> 
> We encountered the same problem with LiveUpdate. If you happen to have a 
> warning (e.g. sync_console for debugging), then you are adding 3s in 
> your downtime (this can more than double-up the actual one).

One very explicitly should not run with sync_console in production.

> What was just an "annoyance" for boot can now completely wreck your 
> guests and system (not many software can tolerate large downtime).
> 
> So I think we either want to drop the 3s pause completely or allow the 
> user to decide whether he/she cares about it via a command line option.
> 
> I am leaning towards the former at the moment.

I'm afraid I'm -2 towards complete removal. I'm at least -1 towards
shortening of the pause, as already indicated.

Jan

