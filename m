Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C7640BE9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 18:18:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452181.710000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p19ee-0002fI-B0; Fri, 02 Dec 2022 17:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452181.710000; Fri, 02 Dec 2022 17:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p19ee-0002cc-89; Fri, 02 Dec 2022 17:16:52 +0000
Received: by outflank-mailman (input) for mailman id 452181;
 Fri, 02 Dec 2022 17:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmEy=4A=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p19ec-0002cW-Bo
 for xen-devel@lists.xen.org; Fri, 02 Dec 2022 17:16:50 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19f10cad-7265-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 18:16:48 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 n16-20020a05600c3b9000b003d08febff59so231220wms.3
 for <xen-devel@lists.xen.org>; Fri, 02 Dec 2022 09:16:47 -0800 (PST)
Received: from [10.17.77.118] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 k27-20020a5d525b000000b00242269c8b8esm7356725wrc.25.2022.12.02.09.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 09:16:45 -0800 (PST)
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
X-Inumbo-ID: 19f10cad-7265-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ttw8LbpKM0eEHzqaWPjSFujvnFjrkiLdIm4RuQPgm68=;
        b=mZsqAgBUdIR0eadbI9pQj8rdKAjKREhKFn/63ugAZSz5YJIlMcoUlkqHXINawFvv/1
         JqXqUf+yY4/4/WiH47BFwA1cNx+8MswYZkC+e3zxcYrAtb6WnOxaOvtaoe5ViKSCO3b7
         +q2jWQhU5WybRocbGWAdXjPp2cP42IA0Ay9MvbhKAAkomZDXc5xQVOV9hY9CXkZ5blu0
         4kP4ej1SZbq7AZjZl7rRO13PGJV4HmHmbm38xZ0mO5D0jPvg6SVc6J9+UfqEUY9hjn/h
         fwlkeT6Y879Q/gwCeWluKz0bfgCKh4z+gz1ad2IfonQQ+WYFBGxaJ3/rnru2dVTIRxWL
         4DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttw8LbpKM0eEHzqaWPjSFujvnFjrkiLdIm4RuQPgm68=;
        b=Ni3g8xej1Lq/KHjJcLMqHK4+HyM6AA/xdJSF919hYAedQLMUoUujdk/2dezn6HUa40
         WeLO5ydUshmk5wrJtNXfkdI8IjuP/uWiW7VzqSJ2jTpKEnzpJIkc0i+r848KfZRAKl/Z
         Ue28st3iAKaO+qPSO2KLc5y61nAPXPanRzwPfLvh29sLYmzi9ES8d8qCXUrXTHvkq9PF
         v26sZWW9BG0ULA5H5za1C3jeIapFT7cBOmmuh/htv3Q7g2mZ8S0RFzLuOxVyWgUTu+rN
         ab6Zw93YxAHq2Y056pSPezhpfYbqpv34CBNKuOCwo3UNlI7FaYGsXkbQPg619II/bAXX
         T3JQ==
X-Gm-Message-State: ANoB5plAnTe9bwlf8oosuCUkMnn3MKDu9cqE7so2SbNVM0sBIwCSEpIR
	hN0U94sSgnFH4B1GCtqqi1Y=
X-Google-Smtp-Source: AA0mqf5HAYjean4uqRAqWMEpNe9fRscNZxY/Be0e4mD6gRbgjd8B6JmsoT3jk/xCXu8GKGB9AflUnw==
X-Received: by 2002:a05:600c:2213:b0:3cf:a6eb:3290 with SMTP id z19-20020a05600c221300b003cfa6eb3290mr46282203wml.116.1670001406573;
        Fri, 02 Dec 2022 09:16:46 -0800 (PST)
Message-ID: <4a355c28-9596-cfbd-ffd2-2f8d9dde9938@gmail.com>
Date: Fri, 2 Dec 2022 19:16:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V6 2/3] xl: Add support to parse generic virtio device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xen.org,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <73663851c5223b99ed0f23a163a0d44cba0ebe29.1667906228.git.viresh.kumar@linaro.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <73663851c5223b99ed0f23a163a0d44cba0ebe29.1667906228.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08.11.22 13:23, Viresh Kumar wrote:


Hello Viresh

[sorry for the possible format issues if any]

