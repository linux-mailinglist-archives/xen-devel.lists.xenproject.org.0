Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644DA98FD67
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 08:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810006.1222589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swbuj-0000EK-HV; Fri, 04 Oct 2024 06:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810006.1222589; Fri, 04 Oct 2024 06:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swbuj-0000CB-Eu; Fri, 04 Oct 2024 06:35:45 +0000
Received: by outflank-mailman (input) for mailman id 810006;
 Fri, 04 Oct 2024 06:35:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swbui-0000C2-IX
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 06:35:44 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e15c5d49-821a-11ef-a0ba-8be0dac302b0;
 Fri, 04 Oct 2024 08:35:43 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9d2195eso2365251a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 23:35:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8ca4d6de3sm1487883a12.76.2024.10.03.23.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 23:35:42 -0700 (PDT)
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
X-Inumbo-ID: e15c5d49-821a-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728023743; x=1728628543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EA/bcFknahj8v7ut2XQMu2yAnNkFtp7StC4rkcp55oo=;
        b=aHKdtSXI1L8p3LOi/snH831H4/7Opm16kOcZA5iyuEFMXcHYwmCk1xa2WpJLrsaVK5
         6SkXCTF2Th5KRlEbkx98e5go9pGc0pNBNXn1GYDdsms/+equC76SX697HVJ3pbSvyleT
         zkC9nFZk6iRwPLC5zwOoyGdBe9OvbL9Rn0sJKSNonZEDPbimChpJ/Br1OgrqraevujQm
         zXNPlyTnayxXIqe0+7tG0TIBEKnHJP3mUV/ZwtYL+7TL/PCtnKRP7uTHsa08W0ws2IGN
         G1o+fKXrHfLUEO/iNhdJvQ32OQKImu5MJFCwUR0cAFnqJ7HmMjCcltheFDQlm7P9mvUe
         bTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728023743; x=1728628543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EA/bcFknahj8v7ut2XQMu2yAnNkFtp7StC4rkcp55oo=;
        b=CartPnxL5KaxVzfrBcx/yy/ba9QJV2wTHn9RqMPE/fUWv4R20cOeaRjD3PxeNSdLy5
         GWJ1Wp2sJr02s5qX4Z/bxPa1/Z7SVEJ6WuYmeOYchI/+AoJZdhpBW6VyGSojTNXVU/yM
         P6L1z7yAuvF0kZ0ZM4RXoNwQZX3Et+KR/qrRxSJUe22jjMotCBElv+olHUiCcRz5p57F
         MWcDFktLVt9/sisG41iEqLMPVN0WWSBPHLxT4FpxRllrQlhI1KGPGPQqzgDQxj0ynj8k
         5MlQ+Ck0/0i9lZlyAiRSAPU9takwWgKjnI2/wKjZ0YjQy0wfLkxRBIzsxQMfohLhbDnS
         hJBA==
X-Forwarded-Encrypted: i=1; AJvYcCXp3nkxVGQ26F8o+aQw7gnKnGOoz+eOlcqXJ5d8TVv3exfV5Bzo/OM/FOZY5HLUZbHbi+3csbxajCE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfsHSb9+fiVAssIJfUVKW/KiStCAW1OGrXnKP5pIS+KMHvFve8
	AwF4+tcSRj4+lVMjcuUPLTmu5w670qkUH0czJA/a7XdrJTN4mNFSqEp3gocTxw==
X-Google-Smtp-Source: AGHT+IGkrfJzHIUf75YKwfRL1drfik6r6q+FIktniqVWozF+sZQ6vfEWLjH+GGOqQVxNEgcHvOWfDw==
X-Received: by 2002:a05:6402:50c8:b0:5c7:1ed7:8825 with SMTP id 4fb4d7f45d1cf-5c8d2e16682mr1247646a12.12.1728023742903;
        Thu, 03 Oct 2024 23:35:42 -0700 (PDT)
Message-ID: <ae1b0f51-c150-42e9-a80e-7380ea153e9b@suse.com>
Date: Fri, 4 Oct 2024 08:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Convert remaining uses of the legacy ALIGN
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241002200913.1963443-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241002200913.1963443-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.10.2024 22:09, Andrew Cooper wrote:
> There are only two remaining standalone uses the legacy ALIGN macro.
> 
> Drop these by switching the .incbin's over to using FUNC()/END() which has
> alignment handled internally.  While the incbin's aren't technically one
> single function, they're as good as one single function.
> 
> Finally, expand ALIGN inside the legacy ENTRY() macro in order to remove ALIGN
> itself.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



