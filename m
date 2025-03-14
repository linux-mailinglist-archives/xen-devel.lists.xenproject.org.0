Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68910A61773
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914851.1320472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8jK-0002fk-8s; Fri, 14 Mar 2025 17:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914851.1320472; Fri, 14 Mar 2025 17:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8jK-0002dM-5g; Fri, 14 Mar 2025 17:21:54 +0000
Received: by outflank-mailman (input) for mailman id 914851;
 Fri, 14 Mar 2025 17:21:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Ghv=WB=bounce.vates.tech=bounce-md_30504962.67d465a7.v1-256441ed796046d18e590df1063c32c2@srs-se1.protection.inumbo.net>)
 id 1tt8jI-0002dE-KP
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:21:52 +0000
Received: from mail136-29.atl41.mandrillapp.com
 (mail136-29.atl41.mandrillapp.com [198.2.136.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccd007b1-00f8-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:21:44 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-29.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZDrkv0hkSz6CQ6y4
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 17:21:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 256441ed796046d18e590df1063c32c2; Fri, 14 Mar 2025 17:21:43 +0000
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
X-Inumbo-ID: ccd007b1-00f8-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741972903; x=1742242903;
	bh=+ipbAFapUV5Tenj3xh/aa5u3Lx9iXG1q2x4JxsPfdd4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OKbNMYdJAbPOfa48hjBFo+llYsUEKGpa/WuHCKyi6pPUhBiy6dst9TVYmAdk+/K7L
	 AVjLVEQwADJVLskWITSCIMmZUwGgQheWi4E0oWkxq4Jv6ooceRPuPY4tONSevn0EDc
	 c9eiboyaIFud4uLupGKQMStbyYDxRASPFIY4NwytHGC5MQKJD+ACCmM45t4kRrlq37
	 cDvcU3utgYoc9Z/2jmzW8QSL7ch4yaeyCvex0xCXNR0RkLhGEGOGoktOkt7gkwk655
	 FrvsVwtMwQSVK9tWzDQMl2l+/r97BA5rWq894EwKGwoVr1y6MYqPfaXW+4lzbjoX3r
	 +0u5/ZAflNgrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741972903; x=1742233403; i=anthony.perard@vates.tech;
	bh=+ipbAFapUV5Tenj3xh/aa5u3Lx9iXG1q2x4JxsPfdd4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FCww7K91Ic6wLjnP+pEBt/vKebl/lO1Z/EqCmqSx4PGpeIWAjYF2vbRTg7Gdm5gso
	 wP4IKzXJRacfPOzL7zVjUyp/x2jzfvag+EqWRXk6FxBCjwIMoxasNQWgR/3uASmrMq
	 xwR3Xde8APugzEi+WoxF+TKTqSRvAlXWHUwuheCOSn+TDSh5xzXqkSxHtHH6DIIvX4
	 DdFnt5oduzSYVeSD9iUtWrOEX9rnwIN6GgVtCF0zh0Q0t7oPE+CNfSS60bHagsS/D5
	 5C7oYJ1xdKHSs1M0uwAk1P/xi4hatKWsU5WsEhjL/ty6tB+XM2LqSm3uKcU9CU5P6d
	 6SAUxOix9Wqxg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20v3=204/7]=20xen/arm:=20scmi:=20introduce=20SCI=20SCMI=20SMC=20multi-agent=20driver?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741972900861
To: "Grygorii Strashko" <gragst.linux@gmail.com>
Cc: xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Roger Pau Monne" <roger.pau@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Oleksii Moisieiev" <oleksii_moisieiev@epam.com>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Juergen Gross" <jgross@suse.com>, "Grygorii Strashko" <grygorii_strashko@epam.com>
Message-Id: <Z9RlpF7oAACpQdSi@l14>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com> <20250311111618.1850927-5-grygorii_strashko@epam.com>
In-Reply-To: <20250311111618.1850927-5-grygorii_strashko@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.256441ed796046d18e590df1063c32c2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250314:md
Date: Fri, 14 Mar 2025 17:21:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Mar 11, 2025 at 01:16:15PM +0200, Grygorii Strashko wrote:
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 7edf272386e3..fc6041724a13 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3126,6 +3126,21 @@ single SCMI OSPM agent support.
>  Should be used together with B<dom0_scmi_smc_passthrough> Xen command line
>  option.
>  
> +=item B<scmi_smc_multiagent>
> +
> +Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI over
> +SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmware-A)
> +with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
> +specified for the guest.
> +
> +=back

