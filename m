Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C254D46591E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 23:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236250.409796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msY27-0005n6-9I; Wed, 01 Dec 2021 22:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236250.409796; Wed, 01 Dec 2021 22:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msY27-0005ka-5d; Wed, 01 Dec 2021 22:24:59 +0000
Received: by outflank-mailman (input) for mailman id 236250;
 Wed, 01 Dec 2021 22:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msY25-0005kU-Jn
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 22:24:57 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 827ab8b0-52f5-11ec-b1df-f38ee3fbfdf7;
 Wed, 01 Dec 2021 23:24:56 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50710)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msY1x-000oxz-ib (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 22:24:49 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 84DA91FDDA;
 Wed,  1 Dec 2021 22:24:49 +0000 (GMT)
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
X-Inumbo-ID: 827ab8b0-52f5-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <835c1244-4cd4-19f9-de7b-e3648d0230bd@srcf.net>
Date: Wed, 1 Dec 2021 22:24:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/3] x86/vPMU: invoke <vendor>_vpmu_initialise() through a
 hook as well
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
 <66e64fc5-34f1-7877-42b1-3533136f56ab@suse.com>
 <35e2dab8-e274-839c-23a8-25f4c121cd08@srcf.net>
 <ded8ef9f-9435-1b5e-32a0-1b7e93b15a52@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <ded8ef9f-9435-1b5e-32a0-1b7e93b15a52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2021 08:31, Jan Beulich wrote:
> On 30.11.2021 22:18, Andrew Cooper wrote:
>> On 29/11/2021 09:10, Jan Beulich wrote:
>>> --- a/xen/arch/x86/cpu/vpmu.c
>>> +++ b/xen/arch/x86/cpu/vpmu.c
>>> @@ -480,12 +470,17 @@ static int vpmu_arch_initialise(struct v
>>>          return -EINVAL;
>>>      }
>>>  
>>> -    vpmu->hw_lapic_lvtpc = PMU_APIC_VECTOR | APIC_LVT_MASKED;
>>> -
>>> +    ret = alternative_call(vpmu_ops.initialise, v);
>>>      if ( ret )
>>> +    {
>>>          printk(XENLOG_G_WARNING "VPMU: Initialization failed for %pv\n", v);
>>> +        return ret;
>>> +    }
>>> +
>>> +    vpmu->hw_lapic_lvtpc = PMU_APIC_VECTOR | APIC_LVT_MASKED;
>>> +    vpmu_set(vpmu, VPMU_INITIALIZED);
>> It occurs to me that if, in previous patch, you do:
>>
>>     if ( ret )
>>         printk(XENLOG_G_WARNING "VPMU: Initialization failed for %pv\n", v);
>> +    else
>> +        vpmu_set(vpmu, VPMU_INITIALIZED);
>>
>> then you don't need to undo the adjustments in
>> {svm,vmx}_vpmu_initialise() in this patch.
> I actually had it that way first, until noticing it was wrong. It can
> be done only here because it if only here where the XENPMU_MODE_OFF
> checks move from the vendor functions into here.

Oh ok.  Never mind then.

>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although
>> preferably with the VPMU_INITIALIZED adjustment.
> Thanks; as said, that adjustment can't be done in patch 1 just yet.
> But I did add the missing trailing commas.

Thanks.

~Andrew

