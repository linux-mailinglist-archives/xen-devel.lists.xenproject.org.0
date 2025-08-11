Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9063CB20D35
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 17:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077726.1438756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUBp-0005po-24; Mon, 11 Aug 2025 15:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077726.1438756; Mon, 11 Aug 2025 15:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUBo-0005nQ-VR; Mon, 11 Aug 2025 15:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1077726;
 Mon, 11 Aug 2025 15:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulUBn-0005nK-Q4
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 15:11:55 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83771d97-76c5-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 17:11:53 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af968aa2de4so817965966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 08:11:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c0ccsm2027664366b.111.2025.08.11.08.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 08:11:51 -0700 (PDT)
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
X-Inumbo-ID: 83771d97-76c5-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925113; x=1755529913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MyaD43a+XYQZS+eDoU3zc1/+jHiBCIyYsw7KL5qKibQ=;
        b=aZ2amIWoKy/tv+GWY2A763RoCKwpinF4mP2n9KEEu63qJW5dM7iOFhCS9EiEwkZrb4
         jXJKEZJCdHE+Awk17PJpZGyQM3qwj/vOWEvSYBeZ1x2+xFMRgtMfWAgzejYTr63Dk3X1
         7SRiv+InLGzpYVJknB5KJaH/ORWy/8KaQ4l2qO8Hjfc++evPiuCM5axRHBnJmu7aHDMw
         jpOJgstX9763fBdixEbhZH8ZdgSYQMy4+XGsbi/UQ+H7MjCDs934gjkM4bixthYymyzU
         CIs5jP4YG1mtWgQMmQaaLL03V9GDDyA4oS2XP5x7KIXBqbDNWbMw/SZllLq472ui10+h
         IL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925113; x=1755529913;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyaD43a+XYQZS+eDoU3zc1/+jHiBCIyYsw7KL5qKibQ=;
        b=mEhyuw0+8rAGb5YNZHEYKBL4W5ekZlcR7TdrmGzd+CedH1lxctjWberdq+MOJVlhXa
         SpwnWtRlAKgxyuBPKdhu3srH4N4kDtRgqQ0sFELCnXRXoUVH0N+yZLGdVg3dwa73x7jB
         izsXN3GEx8P2N9FgP4++q52+Pil1CB3JhsT/rykp6twJggpRBih9yCNCHbkR3TqowiA0
         vSL1JD8HAtCjiqDjEb0uIRXiztSrTNYrcpXr3rOQRfKw5hEkg0JrMRdog3x2PYOzjIxH
         z9yYhrI5ckPgd2OsMatP/RCTROQcBHGnXnvvZ7j13pU3nK9gRCWRwLghejFyvAHFQ5yl
         AOUg==
X-Forwarded-Encrypted: i=1; AJvYcCVr5M7cIFM87o+3f5cXokQK7Wn+teDz3zI2cgbrV8dhoBUDVpoOuTaH4eFyh/iYTGcX/TForCdsbAk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3ZPN4C+qCKWsGCsGGhQEf33WPC6AHXREKGNdI0DjMewD+5/cM
	kdPbkP6ruPAl104sNnY1d+vPAX5ew/PDS0oE18XgpVxeivyGnGITXojnhUjL/eHAoQ==
X-Gm-Gg: ASbGncupChSflfpzZVX8+BZIHmiv5K0FZOpn6DTj9JfORTDgQylVC3vGWkmxfx3u7lo
	o3QU+oxz7/J0PBG9rOBmA97r/XibBsZl3yWREGrCJQ1gOupzCWAxWZGBiO+WmJBKAaeKCYk/gA2
	9NorD8BTC06qAdGomsTYzp5QAZ61qz/Wzzw02rl3ETcS2PCHO7EIKSzdBG0l/iZVicOAqdz0KkV
	hU9DrZXIGhHROsYa8KBD69pOj71CTwyRbQJH6SJhujAaezULMThDgwcSsRGxBzekmJIvaIgjkYX
	2ZWHUPoSeRD5Bcllg1I9Ws34yVdm6X9JEY44k4e6ssBTWBjnMJ26/AaOUxhJ1K8szneroE/DxNW
	I6btgpJkTfk8Z7bFdsu5uNOZF46fy88rcTn04TwkaiPhAafQfmwYxMmwkbKt9/L8MCaz4nyc7Vn
	5tDOz8ihMl1mBCjDRKMA==
X-Google-Smtp-Source: AGHT+IHAx2g7G0Q5RYGEj6oxsFPiMHyJX8IJCtJmYRd4xmA6b/4gxr6xPvF6FdpNrI5/XcVld9xdNg==
X-Received: by 2002:a17:906:ee89:b0:ae3:7058:7b48 with SMTP id a640c23a62f3a-af9c648c961mr1220977166b.25.1754925112895;
        Mon, 11 Aug 2025 08:11:52 -0700 (PDT)
Message-ID: <13854e74-5804-4453-9344-092e0c81796a@suse.com>
Date: Mon, 11 Aug 2025 17:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/20] xen/riscv: Implement p2m_pte_from_mfn() and
 support PBMT configuration
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <1370613cd6f52e90591b15ad52c95d7c81908cf6.1753973161.git.oleksii.kurochko@gmail.com>
 <3ede10e7-8e43-4277-9197-14a3e5ab1cc1@suse.com>
 <e0f21085-8cce-4778-b15d-6dfd5e615aa2@gmail.com>
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
In-Reply-To: <e0f21085-8cce-4778-b15d-6dfd5e615aa2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.08.2025 16:44, Oleksii Kurochko wrote:
> On 8/11/25 1:36 PM, Jan Beulich wrote:
>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>> +static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>>> +{
>>> +    pte_t e = (pte_t) { PTE_VALID };
>> This and the rest of the function demand that mfn != INVALID_MFN, no matter
>> whether ...
>>
>>> +    switch ( t )
>>> +    {
>>> +    case p2m_mmio_direct_io:
>>> +        e.pte |= PTE_PBMT_IO;
>>> +        break;
>>> +
>>> +    default:
>>> +        break;
>>> +    }
>>> +
>>> +    pte_set_mfn(&e, mfn);
>>> +
>>> +    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
>> ... PADDR_MASK is actually narrow enough to catch that case. Maybe best to
>> add an explicit assertion to that effect?
> 
> Then it should be enough instead of what we have now:
>    ASSERT(mfn_valid(mfn));

No, that would exclude MMIO living beyond max_page.

>>> +    if ( !is_table )
>>> +    {
>>> +        p2m_set_permission(&e, t);
>>> +
>>> +        if ( t < p2m_ext_storage )
>>> +            p2m_set_type(&e, t);
>>> +        else
>>> +            panic("unimplemeted\n");
>> The check is already done inside p2m_set_type() - why open-code it here?
> 
> It isn't really matters now (so could be dropped), but in further patch this part
> of code will look like:
>          metadata[indx].pte = p2m_invalid;
> 
>          if ( t < p2m_ext_storage )
>              p2m_set_type(&e, t, indx);
>          else
>          {
>              e.pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
>              p2m_set_type(metadata, t, indx);
>          }
> So my intention was to re-use p2m_set_type() without changing of a prototype. So,
> if a type is stored in PTE bits then we pass PTE directly, if not - then pass
> metadata.

Then at the very least p2m_set_type() may not be a good name; a function of this
name imo should set the type, whatever it takes to do so. But I'm unconvinced of
the model as a whole.

Jan

