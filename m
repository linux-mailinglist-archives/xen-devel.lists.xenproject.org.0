Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A44A01363
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 09:47:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865410.1276712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTznx-0004Yb-0M; Sat, 04 Jan 2025 08:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865410.1276712; Sat, 04 Jan 2025 08:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTznw-0004Wd-T1; Sat, 04 Jan 2025 08:46:44 +0000
Received: by outflank-mailman (input) for mailman id 865410;
 Sat, 04 Jan 2025 08:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/3D=T4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tTznv-0004WX-HW
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 08:46:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a1c3a29-ca78-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 09:46:41 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4D6204EE073C;
 Sat,  4 Jan 2025 09:46:38 +0100 (CET)
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
X-Inumbo-ID: 6a1c3a29-ca78-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1735980398; bh=jWYZyytIpN3NwbzaTyrBU5KRbte3Mc1u4qctDdTMWNA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M2R/LfDUh/DDS5p0tcpmQUB1FP0ZAmt+UsTj6XK+HPqX/ziyIQ2VNBqpMSeLY+Ufp
	 2jmdDyifOKesXGeJM8cd3Bqr2yRij5+7rqzUbdw9o0Z7H1s5XI0c6bAGaFRzwpRBMv
	 j4/FcYy35LeJMMCqvf9EuWTQ9FIYsSSxPI1N6/DQfKlaLzCmGJcZS2/zKjhQelT0Ab
	 7J3PzI3ZLZsnf6lijcSpBR/Hs3sMai/kDoJu1sfCB69FCfFWIpk2FU+L4i4J6NQvQo
	 MOKXQ/nnSa94TW7QjdF071T67OKI986wfaHmXSC3HKWpfVINjGSTe2sUTMEvPBvLaH
	 l7+/FlJ3REqJA==
MIME-Version: 1.0
Date: Sat, 04 Jan 2025 09:46:38 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Subject: Re: [PATCH 2/5] xen/perfc: Add perfc_defn.h to asm-generic
In-Reply-To: <alpine.DEB.2.22.394.2501031525580.16425@ubuntu-linux-20-04-desktop>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
 <20250102192508.2405687-3-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2501031525580.16425@ubuntu-linux-20-04-desktop>
Message-ID: <de2fb1d4daddcfb2a9de18fb7911c603@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-01-04 00:29, Stefano Stabellini wrote:
> On Thu, 2 Jan 2025, Andrew Cooper wrote:
>> ... and hook it up for RISC-V and PPC.
>> 
>> On RISC-V at least, no combination of headers pulls in errno.h, so 
>> include it
>> explicitly.
>> 
>> Guard the hypercalls array declaration based on NR_hypercalls 
>> existing.  This
>> is sufficient to get PERF_COUNTERS fully working on RISC-V and PPC, so 
>> drop
>> the randconfig override.
>> 
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>  automation/gitlab-ci/build.yaml      | 1 -
>>  xen/arch/ppc/include/asm/Makefile    | 1 +
>>  xen/arch/riscv/include/asm/Makefile  | 1 +
>>  xen/common/perfc.c                   | 1 +
>>  xen/include/asm-generic/perfc_defn.h | 5 +++++
>>  xen/include/xen/perfc_defn.h         | 2 ++
>>  6 files changed, 10 insertions(+), 1 deletion(-)
>>  create mode 100644 xen/include/asm-generic/perfc_defn.h
>> 

>> diff --git a/xen/include/asm-generic/perfc_defn.h 
>> b/xen/include/asm-generic/perfc_defn.h
>> new file mode 100644
>> index 000000000000..8237636d83fb
>> --- /dev/null
>> +++ b/xen/include/asm-generic/perfc_defn.h
>> @@ -0,0 +1,5 @@
>> +/* This file is legitimately included multiple times. */
> 
> It is a good idea to add comment here to explain. This is effectively
> the same as a deviation of MISRA D4.10. SAF-8-safe is defined as
> "Headers that deliberatively leave the responsability of their correct
> inclusion to the caller are allowed". I think it applies, please add
> SAF-8-safe to this comment and also the other perfc_defn.h, e.g.:
> 
> /* SAF-8-safe This file is legitimately included multiple times. */
> 

There is already a deviation in place for this kind of files, so I think 
that's good as is, no need for a SAF tag.

-doc_begin="Files that are intended to be included more than once do not 
need to
conform to the directive."
-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* This file is 
legitimately included multiple times\\. \\*/$, begin-4))"}

> 
>> +/* #ifndef ASM_GENERIC_PERFC_DEFN_H */
>> +/* #define ASM_GENERIC_PERFC_DEFN_H */
>> +
>> +/* #endif ASM_GENERIC_PERFC_DEFN_H */
>> diff --git a/xen/include/xen/perfc_defn.h 
>> b/xen/include/xen/perfc_defn.h
>> index 0027d95a60bc..a987d80dd6f1 100644
>> --- a/xen/include/xen/perfc_defn.h
>> +++ b/xen/include/xen/perfc_defn.h
>> @@ -4,7 +4,9 @@
>> 
>>  #include <asm/perfc_defn.h>
>> 
>> +#ifdef NR_hypercalls
>>  PERFCOUNTER_ARRAY(hypercalls,           "hypercalls", NR_hypercalls)
>> +#endif
>> 
>>  PERFCOUNTER(calls_from_multicall,       "calls from multicall")
>> 
>> --
>> 2.39.5
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

