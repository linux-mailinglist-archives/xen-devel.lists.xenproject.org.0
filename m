Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262711965A4
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 12:19:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI9Q1-00079g-Rr; Sat, 28 Mar 2020 11:14:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eoyf=5N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jI9Q0-00079a-CW
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 11:14:24 +0000
X-Inumbo-ID: 47362ffc-70e5-11ea-8b31-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47362ffc-70e5-11ea-8b31-12813bfff9fa;
 Sat, 28 Mar 2020 11:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HHanl2RwzLOLD2qimNgXnmbpekU3Md41/HXNc4njeiQ=; b=RqelIqCtfMyLmqGnJVVT7Iz6H4
 /mW4jvSqVeZn5fwrnRuKMBOiO+mPkbTwtuv6D6d6EzuRQEohkfxSwLSiXAv9PgHObhekeShahi3FJ
 F/pTzLEQ94QNJUAdrWJeJazv8Fy0QoO4ahqniNlTcKV+J7++o1hAkXATUZjnZcPfgLTY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jI9Pv-0008IB-Vj; Sat, 28 Mar 2020 11:14:19 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jI9Pv-0007nP-JP; Sat, 28 Mar 2020 11:14:19 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-17-julien@xen.org>
 <a3d120d0-d67f-bed2-4920-0d3a1c3090ea@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c640eb5b-224f-e99a-daa2-6def00780e54@xen.org>
