Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1F22EEE9D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 09:32:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63222.112273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxnBr-00085D-Rq; Fri, 08 Jan 2021 08:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63222.112273; Fri, 08 Jan 2021 08:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxnBr-00084o-Od; Fri, 08 Jan 2021 08:32:11 +0000
Received: by outflank-mailman (input) for mailman id 63222;
 Fri, 08 Jan 2021 08:32:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w/qK=GL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kxnBq-00084j-5I
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 08:32:10 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9561024-0317-464e-82ee-07f8771c9251;
 Fri, 08 Jan 2021 08:32:08 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 190so7145265wmz.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jan 2021 00:32:08 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id u13sm12263101wrw.11.2021.01.08.00.32.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Jan 2021 00:32:07 -0800 (PST)
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
X-Inumbo-ID: e9561024-0317-464e-82ee-07f8771c9251
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=uXJsjEFfzV95tzvcFcAyxA04HhNa2tAke9esePnSGTw=;
        b=JtOlymSPLwfGF6P3P6GtIzfKIXgx8RZJ3J65IYUVvWj0/Da2SzkEtzscihs/6bhRXY
         RYcZ3ENLMUk6LbYsCkELah9bhrSLsTvvZw2o81Vr8nPfHt52O62ogPv0XLgwCf7QfWab
         KIYscSUWZE5rUrvW7CUWSc5ItkQKuyQqTnL5qo720su6tS0m2dA214CQM514p8Ftv0uP
         a39Fi5EhOw9IjGvaBw3aIZYTL5WeWkw6XtPP5YzLkSNFO40g1HfbUqYgZwlyFatKa6Lp
         +m7d6gvmZG3LU6NKKGs4aRcUqZ8gBa8DCX7MbDJutiP+4LbDSN84+mLPwk2vsh+jMg/I
         b3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=uXJsjEFfzV95tzvcFcAyxA04HhNa2tAke9esePnSGTw=;
        b=Lx+NYexs0dIOjSclEtEy3L1o2FgUUgwP0ECWTObIsMEmt3CrrwzbnI5qqUIpjenZYE
         /14sXANCMHbypqXJSBgucz1QMaCzt7+2KusHfKukE15UUnGvhOTROvk9zdlTFQmVa0y9
         RIlLu2naSHt+IkjeyPQj3QxpWl/PxsnowbcpEQo9gwJSIirYLcmPVVxoCXiOCGi8fWHB
         AGNayP/dmJkWAK3NVv+WoiNvfnp4uJC3qo+bkhTucunlvI/hWXVKc63kebmn3rA+VH4o
         dw5VzVMDUAW6IraQvL2K6dSGneYmkV+NnqHA+DNmCLe6THd/YoHMWd9ZArj7ds0/ZCYM
         V91Q==
X-Gm-Message-State: AOAM531li0G3fjckB3e1bHfxCt7BgqefXwlYvcsPDTSG9RyvQoMMTgJS
	ZHtwMPIu4QGcIel2Qyo1EY8=
X-Google-Smtp-Source: ABdhPJyFJIxe8NWwjYVeJK5wGNQtJU8eK+PU1D3ugYgXB9xPBahVM1Tx4PUNVcCrifko7g0Fwf8a2A==
X-Received: by 2002:a1c:bb07:: with SMTP id l7mr2072640wmf.9.1610094727623;
        Fri, 08 Jan 2021 00:32:07 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: <wl@xen.org>,
	<iwj@xenproject.org>,
	<anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>,
	<jbeulich@suse.com>,
	<julien@xen.org>,
	<sstabellini@kernel.org>,
	<roger.pau@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
