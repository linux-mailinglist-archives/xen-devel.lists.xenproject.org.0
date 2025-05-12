Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5AAB34F2
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981197.1367590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQSb-0006NC-Ft; Mon, 12 May 2025 10:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981197.1367590; Mon, 12 May 2025 10:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQSb-0006Ky-Cc; Mon, 12 May 2025 10:32:37 +0000
Received: by outflank-mailman (input) for mailman id 981197;
 Mon, 12 May 2025 10:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEQSZ-0006Kq-KH
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:32:35 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a4797a2-2f1c-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 12:32:33 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad2440926adso232092466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:32:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd432sm591146466b.129.2025.05.12.03.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:32:33 -0700 (PDT)
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
X-Inumbo-ID: 6a4797a2-2f1c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747045953; x=1747650753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GJbhpxkf3ajSrDGzznvlJI+SxDkvgHXqyvATii9gm3M=;
        b=g87TbXgmgpLtbFwRgTkB28DwftUP79tV6w4eu3lni7wiTLvAIzg6a64zMARjR35gK1
         NoigRMkkGAniMb/O5GeRycqk6DbwYEDctP65rMn/xbEtSHXTGZeGj6LlrMzAVBvVRw8Q
         tvD4zSW09FX7OeytNq8bOpAPjIDj4NVg3SPdTPj7ULwUELx3AtK6393FC6oav1K7sDA9
         u0bhxOkA251c65OBZgsQ0bnySq2bzwBjuQ1Ka9TvQwNxNoXOLTOmQKmoJ2iZnDU0Hs4t
         Ingx1SqRRA+sLxLoaJTgejcNXFr61yXcht3lQ5/S60LddiCMMD8DAvMqG8aZnR9ukhy+
         cMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747045953; x=1747650753;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJbhpxkf3ajSrDGzznvlJI+SxDkvgHXqyvATii9gm3M=;
        b=vpJYZhacIrqrMkDW2rqO0sfKZfbs+23z0rZZ456EIM+hzMc+cKL8H0wv+d09Zb7iSz
         h8S/pY99fodeoErdPblZWtpUsnZA+KtJyNobgJj1oPcoa9t2bBdtosEOiE0CJ8/ho2Z4
         bB80RwtoX/0EHslzex85KAm6M3dc/NfOrN1LTtLjgq272MkuG1fquJADAjmYxQqSBxqs
         QTjPu//V6JtFa6Qie/aHdgfbxxrubggdUSdp+o86WagDAC+Qfov1MVZjj+K/mQbsewtY
         S5/8gNwj6q2L0Gis+zPCPNskGZpm89Q/qkskM1CcgRAU7YD4PDAagCNfWrvPFQotI/Bf
         PAQw==
X-Gm-Message-State: AOJu0YxL2Sd1J49DKo7m/BZxrWt0q5f5ee8LfITzdeW+pcCjcc9bmw1j
	oi08a7d58f+ZPKk13Amzwk21tWZC7IvnQyVLpLixrdrY5+XOZg+ddygjynE/qg==
X-Gm-Gg: ASbGnctmjUnh4xC+7RtUCmSPCLClRO4IE3S1OIeIvtq9LzrcnHDMr1Ok5LTAnt98IyE
	bo1NhT7AxM8Y6+WJrgnKGhpsnbhNeZK1A2gWt9hlCbvyPIwkKwHE98htCuO6FXPdsdKKOWLeioH
	l5Tq2QQgsXQ8/Su8wqcyvSfDPkiF+KDyyy8yUPpLAtIkEVtp+duXHL7cRuhNAwfCBp9IcMvZSzv
	dCz3afog1kZeY/AlQt3haBWmd+vJsqfxLjhwR1bWE64LNDLCoAlr2Rvx6hq+SVfQp99pcHGwuq1
	w28+miWQpA5fMybk4+3pJUBtH+XVvKESbEftizx6vwTs7CPQWdDYo+D6Fo6bWNuqy5p/gIkWcQJ
	uKGDlsCSMHdSlGaGnqRvAYOHXNmOnuGk5zEMs
X-Google-Smtp-Source: AGHT+IHQTqH8s9Nx5x6BNxhk9D5wki9EK8zVdMoRuE+eDnCoX5fZGhyRl5gsezockGzTj5HF4sjtWw==
X-Received: by 2002:a17:907:72ca:b0:ad2:3d34:e2a4 with SMTP id a640c23a62f3a-ad23d350ffbmr693850366b.30.1747045953235;
        Mon, 12 May 2025 03:32:33 -0700 (PDT)
Message-ID: <99937f20-a6e8-4bd5-afcf-8f57c925eca4@suse.com>
Date: Mon, 12 May 2025 12:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib: Add strcspn function
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Lampis <kevin.lampis@cloud.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <50a2737a-611a-4d83-aee6-de23619b0b6b@citrix.com>
 <20250507144515.1704100-1-kevin.lampis@cloud.com>
 <1aefa7da-7f90-4163-b9bb-78b9f98099bd@citrix.com>
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
In-Reply-To: <1aefa7da-7f90-4163-b9bb-78b9f98099bd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.05.2025 11:43, Andrew Cooper wrote:
> On 07/05/2025 3:45 pm, Kevin Lampis wrote:
>> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>>
>> This will be used by future patches.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Like for the sha256 change - isn't this introducing a new Misra violation
until a caller appears? Or are we deeming this okay here (unlike in the
sha256 case) because the CU will only be included in the final image if a
caller actually exists?

Jan

