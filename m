Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0704764E8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 22:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247594.426940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxcAz-0000Kv-MD; Wed, 15 Dec 2021 21:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247594.426940; Wed, 15 Dec 2021 21:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxcAz-0000Hw-JB; Wed, 15 Dec 2021 21:51:05 +0000
Received: by outflank-mailman (input) for mailman id 247594;
 Wed, 15 Dec 2021 21:51:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uCzL=RA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxcAx-0000Hq-Rz
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 21:51:03 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18d217e2-5df1-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 22:51:02 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id v15so35500671ljc.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Dec 2021 13:51:02 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g4sm506559lfv.288.2021.12.15.13.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 13:51:01 -0800 (PST)
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
X-Inumbo-ID: 18d217e2-5df1-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8O4J/UkN625MCM8eP8JBhOC2AERJVO0d+hzUxg4cM7A=;
        b=CzHvo9caOUp/6mGaZh7vCACLSHw8VH9F4npPF+D/alP1iugILNStvh1KjX2aRFPFRH
         6mHzqOXWeZXwKZK5zDebytNGmL6RgxS6I4Apdq6d/VNZcAEjhHM//t0QjyP9iyV8qJIk
         A6Pv3FXJ8VHLRLIfcRm0irASt8CiK5CKSYZ660HB78aMIpmBFMqfmMtbfRyj6cEJ8J6r
         k//uwR1d/trO0HOSt3x17ErEOP7zlTpcHonA8QLJe/FlLON/PUyxYt+vQd8TlrYeigmL
         T4EACiCPNazMZX1tCuyLLbRqISEAGI+mmRGP5OrEMtP8tpN79yA+vjj9orztJBTcDO8n
         mDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8O4J/UkN625MCM8eP8JBhOC2AERJVO0d+hzUxg4cM7A=;
        b=r/F4OMuFiSsH1o8aphES32ILha4UUPi1kz9Sq4jIsjY3YrJcMl9eZNUyFJuGE1ncZY
         W3CI4CdHaxVPR9/VbGNLFAWWpNJTBXj2kTP+BneN1ANZsE6HtEJxJlAuT1N0C4r8WsXg
         gwyu58Lj4F5VM9uN2/iVSYILbiYW+3x6F1b59YxHhNjmOOVSveIatsNVI/GJK0Dsy8km
         Ly4pjMgpGO8yGst8lVF1GxPS1ekojhgAFpHNd/bTMClHp+v6HvaSbX5eXawYF1fXl+oe
         WxV8DcC7VdvTTErqvsKox6ZvkKDSplHEIJEssbLZ/7OZof/z198APZcqzhFxYDo/ZLLN
         i7TA==
X-Gm-Message-State: AOAM531F3qUhS3r/aJtGp6fk9He0MARxtzlX/OoZEi+9jAnh4mjkKBRP
	KkFnvElBOTG3vNGRpI/kNsE=
X-Google-Smtp-Source: ABdhPJzupP0E/ypx+DBPQWHcdsRqkcWgZoMe5QO5Eyujt7MBgWcO49ejLCu6//tiDHbR8Y+fkwmT/A==
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr12379761ljg.265.1639605062289;
        Wed, 15 Dec 2021 13:51:02 -0800 (PST)
Subject: Re: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <eaed4dac-219f-39ae-7237-0ae67c77869a@gmail.com>
Date: Wed, 15 Dec 2021 23:51:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 14.12.21 11:34, Oleksii Moisieiev wrote:


Hi Oleksii

> This enumeration sets SCI type for the domain. Currently there is
> two possible options: either 'none' or 'scmi_smc'.
>
> 'none' is the default value and it disables SCI support at all.
>
> 'scmi_smc' enables access to the Firmware from the domains using SCMI
> protocol and SMC as transport.
>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>   docs/man/xl.cfg.5.pod.in         | 22 ++++++++++++++++++++++
>   tools/include/libxl.h            |  5 +++++
>   tools/libs/light/libxl_types.idl |  6 ++++++
>   tools/xl/xl_parse.c              |  9 +++++++++
>   4 files changed, 42 insertions(+)
>
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index b98d161398..92d0593875 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1614,6 +1614,28 @@ This feature is a B<technology preview>.
>   
>   =back
>   
> +=item B<sci="STRING">
> +
> +B<Arm only> Set SCI type for the guest. SCI is System Control Protocol -
> +allows domain to manage various functions that are provided by HW platform.
> +
> +=over 4
> +
> +=item B<none>
> +
> +Don't allow guest to use SCI if present on the platform. This is the default
> +value.
> +
> +=item B<scmi_smc>
> +
> +Enables SCMI-SMC support for the guest. SCMI is System Control Management
> +Inferface - allows domain to manage various functions that are provided by HW
> +platform, such as clocks, resets and power-domains. Xen will mediate access to
> +clocks, power-domains and resets between Domains and ATF. Disabled by default.
> +SMC is used as transport.
> +
> +=back
> +
>   =back
>   
>   =head2 Paravirtualised (PV) Guest Specific Options
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 2bbbd21f0b..30e5aee119 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -278,6 +278,11 @@
>    */
>   #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
>   
> +/*
> + * libxl_domain_build_info has the arch_arm.sci field.
> + */
> +#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
> +
>   /*
>    * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
>    * 'soft reset' for domains and there is 'soft_reset' shutdown reason
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 2a42da2f7d..9067b509f4 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl

I assume that at least goland bindings want updating.


> @@ -480,6 +480,11 @@ libxl_tee_type = Enumeration("tee_type", [
>       (1, "optee")
>       ], init_val = "LIBXL_TEE_TYPE_NONE")
>   
> +libxl_sci_type = Enumeration("sci_type", [
> +    (0, "none"),
> +    (1, "scmi_smc")
> +    ], init_val = "LIBXL_SCI_TYPE_NONE")
> +
>   libxl_rdm_reserve = Struct("rdm_reserve", [
>       ("strategy",    libxl_rdm_reserve_strategy),
>       ("policy",      libxl_rdm_reserve_policy),
> @@ -564,6 +569,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>       ("apic",             libxl_defbool),
>       ("dm_restrict",      libxl_defbool),
>       ("tee",              libxl_tee_type),
> +    ("sci",              libxl_sci_type),
>       ("u", KeyedUnion(None, libxl_domain_type, "type",
>                   [("hvm", Struct(None, [("firmware",         string),
>                                          ("bios",             libxl_bios_type),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 117fcdcb2b..c37bf6298b 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2747,6 +2747,15 @@ skip_usbdev:
>           }
>       }
>   
> +    if (!xlu_cfg_get_string (config, "sci", &buf, 1)) {
> +        e = libxl_sci_type_from_string(buf, &b_info->sci);
> +        if (e) {
> +            fprintf(stderr,
> +                    "Unknown sci \"%s\" specified\n", buf);
> +            exit(-ERROR_FAIL);
> +        }
> +    }
> +
>       parse_vkb_list(config, d_config);
>   
>       xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",

-- 
Regards,

Oleksandr Tyshchenko