This new =back shouldn't exist in this patch, because there's no =over
been added. This just fix a bug present in the previous patch.

> +
> +=item B<agent_id=NUMBER>
> +
> +Specifies a non-zero ARM SCI agent id for the guest. This option is mandatory
> +if the SCMI SMC support is enabled for the guest. The agent ids of domains
> +existing on a single host must be unique.

Are they other restriction on what agent_id value can be? I mean from
the description -4242 is a valid value.

>  =back
>  
>  =back
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 8e50f6b7c7ac..bc3c64d6ec90 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1091,6 +1091,15 @@ which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom and
>  SCMI nodes removed from Dom0/hwdom device tree.
>  (for example, thin Dom0 with Driver domain use-case).
>  
> +### dom0_scmi_agent_id (ARM)
> +> `= <integer>`
> +
> +The option is available when `CONFIG_SCMI_SMC_MA` is compiled in, and allows to
> +enable SCMI functionality for Dom0 by specifying a non-zero ARM SCMI agent id.
> +The SCMI will be disabled for Dom0 if this option is not specified
> +(for example, thin Dom0 or dom0less use-cases).
> +The agent ids of domains existing on a single host must be unique.
> +
>  ### dtuart (ARM)
>  > `= path [:options]`
>  
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index d41adea1cefd..cdf5edb299af 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -229,6 +229,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
>          config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
>          break;
> +    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
> +        config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
> +        config->arch.arm_sci_agent_id = d_config->b_info.arm_sci.agent_id;
> +        break;
>      default:
>          LOG(ERROR, "Unknown ARM_SCI type %d",
>              d_config->b_info.arm_sci.type);
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index ea0d30654cdd..e6707c7ca9e7 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -553,11 +553,13 @@ libxl_sve_type = Enumeration("sve_type", [
>  
>  libxl_arm_sci_type = Enumeration("arm_sci_type", [
>      (0, "none"),
> -    (1, "scmi_smc")
> +    (1, "scmi_smc"),
> +    (2, "scmi_smc_multiagent")
>      ], init_val = "LIBXL_ARM_SCI_TYPE_NONE")
>  
>  libxl_arm_sci = Struct("arm_sci", [
>      ("type", libxl_arm_sci_type),
> +    ("agent_id", uint8)

Is it necessary to limit this value to a 8-bit value here? Skimming
through the Xen code, it seems that that value can be 32-bits at times,
but just restricted to 8-bits in the hypercall.

>      ])
>  
>  libxl_rdm_reserve = Struct("rdm_reserve", [
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index ac9bf0b25c5a..011222ec55b9 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1324,11 +1327,24 @@ static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
>                  tok = ptr + 1;
>              }
>              break;
> +        case STATE_AGENT_ID:
> +            if (*ptr == ',' || *ptr == '\0') {
> +                state = *ptr == ',' ? STATE_OPTION : STATE_TERMINAL;
> +                *ptr = '\0';
> +                arm_sci->agent_id = strtoul(tok, NULL, 0);

You should check that the value returned by strtoul() is actually valid
and does fit in `agent_id`.

> +                tok = ptr + 1;
> +            }
>          default:
>              break;
>          }
>      }
>  
> +    if (arm_sci->type == LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT &&
> +        arm_sci->agent_id == 0) {
> +        fprintf(stderr, "A non-zero ARM_SCI agent_id must be specified\n");
> +        goto parse_error;
> +    }
> +
>      if (tok != ptr || state != STATE_TERMINAL)
>          goto parse_error;
>  
> @@ -3042,6 +3058,7 @@ skip_usbdev:
>          libxl_arm_sci arm_sci = { 0 };
>          if (!parse_arm_sci_config(config, &arm_sci, buf)) {
>              b_info->arm_sci.type = arm_sci.type;
> +            b_info->arm_sci.agent_id = arm_sci.agent_id;

I just realise that it's probably enough to call
parse_arm_sci_config(.., &b_info->arm_sci) instead of declaring
another local `arm_sci` variable. Or is it necessary to have a different
variable somehow?

>          } else {
>              exit(EXIT_FAILURE);
>          }

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

