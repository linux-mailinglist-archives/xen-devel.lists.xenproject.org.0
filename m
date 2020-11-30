Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FA22C8398
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 12:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41055.74153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjhpW-0003lb-Jk; Mon, 30 Nov 2020 11:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41055.74153; Mon, 30 Nov 2020 11:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjhpW-0003lF-GT; Mon, 30 Nov 2020 11:58:54 +0000
Received: by outflank-mailman (input) for mailman id 41055;
 Mon, 30 Nov 2020 11:58:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj5U=FE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kjhpV-0003lA-P1
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 11:58:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09dd7da0-a390-4de8-8b81-374f416e528a;
 Mon, 30 Nov 2020 11:58:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20CFFABD2;
 Mon, 30 Nov 2020 11:58:51 +0000 (UTC)
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
X-Inumbo-ID: 09dd7da0-a390-4de8-8b81-374f416e528a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606737531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5byG2FT0x2IRFALO4a+A1nUQJUqRrfL6T+ypiFVIAWo=;
	b=GqX3nQ+oQWQ1vY227YD6c4LMoJwwTmqxgyR18vJx85L6bzH9JMvJh58z4hTVPY4UB80d9k
	ALMjlLlw2QRR7kVNH+scl81k7Xh+tZXSD07E9qmrtbIsrIUtRHxb1lr39PF/Q1E6CDG93z
	tXRLe7jb8wyt5Emdy/hoiXj7uF1syHA=
Subject: Re: [PATCH v4] IOMMU: make DMA containment of quarantined devices
 optional
To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Kevin Tian' <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <c78e09fa-606c-c6c4-e9db-b57cb50ee5e2@suse.com>
 <013601d6c705$f09fd9a0$d1df8ce0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <221431d9-2435-f106-af46-0641f5a4e8f8@suse.com>
Date: Mon, 30 Nov 2020 12:58:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <013601d6c705$f09fd9a0$d1df8ce0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:45, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 27 November 2020 16:46
>>
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1278,7 +1278,7 @@ detection of systems known to misbehave
>>  > Default: `new` unless directed-EOI is supported
>>
>>  ### iommu
>> -    = List of [ <bool>, verbose, debug, force, required, quarantine,
>> +    = List of [ <bool>, verbose, debug, force, required, quarantine[=scratch-page],
>>                  sharept, intremap, intpost, crash-disable,
>>                  snoop, qinval, igfx, amd-iommu-perdev-intremap,
>>                  dom0-{passthrough,strict} ]
>> @@ -1316,11 +1316,32 @@ boolean (e.g. `iommu=no`) can override t
>>      will prevent Xen from booting if IOMMUs aren't discovered and enabled
>>      successfully.
>>
>> -*   The `quarantine` boolean can be used to control Xen's behavior when
>> -    de-assigning devices from guests.  If enabled (the default), Xen always
>> +*   The `quarantine` option can be used to control Xen's behavior when
>> +    de-assigning devices from guests.
>> +
>> +    When a PCI device is assigned to an untrusted domain, it is possible
>> +    for that domain to program the device to DMA to an arbitrary address.
>> +    The IOMMU is used to protect the host from malicious DMA by making
>> +    sure that the device addresses can only target memory assigned to the
>> +    guest.  However, when the guest domain is torn down, assigning the
>> +    device back to the hardware domain would allow any in-flight DMA to
>> +    potentially target critical host data.  To avoid this, quarantining
>> +    should be enabled.  Quarantining can be done in two ways: In its basic
>> +    form, all in-flight DMA will simply be forced to encounter IOMMU
>> +    faults.  Since there are systems where doing so can cause host lockup,
>> +    an alternative form is available where writes to memory will be made
>> +    fault, but reads will be directed to a dummy page.  The implication
>> +    here is that such reads will go unnoticed, i.e. an admin may not
>> +    become aware of the underlying problem.
>> +
>> +    Therefore, if this option is set to true (the default), Xen always
>>      quarantines such devices; they must be explicitly assigned back to Dom0
>> -    before they can be used there again.  If disabled, Xen will only
>> -    quarantine devices the toolstack hass arranged for getting quarantined.
>> +    before they can be used there again.  If set to "scratch-page", still
>> +    active DMA reads will additionally be directed to a "scratch" page.  If
> 
> There's inconsistency of terms here. We should choose either 'dummy page'
> or 'scratch page' (and my vote goes for the latter).

Oh, that wasn't intentional. I've replaced all "dummy" now.

> Also, rather than true or false, shouldn't we have 'off', 'basic', and
> 'scratch-page'?

I didn't want to break (or needlessly extend) the present boolean nature
of the option. Hence I only added "scratch-page". I wouldn't want to add
"basic" as an alias of "true", but if you think we really need this, then
I surely could do so. As to "off" vs "false" - both are permitted anyway
by the parsing functions. And to me (both as a programmer and as someone
who had been studying maths long ago) something that's boolean goes
rather with true/false than on/off; I can certainly change that wording
if you deem that more appropriate / helpful for the target audience.

Jan

