Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E421DB5F0
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 16:08:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbPNu-0006ZY-Kd; Wed, 20 May 2020 14:07:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4N77=7C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbPNt-0006ZT-A4
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 14:07:49 +0000
X-Inumbo-ID: 48ed572a-9aa3-11ea-b07b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48ed572a-9aa3-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 14:07:48 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 98xVz1GJeLLKXYKeJAcgFHQZ3aHnKNcAeNxvoVIdbuwkn4VN4E+uzokvaB9ItCm15E37jppm5M
 lAWeVl/Sg0ECkRwiTw0PaCyKuLxGYj4kv6ioZoCVYj/aFFwh4RQLY6rLMhP+NiK9hcrEERZf9r
 l/treWeTpf9NBh4I9o2u0Udg5U3WiirQl4etGHaX9OuK0qYKe/u0yugaSyaCSFH28cFIccpXVH
 IF6ge19dVw5nUKwiV0tKDrOZYjMRMBeBKe2Ivb2LaaEjnFK+B1X/wqj+B4DX4eS7LBtisnJLCO
 84U=
X-SBRS: 2.7
X-MesageID: 18249144
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18249144"
Subject: Re: [PATCH] VT-x: extend LBR Broadwell errata coverage
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <df6e8dad-b4c0-0821-46eb-e4aa86f8ccfa@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e107f97b-4bb7-31ee-20d1-ddf8f7e00c21@citrix.com>
Date: Wed, 20 May 2020 15:07:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <df6e8dad-b4c0-0821-46eb-e4aa86f8ccfa@suse.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/05/2020 13:52, Jan Beulich wrote:
> For lbr_tsx_fixup_check() simply name a few more specific errata numbers.
>
> For bdf93_fixup_check(), however, more models are affected. Oddly enough
> despite being the same model and stepping, the erratum is listed for Xeon
> E3 but not its Core counterpart.

That is probably a documentation error.  These processors are made from
the same die, and are not going to deviate in this regard.

> With this it's of course also uncertain
> whether the absence of the erratum for Xeon D is actually meaningful.

Given BDE105, it is exceedingly unlikely that this erratum alone was
fixed, leaving the other related ones present.

The complicating factor is that the TSX errata were addressed in some
later Broadwell parts.  Both these errata groups are to do with a
mismatch of TSX metadata in LBR/LER records.

The former group affects Haswell and Broadwell, but only when microcode
has disabled TSX, and manifests in the processor rejecting
architecturally-correct last-branch-to records.  Any mode in the list
which still has TSX enabled in up-to-date microcode doesn't get the
workaround.

The latter group affects Broadwell only, and manifests as an
architecturally incorrect ler-from record, which shouldn't have any TSX
metadata to begin with.

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2870,8 +2870,10 @@ static void __init lbr_tsx_fixup_check(v

There is a comment out of context here which is now stale.

If simply adding adding to the list is something you'd prefer to avoid,
what about /* Haswell/Broadwell LBR TSX metadata errata */ or similar?

>      case 0x45: /* HSM182 - 4th gen Core */
>      case 0x46: /* HSM182, HSD172 - 4th gen Core (GT3) */
>      case 0x3d: /* BDM127 - 5th gen Core */
> -    case 0x47: /* BDD117 - 5th gen Core (GT3) */
> -    case 0x4f: /* BDF85  - Xeon E5-2600 v4 */
> +    case 0x47: /* BDD117 - 5th gen Core (GT3)
> +                  BDW117 - Xeon E3-1200 v4 */
> +    case 0x4f: /* BDF85  - Xeon E5-2600 v4
> +                  BDX88  - Xeon E7-x800 v4 */
>      case 0x56: /* BDE105 - Xeon D-1500 */
>          break;
>      default:
> @@ -2895,15 +2897,26 @@ static void __init lbr_tsx_fixup_check(v
>  static void __init bdf93_fixup_check(void)

Seeing as this is no longer just BDF93, how about ler_tsx_fixup_check() ?

~Andrew

>  {
>      /*
> -     * Broadwell erratum BDF93:
> +     * Broadwell erratum BDF93 et al:
>       *
>       * Reads from MSR_LER_TO_LIP (MSR 1DEH) may return values for bits[63:61]
>       * that are not equal to bit[47].  Attempting to context switch this value
>       * may cause a #GP.  Software should sign extend the MSR.
>       */
> -    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
> -         boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x4f )
> +    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
> +         boot_cpu_data.x86 != 6 )
> +        return;
> +
> +    switch ( boot_cpu_data.x86_model )
> +    {
> +    case 0x3d: /* BDM131 - 5th gen Core */
> +    case 0x47: /* BDD??? - 5th gen Core (H-Processor line)
> +                  BDW120 - Xeon E3-1200 v4 */
> +    case 0x4f: /* BDF93  - Xeon E5-2600 v4
> +                  BDX93  - Xeon E7-x800 v4 */
>          bdf93_fixup_needed = true;
> +        break;
> +    }
>  }
>  
>  static int is_last_branch_msr(u32 ecx)


