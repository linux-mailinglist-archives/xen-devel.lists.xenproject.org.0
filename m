Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46FB15106
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 18:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062848.1428567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugmwO-0000E6-5K; Tue, 29 Jul 2025 16:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062848.1428567; Tue, 29 Jul 2025 16:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugmwO-0000Cf-2g; Tue, 29 Jul 2025 16:12:36 +0000
Received: by outflank-mailman (input) for mailman id 1062848;
 Tue, 29 Jul 2025 16:12:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ugmwM-0000CZ-CW
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 16:12:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugmwL-007Y1s-24;
 Tue, 29 Jul 2025 16:12:33 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugmwL-00FwHu-0q;
 Tue, 29 Jul 2025 16:12:33 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=WbWTFqD00DK33nh33gph07yZieu3oQ751MF+1Zp9YqM=; b=Y/hQ8arbIUsTgtwCPR3cz+oyoi
	XKdK86iRC458pvWc/4g00jnm4i3NX9HI03QXZ+IW5lhIrBVoYfZUYq3TCl+HzGd6kIYry9/2Fcu0C
	v3yGHOXs7ssSk5TJP1W0Q/O+Xu0nNL/wz/Z41scpfGUsqm7g2jK855VolUp2OpGkX5Ow=;
Date: Tue, 29 Jul 2025 18:12:31 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jahan Murudi <jahan.murudi.zg@renesas.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [RFC PATCH v2] tools/xentop: Add physical CPU statistics support
Message-ID: <aIjy7zGcJp9wCYnj@l14>
References: <20250709082810.3052544-1-jahan.murudi.zg@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709082810.3052544-1-jahan.murudi.zg@renesas.com>

On Wed, Jul 09, 2025 at 01:58:10PM +0530, Jahan Murudi wrote:
> Introduce a new '-p/--pcpus' flag to display physical CPU utilization metrics
> using xc_interface. This provides hypervisor-level CPU usage insights alongside
> existing domain statistics.This helps correlate VM resource usage with host CPU
> load patterns.

Hi Jahan,

Thanks for this patch, it seems like a good idea.

> Changes:
> - Add pcpu.c/pcpu.h for PCPU stat collection logic
> - Link against libxenctrl for xc_handle access
> - Extend CLI with '-p' flag and output formatting
> - Forward declare xenstat_handle to access xc_handle
> - Include cleanup for PCPU resources in exit handler
> 
> Review Addressed:
> - Removed redundant Makefile changes
> - Fixed help text alignment (-b/--batch and -p/--pcpus)
> - Corrected indentation in stats display block

Usually, we put the "Review Addressed" section after a "---" line, so
that `git am` doesn't pick it up and the changes between patches version
aren't committed.

> Example usage:
>   xentop -p  # Shows physical CPU stats

I've tried this first, and it doesn't work. The output is all mangled,
the \n (next line) are printed without \r (return cursor to first
column) and looks like this:

Physical CPU Usage:
                   ┌───────┬────────┐
                                     │ Core  │ Usage  │
                                                       ├───────┼────────┤
                                                                         │ 0     │   0.1% │




>   xentop -bp # Batch mode

This one, with batch mode, seems to work.

> 
> Example output with '-p':
>   NAME      STATE   CPU(%)  MEM(%)  VCPUS ...
>   Domain-0  -----r    17.0     6.3      8
>   DomD      -----r   767.0    38.1      8
> 
>   Physical CPU Usage:
>   ┌───────┬────────┐
>   │ Core  │ Usage  │
>   ├───────┼────────┤
>   │ 0     │  98.1% │
>   │ ...   │  ...   │
>   │ 7     │  97.3% │
>   └───────┴────────┘
> 
> Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
> ---
> diff --git a/tools/xentop/pcpu.c b/tools/xentop/pcpu.c
> new file mode 100644
> index 0000000000..6b0f2a8d3c
> --- /dev/null
> +++ b/tools/xentop/pcpu.c
> @@ -0,0 +1,116 @@

New files should have license information, so this new file should start
with:

    /* SPDX-License-Identifier: GPL-2.0-only */

as that's the license used by xentop.c. (And we default to GPL for the
project.) And you can add your copyright after that:

    /*
     * Copyright (C) 2025 ....
     */

