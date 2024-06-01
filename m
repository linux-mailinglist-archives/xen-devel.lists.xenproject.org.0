Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C788C8D7158
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 19:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734278.1140460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDSOa-0004QJ-3i; Sat, 01 Jun 2024 17:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734278.1140460; Sat, 01 Jun 2024 17:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDSOa-0004Nt-0T; Sat, 01 Jun 2024 17:19:56 +0000
Received: by outflank-mailman (input) for mailman id 734278;
 Sat, 01 Jun 2024 17:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmUY=ND=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sDSOZ-0004Nn-H8
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 17:19:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29225393-203b-11ef-90a1-e314d9c70b13;
 Sat, 01 Jun 2024 19:19:54 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 52E054EE0737;
 Sat,  1 Jun 2024 19:19:53 +0200 (CEST)
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
X-Inumbo-ID: 29225393-203b-11ef-90a1-e314d9c70b13
MIME-Version: 1.0
Date: Sat, 01 Jun 2024 19:19:53 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [XEN PATCH 0/5] address violations of MISRA C rules
In-Reply-To: <b4267610-464b-479a-b886-12489c5e5a9b@citrix.com>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <b4267610-464b-479a-b886-12489c5e5a9b@citrix.com>
Message-ID: <fa17cb21b7bba2dabf49bba5138c1cf2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-01 16:37, Andrew Cooper wrote:
> On 01/06/2024 11:16 am, Nicola Vetrini wrote:
>> Patches 1 to 4 address violations of MISRA C Rule 20.12 by deviating 
>> certain
>> uses of some macros, while the last patch addresses some regressions 
>> introduced
>> by the latest bitops series
>> 
>> Nicola Vetrini (5):
>>   xen/domain: deviate violation of MISRA C Rule 20.12
>>   x86/domain: deviate violation of MISRA C Rule 20.12
>>   x86: deviate violation of MISRA C Rule 20.12
>>   automation/eclair_analysis: address remaining violations of MISRA C
>>     Rule 20.12
>>   xen: fix MISRA regressions on rule 20.9 and 20.12
> 
> I've committed patch 5 because it fixes a blocking failure in Gitlab CI
> from content already accepted for Xen 4.19.
> 

Thanks

> The others look fine to me, but you'll need to negotiate with Oleksii
> (CC'd) to get them in, at this point in the release.
> 

Well, having one more clean rule does look better for Xen, and the 
changes to the codebase are harmless enough, but ultimately given the 
closeness with the deadline I didn't really see a need to.

> Given that this series makes x86 clean to Rule 20.12, shouldn't there 
> be
> a final patch making it blocking, to bring x86 in line with ARM?
> 

Good point, I should have done that in patch 4. I'll do a follow-up 
patch.

> ~Andrew

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

