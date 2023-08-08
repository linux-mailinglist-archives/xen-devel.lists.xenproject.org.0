Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE87738BD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 09:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579342.907279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTHUD-0004rM-AO; Tue, 08 Aug 2023 07:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579342.907279; Tue, 08 Aug 2023 07:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTHUD-0004oa-7q; Tue, 08 Aug 2023 07:50:37 +0000
Received: by outflank-mailman (input) for mailman id 579342;
 Tue, 08 Aug 2023 07:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQsq=DZ=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qTHUC-0004oU-6L
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 07:50:36 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40a8ba4a-35c0-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 09:50:33 +0200 (CEST)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-55b78bf0423so522687a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 00:50:33 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090a410400b00263154aab24sm7244870pjf.57.2023.08.08.00.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 00:50:31 -0700 (PDT)
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
X-Inumbo-ID: 40a8ba4a-35c0-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691481032; x=1692085832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpg6aIffbYjICJhycB3Bph3fxU0UaKYZ32RPKTrhmtc=;
        b=FcXFQj7o5xQr1tbRw7Pn9UcrCi1B232+uajLTiNwX9TdfSjMFaRRVdHzMiOaxlryr4
         TqsRZGIMtiNm6ZippcajS5s8BFNszaSa/g6yFRgc1b4Nrb+clf9RoWeRHJwEtReG4gDh
         LBwyybjoJjy6Q47GUlBU0hOxHJ5B5n+H+unsOBMRFGW3IeVtuYALwNVCTH0vLIY9qjFM
         CyLNGOebqxclIqP3q4eqEvOWKbqhuuoRiG1QYUPJbHFervGiVpOZhfBMii4BWNV8TQee
         jZz6YmXfb9rl1Oy5qXM+JWmVZktQ1qA2f5FKoSylWcG/GIFy7RhDcwYEdv8PeGx8L8zA
         uA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691481032; x=1692085832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpg6aIffbYjICJhycB3Bph3fxU0UaKYZ32RPKTrhmtc=;
        b=Hsl9IieWPdk6hsCBxKyCRb3uz+AD5z33/p0ANisaQT2HTb7eOEmKJ5m1ZzdVTe/oTm
         TvcMP/nzVr23BWsCuJZ+N/VmznMC/n3/YfBL+XWzqEj4zKxlGNGqmjT2qff04R0upna3
         7Cf5cE75GKcCX1gmSSF+2d6L935jnjSuJNyjtfcxIRzlJS//OaJmhsxWINgZW0PsZO1B
         Yj1Z5lU4GwyItuxYLy7r2eqByZH6zl7qBsqLM2Zx2+rHiivzvgsuJM/aQFci/7KMeGnN
         FbGCOz5YCCVkE/UkrcdSgHu30LdfzgsHJybPhT4jKTHGR6/8IxFtpVcRgdCPgSAVjAIt
         QF7A==
X-Gm-Message-State: ABy/qLa1Dqkx5nLTZ69iu9Y8xIWZWn+fPEf0YxwaFwp/kY13uoquf4ME
	VEcqOnJKOiyAOaw/reW8ZRSC7g==
X-Google-Smtp-Source: APBJJlEd8UgUmVjTGODajLkItGQ9rG+lZy4ypLT00ATvxhzy6MYHUWJPNACQWVHeXI8Weqa+eylbDA==
X-Received: by 2002:a17:90a:6c97:b0:263:730b:f568 with SMTP id y23-20020a17090a6c9700b00263730bf568mr25207579pjj.3.1691481032358;
        Tue, 08 Aug 2023 00:50:32 -0700 (PDT)
