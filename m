Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9938798E
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 15:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129185.242520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lizTI-0007wm-9M; Tue, 18 May 2021 13:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129185.242520; Tue, 18 May 2021 13:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lizTI-0007ty-5T; Tue, 18 May 2021 13:09:16 +0000
Received: by outflank-mailman (input) for mailman id 129185;
 Tue, 18 May 2021 13:09:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lizTH-0007ts-EX
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 13:09:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lizTF-00038X-3P; Tue, 18 May 2021 13:09:13 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lizTE-000687-T1; Tue, 18 May 2021 13:09:13 +0000
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
	bh=VpFEJf3dK1mzzzqLQxOB5odV1T/4BCQbbWCtEN/OTNU=; b=LZGktt1l2jIoT6Zl3QJL17AB1A
	U/uxZDGFO12tk45PrsyvmSl+vU2u9ZqTiH/BU1MM+TVhH9ZdIpI2v0PngRhpPyxCYDhrvlKk4DPDV
	OsmqkfBZ/sEYWYHZDR5pogRp4+r/80ogBMoB0QD6a567CravTukQN753hdINUEzr/O78=;
Subject: Re: [PATCH] tools/xenstore: claim resources when running as daemon
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210514084133.18658-1-jgross@suse.com>
 <1e38cce0-6960-ac21-b349-dac8551e23ed@xen.org>
 <fe5f1e6a-1a89-ea12-feb5-318f25d4281f@suse.com>
 <39860a0c-5ac5-2537-532f-6ce288cc7219@xen.org>
 <e69f7d4c-a616-1265-e909-fd14feea7412@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1b1e32ce-a43e-65d5-ad59-35c045b03fbe@xen.org>
Date: Tue, 18 May 2021 14:09:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e69f7d4c-a616-1265-e909-fd14feea7412@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 18/05/2021 07:43, Juergen Gross wrote:
> On 17.05.21 17:55, Julien Grall wrote:
>>
>>>
>>>> So the admin should be able to configure them. At this point, I think 
> 
>>>> the two limit should be set my the initscript rather than xenstored 
>>>> itself.
>>>
>>> But the admin would need to know the Xen internals for selecting the
>>> correct limits. In the end I'd be fine with moving this modification to
>>> the script starting Xenstore (which would be launch-xenstore), but the
>>> configuration item should be "max number of domains to support".
>>
>> I would be fine with "max numer of domains to support". What I care the 
> 
>> most here is the limits are actually applied most of (if not all) the 
>> time.
> 
> I did another test and found:
> 
> - the xl daemon for a guest will use 2 socket connections
> - qemu for a HVM guest will use 3 socket connections
> - qemu for a PV guest is using one socket connection
> - 14 other files are used by xenstored
> 
> So we should set the limit to 5 * n_dom + 100 (some headroom will be
> nice IMO).

This looks fine to me.