> This patch adds basic support for parsing generic Virtio backend.
> 
> An example of domain configuration for mmio based Virtio I2C device is:
> virtio = ["type=virtio,device22,transport=mmio"]
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/ocaml/libs/xl/genwrap.py       |  1 +
>   tools/ocaml/libs/xl/xenlight_stubs.c |  1 +
>   tools/xl/xl_parse.c                  | 84 ++++++++++++++++++++++++++++
>   3 files changed, 86 insertions(+)
> 
> diff --git a/tools/ocaml/libs/xl/genwrap.py b/tools/ocaml/libs/xl/genwrap.py
> index 7bf26bdcd831..b188104299b1 100644
> --- a/tools/ocaml/libs/xl/genwrap.py
> +++ b/tools/ocaml/libs/xl/genwrap.py
> @@ -36,6 +36,7 @@ DEVICE_LIST =      [ ("list",           ["ctx", "domid", "t list"]),
>   functions = { # ( name , [type1,type2,....] )
>       "device_vfb":     DEVICE_FUNCTIONS,
>       "device_vkb":     DEVICE_FUNCTIONS,
> +    "device_virtio":     DEVICE_FUNCTIONS,
>       "device_disk":    DEVICE_FUNCTIONS + DEVICE_LIST +
>                         [ ("insert",         ["ctx", "t", "domid", "?async:'a", "unit", "unit"]),
>                           ("of_vdev",        ["ctx", "domid", "string", "t"]),
> diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
> index 45b8af61c74a..8e54f95da7c7 100644
> --- a/tools/ocaml/libs/xl/xenlight_stubs.c
> +++ b/tools/ocaml/libs/xl/xenlight_stubs.c
> @@ -707,6 +707,7 @@ DEVICE_ADDREMOVE(disk)
>   DEVICE_ADDREMOVE(nic)
>   DEVICE_ADDREMOVE(vfb)
>   DEVICE_ADDREMOVE(vkb)
> +DEVICE_ADDREMOVE(virtio)
>   DEVICE_ADDREMOVE(pci)
>   _DEVICE_ADDREMOVE(disk, cdrom, insert)
>   
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1b5381cef033..c6f35c069d2a 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1208,6 +1208,87 @@ static void parse_vkb_list(const XLU_Config *config,
>       if (rc) exit(EXIT_FAILURE);
>   }
>   
> +static int parse_virtio_config(libxl_device_virtio *virtio, char *token)
> +{
> +    char *oparg;
> +    int rc;
> +
> +    if (MATCH_OPTION("backend", token, oparg)) {
> +        virtio->backend_domname = strdup(oparg);
> +    } else if (MATCH_OPTION("type", token, oparg)) {
> +        virtio->type = strdup(oparg);
> +    } else if (MATCH_OPTION("transport", token, oparg)) {
> +        rc = libxl_virtio_transport_from_string(oparg, &virtio->transport);
> +        if (rc) return rc;
> +    } else if (MATCH_OPTION("irq", token, oparg)) {
> +        virtio->irq = strtoul(oparg, NULL, 0);
> +    } else if (MATCH_OPTION("base", token, oparg)) {
> +        virtio->base = strtoul(oparg, NULL, 0);


Interesting, I see you allow user to configure virtio-mmio params (irq 
and base), as far as I remember for virtio-disk these are internal only 
(allocated by tools/libs/light/libxl_arm.c).

I am not really sure why we need to configure virtio "base", could you 
please clarify? But if we really want/need to be able to configure 
virtio "irq" (for example to avoid possible clashing with physical one), 
I am afraid, this will require more changes that current patch does. 
Within current series saving virtio->irq here doesn't have any effect as 
it will be overwritten in 
libxl__arch_domain_prepare_config()->alloc_virtio_mmio_params() anyway. 
I presume the code in libxl__arch_domain_prepare_config() shouldn't try 
to allocate virtio->irq if it is already configured by user, also the 
allocator should probably take into the account of what is already 
configured by user, to avoid allocating the same irq for another device 
assigned for the same guest.

Also doc change in the subsequent patch doesn't mention about irq/base 
configuration.


So maybe we should just drop for now?
+    } else if (MATCH_OPTION("irq", token, oparg)) {
+        virtio->irq = strtoul(oparg, NULL, 0);
+    } else if (MATCH_OPTION("base", token, oparg)) {
+        virtio->base = strtoul(oparg, NULL, 0);



> +    } else {
> +        fprintf(stderr, "Unknown string \"%s\" in virtio spec\n", token);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static void parse_virtio_list(const XLU_Config *config,
> +                              libxl_domain_config *d_config)
> +{
> +    XLU_ConfigList *virtios;
> +    const char *item;
> +    char *buf = NULL, *oparg, *str = NULL;
> +    int rc;
> +
> +    if (!xlu_cfg_get_list (config, "virtio", &virtios, 0, 0)) {
> +        int entry = 0;
> +        while ((item = xlu_cfg_get_listitem(virtios, entry)) != NULL) {
> +            libxl_device_virtio *virtio;
> +            char *p;
> +
> +            virtio = ARRAY_EXTEND_INIT(d_config->virtios, d_config->num_virtios,
> +                                       libxl_device_virtio_init);
> +
> +            buf = strdup(item);
> +
> +            p = strtok(buf, ",");
> +            while (p != NULL)
> +            {
> +                while (*p == ' ') p++;
> +
> +                // Type may contain a comma, do special handling.
> +                if (MATCH_OPTION("type", p, oparg)) {
> +                    if (!strncmp(oparg, "virtio", strlen("virtio"))) {
> +                        char *p2 = strtok(NULL, ",");
> +                        str = malloc(strlen(p) + strlen(p2) + 2);
> +
> +                        strcpy(str, p);
> +                        strcat(str, ",");
> +                        strcat(str, p2);
> +                        p = str;
> +                    }
> +                }
> +
> +                rc = parse_virtio_config(virtio, p);
> +                if (rc) goto out;
> +
> +                free(str);
> +                str = NULL;
> +                p = strtok(NULL, ",");
> +            }
> +
> +            entry++;
> +            free(buf);
> +        }
> +    }
> +
> +    return;
> +
> +out:
> +    free(buf);
> +    if (rc) exit(EXIT_FAILURE);
> +}
> +
>   void parse_config_data(const char *config_source,
>                          const char *config_data,
>                          int config_len,
> @@ -2309,8 +2390,10 @@ void parse_config_data(const char *config_source,
>   
>       d_config->num_vfbs = 0;
>       d_config->num_vkbs = 0;
> +    d_config->num_virtios = 0;
>       d_config->vfbs = NULL;
>       d_config->vkbs = NULL;
> +    d_config->virtios = NULL;
>   
>       if (!xlu_cfg_get_list (config, "vfb", &cvfbs, 0, 0)) {
>           while ((buf = xlu_cfg_get_listitem (cvfbs, d_config->num_vfbs)) != NULL) {
> @@ -2752,6 +2835,7 @@ void parse_config_data(const char *config_source,
>       }
>   
>       parse_vkb_list(config, d_config);
> +    parse_virtio_list(config, d_config);
>   
>       xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
>                           &c_info->xend_suspend_evtchn_compat, 0);

