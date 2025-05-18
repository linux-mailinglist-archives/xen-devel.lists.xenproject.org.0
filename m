Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E192ABB080
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 16:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989218.1373454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGesV-0000oU-C8; Sun, 18 May 2025 14:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989218.1373454; Sun, 18 May 2025 14:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGesV-0000lu-92; Sun, 18 May 2025 14:20:35 +0000
Received: by outflank-mailman (input) for mailman id 989218;
 Sun, 18 May 2025 14:20:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGesU-0000lY-02
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 14:20:34 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41092cc8-33f3-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 16:20:31 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a0be50048eso3533617f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 07:20:31 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a364d2636bsm6675954f8f.99.2025.05.18.07.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 07:20:30 -0700 (PDT)
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
X-Inumbo-ID: 41092cc8-33f3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747578030; x=1748182830; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9y0PvmsQQfI9ODkztL3z9LNslCFi7d1NvdlKP1VGv+4=;
        b=gfPI7dyoDSYTTe/7WifZ/vMNhVfAs4XvYEIePOhWCOSiK3LvwOILwNFbfUYrp0orq8
         Q+IGXUfOHFtO2xmHTpt/AYnvT9NcP8awo9AHISnu9b9szEn+9UMFyfmxTaJi01VmrnUX
         RJu0UhbXY7ixjytvxc991W0G+HtA7XlpAks606V1ndIpqQqvR3deIs++7cul3htehmnJ
         vsOn2Uj8RIX4HuLbFa0rAOrhjDiaqQhsizfgtKChe0QcEBWajGwYzvhom1yKlvYNLRFI
         yTb/Y/FNS1aeHvWyxecxkg29TlquakieuuZDDDTxK38di+XiPgnvRF17sDvSRldncikD
         S8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747578030; x=1748182830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9y0PvmsQQfI9ODkztL3z9LNslCFi7d1NvdlKP1VGv+4=;
        b=uJU6OhmkiXc6xeMwl6zgRp8ATHWGEl67GOeIAU6Qk16/3Vkw80r16RKLLjnOWB8ZwO
         F8+1pmbRZst008u9JK/heaozxepfoklVqRUf6Y9KMjIxZ0bVFpUbnZ/o6L4brmBh8Wnw
         hRtynC+JME5MD9tfgOpyXarCJKVYNDrZjJ2oOu2Ve1SPlphhsrUpzVGaJjN+VsGo4s9d
         SGsBGrIOyidBF0KS97hvVnEyDYhPAIUa/+cNhLEzsdHeoC6esknrTW3o/VFUm6gn/r4H
         GQcW4HfyxuIFHaTSvIU+kvXeHpFtnUOepcMZjTgKfbecHnaNweWYIK/TahvqsuMsIIJa
         mu0w==
X-Forwarded-Encrypted: i=1; AJvYcCVHMulDrRiw29YAVAGHz/SfJ4TAHgVrSD3qer3HRpP4xyCeHbtCwwIAKWFq6RXq7D80TZVS4Sv2ARc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmvdqCTEaygT1ySWFK9YAbEA0WtiKgZAeQArvDK5aLELsKQjls
	nv62B6Eg8EmeMWQaPPBT9Rqq3l//a9FHyrYcx/wFT9RxkWozpxhegUlpvoxbOBxIYw==
X-Gm-Gg: ASbGncvNDT54Gp3Ev9GZClzk4vq0ASXcI3LOMErBtljSsSK8vzFJFNl0gwUAb20S8vS
	4z5V7MVJ/FRBiCZD7w/9V7lUvx8vGDiys+yatbcwPeXNc/Xzdx7JEk+HNlGgHEu8hpnmoU68SRk
	tJrOl9ML3KQydCM2+aHxv0fcWpwv6HgNwR/2wHz7YsyLOW+bdYttePv9MPKHG22rDY9VTD2We+P
	bredVkZNxHo8DxfQarh4NFQ0ORSgFnzliTF8rzhY0uTRp/vw/WrnjsbOlOE41+4H11iipWMU8cZ
	agbJpv4bn9VVuu4KSkMgx3B+Qol5e4aoaZEIoMB3YePB1wn79eFuWzjZ3NHlMATtyxr5SnhbIH1
	aZsR9Y8/ops6UDQDNb5e+7JEj
X-Google-Smtp-Source: AGHT+IHGBM64HPLuwhmnThyP7McwWyEV4mT7yOvDKudA72LJ2gHv42Z4qfx3XetDtXtqHIepVHa2kw==
X-Received: by 2002:a05:6000:2485:b0:3a3:621a:d3c4 with SMTP id ffacd0b85a97d-3a3621ad510mr6580495f8f.15.1747578030595;
        Sun, 18 May 2025 07:20:30 -0700 (PDT)
Message-ID: <b569f90b-673d-44c0-b350-8a6f5f3c8d78@suse.com>
Date: Sun, 18 May 2025 16:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
To: Jiqian Chen <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-4-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250509090542.2199676-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 11:05, Jiqian Chen wrote:
> @@ -827,6 +827,34 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>                                                   PCI_STATUS_RSVDZ_MASK);
>  }
>  
> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
> +{
> +    unsigned int pos = PCI_CFG_SPACE_SIZE, ttl = 480;

The ttl value exists (in the function you took it from) to make sure
the loop below eventually ends. That is, to be able to kind of
gracefully deal with loops in the linked list. Such loops, however,
would ...

> +    if ( !is_hardware_domain(pdev->domain) )
> +        /* Extended capabilities read as zero, write ignore for guest */
> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                 pos, 4, (void *)0);
> +
> +    while ( pos >= PCI_CFG_SPACE_SIZE && ttl-- )
> +    {
> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
> +        int rc;
> +
> +        if ( !header )
> +            return 0;
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
> +                               pos, 4, (void *)(uintptr_t)header);

... mean we may invoke this twice for the same capability. Such
a secondary invocation would fail with -EEXIST, causing device init
to fail altogether. Which is kind of against our aim of exposing
(in a controlled manner) as much of the PCI hardware as possible.

Imo we ought to be using a bitmap to detect the situation earlier
and hence to be able to avoid redundant register addition. Thoughts?

Jan