> 
>>
>>>
>>>>
>>>> This would also avoid the problem where Xenstored is not allowed to 
>>>> modify its limit (see more below).
>>>>
>>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> ---
>>>>>   tools/xenstore/xenstored_core.c   |  2 ++
>>>>>   tools/xenstore/xenstored_core.h   |  3 ++
>>>>>   tools/xenstore/xenstored_minios.c |  4 +++
>>>>>   tools/xenstore/xenstored_posix.c  | 46 
>>>>> +++++++++++++++++++++++++++++++
>>>>>   4 files changed, 55 insertions(+)
>>>>>
>>>>> diff --git a/tools/xenstore/xenstored_core.c 
>>>>> b/tools/xenstore/xenstored_core.c
>>>>> index b66d119a98..964e693450 100644
>>>>> --- a/tools/xenstore/xenstored_core.c
>>>>> +++ b/tools/xenstore/xenstored_core.c
>>>>> @@ -2243,6 +2243,8 @@ int main(int argc, char *argv[])
>>>>>           xprintf = trace;
>>>>>   #endif
>>>>> +    claim_resources();
>>>>> +
>>>>>       signal(SIGHUP, trigger_reopen_log);
>>>>>       if (tracefile)
>>>>>           tracefile = 
> talloc_strdup(NULL, tracefile);
>>>>> diff --git a/tools/xenstore/xenstored_core.h 
>>>>> b/tools/xenstore/xenstored_core.h
>>>>> index 1467270476..ac26973648 100644
>>>>> --- a/tools/xenstore/xenstored_core.h
>>>>> +++ b/tools/xenstore/xenstored_core.h
>>>>> @@ -255,6 +255,9 @@ void daemonize(void);
>>>>>   /* Close stdin/stdout/stderr to complete daemonize */
>>>>>   void finish_daemonize(void);
>>>>> +/* Set OOM-killer score and raise ulimit. */
>>>>> +void claim_resources(void);
>>>>> +
>>>>>   /* Open a pipe for signal handling */
>>>>>   void init_pipe(int reopen_log_pipe[2]);
>>>>> diff --git a/tools/xenstore/xenstored_minios.c 
>>>>> b/tools/xenstore/xenstored_minios.c
>>>>> index c94493e52a..df8ff580b0 100644
>>>>> --- a/tools/xenstore/xenstored_minios.c
>>>>> +++ b/tools/xenstore/xenstored_minios.c
>>>>> @@ -32,6 +32,10 @@ void finish_daemonize(void)
>>>>>   {
>>>>>   }
>>>>> +void claim_resources(void)
>>>>> +{
>>>>> +}
>>>>> +
>>>>>   void init_pipe(int reopen_log_pipe[2])
>>>>>   {
>>>>>       reopen_log_pipe[0] = -1;
>>>>> diff --git a/tools/xenstore/xenstored_posix.c 
>>>>> b/tools/xenstore/xenstored_posix.c
>>>>> index 48c37ffe3e..0074fbd8b2 100644
>>>>> --- a/tools/xenstore/xenstored_posix.c
>>>>> +++ b/tools/xenstore/xenstored_posix.c
>>>>> @@ -22,6 +22,7 @@
>>>>>   #include <fcntl.h>
>>>>>   #include <stdlib.h>
>>>>>   #include <sys/mman.h>
>>>>> +#include <sys/resource.h>
>>>>>   #include "utils.h"
>>>>>   #include "xenstored_core.h"
>>>>> @@ -87,6 +88,51 @@ void finish_daemonize(void)
>>>>>       close(devnull);
>>>>>   }
>>>>> +static void avoid_oom_killer(void)
>>>>> +{
>>>>> +    char path[32];
>>>>> +    char val[] = "-500";
>>>>> +    int fd;
>>>>> +
>>>>> +    snprintf(path, sizeof(path), "/proc/%d/oom_score_adj", 
>>>>> (int)getpid());
>>>>
>>>> This looks Linux specific. How about other OSes?
>>>
>>> I don't know whether other OSes have an OOM killer, and if they do, how
>>> to configure it. It is a best effort attempt, after all.
>>
>> I have CCed Roger who should be able to help for FreeBSD.
> 
> It would be possible to set the OOM-score from the launch script, too.

It would be ideal if all the limits are set from the launch script. At 
least, they can be changed by the admin and also possibly be enforced 
(if Xenstored is not allowed to do it).

> 
>>
>>>
>>>>
>>>>> +
>>>>> +    fd = open(path, O_WRONLY);
>>>>> +    /* Do nothing if file doesn't exist. */
>>>>
>>>> Your commit message leads to think that we *must* configure the OOM. 
>>>> If not, then we should not continue. But here, this suggest this is 
>>>> optional. In fact...
>>>
>>> I can modify the commit message by adding a "Try to".
>>>
>>>>
>>>>> +    if (fd < 0)
>>>>> +        return;
>>>>> +    /* Ignore errors. */
>>>>> +    write(fd, val, sizeof(val));
>>>>
>>>> ... xenstored may not be allowed to modify its own parameters. So 
>>>> this would continue silently without the admin necessarily knowning 
>>>> the limit wasn't applied.
>>>
>>> I can add a line in the Xenstore log in this regard.
>>
>> This feels wrong to me. If a limit cannot be applied then it should 
>> fail early rather than possibly at the wrong moment a few days 
>> (months?) after.
> 
> I think issuing a warning would be better here. We are running with
> no OOM adjustments since years now.

Right, this is a sign that the OOM adjustment is not necessary in most 
of the cases. But the fact you sent this patch suggests that you or 
someone else saw Xenstored crashing.

The idea with failing hard and early is the admin will directly be aware 
that didn't happen. It can then take action before it is too late (e.g. 
Xenstored was killed while VMs are running).

With the warning, I am worry the admin may not notice it because they 
are easy to miss.

Anyway, if the OOM adjustment is moved to the launch script, then there 
is less change it may fail (the launch script should have higher 
privilege than xenstored).

Cheers,

-- 
Julien Grall

