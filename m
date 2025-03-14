Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8BA61634
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 17:24:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914823.1320451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt7p8-0004pd-08; Fri, 14 Mar 2025 16:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914823.1320451; Fri, 14 Mar 2025 16:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt7p7-0004nB-TV; Fri, 14 Mar 2025 16:23:49 +0000
Received: by outflank-mailman (input) for mailman id 914823;
 Fri, 14 Mar 2025 16:23:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PtaC=WB=bounce.vates.tech=bounce-md_30504962.67d45811.v1-a5fbd9fc6a124724a3ab65f294e2fef1@srs-se1.protection.inumbo.net>)
 id 1tt7p6-0004n5-KK
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 16:23:48 +0000
Received: from mail177-1.suw61.mandrillapp.com
 (mail177-1.suw61.mandrillapp.com [198.2.177.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3cc1e70-00f0-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 17:23:46 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-1.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4ZDqS11MQTzBsThgs
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 16:23:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a5fbd9fc6a124724a3ab65f294e2fef1; Fri, 14 Mar 2025 16:23:45 +0000
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
X-Inumbo-ID: b3cc1e70-00f0-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741969425; x=1742239425;
	bh=5CX06zLw+evjXs5+uGO5+aj4meIwQUl2JK788qDrM9Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rWr7e1f+TcWzAxKjynY8d37UYozqi2PefA1qAuCtIHdFQt3pziV1veXa+His4ODa2
	 UbodPnmjCT/hYA4hPHeJiLjoPy3AAZRa6qfQdNwmiANwSOBN8uvOnNm6ZKSqp/jWOq
	 6JWobve5YeYz409/QvMmSc4hlJdC2AcZQ5bRtJzV7ZAI4sX7QJ/otdkXeGEpdMeK/w
	 2YhqYS8y9/2An+ey853fExGTU5IFvFta0NmxJuel31TAUr9Ed9Yvn7hn7bOaaxri8J
	 70G+f45E2vuZ3taKCdqHyYwBvuupbc8x3OU7ah3vbRFcUPlY1PXlQZ7LPL0VHaW7i7
	 W0yYJLboGQ8ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741969425; x=1742229925; i=anthony.perard@vates.tech;
	bh=5CX06zLw+evjXs5+uGO5+aj4meIwQUl2JK788qDrM9Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1HeoLbGPfHsH26WaMbuR7cfx7iCWBK5pHo9KM5H7w94+0qd3/TbiLl/J49+YqJ4vM
	 VpZY1ECzjQewzBgytQCHDQ67ZU31sW0jfKi3/FpmNiJfMaZciSwZmyAdJwljdczCGP
	 E7m0Z0P2EY3p0phZ9Lzw9WBadVcyC3IBWpNZLoWJSfKwFfSkglju6PEqe3cg7VkFps
	 9MqdfCRSlTcLW02PlTwme+y3MtbKSnrNPRRUoEqtQqMuRC0dzkYl/GlJjaBjnG8kSG
	 1GpRmrrTlYyfjzImgJ93EeMu2q1yFDebL6xHN2/VIUBS+Xg/Fv2guyc/SRjQbFNAME
	 0M3cr2hSLxraQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20v3=203/7]=20xen/arm:=20scmi-smc:=20passthrough=20SCMI=20SMC=20to=20guest=20domain?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741969422725
To: "Grygorii Strashko" <gragst.linux@gmail.com>
Cc: xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Roger Pau Monne" <roger.pau@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Oleksii Moisieiev" <oleksii_moisieiev@epam.com>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Juergen Gross" <jgross@suse.com>, "Grygorii Strashko" <grygorii_strashko@epam.com>
Message-Id: <Z9RYDnUtlzvw_xpI@l14>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com> <20250311111618.1850927-4-grygorii_strashko@epam.com>
In-Reply-To: <20250311111618.1850927-4-grygorii_strashko@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a5fbd9fc6a124724a3ab65f294e2fef1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250314:md
Date: Fri, 14 Mar 2025 16:23:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Mar 11, 2025 at 01:16:14PM +0200, Grygorii Strashko wrote:
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 8e1422104e50..7edf272386e3 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3094,6 +3094,42 @@ assigned to the domain.
>  
>  =back
>  
> +=over 4

This =over 4 is unnecessary, but you need to move that existing =back to
the end of the Arm section, just before "=head3 x86" that we can see in
the context of this patch. (And doing that will fix a compiliation
failure ;-))

