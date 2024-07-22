Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988A9395B6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762483.1172647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0yB-0000ah-2r; Mon, 22 Jul 2024 21:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762483.1172647; Mon, 22 Jul 2024 21:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0yB-0000YM-00; Mon, 22 Jul 2024 21:53:23 +0000
Received: by outflank-mailman (input) for mailman id 762483;
 Mon, 22 Jul 2024 21:53:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuwE=OW=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sW0yA-0000YB-0h
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:53:22 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce583c1b-4874-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 23:53:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 8E6C2A02D3;
 Mon, 22 Jul 2024 23:53:18 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4i9YF_Rbm8jg; Mon, 22 Jul 2024 23:53:18 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 6FA4DA02CA;
 Mon, 22 Jul 2024 23:53:18 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sW0y5-0000000BETl-3tdS; Mon, 22 Jul 2024 23:53:17 +0200
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
X-Inumbo-ID: ce583c1b-4874-11ef-8776-851b0ebba9a2
Date: Mon, 22 Jul 2024 23:53:17 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 3/3] mini-os: simplify monotonic_clock()
Message-ID: <20240722215317.sbtvdr6wpfe4qz7r@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240722121643.18116-1-jgross@suse.com>
 <20240722121643.18116-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722121643.18116-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 22 juil. 2024 14:16:43 +0200, a ecrit:
> monotonic_clock() in arch/x86/time.c is more complex than needed: it
> has basically two nested loops making sure the time data obtained from
> Xen are valid.
> 
> Simplify that by merging some of the used sub-functions into the main
> function and using only a single loop. Further simplify the code by
> using struct vcpu_time_info for the local instance instead of defining
> a similar structure in the code.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  arch/x86/time.c | 58 ++++++++++++++-----------------------------------
>  1 file changed, 16 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/x86/time.c b/arch/x86/time.c
> index 7fd7abef..52916e15 100644
> --- a/arch/x86/time.c
> +++ b/arch/x86/time.c
> @@ -44,24 +44,10 @@
>   *************************************************************************/
>  
>  /* These are peridically updated in shared_info, and then copied here. */
> -struct shadow_time_info {
> -    uint64_t tsc_timestamp;     /* TSC at last update of time vals.  */
> -    uint64_t system_timestamp;  /* Time, in nanosecs, since boot.    */
> -    uint32_t tsc_to_nsec_mul;
> -    int tsc_shift;
> -    uint32_t version;
> -};
>  static struct timespec shadow_ts;
>  static uint32_t shadow_ts_version;
>  
> -static struct shadow_time_info shadow;
> -
> -static inline int time_values_up_to_date(void)
> -{
> -    struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
> -
> -    return shadow.version == src->version;
> -}
> +static struct vcpu_time_info shadow;
>  
>  static inline int wc_values_up_to_date(void)
>  {
> @@ -113,22 +99,7 @@ static unsigned long get_nsec_offset(void)
>      rdtscll(now);
>      delta = now - shadow.tsc_timestamp;
>  
> -    return scale_delta(delta, shadow.tsc_to_nsec_mul, shadow.tsc_shift);
> -}
> -
> -static void get_time_values_from_xen(void)
> -{
> -    struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
> -
> -    do {
> -        shadow.version = src->version;
> -        rmb();
> -        shadow.tsc_timestamp     = src->tsc_timestamp;
> -        shadow.system_timestamp  = src->system_time;
> -        shadow.tsc_to_nsec_mul   = src->tsc_to_system_mul;
> -        shadow.tsc_shift         = src->tsc_shift;
> -        rmb();
> -    } while ( (src->version & 1) | (shadow.version ^ src->version) );
> +    return scale_delta(delta, shadow.tsc_to_system_mul, shadow.tsc_shift);
>  }
>  
>  /*
> @@ -138,19 +109,22 @@ static void get_time_values_from_xen(void)
>   */
>  uint64_t monotonic_clock(void)
>  {
> -    uint64_t time;
> -    uint32_t local_time_version;
> +    struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
>  
> -    do {
> -        local_time_version = shadow.version;
> -        rmb();
> -        time = shadow.system_timestamp + get_nsec_offset();
> -        if ( !time_values_up_to_date() )
> -            get_time_values_from_xen();
> -        rmb();
> -    } while ( local_time_version != shadow.version );
> +    if ( shadow.version != src->version )
> +    {
> +        do {
> +            shadow.version = src->version;
> +            rmb();
> +            shadow.tsc_timestamp     = src->tsc_timestamp;
> +            shadow.system_time       = src->system_time;
> +            shadow.tsc_to_system_mul = src->tsc_to_system_mul;
> +            shadow.tsc_shift         = src->tsc_shift;
> +            rmb();
> +        } while ( (src->version & 1) || (shadow.version != src->version) );
> +    }
>  
> -    return time;
> +    return shadow.system_time + get_nsec_offset();
>  }
>  
>  static void update_wallclock(void)
> -- 
> 2.43.0
> 

-- 
Samuel
"I don't know why, but first C programs tend to look a lot worse than
first programs in any other language (maybe except for fortran, but then
I suspect all fortran programs look like `firsts')"
(By Olaf Kirch)

