Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85612607E1A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 20:10:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427945.677587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olwSm-00011E-H1; Fri, 21 Oct 2022 18:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427945.677587; Fri, 21 Oct 2022 18:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olwSm-0000yL-Dy; Fri, 21 Oct 2022 18:09:44 +0000
Received: by outflank-mailman (input) for mailman id 427945;
 Fri, 21 Oct 2022 18:09:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olwSk-0000yF-Kq
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 18:09:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olwSk-0000Vo-2z; Fri, 21 Oct 2022 18:09:42 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.29.168]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olwSj-0005r6-S9; Fri, 21 Oct 2022 18:09:42 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=+T4RkEbI6zCOBK4wp26Gs1MMOk7hkFIxuPFCHmlR9M8=; b=DKgk7gduhrGBEPbvKKy+XlbCL0
	DxaxvQExzcpSGZ5gc5m6iI3XaSLRkqPq2EoMB13f1wEqxS26UR+L5337EUpsP5YUmJ1MYgJJHnc5v
	D7n+6/IjPrI7esdDLVgTBLl6e3RJcf8V6cXUQsGHW8rxsWNsdJtq2GvAarwFAcfvB3gA=;
Message-ID: <daf3cb72-2708-ec13-c618-fc02c0dc5cb4@xen.org>
Date: Fri, 21 Oct 2022 19:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH 04/12] tools/xl: add support for cache coloring
 configuration
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-5-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220826125111.152261-5-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

This patch seems to be missing the tools maintainers/reviewers. I have 
added them now.

I am not sure what you are to generate the CCs. If you are not aware, we 
have a script that will add the correct maintainers/reviewers for each 
patch. The script is called "scripts/add_maintainers.pl" and can be used 
after generating the patches.

Cheers,

On 26/08/2022 13:51, Carlo Nonato wrote:
> Add a new "colors" parameter that defines the color assignment for a
> domain. The user can specify one or more color ranges using the same
> syntax used everywhere else for color config described in the documentation.
> The parameter is defined as a list of strings that represent the
> color ranges.
> Also documentation is added.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   docs/man/xl.cfg.5.pod.in         | 10 ++++++
>   tools/libs/light/libxl_create.c  | 12 ++++++++
>   tools/libs/light/libxl_types.idl |  1 +
>   tools/xl/xl_parse.c              | 52 ++++++++++++++++++++++++++++++--
>   4 files changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index b2901e04cf..5f53cec8bf 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2880,6 +2880,16 @@ Currently, only the "sbsa_uart" model is supported for ARM.
>   
>   =back
>   
> +=over 4
> +
> +=item B<colors=[ "COLORS_RANGE", "COLORS_RANGE", ...]>
> +
> +Specify the LLC color configuration for the guest. B<COLORS_RANGE> can be either
> +a single color value or a hypen-separated closed interval of colors
> +(such as "0-4").
> +
> +=back
> +
>   =head3 x86
>   
>   =over 4
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index b9dd2deedf..94c511912c 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -615,6 +615,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>       struct xs_permissions rwperm[1];
>       struct xs_permissions noperm[1];
>       xs_transaction_t t = 0;
> +    DECLARE_HYPERCALL_BUFFER(unsigned int, colors);
>   
>       /* convenience aliases */
>       libxl_domain_create_info *info = &d_config->c_info;
> @@ -676,6 +677,16 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>               goto out;
>           }
>   
> +        if (d_config->b_info.num_colors) {
> +            size_t bytes = sizeof(unsigned int) * d_config->b_info.num_colors;
> +            colors = xc_hypercall_buffer_alloc(ctx->xch, colors, bytes);
> +            memcpy(colors, d_config->b_info.colors, bytes);
> +            set_xen_guest_handle(create.arch.colors, colors);
> +            create.arch.num_colors = d_config->b_info.num_colors;
> +            create.arch.from_guest = 1;
> +            LOG(DEBUG, "Setup %u domain colors", d_config->b_info.num_colors);
> +        }
> +
>           for (;;) {
>               uint32_t local_domid;
>               bool recent;
> @@ -922,6 +933,7 @@ retry_transaction:
>       rc = 0;
>    out:
>       if (t) xs_transaction_end(ctx->xsh, t, 1);
> +    if (colors) xc_hypercall_buffer_free(ctx->xch, colors);
>       return rc;
>   }
>   
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index d634f304cd..642173af1a 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -557,6 +557,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>       ("ioports",          Array(libxl_ioport_range, "num_ioports")),
>       ("irqs",             Array(uint32, "num_irqs")),
>       ("iomem",            Array(libxl_iomem_range, "num_iomem")),
> +    ("colors",           Array(uint32, "num_colors")),
>       ("claim_mode",	     libxl_defbool),
>       ("event_channels",   uint32),
>       ("kernel",           string),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1b5381cef0..7f8fbbfb4c 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1220,8 +1220,9 @@ void parse_config_data(const char *config_source,
>       XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
>                      *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
>       XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
> -                   *mca_caps;
> -    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
> +                   *mca_caps, *colors;
> +    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps,
> +        num_colors;
>       int pci_power_mgmt = 0;
>       int pci_msitranslate = 0;
>       int pci_permissive = 0;
> @@ -1370,6 +1371,53 @@ void parse_config_data(const char *config_source,
>       if (!xlu_cfg_get_long (config, "maxmem", &l, 0))
>           b_info->max_memkb = l * 1024;
>   
> +    if (!xlu_cfg_get_list(config, "colors", &colors, &num_colors, 0)) {
> +        int k, p, cur_index;
> +
> +        b_info->num_colors = 0;
> +        /* Get number of colors based on ranges */
> +        for (i = 0; i < num_colors; i++) {
> +            uint32_t start = 0, end = 0;
> +
> +            buf = xlu_cfg_get_listitem(colors, i);
> +            if (!buf) {
> +                fprintf(stderr,
> +                    "xl: Unable to get element %d in colors range list\n", i);
> +                exit(1);
> +            }
> +
> +            if (sscanf(buf, "%u-%u", &start, &end) != 2) {
> +                if (sscanf(buf, "%u", &start) != 1) {
> +                    fprintf(stderr, "xl: Invalid color range: %s\n", buf);
> +                    exit(1);
> +                }
> +                end = start;
> +            }
> +            else if (start > end) {
> +                fprintf(stderr,
> +                        "xl: Start color is greater than end color: %s\n", buf);
> +                exit(1);
> +            }
> +
> +            /* Check for overlaps */
> +            for (k = start; k <= end; k++) {
> +                for (p = 0; p < b_info->num_colors; p++)
> +                    if (b_info->colors[p] == k) {
> +                        fprintf(stderr, "xl: Overlapped ranges not allowed\n");
> +                        exit(1);
> +                    }
> +            }
> +
> +            cur_index = b_info->num_colors;
> +            b_info->num_colors += (end - start) + 1;
> +            b_info->colors = (uint32_t *)realloc(b_info->colors,
> +                                sizeof(*b_info->colors) * b_info->num_colors);
> +
> +            for (k = start; k <= end; k++)
> +                b_info->colors[cur_index++] = k;
> +        }
> +    }
> +
>       if (!xlu_cfg_get_long (config, "vcpus", &l, 0)) {
>           vcpus = l;
>           if (libxl_cpu_bitmap_alloc(ctx, &b_info->avail_vcpus, l)) {

-- 
Julien Grall

