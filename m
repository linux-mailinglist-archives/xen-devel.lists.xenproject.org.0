Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221287BA5D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 10:26:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693067.1080797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkhL2-0001ZR-VT; Thu, 14 Mar 2024 09:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693067.1080797; Thu, 14 Mar 2024 09:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkhL2-0001Wu-Sc; Thu, 14 Mar 2024 09:25:24 +0000
Received: by outflank-mailman (input) for mailman id 693067;
 Thu, 14 Mar 2024 09:25:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pU9H=KU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rkhL1-0001Wj-JX
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 09:25:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c80d592a-e1e4-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 10:25:22 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 95C504EE0739;
 Thu, 14 Mar 2024 10:25:21 +0100 (CET)
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
X-Inumbo-ID: c80d592a-e1e4-11ee-afdd-a90da7624cb6
MIME-Version: 1.0
Date: Thu, 14 Mar 2024 10:25:21 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] amd/iommu: add fixed size to function parameter of
 array type
In-Reply-To: <6186b676-660c-4bfa-a825-18ff7f0d7f62@suse.com>
References: <533a2d4f0c92d7fe92aa200b64434389de546f69.1710343652.git.nicola.vetrini@bugseng.com>
 <6186b676-660c-4bfa-a825-18ff7f0d7f62@suse.com>
Message-ID: <503aa63b5204e9b9eab5a21235df7c6c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-14 09:32, Jan Beulich wrote:
> On 14.03.2024 08:42, Nicola Vetrini wrote:
>> The 'cmd' parameter of amd_iommu_send_guest_cmd is passed
>> to a function that expects arrays of size 4, therefore
>> specifying explicitly the size also in amd_iommu_send_guest_cmd
>> allows not to accidentally pass a smaller array or assume that
>> send_iommu_command handles array sizes >4 correctly.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> All current users pass an array of size 4, hence this patch is 
>> addressing
>> a potential issue noticed by the analyzer in the context of Rule 17.5
>> ("The function argument corresponding to a parameter declared to have 
>> an array
>> type shall have an appropriate number of elements"), not an actual 
>> problem in
>> the sources.
> 
> While true, I think we want to consider alternatives. First one being 
> to rip
> out this dead code (thus addressing other Misra concerns as well). 
> Second,
> if we meant to keep it, to properly do away with the (ab)use of u32[].
> 

I'm not understanding what you consider dead code.
I see three users of amd_iommu_send_guest_cmd and seven for 
send_iommu_command.
I can adjust u32 for sure. There are also other u32/uint32_t 
incosistencies in that header.

> Finally, if to be taken in this least-effort shape, ...
> 
>> --- a/xen/drivers/passthrough/amd/iommu.h
>> +++ b/xen/drivers/passthrough/amd/iommu.h
>> @@ -346,7 +346,7 @@ void cf_check amd_iommu_crash_shutdown(void);
>> 
>>  /* guest iommu support */
>>  #ifdef CONFIG_HVM
>> -void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[]);
>> +void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[4]);
> 
> ... u32 here and ...
> 
>> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
>> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
>> @@ -390,7 +390,7 @@ void amd_iommu_flush_all_caches(struct amd_iommu 
>> *iommu)
>>      flush_command_buffer(iommu, 0);
>>  }
>> 
>> -void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[])
>> +void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[4])
> 
> ... here would better be replaced by uint32_t at the same time, not the
> least because that's what ...
> 
>>  {
>>      send_iommu_command(iommu, cmd);
> 
> ... this function already takes afaics.
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

