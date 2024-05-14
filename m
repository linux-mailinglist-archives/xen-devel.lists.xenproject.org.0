Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC48C4D52
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721179.1124364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6my9-00043Z-4o; Tue, 14 May 2024 07:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721179.1124364; Tue, 14 May 2024 07:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6my9-000415-27; Tue, 14 May 2024 07:53:05 +0000
Received: by outflank-mailman (input) for mailman id 721179;
 Tue, 14 May 2024 07:53:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6my7-00040z-OQ
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:53:03 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd77d97a-11c6-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 09:53:02 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-420104e5336so15811415e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 00:53:02 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee934csm184556455e9.38.2024.05.14.00.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 00:53:01 -0700 (PDT)
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
X-Inumbo-ID: fd77d97a-11c6-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715673182; x=1716277982; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tNqsSLUtvip3LDymvbn34Szd6re8FWDuq8rbRTdB1sA=;
        b=Vw28hktAy8GTxotGbxA0VN+/mLsPIFKs+Xyg9IunNtxscuWIUXCZWY0IuWwW5nIVlR
         XE+KNesByOo3DGNyvXiRfauWhQ9LPykeSw3qACW0tZFLRabj/NI6QD/490n2sFjdnXnS
         nD0SVYmO8ciYUL23SDxa7fD4j/+4VHqC/kWkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715673182; x=1716277982;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNqsSLUtvip3LDymvbn34Szd6re8FWDuq8rbRTdB1sA=;
        b=NaZm+OKvIrat2exzSu3Eiep3nTU5iQb5s88c/JlmYnnCHiKYhbnV/YbJEyBFvWD8+u
         0F5kR06ZNuuccZV1iMOnNcWg7XdmzYbpv/sJu8tUQeYLDDAzW1yVseVm+cOYAXp/8u86
         KbjEu1Ub1LW2tIdYw8K4Lu+ahMpb2WDTTsp5gAKIA+EY0fMOQUVcmSZWxd5pWqN/+Zhs
         i7fBnVpf+bxm1oS6Admlq0axw50KUnYhIzY8k9Gax+UDbvW5dl63Ccb30ufLAfTE1iMF
         WFRm9vYtpv4HUfWxwPLbi4ePgMo1aqTYt+HXAYUM14ZLNBWMRUtA9zyy6BKEwL3ptV1T
         BU8A==
X-Gm-Message-State: AOJu0Yz7V/3cUoDU03mBF9TELrSU7V0LHPfZs39y6EGeyfZ+BnsPWtos
	+dxehLPNwtiq3ijLe1gmoYKNudO0wYYiRxrtuHPhtYqwrE/+yY8TgevxvugdKBg=
X-Google-Smtp-Source: AGHT+IFuHJ9M4iMVdyKC1GjZhRRpCulrqslXw0w/ud/jqo+mlQ6Hn0OoFy+qOr/BHO+9Gpuukka8tA==
X-Received: by 2002:a05:600c:6548:b0:419:f533:ef88 with SMTP id 5b1f17b1804b1-41feaa42589mr107092315e9.11.1715673182020;
        Tue, 14 May 2024 00:53:02 -0700 (PDT)
Date: Tue, 14 May 2024 09:53:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] tools/xen-cpuid: Use automatically generated feature
 names
Message-ID: <ZkMYXSf9abR3J3FE@macbook>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
 <20240510224002.2324578-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510224002.2324578-4-andrew.cooper3@citrix.com>

On Fri, May 10, 2024 at 11:40:01PM +0100, Andrew Cooper wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Have gen-cpuid.py write out INIT_FEATURE_VAL_TO_NAME, derived from the same
> data source as INIT_FEATURE_NAME_TO_VAL, although both aliases of common_1d
> are needed.
> 
> In xen-cpuid.c, have the compiler pad both leaf_info[] and feature_names[] if
> necessary.  This avoids needing complicated cross-checks.
> 
> As dump_leaf() rendered missing names as numbers, always dump leaves even if
> we don't have the leaf name.  This conversion was argumably missed in commit
> 59afdb8a81d6 ("tools/misc: Tweak reserved bit handling for xen-cpuid").
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Differences in names are:
> 
>  sysenter    -> sep
>  tm          -> tm1
>  ds-cpl      -> dscpl
>  est         -> eist
>  sse41       -> sse4-1
>  sse42       -> sse4-2
>  movebe      -> movbe
>  tsc-dl      -> tsc-deadline
>  rdrnd       -> rdrand
>  hyper       -> hypervisor
>  mmx+        -> mmext
>  fxsr+       -> ffxsr
>  pg1g        -> page1gb
>  3dnow+      -> 3dnowext
>  cmp         -> cmp-legacy
>  cr8d        -> cr8-legacy
>  lzcnt       -> abm
>  msse        -> misalignsse
>  3dnowpf     -> 3dnowprefetch
>  nodeid      -> nodeid-msr
>  dbx         -> dbext
>  tsc-adj     -> tsc-adjust
>  fdp-exn     -> fdp-excp-only
>  deffp       -> no-fpu-sel
>  <24>        -> bld
>  ppin        -> amd-ppin
>  lfence+     -> lfence-dispatch
>  ppin        -> intel-ppin
>  energy-ctrl -> energy-filtering
> 
> Apparently BLD missed the update to xen-cpuid.c.  It appears to be the only
> one.  Several of the + names would be nice to keep as were, but doing so isn't
> nice in gen-cpuid.  Any changes would alter the {dom0-}cpuid= cmdline options,
> but we intentionally don't list them, so I'm not worried.
> 
> Thoughts?

