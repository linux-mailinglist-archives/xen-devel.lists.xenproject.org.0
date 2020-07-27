Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7583322F321
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 16:56:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k04XQ-0002m2-1k; Mon, 27 Jul 2020 14:55:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k04XP-0002lx-2l
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:55:35 +0000
X-Inumbo-ID: 38b20d64-d019-11ea-a787-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38b20d64-d019-11ea-a787-12813bfff9fa;
 Mon, 27 Jul 2020 14:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595861733;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TSQx4u/NB3+tiEqbPj9WfpMigBdq193jCABaybi7IOc=;
 b=ci665bOPwfWbRFHFlxaWOVs7PbEqF+3fIz9/u0UM+yh8VNzyDrms7Opf
 4g2oInyhm1NKN/bDyymVRGSZMi756Y6aU0BygAbaCR0KMvf4X7vXS23ED
 1KsdquJUOade/rLi3KoCHoyzCRJDUNz2Qdp/jZPGaWigrxvisljVrRp0+ E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sD/fboHLkvKPD/flZmpPerZr3r9zoVp7Mwe5Y0h5eJWSW5XHrSIaYszpgAu71QsZK6KtzIyGtm
 UxSE2OYt6SR7zgYx+tMaf+ZqwCwCDDtnWKVIcxFi+FMJeWC8s04B/pIQ6oehhKb6fzxLCBOQez
 DT/xnmXYufLK6490aoO81YgyL8A14npC8iEx2h+VWai/huuEnk2gq7nETOAKP3TrFbUTUvZ/Bm
 2ZucoCdEBQMN/t7RyXhYBtGu+BJ91uFKfYc1IdkWp9YietdSE/zcmccIu1oklFY4CeyUHcU/BF
 bk4=
X-SBRS: 2.7
X-MesageID: 23592628
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23592628"
Date: Mon, 27 Jul 2020 16:55:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/4] x86: replace __ASM_{CL,ST}AC
Message-ID: <20200727145526.GR7191@Air-de-Roger>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 12:48:14PM +0200, Jan Beulich wrote:
> Introduce proper assembler macros instead, enabled only when the
> assembler itself doesn't support the insns. To avoid duplicating the
> macros for assembly and C files, have them processed into asm-macros.h.
> This in turn requires adding a multiple inclusion guard when generating
> that header.
> 
> No change to generated code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -235,7 +235,10 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
>  	echo '#if 0' >$@.new
>  	echo '.if 0' >>$@.new
>  	echo '#endif' >>$@.new
> +	echo '#ifndef __ASM_MACROS_H__' >>$@.new
> +	echo '#define __ASM_MACROS_H__' >>$@.new
>  	echo 'asm ( ".include \"$@\"" );' >>$@.new
> +	echo '#endif /* __ASM_MACROS_H__ */' >>$@.new
>  	echo '#if 0' >>$@.new
>  	echo '.endif' >>$@.new
>  	cat $< >>$@.new
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -20,6 +20,7 @@ $(call as-option-add,CFLAGS,CC,"rdrand %
>  $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
>  $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
>  $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
> +$(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
>  $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
>  $(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1",-DHAVE_AS_QUOTED_SYM)
>  $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
> --- a/xen/arch/x86/asm-macros.c
> +++ b/xen/arch/x86/asm-macros.c
> @@ -1 +1,2 @@
> +#include <asm/asm-defns.h>
>  #include <asm/alternative-asm.h>
> --- /dev/null
> +++ b/xen/include/asm-x86/asm-defns.h

Maybe this could be asm-insn.h or a different name? I find it
confusing to have asm-defns.h and an asm_defs.h.

Thanks, Roger.

