Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 436356D6B55
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 20:16:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518107.804302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjlCe-0001E7-Cb; Tue, 04 Apr 2023 18:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518107.804302; Tue, 04 Apr 2023 18:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjlCe-0001B5-9U; Tue, 04 Apr 2023 18:16:20 +0000
Received: by outflank-mailman (input) for mailman id 518107;
 Tue, 04 Apr 2023 18:16:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rvLN=73=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1pjlCc-0001Az-Hg
 for xen-devel@lists.xen.org; Tue, 04 Apr 2023 18:16:18 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca1fe744-d314-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 20:16:17 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso1247661wmo.0
 for <xen-devel@lists.xen.org>; Tue, 04 Apr 2023 11:16:16 -0700 (PDT)
Received: from [192.168.0.106] ([91.123.150.38])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a05600c224e00b003ef5f77901dsm15728970wmm.45.2023.04.04.11.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 11:16:15 -0700 (PDT)
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
X-Inumbo-ID: ca1fe744-d314-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680632176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BCirR0DIa/QvXBN4OfZB+iKk1mo5LyWqNWEty91n8xk=;
        b=AtiqUKvX4AsMbxrDCCur/zsKdRRuNzxsmivIphJuZbGWHLchRBrx3Bu4Y4pL5NNuu9
         gG6iZU31EeFyCtKIbboiP4hpV+3JSbb27lTu6SwnAbGghTjdYSOQF7jOCCOIlt0gGTeD
         cTJnVwEFjieRi6H5T2uuNorqzdPtikxwMAMRXRMjEo6YDSodpV+Da/BY4hq/1Vw9nXe2
         9EHOrmLX0skiNRcFnWM2ss0FWcAo6YYaDG9Qm1LneIjjY7E6iyeafJn4KIvcBlBPIcIn
         p66Aaq8eGNhCFwmPwJ/FslvOgQt+xNZKNgoFpD3HuDs4JG5IRvoArFfxYMwL4TgZFqKS
         EaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCirR0DIa/QvXBN4OfZB+iKk1mo5LyWqNWEty91n8xk=;
        b=nPO27ig5JVXN1XEbk5nrz4Wr5ovUfkHcmSTTI9r0mc1yk9xxNpwgQqAts8ttCOXQ1Z
         Kl7YvqxlhqWtGeHFDdCRTK/0+6PZKWCRm8IJCxOOV4Sng4hGxTTcofbZxIP0zffG1Biw
         vuKuRL2YvaYVux4+mbx5/eLxtIn4APdY2qpW0YPmc/zvpOrKtfMlZV87PRg5kfNf4haH
         TaH8fSniYujLfl/0+3Cdvjz9BlQ5dAXrJG/c3ZMl/FSTHl3q2ceVMNbSdIIib3lW2nhM
         beF9mM29Hyd3zfoNSi+CsT3ThWGGRMTfb1cRte2Qm6JUQ/lW438NNR31183d8DVgNPqU
         B4UA==
X-Gm-Message-State: AAQBX9e+UnCY1EqIdAUmqdKDIwURBE3euTT9j1Zm0ip99QYwGgXvhb6w
	Ynl7BKnQNHgDbuZpeQzEqEg=
X-Google-Smtp-Source: AKy350YOF8FfjzS9Aayo5g4ZcE9hqYtbwccdFVeyWjdirZtdMoLh46cHTvoZGnOtElOFokm2PtkFKw==
X-Received: by 2002:a05:600c:acb:b0:3dc:55d9:ec8 with SMTP id c11-20020a05600c0acb00b003dc55d90ec8mr2596346wmr.41.1680632175538;
        Tue, 04 Apr 2023 11:16:15 -0700 (PDT)
Message-ID: <25fb2b71-b663-b712-01cd-5c75aa4ccf9b@gmail.com>
Date: Tue, 4 Apr 2023 21:16:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] libxl: arm: Allow grant mappings for backends running on
 Dom0
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org,
 stratos-dev@op-lists.linaro.org, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Mathieu Poirier <mathieu.poirier@linaro.com>,
 Erik Schilling <erik.schilling@linaro.org>
References: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30.03.23 11:43, Viresh Kumar wrote:

Hello Viresh

> Currently, we add grant mapping related device tree properties if the
> backend domain is not Dom0. While Dom0 is privileged and can do foreign
> mapping for the entire guest memory, it is still okay for Dom0 to access
> guest's memory via grant mappings and hence map only what is required.

ok, probably makes sense

> 
> This commit adds another parameter for virtio devices, with which they
> can do forced grant mappings irrespective of the backend domain id.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>


In general patch lgtm, just a few comments below


> ---
>   docs/man/xl.cfg.5.pod.in         |  4 ++++
>   tools/libs/light/libxl_arm.c     | 21 ++++++++++++---------
>   tools/libs/light/libxl_types.idl |  1 +
>   tools/libs/light/libxl_virtio.c  | 11 +++++++++++
>   tools/xl/xl_parse.c              |  2 ++
>   5 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 10f37990be57..4879f136aab8 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1616,6 +1616,10 @@ properties in the Device Tree, the type field must be set to "virtio,device".
>   Specifies the transport mechanism for the Virtio device, only "mmio" is
>   supported for now.
>   
> +=item B<forced_grant=BOOLEAN>
> +
> +Allows Xen Grant memory mapping to be done from Dom0.


