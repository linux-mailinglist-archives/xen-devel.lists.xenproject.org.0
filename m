Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BCB9BFADD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 01:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831440.1246743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qce-0004gz-3U; Thu, 07 Nov 2024 00:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831440.1246743; Thu, 07 Nov 2024 00:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qce-0004ez-0k; Thu, 07 Nov 2024 00:43:40 +0000
Received: by outflank-mailman (input) for mailman id 831440;
 Thu, 07 Nov 2024 00:43:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd42=SC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8qcc-0004et-Pi
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 00:43:38 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5206a8fd-9ca1-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 01:43:35 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5ceb75f9631so432401a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 16:43:35 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b9b661sm110232a12.36.2024.11.06.16.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 16:43:34 -0800 (PST)
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
X-Inumbo-ID: 5206a8fd-9ca1-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjUyMDZhOGZkLTljYTEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTQwMjE1LjMzMzYsInNlbmRlciI6ImFuZHJldy5jb29wZXJAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730940215; x=1731545015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dUjf75pWqTyO/d34duPXWyGmmlzbnFWkTMY/4NaRmuU=;
        b=LfVbPZEvlan77S8pnQwhKTYR26TC+rlrH0pt9CpFqFVck0Vx00NiDJ+5No/EZkoljD
         /oIXcL3N4yJG/+FSr3CBP6pFG2TcqA2mfmi/UJSPDpqp4o5NMHwdJUVGCc3/eFUxb2PY
         lpqiobn6O4x8XstTtaD7TJj26bBpLMFYbCcoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730940215; x=1731545015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUjf75pWqTyO/d34duPXWyGmmlzbnFWkTMY/4NaRmuU=;
        b=ug4leWddHzcxYgu4RWnbGw9Awitt+mqXFOGIahF8OUeFtPN/SkUdQH5VtbaD9hfZlo
         8BQTBpllghq/YGjjUdx6XYV2PWTZpUfoAA4qn4Puur/8xLfheiGaH326eXH0Knp8YW4N
         lCFclLOD0hdgxJOM7+hK96bC2rEiP2zPmfQ4lxBT93nyRiy8yihPRQhQ/FG42gK9DJTl
         9eFz/KuNekrmZPKw8Zez3dwa+1b7oVblL4m1E7+9FwEp1L2LecAvAkiM38NirqYA1j1S
         EGq6xU4dIx39OTdMgnfF0ey/mTGD2k5dix10zjGg2l7WCBYp9h4W5/kFBNEeHeUODl15
         AisA==
X-Forwarded-Encrypted: i=1; AJvYcCU1y3zbVkSn1kMCTqNm3xM/f1WBipRfMG7KfoI16sgUAfu5Ww9EMeg1oLRhhVegBMgEAk6wxFjioKM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaxYpLS+BUtzwiRsCt3fFh+tAr+Lw8p6k5Fxznrgvk++xKBpA7
	xeVvOcbqZ8DKPDqTZiMt6qw2Qa+33wkYIbo1wlkUzESKIZnqgWIGSQ/F70Bi3O4=
X-Google-Smtp-Source: AGHT+IEiIISG+C8Ih/xwliC68P+RnPcNN7ppi9B95jVToSMr8Wu4QnMBrpnxJEFkeTRu+K0w6lNxyA==
X-Received: by 2002:a05:6402:51d0:b0:5ce:fc54:9ebf with SMTP id 4fb4d7f45d1cf-5cefc549f75mr758177a12.27.1730940214751;
        Wed, 06 Nov 2024 16:43:34 -0800 (PST)
Message-ID: <2c1849f0-90f0-4e76-b8f9-c925522fc2e5@citrix.com>
Date: Thu, 7 Nov 2024 00:43:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] x86/boot: convert domain construction to use boot
 info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-9-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241102172551.17233-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/11/2024 5:25 pm, Daniel P. Smith wrote:
> @@ -1301,16 +1302,25 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
>      }
>  }
>  
> -int __init dom0_construct_pvh(struct domain *d, const module_t *image,
> -                              unsigned long image_headroom,
> -                              module_t *initrd,
> -                              const char *cmdline)
> +int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
>  {
>      paddr_t entry, start_info;
> +    struct boot_module *image;
> +    struct boot_module *initrd = NULL;
>      int rc;
>  
>      printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
>  
> +    rc = first_boot_module_index(bi, BOOTMOD_KERNEL);
> +    if ( unlikely(rc < 0 || rc > bi->nr_modules) )
> +        panic("Missing kernel boot module for %pd construction\n", d);

Just noticed while experimenting.  The upper bound (for the error case)
should be >= because nothing good can come of being handed the Xen module.

> +
> +    image = &bi->mods[rc];
> +
> +    rc = first_boot_module_index(bi, BOOTMOD_RAMDISK);
> +    if ( rc > 0 || rc < bi->nr_modules )
> +        initrd = &bi->mods[rc];

This range check is tautologically true.  You want && instead of ||.

Same elsewhere, although this goes away when the variable is unsigned
(and we remove assumptions about the dom0 kernel's index).

~Andrew