Date: Sat, 28 Mar 2020 11:14:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a3d120d0-d67f-bed2-4920-0d3a1c3090ea@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 16/17] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 27/03/2020 13:15, Jan Beulich wrote:
> On 22.03.2020 17:14, julien@xen.org wrote:
>> @@ -983,19 +984,20 @@ long p2m_pt_audit_p2m(struct p2m_domain *p2m)
>>                   /* check for 1GB super page */
>>                   if ( l3e_get_flags(l3e[i3]) & _PAGE_PSE )
>>                   {
>> -                    mfn = l3e_get_pfn(l3e[i3]);
>> -                    ASSERT(mfn_valid(_mfn(mfn)));
>> +                    mfn = l3e_get_mfn(l3e[i3]);
>> +                    ASSERT(mfn_valid(mfn));
>>                       /* we have to cover 512x512 4K pages */
>>                       for ( i2 = 0;
>>                             i2 < (L2_PAGETABLE_ENTRIES * L1_PAGETABLE_ENTRIES);
>>                             i2++)
>>                       {
>> -                        m2pfn = get_gpfn_from_mfn(mfn+i2);
>> +                        m2pfn = get_pfn_from_mfn(mfn_add(mfn, i2));
>>                           if ( m2pfn != (gfn + i2) )
>>                           {
>>                               pmbad++;
>> -                            P2M_PRINTK("mismatch: gfn %#lx -> mfn %#lx -> gfn %#lx\n",
>> -                                       gfn + i2, mfn + i2, m2pfn);
>> +                            P2M_PRINTK("mismatch: gfn %#lx -> mfn %"PRI_mfn" gfn %#lx\n",
>> +                                       gfn + i2, mfn_x(mfn_add(mfn, i2)),
> 
> As in the earlier patch, "mfn_x(mfn) + i2" would be shorter and
> hence imo preferable, especially in printk() and alike invocations.

The goal of using typesafe is to make the code safer not try to 
open-code everything because it might be shorter to write.

> 
> I would also prefer if you left %#lx alone, with the 2nd best
> option being to also use PRI_gfn alongside PRI_mfn. Primarily
> I'd like to avoid having a mixture.
The two options would be wrong:
	* gfn is an unsigned long and not gfn_t, so using PRI_gfn would be 
incorrect
	* mfn is now an mfn_t so using %lx would be incorrect

So the format string used in the patch is correct based on the types 
used. This...

> 
> Same (for both) at least one more time further down.

... would likely be applicable for all the other uses.

>> @@ -974,7 +974,7 @@ guest_physmap_add_entry(struct domain *d, gfn_t gfn, mfn_t mfn,
>>                   P2M_DEBUG("old gfn=%#lx -> mfn %#lx\n",
>>                             gfn_x(ogfn) , mfn_x(omfn));
>>                   if ( mfn_eq(omfn, mfn_add(mfn, i)) )
>> -                    p2m_remove_page(p2m, gfn_x(ogfn), mfn_x(mfn_add(mfn, i)),
>> +                    p2m_remove_page(p2m, gfn_x(ogfn), mfn_add(mfn, i),
>>                                       0);
> 
> Pull this up then onto the now shorter prior line?

Ok.

> 
>> @@ -2843,53 +2843,53 @@ void audit_p2m(struct domain *d,
>>       spin_lock(&d->page_alloc_lock);
>>       page_list_for_each ( page, &d->page_list )
>>       {
>> -        mfn = mfn_x(page_to_mfn(page));
>> +        mfn = page_to_mfn(page);
>>   
>> -        P2M_PRINTK("auditing guest page, mfn=%#lx\n", mfn);
>> +        P2M_PRINTK("auditing guest page, mfn=%"PRI_mfn"\n", mfn_x(mfn));
>>   
>>           od = page_get_owner(page);
>>   
>>           if ( od != d )
>>           {
>> -            P2M_PRINTK("mfn %"PRI_mfn" owner %pd != %pd\n", mfn, od, d);
>> +            P2M_PRINTK("mfn %"PRI_mfn" owner %pd != %pd\n", mfn_x(mfn), od, d);
>>               continue;
>>           }
>>   
>> -        gfn = get_gpfn_from_mfn(mfn);
>> +        gfn = get_pfn_from_mfn(mfn);
>>           if ( gfn == INVALID_M2P_ENTRY )
>>           {
>>               orphans_count++;
>> -            P2M_PRINTK("orphaned guest page: mfn=%#lx has invalid gfn\n",
>> -                           mfn);
>> +            P2M_PRINTK("orphaned guest page: mfn=%"PRI_mfn" has invalid gfn\n",
>> +                       mfn_x(mfn));
>>               continue;
>>           }
>>   
>>           if ( SHARED_M2P(gfn) )
>>           {
>> -            P2M_PRINTK("shared mfn (%lx) on domain page list!\n",
>> -                    mfn);
>> +            P2M_PRINTK("shared mfn (%"PRI_mfn") on domain page list!\n",
>> +                       mfn_x(mfn));
>>               continue;
>>           }
>>   
>>           p2mfn = get_gfn_type_access(p2m, gfn, &type, &p2ma, 0, NULL);
>> -        if ( mfn_x(p2mfn) != mfn )
>> +        if ( !mfn_eq(p2mfn, mfn) )
>>           {
>>               mpbad++;
>> -            P2M_PRINTK("map mismatch mfn %#lx -> gfn %#lx -> mfn %#lx"
>> +            P2M_PRINTK("map mismatch mfn %"PRI_mfn" -> gfn %#lx -> mfn %"PRI_mfn""
>>                          " (-> gfn %#lx)\n",
>> -                       mfn, gfn, mfn_x(p2mfn),
>> +                       mfn_x(mfn), gfn, mfn_x(p2mfn),
>>                          (mfn_valid(p2mfn)
>> -                        ? get_gpfn_from_mfn(mfn_x(p2mfn))
>> +                        ? get_pfn_from_mfn(p2mfn)
>>                           : -1u));
> 
> I realize this is an entirely unrelated change, but the -1u here
> is standing out too much to not mention it: Could I talk you into
> making this gfn_x(INVALID_GFN) at this occasion?

Hmmm, I am not sure why I missed this one. I will use gfn_x(INVALID_GFN).

> 
>> --- a/xen/include/asm-x86/mm.h
>> +++ b/xen/include/asm-x86/mm.h
>> @@ -500,9 +500,10 @@ extern paddr_t mem_hotplug;
>>    */
>>   extern bool machine_to_phys_mapping_valid;
>>   
>> -static inline void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn)
>> +static inline void set_pfn_from_mfn(mfn_t mfn_, unsigned long pfn)
>>   {
>> -    const struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn)));
>> +    const unsigned long mfn = mfn_x(mfn_);
> 
> I think it would be better overall if the parameter was named
> "mfn" and there was no local variable altogether. This would
> bring things in line with ...

You asked for this approach on the previous version [1]:

"Btw, the cheaper (in terms of code churn) change here would seem to
be to name the function parameter mfn_, and the local variable mfn.
That'll also reduce the number of uses of the unfortunate trailing-
underscore-name."

So can you pick a side and stick with it?

> 
>> @@ -515,11 +516,14 @@ static inline void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn)
>>   
>>   extern struct rangeset *mmio_ro_ranges;
>>   
>> -#define get_gpfn_from_mfn(mfn)      (machine_to_phys_mapping[(mfn)])
>> +static inline unsigned long get_pfn_from_mfn(mfn_t mfn)
>> +{
>> +    return machine_to_phys_mapping[mfn_x(mfn)];
>> +}
> 
> ... this.
> 
> Jan
> 

Cheers,

[1] <5CF7A1090200007800235782@prv1-mh.provo.novell.com>

-- 
Julien Grall