> +#include "pcpu.h"

Local include should go after system includes.

> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/time.h>
> +
> +#define MAX_PCPUS 128
> +
> +// Convert Xen's idle time (nanoseconds) to microseconds to match gettimeofday()
> +#define XEN_IDLETIME_TO_USEC(idle) ((idle) / 1000)
> +
> +// File-scope variables (static for module privacy)

Only C style /* ... */ comments should be used.
Also the "static for ..." part of the comment is unnecessary.

> +static pcpu_stat_t *pcpu_stats = NULL;
> +static int num_pcpus = 0;
> +static uint64_t *prev_idle = NULL;
> +static uint64_t *prev_total = NULL;
> +
> +int update_pcpu_stats(xc_interface *xch)
> +{
> +    struct xen_sysctl_cpuinfo info[MAX_PCPUS];
> +    struct timeval now;
> +    int nr_cpus = 0;
> +    int i;
> +
> +    if (!xch || xc_getcpuinfo(xch, MAX_PCPUS, info, &nr_cpus) < 0) {

We might want to use perror(), or more likely strerror() in the calling
function, to have the reason for the failure been printed.

> +        return -1;
> +    }
> +
> +    gettimeofday(&now, NULL);

We should probably check the return value of gettimeofday().

> +    uint64_t current_total = (uint64_t)now.tv_sec * 1000000 + now.tv_usec;

Is it wise to cast? Isn't now.tv_sec already 64bit? Aren't we going to
have trouble with overflow?

> +
> +    /* Allocate memory if needed */
> +    if (!pcpu_stats || nr_cpus > num_pcpus) {

Isn't `nr_cpus` and `num_pcpus` a bit too similar? We might want a
different name for `num_pcpus`.

> +        pcpu_stat_t *new_stats = realloc(pcpu_stats, nr_cpus * sizeof(pcpu_stat_t));
> +        uint64_t *new_prev_idle = realloc(prev_idle, nr_cpus * sizeof(uint64_t));
> +        uint64_t *new_prev_total = realloc(prev_total, nr_cpus * sizeof(uint64_t));
> +
> +        if (!new_stats || !new_prev_idle || !new_prev_total) {
> +            free(new_stats);
> +            free(new_prev_idle);
> +            free(new_prev_total);

I don't think you can do the error check in bulk.

If reallocation of `pcpu_stats` fails, `new_stats` will be NULL, and I
think `pcpu_stats` will still be allocated, so should probably be freed.

Also, you don't change the values of `pcpu_stats`, `prev_idle` and
`prev_total`, so the old now wrong value will be used, or
free_pcpu_stats() might just do a second free() on the same pointer if
the reallocation didn't move.

In case of error, you probably want to update the pcpu_stats states
(global variable) and call free_pcpu_stats().

> +            return -1;
> +        }
> +
> +        pcpu_stats = new_stats;
> +        prev_idle = new_prev_idle;
> +        prev_total = new_prev_total;
> +        num_pcpus = nr_cpus;
> +
> +        /* Initialize previous values (skip first calculation) */
> +        for (i = 0; i < nr_cpus; i++) {
> +            prev_idle[i] = XEN_IDLETIME_TO_USEC(info[i].idletime);
> +            prev_total[i] = current_total;

"total", total of what? I don't think that's a good name for what is
"now" in micro seconds.

> +            pcpu_stats[i].pcpu_id = i;

Is it somehow useful to have the index stored? In this patch, `pcpu_id`
is always accessed as `pcpu_stats[index].pcpu_id`, so `pcpu_id` is
always `index` (`i`).

> +            /* Default to 0% on first run */
> +            pcpu_stats[i].usage_pct = 0.0;
> +        }
> +        return 0;
> +    }
> +
> +    /* Calculate CPU usage */
> +    for (i = 0; i < nr_cpus; i++) {
> +        uint64_t current_idle = XEN_IDLETIME_TO_USEC(info[i].idletime);
> +        uint64_t idle_diff = current_idle - prev_idle[i];
> +        uint64_t total_diff = current_total - prev_total[i];
> +        
> +        if (total_diff > 0) {
> +            double usage = 100.0 * (1.0 - ((double)idle_diff / total_diff));
> +            pcpu_stats[i].usage_pct = (usage < 0) ? 0 : (usage > 100) ? 100 : usage;
> +        } else {
> +            pcpu_stats[i].usage_pct = 0.0;
> +        }
> +        pcpu_stats[i].pcpu_id = i;
> +        /* Update history */
> +        prev_idle[i] = current_idle;
> +        prev_total[i] = current_total;

Looks like `current_total` (I mean `now`) is always the same value for
every single entry in `prev_total[*]`. Do we need to store it for each
CPU? (It could be useful if they were a reason to query the idle time of
only part of the CPU at a time. At the moment, they are all queried at
the same time.)

Also going futher, it's looks like `total_diff` calculation is been
repetead for every single CPU, but the value calculated should always be
the same. Also it's not a good name, it's the time passed since the last
query, I think `time_diff` would already be a bit better.

By the way, it might be helpful to look at "xentop.c" to find out how to
deal with all that. There's already a call to `gettimeofday()` which
updates `curtime` and `oldtime`, is it possible to make use of those
instead of quering the time again? Also `get_cpu_pct()` might be a good
enought example to follow. I don't think converting `struct timeval now`
to `uint64_t current_total` right away is a good idea, because we would
need to deal with overflow, the calculation done for `us_elapsed` I
think avoid that.

> +    }
> +
> +    return 0;
> +}
> +
> +void print_pcpu_stats(void)
> +{
> +    if (!pcpu_stats || num_pcpus == 0) {
> +        printf("No PCPU data available\n");
> +        return;
> +    }
> +
> +    printf("\nPhysical CPU Usage:\n");
> +    
> +    // Print table header
> +    printf("┌───────┬────────┐\n");
> +    printf("│ Core  │ Usage  │\n");
> +    printf("├───────┼────────┤\n");
> +    
> +    // Print each CPU's data
> +    for (int i = 0; i < num_pcpus; i++) {
> +        printf("│ %-5d │ %5.1f%% │\n",
> +               pcpu_stats[i].pcpu_id,
> +               pcpu_stats[i].usage_pct);
> +    }
> +    
> +    // Print table footer
> +    printf("└───────┴────────┘\n");
> +}
> +
> +void free_pcpu_stats(void)
> +{
> +    free(pcpu_stats);
> +    free(prev_idle);
> +    free(prev_total);
> +    pcpu_stats = NULL;
> +    prev_idle = NULL;
> +    prev_total = NULL;
> +    num_pcpus = 0;
> +}
> diff --git a/tools/xentop/pcpu.h b/tools/xentop/pcpu.h
> new file mode 100644
> index 0000000000..6fbc023f22
> --- /dev/null
> +++ b/tools/xentop/pcpu.h
> @@ -0,0 +1,18 @@
> +#ifndef PCPU_H
> +#define PCPU_H
> +
> +#include <xenctrl.h>
> +#include <stdbool.h>
> +#include <xenstat.h>

