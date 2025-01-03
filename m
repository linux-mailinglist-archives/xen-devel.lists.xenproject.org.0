Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2646A01116
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 00:36:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864686.1275911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTrDY-0003jt-RM; Fri, 03 Jan 2025 23:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864686.1275911; Fri, 03 Jan 2025 23:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTrDY-0003iG-OZ; Fri, 03 Jan 2025 23:36:36 +0000
Received: by outflank-mailman (input) for mailman id 864686;
 Fri, 03 Jan 2025 23:36:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79/6=T3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTrDW-0003hr-Kv
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 23:36:34 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9042c07b-ca2b-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 00:36:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EE163A409EC;
 Fri,  3 Jan 2025 23:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6A9C4CEDD;
 Fri,  3 Jan 2025 23:36:29 +0000 (UTC)
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
X-Inumbo-ID: 9042c07b-ca2b-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735947391;
	bh=a9nOPusxtPFWkaIJaF6kGeuTmu+Olo0EOeybaF8ecdk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h2u5UKs3gX4otiTE/Dc1wL5H2nCKK6xOLLfvS+AD9idITOXEq4jcLE3ftr036BL4n
	 zx7sB0nHBDPguESJSBM+ZV2jNEs8RJZ8e6lluY07jMPZI8ynIpq7Fg8HRRJOYyHyMd
	 +iUQkMODA6QjuqnOIGMwFurP/PfihDrr9w+WlSD5mK5bDQaNp1R2S6Ai57Nxj5SOat
	 o2lobrSa/fWmrLb6PG0JgSuiebhOP0De9oxpJN2FxLqwE3BHQCRXn8hQKgAAqH8iGl
	 K82VEOhklpL4LEneJFdfzzxwVUUfJHqnRxNXXpKpHYC8fC0Jqp+0SorB9HSNttDqkQ
	 ikBmaueV66nBw==