Message-ID: <5757e341-b261-14de-e052-46606d530460@bytedance.com>
Date: Tue, 8 Aug 2023 15:50:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 46/48] mm: shrinker: make memcg slab shrink lockless
Content-Language: en-US
To: Dave Chinner <david@fromorbit.com>
Cc: akpm@linux-foundation.org, tkhai@ya.ru, vbabka@suse.cz,
 roman.gushchin@linux.dev, djwong@kernel.org, brauner@kernel.org,
 paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com, cel@kernel.org,
 senozhatsky@chromium.org, yujie.liu@intel.com, gregkh@linuxfoundation.org,
 muchun.song@linux.dev, simon.horman@corigine.com, dlemoal@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-47-zhengqi.arch@bytedance.com>
 <ZNGr+1orhHaBORJG@dread.disaster.area>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZNGr+1orhHaBORJG@dread.disaster.area>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dave,

On 2023/8/8 10:44, Dave Chinner wrote:
> On Mon, Aug 07, 2023 at 07:09:34PM +0800, Qi Zheng wrote:
>> Like global slab shrink, this commit also uses refcount+RCU method to make
>> memcg slab shrink lockless.
> 
> This patch does random code cleanups amongst the actual RCU changes.
> Can you please move the cleanups to a spearate patch to reduce the
> noise in this one?

Sure, will do.

> 
>> diff --git a/mm/shrinker.c b/mm/shrinker.c
>> index d318f5621862..fee6f62904fb 100644
>> --- a/mm/shrinker.c
>> +++ b/mm/shrinker.c
>> @@ -107,6 +107,12 @@ static struct shrinker_info *shrinker_info_protected(struct mem_cgroup *memcg,
>>   					 lockdep_is_held(&shrinker_rwsem));
>>   }
>>   
>> +static struct shrinker_info *shrinker_info_rcu(struct mem_cgroup *memcg,
>> +					       int nid)
>> +{
>> +	return rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
>> +}
> 
> This helper doesn't add value. It doesn't tell me that
> rcu_read_lock() needs to be held when it is called, for one....

How about adding a comment or an assertion here?