It doesn't looks like stdbool.h or xenstat.h are used in this header,
they can be removed.

> +
> +typedef struct {
> +    int pcpu_id;
> +    float usage_pct;
> +} pcpu_stat_t;

Is pcpu_stat_t actually used outside of pcpu.c? If not, it can be
declared in pcpu.c.

> +
> +/* Public API */

"Public API", that's an overstatement :-). Those are just prototype for
functions inside a single program, so not really an API, and definitely
not public. I don't think this comment is very useful.

> +int update_pcpu_stats(xc_interface *xch);
> +void print_pcpu_stats(void);
> +void free_pcpu_stats(void);
> +
> +#endif // PCPU_H
> diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
> index f5d6c19cf9..b8d0ed4015 100644
> --- a/tools/xentop/xentop.c
> +++ b/tools/xentop/xentop.c
> @@ -24,6 +24,7 @@
>  #include <ctype.h>
>  #include <errno.h>
>  #include <math.h>
> +#include "pcpu.h"

This should go after system includes.

>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <stdarg.h>
> @@ -69,6 +70,12 @@
>  
>  #define INT_FIELD_WIDTH(n) ((unsigned int)(log10(n) + 1))
>  
> +/* TEMPORARY: Forward declare the internal structure */

Users of libraries should never look inside private structures, it could
change at anytime, and the program could start to have unexpected
behavior.

