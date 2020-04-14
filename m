Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D33001A8C5F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 22:25:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOS76-0006lh-Es; Tue, 14 Apr 2020 20:24:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JNOL=56=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOS75-0006lb-3D
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 20:24:55 +0000
X-Inumbo-ID: 00060c86-7e8e-11ea-b58d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00060c86-7e8e-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 20:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586895894;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=y3TBEIewzoLbvOHXkrqiBad2k4udvTD2ufd/z90hUQA=;
 b=MSFySptPQ1xHTsCCJE+AyvVStnDnCoznsf4Xt9cCcDATAoQ3DzLL0xJH
 PkSWd+Ck5yQ0xjWlHj+fxSMeg0/VzmoPjWANgAbGCkbxh6mrZMbwer98J
 5M+MZaqfaeEchlG7vdzOcim7falcdk9Y8osasRrHacw6fsA3SQvrFI6+B 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HpGCMY45IRaSrSS6demanULjBpYhw87sCqDBlLOLz+wlKgIOW+81RvBoBOJFU83IkAQGJHTZdn
 nQ0fs+rEaRGXP1Ql6dfTg0WaJGabc1SzT+L6m4oIqCGWSFxxOKWZbagJTLu72afCUWzQrhYOkj
 PEAhKyKUxYBw7/bFEhVzMwNqMB4BWsqUin86hYP8Y2wnP/lHfwSqeeyDHDlXX25mP3oOmNGieW
 tv+bfhnbqJzB8xNe28HDyZv2RhxE9m+jqqdjqEc0RUbKXnpRO+lrnOCkF8qFRzZJfcliX41fKF
 3Ao=
X-SBRS: 2.7
X-MesageID: 15995110
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,384,1580792400"; d="scan'208";a="15995110"
Subject: Re: Ping [PATCH v2 14/17] libxc/save: Write X86_{CPUID,MSR}_DATA
 records
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-15-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5c535bf4-d1ca-488a-7b2b-dd1c023d0d83@citrix.com>
Date: Tue, 14 Apr 2020 21:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200127143444.25538-15-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/01/2020 14:34, Andrew Cooper wrote:
> With all other plumbing in place, obtain the CPU Policy from Xen and
> write it into the migration stream.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  tools/libxc/xc_sr_common_x86.c   | 50 ++++++++++++++++++++++++++++++++++++++++
>  tools/libxc/xc_sr_common_x86.h   |  6 +++++
>  tools/libxc/xc_sr_save_x86_hvm.c |  2 +-
>  tools/libxc/xc_sr_save_x86_pv.c  | 12 +++++++++-
>  4 files changed, 68 insertions(+), 2 deletions(-)
>
> diff --git a/tools/libxc/xc_sr_common_x86.c b/tools/libxc/xc_sr_common_x86.c
> index 8980299e9a..6267655dab 100644
> --- a/tools/libxc/xc_sr_common_x86.c
> +++ b/tools/libxc/xc_sr_common_x86.c
> @@ -42,6 +42,56 @@ int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *rec)
>      return 0;
>  }
>  
> +int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
> +{
> +    xc_interface *xch = ctx->xch;
> +    struct xc_sr_record cpuid = { .type = REC_TYPE_X86_CPUID_POLICY, };
> +    struct xc_sr_record msrs  = { .type = REC_TYPE_X86_MSR_POLICY, };
> +    uint32_t nr_leaves = 0, nr_msrs = 0;
> +    int rc;
> +
> +    if ( xc_get_cpu_policy_size(xch, &nr_leaves, &nr_msrs) < 0 )
> +    {
> +        PERROR("Unable to get CPU Policy size");
> +        return -1;
> +    }
> +
> +    cpuid.data = malloc(nr_leaves * sizeof(xen_cpuid_leaf_t));
> +    msrs.data  = malloc(nr_msrs   * sizeof(xen_msr_entry_t));
> +    if ( !cpuid.data || !msrs.data )
> +    {
> +        ERROR("Cannot allocate memory for CPU Policy");
> +        rc = -1;
> +        goto out;
> +    }
> +
> +    if ( xc_get_domain_cpu_policy(xch, ctx->domid, &nr_leaves, cpuid.data,
> +                                  &nr_msrs, msrs.data) )
> +    {
> +        PERROR("Unable to get d%d CPU Policy", ctx->domid);
> +        rc = -1;
> +        goto out;
> +    }
> +
> +    cpuid.length = nr_leaves * sizeof(xen_cpuid_leaf_t);
> +    if ( cpuid.length )
> +    {
> +        rc = write_record(ctx, &cpuid);
> +        if ( rc )
> +            goto out;
> +    }
> +
> +    msrs.length = nr_msrs * sizeof(xen_msr_entry_t);
> +    if ( msrs.length )
> +        rc = write_record(ctx, &msrs);
> +
> + out:
> +    free(cpuid.data);
> +    free(msrs.data);
> +
> +    return rc;
> +}
> +
>  int handle_x86_cpuid_policy(struct xc_sr_context *ctx, struct xc_sr_record *rec)
>  {
>      xc_interface *xch = ctx->xch;
> diff --git a/tools/libxc/xc_sr_common_x86.h b/tools/libxc/xc_sr_common_x86.h
> index c458c1aa37..d1050981dd 100644
> --- a/tools/libxc/xc_sr_common_x86.h
> +++ b/tools/libxc/xc_sr_common_x86.h
> @@ -15,6 +15,12 @@ int write_x86_tsc_info(struct xc_sr_context *ctx);
>  int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *rec);
>  
>  /*
> + * Obtains a domains CPU Policy from Xen, and writes X86_{CPUID,MSR}_POLICY
> + * records into the stream.
> + */
> +int write_x86_cpu_policy_records(struct xc_sr_context *ctx);
> +
> +/*
>   * Parses an X86_CPUID_POLICY record and stashes the content for application
>   * when a STATIC_DATA_END record is encountered.
>   */
> diff --git a/tools/libxc/xc_sr_save_x86_hvm.c b/tools/libxc/xc_sr_save_x86_hvm.c
> index 93bcc1c273..acf9264dec 100644
> --- a/tools/libxc/xc_sr_save_x86_hvm.c
> +++ b/tools/libxc/xc_sr_save_x86_hvm.c
> @@ -172,7 +172,7 @@ static int x86_hvm_setup(struct xc_sr_context *ctx)
>  
>  static int x86_hvm_static_data(struct xc_sr_context *ctx)
>  {
> -    return 0;
> +    return write_x86_cpu_policy_records(ctx);
>  }
>  
>  static int x86_hvm_start_of_stream(struct xc_sr_context *ctx)
> diff --git a/tools/libxc/xc_sr_save_x86_pv.c b/tools/libxc/xc_sr_save_x86_pv.c
> index 46019d962d..c7e246ef4f 100644
> --- a/tools/libxc/xc_sr_save_x86_pv.c
> +++ b/tools/libxc/xc_sr_save_x86_pv.c
> @@ -1054,7 +1054,17 @@ static int x86_pv_setup(struct xc_sr_context *ctx)
>  
>  static int x86_pv_static_data(struct xc_sr_context *ctx)
>  {
> -    return write_x86_pv_info(ctx);
> +    int rc;
> +
> +    rc = write_x86_pv_info(ctx);
> +    if ( rc )
> +        return rc;
> +
> +    rc = write_x86_cpu_policy_records(ctx);
> +    if ( rc )
> +        return rc;
> +
> +    return 0;
>  }
>  
>  static int x86_pv_start_of_stream(struct xc_sr_context *ctx)