> 
>>   static int expand_one_shrinker_info(struct mem_cgroup *memcg, int new_size,
>>   				    int old_size, int new_nr_max)
>>   {
>> @@ -198,7 +204,7 @@ void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
>>   		struct shrinker_info_unit *unit;
>>   
>>   		rcu_read_lock();
>> -		info = rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
>> +		info = shrinker_info_rcu(memcg, nid);
> 
> ... whilst the original code here was obviously correct.
> 
>>   		unit = info->unit[shriner_id_to_index(shrinker_id)];
>>   		if (!WARN_ON_ONCE(shrinker_id >= info->map_nr_max)) {
>>   			/* Pairs with smp mb in shrink_slab() */
>> @@ -211,7 +217,7 @@ void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
>>   
>>   static DEFINE_IDR(shrinker_idr);
>>   
>> -static int prealloc_memcg_shrinker(struct shrinker *shrinker)
>> +static int shrinker_memcg_alloc(struct shrinker *shrinker)
> 
> Cleanups in a separate patch.

OK.

> 
>> @@ -253,10 +258,15 @@ static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
>>   {
>>   	struct shrinker_info *info;
>>   	struct shrinker_info_unit *unit;
>> +	long nr_deferred;
>>   
>> -	info = shrinker_info_protected(memcg, nid);
>> +	rcu_read_lock();
>> +	info = shrinker_info_rcu(memcg, nid);
>>   	unit = info->unit[shriner_id_to_index(shrinker->id)];
>> -	return atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
>> +	nr_deferred = atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
>> +	rcu_read_unlock();
>> +
>> +	return nr_deferred;
>>   }
> 
> This adds two rcu_read_lock() sections to every call to
> do_shrink_slab(). It's not at all clear ifrom any of the other code
> that do_shrink_slab() now has internal rcu_read_lock() sections....

The xchg_nr_deferred_memcg() will only be called in shrink_slab_memcg(),
so other code doesn't need to know that information?

> 
>> @@ -464,18 +480,23 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>>   	if (!mem_cgroup_online(memcg))
>>   		return 0;
>>   
>> -	if (!down_read_trylock(&shrinker_rwsem))
>> -		return 0;
>> -
>> -	info = shrinker_info_protected(memcg, nid);
>> +again:
>> +	rcu_read_lock();
>> +	info = shrinker_info_rcu(memcg, nid);
>>   	if (unlikely(!info))
>>   		goto unlock;
>>   
>> -	for (; index < shriner_id_to_index(info->map_nr_max); index++) {
>> +	if (index < shriner_id_to_index(info->map_nr_max)) {
>>   		struct shrinker_info_unit *unit;
>>   
>>   		unit = info->unit[index];
>>   
>> +		/*
>> +		 * The shrinker_info_unit will not be freed, so we can
>> +		 * safely release the RCU lock here.
>> +		 */
>> +		rcu_read_unlock();
> 
> Why - what guarantees that the shrinker_info_unit exists at this
> point? We hold no reference to it, we hold no reference to any
> shrinker, etc. What provides this existence guarantee?

The shrinker_info_unit is never freed unless the memcg is destroyed.
Here we hold the refcount of this memcg (mem_cgroup_iter() -->
css_tryget()), so the shrinker_info_unit will not be freed.

> 
>> +
>>   		for_each_set_bit(offset, unit->map, SHRINKER_UNIT_BITS) {
>>   			struct shrink_control sc = {
>>   				.gfp_mask = gfp_mask,
>> @@ -485,12 +506,14 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>>   			struct shrinker *shrinker;
>>   			int shrinker_id = calc_shrinker_id(index, offset);
>>   
>> +			rcu_read_lock();
>>   			shrinker = idr_find(&shrinker_idr, shrinker_id);
>> -			if (unlikely(!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))) {
>> -				if (!shrinker)
>> -					clear_bit(offset, unit->map);
>> +			if (unlikely(!shrinker || !shrinker_try_get(shrinker))) {
>> +				clear_bit(offset, unit->map);
>> +				rcu_read_unlock();
>>   				continue;
>>   			}
>> +			rcu_read_unlock();
>>   
>>   			/* Call non-slab shrinkers even though kmem is disabled */
>>   			if (!memcg_kmem_online() &&
>> @@ -523,15 +546,20 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>>   					set_shrinker_bit(memcg, nid, shrinker_id);
>>   			}
>>   			freed += ret;
>> -
>> -			if (rwsem_is_contended(&shrinker_rwsem)) {
>> -				freed = freed ? : 1;
>> -				goto unlock;
>> -			}
>> +			shrinker_put(shrinker);
> 
> Ok, so why is this safe to call without holding the rcu read lock?
> The global shrinker has to hold the rcu_read_lock() whilst calling
> shrinker_put() to guarantee the validity of the list next pointer,
> but we don't hold off RCU here so what guarantees a racing global
> shrinker walk doesn't trip over this shrinker_put() call dropping
> the refcount to zero and freeing occuring in a different context...

This will not be a problem, even if shrinker::refcount is reduced to
0 here, the racing global shrinker walk already holds the rcu lock.

         shrink_slab            shrink_slab_memcg
         ===========            =================

         rcu_read_lock()
         shrinker_put()
                                shrinker_put()

And in shrink_slab_memcg(), the shrinker is not required to traverse the
next bit in the shrinker_info_unit::map, so there is no need to hold the
rcu lock to ensure the existence of this shrinker.

> 
> 
>> +		/*
>> +		 * We have already exited the read-side of rcu critical section
>> +		 * before calling do_shrink_slab(), the shrinker_info may be
>> +		 * released in expand_one_shrinker_info(), so reacquire the
>> +		 * shrinker_info.
>> +		 */
>> +		index++;
>> +		goto again;
> 
> With that, what makes the use of shrinker_info in
> xchg_nr_deferred_memcg() in do_shrink_slab() coherent and valid?

Holding rcu lock can ensure that the old shrinker_info will not be
freed, and the shrinker_info_unit::nr_deferred can also be indexed from
the old shrinker_info::unit[x], so the updated nr_deferred will not be
lost.

Thanks,
Qi

> 
> -Dave.

