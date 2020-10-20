Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C569293561
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 09:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8936.24063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUldV-0001nK-Pv; Tue, 20 Oct 2020 07:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8936.24063; Tue, 20 Oct 2020 07:00:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUldV-0001mv-Mg; Tue, 20 Oct 2020 07:00:45 +0000
Received: by outflank-mailman (input) for mailman id 8936;
 Tue, 20 Oct 2020 07:00:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUldU-0001ml-5a
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 07:00:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59e9d0be-5e06-412d-a360-6b869e02bd11;
 Tue, 20 Oct 2020 07:00:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E8ECACB8;
 Tue, 20 Oct 2020 07:00:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUldU-0001ml-5a
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 07:00:44 +0000
X-Inumbo-ID: 59e9d0be-5e06-412d-a360-6b869e02bd11
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 59e9d0be-5e06-412d-a360-6b869e02bd11;
	Tue, 20 Oct 2020 07:00:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603177242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/tP+QNMkjjbjZ0T80Qe0PFK/FrbD6gO8SanRBnsWT0=;
	b=IlUmwqUzSmgLr8WKmva3Rz/XO0oKPt0Fe+QdiZPqLNZtT2P4/nYHXLuN/mz+L2Pvsc3G/M
	3uz7JEoGfkL4cxJacamQmdYexsbGKMtlgSZROos1XKztSivzxys0FgbdA0cmIOJm+eG9CQ
	vo287Mhj+JuEQuUV4VkckwyPn1rUBQQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1E8ECACB8;
	Tue, 20 Oct 2020 07:00:42 +0000 (UTC)
Subject: Re: [PATCH] SVM: avoid VMSAVE in ctxt-switch-to
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a01862b8-6e16-5ddc-7f48-2d3bed2f34b6@suse.com>
 <9d0cae4e-f849-f2a3-4261-d3efb977deeb@citrix.com>
 <b3b581fc-b1c9-cdc2-add6-900a4305623a@suse.com>
 <6af1bbb6-d717-affa-6409-2b983e48ed30@citrix.com>
 <59f3e399-8676-bb44-ec85-500583f97b2f@suse.com>
 <23d02e3b-7dac-ceb8-ebdd-3b77f264d6b4@citrix.com>
 <a5e30124-c1aa-e13f-cb09-8402b85209eb@suse.com>
 <e8ee8c84-f949-c882-07a6-58079987a308@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <746db5e1-f78f-2446-c877-4abfa4ba8f39@suse.com>
Date: Tue, 20 Oct 2020 09:00:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <e8ee8c84-f949-c882-07a6-58079987a308@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.10.2020 17:52, Andrew Cooper wrote:
> On 19/10/2020 16:47, Jan Beulich wrote:
>> On 19.10.2020 17:22, Andrew Cooper wrote:
>>> On 19/10/2020 16:02, Jan Beulich wrote:
>>>> On 19.10.2020 16:30, Andrew Cooper wrote:
>>>>> On 19/10/2020 15:21, Jan Beulich wrote:
>>>>>> On 19.10.2020 16:10, Andrew Cooper wrote:
>>>>>>> On 19/10/2020 14:40, Jan Beulich wrote:
>>>>>>>> Of the state saved by the insn and reloaded by the corresponding VMLOAD
>>>>>>>> - TR, syscall, and sysenter state are invariant while having Xen's state
>>>>>>>>   loaded,
>>>>>>>> - FS, GS, and LDTR are not used by Xen and get suitably set in PV
>>>>>>>>   context switch code.
>>>>>>> I think it would be helpful to state that Xen's state is suitably cached
>>>>>>> in _svm_cpu_up(), as this does now introduce an ordering dependency
>>>>>>> during boot.
>>>>>> I've added a sentence.
>>>>>>
>>>>>>> Is it possibly worth putting an assert checking the TR selector?  That
>>>>>>> ought to be good enough to catch stray init reordering problems.
>>>>>> How would checking just the TR selector help? If other pieces of TR
>>>>>> or syscall/sysenter were out of sync, we'd be hosed, too.
>>>>> They're far less likely to move relative to tr, than everything relative
>>>>> to hvm_up().
>>>>>
>>>>>> I'm also not sure what exactly you mean to do for such an assertion:
>>>>>> Merely check the host VMCB field against TSS_SELECTOR, or do an
>>>>>> actual STR to be closer to what the VMSAVE actually did?
>>>>> ASSERT(str() == TSS_SELECTOR);
>>>> Oh, that's odd. How would this help with the VMCB?
>>> It wont.
>>>
>>> We're not checking the behaviour of the VMSAVE instruction.  We just
>>> want to sanity check that %tr is already configured.
>> TR not already being configured is out of question in a function
>> involved in context switching, don't you think? I thought you're
>> worried about the VMCB not being set up correctly? Or are you in
>> the end asking for the suggested assertion to go into
>> _svm_cpu_up(), yet I didn't understand it that way?
> 
> I meant in _svm_cpu_up().  It is only at at __init time where the new
> implicit dependency is created.

Okay, so just a misunderstanding on my part. I've done as you've
suggested, but I'd like to note that load_system_tables() runs
(often far) earlier than percpu_traps_init(), and hence ordering
issues with the latter are more likely. In fact the most worrying
case is its use by reinit_bsp_stack(), which is not a problem
only because the only relevant stack relative adjustment done is
the writing of SYSENTER_ESP, which gets skipped for AMD.

Jan

