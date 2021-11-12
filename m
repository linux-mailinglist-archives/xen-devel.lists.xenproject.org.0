Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2C044E6D0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 13:55:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225229.388957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlW4q-0003rG-A1; Fri, 12 Nov 2021 12:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225229.388957; Fri, 12 Nov 2021 12:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlW4q-0003oy-67; Fri, 12 Nov 2021 12:54:44 +0000
Received: by outflank-mailman (input) for mailman id 225229;
 Fri, 12 Nov 2021 12:54:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=an8x=P7=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mlW4p-0003os-CJ
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:54:43 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3339f4f-43b7-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 13:54:41 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:46364)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mlW4m-000b8y-h3 (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 12 Nov 2021 12:54:40 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id EE2831FBF1;
 Fri, 12 Nov 2021 12:54:39 +0000 (GMT)
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
X-Inumbo-ID: b3339f4f-43b7-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH for-4.16] x86/cpuid: prevent shrinking migrated policies
 max leaves
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20211110174059.64633-1-roger.pau@citrix.com>
 <519775a1-ba90-c5c5-82c1-abcd8c4ebb01@srcf.net>
 <9cb7444f-b1ab-524d-f94a-ede990b64f9f@suse.com>
 <YY0i48LlRVizS8LQ@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
Message-ID: <60b7fd51-e3eb-b05a-a25d-cbd7b2ae8f96@srcf.net>
Date: Fri, 12 Nov 2021 12:54:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YY0i48LlRVizS8LQ@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 11/11/2021 14:04, Roger Pau Monné wrote:
> On Thu, Nov 11, 2021 at 10:26:29AM +0100, Jan Beulich wrote:
>> On 10.11.2021 19:17, Andrew Cooper wrote:
>>> On 10/11/2021 17:40, Roger Pau Monne wrote:
>>>> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
>>>> index 198892ebdf..3ffd5f683b 100644
>>>> --- a/tools/libs/guest/xg_cpuid_x86.c
>>>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>>>> @@ -638,6 +638,13 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>>>          }
>>>>      }
>>>>  
>>>> +    /*
>>>> +     * Do not try to shrink the policy if restoring, as that could cause
>>>> +     * guest visible changes in the maximum leaf fields.
>>>> +     */
>>>> +    if ( !restore )
>>>> +        x86_cpuid_policy_shrink_max_leaves(p);
>>> Nothing in xc_cpuid_apply_policy() changes any of the max leaves, so
>>> this is dead logic.
>> I guess you mean nothing there does anything which would result in
>> shrinking of the max leaves by calling this function? Yet even if
>> so, isn't the call here to take care of any earlier changes which
>> might have resulted in fully blank tail leaves?
> AFAICT the featureset (optionally) passed in as a parameter could
> result in certain leaves being zeroed and thus allow for the max leaf
> to shrink.
>
> So while xc_cpuid_apply_policy doesn't change the max leaves fields,
> it can potentially zero certain leaves allowing to shrink the reported
> max leaf.

Hmm true, although I don't anticipate this having an effect in practice.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

