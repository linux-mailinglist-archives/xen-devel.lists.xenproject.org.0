Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397D777924F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 17:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582576.912406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTby-0004cz-4u; Fri, 11 Aug 2023 14:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582576.912406; Fri, 11 Aug 2023 14:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTby-0004af-1X; Fri, 11 Aug 2023 14:59:34 +0000
Received: by outflank-mailman (input) for mailman id 582576;
 Fri, 11 Aug 2023 14:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hSUX=D4=citrix.com=prvs=58088f632=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qUTbw-0004aZ-3x
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 14:59:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e2edecc-3857-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 16:59:07 +0200 (CEST)
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
X-Inumbo-ID: 9e2edecc-3857-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691765948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eV+onJLZ42IXAZhMR42At7JQvu6sYpBJQneOG7gwK3s=;
  b=bB6hMbEO7CgyjTBfs4YXLoYQRBV+z3BXmQ0QBvJPpM01U6f0b+jRa30K
   l2L4giLgB4hltnejK70A27ZoUPwbbemX+i8F3aOUu/4pTVjdN1rbACu7g
   r57kqJv0ZgRQqbib2Kfk7Di1x+1ARmw0wis3ggGyILjo9FkCm8dsCdnIz
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119257033
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:LF/PbKIRzhNLeQXqFE+R+JUlxSXFcZb7ZxGr2PjKsXjdYENSgWQEn
 WVJCm3Xb/zZazGgKNwlPoXl80pSvMPWn9U3T1dlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gVnPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4tUXxW0
 r84AQxcZxmaxMWt+6ChePtj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJQPwxnA/
 TmuE2LRXg9Lc+XAkBy8/GPwpLPSzT32fJ5OG+jtnhJtqALKnTFCYPEMbnO5q/Skjk+1W/pEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAbShZRZdpgs9U5LRQjz
 lKTlsnlLSBuuraSD3ma89+pQSiaYHZPazVYPGldEFVDuoO4yG0usv7RZowzDbaSzf3cJWD5y
 inJizMFla8hn8Fegs1X4mv7qz6ro5HISCs86QPWQn+p42tFWWK1W2C7wQOFtKgdde51WnHE5
 SFZwJbGsIjiGLnXzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meJ5Wu9B7cJZhNGiJObhKrgY/nGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhha
 M7FIJz2UidEVP8PIN+KqwE1i+BDKscWnzm7eHwG507/jer2iIC9Ft/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnC/zGLnFnhTdSJTLcmv+6RqmhurflIO9JcJV6WAntvMuuVNw8xoqws/1
 i3kAhAJkgav3iGvxMfjQikLVY4DlK1X9RoTVRHA937xs5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:3M1NbatleHRYQ/yRgMoKAiBB7skDUNV00zEX/kB9WHVpm5Sj5q
 eTdYcgpHnJYVcqKQsdcL+7Scq9qB/nmaKdpLNhWYtKPzOWxVdATrsSj7cKqgeIc0aVm9K1l5
 0QFpSWYOeAcWSS5vyV3ODMKbYdKa68kZxA692w85+wJTsaFJ2IpD0JczpzWncGPDWuK6BJb6
 ah2g==
X-Talos-CUID: =?us-ascii?q?9a23=3APWQ0mWjU2l6XzL89YCId00nTIDJuKC3A1FCTA2a?=
 =?us-ascii?q?EWG9gUf6yUmSC4pF2nJ87?=
X-Talos-MUID: 9a23:CKeTHQooZrTNkK2aUZMez218ZYBRvP2IMU4czbdappmaOAhsZzjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,165,1684814400"; 
   d="scan'208";a="119257033"
Date: Fri, 11 Aug 2023 15:59:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 3/5] x86: allow Kconfig control over psABI level
Message-ID: <810a0e2b-0cb4-4b48-ad3f-dff323efd20c@perard>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
 <3c819879-d113-facd-b025-b062e68bb6a1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3c819879-d113-facd-b025-b062e68bb6a1@suse.com>

On Wed, Jul 26, 2023 at 12:34:15PM +0200, Jan Beulich wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -118,6 +118,36 @@ config HVM
>  
>  	  If unsure, say Y.
>  
> +choice
> +	prompt "base psABI level"
> +	default X86_64_BASELINE
> +	help
> +	  The psABI defines 4 levels of ISA extension sets as a coarse granular
> +	  way of identifying advanced functionality that would be uniformly
> +	  available in respectively newer hardware.  While v4 is not really of
> +	  interest for Xen, the others can be selected here, making the
> +	  resulting Xen no longer work on older hardware.  This option won't
> +	  have any effect if the toolchain doesn't support the distinction.
> +
> +	  If unsure, stick to the default.
> +
> +config X86_64_BASELINE
> +	bool "baseline"
> +
> +config X86_64_V2
> +	bool "v2"
> +	help
> +	  This enables POPCNT and CX16, besides other extensions which are of
> +	  no interest here.
> +
> +config X86_64_V3
> +	bool "v3"
> +	help
> +	  This enables BMI, BMI2, LZCNT, MOVBE, and XSAVE, besides other
> +	  extensions which are of no interest here.
> +
> +endchoice
> +
>  config XEN_SHSTK
>  	bool "Supervisor Shadow Stacks"
>  	depends on HAS_AS_CET_SS
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -36,6 +36,29 @@ CFLAGS += -mno-red-zone -fpic
>  # the SSE setup for variadic function calls.
>  CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
>  
> +# Enable the selected baseline ABI, if supported by the compiler.
> +x86-64-$(CONFIG_X86_64_BASELINE) :=
> +x86-64-$(CONFIG_X86_64_V2) := x86-64-v2
> +x86-64-$(CONFIG_X86_64_V3) := x86-64-v3
> +
> +ifneq ($(x86-64-y),)
> +CFLAGS-psabi := $(call cc-option,$(CC),-march=$(x86-64-y))
> +
> +ifeq ($(CFLAGS-psabi),)
> +# Fall back to using the subset of -m... options that are of interest.
> +x86-64-v2 := -mpopcnt -mcx16
> +x86-64-v3 := $(x86-64-v2) -mbmi -mbmi2 -mlzcnt -mmovbe -mxsave
> +$(call cc-options-add,CFLAGS-psabi,CC,$($(x86-64-y)))
> +
> +ifneq ($(strip $(CFLAGS-psabi)),$($(x86-64-y)))
> +$(warning Options not recognized by $(CC): $(filter-out $(CFLAGS-psabi),$($(x86-64-y))))
> +XEN_CONFIG_UNSATISFIED += X86_64_Vn

I think I understand Andrew's point on the previous version of this
patch. Here, we barely just print a warning if the compiler isn't
capable to do what we ask, then do the build and maybe print something
after the fact. So we can end up with a build of Xen with an embedded
.config which says X86_64_V3 where in fact it's only a build with the
baseline ABI.

Can't we just fail the build right here instead?

I don't see any need to let Kconfig know if the compiler can do
x86-64-vX or not, beside only presenting actual available options in
`make *config`, and it would override options selected by editing
.config directly.

> +endif
> +endif # CFLAGS-psabi
> +
> +CFLAGS += $(CFLAGS-psabi)
> +endif # x86-64-y

Cheers,

-- 
Anthony PERARD

