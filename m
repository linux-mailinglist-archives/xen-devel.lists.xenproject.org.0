Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21D787CE2F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 14:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693868.1082494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl7mE-0008GQ-PS; Fri, 15 Mar 2024 13:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693868.1082494; Fri, 15 Mar 2024 13:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl7mE-0008EQ-MU; Fri, 15 Mar 2024 13:39:14 +0000
Received: by outflank-mailman (input) for mailman id 693868;
 Fri, 15 Mar 2024 13:39:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0HQ=KV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rl7mD-0008EK-CT
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 13:39:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6839a842-e2d1-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 14:39:12 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A36194EE073C;
 Fri, 15 Mar 2024 14:39:11 +0100 (CET)
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
X-Inumbo-ID: 6839a842-e2d1-11ee-afdd-a90da7624cb6
MIME-Version: 1.0
Date: Fri, 15 Mar 2024 14:39:11 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] amd/iommu: clean up unused guest iommu related
 functions
In-Reply-To: <8f3275b9-ef64-4f49-8d81-fe32b217f74e@suse.com>
References: <324c939125677032af2c1d2e5fb628849415d68e.1710501265.git.nicola.vetrini@bugseng.com>
 <8f3275b9-ef64-4f49-8d81-fe32b217f74e@suse.com>
Message-ID: <fb71d310d191074d9ade885177d510c1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-15 14:31, Jan Beulich wrote:
> On 15.03.2024 12:16, Nicola Vetrini wrote:
>> Delete unused functions from 'iommu_guest.c'.
>> 
>> The 'cmd' parameter of amd_iommu_send_guest_cmd is passed
>> to a function that expects arrays of size 4, therefore
>> specifying explicitly the size also in amd_iommu_send_guest_cmd
>> allows not to accidentally pass a bigger array.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> All current users of amd_iommu_send_guest pass an array of size 4,
>> hence this is fixing a potential issue noticed by the analyzer for 
>> MISRA C
>> Rule 17.5, not an actual bug.
>> 
>> guest_iommu_add_ptr_log has still one caller, but even that seems
>> suspicious. I left it in and uniformed its parameter type at the
>> moment, so that whether it should be kept can be sorted out later.
>> If that caller indeed should be removed as well, then
>> no function in the file is actually reachable as far as I can tell.
> 
> Afaict this wants removing too.
> 
> But what I'm more puzzled by: You remove all callers of
> amd_iommu_send_guest_cmd(), yet still ...
> 
>> --- a/xen/drivers/passthrough/amd/iommu.h
>> +++ b/xen/drivers/passthrough/amd/iommu.h
>> @@ -346,12 +346,8 @@ void cf_check amd_iommu_crash_shutdown(void);
>> 
>>  /* guest iommu support */
>>  #ifdef CONFIG_HVM
>> -void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[]);
>> -void guest_iommu_add_ppr_log(struct domain *d, u32 entry[]);
>> -void guest_iommu_add_event_log(struct domain *d, u32 entry[]);
>> -int guest_iommu_init(struct domain* d);
>> -void guest_iommu_destroy(struct domain *d);
>> -int guest_iommu_set_base(struct domain *d, uint64_t base);
>> +void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, uint32_t 
>> cmd[4]);
> 
> ... retain the function.
> 
> Jan

Right, I forgot to remove it.
Thanks,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

