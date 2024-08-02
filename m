Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF194580F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 08:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770179.1181112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZloD-0000NK-Hd; Fri, 02 Aug 2024 06:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770179.1181112; Fri, 02 Aug 2024 06:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZloD-0000KO-EW; Fri, 02 Aug 2024 06:30:37 +0000
Received: by outflank-mailman (input) for mailman id 770179;
 Fri, 02 Aug 2024 06:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZloC-0000KH-I3
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 06:30:36 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba02c628-5098-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 08:30:35 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ef248ab2aeso112702621fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 23:30:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec7311sm58953366b.195.2024.08.01.23.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 23:30:34 -0700 (PDT)
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
X-Inumbo-ID: ba02c628-5098-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722580235; x=1723185035; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y2RdBw5XcQjQNw+V4TlDKBwnZ94TfWoC+/ovto3/93I=;
        b=DeKuAtazszIBlOexzgdU94tRDHNZ/b83EvgqOSJoFo63xGRBt3a5+nL4fVNeEtQ1Ar
         EKD1AaAjvNUglfPmFM20xp0To5PXQk0Y/Z/JM6Pz67c4NUONXDaNr4y7d29dvRoZGJBQ
         EvvZGYA8IBwhf1vnDJ1uMebIALMHnNNPc9foNOQ0NLssKcgGzmDTTv0LY69NMg8NBE/y
         vPN/A02sRx617qWYaDekgtfd9CuHHZd+cSQ7ExyFm/JYdLgybXTrsQwKSuMhP/xhjlsU
         xcMMveJPwQSSz092UPFWIi0XPWSQto7SVve5tRVyoGHlCX9hz2d3yngkdfL+vC8ViHac
         CJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722580235; x=1723185035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2RdBw5XcQjQNw+V4TlDKBwnZ94TfWoC+/ovto3/93I=;
        b=YNGIfQuWzl1ZuxXx/y9zL9fiN3zId52hDcNf2AQGsRNhshKBn1Hh6XI4MipF/VwJBk
         yBB9TS3crK/tpOMQpOB2SfuOqOBN1n+affRF1UrI1kY/OSulMBO7RsZQ+8yrNRGoO5Wx
         FtUTDRr3nCYs0krrRgeyjngwYtiDTyJ/twyLN2ixUkn/+e6ScbgyvgjmPBpGiyZIRSxN
         +NQjPwKFuIT2ELXZG9tdfOFeUx81eqXo/TWrRdjv2TeAXKuf3JwoL1E5FdbvtdJi/h/4
         xNYGt8U+shodDW2QCHOg/+Ll4B7PLlZSEXowVEscuh5A13mLIyen5uMcoDn1mgPDEhN4
         e83Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdqao7cCaJp+Bjp5E+aWBNub3Im3LYAQoOBoljkHe889+e2wdWRKCA4qOP7ODHLl6ICL18tqcusNFyzh+raBZy0t1IMelFmgvMoWzlFoU=
X-Gm-Message-State: AOJu0Yy5ywnt0QrLSE4sjT0VoGBWo0HhusI4XEeSicsor/7lNmtZlQCe
	Z5fc43gM8F9Wl2jocERgR+MDRAI9aXUKL4rlrrIRT/mK2FNGnulnfGt0mkPu1A==
X-Google-Smtp-Source: AGHT+IE3QyrK+rRbvpSIRyDiSSwHvO6nGZjE4g37JRSoj5PuSXRsY1JWsosbYRJU1oWggQUyN+JhPw==
X-Received: by 2002:a2e:320b:0:b0:2ef:28ed:1ff2 with SMTP id 38308e7fff4ca-2f15aa88cb7mr20661931fa.9.1722580235134;
        Thu, 01 Aug 2024 23:30:35 -0700 (PDT)
Message-ID: <8a2e672c-151d-4081-aeb9-db87c568b1a6@suse.com>
Date: Fri, 2 Aug 2024 08:30:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/shutdown: change default reboot method preference
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240801161753.94399-1-roger.pau@citrix.com>
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
In-Reply-To: <20240801161753.94399-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2024 18:17, Roger Pau Monne wrote:
> Change the default reboot preference to prefer ACPI over UEFI if available and
> not in reduced hardware mode.

Imo such a change in default behavior wants to come with a CHANGELOG.md entry.

Jan


