Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38261DC15C
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 23:28:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbWFx-0004Wv-7W; Wed, 20 May 2020 21:28:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBXs=7C=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jbWFw-0004Wq-1Y
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 21:28:04 +0000
X-Inumbo-ID: c9392e4e-9ae0-11ea-ae69-bc764e2007e4
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9392e4e-9ae0-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 21:28:03 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:45964
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jbWFp-000ECA-Pt (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Wed, 20 May 2020 22:27:57 +0100
Subject: Re: [PATCH] VT-x: extend LBR Broadwell errata coverage
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <df6e8dad-b4c0-0821-46eb-e4aa86f8ccfa@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6697e119-c5a2-4f3b-0d81-e6420dfaff87@citrix.com>
Date: Wed, 20 May 2020 22:27:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <df6e8dad-b4c0-0821-46eb-e4aa86f8ccfa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
> E3 but not its Core counterpart. With this it's of course also uncertain
> whether the absence of the erratum for Xeon D is actually meaningful.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2870,8 +2870,10 @@ static void __init lbr_tsx_fixup_check(v
>      case 0x45: /* HSM182 - 4th gen Core */
>      case 0x46: /* HSM182, HSD172 - 4th gen Core (GT3) */
>      case 0x3d: /* BDM127 - 5th gen Core */
> -    case 0x47: /* BDD117 - 5th gen Core (GT3) */
> -    case 0x4f: /* BDF85  - Xeon E5-2600 v4 */
> +    case 0x47: /* BDD117 - 5th gen Core (GT3)
> +                  BDW117 - Xeon E3-1200 v4 */
> +    case 0x4f: /* BDF85  - Xeon E5-2600 v4
> +                  BDX88  - Xeon E7-x800 v4 */

After cross referencing with Roger's errata patch, BDH75, and ...

>      case 0x56: /* BDE105 - Xeon D-1500 */
>          break;
>      default:
> @@ -2895,15 +2897,26 @@ static void __init lbr_tsx_fixup_check(v
>  static void __init bdf93_fixup_check(void)
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

BDH80, which is "Intel® Core™ i7 Processor Family for LGA2011-v3
Socket", so high end desktop, despite being electrically compatible with
the E5 servers.

~Andrew

>          bdf93_fixup_needed = true;
> +        break;
> +    }
>  }
>  
>  static int is_last_branch_msr(u32 ecx)


