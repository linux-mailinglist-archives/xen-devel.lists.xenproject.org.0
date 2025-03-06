Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F213A547C0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 11:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903312.1311217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq8SM-00006x-0U; Thu, 06 Mar 2025 10:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903312.1311217; Thu, 06 Mar 2025 10:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq8SL-0008Vj-Tw; Thu, 06 Mar 2025 10:27:57 +0000
Received: by outflank-mailman (input) for mailman id 903312;
 Thu, 06 Mar 2025 10:27:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tq8SK-0008Vd-1x
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 10:27:56 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a91edd82-fa75-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 11:27:52 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43bd5644de8so4734485e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 02:27:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01cb82sm1639323f8f.51.2025.03.06.02.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 02:27:52 -0800 (PST)
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
X-Inumbo-ID: a91edd82-fa75-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741256872; x=1741861672; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gT3Cq26j0eAgsg6KuJKZ2/XBJPoIymcay2hNJsMgqUs=;
        b=hE9KoUXAZll5yoQIpASB/7lek7U8jgOAagRnko+GHLE95rbReSzR3cW/JqWavoSUkV
         733Jn3//iPT0x8fbekUdvrJFxKHP296ZC/QxtWeoZas7tC4gAJgtHHVxSCA74MDxTzPV
         Zum7qhs49vtspARcYGk4Z5XuSLIdoEZro+DqgZfj+ulTda8V0YTigp2q+m1BCndBD08m
         ww5fwMieRLsZkNMoJxUxQchWczLuanVneQJpmJaBh2NBZtKXJCrtgHMpOCA4mRY0fU9E
         3jlpNciK1nd/Z6W27HmT8/LGW7QTRiENKWPfvyz70ZqK1iPKN7jLoSK0C/zOKJKPMhW5
         iCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256872; x=1741861672;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gT3Cq26j0eAgsg6KuJKZ2/XBJPoIymcay2hNJsMgqUs=;
        b=dt/WKS9P3I2+qU7Jknr7z62N/Df3TSTTyxkVLODkZWeaCRVaO9bD+1a4OyCIVNC8Mn
         GRFAcBBoW+EngMQlQKhQo8Q8Wc1gfgCQKg4zMYKEuq7TlB2P6eZ+QKWN58HAInubIDjz
         fYkKPvPyXlaqhpbuinWPcwF48JoPpZN4LqzMGed25m2k1xRLxD+imK3q9TVypM+7OXZ7
         6PU5XIeaepMGqgDeKsi+MnxRKNtz6smOtFJZrt4y5Ej0MUpU4lIclAjZLY0UMMNSd5K0
         Lf8SHHs1hUAxXtV0RTRHklUQIK3dJpA3iKFpvrJn93CSTfirblgc4LmW1Y8ae8D2bzHz
         SIag==
X-Gm-Message-State: AOJu0Yy0KpOtgM3ZKNTvRDk3O3ss0rs/Rw6AdpZITp35JuREDPjCPs24
	l2+8LxnZ/qBKUcpfxpByVvA9jRQ/2e6MVmuP0jZHhyKpx8Ba+JZigTo1Zr7O2g==
X-Gm-Gg: ASbGnctxdSwYqOql6yDWo5A+bF9s1sSdJb77NisYSJiQ2AgLkLKFySQ97a9rOeJp1PU
	dqL+2sbq8XvpqdWbMJ3H3frUE0TdZxufzBijdqO+Z8tsRCXY0I9vZHiWp0zhHZM/8Sa/44i/Cr1
	tOirhaP8mG9PTFQh9D0fqSGYOcUE3d8Bxpi9o4LRN6ZwoiV1JmfXw0t8KVRO1YXwKQxhEBcre0z
	++gLEqRQGX64xFb2HvlQBDoBRMy93KEzspkebf3p5v1FEFUtNiRR1owvg9AOCh5Nwc19EwO4IG5
	1PtGriuwq0S5Fyq2svLIfsqzm5fuQWoTyS9v1EIbntWoWQCVdTV7F+wgv4pMw5iCQ5387mBeXF9
	K2WpC8cPrXA0yf/fMLQ1PC3Lzf4QxzA==
X-Google-Smtp-Source: AGHT+IFMCn7ehhh/Oo3Yzh2ishZPjCtTlwpbUZdKTWK1/ld7MMzd2BAVq+qTTSB8b416ZJQ7I+Jagw==
X-Received: by 2002:a05:6000:154f:b0:391:22e2:cd25 with SMTP id ffacd0b85a97d-39122e2cf42mr6717991f8f.31.1741256872468;
        Thu, 06 Mar 2025 02:27:52 -0800 (PST)
Message-ID: <7ed46917-d551-4439-80b0-27ae295863b1@suse.com>
Date: Thu, 6 Mar 2025 11:27:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: add missing Xenstore commands to xs_wire.h
To: Juergen Gross <jgross@suse.com>
References: <20250306082105.17398-1-jgross@suse.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20250306082105.17398-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:21, Juergen Gross wrote:
> The GET_FEATURE, SET_FEATURE, GET_QUOTA and SET_QUOTA Xenstore commands
> are defined in docs/misc/xenstore.txt, but they are missing in
> xs_wire.h.
> 
> Add the missing commands to xs_wire.h
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/include/public/io/xs_wire.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
> index 0d9f49ac89..e92a87a07b 100644
> --- a/xen/include/public/io/xs_wire.h
> +++ b/xen/include/public/io/xs_wire.h
> @@ -35,6 +35,10 @@ enum xsd_sockmsg_type
>      /* XS_RESTRICT has been removed */
>      XS_RESET_WATCHES = XS_SET_TARGET + 2,
>      XS_DIRECTORY_PART,
> +    XS_GET_FEATURE,
> +    XS_SET_FEATURE,
> +    XS_GET_QUOTA,
> +    XS_SET_QUOTA,
>  
>      XS_TYPE_COUNT,      /* Number of valid types. */

This is effectively extending the ABI with request types that are recognized
by neither cxenstored nor oxenstored. The assumption therefore appears to be
that no client would have used those types / numbers either.

docs/misc/xenstore.txt doesn't spell out what the encoding of the commands is
in the (binary) representation.

At the same time the effect of this change is a growth of cxenstored's
wire_funcs[] array, adding four nil entries. Luckily the code accessing the
array looks to be prepared for such. (Still I wonder whether the array
wouldn't better be extended right away, by adding just the strings while
leaving the handler function pointers at NULL.)

Provided all of the above is correct,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

