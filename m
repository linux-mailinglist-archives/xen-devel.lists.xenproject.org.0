Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8C298FD81
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 08:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810020.1222620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swc7G-0003dO-0M; Fri, 04 Oct 2024 06:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810020.1222620; Fri, 04 Oct 2024 06:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swc7F-0003bj-Tu; Fri, 04 Oct 2024 06:48:41 +0000
Received: by outflank-mailman (input) for mailman id 810020;
 Fri, 04 Oct 2024 06:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swc7E-0003aK-DK
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 06:48:40 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b01fabf3-821c-11ef-a0ba-8be0dac302b0;
 Fri, 04 Oct 2024 08:48:39 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso342642266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 23:48:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9910472262sm179880466b.186.2024.10.03.23.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 23:48:39 -0700 (PDT)
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
X-Inumbo-ID: b01fabf3-821c-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728024519; x=1728629319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P1Li+auiGjtnam9gY3/oEudFR8B5GElQFamanJSyFDM=;
        b=PK0UywBzQ+Kr5GHskPJ0amUUuOyu5sS3iJ8kA1zRL0oAOqvgajmDzT2PRaGBK9BZlj
         GA9ujcY0mNONCyoucXkuoB5VdMNGfMmw1/40xiLawcIwCdSm+eGHD04qTo3gNfGclLNg
         sm3iWlVBqdvH5yiOAMlSxzl6gy6nfmWH3/YVOf36+CaeEadN1WnxbcGcrKQFawxyGwgw
         56oUVNEI9+sEzDfUuQf1XKtqYAo/f3s/LgeN9JGe70mE2005JldFN7Z1NHt0+UMDkqNZ
         8Lm2klgWOVDZ9w/1vI6a9eFzlROXTDpLGj7uUXqyBhRjxxfKYK+oNP8+LjdIb0cUuew+
         +knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728024519; x=1728629319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1Li+auiGjtnam9gY3/oEudFR8B5GElQFamanJSyFDM=;
        b=IMkH6j4jh73sT/UxTO5HXKL9XYCesz9Axd4yVoTB/5+3WiisW+15YrmkJXor9kPrgg
         1rAZnr9VHdCqvcXJN8rof9ShboQMLn+UNG7MGUxdpwJXf07co27k4qXnVUnTW8zjvhuk
         GalOQ9BMIoMVBgg9JC4/tbhSubL8hPHwO6KxTFqQ1Kf5wc3BVLjfesBwVtYxrehIb+eY
         OjJPMZyGmgQuVwymbD2iDMsLu2JHHT5gUUgXVZ/0qDMo0tojqaaXrTaNKWDenEnDeO1R
         uAWlbAkU7Aba4vnOaBgR5+/FW5oKwiOCNmtdh0GU2JrRpqIiaF8WIe6xnouEKk+7lQJ/
         CcQA==
X-Gm-Message-State: AOJu0Yxw7tqVlFPJjQYPakcRwkHjl0iPkNwWEE0fOZyxGMG5tIIlPMmw
	QyZ8mLH45SxE70yOgeCBGAaR1KQvbkhonX+Qem7TpZhiKhumoYp4/nemzW+RAQ==
X-Google-Smtp-Source: AGHT+IFDM9C2/nBrLf76giwg2AxA22jp6DNmiBZ7zzuG7FACezJpkIIzX6M5h6eCQQfnXNRjXBO9+Q==
X-Received: by 2002:a17:907:3e1c:b0:a72:7a71:7f4f with SMTP id a640c23a62f3a-a991cede491mr143607666b.7.1728024519311;
        Thu, 03 Oct 2024 23:48:39 -0700 (PDT)
Message-ID: <9bfe6b36-d44a-424d-819b-b19978571b18@suse.com>
Date: Fri, 4 Oct 2024 08:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/APIC: Remove unnecessary logical flat functions
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Matthew Barnes <matthew.barnes@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1727880621.git.matthew.barnes@cloud.com>
 <fc3176baecd67c23dff710e4a1934c2caae47ebd.1727880621.git.matthew.barnes@cloud.com>
 <Zv53Qz76kN0-1T9F@macbook.local>
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
In-Reply-To: <Zv53Qz76kN0-1T9F@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.10.2024 12:51, Roger Pau Monné wrote:
> On Wed, Oct 02, 2024 at 04:17:25PM +0100, Matthew Barnes wrote:
>> Now that GENAPIC_FLAT uses physical destination for external interrupts,
>> these functions implementing logical flat for external interrupts are no
>> longer used.
> 
> I think it's fine to merge this with the previous commit, so that the
> functions are removed at the point there are no longer used.

Indeed - no reason to even transiently introduce new Misra violations.

Jan

