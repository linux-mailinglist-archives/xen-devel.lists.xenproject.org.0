Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC4D45DFB5
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 18:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231749.401214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqIXu-0002im-MR; Thu, 25 Nov 2021 17:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231749.401214; Thu, 25 Nov 2021 17:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqIXu-0002g4-JJ; Thu, 25 Nov 2021 17:28:30 +0000
Received: by outflank-mailman (input) for mailman id 231749;
 Thu, 25 Nov 2021 17:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CZwX=QM=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mqIXt-0002fq-Cy
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 17:28:29 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1907fe61-4e15-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 18:28:27 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:42968)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mqIXq-000lXI-08 (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 25 Nov 2021 17:28:26 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id C1E9A1FBF1;
 Thu, 25 Nov 2021 17:28:25 +0000 (GMT)
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
X-Inumbo-ID: 1907fe61-4e15-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <00a83850-0aba-a66c-09ed-81204e8cdb3c@srcf.net>
Date: Thu, 25 Nov 2021 17:28:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
 <00c77026-1b65-c73a-b786-0e0b9d22e994@suse.com>
 <YZ9oxXdnAEXaRtAD@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
In-Reply-To: <YZ9oxXdnAEXaRtAD@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/11/2021 10:43, Roger Pau Monné wrote:
> On Thu, Nov 25, 2021 at 11:25:36AM +0100, Jan Beulich wrote:
>> On 24.11.2021 22:11, Andrew Cooper wrote:
>>> OSSTest has identified a 3rd regression caused by this change.  Migration
>>> between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron 4133)
>>> fails with:
>>>
>>>   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffffffff, msr ffffffff (22 = Invalid argument): Internal error
>>>   xc: error: Restore failed (22 = Invalid argument): Internal error
>>>
>>> which is a safety check to prevent resuming the guest when the CPUID data has
>>> been truncated.  The problem is caused by shrinking of the max policies, which
>>> is an ABI that needs handling compatibly between different versions of Xen.
>>>
>>> Furthermore, shrinking of the default policies also breaks things in some
>>> cases, because certain cpuid= settings in a VM config file which used to have
>>> an effect will now be silently discarded.
>>>
>>> This reverts commit 540d911c2813c3d8f4cdbb3f5672119e5e768a3d, as well as the
>>> partial fix attempt in 81da2b544cbb003a5447c9b14d275746ad22ab37 (which added
>>> one new case where cpuid= settings might not apply correctly) and restores the
>>> same behaviour as Xen 4.15.
>>>
>>> Fixes: 540d911c2813 ("x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents")
>>> Fixes: 81da2b544cbb ("x86/cpuid: prevent shrinking migrated policies max leaves")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> While not strictly needed with Roger having given his already,
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> to signal my (basic) agreement with the course of action taken.
>> Nevertheless I fear this is going to become yet one more case where
>> future action is promised, but things then die out.
> I'm certainly happy to look at newer versions of this patch, but I
> think we should consider doing the shrinking only on the toolstack
> said, and only after all the manipulations on the policy have been
> performed.

Correct.

The max policies cannot be shrunk - they are, by definition, the upper
bounds that we audit against.  (More precisely, they must never end up
lower than an older Xen used to offer on the same configuration, and
must not be lower anything the user may opt in to.)

The default policies can in principle be shrunk, but only if the
toolstack learns to grow max leaf too (which it will need to). 
Nevertheless, actually shrinking the default policies is actively
unhelpful, because it is wasting time doing something which the
toolstack needs to undo later.

The policy for new domains should be shrunk, but only after every other
adjustment is made.  This is one small aspect of teaching the toolstack
to properly understand CPUID (and MSR) policies, and has always been on
the plan.

~Andrew

