Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8847745DD95
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 16:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231576.400811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGoT-0000So-Da; Thu, 25 Nov 2021 15:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231576.400811; Thu, 25 Nov 2021 15:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGoT-0000R5-A4; Thu, 25 Nov 2021 15:37:29 +0000
Received: by outflank-mailman (input) for mailman id 231576;
 Thu, 25 Nov 2021 15:37:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CZwX=QM=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mqGoS-0000Qz-A3
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 15:37:28 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95f51344-4e05-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 16:37:26 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49578)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mqGoN-000fEK-i2 (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 25 Nov 2021 15:37:23 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 5ED631FF69;
 Thu, 25 Nov 2021 15:37:23 +0000 (GMT)
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
X-Inumbo-ID: 95f51344-4e05-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <75f3e8ba-89bd-9ba0-52f0-1578b3db863b@srcf.net>
Date: Thu, 25 Nov 2021 15:37:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
 <YZ9TmzIbi8QjTAgm@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
In-Reply-To: <YZ9TmzIbi8QjTAgm@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/11/2021 09:12, Roger Pau Monné wrote:
> On Wed, Nov 24, 2021 at 09:11:52PM +0000, Andrew Cooper wrote:
>> OSSTest has identified a 3rd regression caused by this change.  Migration
>> between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron 4133)
>> fails with:
>>
>>   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffffffff, msr ffffffff (22 = Invalid argument): Internal error
>>   xc: error: Restore failed (22 = Invalid argument): Internal error
>>
>> which is a safety check to prevent resuming the guest when the CPUID data has
>> been truncated.  The problem is caused by shrinking of the max policies, which
>> is an ABI that needs handling compatibly between different versions of Xen.
>>
>> Furthermore, shrinking of the default policies also breaks things in some
>> cases, because certain cpuid= settings in a VM config file which used to have
>> an effect will now be silently discarded.
> I don't think they will be silently discarded. xc_cpuid_xend_policy
> will attempt to get the CPUID leaf from the current/host/default
> policies and fail because the leaf couldn't be found.

Hmm yes.  Now I look at the code again, the error handling is plumbed up
fully.

So yes - there will be a rejection now where previously it worked.

> There's an issue with callers of xc_cpuid_apply_policy that pass a
> featureset (which is not used by the upstream tools) as in that case
> the featureset is translated to a CPUID policy without checking that
> the set features are correctly exposed regarding the maximum leaves
> set in CPUID, and thus features could be silently dropped, but as said
> that's not used by the `cpuid=` config file option.

Good catch.  I'd neglected to consider this aspect.

> This possibly needs fixing anyway after the release, in order to
> assert that the bits set in the featureset are correctly exposed given
> the max leaves reported in the policy.
>
> I think the above paragraph should be rewored as:
>
> "Furthermore, shrinking of the default policies also breaks things in
> some cases, because certain cpuid= settings in a VM config file which
> used to work will now be refused. Also external toolstacks that
> attempt to set the CPUID policy from a featureset might now see some
> filled leaves not reachable due to the shrinking done to the default
> domain policy before applying the featureset."
>
>> This reverts commit 540d911c2813c3d8f4cdbb3f5672119e5e768a3d, as well as the
>> partial fix attempt in 81da2b544cbb003a5447c9b14d275746ad22ab37 (which added
>> one new case where cpuid= settings might not apply correctly) and restores the
>> same behaviour as Xen 4.15.
>>
>> Fixes: 540d911c2813 ("x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents")
>> Fixes: 81da2b544cbb ("x86/cpuid: prevent shrinking migrated policies max leaves")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>
> Likely with the paragraph adjusted if agreed.

Ok.

~Andrew

