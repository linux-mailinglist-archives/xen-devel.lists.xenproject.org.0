Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8C821211B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 12:25:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqwOs-0005ge-Qh; Thu, 02 Jul 2020 10:25:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WaoH=AN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jqwOr-0005gZ-NG
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 10:25:01 +0000
X-Inumbo-ID: 4804b00c-bc4e-11ea-87f7-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4804b00c-bc4e-11ea-87f7-12813bfff9fa;
 Thu, 02 Jul 2020 10:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1593685499;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=G0Aqljya8yX75ne1DuCuJKaJD8hBtukZv46lpc2ZS+I=;
 b=IQIi5QNGuawiu6sLimTgT2syzohUNvkJ6+HhVbIMZ7ymmlxou6WEnLS2
 vfwas3axN+ujAiHtBvURnseT/6sy3nc/8LmZgl8YWOEB3cYWTVGI+oBb3
 1A9/Vh5eRKyFuymI8cX/kL712sO+fltDxhkFbEEaKWiLOOXFstXkV5buE 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: C1t6oVau5SRudcj+lU3bEdnJyf/GtsyoZmseUbLLjUYqW9nfxM0GBgIaw1OkoQgT+MIb81x8Y0
 7qB7rTlsA6TPUWeZd6S1NdhdUljh4slxKmZht0wLQ71w13IQGawnSsQ2Flkqem1ZU/zyCM0tWs
 M7HNFHPHwgjc7h+x3TxRLUex+G98+uoB2zMjUtXqgNwvLawCHJQwFmLmQD7n+q0n86bmo0a52g
 Bruw7UvayaKJrURTg96E1OHT8KjIGlO6Rkktqi35IEFbITTlY8HUARVgmyoHltwCs/1WYYbqMM
 kQs=
X-SBRS: 2.7
X-MesageID: 21787128
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,304,1589256000"; d="scan'208";a="21787128"
Date: Thu, 2 Jul 2020 11:24:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
Message-ID: <20200702102433.GE2030@perard.uk.xensource.com>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Michał,

On Tue, Jun 30, 2020 at 02:33:46PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Allow to specify the size of per-vCPU trace buffer upon
> domain creation. This is zero by default (meaning: not enabled).
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 0532739c1f..78f434b722 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -278,6 +278,16 @@ memory=8096 will report significantly less memory available for use
>  than a system with maxmem=8096 memory=8096 due to the memory overhead
>  of having to track the unused pages.
>  
> +=item B<vmtrace_pt_size=BYTES>

I don't like much this new configuration name. To me, "pt" sound like
passthrough, as in pci passthrough. But it seems to be for "processor
trace" (or tracing), isn't it? So if it is, then we have "trace" twice
in the name and I don't think that configuration is about tracing the
processor tracing feature. (Also I don't think we need to state "vm" in
the name easier as every configuration option should be about a vm.)

How about a name that is easier to understand without having to know all
the possible abbreviations? Maybe "processor_trace_buffer_size" or
similar?

> +
> +Specifies the size of processor trace buffer that would be allocated
> +for each vCPU belonging to this domain. Disabled (i.e. B<vmtrace_pt_size=0>
> +by default. This must be set to non-zero value in order to be able to
> +use processor tracing features with this domain.
> +
> +B<NOTE>: The size value must be between 4 kB and 4 GB and it must
> +be also a power of 2.

Maybe the configuration variable could take KBYTES for kilo-bytes
instead of just BYTES since the min is 4kB?

Also that item seems to be in the "Memory Allocation" section, but I
don't think that's a good place as the other options are for the size of
guest RAM. I don't know in which section this would be better but maybe
"Other Options" would be OK.

>  =back
>  
>  =head3 Guest Virtual NUMA Configuration
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 61b4ef7b7e..4eba224590 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1861,6 +1861,26 @@ void parse_config_data(const char *config_source,
>          }
>      }
>  
> +    if (!xlu_cfg_get_long(config, "vmtrace_pt_size", &l, 1) && l) {
> +        int32_t shift = 0;
> +
> +        if (l & (l - 1))
> +        {
> +            fprintf(stderr, "ERROR: pt buffer size must be a power of 2\n");

It would be better to state the option name in the error message.

> +            exit(1);
> +        }
> +
> +        while (l >>= 1) ++shift;
> +
> +        if (shift <= XEN_PAGE_SHIFT)
> +        {
> +            fprintf(stderr, "ERROR: too small pt buffer\n");
> +            exit(1);
> +        }
> +
> +        b_info->vmtrace_pt_order = shift - XEN_PAGE_SHIFT;
> +    }
> +
>      if (!xlu_cfg_get_list(config, "ioports", &ioports, &num_ioports, 0)) {
>          b_info->num_ioports = num_ioports;
>          b_info->ioports = calloc(num_ioports, sizeof(*b_info->ioports));
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 0a33e0dfd6..27dcfbac8c 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 59bdc28c89..7b8289d436 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h

I don't think it's wise to modify the toolstack, the hypervisor, and the
hypercall ABI in the same patch. Can you change this last two files in a
separate patch?

Thank you,

-- 
Anthony PERARD

