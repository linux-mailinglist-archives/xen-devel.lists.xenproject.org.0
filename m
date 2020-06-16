Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F361FBBD0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 18:34:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlEX2-0008O0-I2; Tue, 16 Jun 2020 16:33:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlEX0-0008Nu-RU
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 16:33:50 +0000
X-Inumbo-ID: 28335014-afef-11ea-b90a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28335014-afef-11ea-b90a-12813bfff9fa;
 Tue, 16 Jun 2020 16:33:50 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: jvfUrYOHSHCYB4SyXX7FReQKQY91o7NTTvHTsnW662VBvctov+kFwxsETOkvY670lAdyo33LZw
 0tQO24kk7o8O354mi0u06TpEbmDkPL00drRSwluU5u3mlNHsTtfC7CTco9Do5pbtLAqqGjGP9X
 UOgERuqQFShAo1jkpT5Jvebj4gwdzx924Uv+U3AtR69LeD1WkvV+sfmHaOXu/L1aijlH3yBh0C
 cROHPrtgspi//xdXptODyJ63YENPp1TaQyv6PGIbgPd0ZZ5RiCoBU2GLwnI+twRq0YJol/sSSf
 1nw=
X-SBRS: 2.7
X-MesageID: 20533238
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20533238"
Date: Tue, 16 Jun 2020 18:33:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v1 3/7] x86/vmx: add ipt_state as part of vCPU state
Message-ID: <20200616163342.GS735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <350253733.8765869.1592320880975.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <350253733.8765869.1592320880975.JavaMail.zimbra@cert.pl>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 05:21:20PM +0200, Michał Leszczyński wrote:
> Guest IPT state will be preserved across vmentry/vmexit using
> this structure.

I think you should squash this patch with a patch where the structure
it's actually used.

> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/hvm/vmx/vmx.c         |  2 ++
>  xen/include/asm-x86/hvm/vmx/vmcs.h | 10 ++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index a91bbdb798..97104c319e 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -471,6 +471,8 @@ static int vmx_vcpu_initialise(struct vcpu *v)
>  
>      vmx_install_vlapic_mapping(v);
>  
> +    v->arch.hvm.vmx.ipt_state = NULL;

Nit: there's no need to init this to NULL, since the structure is
zeroed on allocation.

Thanks, Roger.

