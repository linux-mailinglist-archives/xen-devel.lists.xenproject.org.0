Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A119D97E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 16:52:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNff-0007L4-UU; Fri, 03 Apr 2020 14:51:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKNfe-0007KX-Qi
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 14:51:46 +0000
X-Inumbo-ID: a3977088-75ba-11ea-bd2a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3977088-75ba-11ea-bd2a-12813bfff9fa;
 Fri, 03 Apr 2020 14:51:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6C88AC62;
 Fri,  3 Apr 2020 14:51:44 +0000 (UTC)
Subject: Re: [PATCH v7 09/12] xen: add runtime parameter access support to
 hypfs
To: Juergen Gross <jgross@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-10-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f08bdac6-122a-9289-3241-a0460a73c686@suse.com>
Date: Fri, 3 Apr 2020 16:51:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402154616.16927-10-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.04.2020 17:46, Juergen Gross wrote:
> V7:
> - fine tune some parameter initializations (Jan Beulich)
> - call custom_runtime_set_var() after updating the value
> - modify alignment in Arm linker script to 4 (Jan Beulich)

I didn't ask for this to be unilaterally 4 - I don't think this
would work on Arm64, seeing that there are pointers inside the
struct. This wants to be pointer size, i.e. 4 for Arm32 but 8
for Arm64.

> --- a/docs/misc/hypfs-paths.pandoc
> +++ b/docs/misc/hypfs-paths.pandoc
> @@ -152,3 +152,12 @@ The major version of Xen.
>  #### /buildinfo/version/minor = INTEGER
>  
>  The minor version of Xen.
> +
> +#### /params/
> +
> +A directory of runtime parameters.
> +
> +#### /params/*
> +
> +The individual parameters. The description of the different parameters can be
> +found in `docs/misc/xen-command-line.pandoc`.

Is .pandoc a useful specification here, or do such extensions get
converted when rendering into different formats?

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -70,6 +70,30 @@ integer_param("ple_window", ple_window);
>  static bool __read_mostly opt_ept_pml = true;
>  static s8 __read_mostly opt_ept_ad = -1;
>  int8_t __read_mostly opt_ept_exec_sp = -1;
> +static char opt_ept_setting[24];
> +
> +static void update_ept_param_append(const char *str, int val)
> +{
> +    char *pos = opt_ept_setting + strlen(opt_ept_setting);
> +
> +    snprintf(pos, sizeof(opt_ept_setting) - (pos - opt_ept_setting),
> +             ",%s=%d", str, val);
> +}
> +
> +static void update_ept_param(void)
> +{
> +    snprintf(opt_ept_setting, sizeof(opt_ept_setting), "pml=%d", opt_ept_pml);
> +    if ( opt_ept_ad >= 0 )
> +        update_ept_param_append("ad", opt_ept_ad);

With the new patch 1, is the if() here really still needed? Then
again, only "exec-sp" is a runtime sub-parameter anyway afaict,
and hence I'd expect only that part of the option should be
displayed (I'm sorry for not having paid attention to this
earlier).

Jan

