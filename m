Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEDF31BAAC
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 15:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85246.159843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBePt-0003UU-D5; Mon, 15 Feb 2021 13:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85246.159843; Mon, 15 Feb 2021 13:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBePt-0003U2-7L; Mon, 15 Feb 2021 13:59:57 +0000
Received: by outflank-mailman (input) for mailman id 85246;
 Mon, 15 Feb 2021 13:59:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lBePr-0003Tx-NZ
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 13:59:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBePr-00079w-1E; Mon, 15 Feb 2021 13:59:55 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBePq-0000w9-Qn; Mon, 15 Feb 2021 13:59:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=If32U9ooWov0ZV7Yqm353+IJpeCNL3uN+LcztntuAV8=; b=D3Y/CNe9jLmTCappYS5AeQtTz3
	4THxUmzu3R+h+d+fUwwqYYODQvSxcMRHyjBSfecOTgyUXOL81TcyZm7007ENXAGYquZOVcsE9pqkm
	1EX0zt6F8M344QbMZKvDt0KQxBJBMss0Eq8kBMpJ0ks0Pca7psZxdY06V8ywKC4+9fAk=;
Subject: Re: Boot time and 3 sec in warning_print
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?Q?Anders_T=c3=b6rnqvist?=
 <anders.tornqvist@codiax.se>
References: <fcc14668-b07d-aec8-1587-bc2d7add84da@codiax.se>
 <4f256544-7e1a-1a65-4942-04b3bc00e373@suse.com>
 <d9d4ebf7-09b3-29f2-1359-cd9db73f9c94@suse.com>
 <84a8cc60-e63d-24db-750c-39bb6049c045@xen.org>
 <29a1b91f-891c-2a9e-a5f0-b7b01296c880@suse.com>
 <677c66e0-6f06-569c-7447-d3bd07dcda81@xen.org>
 <6c850ae1-62a9-4adb-fb94-ed90ee1780ff@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <173df539-6f89-061a-100e-4ed0b461dff1@xen.org>
Date: Mon, 15 Feb 2021 13:59:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6c850ae1-62a9-4adb-fb94-ed90ee1780ff@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 15/02/2021 12:29, Jan Beulich wrote:
> On 15.02.2021 11:50, Julien Grall wrote:
>> On 15/02/2021 10:41, Jan Beulich wrote:
>>> On 15.02.2021 11:35, Julien Grall wrote:
>>>> On 15/02/2021 08:38, Jan Beulich wrote:
>>>>> On 15.02.2021 09:13, Jürgen Groß wrote:
>>>>>> On 15.02.21 08:37, Anders Törnqvist wrote:
>>>>>>> I would like to shorten the boot time in our system if possible.
>>>>>>>
>>>>>>> In xen/common/warning.c there is warning_print() which contains a 3
>>>>>>> seconds loop that calls  process_pending_softirqs().
>>>>>>>
>>>>>>> What would the potential problems be if that loop is radically shortened?
>>>>>>
>>>>>> A user might not notice the warning(s) printed.
>>>>>>
>>>>>> But I can see your point. I think adding a boot option for setting
>>>>>> another timeout value (e.g. 0) would do the job without compromising
>>>>>> the default case.
>>>>>
>>>>> I don't think I agree - the solution to this is to eliminate the
>>>>> reason leading to the warning.
>>>>    >
>>>>> The delay is intentionally this way
>>>>> to annoy the admin and force them to take measures.
>>>> Given they are warning, an admin may have assessed them and considered
>>>> there is no remediation necessary.
>>>>
>>>> We encountered the same problem with LiveUpdate. If you happen to have a
>>>> warning (e.g. sync_console for debugging), then you are adding 3s in
>>>> your downtime (this can more than double-up the actual one).
>>>
>>> One very explicitly should not run with sync_console in production.
>>
>> I knew it would be misinterpreted ;). I agree that sync_console must not
>> be used in production.
>>
>> I gave the example of sync_console because this is something impacting
>> debugging of LiveUpdate. If you have a console issue and need to add
>> sync_console, then you may end up to wreck completely your platform when
>> LiveUpdating.
>>
>> Without the 3s delay, then you have a chance to LiveUpdate and figure
>> out the problem.
> 
> I'm afraid I don't see how LU comes into the picture here: We're
> talking about a boot time delay. The delay doesn't recur at any
> point at runtime.

Live Update is a reboot of the hypervisor. The main difference is we are 
carrying the state of each domain states to the new Xen along with some 
strictly necessary global state (e.g. IOMMU).

So the new Xen will mostly followed the same boot path as you would from 
a "classic" (re)boot. There are only a few twist necessary for 
LiveUpdate (e.g. reserving memory, creating/restoring multiple domains).

We would need to gate the 3s pause in the case of LiveUpdate. At which 
point, it seems we may want to take an approach that also benefits other 
users.

Cheers,

-- 
Julien Grall

