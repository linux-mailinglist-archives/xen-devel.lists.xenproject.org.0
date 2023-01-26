Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB3467D617
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 21:19:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485201.752243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL8hJ-0005pl-Um; Thu, 26 Jan 2023 20:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485201.752243; Thu, 26 Jan 2023 20:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL8hJ-0005nz-SC; Thu, 26 Jan 2023 20:18:13 +0000
Received: by outflank-mailman (input) for mailman id 485201;
 Thu, 26 Jan 2023 20:18:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4vwE=5X=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pL8hI-0005nt-E2
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 20:18:12 +0000
Received: from ppsw-33.srv.uis.cam.ac.uk (ppsw-33.srv.uis.cam.ac.uk
 [131.111.8.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a63b653-9db6-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 21:18:05 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50998)
 by ppsw-33.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pL8h2-000Fom-SU (Exim 4.96) (return-path <amc96@srcf.net>);
 Thu, 26 Jan 2023 20:17:56 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 8DF111FB9D;
 Thu, 26 Jan 2023 20:17:56 +0000 (GMT)
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
X-Inumbo-ID: 8a63b653-9db6-11ed-b8d1-410ff93cb8f0
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <6742bf64-1d09-ee63-1aa4-1ecbef6b7c0a@srcf.net>
Date: Thu, 26 Jan 2023 20:17:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230125165308.22897-1-andrew.cooper3@citrix.com>
 <a5ba3821-37fc-c724-d015-6e9dc8cf65fd@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/shadow: Fix PV32 shadowing in !HVM builds
In-Reply-To: <a5ba3821-37fc-c724-d015-6e9dc8cf65fd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/01/2023 8:50 am, Jan Beulich wrote:
> On 25.01.2023 17:53, Andrew Cooper wrote:
>> The OSSTest bisector identified an issue with c/s 1894049fa283 ("x86/shadow:
>> L2H shadow type is PV32-only") in !HVM builds.
>>
>> The bug is ultimately caused by sh_type_to_size[] not actually being specific
>> to HVM guests, and it's position in shadow/hvm.c mislead the reasoning.
>>
>> To fix the issue that OSSTest identified, SH_type_l2h_64_shadow must still
>> have the value 1 in any CONFIG_PV32 build.  But simply adjusting this leaves
>> us with misleading logic, and a reasonable chance of making a related error
>> again in the future.
>>
>> In hindsight, moving sh_type_to_size[] out of common.c in the first place a
>> mistake.  Therefore, move sh_type_to_size[] back to living in common.c,
>> leaving a comment explaining why it happens to be inside an HVM conditional.
>>
>> This effectively reverts the second half of 4fec945409fc ("x86/shadow: adjust
>> and move sh_type_to_size[]") while retaining the other improvements from the
>> same changeset.
>>
>> While making this change, also adjust the sh_type_to_size[] declaration to
>> match its definition.
>>
>> Fixes: 4fec945409fc ("x86/shadow: adjust and move sh_type_to_size[]")
>> Fixes: 1894049fa283 ("x86/shadow: L2H shadow type is PV32-only")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Now it's time for me to ask: But why? Your interpretation of "HVM-only"
> is simply too restricted.

I appreciate that we have different opinions on the matter.

But the sequence of events speaks for itself.  Inadvertently, you
created this trap, and then fell straight into it.

> As said, "HVM-only" can have two meanings -
> build-time HVM-only and run time HVM-only.

So

obj-$(CONFIG_HVM) += hvm.c

mean "this file, if and only if it is compiled in, contains logic
critical to the runtime functioning of PV guests" does it.

>  Code in hvm.c is also
> expecting to be entered for PV guests when HVM=y - see the several
> is_hvm_...(). They're all bogus though, and I have a patch pending to
> remove them. But that doesn't alter the principle. See e.g. audit_p2m(),
> which simply bails first thing when !paging_mode_translate(), or
> p2m_pod_active(), which bails first thing when !is_hvm_domain().

The fact that similar layering violations exist elsewhere doesn't mean
that this isn't one.  The fact that all experts in this area of code got
it wrong *is* the problem.

You in writing the patch and me in reviewing it made the assumption that
PV guests don't enter code in hvm.c *because* it is an entirely
reasonable assumption to make.

> Content of hvm.c (and other files which are built only when HVM=y, or
> more generally any other files which have a Kconfig build time
> dependency in their respective Makefile) simply has to be aware of this
> fact, and hence the data (array) in question is quite fine to live where
> it does.

There are two ways to stop this from happening.

Either make the assumption actually true, or stop people making the
assumption.

One is these can be done, and one cannot.


> I continue to view my 1st patch as the better approach. And in no case
> do I view the 1st Fixes: tag as appropriate.
>
> I guess we really need George or Tim to break ties here.

I have committed this with George's Ack.

~Andrew