Date: Fri, 3 Jan 2025 15:36:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH 4/5] xen/perfc: Cleanup
In-Reply-To: <20250102192508.2405687-5-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2501031536220.16425@ubuntu-linux-20-04-desktop>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com> <20250102192508.2405687-5-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-892678208-1735947391=:16425"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-892678208-1735947391=:16425
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 2 Jan 2025, Andrew Cooper wrote:
>  * Strip trailing whitspace.
>  * Remove PRIperfc.  It has never been used and isn't useful.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/common/perfc.c      | 10 +++++-----
>  xen/include/xen/perfc.h | 23 +++++++++++------------
>  2 files changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/common/perfc.c b/xen/common/perfc.c
> index b748c8af855b..8302b7cf6db1 100644
> --- a/xen/common/perfc.c
> +++ b/xen/common/perfc.c
> @@ -46,7 +46,7 @@ void cf_check perfc_printall(unsigned char key)
>          case TYPE_S_SINGLE:
>              for_each_online_cpu ( cpu )
>                  sum += per_cpu(perfcounters, cpu)[j];
> -            if ( perfc_info[i].type == TYPE_S_SINGLE ) 
> +            if ( perfc_info[i].type == TYPE_S_SINGLE )
>                  sum = (perfc_t) sum;
>              printk("TOTAL[%12Lu]", sum);
>              if ( sum )
> @@ -56,7 +56,7 @@ void cf_check perfc_printall(unsigned char key)
>                  {
>                      if ( k > 0 && (k % 4) == 0 )
>                          printk("\n%53s", "");
> -                    printk("  CPU%02u[%10"PRIperfc"u]", cpu, per_cpu(perfcounters, cpu)[j]);
> +                    printk("  CPU%02u[%10u]", cpu, per_cpu(perfcounters, cpu)[j]);
>                      ++k;
>                  }
>              }
> @@ -71,7 +71,7 @@ void cf_check perfc_printall(unsigned char key)
>                  for ( k = 0; k < perfc_info[i].nr_elements; k++ )
>                      sum += counters[k];
>              }
> -            if ( perfc_info[i].type == TYPE_S_ARRAY ) 
> +            if ( perfc_info[i].type == TYPE_S_ARRAY )
>                  sum = (perfc_t) sum;
>              printk("TOTAL[%12Lu]", sum);
>              if (sum)
> @@ -82,7 +82,7 @@ void cf_check perfc_printall(unsigned char key)
>                      sum = 0;
>                      for_each_online_cpu ( cpu )
>                          sum += per_cpu(perfcounters, cpu)[j + k];
> -                    if ( perfc_info[i].type == TYPE_S_ARRAY ) 
> +                    if ( perfc_info[i].type == TYPE_S_ARRAY )
>                          sum = (perfc_t) sum;
>                      if ( (k % 4) == 0 )
>                          printk("\n%16s", "");
> @@ -98,7 +98,7 @@ void cf_check perfc_printall(unsigned char key)
>                      sum = 0;
>                      for ( n = 0; n < perfc_info[i].nr_elements; n++ )
>                          sum += counters[n];
> -                    if ( perfc_info[i].type == TYPE_S_ARRAY ) 
> +                    if ( perfc_info[i].type == TYPE_S_ARRAY )
>                          sum = (perfc_t) sum;
>                      if ( k > 0 && (k % 4) == 0 )
>                          printk("\n%53s", "");
> diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
> index 324b47665573..bf0eb032f7a9 100644
> --- a/xen/include/xen/perfc.h
> +++ b/xen/include/xen/perfc.h
> @@ -8,24 +8,24 @@
>  
>  /*
>   * NOTE: new counters must be defined in perfc_defn.h
> - * 
> + *
>   * Counter declarations:
>   * PERFCOUNTER (counter, string)              define a new performance counter
>   * PERFCOUNTER_ARRAY (counter, string, size)  define an array of counters
> - * 
> + *
>   * Unlike counters, status variables do not reset:
>   * PERFSTATUS (counter, string)               define a new performance stauts
>   * PERFSTATUS_ARRAY (counter, string, size)   define an array of status vars
> - * 
> - * unsigned long perfc_value  (counter)        get value of a counter  
> + *
> + * unsigned long perfc_value  (counter)        get value of a counter
>   * unsigned long perfc_valuea (counter, index) get value of an array counter
> - * unsigned long perfc_set  (counter, val)     set value of a counter  
> + * unsigned long perfc_set  (counter, val)     set value of a counter
>   * unsigned long perfc_seta (counter, index, val) set value of an array counter
> - * void perfc_incr  (counter)                  increment a counter          
> + * void perfc_incr  (counter)                  increment a counter
>   * void perfc_decr  (counter)                  decrement a status
> - * void perfc_incra (counter, index)           increment an array counter   
> - * void perfc_add   (counter, value)           add a value to a counter     
> - * void perfc_adda  (counter, index, value)    add a value to array counter 
> + * void perfc_incra (counter, index)           increment an array counter
> + * void perfc_add   (counter, value)           add a value to a counter
> + * void perfc_adda  (counter, index, value)    add a value to array counter
>   * void perfc_print (counter)                  print out the counter
>   */
>  
> @@ -49,7 +49,6 @@ enum {
>  #undef PERFSTATUS_ARRAY
>  
>  typedef unsigned int perfc_t;
> -#define PRIperfc ""
>  
>  DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
>  
> @@ -72,7 +71,7 @@ DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
>  	 this_cpu(perfcounters)[PERFC_ ## x + (y)] = (v) : (v) )
>  
>  /*
> - * Histogram: special treatment for 0 and 1 count. After that equally spaced 
> + * Histogram: special treatment for 0 and 1 count. After that equally spaced
>   * with last bucket taking the rest.
>   */
>  #ifdef CONFIG_PERF_ARRAYS
> @@ -98,7 +97,7 @@ int perfc_control(struct xen_sysctl_perfc_op *pc);
>  extern void cf_check perfc_printall(unsigned char key);
>  extern void cf_check perfc_reset(unsigned char key);
>  
> -    
> +
>  #else /* CONFIG_PERF_COUNTERS */
>  
>  #define perfc_value(x)    (0)
> -- 
> 2.39.5
> 
--8323329-892678208-1735947391=:16425--