So, that's a hack.

But it's looks like you want an handler for xc_interface. There's
probably not a better way than opening a new one.

> +struct xenstat_handle {
> +    xc_interface *xc_handle;
> +    /* Other members don't matter for now */
> +};
> +
>  /*
>   * Function prototypes
>   */
> @@ -205,6 +212,7 @@ field_id sort_field = FIELD_DOMID;
>  unsigned int first_domain_index = 0;
>  unsigned int delay = 3;
>  unsigned int batch = 0;
> +static unsigned int show_pcpus = 0;
>  unsigned int loop = 1;
>  unsigned int iterations = 0;
>  int show_vcpus = 0;
> @@ -230,22 +238,23 @@ static WINDOW *cwin;
>  /* Print usage message, using given program name */
>  static void usage(const char *program)
>  {
> -	printf("Usage: %s [OPTION]\n"
> -	       "Displays ongoing information about xen vm resources \n\n"
> -	       "-h, --help           display this help and exit\n"
> -	       "-V, --version        output version information and exit\n"
> -	       "-d, --delay=SECONDS  seconds between updates (default 3)\n"
> -	       "-n, --networks       output vif network data\n"
> -	       "-x, --vbds           output vbd block device data\n"
> -	       "-r, --repeat-header  repeat table header before each domain\n"
> -	       "-v, --vcpus          output vcpu data\n"
> -	       "-b, --batch	     output in batch mode, no user input accepted\n"
> -	       "-i, --iterations     number of iterations before exiting\n"
> -	       "-f, --full-name      output the full domain name (not truncated)\n"
> -	       "-z, --dom0-first     display dom0 first (ignore sorting)\n"
> -	       "\n" XENTOP_BUGSTO,
> -	       program);
> -	return;
> +    printf("Usage: %s [OPTION]\n"
> +           "Displays ongoing information about xen vm resources \n\n"
> +           "-h, --help           display this help and exit\n"
> +           "-V, --version        output version information and exit\n"
> +           "-d, --delay=SECONDS  seconds between updates (default 3)\n"
> +           "-n, --networks       output vif network data\n"
> +           "-x, --vbds           output vbd block device data\n"
> +           "-r, --repeat-header  repeat table header before each domain\n"
> +           "-v, --vcpus          output vcpu data\n"
> +           "-b, --batch          output in batch mode, no user input accepted\n"
> +           "-p, --pcpus          show physical CPU stats\n"
> +           "-i, --iterations     number of iterations before exiting\n"
> +           "-f, --full-name      output the full domain name (not truncated)\n"
> +           "-z, --dom0-first     display dom0 first (ignore sorting)\n"
> +           "\n" XENTOP_BUGSTO,
> +           program);
> +    return;
>  }
>  
>  /* Print program version information */
> @@ -267,6 +276,8 @@ static void cleanup(void)
>  		xenstat_free_node(cur_node);
>  	if(xhandle != NULL)
>  		xenstat_uninit(xhandle);
> +
> +	free_pcpu_stats();
>  }
>  
>  /* Display the given message and gracefully exit */
> @@ -1189,7 +1200,7 @@ static void top(void)
>  		fail("Failed to retrieve statistics from libxenstat\n");
>  
>  	/* dump summary top information */
> -	if (!batch)
> +	if (!batch && !show_pcpus)
>  		do_summary();
>  
>  	/* Count the number of domains for which to report data */
> @@ -1245,9 +1256,17 @@ static void top(void)
>  			do_vbd(domains[i]);
>  	}
>  
> -	if (!batch)
> +	if (!batch && !show_pcpus)
>  		do_bottom_line();
>  
> +    if (show_pcpus && xhandle != NULL) {

This is too late to check if xhandle is NULL or not. It should not be
necessary.

> +        if (update_pcpu_stats(xhandle->xc_handle) == 0) {
> +            print_pcpu_stats();
> +        } else {
> +            print("Error getting PCPU stats\n");

Shouldn't this use the fail() function to print the error message and
exit?

> +        }
> +    }
> +	

There's some stray blank character (a \t at the end of the line) like
this line, and a few other place. If you managed to remove them all,
that would be nice.


Thanks,

-- 
Anthony PERARD

