Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294372DFF8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548089.855869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91WH-0003aL-FX; Tue, 13 Jun 2023 10:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548089.855869; Tue, 13 Jun 2023 10:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91WH-0003YO-CF; Tue, 13 Jun 2023 10:45:01 +0000
Received: by outflank-mailman (input) for mailman id 548089;
 Tue, 13 Jun 2023 10:45:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ia/t=CB=citrix.com=prvs=5214cf225=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q91WG-0003YG-3K
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:45:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5688c962-09d7-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:44:58 +0200 (CEST)
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
X-Inumbo-ID: 5688c962-09d7-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686653098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wv/yieXc82E/9t9ufUCmJ/IkmPK3be34y9oKIDK6L9M=;
  b=fmUwAFUBHuzNfuFLuDkYBw7m3PLy8lyI35XZ7CJilWCbhZJj9F0z3q/B
   EuV6qVfWeknvxVs2buNNgRmULxA8hfEUEKM1kfg8cYaGQM0O+SjxKBLA3
   gEuWRIWMD6E9SGVHDE2uDA62jX+Fwl2TdMudKarzb19OkAT3759tYNZxM
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 115113014
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:TAGOCaPutlPNOoXvrR22l8FynXyQoLVcMsEvi/4bfWQNrUol3zMCx
 mQfW2vVPq2LYDCmKIpybd+x/BxQ6MPXyYdiSAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0r4vMGAWz
 uUjEiIyTS+Iu9Du/rTmV/Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTGJwMxR7B+
 goq+Uz6MiExP8C9zwHZ/1e1vs3QrSD0A60rQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasoRo0S9dWVeog52mlyKXO5B2CLnMZVTMHY9sj3Oc/XTEw3
 0WFt8/oDzdo9raSTBqgGqy89G3of3JPdClbOHFCFFFeizX+nG0tpkqXf9c7K7eOtM/KOg77/
 wLSki5jmqpG2KbnyJ6HEUD7byOE/8aZEFBvul2IAgpJ/SsiOtf7OtXABUzzqK8Zcd3HFgTpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKRBaJxslcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIoQP8ktK1TWoHE3DaJ144wLuBJ0+U3YE
 c3CGftA8F5AUfg3pNZIb7p1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PXBt3VGJis+V2Pm
 /4Gbpvi9vmqeLGmCsUh2dJJfA9iwLlSLcyelvG7gcbafVM8RD98UaaMqV7jEqQ895loei7z1
 inVcidlJJDX3xUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:SYiBUKtWg5Onsm/yP6ShMIir7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: =?us-ascii?q?9a23=3AcOHotmkdGCzmfINRwRI45kJzH4TXOSWF/XaIGFa?=
 =?us-ascii?q?DM3RWa4KedW3IxqU5jtU7zg=3D=3D?=
X-Talos-MUID: 9a23:8yPahQVyEvm6d3bq/DzctBppKOVu2PijLVk1s4o2uMbfGhUlbg==
X-IronPort-AV: E=Sophos;i="6.00,239,1681185600"; 
   d="scan'208";a="115113014"
Date: Tue, 13 Jun 2023 11:44:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libs/light: use the cpuid feature names from
 cpufeatureset.h
Message-ID: <cab94580-70cc-4f9e-9da1-4830ba7eaf13@perard>
References: <20230605103657.14191-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605103657.14191-1-roger.pau@citrix.com>

On Mon, Jun 05, 2023 at 12:36:57PM +0200, Roger Pau Monne wrote:
> The current implementation in libxl_cpuid_parse_config() requires
> keeping a list of cpuid feature bits that should be mostly in sync
> with the contents of cpufeatureset.h.
> 
> Avoid such duplication by using the automatically generated list of
> cpuid features in INIT_FEATURE_NAMES in order to map feature names to
> featureset bits, and then translate from featureset bits into cpuid
> leaf, subleaf, register tuple.
> 
> Note that the full contents of the previous cpuid translation table
> can't be removed.  That's because some feature names allowed by libxl
> are not described in the featuresets, or because naming has diverged
> and the previous nomenclature is preserved for compatibility reasons.
> 
> Should result in no functional change observed by callers, albeit some
> new cpuid features will be available as a result of the change.

I've looked at the removed lists, and some cpuid flag name might be
missing with this patch.

When looking in "libxl_cpuid.c" and
tools/include/xen/lib/x86/cpuid-autogen.h (INIT_FEATURE_NAMES), I found
that some flags removed from libxl_cpuid.c seems to be missing with this
patch:
    "sse4_1"
    "sse4_2"
    "tsc_adjust"
    "cmt"

I did the same with the list removed from the man page, and those
flags are missing (some were probably also missing before, so probably
not a problem:
    "avx512ifma"
    "avx512vbmi"
    "cmt"
    "sse4_1"
    "sse4_2"
    "tsc_adjust"


So, at least for the first list, is it a problem? Or did I failed to
check them properly?
(It seems that "cmt" or "tsc_adjust" for example comes from libvirt,
90b2a267c19c ("libxl: add more cpuid flags handling"))

> While there constify cpuid_flags name field.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 24ac92718288..c5c5b8716521 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2010,24 +2010,12 @@ proccount procpkg stepping
>  
>  =back
>  
> -List of keys taking a character:
> +List of keys taking a character can be found in the public header file
> +L<arch-x86/cpufeatureset.h|http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,arch-x86,cpufeatureset.h.html>

https:// ;-)

And this probably want to be "xenbits.xenproject.org"

Also, I think there's maybe an issue with this link. Maybe someone can
assume that "TM1" takes a character, but that flags I think would get
rejected, issue with upper case vs lower case. Then, if we deal with
the casing, we still have feature like "AVX512_IFMA", which would only
be recognize if written "avx512-ifma", so issue with "-" vs "_".

> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> index f5ce9f97959c..0c7ffff416fe 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -342,6 +214,28 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
>          if(!strncmp(str, flag->name, sep - str) && flag->name[sep - str] == 0)
>              break;
>      }
> +    if (flag->name == NULL) {
> +        const struct feature_name *feat;
> +        /* Provide a NUL terminated feature name to the search helper. */
> +        char *name = strndup(str, sep - str);
> +
> +        if (name == NULL)
> +            return 4;

out-of-memory are usually fatal in libxl. Any reason to use `strndup`
instead of `libxl__strndup`? I guess we don't have any libxl_ctx, so we
can't use the libxl function.

So, instead of returning an arbitrary integer that isn't returned yet by
the function, could you return ERROR_NOMEM?

I wonder if it would be possible to use a buffer on the stack instead,
but it might not be worth the effort to find the right size.


Thanks,

-- 
Anthony PERARD

