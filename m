Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAC8451723
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 23:05:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226035.390489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmk6C-0000sa-Rq; Mon, 15 Nov 2021 22:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226035.390489; Mon, 15 Nov 2021 22:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmk6C-0000qk-OG; Mon, 15 Nov 2021 22:05:12 +0000
Received: by outflank-mailman (input) for mailman id 226035;
 Mon, 15 Nov 2021 22:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jrjg=QC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mmk6A-0000qe-VH
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 22:05:10 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 182837e0-4660-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 23:05:09 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:59376)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mmk66-000vBn-8e (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 15 Nov 2021 22:05:06 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 1A2CD1FC18;
 Mon, 15 Nov 2021 22:05:06 +0000 (GMT)
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
X-Inumbo-ID: 182837e0-4660-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Jane Malalane <jane.malalane@citrix.com>
References: <20211110091935.16906-1-jane.malalane@citrix.com>
 <d1978235-f025-19ac-707c-c2e411a5a005@srcf.net>
 <008467ea-75af-acb5-62af-bd1db03ccc68@suse.com>
 <790bf907-8c6e-b8cc-6832-b8fe21af536b@srcf.net>
 <628731e2-fa81-4f75-3806-900e70988f53@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo
 status
Message-ID: <085b8bd9-2714-df0a-862d-00b8b1a230a3@srcf.net>
Date: Mon, 15 Nov 2021 22:05:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <628731e2-fa81-4f75-3806-900e70988f53@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 15/11/2021 16:21, Jan Beulich wrote:
> On 15.11.2021 15:33, Andrew Cooper wrote:
>> On 15/11/2021 10:53, Jan Beulich wrote:
>>> On 12.11.2021 19:51, Andrew Cooper wrote:
>>>> On 10/11/2021 09:19, Jane Malalane wrote:
>>>>> Before, user would change turbo status but this had no effect: bool=
ean
>>>>> was set but policy wasn't reevaluated.  Policy must be reevaluated =
so
>>>>> that CPU frequency is chosen according to the turbo status and the
>>>>> current governor.
>>>>>
>>>>> Therefore, add __cpufreq_governor() in cpufreq_update_turbo().
>>>>>
>>>>> Reported-by: <edvin.torok@citrix.com>
>>>>> Signed-off-by: <jane.malalane@citrix.com>
>>>>> ---
>>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>>> CC: Ian Jackson <iwj@xenproject.org>
>>>>> ---
>>>>>
>>>>> Release rationale:
>>>>> Not taking this patch means that turbo status is misleading.
>>>>>
>>>>> Taking this patch is low-risk as it only uses a function that alrea=
dy
>>>>> exists and is already used for setting the chosen scaling governor.=

>>>>> Essentially, this change is equivalent to running 'xenpm
>>>>> en/disable-turbo-mode' and, subsequently, running 'xenpm
>>>>> set-scaling-governor <current governor>'.
>>>>> ---
>>>>>  xen/drivers/cpufreq/utility.c | 6 +++++-
>>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/ut=
ility.c
>>>>> index b93895d4dd..5f200ff3ee 100644
>>>>> --- a/xen/drivers/cpufreq/utility.c
>>>>> +++ b/xen/drivers/cpufreq/utility.c
>>>>> @@ -417,10 +417,14 @@ int cpufreq_update_turbo(int cpuid, int new_s=
tate)
>>>>>      {
>>>>>          ret =3D cpufreq_driver.update(cpuid, policy);
>>>>>          if (ret)
>>>>> +        {
>>>>>              policy->turbo =3D curr_state;
>>>>> +            return ret;
>>>>> +        }
>>>>>      }
>>>>> =20
>>>>> -    return ret;
>>>>> +    /* Reevaluate current CPU policy. */
>>>>> +    return __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);
>>>>>  }
>>>> So, having looked through the manual, what the cpufreq_driver does f=
or
>>>> turbo on Intel is bogus according to the SDM.
>>>>
>>>> There is a non-architectrual dance with IA32_MISC_ENABLE bit 38 (per=

>>>> package) for firmware to configure turbo, but it manifests as anothe=
r
>>>> dynamic CPUID bit (which I think we handle correctly).=C2=A0 It has =
the same
>>>> semantics as XD_DISABLE and CPUID_LIMIT so we might want to consider=

>>>> adding it to the set of bits we clear during boot.
>>> This is quite confusing in the docs - at least one of the tables call=
s
>>> the bit "IDA Disable", while other entries at least also refer to the=

>>> effect of disabling IDA. I'm afraid I have trouble connecting turbo
>>> mode and IDA disabling, unless both are two different names of the
>>> same thing. Maybe they really are, except that SDM vol 2 uses yet
>>> another slightly different term for CPUID[6].EAX[1]: "Intel Turbo Boo=
st
>>> Technology".
>> SDM Vol3 14.3 uses IDA and turbo interchangeably in some cases.=C2=A0 =
It
>> reads as if IDA is the general technology name, and turbo is a sub-mod=
e
>> for "doing it automatically without software involvement".
>>
>> On CPUs which support IDA, the CPUID bit is !MISC_ENABLE[38], with
>> further adds to the confusion of which is which.
>>
>>>> However, the correct way to turn off turbo is to set
>>>> IA32_PERF_CTL.TURBO_DISENGAGE bit, which is per logical processor.=C2=
=A0 As
>>>> such, it *should* behave far more like the AMD CPB path.
>>> I'm afraid public documentation has no mention of a bit of this name.=

>>> Considering the above I wonder whether you mean "IDA engage" (bit 32)=
,
>>> albeit this doesn't seem very likely when you're taking about a
>>> "disengage" bit.
>> It is that bit.=C2=A0 Despite the name given in Vol4 Table 2-12, it is=
 "set
>> to disable".
>>
>> Vol3 Figure 14-2 explicitly calls it the "IDA/Turbo disengage" bit and=

>> the surrounding text makes it clear that it is disable bit, not an
>> enable bit.=C2=A0 Also, that's how the Linux intel_pstate driver uses =
it.
> Okay, then I agree with the proposal you've made.

I've just done some experimentation on a Intel(R) Xeon(R) E-2288G (CFL-R
based), and both the MISC_ENABLE and PERF_CTL bits have the same effect,
and cut nearly 1GHz off the APERF/MPERF reported frequency on a busy
single core on an otherwise idle system.

I have not checked the effect that PERF_CTL on thread 0 has on other
threads in the package, but the reality is that ~100% of production use
of these controls are for all CPUs at once.=C2=A0 (So much so, that I rea=
lly
think the interface ought to gain a -1 sentential for "all cpus", rather
than forcing userspace to loop over each cpu individually, when Xen can
handle the entire loop in O(1) time.)

~Andrew


