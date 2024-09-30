Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575B2989B6F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 09:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807072.1218266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAoz-0006Pn-7M; Mon, 30 Sep 2024 07:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807072.1218266; Mon, 30 Sep 2024 07:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAoz-0006Ma-4Y; Mon, 30 Sep 2024 07:27:53 +0000
Received: by outflank-mailman (input) for mailman id 807072;
 Mon, 30 Sep 2024 07:27:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svAox-0006MQ-Mf
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 07:27:51 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fff4d26-7efd-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 09:27:51 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5398e33155fso1526966e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 00:27:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2777214sm478897266b.36.2024.09.30.00.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 00:27:49 -0700 (PDT)
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
X-Inumbo-ID: 7fff4d26-7efd-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727681270; x=1728286070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha3p4L4JyHkoNbxHu5fyjnASeQonBflFUMrPv5EaFJs=;
        b=I4mbjPnz2IgRXkVpHTDV4JoryxEw5bfLQlIYC+lB2GKzCkDogEUCuAsRaSJKTuuwDH
         zihtUdN45llqW5OrVPDBGTX/K+sLfI5cqFxyP2Z1eEvjSaEa45YnVC/s8q7Mcxnh8Ley
         CniZh4O1cI4rIBH0cnXY5Hehw2e16MhrHHniASxbO69Lfvbauyk9n9veIiS5AB8foene
         MeZCCiV2GPZXC4ryP1XnDDFg2IS4l7Barf+on6cMUgOC4pxEBBL3haIiqWohEs69MwNs
         92IcixpVvbNw3OyPCtIKduYwIgWtvsMljLAvLU0Nj7MGQZjIuyM9rAHJht4qqMtnAP5v
         XmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681270; x=1728286070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ha3p4L4JyHkoNbxHu5fyjnASeQonBflFUMrPv5EaFJs=;
        b=Q8waC1px52LmeSy0ZVjj7fgbTHn4qxpa7WIDZsecFwbSy+X3UqI3kl5fMGbZQjt9Tz
         uFEBoLcSzKDQbhQC66DIfBKtJ76Qu044Vlv4ZF6CC047lgYuqlMrfUIXX6z+YGTCp7v6
         oH6vaOdhR8GgPCXh7rsz548MEPVwRB90PDg/l+WFoA/BnAYoKFE1sWrxHSL8ngqTw01p
         CB6/R97XwpVToBa+9SVr/PFx0UDWnmTqabSbW8aikEwzWV2t8buSziBQN5zJXpQCyKoN
         50Ck7yMEGz/9w2/gJ7xfOdTtpuEufODXiHGFruaNC2uhBa09CurC6N/Hirej6d6I0iUr
         rREw==
X-Forwarded-Encrypted: i=1; AJvYcCXyCCt20iWhrC13q5goBv4jHJ0QQyb8baAos3sfXQD0N7W5D/oVMqjn+tgxVQZ/STm4Zc3LxVliaMc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVt2NxjiRCONPJRiWRBGuDK+Ssj3IhHjUetfd+G8olwC7Xlsd3
	iEIgNgRxZ9FU8ErnZBorXgwNqFqthkXAbhtCNC9z9k4pcLejV5gv86y9u+SIVg==
X-Google-Smtp-Source: AGHT+IG1b3ewiIaJyOQweTHoP6v93vrh7/DmtHHhYFY2IsGg4wRSExgqP7lnAjC08PTqKPRJPptZGQ==
X-Received: by 2002:a05:6512:12d2:b0:52f:c148:f5e4 with SMTP id 2adb3069b0e04-5389fc3cb4bmr5630791e87.21.1727681270397;
        Mon, 30 Sep 2024 00:27:50 -0700 (PDT)
Message-ID: <db29de6d-5feb-4972-b60a-012f0dd9a307@suse.com>
Date: Mon, 30 Sep 2024 09:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] device tree mapping
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cover.1727449154.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 18:33, Oleksii Kurochko wrote:
> Current patch series introduces device tree mapping for RISC-V
> and necessary things for that such as:
> - Fixmap mapping
> - pmap
> - Xen page table processing
> 
> ---
> Changes in v8:
>  - The following patch was merged to staging:
>      [PATCH v5 1/7] xen/riscv: use {read,write}{b,w,l,q}_cpu() to define {read,write}_atomic()
>  - All other changes are patch specific so please look at the patch.

Except that afaics none of the patches has any revision log.

Jan

