Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4033B8CE34F
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 11:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729210.1134323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sARD8-00037U-40; Fri, 24 May 2024 09:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729210.1134323; Fri, 24 May 2024 09:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sARD8-00035U-1E; Fri, 24 May 2024 09:27:38 +0000
Received: by outflank-mailman (input) for mailman id 729210;
 Fri, 24 May 2024 09:27:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sARD6-00035O-Vk
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 09:27:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sARD6-0006HI-Az; Fri, 24 May 2024 09:27:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sARD6-0003Ge-3N; Fri, 24 May 2024 09:27:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=WxQ8/sE4b6bNUwlJcvudr7BBemUV0Y/a9eCa0Swo9fU=; b=PDLaKjbo6WYrv0nCiW105NPZEk
	D7qTIJ7W0Nxly7owPD8J3au4aJRHBOAVNQrkqxprzsZGm7Ega7/6zSmyB4h/H2RiXT0xN6zQcvIu6
	o32jip4G/iMFEP6POLFpQsIpHOepf2XKaSivtTEEOpYGnax2sSfLfIjryqml/+tfeYgY=;
Message-ID: <56bf92b7-9bcc-4093-b51c-b8ec0b43209c@xen.org>
Date: Fri, 24 May 2024 10:27:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] tools/arm: Introduce the "nr_spis" xl config entry
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: anthony@xenproject.org, sstabellini@kernel.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 Henry Wang <xin.wang2@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
 <20240524021814.2666257-3-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240524021814.2666257-3-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/05/2024 03:18, Stefano Stabellini wrote:
> From: Henry Wang <xin.wang2@amd.com>
> 
> Currently, the number of SPIs allocated to the domain is only
> configurable for Dom0less DomUs. Xen domains are supposed to be
> platform agnostics and therefore the numbers of SPIs for libxl
> guests should not be based on the hardware.
> 
> Introduce a new xl config entry for Arm to provide a method for
> user to decide the number of SPIs. This would help to avoid
> bumping the `config->arch.nr_spis` in libxl everytime there is a
> new platform with increased SPI numbers.
> 
> Update the doc and the golang bindings accordingly.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>   docs/man/xl.cfg.5.pod.in             | 16 ++++++++++++++++
>   tools/golang/xenlight/helpers.gen.go |  2 ++
>   tools/golang/xenlight/types.gen.go   |  1 +
>   tools/include/libxl.h                |  7 +++++++
>   tools/libs/light/libxl_arm.c         |  4 ++--
>   tools/libs/light/libxl_types.idl     |  1 +
>   tools/xl/xl_parse.c                  |  3 +++
>   7 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 8f2b375ce9..ac3f88fd57 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3072,6 +3072,22 @@ raised.
>   
>   =back
>   
> +=over 4
> +
> +=item B<nr_spis="NR_SPIS">
> +
> +An optional integer parameter specifying the number of SPIs (Shared
> +Peripheral Interrupts) to allocate for the domain. Max is 991 SPIs. If
> +the value specified by the `nr_spis` parameter is smaller than the
> +number of SPIs calculated by the toolstack based on the devices
> +allocated for the domain, or the `nr_spis` parameter is not specified,
> +the value calculated by the toolstack will be used for the domain.
> +Otherwise, the value specified by the `nr_spis` parameter will be used.
> +The number of SPIs should match the highest interrupt ID that will be
> +assigned to the domain.
> +
> +=back
> +
>   =head3 x86
>   
>   =over 4
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index b9cb5b33c7..fe5110474d 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1154,6 +1154,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
>   x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
>   x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
>   x.ArchArm.SveVl = SveType(xc.arch_arm.sve_vl)
> +x.ArchArm.NrSpis = uint32(xc.arch_arm.nr_spis)
>   if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
>   return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>   }
> @@ -1670,6 +1671,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
>   xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
>   xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
>   xc.arch_arm.sve_vl = C.libxl_sve_type(x.ArchArm.SveVl)
> +xc.arch_arm.nr_spis = C.uint32_t(x.ArchArm.NrSpis)
>   if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
>   return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>   }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index 5b293755d7..c9e45b306f 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -597,6 +597,7 @@ ArchArm struct {
>   GicVersion GicVersion
>   Vuart VuartType
>   SveVl SveType
> +NrSpis uint32
>   }
>   ArchX86 struct {
>   MsrRelaxed Defbool
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 62cb07dea6..3b5c18b48b 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -636,6 +636,13 @@
>    */
>   #define LIBXL_HAVE_XEN_9PFS 1
>   
> +/*
> + * LIBXL_HAVE_NR_SPIS indicates the presence of the nr_spis field in
> + * libxl_domain_build_info that specifies the number of SPIs interrupts
> + * for the guest.
> + */
> +#define LIBXL_HAVE_NR_SPIS 1
> +

Looking at the other arch.arm field, I think this wants to be:

/*
  * libxl_domain_build_info has the arch_arm.nr_spis field
  */
#define LIBXL_HAVE_BUILDINFO_ARCH_NR_SPIS 1

This would also clarify that the field is Arm specific.

Cheers,

-- 
Julien Grall

