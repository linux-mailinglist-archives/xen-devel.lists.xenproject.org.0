Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240898CA0B8
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 18:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726269.1130533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s95ta-0000Tp-HP; Mon, 20 May 2024 16:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726269.1130533; Mon, 20 May 2024 16:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s95tZ-0000St-Pp; Mon, 20 May 2024 16:29:53 +0000
Received: by outflank-mailman (input) for mailman id 726269;
 Mon, 20 May 2024 16:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ccuw=MX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s95tW-0000RK-Dp
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 16:29:50 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c445b1c-16c6-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 18:29:48 +0200 (CEST)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-43e0d564136so20261491cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 09:29:48 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df56d1a08sm147928111cf.88.2024.05.20.09.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 09:29:46 -0700 (PDT)
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
X-Inumbo-ID: 2c445b1c-16c6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716222587; x=1716827387; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q8tpl4lSMojgasGzV7D0LbOdJ5uTqQcYaymY/DPHWB8=;
        b=MMTs3YnjU8u95k35ZmzBtn+Dq/r9shIGAm3yhC/B2brwzSwcHoUSZlQEwfSj6Yi1/G
         FpgyDEDJtC6wjubDvFKxF+ctuhuAlk+Tc8okwnsKqwLrhTIX0JoNjlooOUfIANViF/3D
         8GjjX5WC4JJFD6hopK7umtSWvRNkaQ5DTCiBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716222587; x=1716827387;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q8tpl4lSMojgasGzV7D0LbOdJ5uTqQcYaymY/DPHWB8=;
        b=kFGKg/8jGLEnIIFeUu6K1bCnPDbKhb+MbwfPx5UXt7vXWqnpZPPLZqerzNJO8D3I3g
         ByxnqrGAfxbBoLJyh56UieLzzkgGIwXM0qOwPuo44Hfv84xV2RJJ95NgXt99IqhF4IY9
         gUbFOm/m8V9dIQsIK6Tw5J8fKMCXV/HUHUbI9EUL/f696l9RZzOSSVzy3SPBgaF7vzB5
         pK7EbPYTp7u5+XwwZ8ZirGTRt8One1uJ60lYiruNxpVsEd6Mq/kIib0BajIeZOQnpHr5
         rw4sMDrbRThGFt/bSFskEUa2kZ6J21xiEFndj8TZZYUxr5KrAEe4tIjYfMWuCfFgs/WB
         3cAg==
X-Gm-Message-State: AOJu0Ywa2KS8aptRiFhI5WjWMgEl6QTb/GU0vXKR3SWSb0w9xqqp8nWm
	yUP3Qi3edQ9gH2kne5cVxBAKE0ke29Nbnbmf9IOVQQjhFrs1dqiRLGd+xUmDbH8=
X-Google-Smtp-Source: AGHT+IHEVtbC6Rmlv4/Z9agFhnsFmtIBCLzfdGXNbF/Q+f6aVQyS+8/JZxYdg2Eyf8e/oWMk0W78jg==
X-Received: by 2002:a05:622a:13ce:b0:43e:1ae6:dcec with SMTP id d75a77b69052e-43e1ae6def1mr268556121cf.55.1716222586735;
        Mon, 20 May 2024 09:29:46 -0700 (PDT)
Date: Mon, 20 May 2024 18:29:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH v3.5 3/4] tools/xen-cpuid: Use automatically generated
 feature names
Message-ID: <Zkt6eHDYqNCOdgud@macbook>
References: <20240510224002.2324578-4-andrew.cooper3@citrix.com>
 <20240520143359.3376849-1-andrew.cooper3@citrix.com>
 <ZktnJ7XNxhdLOxdk@macbook>
 <32c1b1b0-6372-4c15-bf0a-cb946df236f5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32c1b1b0-6372-4c15-bf0a-cb946df236f5@citrix.com>

