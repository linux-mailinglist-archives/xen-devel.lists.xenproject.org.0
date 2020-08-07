Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D91D23F1C7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 19:14:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k45wa-0005mq-4n; Fri, 07 Aug 2020 17:14:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1r1P=BR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k45wZ-0005ml-3f
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 17:14:11 +0000
X-Inumbo-ID: 37846215-4723-44f4-90ea-dc4faf91d2cb
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37846215-4723-44f4-90ea-dc4faf91d2cb;
 Fri, 07 Aug 2020 17:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596820449;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YOv9m0OA/Njj00Z8OLpL/M86vtvTEEo/iImQR6upzVE=;
 b=XfSZjtlFJEX603sk+nth7vm7NEFEcrpDIRlqjP4wfXDQx+hCqi9RznsM
 CPe68pp1Fif3jzi9xk+kb/E/4aggIESavAhCfAcByTvMgzyRSUBL9XqIs
 Z9Mu3yIRXJc2VJ2UXDG8up6TWgfjxAd4O8Nz4H95sZLmd3hfrIObpEt0n o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yr4h3eRYOVSRdXPMgdRowVeJMPmBfN3D987wTz6jkjI8us0o1k3CX5W5mcRBKizGuE6iJbPDl2
 igK9F/vry0+r5yzwS7CVk6K45dhKeGX1Gay476bsUMt713AfEKoMgXdfZOpGxZG67CFyDUgf24
 C0dGBdxqprpgWrCk6Bw1rNwaD23F+t4bOjM7HJmHRQY1XuWTgNAN4onW+IftoMfmvJcBV3Y0Be
 MfeV5UTnm+H0HL00jdnL7KuexmyPQzESJnwh0kF7MiutpVvZDxu0A0MEHhE402288uWw+uSZda
 kiw=
X-SBRS: 2.7
X-MesageID: 24398669
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,446,1589256000"; d="scan'208";a="24398669"
Subject: Re: [PATCH v2 3/7] x86: shrink struct arch_{vcpu,domain} when !HVM
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <014a655b-7080-3804-3a56-5e00851a2a7d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <306cec0c-93e6-4b45-f68c-3808309478bf@citrix.com>
Date: Fri, 7 Aug 2020 18:14:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <014a655b-7080-3804-3a56-5e00851a2a7d@suse.com>
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07/08/2020 12:33, Jan Beulich wrote:
> While this won't affect overall memory overhead (struct vcpu as well as
> struct domain get allocated as single pages) nor code size (the offsets
> into the base structures are too large to be representable as signed 8-
> bit displacements), it'll allow the tail of struct pv_{domain,vcpu} to
> share a cache line with subsequent struct arch_{domain,vcpu} fields.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: There is a risk associated with this: If we still have code
>      somewhere accessing the HVM parts of the structures without a prior
>      type check of the guest, this going to end up worse than the so far
>      not uncommon case of the access simply going to space unused by PV.
>      We may therefore want to consider whether to further restrict when
>      this conversion to union gets done.
>      And of course there's also the risk of future compilers complaining
>      about this abuse of unions. But this is limited to code that's dead
>      in !HVM configs, so only an apparent problem.
>
> --- a/xen/include/asm-x86/hvm/domain.h
> +++ b/xen/include/asm-x86/hvm/domain.h
> @@ -99,7 +99,13 @@ struct hvm_pi_ops {
>  
>  #define MAX_NR_IOREQ_SERVERS 8
>  
> -struct hvm_domain {
> +typedef
> +#ifdef CONFIG_HVM
> +struct
> +#else
> +union
> +#endif
> +hvm_domain {
>      /* Guest page range used for non-default ioreq servers */
>      struct {
>          unsigned long base;
> @@ -203,7 +209,7 @@ struct hvm_domain {
>  #ifdef CONFIG_MEM_SHARING
>      struct mem_sharing_domain mem_sharing;
>  #endif
> -};
> +} hvm_domain_t;

Honestly, I'd say no to this patch even it resulted in a 100x speedup,
because I am totally lost for words about this construct, and the effect
it comprehensibility of our code.

Seeing as improved cache locality appears to be the sole benefit,
marginal as it is, you can achieve that in a better way by rearranging
struct domain/vcpu to put the pv/hvm union at the end.

~Andrew

