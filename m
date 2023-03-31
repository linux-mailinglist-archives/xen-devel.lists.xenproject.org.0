Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575FB6D224F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 16:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516997.801955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piFfB-0003Um-P6; Fri, 31 Mar 2023 14:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516997.801955; Fri, 31 Mar 2023 14:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piFfB-0003T5-M1; Fri, 31 Mar 2023 14:23:33 +0000
Received: by outflank-mailman (input) for mailman id 516997;
 Fri, 31 Mar 2023 14:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4TQI=7X=citrix.com=prvs=447e39241=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1piFf9-0003Sz-5E
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 14:23:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98b4cd8c-cfcf-11ed-b464-930f4c7d94ae;
 Fri, 31 Mar 2023 16:23:26 +0200 (CEST)
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
X-Inumbo-ID: 98b4cd8c-cfcf-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680272606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MUUvTA6+WipI0M3QYAnR36sZaHtPvHvArxepZlCbb4w=;
  b=VTWkh/w5udZhnuzxtBXjSiwKWno1Ds0nduqwTwiOmPhOoBFmfg0za3ll
   /Pu5OX3hgAK1+aIqaJGQnwwVgcZPK7/52hG++//lMbQqAgCf8wv4BaICl
   Xj3JDCBWcogxf1trrtumgCkGZggs2DGb+ILU+ENYA/bo1qfz5BYRG/wAw
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102638425
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:tT+BB65KzA+BF9O1Lg28PgxRtN7HchMFZxGqfqrLsTDasY5as4F+v
 jAcXGiFPPiPMWCgc9t1bd/kp0MHuJ6AzdBlQAE6rS03Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasQ5QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 d8YDDIgS1e/rqGH2Jy3TLRItup/BZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx7C+
 DmWoz6kav0cHMKgxD2k8U2guuzotC/+fdIQFLK/+eE/1TV/wURMUUZLBDNXu8KRkEmlUchYL
 E8S0iUrpKk2skesS7HVXRKip2WflgUBQNcWGOo/gCmE0qfO6hyVLnQFRDVGLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcAUAAMpdfqpoo+ihbSZt95Fei+ididMTv92
 SyQpS4ywbAal9cW1r6T9ErCxTmro/DhUQod9gjRGGW/4WtRe4OkIYeo5F7z5OxFao2eSzG8U
 GMswpbEqrpUVNfUyXLLGb9WdF202xqbGC3/gXptMrxmyx3uymaNcYYNxAFQeG48Z67oZgTVj
 F/vVRJ5vcEDZCHxMf8qM+pdGOxxk/G+SI2NuuT8K4MXP8MvLFLvEDRGPxb44oz7rKQ7fUjT0
 7+/eN3kM3sVAL8PINGeF7ZEiu9DKszTKAruqXHHI/ePi+D2iIa9E+ttDbd3RrlRAFm4iAvU6
 c1DEMCB1g9SVubzCgGOr95LdwhTdiBlWMmtwyCySgJkClsOJY3cI6WJneNJl3JNxMy5adskD
 lniAxQFmTITdFXMKBmQa2ALVY4Dqa1X9CphVQR1ZAbA5pTWSdr3hEvpX8dtLOZPGS0K5aIcc
 sTpjO3ZWq4VGm+ao2tCBXQ/xaQ7HCmWacu1F3LNSFACk1RIHlKhFgPMFuc3yBQzMw==
IronPort-HdrOrdr: A9a23:i33AaqxR6Vp0H4T6UVGoKrPwLr1zdoMgy1knxilNoRw8SK2lfu
 SV7ZMmPH7P+VIssR4b9exoVJPufZqYz+8S3WBzB8bGYOCFghrKEGgK1+KLqFeMJ8S9zJ8+6U
 4JSdkGNDSaNzhHZKjBjjWFLw==
X-IronPort-AV: E=Sophos;i="5.98,307,1673931600"; 
   d="scan'208";a="102638425"
Date: Fri, 31 Mar 2023 15:23:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, George Dunlap <george.dunlap@cloud.com>
Subject: Re: [PATCH v4 10/12] xen/tools: add sve parameter in XL configuration
Message-ID: <9bd2924b-bb4a-440d-ae31-0253e66c56e5@perard>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-11-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230327105944.1360856-11-luca.fancellu@arm.com>

