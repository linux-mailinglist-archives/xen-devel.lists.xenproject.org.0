Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB90349E7F3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 17:46:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261646.453206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7uk-00013q-CG; Thu, 27 Jan 2022 16:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261646.453206; Thu, 27 Jan 2022 16:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7uk-00010q-88; Thu, 27 Jan 2022 16:46:26 +0000
Received: by outflank-mailman (input) for mailman id 261646;
 Thu, 27 Jan 2022 16:46:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lCdZ=SL=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nD7uj-00010k-NP
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 16:46:25 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a87ad9cc-7f90-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 17:46:24 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:51318)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nD7uf-0002XG-ij (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 27 Jan 2022 16:46:21 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 9BA0E1FBE5;
 Thu, 27 Jan 2022 16:46:21 +0000 (GMT)
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
X-Inumbo-ID: a87ad9cc-7f90-11ec-8eb8-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <40e4f34a-9124-1312-02ab-1c7e457aa1cc@srcf.net>
Date: Thu, 27 Jan 2022 16:46:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220127160940.19469-1-andrew.cooper3@citrix.com>
 <20220127160940.19469-2-andrew.cooper3@citrix.com>
 <8de571a4-0c66-cda5-bec6-60b3fc229f95@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/3] x86/cpuid: Disentangle logic for new feature leaves
In-Reply-To: <8de571a4-0c66-cda5-bec6-60b3fc229f95@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/01/2022 16:39, Jan Beulich wrote:
> On 27.01.2022 17:09, Andrew Cooper wrote:
>> Adding a new feature leaf is a reasonable amount of boilerplate and for the
>> patch to build, at least one feature from the new leaf needs defining.  This
>> typically causes two non-trivial changes to be merged together.
>>
>> First, have gen-cpuid.py write out some extra placeholder defines:
>>
>>   #define CPUID_BITFIELD_11 bool :1, :1, lfence_dispatch:1, ...
>>   #define CPUID_BITFIELD_12 uint32_t :32 /* placeholder */
>>   #define CPUID_BITFIELD_13 uint32_t :32 /* placeholder */
>>   #define CPUID_BITFIELD_14 uint32_t :32 /* placeholder */
>>   #define CPUID_BITFIELD_15 uint32_t :32 /* placeholder */
>>
>> This allows DECL_BITFIELD() to be added to struct cpuid_policy without
>> requiring a XEN_CPUFEATURE() declared for the leaf.  The choice of 4 is
>> arbitrary, and allows us to add more than one leaf at a time if necessary.
>>
>> Second, rework generic_identify() to not use feature leaf names.
>>
>> The choice of deriving the index from a feature was to avoid mismatches, but
>> its correctness depends on bugs like c/s 249e0f1d8f20 ("x86/cpuid: Fix
>> TSXLDTRK definition") not happening.
>>
>> Switch to using FEATURESET_* just like the policy/featureset helpers.  This
>> breaks the cognitive complexity of needing to know which leaf a specifically
>> named feature should reside in, and is shorter to write.  It is also far
>> easier to identify as correct at a glance, given the correlation with the
>> CPUID leaf being read.
>>
>> In addition, tidy up some other bits of generic_identify()
>>  * Drop leading zeros from leaf numbers.
>>  * Don't use a locked update for X86_FEATURE_APERFMPERF.
>>  * Rework extended_cpuid_level calculation to avoid setting it twice.
>>  * Use "leaf >= $N" consistently so $N matches with the CPUID input.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> I will admit that I'm not sure yet whether I will want to break up the
> KeyLocker patch just like you did with the PPIN one.
>
> The one thing that worries me some that there's still the unvalidated
> connection between FEATURESET_* and the numbers used in the public
> cpufeatureset.h. But I have no good idea (yet) for a build-time check.

I was also struggling with that.  One thing I considered was having some
semantic structure to

/* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */

and have FEATURESET_* written automatically too, but I can't think of a
nice way of organising this right now.

~Andrew

