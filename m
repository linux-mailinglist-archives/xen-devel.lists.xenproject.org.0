Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE2223DB8D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 18:17:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3iZD-0007Sl-8r; Thu, 06 Aug 2020 16:16:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49j5=BQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3iZC-0007Sg-54
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 16:16:30 +0000
X-Inumbo-ID: 9ae527fb-bd6b-4291-a457-7565521ba2d2
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ae527fb-bd6b-4291-a457-7565521ba2d2;
 Thu, 06 Aug 2020 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596730589;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NOoPReUR2/73mPUGLgNxFVzpf2thMQlw+Cwzermcn7s=;
 b=U1GJQcef+Z4sXqnIGzjjA/yi/zKLjdawKmA65Z4Dqh0KhuDYm/9cA/qu
 heIRpQw8mruLO2LwNi0t5urPIJpiJIMpVgwVO1FITemOfM36ra+LDEl+6
 DD2eXEUpFg9ABPiQfs+5DjoaloEmwn1H5nYDBXnfydn/kE+6PTwOc1H/V U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lV8/toVquaGlHPIi4C9qDuo0g1YwAuDeXM1B2L1YySKCQt6VLuxA4QUjnEmlzk1qXQJkrrY8gg
 gq/y/V5YO4uap0xXiXiPBxXbw5KLJm+cb7cr4rTYObSozSSCU3Ikv2wxXhBBQuh7jKRCqQNVVY
 A4CdBRgbGU9y8RPO8o11Smz0QipUCugvczKK1yJR8k5UVYYT/AwxzMwl2GDMG/3SMztyWvzp64
 B1npECp4EC0S67sw5WPrt5CKGqW/ER0E/NNMMjYP/kNkcsB8CVXORuguN8D7+vdTK5tdB6XAHA
 Suw=
X-SBRS: 3.7
X-MesageID: 24003567
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,441,1589256000"; d="scan'208";a="24003567"
Subject: Re: [PATCH 3/4] build: also check for empty .bss.* in .o -> .init.o
 conversion
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <c99cf808-0710-51b1-c07c-07bf237e22a3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5b2bbc31-0095-c3e2-9e34-20453ea2aa5f@citrix.com>
Date: Thu, 6 Aug 2020 17:16:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c99cf808-0710-51b1-c07c-07bf237e22a3@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/08/2020 10:05, Jan Beulich wrote:
> We're gaining such sections, and like .text.* and .data.* they shouldn't
> be present in objects subject to automatic to-init conversion. Oddly
> enough for quite some time we did have an instance breaking this rule,
> which gets fixed at this occasion, by breaking out the EFI boot
> allocator functions into its own translation unit.
>
> Fixes: c5b9805bc1f7 ("efi: create new early memory allocator")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> This likely has a (weak) dependency on "x86/EFI: sanitize build logic"
> sent several weeks ago, due to the new source file added, as explicit
> dependencies upon the individual objects in x86/Makefile go away there.
>
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -355,7 +355,7 @@ $(TARGET): delete-unfresh-files
>  	$(MAKE) -C tools
>  	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/compile.h
>  	[ -e include/asm ] || ln -sf asm-$(TARGET_ARCH) include/asm
> -	[ -e arch/$(TARGET_ARCH)/efi ] && for f in boot.c runtime.c compat.c efi.h;\
> +	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
>  		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
>  		   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
>  		done; \

Maybe not for this patch, but we need to start removing this (and other)
symlinking in the tree for proper out-of-tree builds to work.

AFAICT, this logic predates both Kconfig and x86's blur into having EFI
support in xen.gz.

Can't we remove all of this by having CONFIG_XEN_PE expressed/selectable
properly in Kconfig, and gathering all the objects normally, rather than
bodging all of common/efi/ through arch/efi/ ?

~Andrew

