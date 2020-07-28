Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E86230CC1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 16:52:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Qwp-0007Ek-Hh; Tue, 28 Jul 2020 14:51:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0Qwo-0007Ec-CR
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 14:51:18 +0000
X-Inumbo-ID: c81c34d5-d0e1-11ea-a904-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c81c34d5-d0e1-11ea-a904-12813bfff9fa;
 Tue, 28 Jul 2020 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595947875;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lv7DvAEAMGAuUxfBUUIinPORNQOh3EyicsTN4QUqkR8=;
 b=YyMTsLsXhjTUNaxqdSZ44Z2u0eF/+KO4mjPkTB5z/OmSsmbjYR+URdzK
 uJPmiruWtiwF+Xf3vTdtGmvyg+BN7QjCvDOyTOrYojZLppOsNWtueNjS+
 iULck9bYrcocbJo9R9X+Cma3dUCFXNzx7eERe4fX+7GKz8rZ6gmJuvOV+ E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cebk8yMFoerV6c2w4zkT4m0X7eegtucwket3KNbUL0/kr50xR0JwdhLCZD+PPifBH7BwUNUZ1T
 RtLsUrT6mGQZYC1kOyD9GxrVHePVy9pbHVdB0DFYaslkTR4hv7+yYERxpZV2MEU/64pe/v6Yc1
 34RtyDQe8bA8G3hLAOPrK1nVlQLEI1l60zFBxcvf/mDfU3qr0xaOdHK+Svejsrj/D0bFG6SDnh
 G5AgrmGnMh93SLi4txo+gTRX7oZjN4TM+PI0qh0aWKLGqQejU3l+ZxF7z+48Pixh6wxhN1qPXX
 Glg=
X-SBRS: 2.7
X-MesageID: 23349954
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23349954"
Subject: Re: [PATCH 3/4] x86: drop ASM_{CL,ST}AC
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <048c3702-f0b0-6f8e-341e-bec6cfaded27@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <07750e83-6b9d-a88d-856b-20db4f63fd11@citrix.com>
Date: Tue, 28 Jul 2020 15:51:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <048c3702-f0b0-6f8e-341e-bec6cfaded27@suse.com>
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

On 15/07/2020 11:49, Jan Beulich wrote:
> Use ALTERNATIVE directly, such that at the use sites it is visible that
> alternative code patching is in use. Similarly avoid hiding the fact in
> SAVE_ALL.
>
> No change to generated code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Definitely +1 to not hiding the STAC/CLAC in SAVE_ALL.  I've been
meaning to undo that mistake for ages.

OOI, what made you change your mind?  I'm pleased that you have.

>
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2165,9 +2165,9 @@ void activate_debugregs(const struct vcp
>  void asm_domain_crash_synchronous(unsigned long addr)
>  {
>      /*
> -     * We need clear AC bit here because in entry.S AC is set
> -     * by ASM_STAC to temporarily allow accesses to user pages
> -     * which is prevented by SMAP by default.
> +     * We need to clear AC bit here because in entry.S it gets set to
> +     * temporarily allow accesses to user pages which is prevented by
> +     * SMAP by default.

As you're adjusting the text, It should read "We need to clear the AC
bit ..."

But I also think it would be clearer to say that exception fixup may
leave user access enabled, which we fix up here by unconditionally
disabling user access.

Preferably with this rewritten, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