Asumming it is disabled by default, I would add the following:

The default is (0) false.

> +
>   =falback
>   
>   =item B<tee="STRING">
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 97c80d7ed0fa..ec2f1844e9b3 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -922,7 +922,8 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
>   
>   /* The caller is responsible to complete / close the fdt node */
>   static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
> -                                        uint32_t irq, uint32_t backend_domid)
> +                                        uint32_t irq, uint32_t backend_domid,
> +                                        bool forced_grant)
>   {
>       int res;
>       gic_interrupt intr;
> @@ -945,7 +946,7 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
>       res = fdt_property(fdt, "dma-coherent", NULL, 0);
>       if (res) return res;
>   
> -    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
> +    if (forced_grant || backend_domid != LIBXL_TOOLSTACK_DOMID) {
>           uint32_t iommus_prop[2];
>   
>           iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
> @@ -959,11 +960,12 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
>   }
>   
>   static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
> -                                 uint32_t irq, uint32_t backend_domid)
> +                                 uint32_t irq, uint32_t backend_domid,
> +                                 bool forced_grant)
>   {
>       int res;
>   
> -    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid, forced_grant);
>       if (res) return res;
>   
>       return fdt_end_node(fdt);
> @@ -1019,11 +1021,11 @@ static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt)
>   
>   static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
>                                           uint32_t irq, const char *type,
> -                                        uint32_t backend_domid)
> +                                        uint32_t backend_domid, bool forced_grant)
>   {
>       int res;
>   
> -    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid, forced_grant);
>       if (res) return res;
>   
>       /* Add device specific nodes */
> @@ -1363,7 +1365,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>                       iommu_needed = true;
>   
>                   FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
> -                                           disk->backend_domid) );
> +                                           disk->backend_domid, false) );
>               }
>           }
>   
> @@ -1373,12 +1375,13 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>               if (virtio->transport != LIBXL_VIRTIO_TRANSPORT_MMIO)
>                   continue;
>   
> -            if (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID)
> +            if (virtio->forced_grant || virtio->backend_domid != LIBXL_TOOLSTACK_DOMID)
>                   iommu_needed = true;
>   
>               FDT( make_virtio_mmio_node_device(gc, fdt, virtio->base,
>                                                 virtio->irq, virtio->type,
> -                                              virtio->backend_domid) );
> +                                              virtio->backend_domid,
> +                                              virtio->forced_grant) );
>           }
>   
>           /*
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index c10292e0d7e3..cfbcd717dc7f 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -740,6 +740,7 @@ libxl_device_virtio = Struct("device_virtio", [
>       ("backend_domname", string),
>       ("type", string),
>       ("transport", libxl_virtio_transport),
> +    ("forced_grant", bool),


If I remember correctly when making any updates here we also need to 
regenerate golang bindings.


>       ("devid", libxl_devid),
>       # Note that virtio-mmio parameters (irq and base) are for internal
>       # use by libxl and can't be modified.
> diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
> index faada49e184e..e1f15344ef97 100644
> --- a/tools/libs/light/libxl_virtio.c
> +++ b/tools/libs/light/libxl_virtio.c
> @@ -48,11 +48,13 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
>       flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->base));
>       flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
>       flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
> +    flexarray_append_pair(back, "forced_grant", GCSPRINTF("%u", virtio->forced_grant));
>   
>       flexarray_append_pair(front, "irq", GCSPRINTF("%u", virtio->irq));
>       flexarray_append_pair(front, "base", GCSPRINTF("%#"PRIx64, virtio->base));
>       flexarray_append_pair(front, "type", GCSPRINTF("%s", virtio->type));
>       flexarray_append_pair(front, "transport", GCSPRINTF("%s", transport));
> +    flexarray_append_pair(front, "forced_grant", GCSPRINTF("%u", virtio->forced_grant));
>   
>       return 0;
>   }
> @@ -104,6 +106,15 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
>           }
>       }
>   
> +    tmp = NULL;
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +				GCSPRINTF("%s/forced_grant", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        virtio->forced_grant = strtoul(tmp, NULL, 0);
> +    }

I would add "else" case, something like:

{
     LOG(DEBUG, "Missing xenstore node %s/forced_grant,
                 assuming it is disabled", libxl_path);
     virtio->forced_grant = 0;
}

> +
>       tmp = NULL;
>       rc = libxl__xs_read_checked(gc, XBT_NULL,
>   				GCSPRINTF("%s/type", be_path), &tmp);
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1f6f47daf4e1..3e34da099785 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1215,6 +1215,8 @@ static int parse_virtio_config(libxl_device_virtio *virtio, char *token)
>       } else if (MATCH_OPTION("transport", token, oparg)) {
>           rc = libxl_virtio_transport_from_string(oparg, &virtio->transport);
>           if (rc) return rc;
> +    } else if (MATCH_OPTION("forced_grant", token, oparg)) {
> +        virtio->forced_grant = strtoul(oparg, NULL, 0);
>       } else {
>           fprintf(stderr, "Unknown string \"%s\" in virtio spec\n", token);
>           return -1;

