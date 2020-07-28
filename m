Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911AD230BD8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 15:55:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Q4S-0001kG-Ju; Tue, 28 Jul 2020 13:55:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0Q4Q-0001kB-Vo
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 13:55:07 +0000
X-Inumbo-ID: f0ae1aaa-d0d9-11ea-8b61-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0ae1aaa-d0d9-11ea-8b61-bc764e2007e4;
 Tue, 28 Jul 2020 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595944505;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dMn9RHv+dPpFytGvedx8MhPCEoe+fjDhnRX3gQvxjg8=;
 b=ffpSzJp32XfT61n8ojlOCVzXEdLGKdZmHehOPF/ZYm9gYKJBFh0baHAP
 cGmbvTsUk5L2fXIOtN12vUQLs2SviF+xM3SknIjCX+dAHaYLfFwulNTjd
 n0u3Crn/UMzwr9glCS7YvPxiJrnQuFc/0I3ZTrIU9R7Q2pMaLiG9qe0r5 M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uBlueMc8D39Fl806HQgGc7o3+lPrtdgkT7MfPgoExp6OAl1YE2dAikYcEhgWxGQntWgrXFRY6m
 s5wvSyAMIPxr4Kyj0rYT5UNmGEpQkJR5uhTKtjolHnEMoutGtUt0rekkho31kNTVsoGfgUYO/3
 hGJO7ermaVAUtSBCUdAR/SRo7FOMGtOcRkZUr4UKhtEs2dsEzIZh/zKTJTUitpqVjl+9VkP50w
 GuuwFt4V2uiE8119pZxDCx08hETQwb9AM9e/vxQ+ZuWiogmGqXp8xD36GsZFq9xemLVVdYNOAI
 hrU=
X-SBRS: 2.7
X-MesageID: 24216523
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="24216523"
Subject: Re: [PATCH 1/4] x86: replace __ASM_{CL,ST}AC
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ea6eeb6d-7af2-97cb-4c11-6e0a81755961@citrix.com>
Date: Tue, 28 Jul 2020 14:55:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/07/2020 11:48, Jan Beulich wrote:
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -20,6 +20,7 @@ $(call as-option-add,CFLAGS,CC,"rdrand %
>  $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
>  $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
>  $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
> +$(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)

Kconfig please, rather than extending this legacy section.

That said, surely stac/clac support is old enough for us to start using
unconditionally?

Could we see about sorting a reasonable minimum toolchain version,
before we churn all the logic to deal with obsolete toolchains?

~Andrew

