Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3C1972DBA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 11:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795188.1204384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxFm-0006Uo-OX; Tue, 10 Sep 2024 09:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795188.1204384; Tue, 10 Sep 2024 09:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxFm-0006TH-LN; Tue, 10 Sep 2024 09:33:42 +0000
Received: by outflank-mailman (input) for mailman id 795188;
 Tue, 10 Sep 2024 09:33:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snxFl-0006Sy-U2
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 09:33:41 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c36586ae-6f57-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 11:33:40 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f762de00e5so29675061fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 02:33:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41cd7sm4044889a12.3.2024.09.10.02.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 02:33:39 -0700 (PDT)
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
X-Inumbo-ID: c36586ae-6f57-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725960820; x=1726565620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g9gzYipWlBP14AaMkHifucoivQkekNTHnTvsg3zycTM=;
        b=SDPOH8VN/1HH1XAkTIrh0GtHo6DCqkdchO9XayoAj6+tjQH5/Oh7g2zjP3fp8qBcgT
         yd0HATZa6BfU4SPAGlxZim7cyhcvk6jHjcLhWwZUczKg2t1uYpb6oBia1D+1q+qS/c4Y
         f9kLC5cLt3TjU21iasWp1P0vKR7w6SFY6wYzm1Db+LQzapjdnpCdDDa/93DWVdk/n+Ww
         eJf98cuHNNF+TlD8L2Kp2NQpKYiLHUZb4icWpULrDj4V5mKxC/o3t9dsLjIonIrQkNYe
         3I9eSC5Z7lHhQVwrc+uOUNukSISzr8fyqDJTFlVgrIxBiPinZ3aJ1OvL8uUCrATljxsC
         1LDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725960820; x=1726565620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9gzYipWlBP14AaMkHifucoivQkekNTHnTvsg3zycTM=;
        b=PH2f6WbEmFGF/nw89tX/YBQjbGzArKagwVH+jh9B2jlL5t2RxPbieeK9GIF4v/XMlk
         7leHy6nYCkqYiwJHdguaVhIw69OMarxNC9MAcSTGYatAanV9dt4nu5sH4EFmSUUp0lAE
         2rTBmJAPXEkEC4lsIDmB+s6F6ko+87IyUdbPHxI0HGTvda1fRfL5VYZkF56eyRHaq1RB
         aZGCTuM908Bffo7FRmYS3zcySd4bm6T5fD6lo+ovi5zEmL49cP+Y9o/ul204rs748rKX
         ifhoLWq2VcGyAsJGjggn+RzX57ZLji4en7+rCZ91e/gLp87tt7UwWfE9BrR99p92v0qK
         lJ2w==
X-Forwarded-Encrypted: i=1; AJvYcCXQP8PJC9C4upT+c83za+Lhu0uF89b4qnWpY1mmSIn643OIqO3CGZNIr+pKPmIZFb8ZnAzDbfmQ908=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6Od7iSyLANy6MegnWHStwkAnGxp7TjLHE/SE4/K4GllF2UuVV
	Z3ToRpHa2iofGtFUSlDSTisFt8OUdAqVarDrdejIrXVlXuJItmfwaYlC1r0mjw==
X-Google-Smtp-Source: AGHT+IEZW45kIFef2i5GoQlbOAa5vCKdakPvklDkQXhw0ZiJwwwwqhG2Vf/bu0nJv0/42fR9zCwfwQ==
X-Received: by 2002:a2e:a202:0:b0:2f6:62a1:25fe with SMTP id 38308e7fff4ca-2f751f2b0d4mr81468371fa.23.1725960819599;
        Tue, 10 Sep 2024 02:33:39 -0700 (PDT)
Message-ID: <ecb07303-b9bc-435b-bfa9-7806586e29e5@suse.com>
Date: Tue, 10 Sep 2024 11:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/APIC: address violation of MISRA C Rule 21.2
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <e482f5f5355b1a278195d59a3f74eda81ff97695.1725959398.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <e482f5f5355b1a278195d59a3f74eda81ff97695.1725959398.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 11:13, Alessandro Zucchelli wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> The rule disallows the usage of an identifier reserved by the C standard.
> All identfiers starting with '__' are reserved for any use, so the label
> can be renamed in order to avoid the violation.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



