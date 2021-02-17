Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E322C31D712
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 10:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86180.161529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCJLO-0002XB-7k; Wed, 17 Feb 2021 09:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86180.161529; Wed, 17 Feb 2021 09:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCJLO-0002Wm-4d; Wed, 17 Feb 2021 09:42:02 +0000
Received: by outflank-mailman (input) for mailman id 86180;
 Wed, 17 Feb 2021 09:42:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IRng=HT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lCJLM-0002Wh-30
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 09:42:00 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1611a42b-b7b4-4c0a-b152-a0ba389d5b12;
 Wed, 17 Feb 2021 09:41:58 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r21so16597736wrr.9
 for <xen-devel@lists.xenproject.org>; Wed, 17 Feb 2021 01:41:58 -0800 (PST)
Received: from ?IPv6:2a00:23c5:5785:9a01:71b0:bf69:5f0d:b70f?
 ([2a00:23c5:5785:9a01:71b0:bf69:5f0d:b70f])
 by smtp.gmail.com with ESMTPSA id o13sm3968880wrs.45.2021.02.17.01.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 01:41:57 -0800 (PST)
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
X-Inumbo-ID: 1611a42b-b7b4-4c0a-b152-a0ba389d5b12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H9YiCxPC3EWKAD/DFSNhs4Ry4EYfjJv5o1ZFvoYgAxU=;
        b=X8SNqkdKYWiEpgfGlmblSR1TfoWzv/Zw+itn4ZAw9ABm9hLvgspWpFUaGxzdiYgGKO
         cP/PB8nMsOnBtxuogTHBwjBrUmNOsHZueHl30HXHxrPg31/lft//ccAcJX3IjPhyakUy
         Et7S65k/fIJiL+HGvxeplAG1N20fOA0DobTp23sdgxgfGHVw6wQo6217tCeqOjlLjzhB
         niSy2VqU/eEthqhnzC3Pq8K26halit0KSqPConW7Ux6v6Ts9kBSRttOcvp+5C/132dpG
         YQ4xWi20s6jKFMWeN+GylMMa8R69J5lW2m5MFoL+gShVtsBFVRnmPo3FyhQpmvfAlq8s
         33yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=H9YiCxPC3EWKAD/DFSNhs4Ry4EYfjJv5o1ZFvoYgAxU=;
        b=mI/jtJihQ4aE49VwBHx0SuNHrgIImtRYXoPDi2hvkv5JzgSyLG0CkWbplsNKVOFlRM
         B93V+XfKxmk9HsUkwciD/s7Chc7ASSkUgIQXQxBvPPiu/US74vFv31P3SVEXzeXzvIaV
         yT5hZsqiWyiMOXpPlAvPItmhS5KEjciBDT8aMT1gjkw4u/cHuHjrzDkbftYy+Ug1z2iw
         PRvJH2AGM+PVEJs17Q86fcowqQ2yIiy5Q8AtSd3WFQ2kqqe8UzCRw6Dy+PKuPoXRA/M9
         +lsJO9AGhGU65gajvRSpNw85Vjf6jy8M0vv6Tzbq/WMx4cxbj/LMRhOL8cnNqtT1wB6R
         Jh0Q==
X-Gm-Message-State: AOAM533hYluius0O1dY7gha9Q3G++Q2uVmH0AOIBBUd1o2MJUpDaj2Le
	J2B+a3ZAu5bNzEn1xw/ZK6fPJhe1kouPgQ==
X-Google-Smtp-Source: ABdhPJzoVsEvclI2KTyTxhqm3DQdUCEZtjnNXr2qlaRSsp548D0t0p/l5wZODJjOi3+9Povuwcrw7w==
X-Received: by 2002:a5d:4850:: with SMTP id n16mr28684852wrs.296.1613554917998;
        Wed, 17 Feb 2021 01:41:57 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: Ping: [PATCH v2 2/2] IOREQ: refine when to send mapcache
 invalidation request
To: Jan Beulich <jbeulich@suse.com>
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <0e7265fe-8d89-facb-790d-9232c742c3fa@suse.com>
 <e2682f84-b3bb-b9fb-edd8-863b9036de95@suse.com>
 <03fb01d6fad7$c39087b0$4ab19710$@xen.org>
 <ad73c330-4cbd-0ee4-fee7-2453dab00eef@suse.com>
 <006bd542-e213-a6ad-7812-e91fed7093a3@suse.com>
Message-ID: <56900eda-9718-f68a-8a05-99a8e713446d@xen.org>
Date: Wed, 17 Feb 2021 09:41:35 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <006bd542-e213-a6ad-7812-e91fed7093a3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17/02/2021 08:30, Jan Beulich wrote:
> Paul (or others), thoughts?
> 
> On 04.02.2021 12:24, Jan Beulich wrote:
>> On 04.02.2021 10:26, Paul Durrant wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 02 February 2021 15:15
>>>>
>>>> XENMEM_decrease_reservation isn't the only means by which pages can get
>>>> removed from a guest, yet all removals ought to be signaled to qemu. Put
>>>> setting of the flag into the central p2m_remove_page() underlying all
>>>> respective hypercalls as well as a few similar places, mainly in PoD
>>>> code.
>>>>
>>>> Additionally there's no point sending the request for the local domain
>>>> when the domain acted upon is a different one. The latter domain's ioreq
>>>> server mapcaches need invalidating. We assume that domain to be paused
>>>> at the point the operation takes place, so sending the request in this
>>>> case happens from the hvm_do_resume() path, which as one of its first
>>>> steps calls handle_hvm_io_completion().
>>>>
>>>> Even without the remote operation aspect a single domain-wide flag
>>>> doesn't do: Guests may e.g. decrease-reservation on multiple vCPU-s in
>>>> parallel. Each of them needs to issue an invalidation request in due
>>>> course, in particular because exiting to guest context should not happen
>>>> before the request was actually seen by (all) the emulator(s).
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> v2: Preemption related adjustment split off. Make flag per-vCPU. More
>>>>      places to set the flag. Also handle acting on a remote domain.
>>>>      Re-base.
>>>
>>> I'm wondering if a per-vcpu flag is overkill actually. We just need
>>> to make sure that we don't miss sending an invalidation where
>>> multiple vcpus are in play. The mapcache in the emulator is global
>>> so issuing an invalidate for every vcpu is going to cause an
>>> unnecessary storm of ioreqs, isn't it?
>>
>> The only time a truly unnecessary storm would occur is when for
>> an already running guest mapcache invalidation gets triggered
>> by a remote domain. This should be a pretty rare event, so I
>> think the storm in this case ought to be tolerable.
>>
>>> Could we get away with the per-domain atomic counter?
>>
>> Possible, but quite involved afaict: The potential storm above
>> is the price to pay for the simplicity of the model. It is
>> important to note that while we don't need all of the vCPU-s
>> to send these ioreqs, we need all of them to wait for the
>> request(s) to be acked. And this waiting is what we get "for
>> free" using the approach here, whereas we'd need to introduce
>> new logic for this with an atomic counter (afaict at least).
>>
>> Jan
>>
> 

Ok, let's take the patch as-is then.

Reviewed-by: Paul Durrant <paul@xen.org>


