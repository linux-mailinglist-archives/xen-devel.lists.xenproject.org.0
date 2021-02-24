Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30AC323973
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 10:30:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89211.167836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEqTw-0001WA-AO; Wed, 24 Feb 2021 09:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89211.167836; Wed, 24 Feb 2021 09:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEqTw-0001Vl-6j; Wed, 24 Feb 2021 09:29:20 +0000
Received: by outflank-mailman (input) for mailman id 89211;
 Wed, 24 Feb 2021 09:29:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEqTu-0001Vg-Fg
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 09:29:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26f1dd9c-ace1-422c-88c5-3af2c86823c6;
 Wed, 24 Feb 2021 09:29:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50FC7AE47;
 Wed, 24 Feb 2021 09:29:16 +0000 (UTC)
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
X-Inumbo-ID: 26f1dd9c-ace1-422c-88c5-3af2c86823c6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614158956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dilbBM9wYrMX1TQWeEKnZc47GsGs9mibBqzlujSceRE=;
	b=aBtVqNzWOXhjI9ok88r7LV/MryktKP1Cc6ubCxXlW5QazvSpb7KVbFrv30VcHUM7Zc2uef
	de47OcZ9UL9uOeDJv5U/+aMNUPodgHIO6p+dP7d5bx1GU20T79iV/LWgkWoKvYJPnfRPcT
	AiS3mvOjG0nw5NxF4ZeZ/evXz2vWIR8=
Subject: Re: [PATCH RFC v3 4/4] x86/time: re-arrange struct
 calibration_rendezvous
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
 <56d70757-a887-6824-18f4-93b1f244e44b@suse.com>
Message-ID: <eaafcf3d-5920-6a29-b479-1901ee52a85f@suse.com>
Date: Wed, 24 Feb 2021 10:29:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <56d70757-a887-6824-18f4-93b1f244e44b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.02.2021 13:57, Jan Beulich wrote:
> To reduce latency on time_calibration_tsc_rendezvous()'s last loop
> iteration, separate fields written on the last iteration enough from the
> crucial field read by all CPUs on the last iteration such that they end
> up in distinct cache lines. Prefetch this field on an earlier iteration.

I've now measured the effects of this, at least to some degree. On my
single-socket 18-core Skylake system this reduces the average loop
exit time on CPU0 (from the TSC write on the last iteration to until
after the main loop) from around 32k cycles to around 28k (albeit the
values measured on separate runs vary quite significantly).

About the same effect (maybe a little less, but within error bounds)
can be had without any re-arrangement of the struct's layout, by
simply reading r->master_tsc_stamp into a local variable at the end
of each loop iteration. I'll make v4 use this less convoluted model
instead.

Jan

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1655,10 +1655,20 @@ static void tsc_check_reliability(void)
>   * All CPUS snapshot their local TSC and extrapolation of system time.
>   */
>  struct calibration_rendezvous {
> -    cpumask_t cpu_calibration_map;
>      atomic_t semaphore;
>      s_time_t master_stime;
> -    uint64_t master_tsc_stamp, max_tsc_stamp;
> +    cpumask_t cpu_calibration_map;
> +    /*
> +     * All CPUs want to read master_tsc_stamp on the last iteration.  If
> +     * cpu_calibration_map isn't large enough to push the field into a cache
> +     * line different from the one used by semaphore (written by all CPUs on
> +     * every iteration) and master_stime (written by CPU0 on the last
> +     * iteration), align the field suitably.
> +     */
> +    uint64_t __aligned(BITS_TO_LONGS(NR_CPUS) * sizeof(long) +
> +                       sizeof(atomic_t) + sizeof(s_time_t) < SMP_CACHE_BYTES
> +                       ? SMP_CACHE_BYTES : 1) master_tsc_stamp;
> +    uint64_t max_tsc_stamp;
>  };
>  
>  static void
> @@ -1709,6 +1719,8 @@ static void time_calibration_tsc_rendezv
>  
>              if ( i == 0 )
>                  write_tsc(r->master_tsc_stamp);
> +            else
> +                prefetch(&r->master_tsc_stamp);
>  
>              while ( atomic_read(&r->semaphore) != (2*total_cpus - 1) )
>                  cpu_relax();
> @@ -1731,6 +1743,8 @@ static void time_calibration_tsc_rendezv
>  
>              if ( i == 0 )
>                  write_tsc(r->master_tsc_stamp);
> +            else
> +                prefetch(&r->master_tsc_stamp);
>  
>              atomic_inc(&r->semaphore);
>              while ( atomic_read(&r->semaphore) > total_cpus )
> 
> 


