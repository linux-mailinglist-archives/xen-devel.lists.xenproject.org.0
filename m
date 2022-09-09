Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9236D5B3561
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 12:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404184.646548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbRi-0007Ub-SA; Fri, 09 Sep 2022 10:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404184.646548; Fri, 09 Sep 2022 10:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbRi-0007Sm-PE; Fri, 09 Sep 2022 10:41:14 +0000
Received: by outflank-mailman (input) for mailman id 404184;
 Fri, 09 Sep 2022 10:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuYE=ZM=citrix.com=prvs=244871dc4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oWbRh-0007Sg-8a
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 10:41:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea56f99b-302b-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 12:41:10 +0200 (CEST)
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
X-Inumbo-ID: ea56f99b-302b-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662720070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q99TtwwivTeANDgHsIWDOW/0lDXgSaGmCYl/tUxMWFc=;
  b=UC1Ve2uH17Iw54hJfF+YGmOBW0EJNENVGz7EeYwQgkcQMqI6YpTe3Xza
   7CgIDY5wu5Ql3jhblEQQdecGAlULT/tGfu+eSxKIRaP5AdaTKdkRtufvc
   7TXMkVchNhJulWTkPu0EF+0mwt6WzKF+NiPwsgZb+Xn3A2jCNc1gZTxld
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80135663
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RwWnCq2Rt4k6xAvxt/bD5dhxkn2cJEfYwER7XKvMYLTBsI5bpzwEz
 2QbWm3UafuIZmKmfo8jaYu290hX6sTcmoBqTFNrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrS8EI35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6/dLJ0gMGY4ywc1MDm4Q6
 fAbLncrQTnW0opawJrjIgVtrsEqLc2tN4IDoHBwizreCJ7KQ7iaHf+Mv4UBmm5t2IYeRp4yZ
 OJAAdZrRB3Gfx1IPEZREJ8klf2krnL+bydZuBSeoq9fD237nFQoi+WzboG9ltqiGIJLhEmem
 Hv89EvTGC4zM4STxD2b7Sf57gPItXyiA99DfFGizdZwh0aZ3GsUCxs+Wl6yoP3/gUm7M/pdJ
 FYT4TEGtrUp+QqgSdyVdwK8iG6JuFgbQdU4O+8z7g2X27fXywmcD2kACDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgddE1FDuYO65thu0FSfFb6PDZJZkPX3PBr5+
 RSJhhMVvLoc09IH1KP823/u1mfESofycuIl2unGdjv7sFknP9f+O9PABUvztqgZctvAJrWVl
 D1dwpXFsrhTZX2YvHbVKNjhCo1F8Bps3Nf0pVd0V6cs+D22k5JIVdABuWouTKuF3yttRNMIX
 KMwkVkLjHOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX8wPxDOhTmyyhFxzsnT3
 Kt3lu71VR4n5VlPlmLqF4/xL5dwrszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzUwzN14vd+V29z
 jqqH5HVo/mpeLGhP3K/HE96BQxiEEXX8rit85ULKrbaeFM8cIzjYteIqY4cl0Vet/w9vo/1E
 ruVAye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:iAJr+KnWtTv3yEls1i9waBsga2HpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.93,303,1654574400"; 
   d="scan'208";a="80135663"
Date: Fri, 9 Sep 2022 11:40:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH v2 3/3] xl/libxl: Add OEM string support to smbios
Message-ID: <YxsYOzeM6JHidkmL@perard.uk.xensource.com>
References: <20220908195113.218201-1-jandryuk@gmail.com>
 <20220908195113.218201-4-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220908195113.218201-4-jandryuk@gmail.com>

On Thu, Sep 08, 2022 at 03:51:13PM -0400, Jason Andryuk wrote:
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index c3125ed310..0b01e09632 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -773,8 +774,18 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
>  
>      for (int i = 0; i < info->u.hvm.num_smbios; i++) {
>          char *p;
> -        path = GCSPRINTF("/local/domain/%d/"HVM_XS_BIOS_STRINGS"/%s", domid,
> -                   libxl_smbios_type_to_string(info->u.hvm.smbios[i].key));
> +        if (info->u.hvm.smbios[i].key == LIBXL_SMBIOS_TYPE_OEM) {
> +            if (num_oem > 99) {
> +                ret = ERROR_INVAL;

We probably want to log an error message here, to explain why libxl
returns an error.

> +                goto err;
> +            }
> +            path = GCSPRINTF("/local/domain/%d/"HVM_XS_OEM_STRINGS, domid,
> +                             num_oem);
> +            num_oem++;
> +        } else {
> +            path = GCSPRINTF("/local/domain/%d/"HVM_XS_BIOS_STRINGS"/%s", domid,
> +                       libxl_smbios_type_to_string(info->u.hvm.smbios[i].key));
> +        }
>  
>          /* Convert libxl_smbios_type string to xenstore path that hvmloader
>             will use, as defined by HVM_XS_*. That is convert the '_' to '-'. */
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 5413c36645..d0f8a14827 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1823,6 +1826,15 @@ void parse_config_data(const char *config_source,
>                  }
>                  free(option);
>  
> +                if (v == LIBXL_SMBIOS_TYPE_OEM) {
> +                    if (num_oem > 99) {
> +                        fprintf(stderr,
> +                                "xl: smbios limited to 99 oem strings\n");
> +                        exit(-ERROR_FAIL);

Could you change the exit value to be EXIT_FAILURE instead, like in the
other patch?
(ERROR_FAIL is meant to be an libxl return value and it somehow spread
to xl.)

Thanks,

-- 
Anthony PERARD

