Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA7CC63463
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 10:43:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163558.1490645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKvlN-0002xP-Df; Mon, 17 Nov 2025 09:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163558.1490645; Mon, 17 Nov 2025 09:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKvlN-0002vQ-Ah; Mon, 17 Nov 2025 09:43:09 +0000
Received: by outflank-mailman (input) for mailman id 1163558;
 Mon, 17 Nov 2025 09:43:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKvlL-0002vK-Vj
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 09:43:07 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1d1d53d-c399-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 10:43:06 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-640b4a52950so5825687a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 01:43:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad44b4sm1050807366b.28.2025.11.17.01.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 01:43:05 -0800 (PST)
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
X-Inumbo-ID: d1d1d53d-c399-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763372586; x=1763977386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Muu8mGOB3Hor5+Xmb/Z/xvUInL65jcNOJXO+1HzjbN4=;
        b=HKPZDww9unooJanXK0e+180z1w6uznvUkwCL3A4IFmTOh5qP70MRG54kc+tJ4VLJ28
         b/FxA4A6WVyb6SSFzmJoYEuvItDfL3hhMHZGohzfZwqHP/GdSL/hgZKEl+GXf/A+s9Uj
         cTyHrU8DDqw4V5q7JjFnmSXT4AJG3cHLLb/QfRC2EK+55NmD6KWfbRM3arYU9CZwcSm7
         bkcJnWzhKKO1LVsoqlh4qhOj0g58LPgEQywqMJiFyPRB8YFjfY/N9ccxmaLS9qSkflEq
         0ZPKwIHyZoOBCJOPoZ13MRMrD+x3JT6jj0zt8WB5N6LjSB7brssxdCRBM4fhbLRxHP8v
         UpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372586; x=1763977386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Muu8mGOB3Hor5+Xmb/Z/xvUInL65jcNOJXO+1HzjbN4=;
        b=sM0eQjwsQZrn6oCKZuZyGOEDGz3KcBF3LJF+w2/iW9ng6QGmUTMU58JfXQbuB02m1e
         XrGa5sieT2Gia3b8v/H7KjjS1eLFOTVAiT7bhyGO7x17YUulev1fLIs46NIuKHpp10v+
         I2eHFRGAeUCGSLJC3mpyJBFTD+CSjGdI4ssMRE8dH/KIS6+WJ/fFQKpeZPxDwjCKMsot
         fZ9TA9t1wPwWf/DUpTkhF+tEolJc8kciuEwyYNWP77NE19yH2PzIFbdhhTYd3rxUXkwa
         fdjmDiwJv5r22YPi6lRYbKpgRFtjZiqiDr2q76dVYiwZM1RF6mny3UvFo5/Fafc8O5sX
         fLoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK/gKiBAxrPAt7+TRsZj012CY3gbofsElwNzzT2MOBlla/eqTN64NNAFS+Cu9HIGUi4SSAefhfmT8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywz9ZCGtyQa1mcbtP1JcHczV6hMnT4yZlr65z16xA8J9HbTfTo4
	jHzrs80h8XmZaa47tXJ8NHd52vxO4r8JjpjxkO5AjRKtpNd6pjcKtsFyDAlHUKABVQ==
X-Gm-Gg: ASbGncvWUBFOJtHD+9g7st4978Qxun258Dubcx8CF7lfDjqULFu7OalWJmtvRpuGRef
	7KY/DGQI+kvj9tBahM2AYoxu/L18XUdIUmmqZZVOiD/l3K0IpcGDs6VK1qHCHKLcsWJ0hPps4Mm
	CxqEwtsS2yCPnU52JXtUCSlMSMhagv3481IO+NQr2Wq48DZQMFf6W6INIFdqGY9+uXfsK1NUimK
	rLgytmW7qOCU4tgCPwHRag/Hmcpt18Fare5GBOTyz9iRkENqh5ng0vzBLKobs3e1+qHY6sJB+ZJ
	xTcQr4MnS4Zof1Uy3iYBU4YOYh/NjnZsjvkX2fKEtdeylA6s7Dzku2YaRpgR0YCV25ih2VBbh+1
	uLgZdpSbsxyYEtYmk1DRpbNO3wn15tY+lAyytahj+pLvjrEPp5ZyYN7K3ltSgxKXyPxj3NYSpWJ
	4XWfqu29crUC2H72YQm5tmwo4WUY2VH89Oyv2fUcI8qkoiSJmwxwo5CDqkC7CNDYwHdmJmPZ+VR
	g8XaFblme799w==
X-Google-Smtp-Source: AGHT+IFzXFqYU7iXFFxKVQf57bz1ySs5E7cnXfb4y+WcKXNnCWvwX9FSGoHP3mcwoF9RPSfqFM8+jQ==
X-Received: by 2002:a17:907:5c9:b0:b73:5b9a:47c7 with SMTP id a640c23a62f3a-b736795d4aemr1263810766b.51.1763372586167;
        Mon, 17 Nov 2025 01:43:06 -0800 (PST)
Message-ID: <2db5085c-a04d-4745-8fc7-5e257ab30926@suse.com>
Date: Mon, 17 Nov 2025 10:43:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/ucode: Add extra rows to the entrysign model
 table (again)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251114152447.272823-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251114152447.272823-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.11.2025 16:24, Andrew Cooper wrote:
> Link: https://git.kernel.org/tip/dd14022a7ce96963aa923e35cf4bcc8c32f95840
> Fixes: ff8228ab4658 ("x86/ucode: Relax digest check when Entrysign is fixed in firmware")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Found because AMD have released ucode to fix RDSEED on this CPU, and I
> cross-referenced the tables.

I wonder how many more we're going to see.

Jan

