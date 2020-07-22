Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767B92294DE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 11:27:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyB1i-0005IQ-A4; Wed, 22 Jul 2020 09:27:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhkO=BB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyB1h-0005IK-F8
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 09:27:01 +0000
X-Inumbo-ID: 7e2012f9-cbfd-11ea-a18b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e2012f9-cbfd-11ea-a18b-12813bfff9fa;
 Wed, 22 Jul 2020 09:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595410019;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7Fh+rbQRNUDa5+zTNfQkKP5c8nCwbqcsybA1Fs/VMkE=;
 b=VdfX5AM8kykQcdHmCxzyuPfsHzRCMHi2Qu21SCfQfHMsI3UNPatApbMf
 RvJwzug/apTzSQ26/4sg2NK9TSuv9wKnPT12qKDJ03+q/xH+Q7PmZvEp/
 a3B/JpHH1xD/WyPHq0Qa59vdzD5CZa7TjwtOzdOTBT1/ZircrnxdXp7tl Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: SYhqokHk6IZqp1JRLHu7qyVJSgE1GtzJ5WbNDFoveD3u/yVDeOGtCQrV3j0wf5iDu9VhFjZmYV
 Gg7Tb4sYMs5anILBqb2ZGTNI5Eg4A936gRhGq/4v/ISlUj2pk3Y43EASpnL6jHfUR03InhN4zU
 pW4P3Xd0/rlCDQ4wb4SFKk3ovSDT2mGeisT8n3tuYGby+FFtHdhxTy1HseWBBmPu5KZVg6CSp6
 HCXyyvf2oPKWpm8TgjXNsb/2my6P375KdWTdjxcG7umEhFsl7f1Ub/GR8CZFLgHFwHiVsin1Vd
 mfE=
X-SBRS: 2.7
X-MesageID: 23249252
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23249252"
Date: Wed, 22 Jul 2020 11:26:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/svm: Fold nsvm_{wr,rd}msr() into
 svm_msr_{read,write}_intercept()
Message-ID: <20200722092653.GV7191@Air-de-Roger>
References: <20200721172208.12176-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200721172208.12176-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 21, 2020 at 06:22:08PM +0100, Andrew Cooper wrote:
> ... to simplify the default cases.
> 
> There are multiple errors with the handling of these three MSRs, but they are
> deliberately not addressed this point.
                            ^ at
> 
> This removes the dance converting -1/0/1 into X86EMUL_*, allowing for the
> removal of the 'ret' variable.
> 
> While cleaning this up, drop the gdprintk()'s for #GP conditions, and the
> 'result' variable from svm_msr_write_intercept() is it is never modified.
                                                   ^ extra is
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I've got one question (not really patch related).

> @@ -1956,10 +1962,10 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>  
>  static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>  {
> -    int ret, result = X86EMUL_OKAY;
>      struct vcpu *v = current;
>      struct domain *d = v->domain;
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
> +    struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
>  
>      switch ( msr )
>      {
> @@ -2085,6 +2091,22 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>              goto gpf;
>          break;
>  
> +    case MSR_K8_VM_CR:
> +        /* ignore write. handle all bits as read-only. */
> +        break;
> +
> +    case MSR_K8_VM_HSAVE_PA:
> +        if ( (msr_content & ~PAGE_MASK) || msr_content > 0xfd00000000ULL )

Regarding the address check, the PM states "the maximum supported
physical address for this implementation", but I don't seem to be able
to find where is this actually announced.

Roger.

