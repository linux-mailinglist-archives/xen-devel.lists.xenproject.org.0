Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCC098567D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 11:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803711.1214442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOTC-0000AD-QW; Wed, 25 Sep 2024 09:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803711.1214442; Wed, 25 Sep 2024 09:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOTC-000074-My; Wed, 25 Sep 2024 09:38:02 +0000
Received: by outflank-mailman (input) for mailman id 803711;
 Wed, 25 Sep 2024 09:38:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stOTA-00006y-Tu
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 09:38:00 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9c1102f-7b21-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 11:37:59 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d2daa2262so832343566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 02:37:59 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f83adsm189475866b.167.2024.09.25.02.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 02:37:57 -0700 (PDT)
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
X-Inumbo-ID: d9c1102f-7b21-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727257078; x=1727861878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KhpjpiIdmsgRCCcD5YJuhmwSOrjfQs5MEGcBeIdVlMg=;
        b=W8RzyYJj3iaYSLBX52/lXA9McO0ZdT5bCZFL36bCgroSvHD+EuPSFMOgjPx+KT6vNa
         18hTNnLdAba0uNgFCgVDAzn5GGxiVjlFrI+pyJx/B6ln5TM88fNf13U4QZf+UNpPevpO
         mdmTj0azx8kA2C6fJLHBKiRWTFu+m/1ZN8stk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727257078; x=1727861878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhpjpiIdmsgRCCcD5YJuhmwSOrjfQs5MEGcBeIdVlMg=;
        b=BSZnWlGmaMLJ36uaEiOEgaiNRF8nE5yXmANrUrL1xMJ5ssY1U12G1rzIFAw8Uk8ROS
         O6UojctoGdvlgCbhTfRVLp9toDr3HQOpRiP8v/vXjb0+gpSOSXQmyt0QdzJJRY85EMUR
         vFA8y5WA0JzYYjx5MgmD3kirOkKJZNBr7IL0a4tPl2H38ouRDC/mFXFvq3S8S/ThIal8
         jaSop4U0Xl39Yo46C5QAOrHw8MexznilP0hJSHQZ6bDVGlWVVQ2Gzjce1EWNvDwYDb4a
         sm0Ehjte7FcSQgCHnzLsf91YNCKkpyAUBJwjgZ9cDkOAE++zfyR4UR9k3XvBnp3dQ3T5
         b4Og==
X-Forwarded-Encrypted: i=1; AJvYcCXRGjyQG8g/W4OmVXgUWxr1mBLbEMcaevz8OcDjpQSN0kv96Yx+uUfzJ/7rc158ZRWqVp2VTPcaC7o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwmzP2DWgKe+qxLvbByN+aYahQffMDfzl2g1iyq/dHnJcAbb/n
	6QLAHyguRo6RulF1iL8uCgO921NWK4aHGMrxorI0pASi6R7j5KAI8aNBgIbV594=
X-Google-Smtp-Source: AGHT+IHaGFBei82tNnz+I5evKW5pO9/eEs22SFI0inhqw4z/Vgua+w4C5Pl/FwWVS4mCoXr8dBVA3Q==
X-Received: by 2002:a17:907:7e95:b0:a90:b646:8e4a with SMTP id a640c23a62f3a-a93a066d95amr231476866b.65.1727257078444;
        Wed, 25 Sep 2024 02:37:58 -0700 (PDT)
Message-ID: <c2009427-f284-4cd2-b704-f5afc563f324@citrix.com>
Date: Wed, 25 Sep 2024 10:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] xen/livepatch: simplify and unify logic in
 prepare_payload()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-4-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240925084239.85649-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/09/2024 9:42 am, Roger Pau Monne wrote:
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 87b3db03e26d..8e61083f23a7 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -470,6 +470,31 @@ static int xen_build_id_dep(const struct payload *payload)
>      return 0;
>  }
>  
> +/* Parses build-id sections into the given destination. */
> +static int parse_buildid(const struct livepatch_elf_sec *sec,
> +                         struct livepatch_build_id *id)
> +{
> +    const Elf_Note *n;
> +    int rc;
> +
> +    /* Presence of the sections is ensured by check_special_sections(). */
> +    ASSERT(sec);
> +
> +    n = sec->load_addr;
> +
> +    if ( sec->sec->sh_size <= sizeof(*n) )
> +        return -EINVAL;
> +
> +    rc = xen_build_id_check(n, sec->sec->sh_size, &id->p, &id->len);

I've just realised what is so confusing.

This function is not a Xen buildid check, it's an ELF buildid note check.

I'll do a followup patch after yours goes in renaming it.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

