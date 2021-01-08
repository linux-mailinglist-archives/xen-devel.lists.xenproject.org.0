Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C52EF07F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 11:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63276.112363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxoo2-00026s-S0; Fri, 08 Jan 2021 10:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63276.112363; Fri, 08 Jan 2021 10:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxoo2-00026T-Os; Fri, 08 Jan 2021 10:15:42 +0000
Received: by outflank-mailman (input) for mailman id 63276;
 Fri, 08 Jan 2021 10:15:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnVl=GL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kxoo1-00026K-8v
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 10:15:41 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e8448cf-3e6c-4ca1-960c-ed77af7dffdf;
 Fri, 08 Jan 2021 10:15:38 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9e8448cf-3e6c-4ca1-960c-ed77af7dffdf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610100938;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ynn5aT1cYr3pomz2s443HF4gtMDpsniF8gh3ySx8KSw=;
  b=NN7yYll7rUCDYFvDt5BIhxsjSmb6qtBeHEz5k7eZm0dXc1fi5TyQM2S0
   QhxSipHRtdz9TBr18Y5sHgTQNnsz9ZgoTTEodn8ARp0gVYz8rLe0PFueR
   rSqJeKrLPuot8yrBa/hTzh+yg1wtxnOaI8NW4gTi3Gap/Qh4aYt1DAhee
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1zFeMZMPkEh7mxF7GV082dREqL/6noZ+u4zAeNmzf0x0MiZUMpRbgDUIuu50DFLTGV8WR++BwO
 Ck0eL4ki/+Xm+caZAi4+f802HFZy4hGMumoe5l/tZFYnRfvuhDiCkzRPi8qM4L35Y2oKtP2Q5g
 lchES5ZJE3MgCTmRpMg10LqiA9aSsI7NP2CLoR6SsJa/Tmz56r3oniNQL9afKxGBryBGOKrEBt
 NyntzudNiP34ML5xFPPMyWYV49EoBv+hLN+MCJuTglBCs7HNPGUjKGNHjkdkMldZRAdSWBrR7A
 DHo=
X-SBRS: 5.2
X-MesageID: 34687668
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,330,1602561600"; 
   d="scan'208";a="34687668"
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: "paul@xen.org" <paul@xen.org>, Igor Druzhinin <igor.druzhinin@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "wl@xen.org" <wl@xen.org>, "iwj@xenproject.org" <iwj@xenproject.org>,
	Anthony Perard <anthony.perard@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: RE: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
Thread-Topic: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
Thread-Index: AQHW5VfGGzvKlcncFEyq5KgWxM8PB6oduqAA///IAjA=
Date: Fri, 8 Jan 2021 10:15:12 +0000
Message-ID: <35ba7e3d38924844ace3415af5642e00@FTLPEX02CL03.citrite.net>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <009d01d6e598$bfdd0110$3f970330$@xen.org>
In-Reply-To: <009d01d6e598$bfdd0110$3f970330$@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

(Sorry for webmail).

The forthcoming hotfix on Win10/Server2019 (Build  20270) is in serious pro=
blems without these two fixes, and never starts secondary processors.

~Andrew

-----Original Message-----
From: Paul Durrant <xadimgnik@gmail.com>=20
Sent: Friday, January 8, 2021 8:32 AM
To: Igor Druzhinin <igor.druzhinin@citrix.com>; xen-devel@lists.xenproject.=
org
Cc: wl@xen.org; iwj@xenproject.org; Anthony Perard <anthony.perard@citrix.c=
om>; Andrew Cooper <Andrew.Cooper3@citrix.com>; George Dunlap <George.Dunla=
p@citrix.com>; jbeulich@suse.com; julien@xen.org; sstabellini@kernel.org; R=
oger Pau Monne <roger.pau@citrix.com>
Subject: RE: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per part=
ition

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 08 January 2021 00:47
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org;=20
> anthony.perard@citrix.com; andrew.cooper3@citrix.com;=20
> george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org;=20
> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin=20
> <igor.druzhinin@citrix.com>
> Subject: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per=20
> partition
>=20
> TLFS 7.8.1 stipulates that "a virtual processor index must be less=20
> than the maximum number of virtual processors per partition" that "can=20
> be obtained through CPUID leaf 0x40000005". Furthermore, "Requirements=20
> for Implementing the Microsoft Hypervisor Interface" defines that=20
> starting from Windows Server 2012, which allowed more than 64 CPUs to=20
> be brought up, this leaf can now contain a value -1 basically assuming=20
> the hypervisor has no restriction while
> 0 (that we currently expose) means the default restriction is still prese=
nt.
>=20
> Along with previous changes exposing ExProcessorMasks this allows a=20
> recent Windows VM with Viridian extension enabled to have more than 64=20
> vCPUs without going into immediate BSOD.
>=20

