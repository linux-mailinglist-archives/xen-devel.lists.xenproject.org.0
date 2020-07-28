Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75186230C70
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 16:30:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Qc6-0004rU-Px; Tue, 28 Jul 2020 14:29:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0Qc4-0004rP-PK
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 14:29:52 +0000
X-Inumbo-ID: cbc8e030-d0de-11ea-8b6c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbc8e030-d0de-11ea-8b6c-bc764e2007e4;
 Tue, 28 Jul 2020 14:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595946591;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DU53sn8unujLT4cYR/KYPEYMCvZlJOKY+lGGmICstp0=;
 b=b6KapncVTPjXGaYJHeBGh4sRycbIMQwEcMvHBQHulsJXy0IsrWXYYAA0
 wgv9puwRj7Oio4aI9g8jOHqqNE2vR2xQfQL0ayM0X1HblnIl+pXbWqb3+
 MBxLsB4yOsZYMI8hhHJVePcYIuYuZmpfiRKe1ePyzM8VAOTKaDZC+kMar w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4qN49BupJCa7Xl6rlLMnQJWTmnds5IOcajG79uEVeOJwNtrb85pQZt0FQmHndZnOCafupHIn2S
 y9zh08NWGema4O6Aizuf6zFaT56IzgF+LFJJ4erpkuFr2DD+aJ2kP0J2Ok73fCNLrSBa6O6Ziw
 9bDii9LF1UfE71u2ykVRwjcbat1NuT7LFoDV2xWpupn4+3jeK/GQw30c3Byd+OF8G5D00DWD8+
 vqLUCjmmjyqQqE7AvfWP0iVGLIKybZp9TYNEhwXhthh0R1rvlQBLGOwL01T8trixc7SXYyqJ2A
 OdI=
X-SBRS: 2.7
X-MesageID: 23366191
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23366191"
Subject: Re: [PATCH 2/4] x86: reduce CET-SS related #ifdef-ary
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <58615a18-7f81-c000-d499-1a49f4752879@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5abaf9e1-c7ba-a58c-d735-47430013eb65@citrix.com>
Date: Tue, 28 Jul 2020 15:29:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <58615a18-7f81-c000-d499-1a49f4752879@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/07/2020 11:48, Jan Beulich wrote:
> Commit b586a81b7a90 ("x86/CET: Fix build following c/s 43b98e7190") had
> to introduce a number of #ifdef-s to make the build work with older tool
> chains. Introduce an assembler macro covering for tool chains not
> knowing of CET-SS, allowing some conditionals where just SETSSBSY is the
> problem to be dropped again.
>
> No change to generated code.



>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Now that I've done this I'm not longer sure which direction is better to
> follow: On one hand this introduces dead code (even if just NOPs) into
> CET-SS-disabled builds. Otoh this is a step towards breaking the tool
> chain version dependency of the feature.

The toolchain dependency can't be broken, because of incssp and wrss in C.

There is 0 value and added complexity to trying to partially support
legacy toolchains.  Furthermore, this adds a pile of nops into builds
which have specifically opted out of CONFIG_XEN_SHSTK, which isn't ideal
for embedded usecases.

As a consequence, I think its better to keep things consistent with how
they are now.

One thing I already considered was to make cpu_has_xen_shstk return
false for !CONFIG_XEN_SHSTK, which subsumes at least one hunk in this
change.

> --- a/xen/arch/x86/x86_64/compat/entry.S
> +++ b/xen/arch/x86/x86_64/compat/entry.S
> @@ -198,9 +198,7 @@ ENTRY(cr4_pv32_restore)
>  
>  /* See lstar_enter for entry register state. */
>  ENTRY(cstar_enter)
> -#ifdef CONFIG_XEN_SHSTK
>          ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
> -#endif

I can't currently think of any option better than leaving these ifdef's
in place, other than perhaps

#ifdef CONFIG_XEN_SHSTK
# define MAYBE_SETSSBSY ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
#else
# define MAYBE_SETSSBSY
#endif

and I don't like it much.

The think is that everything present there is semantically relevant
information, and dropping it makes the code worse rather than better.

~Andrew

