Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39720877F34
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 12:41:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691422.1077388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rje29-0006Ec-0o; Mon, 11 Mar 2024 11:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691422.1077388; Mon, 11 Mar 2024 11:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rje28-0006Bp-UW; Mon, 11 Mar 2024 11:41:32 +0000
Received: by outflank-mailman (input) for mailman id 691422;
 Mon, 11 Mar 2024 11:41:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rje27-0006Bj-Jx
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 11:41:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cf6eafd-df9c-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 12:41:29 +0100 (CET)
Received: from [192.168.1.9] (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 63F214EE0C90;
 Mon, 11 Mar 2024 12:41:28 +0100 (CET)
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
X-Inumbo-ID: 4cf6eafd-df9c-11ee-a1ee-f123f15fe8a2
Message-ID: <93179ace-f201-40d9-8348-372d59e4030b@bugseng.com>
Date: Mon, 11 Mar 2024 12:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 00/16] xen: address violation of MISRA C:2012
 Directive 4.10
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <b5c9c975-4c6a-4724-8cf4-a6b90dd137cb@suse.com>
Content-Language: en-US
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <b5c9c975-4c6a-4724-8cf4-a6b90dd137cb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/24 10:59, Jan Beulich wrote:
> On 11.03.2024 09:59, Simone Ballarin wrote:
>> The Xen sources contain violations of MISRA C:2012 Directive 4.10 whose headline states:
>> "Precautions shall be taken in order to prevent the contents of a header file
>> being included more than once".
>>
>> As stated in v2, the following naming convention has been estabilished:
>> - arch/.../include/asm/ headers -> ASM_<filename>_H
>> - private headers -> <dir>_<filename>_H
>> - asm-generic headers -> ASM_GENERIC_<filename>_H
>>
>> Since there would have been conflicting guards between architectures (which is a violation
>> of the directive),
> 
> Why would this be a violation? The two sets of headers aren't use together,
> and any scan should only point out collisions in what's actively used, I'd
> hope.
> 

A header guard cannot be used multiple times in the same project, so it's a question
of whether or not we want to consider each arch variant part of the same project.
In case, we can define a new rule for these files.

>> there has been a need for ASM headers to specify  if the inclusion guard
>> referred to ARM or X86. Hence it has been decided to adopt instead:
>> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
>>
>> The subdir used is the smallest possible to avoid collisions. For example, it has been
>> observed that in "xen/arch/arm/include/asm/arm32" and "xen/arch/arm/include/asm/arm64" there
>> are plenty of header files with the same name, hence  _ARMxx_ was added as subdirectory.
> 
> Why couldn't <arch>_<subdir> together be ARMxx there, allowing us to get
> away with one less name component.
> 

I agree.

>> There has been a need to define a standard for generated headers too:
>>   - include/generated/<subdir>/<filename>.h-> GENERATED_<subdir>_<filename>_H
>>   - arch/<architecture>/include/generated/asm/<filename>.h-> <arch>_GENERATED_ASM_<name>_H
>>
>> To summarize, here are all the rules that have been applied:
>> - private headers -> <dir>_<filename>_H
> 
> And <dir> here is the full path? I thought I had indicated before that
> this is going to lead to excessively long identifiers.
> 

Yes, dir is the full path. This general fallback rule to use when more specific rules do not apply.
If this generates excessively long guards, we can simply add more rules.
>> - asm-generic headers -> ASM_GENERIC_<filename>_H
>> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
>> - include/generated/<subdir>/<filename>.h-> GENERATED_<subdir>_<filename>_H
>> - arch/<architecture>/include/generated/asm/<filename>.h-> <arch>_GENERATED_ASM_<name>_H
> 
> And _ASM_ is merely a precaution for stuff appearing outside of asm/ (which
> doesn't seem very likely)?
> 

Yes, it is. Do you prefer dropping the _ARM_?

> Jan

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


