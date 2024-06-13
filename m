Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F8906995
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 12:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739753.1146691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHhIc-000829-Id; Thu, 13 Jun 2024 10:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739753.1146691; Thu, 13 Jun 2024 10:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHhIc-00080A-F7; Thu, 13 Jun 2024 10:03:18 +0000
Received: by outflank-mailman (input) for mailman id 739753;
 Thu, 13 Jun 2024 10:03:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHhIb-000804-ED
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 10:03:17 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 270b997f-296c-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 12:03:16 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6f0e153eddso111085966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 03:03:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da40easm54712366b.26.2024.06.13.03.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 03:03:15 -0700 (PDT)
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
X-Inumbo-ID: 270b997f-296c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718272995; x=1718877795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CHFu7upoFYNR81PQR/MEomtxlSSiAke3/gsmQel2lOU=;
        b=SNtHZ3Ba5pJoUlBgF3nhoc8mYFBAiGdfWMPbIPHH8yf+JEf73Qf6IMMhs8Q1X94Ebi
         WKkpIyzcD0dMBBvpfIAiekQubRRrLBlMB/GXeU2v68IrCuJTywl5wxDb1LDCrJf98JPk
         4kmzP8JXHEVjIFlYpbHczYKdbTX5S3KbZIU9Gjnl+hA2OCwdPR3PcnRNxXLe8vTHD4uN
         PUfqT8jWmT/QRd21mz6Mc1yPQ0ZfvGdcbUIKbs9UcRsWUCvZo6IVqnXcjzpDDCQSinxs
         S/NVQCx+4D2RP1FYUk4MEMEVetYGfqImQrSm42vol9IiIQRX0lA6x8dMvvdZLU7r6Dus
         g1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718272995; x=1718877795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHFu7upoFYNR81PQR/MEomtxlSSiAke3/gsmQel2lOU=;
        b=Ix9Jxb6p/Sm29hTNHqdZd5Lr0RjTjKzjJ5Uii1lVNJ/EoG5iWzC+tX6HE5gNjPO+Fg
         M162DtDKfcN4qd0epeuJAIp1e6CvfWXor2ZtukEHHUUrON7jba2YvQeIVA+Ge+EyB07W
         5w4hHH3V2awUWoC/SZQJTmhR9lsBGZrM/tYBRwKgKQEpU7MNy2vTJsmN4e92S8Ck+yix
         mA9JbufMof6FGvEPThRmq6lc1gFLy/gjAD3IImDvTKqjlZGbH42wFIuyu9ZcvcJTxFlu
         7AZzf20uXKDuPI4AHK3BpDNpoPbA14Vj4q30CVC8mUQLXeKcdtpcpY8e1zakrSpIaPZw
         uhCg==
X-Forwarded-Encrypted: i=1; AJvYcCUZxca/6DkO93KvCARfXenCaZq/yNWxj7swTKr1WcQs0Y5o1GJ7rDWOR1nHtlxanjyBGVHNiHveUdrbFxR+Gi4zic379wi/O5QxfDeffuk=
X-Gm-Message-State: AOJu0Yzgyg+eF9XjJrL1CPwmhz928Zb1KDV6XL6o874fPkUlKeKwzG9x
	EtkUi/F1/H2U2Y/bTKNusKkhzdbqqVsgCrDhJGVpORcHHKhlz7axodsLVfEL4w==
X-Google-Smtp-Source: AGHT+IHoyZSgFwmD7LypWrbCqxd9mNYhTrWz7fYI4dqmZyGZ1sgLZ4JhjBnIult8ZC0hNQZuVGnZRw==
X-Received: by 2002:a17:906:c192:b0:a6d:b66f:7b24 with SMTP id a640c23a62f3a-a6f48028205mr269293166b.75.1718272995524;
        Thu, 13 Jun 2024 03:03:15 -0700 (PDT)
Message-ID: <1dd68917-090b-45ab-88a5-157a4afe0f6a@suse.com>
Date: Thu, 13 Jun 2024 12:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair: extend existing deviations of
 MISRA C:2012 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20c0779f2d749a682758defc06514772e97c9d89.1718260010.git.federico.serafini@bugseng.com>
 <cbd59b32-213b-4b5c-90fb-67906b7ae680@suse.com>
 <81332f64-9bd3-47bb-a6a5-adeecabf9730@bugseng.com>
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
In-Reply-To: <81332f64-9bd3-47bb-a6a5-adeecabf9730@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2024 11:02, Federico Serafini wrote:
> On 13/06/24 10:16, Jan Beulich wrote:
>> On 13.06.2024 08:38, Federico Serafini wrote:
>>> +   * - R16.3
>>> +     - Switch clauses ending with a do-while-false which, in turn, ends with an
>>
>> Maybe more precisely "the body of which"?
> 
> Will do.
> 
>>
>>> +       allowed terminal statement are safe (e.g., PARSE_ERR_RET()).
>>> +       Being ASSERT_UNREACHABLE() a construct that is effective in debug builds
>>> +       only, it is not considered as an allowed terminal statement, despite its
>>> +       definition.
>>
>> DYM despite its name? Its definition is what specifically renders it unsuitable
>> for release builds.
> 
> In debug builds, ASSERT_UNREACHABLE() expands to a do-while-false
> the body of which ends with __builtin_unreachable() which is a builtin
> marked as "noreturn" and thus considered as one of the "allowed
> terminal statements".
> As a result, ASSERT_UNREACHABLE() will be considered as an
> "allowed terminal statement" as well, which is something we want to
> avoid.

Hmm, then maybe add "there" at the end of the sentence, to refer back to
"debug builds"?

Jan

