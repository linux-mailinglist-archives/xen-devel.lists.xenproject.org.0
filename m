Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10792C8A377
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172899.1498007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGFV-00024X-Lp; Wed, 26 Nov 2025 14:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172899.1498007; Wed, 26 Nov 2025 14:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGFV-000233-JI; Wed, 26 Nov 2025 14:12:01 +0000
Received: by outflank-mailman (input) for mailman id 1172899;
 Wed, 26 Nov 2025 14:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOGFT-00022i-Ss
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:11:59 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dee78642-cad1-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 15:11:58 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so53210305e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 06:11:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adc601dsm51971185e9.1.2025.11.26.06.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 06:11:57 -0800 (PST)
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
X-Inumbo-ID: dee78642-cad1-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764166318; x=1764771118; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BWnImpsPVMp1QYC7y3gQMF9aRGpYpTE5XIDGvV8M4xE=;
        b=PdhBYO0JGbhBL60+gWEfF3tS0+/ks/ZpqE/t1ZAGlDs/PGE4YcFYpYls+JZv4D0pwV
         V+HLw/JxTMptje/d/Q41ZabX9GupXr6u6jwUdsFuChSzdrzjctUNcqF0K54fYgpsUm5n
         9PcJTcmgRGzJcYqkKGjXTF/in1kxqmmcdIYCrNxuzGHGu3q18XrpIqS2DjLKkwt9/s0X
         7Wd2WOirMWpyo2E8IQkPdz+Ml3SuruSuOgcUi69ao02CH/7LJ6qV1AH+6MPL9sxCkDLe
         Nh+VquukqbgLJLrGzhx30ujuTN7eiBBgC9UY+b1UzuGXdNiA/CDaG9zJvzdQqOQ2oOAV
         eVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166318; x=1764771118;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWnImpsPVMp1QYC7y3gQMF9aRGpYpTE5XIDGvV8M4xE=;
        b=RtetaPk5hfYHjJ7e/FHEmsJKzArB4xUpvtAPsIJepxHHu8jSk0kKFVX3mQhTl7MK/s
         rP7sX8HkrVoJAekef4hBYOfFxN0vFkSNpFV9pF4BF01kPekhtPRwCN600wjnpKK8DwPS
         fP7rGOi7tctnKfJ8iptI+fxf890EsqwdQJSTuIHIhJnAZGVTd5pr+MeXZ+giWwm6pG3d
         mUQzybL5hcoY09ZhJay2YU/902Ci+ceTbQu/G8Kr49jegupHaNY8DfCP4oOUTLgIwXHA
         39doBY0atetPKmu6JAs6dUJNkW4YOSYKqjJqwc2nCfXZB3iAy32ayLQMdMKap6JiLQet
         Natw==
X-Gm-Message-State: AOJu0YxnsmaI5vht1cazWkznJ7dpLduN5UOej5OK6xWgsSUOuhTIYqDQ
	E3pIgHQsY4jsx0LBUUVBiRoNcyPEL3dAs2o8K8IiV0XRkTkhpkLPCcPkIKaqkcDkQw==
X-Gm-Gg: ASbGncv5K857+6o2BkeVQ6Zwn9AEeBUK+AOhI+4A32HTdxqWtVazF4vw2WNs/3sfgOV
	oMpc/Im2Lv0sfFwcbRBLETtrQlwIUNF19s2pz/Fu3UxKSjUSeYDsr1WPmVEYlF8ENG6EUdwuZd8
	88Akg9Hb8G7/YzqhcI2IfIUh07kexpStend8KA77ZL+ZjgcCkDM6ESipqL94nm0wvYSOKRO1Bat
	q5ia9UjTOT/iEf4uo5Jtj7NxuJg2i2I1p7ZidwNCZTeWIa3P0jNvrup09DauZb3nhHspCIQzfzS
	5z7cAtXuIpwvvMblxOOVfbQDlJgdwF+tKjNbWZBcykE5Xb6ZHUmJCzwcrEBs1y4rXjll9D9JznT
	+/yg12iv1MtDNt/c5imJijZLgjJpcYkvC0a7jaRXfuQHgYpDXWs5RguRhllINm6Yp5d7tO5CW4J
	Vatd7LdSwNcPadwknyrNvor3r788Z1AMuU2O/U+68e1t5heW6vGDr0WMDXVRcqXJ1dnS2Y7J56e
	TBkGxfWo1dPrQ==
X-Google-Smtp-Source: AGHT+IEYk7er0YIgCAhezJP7iTMb94I1gf3nWtxXV8iGZv4m++noWteI/SpevKz/ILUllJ7kvbX9mA==
X-Received: by 2002:a05:600c:1ca5:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-477c1115ff6mr226282715e9.17.1764166318018;
        Wed, 26 Nov 2025 06:11:58 -0800 (PST)
Message-ID: <fdfe411d-0710-4439-85f3-a77ba71b8afb@suse.com>
Date: Wed, 26 Nov 2025 15:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] symbols/ppc: re-number intermediate files
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <b915451d-62c9-4128-807a-42b908dbaef4@suse.com>
 <1755986020.127148.1764166039180.JavaMail.zimbra@raptorengineeringinc.com>
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
In-Reply-To: <1755986020.127148.1764166039180.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 15:07, Timothy Pearson wrote:
> ----- Original Message -----
>> From: "Jan Beulich" <jbeulich@suse.com>
>> To: "xen-devel" <xen-devel@lists.xenproject.org>
> 
>> In preparation to do away with symbols-dummy, re-number the assembly and
>> object files used, for the numbers to match the next passes real output.
>> This is to make 0 available to use for what now is handled by
>> symbols-dummy.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Looks good to me.
> 
> Acked-by: Timothy Pearson <tpearson@raptorengineering.com>

Thanks, but for clarification: This doesn't mean very much unless provided
by a maintainer (M: in ./MAINTAINERS). As a reviewer, you'd use Reviewed-by:
to fulfill the purpose set forth in the textual part of that file. Provided
of course you actually did a review.

Jan