I'm fine with this, we are now coherent between libxl, the Xen command
line cpuid= option and the output of xen-cpuid.

> 
> v3:
>  * Rework somewhat.
>  * Insert aliases of common_1d.
> ---
>  tools/misc/xen-cpuid.c | 15 ++++++---------
>  xen/tools/gen-cpuid.py | 21 +++++++++++++++++++++
>  2 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index 6ee835b22949..2f34694e9c57 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -11,6 +11,7 @@
>  #include <xenguest.h>
>  
>  #include <xen-tools/common-macros.h>
> +#include <xen/lib/x86/cpuid-autogen.h>
>  
>  static uint32_t nr_features;
>  
> @@ -268,7 +269,7 @@ static const struct {
>      const char *name;
>      const char *abbr;
>      const char *const *strs;
> -} leaf_info[] = {
> +} leaf_info[FEATURESET_NR_ENTRIES] = {

Won't it be best to not specify the number of array elements here, as
we could then use a BUILD_BUG_ON() to detect when new leafs are added
to the featureset and thus adjust xen-cpuid.c?  Otherwise new
additions to the featureset will go unnoticed.

>      { "CPUID 0x00000001.edx",        "1d", str_1d },
>      { "CPUID 0x00000001.ecx",        "1c", str_1c },
>      { "CPUID 0x80000001.edx",       "e1d", str_e1d },
> @@ -291,6 +292,9 @@ static const struct {
>  
>  #define COL_ALIGN "24"
>  
> +static const char *const feature_names[(FEATURESET_NR_ENTRIES + 1) << 5] =
> +    INIT_FEATURE_VAL_TO_NAME;

I've also considered this when doing the original patch, but it seemed
worse to force each user of INIT_FEATURE_VAL_TO_NAME to have to
correctly size the array.  I would also use '* 32', as it's IMO
clearer and already used below when accessing the array.  I'm fine
if we want to go this way, but the extra Python code to add a last
array entry if required didn't seem that much TBH.

> +
>  static const char *const fs_names[] = {
>      [XEN_SYSCTL_cpu_featureset_raw]     = "Raw",
>      [XEN_SYSCTL_cpu_featureset_host]    = "Host",
> @@ -304,12 +308,6 @@ static void dump_leaf(uint32_t leaf, const char *const *strs)
>  {
>      unsigned i;
>  
> -    if ( !strs )
> -    {
> -        printf(" ???");
> -        return;
> -    }
> -
>      for ( i = 0; i < 32; ++i )
>          if ( leaf & (1u << i) )
>          {
> @@ -338,8 +336,7 @@ static void decode_featureset(const uint32_t *features,
>      for ( i = 0; i < length && i < ARRAY_SIZE(leaf_info); ++i )
>      {
>          printf("  [%02u] %-"COL_ALIGN"s", i, leaf_info[i].name ?: "<UNKNOWN>");
> -        if ( leaf_info[i].name )
> -            dump_leaf(features[i], leaf_info[i].strs);
> +        dump_leaf(features[i], &feature_names[i * 32]);
>          printf("\n");
>      }
>  }
> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
> index 79d7f5c8e1c9..d0bb2e4a229f 100755
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -470,6 +470,27 @@ def write_results(state):
>      state.output.write(
>  """}
>  
> +""")
> +
> +    state.output.write(
> +"""
> +#define INIT_FEATURE_VAL_TO_NAME { \\
> +""")
> +
> +    for name, bit in sorted(state.values.items()):
> +        state.output.write(
> +            '    [%s] = "%s",\\\n' % (bit, name)
> +            )
> +
> +        # Add the other alias for 1d/e1d common bits
> +        if bit in state.common_1d:
> +            state.output.write(
> +                '    [%s] = "%s",\\\n' % (64 + bit, name)
> +            )

Had no idea we had this aliases.

Thanks, Roger.

