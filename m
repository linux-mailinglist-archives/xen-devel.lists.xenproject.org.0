Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9009152C8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 17:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746803.1154000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlrL-0006yz-DR; Mon, 24 Jun 2024 15:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746803.1154000; Mon, 24 Jun 2024 15:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlrL-0006wd-A9; Mon, 24 Jun 2024 15:43:59 +0000
Received: by outflank-mailman (input) for mailman id 746803;
 Mon, 24 Jun 2024 15:43:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLlrK-0006wX-72
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 15:43:58 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91802fa0-3240-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 17:43:57 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso47160771fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 08:43:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c7e5af9c39sm8905171a91.46.2024.06.24.08.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 08:43:56 -0700 (PDT)
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
X-Inumbo-ID: 91802fa0-3240-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719243837; x=1719848637; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bgtUIcVOmWAp4BEWPRDX6M5PJcfYk1EUDCwGSqtvNPc=;
        b=cCI3p4TnrSS9CnsOo3lS0/aunAuzMWhwW5wLKSnEyFxuoEO3D7O4Yxige0v4dy8WWp
         M2X/vGjFGwB1BhYKKmoN8hGfkqDYcd2bwjRvBju+9mStihZA9f0Y3tXYeXMmL+dDdPud
         MUEBvK4EqueCu/ECZZwnk0E2rE3JeOkceb6K3AOy+DZ7i/rBZofskp5R6Ci1c/VnKVHQ
         dA3rSTh231yx7SiN3wG1d1EKVO2Rz4jWoCN2TXCFms2l5EMoqTeGr313nsHhwjMVHLUN
         dvyqn3LyimuYWcP4Z82WN3Vds4DbcAj+tDZy20+nVbif7yCOH5kW10Sw1kIzN3P8E/QI
         89Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243837; x=1719848637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgtUIcVOmWAp4BEWPRDX6M5PJcfYk1EUDCwGSqtvNPc=;
        b=kAbq1Mgki5UselD3TwJBT5MMR07z+OnyrB8tVnliykd93wyymJVEJxIz2Mg0nDMAfE
         9hyN3rpVM2/7dm/JQzL4LKiP8VuNK32g0QlIetiNKWsl0rldfUGvlxohfM7aqJFanwA9
         /hEBDMHcnG8cGAPC1KcjvUqS0PTl8N407lpVkxccgqRvwgl0Ra5UjCSqeZt+9HghNcIE
         rJweTRKtPb90bZ13Z/81Gj589zET2nwyB9NXwQTq2s4J6q90GKBMyaI/w5OHrJdJl4kz
         1u+7TUTlmyDN4EEZJl95I1nYjyTccgX4CGLTaF88qKoANAa5zCtxjscgNC6p+Xas04Gm
         qNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT0hPXaCLZivC9GZgEwGiLVgsoV+oXw/bAfYVKDUR2TSad8H4Yr217i7Hb1aaoF4GPbYhYGRAqBBvdfTwADW2VqKQBKg5Dy+pYrrUlRX4=
X-Gm-Message-State: AOJu0YzMvZR8rJx25Rnhu1zjZsWLddl98StTs+e314Vy6dH3XkD1/aBN
	O/JF24BEeSHQvY0Z0P7K7r20YyNLiKRLCw4dFPgZrB/wG45QtS7oMHeuXSEHPw==
X-Google-Smtp-Source: AGHT+IFFiM1tR3ggP2KAu5YvcGyFojTakyTzVUhXLOgeFi9I/17wie9NuKybi+dzotKNpz28sUmJKg==
X-Received: by 2002:a2e:87ca:0:b0:2eb:552a:f6d0 with SMTP id 38308e7fff4ca-2ec5b30a29bmr32085841fa.52.1719243836596;
        Mon, 24 Jun 2024 08:43:56 -0700 (PDT)
Message-ID: <97889584-4bf3-4cd1-9fd5-92b673b39d77@suse.com>
Date: Mon, 24 Jun 2024 17:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 11/13] x86/pmtimer: address a violation of MISRA C
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <fea205262d4f7b337b804a013d0f1c411a721b46.1719218291.git.federico.serafini@bugseng.com>
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
In-Reply-To: <fea205262d4f7b337b804a013d0f1c411a721b46.1719218291.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 11:04, Federico Serafini wrote:
> Add missing break statement to address a violation of MISRA C Rule 16.3
> ("An unconditional `break' statement shall terminate every
> switch-clause").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'm curious though on what basis you decided to split this off of
patch 7, ...

> ---
>  xen/arch/x86/hvm/pmtimer.c | 1 +
>  1 file changed, 1 insertion(+)

... touching various other files under xen/arch/x86/hvm/.

Jan