On Mon, Mar 27, 2023 at 11:59:42AM +0100, Luca Fancellu wrote:
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 10f37990be57..adf48fe8ac1d 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2952,6 +2952,17 @@ Currently, only the "sbsa_uart" model is supported for ARM.
>  
>  =back
>  
> +=item B<sve="NUMBER">
> +
> +To enable SVE, user must specify a number different from zero, maximum 2048 and
> +multiple of 128. That value will be the maximum number of SVE registers bits
> +that the hypervisor will impose to this guest. If the platform has a lower

Maybe start by describing what the "sve" value is before imposing
limits. Maybe something like:

    Set the maximum vector length that a guest's Scalable Vector
    Extension (SVE) can use. Or disable it by specifying 0, the default.

    Value needs to be a multiple of 128, with a maximum of 2048 or the
    maximum supported by the platform.

Would this, or something like that be a good explanation of the "sve"
configuration option?

> +supported bits value, then the domain creation will fail.
> +A value equal to zero is the default and it means this guest is not allowed to
> +use SVE.
> +
> +=back
> +
>  =head3 x86
>  
>  =over 4
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index ddc7b2a15975..16a49031fd51 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -211,6 +211,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          return ERROR_FAIL;
>      }
>  
> +    config->arch.sve_vl = d_config->b_info.arch_arm.sve;

This truncate a 16bit value into an 8bit value, I think you should check
that the value can actually fit.

And maybe check `d_config->b_info.arch_arm.sve` value here instead of
`xl` as commented later.

> +
>      return 0;
>  }
>  
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index fd31dacf7d5a..ef4a8358e54e 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -690,6 +690,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>  
>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                 ("vuart", libxl_vuart_type),
> +                               ("sve", uint16),

I wonder if renaming "sve" to "sve_vl" here would make sense, seeing
that "sve_vl" is actually used in other places.

>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                                ])),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1f6f47daf4e1..3cbc23b36952 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -12,6 +12,7 @@
>   * GNU Lesser General Public License for more details.
>   */
>  
> +#include <arm-arch-capabilities.h>

Could you add this headers after public ones?

>  #include <ctype.h>
>  #include <inttypes.h>
>  #include <limits.h>
> @@ -1312,8 +1313,6 @@ void parse_config_data(const char *config_source,
>          exit(EXIT_FAILURE);
>      }
>  
> -    libxl_physinfo_dispose(&physinfo);
> -
>      config= xlu_cfg_init(stderr, config_source);
>      if (!config) {
>          fprintf(stderr, "Failed to allocate for configuration\n");
> @@ -2887,6 +2886,29 @@ skip_usbdev:
>          }
>      }
>  
> +    if (!xlu_cfg_get_long (config, "sve", &l, 0)) {
> +        unsigned int arm_sve_vl =
> +            arch_capabilities_arm_sve(physinfo.arch_capabilities);
> +        if (!arm_sve_vl) {
> +            fprintf(stderr, "SVE is not supported by the platform\n");
> +            exit(-ERROR_FAIL);

"ERROR_FAIL" is a "libxl_error", instead exit with "EXIT_FAILURE".

> +        } else if (((l % 128) != 0) || (l > 2048)) {
> +            fprintf(stderr,
> +                    "Invalid sve value: %ld. Needs to be <= 2048 and multiple"
> +                    " of 128\n", l);
> +            exit(-ERROR_FAIL);
> +        } else if (l > arm_sve_vl) {
> +            fprintf(stderr,
> +                    "Invalid sve value: %ld. Platform supports up to %u bits\n",
> +                    l, arm_sve_vl);
> +            exit(-ERROR_FAIL);
> +        }
> +        /* Vector length is divided by 128 in domain configuration struct */

That's wrong, beside this comment there's nothing that say that
`b_info->arch_arm.sve` needs to have a value divided by 128.
`b_info->arch_arm.sve` is just of type uint16_t (libxl_type.idl).

BTW, "tools/xl" (xl) use just one user of "tools/libs/light" (libxl), so
it's possible that other users would set `sve` to a value that haven't
been checked. So I think all the check that the `sve` value is correct
could be done in libxl instead.


> +        b_info->arch_arm.sve = l / 128U;
> +    }
> +
> +    libxl_physinfo_dispose(&physinfo);
> +
>      parse_vkb_list(config, d_config);
>  
>      d_config->virtios = NULL;

Thanks,

-- 
Anthony PERARD

