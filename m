Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069D976BE6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 16:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797555.1207543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokjk-0007tU-1S; Thu, 12 Sep 2024 14:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797555.1207543; Thu, 12 Sep 2024 14:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokjj-0007rb-V3; Thu, 12 Sep 2024 14:23:55 +0000
Received: by outflank-mailman (input) for mailman id 797555;
 Thu, 12 Sep 2024 14:23:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sokjj-0007rT-6D
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 14:23:55 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3be5fee-7112-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 16:23:54 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42cafda818aso9599985e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 07:23:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a52csm14591234f8f.11.2024.09.12.07.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 07:23:53 -0700 (PDT)
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
X-Inumbo-ID: a3be5fee-7112-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726151034; x=1726755834; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+zp6MJqGbL/px9Au9+eSJSTLq7YSyfb3yAbzt5SjUOc=;
        b=ZGMpr5IxG/V0tfOpvpnlwdcR1byCZsyENYQvTdQowufzAsPTszfhuBr1RPsvFerB/O
         w6tEKPH8uyr23RugZA+tcxUgn5rGDpEkQD8JLzJJJi6pPpAkGWfb4RiWQQe2u7gn2gTu
         xfwXLdLQ8HzMqIEvKK+3pEFv25RdeGGdYFBdiguOtF8PF1BYqZnDvgE9nx09aKk5W8Mw
         3r719pUICYDE2qu+BWsjmtn/J1zCFRfvMCCXMQOXWkytiBSROShuydq8sniXdqx9BQPN
         1h1ajQkrP+rdtNWqZzq1jpZWxnHFME3VUu06fXo0ogvNawSXDG8sFHJ9tS4bwRpvZ8Ea
         PqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726151034; x=1726755834;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zp6MJqGbL/px9Au9+eSJSTLq7YSyfb3yAbzt5SjUOc=;
        b=E3dFPLWKgMagaGFvqz1T7zuk+UFBEme5HJG4mCQEe3qQgkVTMt7isuKDAhqBJr8Qxb
         OGwZA8Vkz8nIN43m6JfuvPmhsUlVbr8CsTplwaoiZwJhMxjtCIVPftrSXs5GjlDzpqh9
         J/v5fO81+ISBEPLmLTR4buI4GYykDeVR0YHUaipkCe1tq15qjUBcfqbHBcjhzYj1Cxm0
         RyaTZQKpZOqB82HiQs7gUMHvoJrFarsfRgy5TVBsk9yP37omTaNXV2z6oTROfl9P1zXu
         158BbBRsZyM01WwsvcBPtNXu5WRWExqXeORmXO5AWmWEy7aRngwfeFemeFS1cFQ+OUOb
         Mk4w==
X-Forwarded-Encrypted: i=1; AJvYcCWZA/oFBkl58fEvNZrQrr8TulnR6RKaB6KQ1w5zo2fuqcEkLXSXDPYpaRETCdPOnlMylry/rm8vKnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzhX+mr3K4QswEjAPvdLUYjgrh8C2AsXkblQI49vL1th7Mponi
	0lCQtN89JWU/TJbVcnozWAYkU3seAI/cl7l2tlOeQwlAEcbarrJlnE456NZlXw==
X-Google-Smtp-Source: AGHT+IGYtnzRjrSIGlAi2giyiWd7SCRjmuf1zqTsingk0QW4YR6Atm/sw1lICG4H30zE+YXoJnZExg==
X-Received: by 2002:a05:600c:45cf:b0:428:f0c2:ef4a with SMTP id 5b1f17b1804b1-42cdb531c3dmr26888205e9.13.1726151033655;
        Thu, 12 Sep 2024 07:23:53 -0700 (PDT)
Message-ID: <ef867f55-eaf5-4656-8915-aef0c2a25233@suse.com>
Date: Thu, 12 Sep 2024 16:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/keyhandler: Move key_table[] into __ro_after_init
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240912125154.1708025-1-andrew.cooper3@citrix.com>
 <886dc591-e680-420a-a07f-ffd288ec413c@suse.com>
 <d496cb2a-5485-41ad-8c9f-d77ed680890b@citrix.com>
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
In-Reply-To: <d496cb2a-5485-41ad-8c9f-d77ed680890b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2024 16:22, Andrew Cooper wrote:
> On 12/09/2024 3:20 pm, Jan Beulich wrote:
>> On 12.09.2024 14:51, Andrew Cooper wrote:
>>> @@ -596,6 +594,8 @@ int __init iommu_setup(void)
>>>      }
>>>      else
>>>      {
>>> +        register_keyhandler('o', &iommu_dump_page_tables, "dump iommu page tables", 0);
>>> +
>>>          if ( iommu_quarantine_init() )
>>>              panic("Could not set up quarantine\n");
>> It's a little odd to have this immediately ahead of something that can
>> panic(), but not a big deal of course. The line wants wrapping though,
>> to stay within 80 cols.
> 
> I'm happy to put it somewhere else if you can suggest somewhere better.

Just at the bottom of this very else block?

Jan

