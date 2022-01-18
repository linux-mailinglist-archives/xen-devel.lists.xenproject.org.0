Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C1B492755
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 14:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258506.445238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9ofs-0000CX-60; Tue, 18 Jan 2022 13:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258506.445238; Tue, 18 Jan 2022 13:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9ofs-000092-1J; Tue, 18 Jan 2022 13:37:24 +0000
Received: by outflank-mailman (input) for mailman id 258506;
 Tue, 18 Jan 2022 13:37:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1rGk=SC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9ofq-00008w-3t
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 13:37:22 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c219e77f-7863-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 14:37:20 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48958)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9ofn-000TCm-gO (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 18 Jan 2022 13:37:19 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id DC7BD1FCF5;
 Tue, 18 Jan 2022 13:37:18 +0000 (GMT)
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
X-Inumbo-ID: c219e77f-7863-11ec-a115-11989b9578b4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <71b5f77b-acf5-fbeb-b442-9d6207dd3131@srcf.net>
Date: Tue, 18 Jan 2022 13:37:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
 <20220117094827.16756-11-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v6 10/12] libs/{light,guest}: implement
 xc_cpuid_apply_policy in libxl
In-Reply-To: <20220117094827.16756-11-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2022 09:48, Roger Pau Monne wrote:
> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> index e1acf6648d..7dcdb35a4c 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -454,6 +456,41 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
>       */
>      bool nested_virt = info->nested_hvm.val > 0;
>  
> +    policy = xc_cpu_policy_init();
> +    if (!policy) {
> +        LOGED(ERROR, domid, "Failed to init CPU policy");
> +        rc = ERROR_FAIL;
> +        goto out;
> +    }
> +
> +    r = xc_cpu_policy_get_domain(ctx->xch, domid, policy);
> +    if (r) {
> +        LOGED(ERROR, domid, "Failed to fetch domain CPU policy");
> +        rc = ERROR_FAIL;
> +        goto out;
> +    }
> +
> +    if (restore) {
> +        /*
> +         * Make sure the policy is compatible with pre Xen 4.13. Note that
> +         * newer Xen versions will pass policy data on the restore stream, so
> +         * any adjustments done here will be superseded.
> +         */
> +        r = xc_cpu_policy_make_compat_4_12(ctx->xch, policy, hvm);

One hidden host policy acquisition, and ...

> +        if (r) {
> +            LOGED(ERROR, domid, "Failed to setup compatible CPU policy");
> +            rc = ERROR_FAIL;
> +            goto out;
> +        }
> +    }
> +
> +    r = xc_cpu_policy_legacy_topology(ctx->xch, policy, hvm);

... one host featureset and ... (final comment)

> +    if (r) {
> +        LOGED(ERROR, domid, "Failed to setup CPU policy topology");
> +        rc = ERROR_FAIL;
> +        goto out;
> +    }
> +
>      /*
>       * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
>       * the xen-3.0-x86_32 and xen-3.0-x86_32p ABIs).  It is mandatory as Xen
> @@ -466,6 +503,13 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
>       */
>      if (info->type == LIBXL_DOMAIN_TYPE_HVM)
>          pae = libxl_defbool_val(info->u.hvm.pae);
> +    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("pae=%d", pae));
> +    if (rc) {
> +        LOGD(ERROR, domid, "Failed to set PAE CPUID flag");
> +        rc = ERROR_FAIL;
> +        goto out;
> +    }
> +
>  
>      /*
>       * Advertising Invariant TSC to a guest means that the TSC frequency won't
> @@ -481,14 +525,50 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
>       */
>      itsc = (libxl_defbool_val(info->disable_migrate) ||
>              info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
> +    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("invtsc=%d", itsc));
> +    if (rc) {
> +        LOGD(ERROR, domid, "Failed to set Invariant TSC CPUID flag");
> +        rc = ERROR_FAIL;
> +        goto out;
> +    }
>  
> -    r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
> -                              pae, itsc, nested_virt, info->cpuid);
> -    if (r)
> -        LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
> +    /* Set Nested virt CPUID bits for HVM. */
> +    if (hvm) {
> +        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("vmx=%d",
> +                                                              nested_virt));
> +        if (rc) {
> +            LOGD(ERROR, domid, "Failed to set VMX CPUID flag");
> +            rc = ERROR_FAIL;
> +            goto out;
> +        }
> +
> +        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("svm=%d",
> +                                                              nested_virt));
> +        if (rc) {
> +            LOGD(ERROR, domid, "Failed to set SVM CPUID flag");
> +            rc = ERROR_FAIL;
> +            goto out;
> +        }
> +    }

libxl_cpuid_parse_config() is a large overhead, and cannot suffer errors
because libxl crashes rather than failing memory allocations.  The
invasiveness would be reduced substantially by having:

str = GCSPRINTF("pae=%d,invtsc=%d", pae, itsc);
if ( hvm )
    append GCSPRINTF("vmx=%d,svm=%d", nested_virt, nested_virt);

and a single call to libxl_cpuid_parse_config().


Depending on how much we care, these need inserting at the head of the
info->cpuid list so they get processed in the same order as before.

> +
> +    /* Apply the bits from info->cpuid if any. */

'if any' is stale now.

> +    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);

... and both a host and default policy.

That is a lot of overhead added behind the scenes.  It would be rather
better to have this function obtain the host policy and pass it to all 3
helpers.  Default policy is harder to judge, but it would avoid needing
to pass an `hvm` boolean down into this helper.

~Andrew

