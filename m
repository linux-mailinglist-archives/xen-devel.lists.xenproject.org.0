Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63CA03AEC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:20:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866178.1277466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5kd-0004DI-4o; Tue, 07 Jan 2025 09:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866178.1277466; Tue, 07 Jan 2025 09:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5kd-0004Ay-1B; Tue, 07 Jan 2025 09:19:51 +0000
Received: by outflank-mailman (input) for mailman id 866178;
 Tue, 07 Jan 2025 09:19:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tV5kb-0004Aq-RI
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:19:49 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8af2eeda-ccd8-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 10:19:48 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso479042366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 01:19:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f06c7c2sm2388502466b.188.2025.01.07.01.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 01:19:48 -0800 (PST)
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
X-Inumbo-ID: 8af2eeda-ccd8-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736241588; x=1736846388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fPYmBIU4Xsfc7I/6M5+jRDqh83o8eAP+kvwxS2rhVXA=;
        b=WLCPrP2RKsry9OfV81y14XcShL/NC8s2+qC+vviO2Cltx0GCc/CyTnmSV8fTMwv+tE
         2VTIFFS5ekFyajE/Y4luQhd+Fpcb+EuV1K/0Ye6ZUAWbh2NMo/rge8xVKEh6JPdsxXtH
         1w1Mrlby9Qpmw6Z9Zd+0F6XnaMFi/by64gvrqqZltCOcdJSqcGIN/9Nw8d24BSPP7ihd
         FA97rKa3KMehgyzWDRLibD9Z9ytMfalf0OFMyWaBdJktTllGhQRvJGUD7JW5tJaOMUTe
         UAzGiCQLDi98tdQMWdHdEehqkic6Ty4dB331UNnXxpRzTAj/0pvoUgE5Iw0NwVU0r0b7
         kezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736241588; x=1736846388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPYmBIU4Xsfc7I/6M5+jRDqh83o8eAP+kvwxS2rhVXA=;
        b=bXejAUlyLKAqUwcMyTkvT/n/Jj5RX7KXoYJH3r6fLrNr5OMgp19ohHxmzgnaY5Omm0
         Qq4MHZppCtcBcPYoUiZSsNqUIzz8Ya2pI3XKbHsOLTdfHWw6PWzg0Bs8pPIhe+U9hH4X
         nq1RS4EnA2P5jbrl3tnNW42705lWzxINR0JF316q9UGqOeB9k36KmyjbzxNlkwIzxn4d
         GDHfKCH3jMYpaDrHH18A1rPk5Zgkk8OHdK6PbEv2Hx+h3az0pvVZMEZ7e2kCIrM53cVn
         wFFQAnKRrpPtFiTYL/R4VwKdT3oIn082Yr6umEAAYmYOuyZlcnLU4dFEEOjZdaaXQRxA
         pN2A==
X-Forwarded-Encrypted: i=1; AJvYcCX5LaRjuvNx12VnQvOAmQIv9G3CoiaS2/gPsDuTu9FrfBzeGvYfae8dgsPgUm1jeqxJo5cdEljqcZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyp0wb/R/oCwcbQftzOXoj3Kx0vT04yXCwNcptee5Ey4zTXTurn
	/szopYLbl02FrUHF9U30bfatb0gICLu6EE5h0bZZwi1kkbyG0ir5Scug6vf5L92uKja2rJGO3pQ
	=
X-Gm-Gg: ASbGncueb2cghDOhdTPyM/iUAmmHAUysFMtg+zvwRHZJYky7ENcUWFhATaaNsR5bGCy
	UNp/jAMCE1cwj4oCpekwaxwtgio1+2esbCZ0jxnVdEp52HIVT1Qwt9b4O8CvWtisSJ/DLnU46/J
	yA/XAPLgPzVvH66roiQQvy7Q8/n8vapx3ZhkiBM9J+tuy/B7QuE6bucgKmHQRygbI4hEh5C/MDb
	3zwYm/gYM0d+J94XZpUF8Af5ZLoeFVNg3dhlFKsym07kEfHkClTMqCKI07lkzW6ns9uzZ+GLPlV
	5vm67QWpWgfMoShnX2LK+PEt8DH0tXRNxHr3tOFkAA==
X-Google-Smtp-Source: AGHT+IEdURY8ztG1WMP9j+t/N/fUfSt/TGxs8fPypa4MJPZ3nDiXoFg3W9cmpUvnRsGQ7a+MC+MVJQ==
X-Received: by 2002:a17:906:4fce:b0:aa6:519c:ef9a with SMTP id a640c23a62f3a-aac3366afa5mr5906852266b.53.1736241588369;
        Tue, 07 Jan 2025 01:19:48 -0800 (PST)
Message-ID: <921ef7b8-36d2-405d-ad7e-1a9418b7c4e6@suse.com>
Date: Tue, 7 Jan 2025 10:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misra: add deviation for MISRA C Rule R11.8.
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <4a2c68bdc11a815cb8531be305e2e7fc4bef7779.1736240655.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <4a2c68bdc11a815cb8531be305e2e7fc4bef7779.1736240655.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2025 10:10, Alessandro Zucchelli wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -353,6 +353,13 @@ Deviations related to MISRA C:2012 Rules:
>         Fixing this violation would require to increase code complexity and lower readability.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R11.8
> +     - Violations caused by function __hvm_copy occour when a const void attribute is passed,
> +       as the const qualifier is stripped. However, in such cases, the function ensures
> +       that it does not modify the attribute, therefore, this use is deemed safe.
> +       Fixing this violation would require to increase code complexity and lower readability.
> +     - Tagged as `safe` for ECLAIR.

Do you really mean "attribute" in both places the word is used? In the
first case talk appears to be of a function argument / parameter, while
in the second case it looks to be the buffer referenced be the
argument / parameter which is meant.

Jan

