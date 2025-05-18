Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179EAABB085
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 16:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989225.1373464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGf5i-0002XI-Bf; Sun, 18 May 2025 14:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989225.1373464; Sun, 18 May 2025 14:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGf5i-0002UO-75; Sun, 18 May 2025 14:34:14 +0000
Received: by outflank-mailman (input) for mailman id 989225;
 Sun, 18 May 2025 14:34:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGf5g-0002UG-QW
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 14:34:12 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28cd1358-33f5-11f0-9eb8-5ba50f476ded;
 Sun, 18 May 2025 16:34:09 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a361b8a66cso1208816f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 07:34:09 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca888afsm9683908f8f.64.2025.05.18.07.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 07:34:08 -0700 (PDT)
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
X-Inumbo-ID: 28cd1358-33f5-11f0-9eb8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747578849; x=1748183649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCdUb2w5Rpp8XYVS99BXt7Tk1WRjOdMZ1zjppMB850g=;
        b=SFRFyP0nEHOOBQ3NhNYO2UZEfRqDQYLxd6bvwalGUlLOIzP8nZLqFkNrUri1ZbGVaH
         /tgfwiR4MDbXnC3tdAUE6s47ksjVymfwWZSv5V8riAYgrCTO4ssQ+4LijobVyutNF3fj
         7es+38LKcpaYiXypER73tRW4nmVmM4UR8+yfh1a8dY+jvA9tFTra8Sh+NX0CtZHbeOP9
         iGXhi5GuO2BgO9gBvK+7wzEu9ipWnCUfBjmZznJO8GqikEc1b0jegxVAVe7tggCra79a
         7/OUEv36ZKbDO0QBHZbmFegunEc5TyPNtIHhtYRYuezqmtWphwlu5L9O3Rhbp4qywwOl
         cXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747578849; x=1748183649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCdUb2w5Rpp8XYVS99BXt7Tk1WRjOdMZ1zjppMB850g=;
        b=K6q+U6qOCq8AhA46hMvbXlRxt8YfQFPRt0AY2BX93ikQEVEzDveY8/1WDn9o0v4+uW
         kM8tE+c7BJ3ZZLW3/UDh7+i868i4s6d9VT0nizxWBeerdBV5eq/dKliuJjarl1/9jsjv
         9ZRYyFSumUEcxAke0DBFypj+UnQNMGLcd0pDY+3w+SqrG/6znvDTdomW0OJXsjC6QoAQ
         BH1dmKrHROn2IYaJKp/leVULp8rE2uJqZ++XeyMNi+ro9Er9Te2hHjXKHl6PYLszeBPz
         hr/30H7HKkFhqwenSft+NEPHrrO1eywgQ7AIFW+jzxbnO6ppOg/22y4oy+Ki0qbts87I
         uUqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvEz5J/f/+47mfE8queTkUxkPPBVPtQdNAaG6K7DozDJh7eSq1F3ckheGa75HE+cKGrnu+QdLzsFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKKX3qWXy+x50i1VQRGSIrbU6/Ih4gNZYrbeEfHdeYU+tNylsh
	zHHB2NGwigSMXyFytrFKHvepRFGguSKgCNNktvuOW+nMAgdaYbzkNTzV40rKvwTz7Q==
X-Gm-Gg: ASbGncuRxmR+gzkr2GDqrsGWRSyTw8/EJ3UaQLLiVUawpTxBe9kJbqjYVh2rff8vxl/
	KgnojZIVBaO6uY4Ua50LDHHfwwqPE1QLdRD8L8qnF8YVNmuv2ga3N7VIiyucyha13vZzzANQWbK
	dXNUWkXrrl6KieUCMMeFpaDsmA6KEP74bZmnsZhprC/8uvJ/R0PLgGV5NOxj2sK+0Q6slxK8TvG
	yJsmvYb9FLWD2Q5UsVd2/Je/6bFcoOYBOYtWECVxnSGW+hoq6JvLm8YLZoKcRphxR2I1sDdttxx
	Mp/OYlQMuen2L+g89NRasaqwg6UwEG5jc7kszNOwN5Q/Vy15v83SpTl2HUpqvnMYWhtg45e9uUJ
	0jpBlTY5UwaaxAdAZX4LbHqbZ
X-Google-Smtp-Source: AGHT+IFEIFmXoVPwxjgdMLTiUK6YaxXDGlfNpGIPcX5MLULK3ghOKEQYDDUyz1Cs7hzQ4lsJN8Cu+g==
X-Received: by 2002:a05:6000:2203:b0:3a1:fc5c:f8f9 with SMTP id ffacd0b85a97d-3a35c83a219mr9183769f8f.16.1747578848898;
        Sun, 18 May 2025 07:34:08 -0700 (PDT)
Message-ID: <0a6f40a9-a0ea-4652-8692-acfcf873463a@suse.com>
Date: Sun, 18 May 2025 16:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] vpci: Refactor REGISTER_VPCI_INIT
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-5-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250509090542.2199676-5-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 11:05, Jiqian Chen wrote:
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, NULL);

To keep identifier length bounded, how about REGISTER_VPCI_CAP() here
and ...

> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_EXTENDED_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);

... and REGISTER_VPCI_EXTCAP() here?

> @@ -83,6 +83,35 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>  
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> +static int vpci_init_capabilities(struct pci_dev *pdev)
> +{
> +    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
> +    {
> +        const vpci_capability_t *capability = __start_vpci_array[i];
> +        const unsigned int cap = capability->id;
> +        const bool is_ext = capability->is_ext;
> +        unsigned int pos;
> +        int rc;
> +
> +        if ( !is_hardware_domain(pdev->domain) && is_ext )
> +            continue;

Fold this into ...

> +        if ( !is_ext )
> +            pos = pci_find_cap_offset(pdev->sbdf, cap);
> +        else
> +            pos = pci_find_ext_capability(pdev->sbdf, cap);

... this by adding a middle "else if()"?

Jan