Subject: RE: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
Date: Fri, 8 Jan 2021 08:32:06 -0000
Message-ID: <009d01d6e598$bfdd0110$3f970330$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIZObzvX1fStk6d0If1Grmzp4ChNamYucZg

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 08 January 2021 00:47
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com;
> andrew.cooper3@citrix.com; george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org;
> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin <igor.druzhinin@citrix.com>
> Subject: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
> 
> TLFS 7.8.1 stipulates that "a virtual processor index must be less than
> the maximum number of virtual processors per partition" that "can be obtained
> through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
> the Microsoft Hypervisor Interface" defines that starting from Windows Server
> 2012, which allowed more than 64 CPUs to be brought up, this leaf can now
> contain a value -1 basically assuming the hypervisor has no restriction while
> 0 (that we currently expose) means the default restriction is still present.
> 
> Along with previous changes exposing ExProcessorMasks this allows a recent
> Windows VM with Viridian extension enabled to have more than 64 vCPUs without
> going into immediate BSOD.
> 

This is very odd as I was happily testing with a 128 vCPU VM once ExProcessorMasks was implemented... no need for the extra leaf.
The documentation for 0x40000005 states " Describes the scale limits supported in the current hypervisor implementation. If any
value is zero, the hypervisor does not expose the corresponding information". It does not say (in section 7.8.1 or elsewhere AFAICT)
what implications that has for VP_INDEX.

In " Requirements for Implementing the Microsoft Hypervisor Interface" I don't see anything saying what the semantics of not
implementing leaf 0x40000005 are, only that if implementing it then -1 must be used to break the 64 VP limit. It also says that
reporting -1 in 0x40000005 means that 40000004.EAX bits 1 and 2 *must* be clear, which is clearly not true if ExProcessorMasks is
enabled. That document is dated June 13th 2012 so I think it should be taken with a pinch of salt.

Have you actually observed a BSOD with >64 vCPUs when ExProcessorMasks is enabled? If so, which version of Windows? I'd like to get
a repro myself.

  Paul

> Since we didn't expose the leaf before and to keep CPUID data consistent for
> incoming streams from previous Xen versions - let's keep it behind an option.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
>  tools/libs/light/libxl_x86.c         |  2 +-
>  xen/arch/x86/hvm/viridian/viridian.c | 23 +++++++++++++++++++++++
>  xen/include/public/hvm/params.h      |  7 ++++++-
>  3 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 86d2729..96c8bf1 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -336,7 +336,7 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
>          LOG(DETAIL, "%s group enabled", libxl_viridian_enlightenment_to_string(v));
> 
>      if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_BASE)) {
> -        mask |= HVMPV_base_freq;
> +        mask |= HVMPV_base_freq | HVMPV_no_vp_limit;
> 
>          if (!libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_FREQ))
>              mask |= HVMPV_no_freq;
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> index ed97804..ae1ea86 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -209,6 +209,29 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>          res->b = viridian_spinlock_retry_count;
>          break;
> 
> +    case 5:
> +        /*
> +         * From "Requirements for Implementing the Microsoft Hypervisor
> +         *  Interface":
> +         *
> +         * "On Windows operating systems versions through Windows Server
> +         * 2008 R2, reporting the HV#1 hypervisor interface limits
> +         * the Windows virtual machine to a maximum of 64 VPs, regardless of
> +         * what is reported via CPUID.40000005.EAX.
> +         *
> +         * Starting with Windows Server 2012 and Windows 8, if
> +         * CPUID.40000005.EAX containsa value of -1, Windows assumes that
> +         * the hypervisor imposes no specific limit to the number of VPs.
> +         * In this case, Windows Server 2012 guest VMs may use more than 64
> +         * VPs, up to the maximum supported number of processors applicable
> +         * to the specific Windows version being used."
> +         *
> +         * For compatibility we hide it behind an option.
> +         */
> +        if ( viridian_feature_mask(d) & HVMPV_no_vp_limit )
> +            res->a = -1;
> +        break;
> +
>      case 6:
>          /* Detected and in use hardware features. */
>          if ( cpu_has_vmx_virtualize_apic_accesses )
> diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
> index 3b0a0f4..805f4ca 100644
> --- a/xen/include/public/hvm/params.h
> +++ b/xen/include/public/hvm/params.h
> @@ -168,6 +168,10 @@
>  #define _HVMPV_ex_processor_masks 10
>  #define HVMPV_ex_processor_masks (1 << _HVMPV_ex_processor_masks)
> 
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
> 
>  #endif
> 
> --
> 2.7.4



