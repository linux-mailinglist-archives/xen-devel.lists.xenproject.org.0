Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DDDC3ADB3
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 13:19:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156881.1485844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGyxL-00084U-FO; Thu, 06 Nov 2025 12:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156881.1485844; Thu, 06 Nov 2025 12:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGyxL-00081g-CV; Thu, 06 Nov 2025 12:19:11 +0000
Received: by outflank-mailman (input) for mailman id 1156881;
 Thu, 06 Nov 2025 12:19:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGyxJ-00081a-F2
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 12:19:09 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cac6110e-bb0a-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 13:19:07 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso162756666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 04:19:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b728937fb6bsm208538566b.23.2025.11.06.04.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 04:19:06 -0800 (PST)
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
X-Inumbo-ID: cac6110e-bb0a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762431547; x=1763036347; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=udM5wja4JkzGjtlz6h3rJQZ9eHZo8P6+oDsjAOkOwVg=;
        b=aO70J1hZOo0OnLc0lkbEy06z4ZPQU+mJrkseeyoSR/IiA6beqQhgqx8c+NZgGvK+rj
         ERoqsRRikI+gPaKPLoNZi0p2VG/3qQM+S1bjQffMafVZgbLioD6+i7z1JU5f7tuwyPcq
         LnAd5I3HUU7aX155kgydniRhQGVAtcV1Szmqyx23bbLig+dNUCFHK5ms9jlO9nj5X01n
         65Wj7PCUeP9fgngFBAdhC/aWlliL1mnYdbeVe1ladB7+V7MN/vIBUQ1arce6/CP8dNxe
         y73qPN8e9P4tFgCEnP9L6h+MXHfXzmmchKfSoo/MdS3BuOB4ebbCTbmvPr0NboOQ3WZf
         E/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762431547; x=1763036347;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udM5wja4JkzGjtlz6h3rJQZ9eHZo8P6+oDsjAOkOwVg=;
        b=Jf767LG5x/neBiLsgZtR6NFdBlb6eUHM8/2lb9KhRYGS4EVq8ZIQaYsM/7dDbrxggv
         tA1+xsZlbFjOqk7OWVrQYv9FgIkP7+NO9hy+XJvvYCyB09xt7d9o5MgrYo14+1MH7nkE
         eEEY6fLNdB9PUPjQtmWJeeQEvwTR8UrJgUhvExTusAbEH2bQ0kPOX1VvwtHcYzMCHhdh
         r14Y81qrsxZhkF24wDfz4ESNYQY8RzHJrGjGlr2flOq7/WDt8ix22MKhUQWLCQWGisVu
         SXw8WlOpe3duVnsC5RRw0jfLA4UR5L9SULGKdCNDtRSdlaI1YnHpW3rNOf4WRRD8Sukg
         fNUg==
X-Forwarded-Encrypted: i=1; AJvYcCV1ZyGgU+hBZVk7knP2Fzhzpq6ffXyYCDRq613IFvGQbdx4KeLfupafaXlPFCLLQSRUWWCWV4632n4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYyQR0YEpJs+dXLTeQZVKrZ6JoQj+Qdctk9g9Ul1VhpIqEF4sA
	z+VA9aQwZPG5w8QyDd0HwTx0EEi+tufP7gu2pkfuOtbK25SVqEocatqfw1QJ/lvzGQ==
X-Gm-Gg: ASbGnct0hP3qzCcCwbuBMsm1dOTjKCOlyDqsrEwFOjQZeD4BUEoqx8aSmQrxOv8SYJ2
	sQ43hLUjQ5RS29PkRl0k1YyKC+wI8tGv2RkFYTEigQM0oIgLpY8k0RUXwN4Fh3NnSIkovL9Fn9I
	KI7CTukX5hnfI6C0nwuIs0dGgUm1qo9wBWRq+UxEStJ4xbJWoHdVKIMkbq1KfSZDEq3E3Rkl3sS
	uFYG2lKsRcBDytOwfgVggzi1E2iEJTNcQp5gsLKzjUJxhLUgeHBvfz8LT5ArhfMrws6uwz9iKUV
	pZg/Ugjrdm59fvLrjc7mnqVJMAMhOHkQV7EpgYaee1K3Fy89FSpXPrJD0l+v7Kd7Q9DkEx/UkMj
	Qa/0kXXRhBCYGG2mrTu3O5UUduTtxrCyFclK+nC09eunWga2MnEl/xRQes8cifT7sJmRB95B8iL
	zChKHPMqFBbyMHFGnK3beH0RFBasVMz6Z/eApGtef4hLWanDV/C9YUwv+ygI0j
X-Google-Smtp-Source: AGHT+IG+4ACsFDygSLlz+i7hSgewZffd4il3RmLkOfVOY3a7zOnH3Lqoyno/XQNhmWH2gJVpHYnf9Q==
X-Received: by 2002:a17:907:86ac:b0:b6d:4f1d:8c9e with SMTP id a640c23a62f3a-b72652a33a8mr686698366b.24.1762431546835;
        Thu, 06 Nov 2025 04:19:06 -0800 (PST)
Message-ID: <e66a7724-12d3-42e2-805d-b32febb3d346@suse.com>
Date: Thu, 6 Nov 2025 13:19:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2] acpi: Set TPM2 LAML to actual log area size
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251105000310.690-1-ngoc-tu.dinh@vates.tech>
 <58064c07-4182-48d8-9479-7b9f8e9a06cd@suse.com>
 <e3e182f1-8566-4fe5-b599-3b2f6c582782@vates.tech>
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
In-Reply-To: <e3e182f1-8566-4fe5-b599-3b2f6c582782@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2025 13:13, Tu Dinh wrote:
> On 06/11/2025 13:10, Jan Beulich wrote:
>> On 05.11.2025 01:03, Tu Dinh wrote:
>>> The LAML field should follow the TCG PFP specification:
>>>
>>> The TCG ACPI specification uses the field name "Log Area Minimum
>>> Length", but the field value is the actual log area length reserved by
>>> Platform Firmware, not a lower bound.
>>
>> And this is said where? Even the field description (ACPI 6.5) reads "Identifies
>> the minimum length (in bytes) of the system’s preboot CC event log area." (I
>> agree it makes little sense that way, but the change still needs proper
>> explanation.)
> 
> The above is an exact quote from the "TCG PC Client Platform Firmware 
> Profile Specification Version 1.06 Revision 52".

Interesting. It didn't become clear to me that this actually is a quotation.
Perhaps:

The LAML field should follow the TCG PC Client Platform Firmware Profile
Specification Version. Version 1.06 Revision 52 says:

'The TCG ACPI specification uses the field name "Log Area Minimum
 Length", but the field value is the actual log area length reserved by
 Platform Firmware, not a lower bound.'

Remove the now-unused TPM_LOG_AREA_MINIMUM_SIZE.

? Then
Acked-by: Jan Beulich <jbeulich@suse.com>
and I could make the adjustment while committing (after 4.21 was branched off,
of course).

Jan

