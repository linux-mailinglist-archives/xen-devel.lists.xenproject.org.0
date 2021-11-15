Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA6E450717
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 15:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225956.390331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmd3F-0003eg-4b; Mon, 15 Nov 2021 14:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225956.390331; Mon, 15 Nov 2021 14:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmd3F-0003cE-1h; Mon, 15 Nov 2021 14:33:41 +0000
Received: by outflank-mailman (input) for mailman id 225956;
 Mon, 15 Nov 2021 14:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jrjg=QC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mmd3D-0003c6-Ky
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 14:33:39 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 055a2d14-4621-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 15:33:38 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40254)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mmd3B-000EMV-2B (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 15 Nov 2021 14:33:37 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E26DA1FC17;
 Mon, 15 Nov 2021 14:33:36 +0000 (GMT)
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
X-Inumbo-ID: 055a2d14-4621-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Jane Malalane <jane.malalane@citrix.com>
References: <20211110091935.16906-1-jane.malalane@citrix.com>
 <d1978235-f025-19ac-707c-c2e411a5a005@srcf.net>
 <008467ea-75af-acb5-62af-bd1db03ccc68@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo
 status
Message-ID: <790bf907-8c6e-b8cc-6832-b8fe21af536b@srcf.net>
Date: Mon, 15 Nov 2021 14:33:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <008467ea-75af-acb5-62af-bd1db03ccc68@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 15/11/2021 10:53, Jan Beulich wrote:
> On 12.11.2021 19:51, Andrew Cooper wrote:
>> On 10/11/2021 09:19, Jane Malalane wrote:
>>> Before, user would change turbo status but this had no effect: boolea=
n
>>> was set but policy wasn't reevaluated.  Policy must be reevaluated so=

>>> that CPU frequency is chosen according to the turbo status and the
>>> current governor.
>>>
>>> Therefore, add __cpufreq_governor() in cpufreq_update_turbo().
>>>
>>> Reported-by: <edvin.torok@citrix.com>
>>> Signed-off-by: <jane.malalane@citrix.com>
>>> ---
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Ian Jackson <iwj@xenproject.org>
>>> ---
>>>
>>> Release rationale:
>>> Not taking this patch means that turbo status is misleading.
>>>
>>> Taking this patch is low-risk as it only uses a function that already=

>>> exists and is already used for setting the chosen scaling governor.
>>> Essentially, this change is equivalent to running 'xenpm
>>> en/disable-turbo-mode' and, subsequently, running 'xenpm
>>> set-scaling-governor <current governor>'.
>>> ---
>>>  xen/drivers/cpufreq/utility.c | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/util=
ity.c
>>> index b93895d4dd..5f200ff3ee 100644
>>> --- a/xen/drivers/cpufreq/utility.c
>>> +++ b/xen/drivers/cpufreq/utility.c
>>> @@ -417,10 +417,14 @@ int cpufreq_update_turbo(int cpuid, int new_sta=
te)
>>>      {
>>>          ret =3D cpufreq_driver.update(cpuid, policy);
>>>          if (ret)
>>> +        {
>>>              policy->turbo =3D curr_state;
>>> +            return ret;
>>> +        }
>>>      }
>>> =20
>>> -    return ret;
>>> +    /* Reevaluate current CPU policy. */
>>> +    return __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);
>>>  }
>> So, having looked through the manual, what the cpufreq_driver does for=

>> turbo on Intel is bogus according to the SDM.
>>
>> There is a non-architectrual dance with IA32_MISC_ENABLE bit 38 (per
>> package) for firmware to configure turbo, but it manifests as another
>> dynamic CPUID bit (which I think we handle correctly).=C2=A0 It has th=
e same
>> semantics as XD_DISABLE and CPUID_LIMIT so we might want to consider
>> adding it to the set of bits we clear during boot.
> This is quite confusing in the docs - at least one of the tables calls
> the bit "IDA Disable", while other entries at least also refer to the
> effect of disabling IDA. I'm afraid I have trouble connecting turbo
> mode and IDA disabling, unless both are two different names of the
> same thing. Maybe they really are, except that SDM vol 2 uses yet
> another slightly different term for CPUID[6].EAX[1]: "Intel Turbo Boost=

> Technology".

SDM Vol3 14.3 uses IDA and turbo interchangeably in some cases.=C2=A0 It
reads as if IDA is the general technology name, and turbo is a sub-mode
for "doing it automatically without software involvement".

On CPUs which support IDA, the CPUID bit is !MISC_ENABLE[38], with
further adds to the confusion of which is which.

>> However, the correct way to turn off turbo is to set
>> IA32_PERF_CTL.TURBO_DISENGAGE bit, which is per logical processor.=C2=A0=
 As
>> such, it *should* behave far more like the AMD CPB path.
> I'm afraid public documentation has no mention of a bit of this name.
> Considering the above I wonder whether you mean "IDA engage" (bit 32),
> albeit this doesn't seem very likely when you're taking about a
> "disengage" bit.

It is that bit.=C2=A0 Despite the name given in Vol4 Table 2-12, it is "s=
et
to disable".

Vol3 Figure 14-2 explicitly calls it the "IDA/Turbo disengage" bit and
the surrounding text makes it clear that it is disable bit, not an
enable bit.=C2=A0 Also, that's how the Linux intel_pstate driver uses it.=


>  If it is, we'd still need to cope with it being
> unavailable: While as per the doc it exists from Merom onwards, i.e.
> just far enough back for all 64-bit capable processors to be covered,
> at least there it is attributed "Mobile only".

Honestly, the number of errors in those tables are alarming.=C2=A0 The MS=
R is
has been around longer than turbo, and I'm told that the interface has
never changed since its introduction.

Looking across Linux, there's a mess too.

acpi-cpufreq and energy_perf_policy use the MISC_ENABLE bit (which is
package wide)
intel_ips driver uses PERF_CTL (which is logical processor)
intel_pstate uses MISC_ENABLE || max_pstate =3D=3D turbo_pstate

I'm certain I've seen "one pstate being special" WRT turbo before, but I
can't locate anything about this in the SDM, which possibly means it is
model specific.

~Andrew


