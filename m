Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254034A989E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 12:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265436.458810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFxCJ-000068-Ou; Fri, 04 Feb 2022 11:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265436.458810; Fri, 04 Feb 2022 11:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFxCJ-0008Ud-Lk; Fri, 04 Feb 2022 11:56:15 +0000
Received: by outflank-mailman (input) for mailman id 265436;
 Fri, 04 Feb 2022 11:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=98b4=ST=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nFxCH-0008UX-IO
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 11:56:13 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7157f406-85b1-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 12:56:10 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:53438)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nFxC7-0002Pt-0o (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 04 Feb 2022 11:56:03 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E88471FB21;
 Fri,  4 Feb 2022 11:56:02 +0000 (GMT)
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
X-Inumbo-ID: 7157f406-85b1-11ec-8eb8-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5d721986-3298-51b1-22f9-58ecf8cb32c2@srcf.net>
Date: Fri, 4 Feb 2022 11:56:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
References: <20220203133829.7913-1-andrew.cooper3@citrix.com>
 <c0d82900-64d1-fe16-9283-deb7c324ff8a@xen.org>
 <ad7467d2-1cae-c8ea-1217-69f0924044d4@citrix.com>
 <348f062c-9aed-0275-f0ad-87a0eff8e986@suse.com>
 <8a28b63b-a5f6-db0f-3108-646475912abd@citrix.com>
 <c20b2017-7313-41bd-c854-48029a5df206@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] xen: Modify domain_crash() to take a print string
In-Reply-To: <c20b2017-7313-41bd-c854-48029a5df206@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/02/2022 15:06, Jan Beulich wrote:
> On 03.02.2022 15:41, Andrew Cooper wrote:
>> On 03/02/2022 14:19, Jan Beulich wrote:
>>> On 03.02.2022 15:11, Andrew Cooper wrote:
>>>> On 03/02/2022 13:48, Julien Grall wrote:
>>>>> On 03/02/2022 13:38, Andrew Cooper wrote:
>>>>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>>>>> index 37f78cc4c4c9..38b390d20371 100644
>>>>>> --- a/xen/include/xen/sched.h
>>>>>> +++ b/xen/include/xen/sched.h
>>>>>> @@ -736,10 +736,15 @@ void vcpu_end_shutdown_deferral(struct vcpu *v);
>>>>>>    * from any processor.
>>>>>>    */
>>>>>>   void __domain_crash(struct domain *d);
>>>>>> -#define domain_crash(d) do
>>>>>> {                                              \
>>>>>> -    printk("domain_crash called from %s:%d\n", __FILE__,
>>>>>> __LINE__);       \
>>>>>> -   
>>>>>> __domain_crash(d);                                                    \
>>>>>> -} while (0)
>>>>>> +#define domain_crash(d, ...)                            \
>>>>>> +    do {                                                \
>>>>>> +        if ( count_args(__VA_ARGS__) == 0 )             \
>>>>>> +            printk("domain_crash called from %s:%d\n",  \
>>>>>> +                   __FILE__, __LINE__);                 \
>>>>> I find a bit odd that here you are using a normal printk
>>>> That's unmodified from before.  Only reformatted.
>>>>
>>>>> but...
>>>>>
>>>>>
>>>>>> +        else                                            \
>>>>>> +            printk(XENLOG_G_ERR __VA_ARGS__);           \
>>>>> here it is XENLOG_G_ERR. In fact, isn't it ratelimited? If so,
>>>>> wouldn't it be better to only use XENLOG_ERR so they can always be
>>>>> seen? (A domain shouldn't be able to abuse it).
>>>> Perhaps.  I suppose it is more important information than pretty much
>>>> anything else about the guest.
>>> Indeed, but then - is this really an error in all cases?
>> Yes.  It is always a fatal event for the VM.
> Which may or may not be Xen's fault. If the guest put itself in a bad
> state, I don't see why we shouldn't consider such just a warning.

Log level is the severity of the action, not who's potentially to blame
for causing the situation.

Furthermore, almost all callers who do emit appropriate diagnostics
before domain_crash() already use ERR.

And, as already pointed out, it doesn't matter.  The line is going out
on the console however you want to try and bikeshed the internals.

>  IOW
> I continue to think a log level, if so wanted, should be supplied by
> the user of the macro.

That undermines the whole purpose of preventing callers from being able
to omit diagnostics.

~Andrew

