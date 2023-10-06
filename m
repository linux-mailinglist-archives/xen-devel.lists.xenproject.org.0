Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD31E7BB4EA
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 12:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613476.954002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohmo-0006Ct-5O; Fri, 06 Oct 2023 10:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613476.954002; Fri, 06 Oct 2023 10:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohmo-0006B1-1z; Fri, 06 Oct 2023 10:10:22 +0000
Received: by outflank-mailman (input) for mailman id 613476;
 Fri, 06 Oct 2023 10:10:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl8M=FU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qohmm-0006Av-UX
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 10:10:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dd1e612-6430-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 12:10:19 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3B11B4EE0738;
 Fri,  6 Oct 2023 12:10:19 +0200 (CEST)
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
X-Inumbo-ID: 8dd1e612-6430-11ee-98d3-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 12:10:19 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Paul Durrant <paul@xen.org>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 8/9] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
In-Reply-To: <80101145-1958-457a-8c80-cae816ae74aa@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <9642dcb4ab51ec9eaeedf16056fbcd946a3efbea.1696514677.git.nicola.vetrini@bugseng.com>
 <80101145-1958-457a-8c80-cae816ae74aa@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <4b144869407871011c538af48b311c31@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2023 11:34, Julien Grall wrote:
> Hi Nicola,
> 
> On 06/10/2023 09:26, Nicola Vetrini wrote:
>> Given its use in the declaration
>> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
>> 'bits' has essential type 'enum iommu_feature', which is not
>> allowed by the Rule as an operand to the addition operator
>> in macro 'BITS_TO_LONGS'.
>> 
>> A comment in BITS_TO_LONGS is added to make it clear that
>> values passed are meant to be positive.
> 
> I am confused. If the value is meant to be positive. Then...
> 
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>   xen/include/xen/iommu.h | 2 +-
>>   xen/include/xen/types.h | 1 +
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>> index 0e747b0bbc1c..34aa0b9b5b81 100644
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -360,7 +360,7 @@ struct domain_iommu {
>>   #endif
>>         /* Features supported by the IOMMU */
>> -    DECLARE_BITMAP(features, IOMMU_FEAT_count);
>> +    DECLARE_BITMAP(features, (int)IOMMU_FEAT_count);
> 
> ... why do we cast to (int) rather than (unsigned int)? Also, I think
> this cast deserve a comment on top because this is not a very obvious
> one.
> 
>>         /* Does the guest share HAP mapping with the IOMMU? */
>>       bool hap_pt_share;
>> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
>> index aea259db1ef2..936e83d333a0 100644
>> --- a/xen/include/xen/types.h
>> +++ b/xen/include/xen/types.h
>> @@ -22,6 +22,7 @@ typedef signed long ssize_t;
>>     typedef __PTRDIFF_TYPE__ ptrdiff_t;
>>   +/* Users of this macro are expected to pass a positive value */
>>   #define BITS_TO_LONGS(bits) \
>>       (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>>   #define DECLARE_BITMAP(name,bits) \
> 
> Cheers,

See [1] for the reason why I did so. I should have mentioned that in the 
commit notes, sorry.
In short, making BITS_TO_LONGS essentially unsigned would cause a 
cascade of build errors and
possibly other essential type violations. If this is to be fixed that 
way, the effort required
is far greater. Either way, a comment on top of can be added, along the 
lines of:

Leaving this as an enum would violate MISRA C:2012 Rule 10.1

[1] 
https://lore.kernel.org/xen-devel/6495ba58bda01eae1f4baa46096424eb@bugseng.com/

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