This is very odd as I was happily testing with a 128 vCPU VM once ExProcess=
orMasks was implemented... no need for the extra leaf.
The documentation for 0x40000005 states " Describes the scale limits suppor=
ted in the current hypervisor implementation. If any value is zero, the hyp=
ervisor does not expose the corresponding information". It does not say (in=
 section 7.8.1 or elsewhere AFAICT) what implications that has for VP_INDEX=
.

In " Requirements for Implementing the Microsoft Hypervisor Interface" I do=
n't see anything saying what the semantics of not implementing leaf 0x40000=
005 are, only that if implementing it then -1 must be used to break the 64 =
VP limit. It also says that reporting -1 in 0x40000005 means that 40000004.=
EAX bits 1 and 2 *must* be clear, which is clearly not true if ExProcessorM=
asks is enabled. That document is dated June 13th 2012 so I think it should=
 be taken with a pinch of salt.

Have you actually observed a BSOD with >64 vCPUs when ExProcessorMasks is e=
nabled? If so, which version of Windows? I'd like to get a repro myself.

  Paul

> Since we didn't expose the leaf before and to keep CPUID data=20
> consistent for incoming streams from previous Xen versions - let's keep i=
t behind an option.
>=20
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
>  tools/libs/light/libxl_x86.c         |  2 +-
>  xen/arch/x86/hvm/viridian/viridian.c | 23 +++++++++++++++++++++++
>  xen/include/public/hvm/params.h      |  7 ++++++-
>  3 files changed, 30 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/libs/light/libxl_x86.c=20
> b/tools/libs/light/libxl_x86.c index 86d2729..96c8bf1 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -336,7 +336,7 @@ static int hvm_set_viridian_features(libxl__gc *gc, u=
int32_t domid,
>          LOG(DETAIL, "%s group enabled",=20
> libxl_viridian_enlightenment_to_string(v));
>=20
>      if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_=
BASE)) {
> -        mask |=3D HVMPV_base_freq;
> +        mask |=3D HVMPV_base_freq | HVMPV_no_vp_limit;
>=20
>          if (!libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTEN=
MENT_FREQ))
>              mask |=3D HVMPV_no_freq;
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c=20
> b/xen/arch/x86/hvm/viridian/viridian.c
> index ed97804..ae1ea86 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -209,6 +209,29 @@ void cpuid_viridian_leaves(const struct vcpu *v, uin=
t32_t leaf,
>          res->b =3D viridian_spinlock_retry_count;
>          break;
>=20
> +    case 5:
> +        /*
> +         * From "Requirements for Implementing the Microsoft Hypervisor
> +         *  Interface":
> +         *
> +         * "On Windows operating systems versions through Windows Server
> +         * 2008 R2, reporting the HV#1 hypervisor interface limits
> +         * the Windows virtual machine to a maximum of 64 VPs, regardles=
s of
> +         * what is reported via CPUID.40000005.EAX.
> +         *
> +         * Starting with Windows Server 2012 and Windows 8, if
> +         * CPUID.40000005.EAX containsa value of -1, Windows assumes tha=
t
> +         * the hypervisor imposes no specific limit to the number of VPs=
.
> +         * In this case, Windows Server 2012 guest VMs may use more than=
 64
> +         * VPs, up to the maximum supported number of processors applica=
ble
> +         * to the specific Windows version being used."
> +         *
> +         * For compatibility we hide it behind an option.
> +         */
> +        if ( viridian_feature_mask(d) & HVMPV_no_vp_limit )
> +            res->a =3D -1;
> +        break;
> +
>      case 6:
>          /* Detected and in use hardware features. */
>          if ( cpu_has_vmx_virtualize_apic_accesses ) diff --git=20
> a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h=20
> index 3b0a0f4..805f4ca 100644
> --- a/xen/include/public/hvm/params.h
> +++ b/xen/include/public/hvm/params.h
> @@ -168,6 +168,10 @@
>  #define _HVMPV_ex_processor_masks 10
>  #define HVMPV_ex_processor_masks (1 << _HVMPV_ex_processor_masks)
>=20
> +/* Allow more than 64 VPs */
> +#define _HVMPV_no_vp_limit 11
> +#define HVMPV_no_vp_limit (1 << _HVMPV_no_vp_limit)
> +
>  #define HVMPV_feature_mask \
>          (HVMPV_base_freq | \
>           HVMPV_no_freq | \
> @@ -179,7 +183,8 @@
>           HVMPV_synic | \
>           HVMPV_stimer | \
>           HVMPV_hcall_ipi | \
> -         HVMPV_ex_processor_masks)
> +         HVMPV_ex_processor_masks | \
> +         HVMPV_no_vp_limit)
>=20
>  #endif
>=20
> --
> 2.7.4



