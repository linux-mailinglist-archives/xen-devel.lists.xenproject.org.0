Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6406391B58
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 17:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132575.247239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvCQ-0004Cf-KL; Wed, 26 May 2021 15:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132575.247239; Wed, 26 May 2021 15:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvCQ-0004AK-Gv; Wed, 26 May 2021 15:11:58 +0000
Received: by outflank-mailman (input) for mailman id 132575;
 Wed, 26 May 2021 15:11:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llvCP-0004AA-30
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 15:11:57 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52aee2e4-7622-4a7d-945b-85364e833a7c;
 Wed, 26 May 2021 15:11:56 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out2.suse.de (Postfix) with ESMTP id 86A7D1FD2A;
 Wed, 26 May 2021 15:11:55 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 662C511A98;
 Wed, 26 May 2021 15:11:55 +0000 (UTC)
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
X-Inumbo-ID: 52aee2e4-7622-4a7d-945b-85364e833a7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622041915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gTKMvUe9ERASua/BgbH1Bv67rkqrl0Ql9ZSgM5GmWYU=;
	b=fxfwCc+uFdvhjLdOJGm1J4xDJ5gz+ZkeJIUCF9tazpLx2oHiXGTN/hy2S8qpF+QG5WVxvx
	Z7V8zOsq9tJ1Gl1n29Nfxv05M0kVHa0ntZBAtcqZyCoq0XmfpBPOPSC6VtJJ+oDohofMZp
	KrFWknqmnRq1XK1n0LOyPTYSboVB1lY=
Subject: Re: [PATCH 03/13] cpufreq: Export intel_feature_detect
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-4-jandryuk@gmail.com>
 <68c32d6e-8c6f-35da-c9cd-a560d3d6895b@suse.com>
 <CAKf6xpuni2=Ud9hojAn2U_aBEVQHNU7KkR9sG8WM6RMCYOnf7Q@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8525296a-607b-a0b2-94b3-67706764a9c4@suse.com>
Date: Wed, 26 May 2021 17:11:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAKf6xpuni2=Ud9hojAn2U_aBEVQHNU7KkR9sG8WM6RMCYOnf7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.05.2021 16:44, Jason Andryuk wrote:
> On Wed, May 26, 2021 at 9:27 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 03.05.2021 21:28, Jason Andryuk wrote:
>>> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>> @@ -340,7 +340,7 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
>>>      return extract_freq(get_cur_val(cpumask_of(cpu)), data);
>>>  }
>>>
>>> -static void feature_detect(void *info)
>>> +void intel_feature_detect(void *info)
>>>  {
>>>      struct cpufreq_policy *policy = info;
>>
>> ... because of this (requiring the hwp code to stay in sync with
>> possible changes here, without the compiler being able to point
>> out inconsistencies) I'm not overly happy with such a change. Yet
>> I guess this isn't the first case we have in the code base.
> 
> For acpi-cpufreq, this is called by on_selected_cpus(), but hwp calls
> this directly.  You could do something like:
> 
> void intel_feature_detect(struct cpufreq_policy *policy)
> {
>     /* current feature_detect() */
> }
> 
> static void feature_detect(void *info)
>     struct cpufreq_policy *policy = info;
> 
>     intel_feature_detect(policy);
> }
> 
> Would you prefer that?

Would feel less fragile, yes. And no need for the intermediate "policy"
variable, afaics.

Jan

