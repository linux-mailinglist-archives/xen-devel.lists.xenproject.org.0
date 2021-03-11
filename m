Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F99336D5E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 08:55:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96356.182196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGAP-0003Wv-D9; Thu, 11 Mar 2021 07:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96356.182196; Thu, 11 Mar 2021 07:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGAP-0003WW-9n; Thu, 11 Mar 2021 07:55:33 +0000
Received: by outflank-mailman (input) for mailman id 96356;
 Thu, 11 Mar 2021 07:55:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKGAN-0003WR-Fh
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 07:55:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38352f9d-8836-4719-80b8-78725b7ae549;
 Thu, 11 Mar 2021 07:55:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2CC2AB8C;
 Thu, 11 Mar 2021 07:55:29 +0000 (UTC)
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
X-Inumbo-ID: 38352f9d-8836-4719-80b8-78725b7ae549
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615449329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=et4tmaBnTTfQBUxIE4EefbfiOHM9veA97Ae8dFGNtNA=;
	b=m8PNqj0UVQ2iXQ+CyXWzHCG+P6xraFy31NROKCaIGnrqUjsk++kJ8B7Y8+FBeHhbntnhLu
	MbIWkzEl16f30B1R7p1Ezc39JgrYzqQrIJ6kiSBfCLu6hr+VLe5nCrYfog0IzxeiJAsSeX
	AyNIdnQRFHOzPfRtYVitIUjeWK/1ibg=
Subject: Re: Remaining MSR wrinkles
To: Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: committers@xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <YEj39oqZA0y/af0c@Air-de-Roger>
 <24649.6523.991714.489131@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <78536b74-2e6e-02ae-6655-d14fd97b3d37@suse.com>
Date: Thu, 11 Mar 2021 08:55:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24649.6523.991714.489131@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.03.2021 20:09, Ian Jackson wrote:
> (I bounced Roger's original mail to xen-devel.  I hope it made it...)
> 
> Roger Pau Monné writes ("Remaining MSR wrinkles"):
>> 1. MSR behavior for PV guests without a #GP handler set: PV Linux versions <
>>    4.14 will use rdmsr_safe (and likely wrmsr_safe?) without having a #GP
>>    handler setup, which results in a crash. This bug was hidden in previous
>>    Xen releases by allowing unlimited read access to the MSR space.

I've not observed problematic wrmsr_safe() so far.

>>    Jan has posted several proposals to address this:
>>
>>    https://lore.kernel.org/xen-devel/7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com/
>>    https://lore.kernel.org/xen-devel/d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com/
>>
>>    Which all rely on the fact that for PV guests Xen knows whether there's a
>>    #GP handler setup and can hence prevent injection of a #GP fault if no
>>    handler is present.
>>
>>    Andrew opinion is that we should instead try to figure out which MSRs the
>>    buggy Linux versions try to access and special case them. Andrew also raised
>>    the point that continue running with a 'fake' (ie: 0) MSR value might be
>>    worse than crashing.
>>
>>    Part of the discussion has also happened here:
>>
>>    https://lore.kernel.org/xen-devel/4da62f0b-8a08-dd84-2040-fd55d74fd85a@citrix.com/
>>
>>    Look for the last quote.
>>
>>    Another option is to document that PV Linux < 4.14 will require msr_relaxed=1
>>    in order to run. That as Jan pointed out will also imply PV Linux to run with
>>    a faked (0) MSR value instead of crashing.
> 
>> For 1. I do agree with Jan than this workaround is likely the best option we
>> have, sort of resorting to request enabling msr_relaxed for all Linux PV guests
>> < 4.14. Whether we want to limit this workaround to the read side only I'm not
>> fully convinced. There's something nice about having symmetry in the read and
>> write paths, but if all the calls we have identified are rdmsr only I prefer to
>> leave the write path unaltered and request users to use msr_relaxed if write
>> issues are found later.

Especially if Andrew's ambiguous objection was against the write side
only, I think I'd prefer to go with this latter variant. Considering
that dealing with the read side alone is sufficient to address the
observed issue, I'm even inclined to prefer this irrespective of that
constraint.

> Thanks.  I find your explanation and arguments convincing.  I have
> read what Andy says in that link and I find that less convincing.  In
> particular "I don't think we should legitimise buggy PV behaviour" is
> not entirely consistent with our previous approach to
> bug-compatibility and support for old guests.
> 
> Accordingly, (with committer tie-breaker hat on) I would prefer to
> apply the patches from Jan.  I don't have an opinion about the read vs
> write question, and will probably be happy with whatever you and Jan
> can agree on.
> 
> I don't think I Release-Acked those patches yet so, for those two,
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

You didn't, indeed, but "those two" is slightly confusing, the two
links Roger did provide are just different versions of the same
patch. Hence I'd like to double check that it is exactly this one
patch of mine (of which I need to send another version, at least
to include Roger's requested documentation of the behavior, and
possibly also the write side equivalent - still waiting for Andrew
to come back and clarify the scope of his objection).

>> 2. RAPL_POWER_LIMIT: handle the MSR explicitly to make Solaris happy.
>>    Alternatively we can list in the release notes that Solaris guests require
>>    msr_relaxed=1. Andrew is working on a patch for this.
> 
> I would prefer to handle the MSR explicitly, for the same
> compatibility reason as above.

The question is here - we aren't sure yet that this is the only
one, are we? Andrew suspects if this one MSR gets accessed this
way, then likely others will be, too. Boris, can you tell for sure
either way?

Also, Boris - any chance you could give your Tested-by for Roger's
patch? It's otherwise ready to go in, but I'd prefer to commit it
knowing that you've tested this hopefully final version. I'm sorry
for the recurring requests to test this workaround.

>> 3. MSR_K8_HWCR: Linux will complain about a missing bit (TscFreqSel). Jan
>>    posted a patch to handle the MSR and unconditionally set the bit:
>>
>>    https://lore.kernel.org/xen-devel/c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com/
>>
>>    There are concerns from Andrew about missing bits in ACPI tables and Pstate
>>    MSRs if this bit is reported as set.
> 
>> For 3. I think I at least need more details about the relation with TscFreqSel
>> and ACPI or other MSRs, and I haven't been able to find it on the PPRs I
>> looked.
> 
> I don't understsnd the implications here.  Jan says that Linux has
> been warning about this, but is that the only symptom of the current
> state of affairs ?

Yes. It claiming a firmware bug when running under Xen, but not when
running natively is likely to cause support calls.

> Jan writes
> 
>  The main risk with making the read not fault here is that guests
>  might imply [sic, "infer" intended] they can also write this MSR then.
> 
> How would that matter, in practice ?  The guest would try to write
> the KSR and then ... ?

... would crash. I should say though that with increasing awareness of
potentially running virtualized, kernels have become more careful in
this regard. (I was about to say "with implications like this one, but
since you say "imply" was wrong, "implications" would likely be as well.
What would the correct noun here be then? My dictionary has "inference",
but this feels a little odd, too much like misspelled "interference".)

Jan

