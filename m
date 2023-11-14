Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE04D7EB7FE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 21:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633255.987884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r30Pi-0003UR-DF; Tue, 14 Nov 2023 20:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633255.987884; Tue, 14 Nov 2023 20:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r30Pi-0003Sm-AY; Tue, 14 Nov 2023 20:53:38 +0000
Received: by outflank-mailman (input) for mailman id 633255;
 Tue, 14 Nov 2023 20:53:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r30Pg-0003Sg-Gm
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 20:53:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r30Pf-0007Qi-Pp; Tue, 14 Nov 2023 20:53:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r30Pf-0004LP-Kr; Tue, 14 Nov 2023 20:53:35 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=2iFd1UHRqfu6r4Oi82J3W7ftMJxqCziu8eup/stdvh4=; b=KwSmPGqmSaJQe19udEhfMR6pHp
	a1S6tFLlTg9cdUqMatYbZGQvgQcetcqVV+omPg2FHIru75aPge0lFvf+WUgnKenzhd2rwH3bBFIm6
	tRk43e51EdGzC0Pj90UEVENNJ4VwD2kP6yS+KkoRGTzOe7oQyW6K1AFF9QI78S2palt0=;
Message-ID: <b18acbe0-b8f9-47d6-a85d-c4a7bd158809@xen.org>
Date: Tue, 14 Nov 2023 20:53:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/29] tools/xenstored: add helpers for filename
 handling
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-28-jgross@suse.com>
 <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org>
 <e3376d27-3b36-4290-8f7a-e99db1e2fbbf@suse.com>
 <2f024e6b-8f4b-4784-a1ef-1acb04c5a4dc@xen.org>
 <f15e5a60-e1b0-445b-9374-f8feda10f0b0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f15e5a60-e1b0-445b-9374-f8feda10f0b0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 14/11/2023 09:26, Juergen Gross wrote:
