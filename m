Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F252B3BBD8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 15:02:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101309.1454422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uryjF-0006vu-VZ; Fri, 29 Aug 2025 13:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101309.1454422; Fri, 29 Aug 2025 13:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uryjF-0006tS-SV; Fri, 29 Aug 2025 13:01:17 +0000
Received: by outflank-mailman (input) for mailman id 1101309;
 Fri, 29 Aug 2025 13:01:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uryjE-0006sC-Pi
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 13:01:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uryjE-00CcM2-0E;
 Fri, 29 Aug 2025 13:01:16 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uryjD-007a8N-3D;
 Fri, 29 Aug 2025 13:01:16 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=pF0jNmdgrhbfhCcgs1W8GKx9YMshyZK1L3qJ0UpkwNE=; b=GS63mCmjn4lQ+JuMiewsVNtKUW
	/hTMsaNHBsOVD1GfMS3CniK4oVItYeC23bVhaT9gW5xp2kJ/aLDScQZR0dmpaY4lStdwsZfWxkkUo
	PTZNG4VELd4WrswrWoQmGShtG8kt4uouXlaTxzWjBs4Hlx4XoIq4cW9Vp41GVGLy25a0=;
Date: Fri, 29 Aug 2025 15:01:14 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jahan Murudi <jahan.murudi.zg@renesas.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [RFC PATCH v3] tools/xentop: Add physical CPU statistics support
Message-ID: <aLGkmhRp-N91Cf-V@l14>
References: <20250804130643.1046157-1-jahan.murudi.zg@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804130643.1046157-1-jahan.murudi.zg@renesas.com>

On Mon, Aug 04, 2025 at 06:36:43PM +0530, Jahan Murudi wrote:
> diff --git a/tools/xentop/pcpu.c b/tools/xentop/pcpu.c
> new file mode 100644
> index 0000000000..53d6b9c30c
> --- /dev/null
> +++ b/tools/xentop/pcpu.c
> @@ -0,0 +1,152 @@
[..]
> +int update_pcpu_stats(const struct timeval *now, unsigned int delay_sec)
> +{
> +    struct xen_sysctl_cpuinfo info[MAX_PCPUS];
> +    int detected_cpus = 0;
> +    int ret, i;
> +    uint64_t current_time = (uint64_t)now->tv_sec * 1000000ULL + now->tv_usec;
> +
> +    if (!xc_handle) {
> +        xc_handle = xc_interface_open(NULL, NULL, 0);
> +        if (!xc_handle) {
> +            report_pcpu_error("xc_interface_open failed");
> +            return -1;
> +        }
> +    }
> +
> +    ret = xc_getcpuinfo(xc_handle, MAX_PCPUS, info, &detected_cpus);
> +    if (ret < 0) {
> +        report_pcpu_error("xc_getcpuinfo failed");
> +        return -1;
> +    }
> +
> +    /* Allocate/reallocate memory if needed */
> +    if (!pcpu_stats || detected_cpus > allocated_pcpus) {
> +        pcpu_stat_t *new_stats = realloc(pcpu_stats,
> +                        detected_cpus * sizeof(*pcpu_stats));
> +        if (!new_stats) goto alloc_error;

From here, `pcpu_stats` is an invalid pointer. You need
`pcpu_stats = new_stats` to avoid double free that would happen in
free_pcpu_stats(). And then, no need to do anything different for the
error handling of the other realloc(), that is, no need for any of the
free(new_*) calls.

> +        uint64_t *new_prev_idle = realloc(prev_idle,
> +                        detected_cpus * sizeof(*prev_idle));
> +        if (!new_prev_idle) {
> +            free(new_stats);
> +            goto alloc_error;
> +        }
> +
> +        uint64_t *new_prev_time = realloc(prev_time,
> +                        detected_cpus * sizeof(*prev_time));
> +        if (!new_prev_time) {
> +            free(new_stats);
> +            free(new_prev_idle);
> +            goto alloc_error;
> +        }
> +
> +        pcpu_stats = new_stats;
> +        prev_idle = new_prev_idle;
> +        prev_time = new_prev_time;
> +        allocated_pcpus = detected_cpus;
> +
> +        /* Initialize new entries */
> +        for (i = 0; i < detected_cpus; i++) {
> +            prev_idle[i] = info[i].idletime / 1000; /* ns->us */
> +            prev_time[i] = current_time;
> +            pcpu_stats[i].usage_pct = 0.0;
> +        }
> +        return 0;
> +    }
> +
> +    /* Calculate CPU usage with delay normalization */
> +    for (i = 0; i < detected_cpus; i++) {
> +        uint64_t current_idle = info[i].idletime / 1000;
> +        uint64_t idle_diff = current_idle - prev_idle[i];
> +        uint64_t time_diff = current_time - prev_time[i];

Do we need to calculate `time_diff` for every cpu? It looks like
prev_time[i] is always the same value, which is `current_time` from the
previous call of update_pcpu_stats().

> +
> +        /* Use configured delay when actual interval is too small */

I can't figure out why this would be necessary. Why a value of less
than 100000 would be too small for `time_diff`? Why would we want to use
`delay_sec` here, surely that would mean that we would calculate the
wrong `usage`?

> +        if (time_diff < 100000) {
> +            time_diff = delay_sec * 1000000ULL;
> +        }
> +
> +        if (time_diff > 0) {
> +            double usage = 100.0 * (1.0 - ((double)idle_diff / time_diff));
> +            /* Clamp between 0-100% */
> +            pcpu_stats[i].usage_pct = (usage < 0) ? 0.0 :
> +                                     (usage > 100) ? 100.0 : usage;
> +        } else {
> +            pcpu_stats[i].usage_pct = 0.0;
> +        }
> +
> +        prev_idle[i] = current_idle;
> +        prev_time[i] = current_time;
> +    }
> +
> +    return 0;
> +
> +alloc_error:
> +    free_pcpu_stats();
> +    errno = ENOMEM;
> +    report_pcpu_error("memory allocation failed");
> +    return -1;
> +}
> +
> +void print_pcpu_stats(void)
> +{
> +    if (!pcpu_stats || allocated_pcpus == 0) {
> +        printf("\r\nNo PCPU data available\r\n");
> +        return;
> +    }
> +
> +    printf("\r\nPhysical CPU Usage:\r\n");
> +    printf("+-------+--------+\r\n");
> +    printf("| Core  | Usage  |\r\n");
> +    printf("+-------+--------+\r\n");

I don't think that the right way to print information on the screen in
non-batch mode. It kind of work, but it pushes the bottom bar (with help
on how to activate more stat) out of the screen. And in batch mode,
there's no need for \r.

There's a print() function in xentop.c which seems to take care of batch
vs ncurse mode.

> +
> +    for (int i = 0; i < allocated_pcpus; i++) {
> +        printf("| %-5d | %5.1f%% |\r\n", i, pcpu_stats[i].usage_pct);
> +    }
> +
> +    printf("+-------+--------+\r\n");
> +}
> +
> +void free_pcpu_stats(void)
> +{
> +    if (xc_handle) {
> +        xc_interface_close(xc_handle);
> +        xc_handle = NULL;
> +    }
> +    free(pcpu_stats);
> +    free(prev_idle);
> +    free(prev_time);
> +    pcpu_stats = NULL;
> +    prev_idle = NULL;
> +    prev_time = NULL;
> +    allocated_pcpus = 0;
> +}


Thanks,

-- 
Anthony PERARD

