Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588F4872156
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 15:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688812.1073453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhVcG-00087m-UU; Tue, 05 Mar 2024 14:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688812.1073453; Tue, 05 Mar 2024 14:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhVcG-00085D-RS; Tue, 05 Mar 2024 14:18:00 +0000
Received: by outflank-mailman (input) for mailman id 688812;
 Tue, 05 Mar 2024 14:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhVcF-000857-Gn
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 14:17:59 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2aaafc35-dafb-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 15:17:58 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-565a3910f86so8561582a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 06:17:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d8-20020a50fe88000000b005673e29cc0fsm2708966edt.54.2024.03.05.06.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 06:17:57 -0800 (PST)
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
X-Inumbo-ID: 2aaafc35-dafb-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709648278; x=1710253078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nCffwEo8NtUKU4Kqg9J8D9/ZJln8QF61t69XY6li/lU=;
        b=C/tIJ+AA9TZl3Rdw2btzmuYQjcFS51U2UySq7k9T5N8/l01s2czLQr6Pg8c8APwRIW
         w6Js6qzEmy3RG4ARUj8MNJ7UmTCrxt7tvC0qanTzmggJhhk/Ssik5qIYysHrDpZXPwEO
         CRhNYpNpos9fAsQMfEDMYTCiZTTyJTSh/VCaN4pGVZZXEu0s36WwIMWtOghC2MMHFGTx
         /5PR6k8COw6HMjqMa+Ci/28nj3ICO2ie/yWDzk1Gc80gTluQg8TeVel/9IdhhwDXD+iE
         m7tEfTI7QceUkSxqkCdI7PATy4OlJP3uOlSSrul2WfNIDCpjhEThG9CDj8w3HZYLBwMB
         QFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709648278; x=1710253078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCffwEo8NtUKU4Kqg9J8D9/ZJln8QF61t69XY6li/lU=;
        b=gjUAnVOZx5P0ADGc1hBbqUaLM89bL2K1Ehj94ljrZwahwuZ7FzjBpjTorFBiyV2iIW
         f/dew/w1ZLlXLIEogpV8rXEDXW6NfgSiuqKW2U5mwKVYclm3dHzyJk9QvRn1NoEd63kB
         1TbWrM5YNEITkWK8CSvese34CSqmzBQTeMYo+m2NNdUSxxzx8v9mgXkUxHCDgpU4pJXE
         I9VNboWM7SOua8bbyZDdO+bBBZ6CRLSmJepCvlwO5Wp8iYKk3JnWQsbg0xWln9co8S4H
         OCx+81poY13QCwj68YHWSwviUN4iDrRTkUA4A0R5GX6013SdlQTp1i0nnqFZkyNtMPMv
         eZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCWNTw3AACopNntRHAYtyxxnSmS7Nq03f7DXdUNSL2zUE81XYgr/+hmp7sDvCY+YZB1d8R6HaSPNPVY5TYUYLmYJg42nSS+Kl9v4Qu9cXtQ=
X-Gm-Message-State: AOJu0Yx4BeGfB5t3ApcTqdxYVt8oTHILBewgX7Jtc7b9rsHf367lOeFi
	TlN81/pHLTGvmiXiE9aYxfo1M2zAE4ptyoq0QTNF6hGuBwn9yefkaA9B/IBg2w==
X-Google-Smtp-Source: AGHT+IFHDom6al4eDJK0L9QRhF1B5dED61U5IocqYcu1gztiBPLC5RadfRuei/T270YKU7nX2WkxOA==
X-Received: by 2002:a50:9ecd:0:b0:565:edf9:8038 with SMTP id a71-20020a509ecd000000b00565edf98038mr7239451edf.40.1709648277802;
        Tue, 05 Mar 2024 06:17:57 -0800 (PST)
Message-ID: <87b82706-f538-4807-abaf-1e59cebd286b@suse.com>
Date: Tue, 5 Mar 2024 15:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/virtual-region: Include rodata pointers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240305121121.3527944-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2024 13:11, Andrew Cooper wrote:
> --- a/xen/include/xen/virtual_region.h
> +++ b/xen/include/xen/virtual_region.h
> @@ -16,6 +16,9 @@ struct virtual_region
>      const void *text_start;                /* .text virtual address start. */
>      const void *text_end;                  /* .text virtual address end. */
>  
> +    const void *rodata_start;              /* .rodata virtual address start (optional). */
> +    const void *rodata_end;                /* .rodata virtual address end. */
> +
>      /* If this is NULL the default lookup mechanism is used. */
>      symbols_lookup_t *symbols_lookup;

While perhaps the least bad one can do without quite a bit more churn,
I'm still irritated by a virtual region (singular) suddenly covering
two ranges of VA space. At the very least I think the description should
say a word of justification in this regard. An alternative, after all,
could have been for livepatch code to register separate regions for
rodata (if present in a patch).

A follow-on question then would be why ordinary data isn't reflected in
a virtual region. Aiui that's just because livepatch presently has no
need for it.

Underlying question to both: Is the virtual region concept indeed meant
to be fully tied to livepatch and its needs?

Jan

