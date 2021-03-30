Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4E534E5AA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 12:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103399.197295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRBrl-0005vb-Qf; Tue, 30 Mar 2021 10:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103399.197295; Tue, 30 Mar 2021 10:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRBrl-0005vC-NB; Tue, 30 Mar 2021 10:44:57 +0000
Received: by outflank-mailman (input) for mailman id 103399;
 Tue, 30 Mar 2021 10:44:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRBrj-0005v1-Cv
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 10:44:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 061cf2be-bc8f-4366-9fc3-9cbb0e867365;
 Tue, 30 Mar 2021 10:44:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC92CB1F3;
 Tue, 30 Mar 2021 10:44:53 +0000 (UTC)
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
X-Inumbo-ID: 061cf2be-bc8f-4366-9fc3-9cbb0e867365
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617101093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whe1fhuYPh1182KWoH3Jlw1XXEYHKqBKA0RX2F3r50c=;
	b=RQVU/OPNFikvZpd59w5tYWI0oFI7JtRCub2Kga1xfgdXJKTGLbhbt/zQz9C3peSmv9tHrk
	iT5krivo9RjY92Kt3PwJz3K1vT47w7XeuISmYmyNc2/e830ZNZqT3/OAI6Kp0F28P8zdKQ
	QIQmDvkmCCC8EqLTpNxyYtiX2srXi1k=
Subject: Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20210324172608.302316-1-george.dunlap@citrix.com>
 <f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
 <FB9CBC51-5793-41DD-A331-5274E6A82AF4@citrix.com>
 <23461afc-c0e0-eb33-9ed3-52f050b6aef0@suse.com>
 <27ecde00-f0aa-b701-6928-5480ed805064@citrix.com>
 <2A1FCD39-D0C0-468D-A977-2FBF7126FDE6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d7ce867-091a-f18f-f0c7-5e71da15a2ba@suse.com>
Date: Tue, 30 Mar 2021 12:44:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <2A1FCD39-D0C0-468D-A977-2FBF7126FDE6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.03.2021 11:56, George Dunlap wrote:
> 
> 
>> On Mar 29, 2021, at 6:26 PM, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 29/03/2021 17:23, Jan Beulich wrote:
>>> On 29.03.2021 18:12, George Dunlap wrote:
>>>>> On Mar 25, 2021, at 7:08 AM, Jan Beulich <JBeulich@suse.com> wrote:
>>>>> On 24.03.2021 18:26, George Dunlap wrote:
>>>>>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>>>>>> ---
>>>>>> Missed one from my list when creating the other series
>>>>>>
>>>>>> CC: Ian Jackson <ian.jackson@citrix.com>
>>>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>>>> CC: Roger Pau Monne <roger.pau@citrix.com>
>>>>>> ---
>>>>>> CHANGELOG.md | 1 +
>>>>>> 1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>>>> index 15a22d6bde..49832ae017 100644
>>>>>> --- a/CHANGELOG.md
>>>>>> +++ b/CHANGELOG.md
>>>>>> @@ -18,6 +18,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>>> - x86_emulate: Expanded testing for several instruction classes
>>>>>> - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
>>>>>> - CI loop: Add dom0less aarch64 smoke test
>>>>>> + - Factored out HVM-specific shadow code, allowing PV shim to be slimmer
>>>>> But shadow code doesn't get included by default in shim-exclusive
>>>>> builds (and others are unlikely to disable HVM).
>>>> Can you propose some better text please?
>>> Does this need mentioning here in the first place?
>>
>> I would recommend not.
>>
>> We've been doing incremental improvements for the shim for several
>> releases now, and in this case, we're literally talking a few kb of
>> code.  As we already align to 2M boundaries for superpage reasons, there
>> almost certainly isn't actually a reduction in runtime size.
> 
> I don’t understand why the two of you are downplaying your work so much.  Yes, these are all only incremental improvements; but they are improvements; and the cumulative effect of loads of incremental improvements can be significant.  Communicating to people just what the nature of all these incremental improvements are is important.
> 
> I mean, look at the release notes for Go 1.15 [1].  It includes things like this:
> 
> "JSEscape now consistently uses Unicode escapes (\u00XX), which are compatible with JSON."
> 
> "go test -v now groups output by test name, rather than printing the test name on each line."
> 
> Those sound far more trivial than “Even more shadow code has been moved to an HVM-specific file”.
> 
> If the approach is going to be “SUPER IMPORTANT SPECIAL STUFF ONLY", I’d recommend removing CHANGELOG.md.  Having an official list that says, “Well, really, we only did 2 things this release” is going to be actively harmful.  

I don't think it needs to be "super important" only, but it ought to
be at least user visible / user recognizable imo.

Jan

