Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D12A944FD3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 18:01:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769849.1180737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZYEc-0001W4-Va; Thu, 01 Aug 2024 16:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769849.1180737; Thu, 01 Aug 2024 16:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZYEc-0001U4-SF; Thu, 01 Aug 2024 16:00:58 +0000
Received: by outflank-mailman (input) for mailman id 769849;
 Thu, 01 Aug 2024 16:00:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZYEb-00013Y-CG
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 16:00:57 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cccf999-501f-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 18:00:56 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7ab76558a9so397544466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 09:00:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7d9fbe215bsm213134866b.59.2024.08.01.09.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 09:00:55 -0700 (PDT)
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
X-Inumbo-ID: 3cccf999-501f-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722528056; x=1723132856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F56/nP6583iavNjwlSLSEy9oYVSjQF+kE2RihoWT7Kk=;
        b=UP0NR2JQAurXS1T56ZGzQOxViHQVaQNOk1cjTTw8CiuSmwYaa+Ab6jQB8iNkzXmwsC
         43eBzdJnEeQIeS4uh/VaR4D2PH3EeHCVQcaV5jbOdCwv2YS69ySK+8O7q19du+Zq2Je5
         fFhONOmjHaAIxrTupvNMQPeAA43BXzvDIS2t3/tUSQkzgOqZCxdP7A/9qh3UWqFcW2LX
         rkO2Hci26t7cdCv/dLK1uiwx6OS+O3ToDgCAOspylLp3GDvcIJ/sfcaFThb6BdHH4CIU
         w/cQV5wk76ctwIdBCCvuoVr4mzdRClopYgg1mYm1Xo8MtdqeJkL5A5jSHOHjCRRRb+3e
         J4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528056; x=1723132856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F56/nP6583iavNjwlSLSEy9oYVSjQF+kE2RihoWT7Kk=;
        b=kmirlCmA4AdB+TPP+VO99b9jLJMa94IifW4DfPMT/MXCtqmQMih/G8WpOd0/mWSrh6
         zrMbLeKbDa3s8B4z3Lp8hs8RYHc8eWv01vaiU65Ljr4q/MzrcgVEItM75tHTdFsnQPf+
         16Vg8s1c7f/PFZnB4qr45Or5xgGxIsAuUsED6FFySkCCYOIDPwixE8+Em1K4pTGILFfC
         D5gK8hMQX6Lz/7GptyoOjl8Q7yFNYYFcsGyQGKj1wbbumhiPAOkAZRslVCH7rXqwrFVC
         ZEdfcbZ7NgomM4QYSmeSfkuEDu5O5r7ylzI9DcZyi8I4Z7uCkFmbDMIKaul28otFqCYc
         Fstw==
X-Gm-Message-State: AOJu0Yzl8JWpnfJVHvrwqY+w8LVqRgHhJu1qqq9kDMd4kG0CXYMGe1Y9
	Bit/5QM7GxglQXUu9CTYfZ6x4KR304ieTza06PCF+5uWtoyef2zruW7YD0e1Pw==
X-Google-Smtp-Source: AGHT+IHeAAgupyzY+QKnPhmh4mSzjRwESB4x/ZwIjohR05+/LdzMhb0VOYSXlTlqgA8BVc3PktqOFQ==
X-Received: by 2002:a17:906:6a1f:b0:a77:ab9e:9202 with SMTP id a640c23a62f3a-a7dbcb903e9mr175256766b.4.1722528055979;
        Thu, 01 Aug 2024 09:00:55 -0700 (PDT)
Message-ID: <b8fe7b32-9561-4e0d-b703-8ddc29408e0c@suse.com>
Date: Thu, 1 Aug 2024 18:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: drop Xeon Phi support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <44147507-65a4-4f21-aada-fa647f53ffd0@suse.com>
 <ZquvFfd0kr0oL1eW@macbook>
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
In-Reply-To: <ZquvFfd0kr0oL1eW@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.08.2024 17:51, Roger Pau Monné wrote:
> On Tue, Jul 30, 2024 at 01:07:03PM +0200, Jan Beulich wrote:
>> Do as was decided in Lisbon. Reportedly Xen hasn't been working very
>> well on those processors anyway.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Is there any chance of the Xeon Phi AVX512 extensions returning on
> other processors?

Seems unlikely. They also never were AVX512VL-enabled. If they would
re-appear, we could undo some of this change then.

Jan

