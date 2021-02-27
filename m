Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8E9326B89
	for <lists+xen-devel@lfdr.de>; Sat, 27 Feb 2021 05:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90687.171688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFr3A-0001nA-IQ; Sat, 27 Feb 2021 04:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90687.171688; Sat, 27 Feb 2021 04:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFr3A-0001ml-FI; Sat, 27 Feb 2021 04:17:52 +0000
Received: by outflank-mailman (input) for mailman id 90687;
 Sat, 27 Feb 2021 04:17:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GzqE=H5=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFr38-0001md-CV
 for xen-devel@lists.xenproject.org; Sat, 27 Feb 2021 04:17:50 +0000
Received: from mail-ot1-x32e.google.com (unknown [2607:f8b0:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e42968a6-6706-437f-80e7-19f8c133cc78;
 Sat, 27 Feb 2021 04:17:49 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id v12so10034834ott.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Feb 2021 20:17:49 -0800 (PST)
Received: from thewall (142-79-211-230.starry-inc.net. [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id o18sm2082952ooi.16.2021.02.26.20.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 20:17:48 -0800 (PST)
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
X-Inumbo-ID: e42968a6-6706-437f-80e7-19f8c133cc78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wchmwZ+IITg0OsonbnclAtd4JkPy/jt61m7tN4ZQyI8=;
        b=OBYl8SXbKcRBbNcZ4QCX+Afj8KBYfYd5ovZfMUqvGQeEBlbro538xodlQojj6TjHwi
         Ip+L36ZMvAEI/3dotjBzsOaTqJoje6z4u8661HUwy/rsP+H3AcQvravRaoxdCCFcKYml
         AtuKYSt+YAqxLlxlfjwlo55ZJvZ7N2MiFsrPwDaxW7gMpfasNrvTeiwjF6J/Kuo6FBlI
         3R9/TGJA/dgz14+FKRbeuwJOAinME6dzKck++1EItjn5JqmRp+euyjv5H/GmhhV32qKy
         WMsNtSh4A8MBTet8WSuPoMURwb1h7SwGh/fkdGdbrSWhZafUyCVohzm0fvzXxrPFN9R9
         M83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wchmwZ+IITg0OsonbnclAtd4JkPy/jt61m7tN4ZQyI8=;
        b=XyPH+DMDuTb1IdxqfbXflmpXFMDXyWBsndVxOHLgN1vYsD0X81CxudvLe+GHSlUGGb
         u5Nbumv6g3DHnFFRIjiqgtSeBXTJtIG4NTSTCL09VxPSEXP1DP5f7Z/ZAKk3zI3lWpI+
         2KC2S/l221LEaOcxyi1d64EuZyvrXalYOmR8jxS9SfAs6Rl5Ln/VuMTAmR7JVNHyWW0e
         UB6wn9mf851seTVHLi/1v1UfLFUO5dXFlTN5UVo6DMwPjJVv/myR9jrXouEns8uOrF49
         Lx9nOVO6/OSXkqUs6cQzbsRJ3uDIXgGiNvyVhP77Jn2iF6waFzlOlCoNYLtStkRHa4zJ
         wrqA==
X-Gm-Message-State: AOAM533eM05mMrC31wqAtIz5b0WKfush2pyAX19NY49y69/OM9MDbgxx
	btSGApTdyRq6ueUPI7UBej0=
X-Google-Smtp-Source: ABdhPJzbKDeL2kEAFmyH56AphXrm8hRaLt/N1czTIrTnu5uIA2scZcjqdK4JTqYsCVR5OPVIcAUG+w==
X-Received: by 2002:a05:6830:41:: with SMTP id d1mr4985266otp.273.1614399468949;
        Fri, 26 Feb 2021 20:17:48 -0800 (PST)
Date: Fri, 26 Feb 2021 21:17:47 -0700
From: Connor Davis <connojdavis@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-next 3/6] xen/sched: Fix build when NR_CPUS == 1
Message-ID: <20210227041747.p6kfrtvmkk5sbwof@thewall>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <d0922adc698ab76223d76a0a7f328a72cedf00ad.1614265718.git.connojdavis@gmail.com>
 <b4ad0f83-e071-49f8-17a8-7fec0e226b9a@suse.com>
 <20210226030833.uugfojf5kkxhlpr7@thewall>
 <eb19a389-d2b3-d0cc-fd25-62bbb121cf98@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb19a389-d2b3-d0cc-fd25-62bbb121cf98@suse.com>

On Fri, Feb 26, 2021 at 09:31:02AM +0100, Jan Beulich wrote:
> On 26.02.2021 04:08, Connor Davis wrote:
> > On Thu, Feb 25, 2021 at 04:50:02PM +0100, Jan Beulich wrote:
> >> On 25.02.2021 16:24, Connor Davis wrote:
> >>> Return from cpu_schedule_up when either cpu is 0 or
> >>> NR_CPUS == 1. This fixes the following:
> >>>
> >>> core.c: In function 'cpu_schedule_up':
> >>> core.c:2769:19: error: array subscript 1 is above array bounds
> >>> of 'struct vcpu *[1]' [-Werror=array-bounds]
> >>>  2769 |     if ( idle_vcpu[cpu] == NULL )
> >>>       |
> >>>
> 
> Ah yes, at -O2 I can observe the warning on e.g.
> 
> extern int array[N];
> 
> int test(unsigned i) {
> 	if(i == N - 1)
> 		return 0;
> 	return array[i];
> }
> 
> when N=1. No warning appears when N=2 or higher, yet if it is
> sensible to emit for N=1 then it would imo be similarly
> sensible to emit in other cases. The only difference is that
> when N=1, there's no i for which the array access would ever
> be valid, while e.g. for N=2 there's exactly one such i.
> 
> I've tried an x86 build with NR_CPUS=1, and this hits the case
> you found and a 2nd one, where behavior is even more puzzling.
> For the case you've found I'd like to suggest as alternative
> 
> @@ -2769,6 +2769,12 @@ static int cpu_schedule_up(unsigned int
>      if ( cpu == 0 )
>          return 0;
>  
> +    /*
> +     * Guard in particular also against the compiler suspecting out-of-bounds
> +     * array accesses below when NR_CPUS=1.
> +     */
> +    BUG_ON(cpu >= NR_CPUS);
> +

Yeah I like this better than my approach.

>      if ( idle_vcpu[cpu] == NULL )
>          vcpu_create(idle_vcpu[0]->domain, cpu);
>      else
> 
> To fix the x86 build in this regard we'd additionally need
> something along the lines of
> 
> --- unstable.orig/xen/arch/x86/genapic/x2apic.c
> +++ unstable/xen/arch/x86/genapic/x2apic.c
> @@ -54,7 +54,17 @@ static void init_apic_ldr_x2apic_cluster
>      per_cpu(cluster_cpus, this_cpu) = cluster_cpus_spare;
>      for_each_online_cpu ( cpu )
>      {
> -        if (this_cpu == cpu || x2apic_cluster(this_cpu) != x2apic_cluster(cpu))
> +        if ( this_cpu == cpu )
> +            continue;
> +        /*
> +         * Guard in particular against the compiler suspecting out-of-bounds
> +         * array accesses below when NR_CPUS=1 (oddly enough with gcc 10 it
> +         * is the 1st of these alone which actually helps, not the 2nd, nor
> +         * are both required together there).
> +         */
> +        BUG_ON(this_cpu >= NR_CPUS);
> +        BUG_ON(cpu >= NR_CPUS);
> +        if ( x2apic_cluster(this_cpu) != x2apic_cluster(cpu) )
>              continue;
>          per_cpu(cluster_cpus, this_cpu) = per_cpu(cluster_cpus, cpu);
>          break;
> 
> but the comment points out how strangely the compiler behaves here.
> Even flipping around the two sides of the != doesn't change its
> behavior. It is perhaps relevant to note here that there's no
> special casing of smp_processor_id() in the NR_CPUS=1 case, so the
> compiler can't infer this_cpu == 0.
> 
> Once we've settled on how to change common/sched/core.c I guess
> I'll then adjust the x86-specific change accordingly and submit as
> a separate fix (or I could of course also bundle both changes then).

Feel free to bundle both.

    Connor

