Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4915E450635
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 15:02:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225931.390276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmcYS-0006RT-H8; Mon, 15 Nov 2021 14:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225931.390276; Mon, 15 Nov 2021 14:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmcYS-0006OU-Dy; Mon, 15 Nov 2021 14:01:52 +0000
Received: by outflank-mailman (input) for mailman id 225931;
 Mon, 15 Nov 2021 14:01:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jrjg=QC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mmcYQ-0006OE-FA
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 14:01:50 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9314dd70-461c-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 15:01:48 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40228)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mmcYO-000gWt-0O (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 15 Nov 2021 14:01:48 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 729FF1FC18;
 Mon, 15 Nov 2021 14:01:47 +0000 (GMT)
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
X-Inumbo-ID: 9314dd70-461c-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH for-4.16 3/4] test/tsx: set grant version for created
 domains
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <iwj@xenproject.org>
References: <20211115121741.3719-1-roger.pau@citrix.com>
 <20211115121741.3719-4-roger.pau@citrix.com>
 <f544fcaf-be7b-6c2c-7e9f-7847477739a9@srcf.net>
 <YZJnagbiihYH99DA@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
Message-ID: <b6033d80-c362-4a6d-e6c8-b2d425fda759@srcf.net>
Date: Mon, 15 Nov 2021 14:01:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZJnagbiihYH99DA@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 15/11/2021 13:58, Roger Pau Monné wrote:
> On Mon, Nov 15, 2021 at 12:43:34PM +0000, Andrew Cooper wrote:
>> On 15/11/2021 12:17, Roger Pau Monne wrote:
>>> Set the grant table version for the created domains to use version 1,
>>> as such tests domains don't require the usage of the grant table at
>>> all. A TODO note is added to switch those dummy domains to not have a
>>> grant table at all when possible. Without setting the grant version
>>> the domains for the tests cannot be created.
>>>
>>> Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Cc: Ian Jackson <iwj@xenproject.org>
>>>
>>> This patch only modifies a test, so it should be safe to commit as
>>> it's not going to cause any changes to the hypervisor or the tools.
>>> Worse that could happen is it makes the test even more broken, but
>>> it's already unusable.
>> What do you mean unusable?  Other than this, the test works.
> I mean, it's unusable because I broke it with the gnttab change, and
> that's it's current status unless this patch is applied.
>
>>> ---
>>>  tools/tests/tsx/test-tsx.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
>>> index fab99c135e..f1dcff4c30 100644
>>> --- a/tools/tests/tsx/test-tsx.c
>>> +++ b/tools/tests/tsx/test-tsx.c
>>> @@ -444,6 +444,8 @@ static void test_guests(void)
>>>          struct xen_domctl_createdomain c = {
>>>              .max_vcpus = 1,
>>>              .max_grant_frames = 1,
>>> +            /* TODO: switch to 0 once support for no grant table is added. */
>> I'd avoid these TODOs.  It's test code, so really doesn't matter too much.
> I'm fine with this, when looking at the test code I didn't see any
> reason why gnttab was needed, so I thought it would be a fine use-case
> for opting out to grant table. As you say it's a test case, so it
> doesn't matter much.
>
> Do you want me to repost with the comments removed?

I'm happy to fix on commit, if nothing else needs reposting.

~Andrew

