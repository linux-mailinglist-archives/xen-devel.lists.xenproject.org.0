Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C5D232451
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 20:05:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0qRn-0007Az-MP; Wed, 29 Jul 2020 18:04:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XnVs=BI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0qRl-0007Au-Rf
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 18:04:57 +0000
X-Inumbo-ID: 0270771e-d1c6-11ea-8cae-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0270771e-d1c6-11ea-8cae-bc764e2007e4;
 Wed, 29 Jul 2020 18:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596045896;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=w3Dz5LvumULsclC6LqmSvlT/fw+wPczVA22E2m8zbZI=;
 b=JtNMggkT2UhtkN3k37rVYINb/mUvIBFYIkeLQahgNcn3lceL7JPuTSss
 oNsQwtBMJsLqJ3A1R92ukbuHc3LL/HULGlri8Ea1hqExj+fT5P9gXVEvR
 WfVCsu1Sr9rnpMJZvOjmG6JvIkyXLrMsmXT4GdNeZMj86E+wmuvOo3Oyg Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qsmU7kjoJyvZ0VhlRx6UHpYF/AIwuLltpHQ0hQhIP9cV3OfCPgWLSxfW9T5FXrNkUeS4vkFK9n
 kAUVOFh/1CBT5GhLfVXkuF5KpIKPZy2nbjfsMXYbdVPHfIMvH8Jj/15FkocEOioXKhFzQLcSNo
 GaUtVqEq1Zwv4eKQhx0xZFhaH9gcO/55JFbSZlK6MVq4VHjqffaMxaeGXUqQTm26v76DK6nbEx
 GeNil7uVgnB2iq0TqYrdzkfrGXTuNQw38yzvXHEc0h6BA879PFXirx9ppXar933PAfOTCZ52KK
 Nas=
X-SBRS: 2.7
X-MesageID: 23661488
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,411,1589256000"; d="scan'208";a="23661488"
Subject: Re: [PATCH] x86/cpuid: Fix APIC bit clearing
To: <fam@euphon.net>, <xen-devel@lists.xenproject.org>
References: <20200729163341.5662-1-fam@euphon.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <693e5bfd-b9ce-fb78-5044-4df0b22f93da@citrix.com>
Date: Wed, 29 Jul 2020 19:04:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729163341.5662-1-fam@euphon.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: famzheng@amazon.com, Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/07/2020 17:33, fam@euphon.net wrote:
> From: Fam Zheng <famzheng@amazon.com>
>
> The bug is obvious here, other places in this function used
> "cpufeat_mask" correctly.
>
> Signed-off-by: Fam Zheng <famzheng@amazon.com>
> Fixes: 46df8a65 ("x86/cpuid: Effectively remove pv_cpuid() and hvm_cpuid()")
> ---
>  xen/arch/x86/cpuid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index 6a4a787b68..63a03ef1e5 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -1057,7 +1057,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>          {
>              /* Fast-forward MSR_APIC_BASE.EN. */
>              if ( vlapic_hw_disabled(vcpu_vlapic(v)) )
> -                res->d &= ~cpufeat_bit(X86_FEATURE_APIC);
> +                res->d &= ~cpufeat_mask(X86_FEATURE_APIC);
>  
>              /*
>               * PSE36 is not supported in shadow mode.  This bit should be

Oops.  Good spot.

However, the Fixes you identify was just code movement.  The bug was
actually introduced in b648feff8ea2c9bff250b4b262704fb100b1f9cf two
years earlier.

I've tweaked the Fixes line and committed.

~Andrew

