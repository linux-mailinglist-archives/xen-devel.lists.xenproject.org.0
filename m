Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AA075241F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 15:44:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563180.880255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJwbc-0003gD-Ox; Thu, 13 Jul 2023 13:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563180.880255; Thu, 13 Jul 2023 13:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJwbc-0003d3-Ls; Thu, 13 Jul 2023 13:43:40 +0000
Received: by outflank-mailman (input) for mailman id 563180;
 Thu, 13 Jul 2023 13:43:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Khrh=C7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qJwbb-0003cx-Jb
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 13:43:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44bb4138-2183-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 15:43:37 +0200 (CEST)
Received: from [192.168.1.101] (unknown [37.163.129.145])
 by support.bugseng.com (Postfix) with ESMTPSA id 460E84EE0739;
 Thu, 13 Jul 2023 15:43:36 +0200 (CEST)
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
X-Inumbo-ID: 44bb4138-2183-11ee-8611-37d641c3527e
Message-ID: <c07a096a-9089-f600-4acd-30ae4d929d5c@bugseng.com>
Date: Thu, 13 Jul 2023 15:43:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] x86: make function declarations consistent with
 definitions
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <1b2d5be30c0e4f335e59dce6e7c001cb0805d702.1688465215.git.federico.serafini@bugseng.com>
 <a16cdb60-1307-636e-1473-e5388e8f79d9@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <a16cdb60-1307-636e-1473-e5388e8f79d9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/07/23 16:51, Jan Beulich wrote:
> On top of my earlier remark (when this was part of a series):
> 
>> --- a/xen/arch/x86/cpu/mcheck/x86_mca.h
>> +++ b/xen/arch/x86/cpu/mcheck/x86_mca.h
>> @@ -113,7 +113,7 @@ static inline int mcabanks_test(int bit, struct mca_banks* banks)
>>       return test_bit(bit, banks->bank_map);
>>   }
>>   
>> -struct mca_banks *mcabanks_alloc(unsigned int nr);
>> +struct mca_banks *mcabanks_alloc(unsigned int nr_mce_banks);
> 
> I'm not convinced here.
> 
>> --- a/xen/arch/x86/hvm/rtc.c
>> +++ b/xen/arch/x86/hvm/rtc.c
>> @@ -59,7 +59,7 @@ enum rtc_mode {
>>   static void rtc_copy_date(RTCState *s);
>>   static void rtc_set_time(RTCState *s);
>>   static inline int from_bcd(RTCState *s, int a);
>> -static inline int convert_hour(RTCState *s, int hour);
>> +static inline int convert_hour(RTCState *s, int raw);
> 
> Nor here.
> 
>> --- a/xen/arch/x86/include/asm/guest_pt.h
>> +++ b/xen/arch/x86/include/asm/guest_pt.h
>> @@ -422,7 +422,7 @@ static inline unsigned int guest_walk_to_page_order(const walk_t *gw)
>>   
>>   bool
>>   guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>> -                  unsigned long va, walk_t *gw, uint32_t pfec,
>> +                  unsigned long va, walk_t *gw, uint32_t walk,
>>                     gfn_t top_gfn, mfn_t top_mfn, void *top_map);
> 
> While the definition's use of "walk" makes clear why the variable is
> named the way it is despite being used with PFEC_* constants, not
> naming it "pfec" here will add confusion, as the connection to those
> constants will be lost. One will then be forced to go look at the
> definition, when looking at the declaration ought to be sufficient.
> 
> I'm not going to look further, but instead repeat my suggestion to
> split this patch. Besides reducing the Cc list(s), that'll also
> help getting in parts which are uncontroversial (like e.g. the
> change to xen/arch/x86/hvm/vioapic.c).
> 
> Jan

Hello Jan.

In the three cases above,
do you think changing the definitions to match the declarations
might be a solution?

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

