Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A43963C28
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 09:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785505.1194961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZD0-0002FL-O8; Thu, 29 Aug 2024 07:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785505.1194961; Thu, 29 Aug 2024 07:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZD0-0002Cr-LG; Thu, 29 Aug 2024 07:04:42 +0000
Received: by outflank-mailman (input) for mailman id 785505;
 Thu, 29 Aug 2024 07:04:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjZCz-0002Cl-24
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 07:04:41 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f503e8cf-65d4-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 09:04:39 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a86c476f679so30040366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 00:04:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892225bbsm37538966b.199.2024.08.29.00.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 00:04:38 -0700 (PDT)
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
X-Inumbo-ID: f503e8cf-65d4-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724915078; x=1725519878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gnd9JCsY88DYXal7dEGnFfeZUo5ombkAjR8uLdQZKUc=;
        b=I87NC6lI+5GjdWhzAYwrRKQGHfgbaiAQ3yQv/OTdqzJJpBeFIn0vw76zcLNoKB/NK1
         28T5R9NLr4vgiWLo3RTFJPA8H/0FfPF9Nadfwpzb5wJ10SXqBFKuGUR1hEwQSqFVHA8v
         Vf/S28UH/ecocMQxkTpikQl9Us/ZAfOLC3GpbNvupGqTlP9CbJQAm0OhAY9C6tzOzPWD
         8MqYmZz0X7A38QnEM4/BEfErhflt+1Jxo9FcQyqYud32KGbx7REEhZNSXFQ7f99oGxRk
         ayQvk+MHzZNXtvtfWJx9QYDhCwy0YWnTLloWyyg5/X+hUqtxrmfuF3N4RZs++4OkEWdv
         4Nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915078; x=1725519878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gnd9JCsY88DYXal7dEGnFfeZUo5ombkAjR8uLdQZKUc=;
        b=o7ZceapFpxnM17sKGko1X07qNZunYoAcCAC/CDQjqcoz+0pN28Ydu5CCXWn41pf5aS
         1rehCSjgQbfIi3QmtGNBtao0m3fxAt+jX91rNeBABjq0Iv/I6IQFq75iwjVPiPQv5VeK
         1VQSPIoHIW5gHIT5gftfP0zcSTsiq7mG4pC5f6knRIzGU0VC2qvojkcGBGBZGYfJpljd
         GEN/KoivGLO7QiXM5s6WDtGsoZXbmoj1gwZp2BBthttVwaTGs4EH0DzozZH6rJgz3d8S
         9WYFFUmUub1xgOrN7EoboRff2J2DQeCEDVQths7irOagxXj36Un2SmyjnlJT73MTRmr2
         p4gw==
X-Forwarded-Encrypted: i=1; AJvYcCXjFnQbSEYAAe1PAQvzLe10qOhIyGXQBOaibEUoobVX4bL7dFsBNgS+HiirkEEpVL7pmO485KUPjHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHS7+iN+QEd9etb6FluD1XOzJZu5sTkptGQjNxpd/GuDHZN7uN
	TAt/IrEq6xBGOSHquyGUg5cdXS8/SgzVU1Ps5b2YI9aHWsdZM0uBoWsg39B9Rw==
X-Google-Smtp-Source: AGHT+IHmUEzxRyUnBA0E2PO1lmvXVgIdqt9KMs3Xt5mBb71h06wLqmBUginCOylyTyG21b1/S7Qryw==
X-Received: by 2002:a17:907:9686:b0:a86:96d1:d1b with SMTP id a640c23a62f3a-a897f83ad1amr121496266b.16.1724915078389;
        Thu, 29 Aug 2024 00:04:38 -0700 (PDT)
Message-ID: <da5d2ccc-6a21-4bcc-8ceb-75b930dcdabe@suse.com>
Date: Thu, 29 Aug 2024 09:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 7/8] x86/mm: add defensive return
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1722239813.git.federico.serafini@bugseng.com>
 <24501d2e7f5d82d8e5a483a80b35e04ce765a7cf.1722239813.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2407291512280.4857@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2408281735020.53815@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2408281735020.53815@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 02:35, Stefano Stabellini wrote:
> On Mon, 29 Jul 2024, Stefano Stabellini wrote:
>> On Mon, 29 Jul 2024, Federico Serafini wrote:
>>> Add defensive return statement at the end of an unreachable
>>> default case. Other than improve safety, this meets the requirements
>>> to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
>>> statement shall terminate every switch-clause".
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>>> ---
>>> No changes from v3 and v4, further feedback on this thread would be appreciated:
>>> https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00474.html
> 
> Looking at the older threads, I looks like Jan suggested EACCES, I also
> think it is marginally better. My R-b stands also for EACCES. Jan, I
> think you should go ahead and fix on commit

No, I very definitely want a 2nd x86 maintainer opinion here. Or a better
suggestion for the error code to use by anyone. After all, as you confirm,
EACCES is only marginally better.

Jan

