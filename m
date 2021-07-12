Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6023C4614
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 10:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154413.285348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2rSl-0004Ew-HH; Mon, 12 Jul 2021 08:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154413.285348; Mon, 12 Jul 2021 08:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2rSl-0004Bo-D8; Mon, 12 Jul 2021 08:38:51 +0000
Received: by outflank-mailman (input) for mailman id 154413;
 Mon, 12 Jul 2021 08:38:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m2rSk-0004Bi-GI
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 08:38:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m2rSj-0001Np-FS; Mon, 12 Jul 2021 08:38:49 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m2rSj-000255-9g; Mon, 12 Jul 2021 08:38:49 +0000
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
	bh=vUffdroP7VsgOpcXVmt0zL1hgSPI6XZJf36TOMRtkiM=; b=fR+hE52GfZOH0mtGiTG8s+3Oct
	yuq4uK6NcJSBXp6MFfxd5ooKDwdTUouvOJZ3xVx38kgQjsPACVFPfgWsSZxM8cu0LJM+qxwxU3s0l
	jrnz+RuN9I4Hy6AdCSI00iv9eKcqCMcn4miT8Fbak+CvHia5WLpIHh+21caUOyKm8wlw=;
Subject: Re: [PATCH v2 1/2] tools/xenstore: set oom score for xenstore daemon
 on Linux
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210608055839.10313-1-jgross@suse.com>
 <20210608055839.10313-2-jgross@suse.com>
 <467dc0c1-cf0a-2aaf-0c99-c1ca70b95912@xen.org>
 <6c4b8bb2-56c0-e0ee-2eea-52f2925803c9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <729f7677-8449-bea0-ed59-7ae1e42fe711@xen.org>
Date: Mon, 12 Jul 2021 09:38:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6c4b8bb2-56c0-e0ee-2eea-52f2925803c9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 09/07/2021 13:34, Juergen Gross wrote:
> On 08.07.21 19:40, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 08/06/2021 06:58, Juergen Gross wrote:
>>> Xenstored is absolutely mandatory for a Xen host and it can't be
>>> restarted, so being killed by OOM-killer in case of memory shortage is
>>> to be avoided.
>>>
>>> Set /proc/$pid/oom_score_adj (if available) to -500 in order to allow
>>> xenstored to use large amounts of memory without being killed.
>>>
>>> Make sure the pid file isn't a left-over from a previous run delete it
>>> before starting xenstored.
>>
>> This sentence is a bit confusing to read. Do you mean "*To* make 
>> sure....*,* delete it before"?
> 
> Yes, will change it.
> 
>>
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V2:
>>> - set oom score from launch script (Julien Grall)
>>> - split off open file descriptor limit setting (Julien Grall)
>>> ---
>>>   tools/hotplug/Linux/launch-xenstore.in | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/tools/hotplug/Linux/launch-xenstore.in 
>>> b/tools/hotplug/Linux/launch-xenstore.in
>>> index 019f9d6f4d..3ad71e3d08 100644
>>> --- a/tools/hotplug/Linux/launch-xenstore.in
>>> +++ b/tools/hotplug/Linux/launch-xenstore.in
>>> @@ -59,11 +59,14 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons 
>>> && . @CONFIG_DIR@/@CONFIG_LEAF
>>>           echo "No xenstored found"
>>>           exit 1
>>>       }
>>> +    rm -f @XEN_RUN_DIR@/xenstored.pid
>>>       echo -n Starting $XENSTORED...
>>>       $XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
>>>       systemd-notify --booted 2>/dev/null || timeout_xenstore 
>>> $XENSTORED || exit 1
>>> +    XS_PID=`cat @XEN_RUN_DIR@/xenstored.pid`
>>> +    echo -500 >/proc/$XS_PID/oom_score_adj
>>
>> NIT: It would be worth considering to introduce a variable so this can 
>> be set from the configuration file.
> 
> Do you have any scenario in mind where this would be beneficial?
> 
> I'm not against it, but I'm wondering why anybody would want that
> to be configurable.

So from the commit message (and browsing a bit), I don't understand how 
-500 would fit every case. IOW why not -600/-700...?

If it is a random value, then we should consider to allow the user to 
modify it easily. If the value has a specific meaning, then I think this 
ought to be written in the commit message and possibly launch-xenstore.in.

Cheers,

-- 
Julien Grall