On Mon, May 20, 2024 at 04:20:37PM +0100, Andrew Cooper wrote:
> On 20/05/2024 4:07 pm, Roger Pau Monné wrote:
> > On Mon, May 20, 2024 at 03:33:59PM +0100, Andrew Cooper wrote:
> >> From: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Have gen-cpuid.py write out INIT_FEATURE_VAL_TO_NAME, derived from the same
> >> data source as INIT_FEATURE_NAME_TO_VAL, although both aliases of common_1d
> >> are needed.
> >>
> >> In xen-cpuid.c, sanity check at build time that leaf_info[] and
> >> feature_names[] are of sensible length.
> >>
> >> As dump_leaf() rendered missing names as numbers, always dump leaves even if
> >> we don't have the leaf name.  This conversion was argumably missed in commit
> >> 59afdb8a81d6 ("tools/misc: Tweak reserved bit handling for xen-cpuid").
> >>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >
> > Just one question below.
> >
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Differences in names are:
> >>
> >>  sysenter    -> sep
> >>  tm          -> tm1
> >>  ds-cpl      -> dscpl
> >>  est         -> eist
> >>  sse41       -> sse4-1
> >>  sse42       -> sse4-2
> >>  movebe      -> movbe
> >>  tsc-dl      -> tsc-deadline
> >>  rdrnd       -> rdrand
> >>  hyper       -> hypervisor
> >>  mmx+        -> mmext
> >>  fxsr+       -> ffxsr
> >>  pg1g        -> page1gb
> >>  3dnow+      -> 3dnowext
> >>  cmp         -> cmp-legacy
> >>  cr8d        -> cr8-legacy
> >>  lzcnt       -> abm
> >>  msse        -> misalignsse
> >>  3dnowpf     -> 3dnowprefetch
> >>  nodeid      -> nodeid-msr
> >>  dbx         -> dbext
> >>  tsc-adj     -> tsc-adjust
> >>  fdp-exn     -> fdp-excp-only
> >>  deffp       -> no-fpu-sel
> >>  <24>        -> bld
> >>  ppin        -> amd-ppin
> >>  lfence+     -> lfence-dispatch
> >>  ppin        -> intel-ppin
> >>  energy-ctrl -> energy-filtering
> >>
> >> Apparently BLD missed the update to xen-cpuid.c.  It appears to be the only
> >> one.  Several of the + names would be nice to keep as were, but doing so isn't
> >> nice in gen-cpuid.  Any changes would alter the {dom0-}cpuid= cmdline options,
> >> but we intentionally don't list them, so I'm not worried.
> >>
> >> Thoughts?
> >>
> >> v3:
> >>  * Rework somewhat.
> >>  * Insert aliases of common_1d.
> >>
> >> v4:
> >>  * Pad at the gen stage.  I don't like this, but I'm clearly outvoted on the matter.
> >> ---
> >>  tools/misc/xen-cpuid.c | 16 ++++++++--------
> >>  xen/tools/gen-cpuid.py | 29 +++++++++++++++++++++++++++++
> >>  2 files changed, 37 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> >> index 6ee835b22949..51009683da1b 100644
> >> --- a/tools/misc/xen-cpuid.c
> >> +++ b/tools/misc/xen-cpuid.c
> >> @@ -11,6 +11,7 @@
> >>  #include <xenguest.h>
> >>  
> >>  #include <xen-tools/common-macros.h>
> >> +#include <xen/lib/x86/cpuid-autogen.h>
> >>  
> >>  static uint32_t nr_features;
> >>  
> >> @@ -291,6 +292,8 @@ static const struct {
> >>  
> >>  #define COL_ALIGN "24"
> >>  
> >> +static const char *const feature_names[] = INIT_FEATURE_VAL_TO_NAME;
> >> +
> >>  static const char *const fs_names[] = {
> >>      [XEN_SYSCTL_cpu_featureset_raw]     = "Raw",
> >>      [XEN_SYSCTL_cpu_featureset_host]    = "Host",
> >> @@ -304,12 +307,6 @@ static void dump_leaf(uint32_t leaf, const char *const *strs)
> >>  {
> >>      unsigned i;
> >>  
> >> -    if ( !strs )
> >> -    {
> >> -        printf(" ???");
> >> -        return;
> >> -    }
> >> -
> >>      for ( i = 0; i < 32; ++i )
> >>          if ( leaf & (1u << i) )
> >>          {
> >> @@ -327,6 +324,10 @@ static void decode_featureset(const uint32_t *features,
> >>  {
> >>      unsigned int i;
> >>  
> >> +    /* If this trips, you probably need to extend leaf_info[] above. */
> >> +    BUILD_BUG_ON(ARRAY_SIZE(leaf_info) != FEATURESET_NR_ENTRIES);
> >> +    BUILD_BUG_ON(ARRAY_SIZE(feature_names) != FEATURESET_NR_ENTRIES * 32);
> >> +
> >>      printf("%-"COL_ALIGN"s        ", name);
> >>      for ( i = 0; i < length; ++i )
> >>          printf("%08x%c", features[i],
> >> @@ -338,8 +339,7 @@ static void decode_featureset(const uint32_t *features,
> >>      for ( i = 0; i < length && i < ARRAY_SIZE(leaf_info); ++i )
> >>      {
> >>          printf("  [%02u] %-"COL_ALIGN"s", i, leaf_info[i].name ?: "<UNKNOWN>");
> >> -        if ( leaf_info[i].name )
> >> -            dump_leaf(features[i], leaf_info[i].strs);
> >> +        dump_leaf(features[i], &feature_names[i * 32]);
> >>          printf("\n");
> >>      }
> >>  }
> >> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
> >> index 79d7f5c8e1c9..601eec608983 100755
> >> --- a/xen/tools/gen-cpuid.py
> >> +++ b/xen/tools/gen-cpuid.py
> >> @@ -470,6 +470,35 @@ def write_results(state):
> >>      state.output.write(
> >>  """}
> >>  
> >> +""")
> >> +
> >> +    state.output.write(
> >> +"""
> >> +#define INIT_FEATURE_VAL_TO_NAME { \\
> >> +""")
> >> +
> >> +    for name, bit in sorted(state.values.items()):
> >> +        state.output.write(
> >> +            '    [%s] = "%s",\\\n' % (bit, name)
> >> +            )
> >> +
> >> +        # Add the other alias for 1d/e1d common bits.  64 is the difference
> >> +        # between 1d and e1d.
> >> +        if bit in state.common_1d:
> >> +            state.output.write(
> >> +                '    [%s] = "%s",\\\n' % (64 + bit, name)
> >> +            )
> >> +
> >> +    # Pad to an exact multiple of FEATURESET_SIZE if necessary
> >> +    pad_feat = state.nr_entries * 32 - 1
> >> +    if not state.names.get(pad_feat):
> >> +        state.output.write(
> >> +            '    [%s] = NULL,\\\n' % (pad_feat, )
> > One likely stupid question, but since my understanding of Python is
> > very limited, why do you add the comma after pad_feat?  There's no
> > other parameter to print.
> 
> It's a common python gotcha with %.
> 
> >>> a = (1, 2)
> >>> "%s" % a
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
> TypeError: not all arguments converted during string formatting
> >>> "%s" % (a, )
> '(1, 2)'

Right, but just using:

>>> "%s" % (a)

Should still be fine?

Thanks, Roger.

