Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495493502DA
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 16:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103995.198413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRcHt-0005H8-PF; Wed, 31 Mar 2021 14:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103995.198413; Wed, 31 Mar 2021 14:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRcHt-0005Gj-Lw; Wed, 31 Mar 2021 14:57:41 +0000
Received: by outflank-mailman (input) for mailman id 103995;
 Wed, 31 Mar 2021 14:57:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRcHs-0005Ge-8d
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 14:57:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7ebb13c-5a96-42c5-a976-f0cac25e6e9e;
 Wed, 31 Mar 2021 14:57:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA376B2DA;
 Wed, 31 Mar 2021 14:57:38 +0000 (UTC)
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
X-Inumbo-ID: c7ebb13c-5a96-42c5-a976-f0cac25e6e9e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617202658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdqpmDEpGjbr6I3iWXbJUxj+OjAfxYAQ9ASwhftDVkI=;
	b=q2BwGAuloO5qHdUIA/gdPdTKmByvzQotNGgULLLjhM+OziS3ZREhZxy8xGs5Ebju1U4Sij
	Pw8n6mPTWC1qSdJJLv/3lLcq4YQN0ObA1JciSrBcaNL72GgOGdzpzflzU+Uf/h1zeF6KPa
	mrxfbc9ZDlduuDzY+IayPj8Y7AydE3I=
Subject: Re: [PATCH 14/21] libs/guest: introduce helper to check cpu policy
 compatibility
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-15-roger.pau@citrix.com>
 <8f7a2f44-c006-0f94-8f44-b6b3ee3e9d1f@suse.com>
 <YGRtzlUmuRjKh6er@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <958bf9f5-8481-b7fe-c29f-6eb971c6e2f1@suse.com>
Date: Wed, 31 Mar 2021 16:57:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGRtzlUmuRjKh6er@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 31.03.2021 14:40, Roger Pau Monné wrote:
> On Tue, Mar 30, 2021 at 06:02:45PM +0200, Jan Beulich wrote:
>> On 23.03.2021 10:58, Roger Pau Monne wrote:
>>> --- a/tools/libs/guest/xg_cpuid_x86.c
>>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>>> @@ -1098,3 +1098,20 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
>>>      return rc;
>>>  
>>>  }
>>> +
>>> +bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t p1,
>>> +                                 const xc_cpu_policy_t p2)
>>> +{
>>> +    struct cpu_policy_errors err;
>>
>> Don't you need an initializer here for ...
>>
>>> +    int rc = x86_cpu_policies_are_compatible(p1, p2, &err);
>>> +
>>> +    if ( !rc )
>>> +        return true;
>>> +
>>> +    if ( err.leaf != -1 )
>>> +        ERROR("Leaf %#x subleaf %#x is not compatible", err.leaf, err.subleaf);
>>> +    if ( err.msr != -1 )
>>> +        ERROR("MSR index %#x is not compatible", err.msr);
>>
>> ... these checks to have a chance of actually triggering? (I'm also
>> not certain -1 is a good indicator, but I guess we have been using it
>> elsewhere as well.)
> 
> Well, this is strictly the error path, at which point I would expect
> err to be properly set by x86_cpu_policies_are_compatible. I can
> however initialize err for safety here.

Aiui in the error case one of the two, but not both fields would
be set. Without initializer you'd likely find both of them != -1,
though.

Jan

