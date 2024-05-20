Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683CE8C9F4F
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 17:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726207.1130468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s94bm-0001tj-Jh; Mon, 20 May 2024 15:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726207.1130468; Mon, 20 May 2024 15:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s94bm-0001qd-Gj; Mon, 20 May 2024 15:07:26 +0000
Received: by outflank-mailman (input) for mailman id 726207;
 Mon, 20 May 2024 15:07:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ccuw=MX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s94bl-0001qX-5O
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 15:07:25 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8a17065-16ba-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 17:07:23 +0200 (CEST)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-69cb4a046dfso13415436d6.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 08:07:22 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1ff4c1sm112571356d6.142.2024.05.20.08.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 08:07:21 -0700 (PDT)
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
X-Inumbo-ID: a8a17065-16ba-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716217642; x=1716822442; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hAvSQH9QO0M3arfgY7SM0FYdcrJGZGLBtAnh4EZNkbw=;
        b=fra2TzHnf+tx8/f4XycKTc50SnjnoAxkQkQtAGvcJQSvdnT04nqZE9nR9PApXP4sNa
         wu2Gq8sKgjLUifeQOvK+4SWfvuv9X1DA8gCE1ITJr8rMDF4JTeMZtu/3v1IPowGqeOoT
         dXbDtgCnR8TkMJqYC5n5/D9zWVXPv2OH4W26g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716217642; x=1716822442;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAvSQH9QO0M3arfgY7SM0FYdcrJGZGLBtAnh4EZNkbw=;
        b=PZekkW+PlmjXOqV3mzefH8jdTvSwPGoU9taEqTw9/hlMMaE2rPRFMAVouKrfL6s5cj
         Dg1RTdMyFfcUM1LJnD0Il1y0DsLbiuoNvTRDK0VIdl5YKcubhrAk5HjwndGaAUoiPepL
         UaKBVjU1OPFUKWKGwlM/x7LQzhsqoSTNK8zFPHZ+oMAYRRqJ9/VUYyymngxWf1LjMLPy
         /D56dISwqa3RlPEVDa85XHyKfsLDNLhp7Y+PSMXrZqdrxZ9OSolVBEutR82cMizDMOus
         +TrsBvVK2pGr5u7KoQL9LI9yu+Afmu69UxpBC+6Ip5JZpraJJ3i+ieZ4T9ne9NdSydNR
         0/Zw==
X-Gm-Message-State: AOJu0Ywmy9ShaEY0IZZlNYW44Wyzwycmyu5zkQXSHZL6Tl6cHK92nCJS
	LytMg0b/he+qG1QF55mOz0oPiStOs27eC+56wmSze19e3sn5p2D/iwIiJzC7KOo=
X-Google-Smtp-Source: AGHT+IEM69dVQgUOuHhtNLSnf09CH0jdhMaPrPVb+OBYIjt74e8PkC+iwKf9065OttWuw0lSkWLGpA==
X-Received: by 2002:a05:6214:3a85:b0:6a0:936e:4f93 with SMTP id 6a1803df08f44-6a168243ff1mr362365606d6.60.1716217641435;
        Mon, 20 May 2024 08:07:21 -0700 (PDT)
Date: Mon, 20 May 2024 17:07:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH v3.5 3/4] tools/xen-cpuid: Use automatically generated
 feature names
Message-ID: <ZktnJ7XNxhdLOxdk@macbook>
References: <20240510224002.2324578-4-andrew.cooper3@citrix.com>
 <20240520143359.3376849-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240520143359.3376849-1-andrew.cooper3@citrix.com>

On Mon, May 20, 2024 at 03:33:59PM +0100, Andrew Cooper wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Have gen-cpuid.py write out INIT_FEATURE_VAL_TO_NAME, derived from the same
> data source as INIT_FEATURE_NAME_TO_VAL, although both aliases of common_1d
> are needed.
> 
> In xen-cpuid.c, sanity check at build time that leaf_info[] and
> feature_names[] are of sensible length.
> 
> As dump_leaf() rendered missing names as numbers, always dump leaves even if
> we don't have the leaf name.  This conversion was argumably missed in commit
> 59afdb8a81d6 ("tools/misc: Tweak reserved bit handling for xen-cpuid").
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just one question below.

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
> 
> v3:
>  * Rework somewhat.
>  * Insert aliases of common_1d.
> 
> v4:
>  * Pad at the gen stage.  I don't like this, but I'm clearly outvoted on the matter.
> ---
>  tools/misc/xen-cpuid.c | 16 ++++++++--------
>  xen/tools/gen-cpuid.py | 29 +++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index 6ee835b22949..51009683da1b 100644
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
> @@ -291,6 +292,8 @@ static const struct {
>  
>  #define COL_ALIGN "24"
>  
> +static const char *const feature_names[] = INIT_FEATURE_VAL_TO_NAME;
> +
>  static const char *const fs_names[] = {
>      [XEN_SYSCTL_cpu_featureset_raw]     = "Raw",
>      [XEN_SYSCTL_cpu_featureset_host]    = "Host",
> @@ -304,12 +307,6 @@ static void dump_leaf(uint32_t leaf, const char *const *strs)
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
> @@ -327,6 +324,10 @@ static void decode_featureset(const uint32_t *features,
>  {
>      unsigned int i;
>  
> +    /* If this trips, you probably need to extend leaf_info[] above. */
> +    BUILD_BUG_ON(ARRAY_SIZE(leaf_info) != FEATURESET_NR_ENTRIES);
> +    BUILD_BUG_ON(ARRAY_SIZE(feature_names) != FEATURESET_NR_ENTRIES * 32);
> +
>      printf("%-"COL_ALIGN"s        ", name);
>      for ( i = 0; i < length; ++i )
>          printf("%08x%c", features[i],
> @@ -338,8 +339,7 @@ static void decode_featureset(const uint32_t *features,
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
> index 79d7f5c8e1c9..601eec608983 100755
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -470,6 +470,35 @@ def write_results(state):
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
> +        # Add the other alias for 1d/e1d common bits.  64 is the difference
> +        # between 1d and e1d.
> +        if bit in state.common_1d:
> +            state.output.write(
> +                '    [%s] = "%s",\\\n' % (64 + bit, name)
> +            )
> +
> +    # Pad to an exact multiple of FEATURESET_SIZE if necessary
> +    pad_feat = state.nr_entries * 32 - 1
> +    if not state.names.get(pad_feat):
> +        state.output.write(
> +            '    [%s] = NULL,\\\n' % (pad_feat, )

One likely stupid question, but since my understanding of Python is
very limited, why do you add the comma after pad_feat?  There's no
other parameter to print.

Thanks, Roger.