> +=item B<arm_sci="ARM_SCI_STRING">
> +
> +Set ARM_SCI specific options for the guest. ARM SCI is System
> +Control Protocol allows domain to manage various functions that are provided
> +by HW platform firmware.
> +
> +B<ARM_SCI_STRING> is a comma separated list of C<KEY=VALUE> settings,
> +from the following list:
> +
> +=over 4
> +
> +=item B<type=STRING>
> +
> +Specifies an ARM SCI type for the guest.
> +
> +=over 4
> +
> +=item B<none>
> +
> +Don't allow guest to use ARM SCI if present on the platform. This is the
> +default value.
> +
> +=item B<scmi_smc>
> +
> +Enables ARM SCMI SMC support for the guest by enabling SCMI over SMC calls
> +forwarding from domain to the EL3 firmware (like Trusted Firmware-A) with a
> +single SCMI OSPM agent support.
> +Should be used together with B<dom0_scmi_smc_passthrough> Xen command line
> +option.
> +
> +=back
> +
> +=back
> +
>  =head3 x86
>  
>  =over 4
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index f8fe4afd7dca..5fa43637ab76 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -313,6 +313,11 @@
>   */
>  #define LIBXL_HAVE_BUILDINFO_ARCH_NR_SPIS 1
>  
> +/*
> + * libxl_domain_build_info has the arch_arm.sci* fields.

The new field seems to be called `arm_sci`. Did you intend to add `sci`
in `arch_arm` instead? Also, there's only `type` been added to
`arm_sci`, with the possibility to add more field in the future, so it
would be better to say that only "type" exist.

> + */
> +#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
> +
>  /*
>   * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
>   * 'soft reset' for domains and there is 'soft_reset' shutdown reason
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 33c9cfc1a267..ea0d30654cdd 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -551,6 +551,15 @@ libxl_sve_type = Enumeration("sve_type", [
>      (2048, "2048")
>      ], init_val = "LIBXL_SVE_TYPE_DISABLED")
>  
> +libxl_arm_sci_type = Enumeration("arm_sci_type", [
> +    (0, "none"),
> +    (1, "scmi_smc")
> +    ], init_val = "LIBXL_ARM_SCI_TYPE_NONE")
> +
> +libxl_arm_sci = Struct("arm_sci", [
> +    ("type", libxl_arm_sci_type),
> +    ])
> +
>  libxl_rdm_reserve = Struct("rdm_reserve", [
>      ("strategy",    libxl_rdm_reserve_strategy),
>      ("policy",      libxl_rdm_reserve_policy),
> @@ -639,6 +648,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      ("apic",             libxl_defbool),
>      ("dm_restrict",      libxl_defbool),
>      ("tee",              libxl_tee_type),
> +    ("arm_sci",          libxl_arm_sci),
>      ("u", KeyedUnion(None, libxl_domain_type, "type",
>                  [("hvm", Struct(None, [("firmware",         string),
>                                         ("bios",             libxl_bios_type),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 9a3679c02325..ac9bf0b25c5a 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1284,6 +1284,63 @@ out:
>      if (rc) exit(EXIT_FAILURE);
>  }
>  
> +static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
> +                                const char *str)
> +{
> +    enum {
> +        STATE_OPTION,
> +        STATE_TYPE,
> +        STATE_TERMINAL,
> +    };
> +    int ret, state = STATE_OPTION;
> +    char *buf2, *tok, *ptr, *end;
> +
> +    if (NULL == (buf2 = ptr = strdup(str)))
> +        return ERROR_NOMEM;
> +
> +    for (tok = ptr, end = ptr + strlen(ptr) + 1; ptr < end; ptr++) {
> +        switch(state) {
> +        case STATE_OPTION:
> +            if (*ptr == '=') {
> +                *ptr = '\0';
> +                if (!strcmp(tok, "type")) {
> +                    state = STATE_TYPE;
> +                } else {
> +                    fprintf(stderr, "Unknown ARM_SCI option: %s\n", tok);
> +                    goto parse_error;
> +                }
> +                tok = ptr + 1;
> +            }
> +            break;
> +        case STATE_TYPE:
> +            if (*ptr == '\0' || *ptr == ',') {
> +                state = *ptr == ',' ? STATE_OPTION : STATE_TERMINAL;
> +                *ptr = '\0';
> +                ret = libxl_arm_sci_type_from_string(tok, &arm_sci->type);
> +                if (ret) {
> +                    fprintf(stderr, "Unknown ARM_SCI type: %s\n", tok);
> +                    goto parse_error;
> +                }
> +                tok = ptr + 1;
> +            }
> +            break;
> +        default:
> +            break;

Instead of rolling your own parsing algo, could you do something similar
to the code that parse VIRTIO_DEVICE_STRING just above? It's basically a
loop with strtok() and a bunch of MATCH_OPTION() call (see
parse_virtio_config(), not the MATCH_OPTION for "type") which seems it
would be enough for parsing the SCI string. It would make
parse_arm_sci_config() much smaller and avoid a lot of repetition in the
code.

> +        }
> +    }
> +
> +    if (tok != ptr || state != STATE_TERMINAL)
> +        goto parse_error;
> +
> +    free(buf2);
> +
> +    return 0;
> +
> +parse_error:
> +    free(buf2);
> +    return ERROR_INVAL;
> +}
> +
>  void parse_config_data(const char *config_source,
>                         const char *config_data,
>                         int config_len,
> @@ -2981,6 +3038,15 @@ skip_usbdev:
>      if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
>          b_info->arch_arm.nr_spis = l;
>  
> +    if (!xlu_cfg_get_string(config, "arm_sci", &buf, 1)) {
> +        libxl_arm_sci arm_sci = { 0 };

Please use libxl_arm_sci_init() to initialise `arm_sci` instead. And add
a call to libxl_arm_sci_dispose() at the end of this context.

> +        if (!parse_arm_sci_config(config, &arm_sci, buf)) {
> +            b_info->arm_sci.type = arm_sci.type;
> +        } else {
> +            exit(EXIT_FAILURE);
> +        }
> +    }
> +
>      parse_vkb_list(config, d_config);
>  
>      d_config->virtios = NULL;

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

