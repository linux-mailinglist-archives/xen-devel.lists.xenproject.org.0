Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3E8CDD1B
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 01:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728923.1134009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAHVQ-0004DE-5o; Thu, 23 May 2024 23:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728923.1134009; Thu, 23 May 2024 23:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAHVQ-0004Bd-2y; Thu, 23 May 2024 23:05:52 +0000
Received: by outflank-mailman (input) for mailman id 728923;
 Thu, 23 May 2024 23:05:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAHVO-0004BX-TI
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 23:05:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAHVO-0008Cf-JI; Thu, 23 May 2024 23:05:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAHVO-0001KZ-DX; Thu, 23 May 2024 23:05:50 +0000
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
	bh=5z+uVk4AZgOoyi41Yz1XiORy3HPDEZSb2w8edttFTOU=; b=rp0F+pvXnP1qMrQoAREObl9EiE
	3kcse7649JaO0vXf/QTIO6OrVSgBOGP/HJHC7A0ZiY2l6KyBjjPmvGLhQFC4SEXZQ6+bqWPacw0FW
	SNgmdbR0aTzfFlePVkiDC0gGZ8QMbpBR90q8tSTb7ASfnIwsf0AQSmU1uJfCOR07yDgA=;
Message-ID: <02e22734-2e0c-4a0a-8c5a-42beee0cc396@xen.org>
Date: Fri, 24 May 2024 00:05:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] tools/arm: Introduce the "nr_spis" xl config entry
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
 <20240523074040.1611264-4-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240523074040.1611264-4-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 23/05/2024 08:40, Henry Wang wrote:
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
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v4:
> - Add Jason's Reviewed-by tag.
> v3:
> - Reword documentation to avoid ambiguity.
> v2:
> - New patch to replace the original patch in v1:
>    "[PATCH 05/15] tools/libs/light: Increase nr_spi to 160"
> ---
>   docs/man/xl.cfg.5.pod.in             | 14 ++++++++++++++
>   tools/golang/xenlight/helpers.gen.go |  2 ++
>   tools/golang/xenlight/types.gen.go   |  1 +
>   tools/libs/light/libxl_arm.c         |  4 ++--
>   tools/libs/light/libxl_types.idl     |  1 +
>   tools/xl/xl_parse.c                  |  3 +++
>   6 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 8f2b375ce9..416d582844 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3072,6 +3072,20 @@ raised.
>   
>   =back
>   
> +=over 4
> +
> +=item B<nr_spis="NR_SPIS">
> +
> +An optional 32-bit integer parameter specifying the number of SPIs (Shared

We can't support that much SPIs :). The limit would be 991 SPIs.

> +Peripheral Interrupts) to allocate for the domain. If the value specified by
> +the `nr_spis` parameter is smaller than the number of SPIs calculated by the
> +toolstack based on the devices allocated for the domain, or the `nr_spis`
> +parameter is not specified, the value calculated by the toolstack will be used
> +for the domain. Otherwise, the value specified by the `nr_spis` parameter will
> +be used.

I think it would be worth mentioning that the number of SPIs should 
match the highest interrupt ID that will be assigned to the domain 
(rather than the number of SPIs planned to be assigned).

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
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 1cb89fa584..a4029e3ac8 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -181,8 +181,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>   
>       LOG(DEBUG, "Configure the domain");
>   
> -    config->arch.nr_spis = nr_spis;
> -    LOG(DEBUG, " - Allocate %u SPIs", nr_spis);
> +    config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);

I am not entirely sure about using max(). To me if the user specifies a 
lower limit, then we should throw an error because this is likely an 
indication that the SPIs they will want to assign will clash with the 
emulated ones.

So it would be better to warn at domain creation rather than waiting 
until the IRQs are assigned.

I would like Anthony's opinion on this one. Given he is away this month, 
I guess we could get this patch merged (with other comments addressed) 
and have a follow-up if wanted before 4.19.

> +    LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
>   
>       switch (d_config->b_info.arch_arm.gic_version) {
>       case LIBXL_GIC_VERSION_DEFAULT:
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 79e9c656cc..4e65e6fda5 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -722,6 +722,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>       ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                  ("vuart", libxl_vuart_type),
>                                  ("sve_vl", libxl_sve_type),
> +                               ("nr_spis", uint32),

 From my understandig, any change in the .idl requires a corresponding 
LIBXL_HAVE_... in include/libxl.h. This is in order to allow external 
toolstack (such as libvirt) to be able to select at build time between 
multiple version of libxl.

>                                 ])),
>       ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                                 ])),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index c504ab3711..e3a4800f6e 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2935,6 +2935,9 @@ skip_usbdev:
>           }
>       }
>   
> +    if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
> +        b_info->arch_arm.nr_spis = l;
> +
>       parse_vkb_list(config, d_config);
>   
>       d_config->virtios = NULL;

Cheers,

-- 
Julien Grall