> On 14.11.23 10:10, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 14/11/2023 06:45, Juergen Gross wrote:
>>> On 13.11.23 23:25, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 10/11/2023 16:08, Juergen Gross wrote:
>>>>> Add some helpers for handling filenames which might need different
>>>>> implementations between stubdom and daemon environments:
>>>>>
>>>>> - expansion of relative filenames (those are not really defined today,
>>>>>    just expand them to be relative to /var/lib/xen/xenstore)
>>>>> - expansion of xenstore_daemon_rundir() (used e.g. for saving the 
>>>>> state
>>>>>    file in case of live update - needs to be unchanged in the daemon
>>>>>    case, but should result in /var/lib/xen/xenstore for stubdom)
>>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>>>>> ---
>>>>>   tools/xenstored/core.c      | 9 ++++++++-
>>>>>   tools/xenstored/core.h      | 3 +++
>>>>>   tools/xenstored/lu_daemon.c | 4 ++--
>>>>>   tools/xenstored/minios.c    | 5 +++++
>>>>>   tools/xenstored/posix.c     | 5 +++++
>>>>>   5 files changed, 23 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
>>>>> index 4a9d874f17..77befd24c9 100644
>>>>> --- a/tools/xenstored/core.c
>>>>> +++ b/tools/xenstored/core.c
>>>>> @@ -158,6 +158,13 @@ void trace_destroy(const void *data, const 
>>>>> char *type)
>>>>>           trace("obj: DESTROY %s %p\n", type, data);
>>>>>   }
>>>>> +char *absolute_filename(const void *ctx, const char *filename)
>>>>
>>>> Can the return be const?
>>>
>>> I'll have a look.
>>>
>>>>
>>>>> +{
>>>>> +    if (filename[0] != '/')
>>>>> +        return talloc_asprintf(ctx, XENSTORE_LIB_DIR "/%s", 
>>>>> filename);
>>>>
>>>> Looking at the rest of patch, you will be using xenstore_rundir(). I 
>>>> wonder whether it would not be better to switch to xenstore_rundir() 
>>>> so...
>>>>
>>>>> +    return talloc_strdup(ctx, filename);
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * Signal handler for SIGHUP, which requests that the trace log 
>>>>> is reopened
>>>>>    * (in the main loop).  A single byte is written to 
>>>>> reopen_log_pipe, to awaken
>>>>> @@ -2983,7 +2990,7 @@ int main(int argc, char *argv[])
>>>>>       signal(SIGHUP, trigger_reopen_log);
>>>>>       if (tracefile)
>>>>> -        tracefile = talloc_strdup(NULL, tracefile);
>>>>> +        tracefile = absolute_filename(NULL, tracefile);
>>>>>   #ifndef NO_LIVE_UPDATE
>>>>>       /* Read state in case of live update. */
>>>>> diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
>>>>> index a0d3592961..51e1dddb22 100644
>>>>> --- a/tools/xenstored/core.h
>>>>> +++ b/tools/xenstored/core.h
>>>>> @@ -393,6 +393,9 @@ void early_init(void);
>>>>>   void mount_9pfs(void);
>>>>>   #endif
>>>>> +const char *xenstore_rundir(void);
>>>>> +char *absolute_filename(const void *ctx, const char *filename);
>>>>> +
>>>>>   /* Write out the pidfile */
>>>>>   void write_pidfile(const char *pidfile);
>>>>> diff --git a/tools/xenstored/lu_daemon.c b/tools/xenstored/lu_daemon.c
>>>>> index 71bcabadd3..6351111ab0 100644
>>>>> --- a/tools/xenstored/lu_daemon.c
>>>>> +++ b/tools/xenstored/lu_daemon.c
>>>>> @@ -24,7 +24,7 @@ void lu_get_dump_state(struct lu_dump_state *state)
>>>>>       state->size = 0;
>>>>>       state->filename = talloc_asprintf(NULL, "%s/state_dump",
>>>>> -                      xenstore_daemon_rundir());
>>>>> +                      xenstore_rundir());
>>>>
>>>> ... call and ...
>>>>
>>>>>       if (!state->filename)
>>>>>           barf("Allocation failure");
>>>>> @@ -65,7 +65,7 @@ FILE *lu_dump_open(const void *ctx)
>>>>>       int fd;
>>>>>       filename = talloc_asprintf(ctx, "%s/state_dump",
>>>>> -                   xenstore_daemon_rundir());
>>>>> +                   xenstore_rundir());
>>>>
>>>> ... this one could be replaced with absolute_filename().
>>>
>>> No, I don't think this is a good idea.
>>>
>>> I don't want the daemon to store trace files specified as relative files
>>> to be stored in /var/run/xen, while I want all files of the stubdom 
>>> to be
>>> stored under /var/lib/xen.
>>
>> Why? This is a bit odd to have a different behavior between stubdom 
>> and daemon. It would be much easier for the user if they knew all the 
>> files would be at the same place regardless the version used.
> 
> The main difference is that stubdom has access to only _one_ directory 
> in dom0.

Would you be able to explain why we can only give access to a single 
directory? Is this because of the 9pfs protocol?

> I /could/ give it access to "/", but do we really want that?

I don't think we want to give access to "/".

> 
> We can't get rid of the /var/run/xen access in xenstored, as it is used for
> live update, so the old and the new xenstored need to agree on the 
> location of
> the state file.

Well, Xenstored Live-Update is technically a tech preview feature. So we 
*could* break it and allow the state file to be specified on the command 
line.

Anyway, I am ok if you want them to have the live-update state in a 
separate however...


> And we can't drop the possibility of specifying absolute 
> paths
> for e.g. trace files, as those might be in use by users already.
> 
>> Also, regarding the background of my question. You are introducing a 
>> function call absolute_filename(). From the name, there is nothing 
>> indicating that this should only be used for trace files. If this is 
>> only indented for tracefile, then I think this should be renamed to 
>> something like absolute_tracefile(...).
> 
> After the last patch of this series "xenstore-control memreport <file>" 
> will use
> it, too.

... this doesn't change my point here. The function name doesn't *tell* 
me why it can't be used for live-update files.

If this can't be clarified in the name, then it should be clarified in a 
comment. Maybe one top of the Live-Update code.

Cheers,

-- 
Julien Grall

