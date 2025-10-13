Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119ADBD2141
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 10:35:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141848.1476010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8E1H-0005h1-SJ; Mon, 13 Oct 2025 08:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141848.1476010; Mon, 13 Oct 2025 08:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8E1H-0005f8-PS; Mon, 13 Oct 2025 08:35:03 +0000
Received: by outflank-mailman (input) for mailman id 1141848;
 Mon, 13 Oct 2025 08:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8E1G-0005f2-Bt
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 08:35:02 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8199ebf3-a80f-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 10:35:00 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so36486865e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 01:35:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e82dfsm17090697f8f.52.2025.10.13.01.34.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 01:34:58 -0700 (PDT)
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
X-Inumbo-ID: 8199ebf3-a80f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760344500; x=1760949300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hvBSzbyYaMCM8Cj3iMryWSag2v7oagGZde/OJHIgLbU=;
        b=QMc1eiOg/46XelAMGJB8PWS8VRvhZIMPXbil4RdZgLTIbu3hH2mWJa4yLBcZMN7K6o
         x0DQ6CSLjW2OoHbNMuTgPbz05JhPewfQ42x+UJeLlzhRAzyOXZNRlSEdhPfXEyf8yUR3
         l+3i8IxARTkFR5MxjjjW71YxpjHLd9NVIAuwVH/YP0YuqzLq9kte3mt8J9+l1dut28AF
         B8kEo+Lnlm/N6d82Y5se4r3/svkN3z670L5lBgta0E89RRZadM578nrXLHhx6pbSJrxO
         nz0lrCK67wMXvwEYlCSNvBNoA3y8bZzQxI+zGL8j8yjGhnMlxoVG441BkcHtDgahPhjO
         EYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760344500; x=1760949300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvBSzbyYaMCM8Cj3iMryWSag2v7oagGZde/OJHIgLbU=;
        b=ddCNHPBFCGpDj3rKDxvie3bnpOWi/Ol8JNlC+o4hupBESU/WNZfYVmhu8gL2iuSEid
         6DFSh8AcMEDfwjlvXD9HT+3uYou1whLsk+rhyTZ/F2FHBnmMt3jgD2BIgMgNFvygpqgm
         3bxXvxAQWlLAcRXOWh6qpSrFrC0PQtyWQU1S7vyetq6onok1otrTzLR0+x1CwdljYtjx
         B7TkCwCXY2+jDLla5W2m3raF7LNDrFaQ66XptXayxr+nvw2ewPWBn9nRX0Mi7tS+sFHy
         pglj1rgdqIsMuZjfBsONfK/vdu+9clFFqc8SaM41iyRUUrtevgRD/gpOYe6G/rbmGJV8
         ciIw==
X-Forwarded-Encrypted: i=1; AJvYcCUvLdTqaH6HMijUHgXNXNYCGzOj04Y+g8lggbUzcCo/oQTUYSd2X+uQ0v65FwJOCEqvB7tKxquu6PM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzchHojnvGKosdvMWoeJitn/roZeo6XzgEfo86iF/Mj3iEDK09V
	aAq/0AzyBinxyc/usr35fLqljFlyToSIPm8mClqBcjQErPXO5/aR5ocoMpbh4DUPGg==
X-Gm-Gg: ASbGncuoYxlETS7PUtQVYRNVHb44aMW2IVD0Cm49/f68m6xfTvLi2f6DFECiZ24AQVY
	9I6x9rR88Sp9k9NM5PTEmeSPRaF9vlcCOCmcTQDOt0a6Ua8yjeyVJEtFpecCrBA6JWBvTkisHAv
	AhgL9cVvGOoIcULlW9rCd7jSMUxTZdltIvL6rqLZKbpG/GbPReNVGQoC94jbFSDhIl39P2Dr1dY
	74bFH3g1EM94k0nxF7OajQ8OkADF2p7gB1TMgc7VfvJc4OIrwcY3BUJJM2pZtxq59C639F9WyDy
	+yAoEFB4WlF0Crr9HsoN+UAHO6ne1GwW4C1UN+IxPHZC+gREtg7VIsD2heqNrodG9SccjoyHtLv
	zIUZ1rtFtE+WwMaGQvp1VQOnlaZD0VEIv47Hfmp3+XF7b2K0gLaMCH2qQ3KWcZQFLTkqrxjwQQB
	SrTrNgOX2Jo7KkNmZFTNTpmsDjgBUIAG5APt2nXA2xiThUyrU=
X-Google-Smtp-Source: AGHT+IG978MN9zjBGABmYc/fvRTCGBfJnv8dcFoPpdPa41VVg3bBIEr5pPVZnJUGH687BCVMNZB9cg==
X-Received: by 2002:a05:600c:8b5b:b0:46c:d6ed:2311 with SMTP id 5b1f17b1804b1-46fa9af2f4dmr140715625e9.19.1760344499602;
        Mon, 13 Oct 2025 01:34:59 -0700 (PDT)
Message-ID: <51d86c7b-51bd-4001-8af1-a52c76a20669@suse.com>
Date: Mon, 13 Oct 2025 10:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] tools/libs/light: fix BAR memory address
 truncation
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20251013074533.67478-1-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20251013074533.67478-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 09:45, Jiqian Chen wrote:
> @@ -2031,7 +2032,7 @@ static void pci_remove_detached(libxl__egc *egc,
>      }
>  
>      for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
> -        if (fscanf(f, "0x%x 0x%x 0x%x\n", &start, &end, &flags) != 3)
> +        if (fscanf(f, "0x%"SCNx64" 0x%"SCNx64" 0x%"SCNx64"\n", &start, &end, &flags) != 3)

This line has now grown too long, where it can easily be wrapped (unlike ...

> @@ -2040,7 +2041,7 @@ static void pci_remove_detached(libxl__egc *egc,
>                                                   size, 0);
>                  if (rc < 0)
>                      LOGED(ERROR, domid,
> -                          "xc_domain_ioport_permission error 0x%x/0x%x",
> +                          "xc_domain_ioport_permission error %#"PRIx64"/%#"PRIx64,

... here and ...

> @@ -2050,7 +2051,7 @@ static void pci_remove_detached(libxl__egc *egc,
>                                                  0);
>                  if (rc < 0)
>                      LOGED(ERROR, domid,
> -                          "xc_domain_iomem_permission error 0x%x/0x%x",
> +                          "xc_domain_ioport_permission error %#"PRIx64"/%#"PRIx64,

... here, where we prefer to keep the entire format string on a single line).
Can likely be addressed while committing.

Jan

