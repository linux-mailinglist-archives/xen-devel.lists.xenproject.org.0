Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13FFC1FF45
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 13:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153593.1483895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERYW-0000Hb-FW; Thu, 30 Oct 2025 12:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153593.1483895; Thu, 30 Oct 2025 12:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERYW-0000FS-Cl; Thu, 30 Oct 2025 12:15:04 +0000
Received: by outflank-mailman (input) for mailman id 1153593;
 Thu, 30 Oct 2025 12:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vERYV-0000FM-6G
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 12:15:03 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c939538-b58a-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 13:14:57 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso774147f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 05:14:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5773sm34019004f8f.27.2025.10.30.05.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 05:14:56 -0700 (PDT)
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
X-Inumbo-ID: 0c939538-b58a-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761826496; x=1762431296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KOPmQcZJzkMNEbMCIJ6xHun347MW+SWeXo76h3jWv58=;
        b=A6r3mZVpEr6FL3VIXx7yNXX8UrJXSTPvSHYEwIjGk8852db8G3jnzgHtaHxKoLsm0T
         RaCEVT2LIZq/vNRNE/hEKtNvOnQlJ94rO4sYwLDycx8EZglo2wsFpaMeVVmIp4sWfaSj
         emXRcWvY5Sm0WZciR5hXJUqOzmW5oeZSTQsJYHxpqjp6o2NM+Ke2//9UmHE9Zd30ii2n
         Z+gc848OLyL/aaI9W6qEHJqBkY9Z4EykYYKNe0cUY8Ab/R0hyHb72++rBF5xwn0ccJzW
         JYl2Tfs+WPUUKIs+71o0LF/ntf1bZv+ebjgCTLdhgy8BRWDoH7Z4SNR9nwjQcOXIYbiF
         1UwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761826496; x=1762431296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOPmQcZJzkMNEbMCIJ6xHun347MW+SWeXo76h3jWv58=;
        b=eoVwHUvNaaMgRUWI3waYGbR90ovuVrprgH9Np6uiphEDdJP4ByLlrtb0Bc5aAfF4MF
         f7yMU98g1QcIt6fWSoqlUa1/q1vZnUu4cLW02n1h2mCUpE6xyyybvJaC9Dqj639VYb+x
         OIXm9jndu5RE0F6XPp4MN0MunjI/pJDk8OM94KCVgHpdgVRv1mPwc0N+/btpnI7relOM
         0OGsgyrffdIBS5LFCLxJqfOyjUhPNNnSH4w7mpqyri+Tn0ZMfAHoLQOoFSHK4+8rLCwk
         nNbEemmRIF/plp0DBFhv3qQ9nqxXXVUorjAj+eK6W6n/yXY/aEuermVhyIwO1901iUVT
         POxA==
X-Forwarded-Encrypted: i=1; AJvYcCVF+sZlDx+y4k5DbYHdeaGiCK4e+s96zje43JQS3LpqONDakQYecbIsbU3jNP1cpy9righRWtaDXYg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLilauK0g64nAXg0JoCw1KJ2EBqFj/IHcBqS0uVGzEM5r/OXdB
	PJbgA4HJpZghmzz1Wa8747NHmAxeLm0dyu5MZ/oaPPTgcuCkXxgLYPIENVFqATNrwg==
X-Gm-Gg: ASbGncvIXqdTYj14cubA4JAm1EHyqBE9K3ZxdGCGP57l5ySUUoH6i4MS85U/50xqnOm
	xvoAjWVtjZ/haUGOWTTupuellTgGT56e7urxxVP0IzNZQcuAJg2qtB/kgfmGai5nirjRUKpAAvo
	qmqTkjY1XpBMYczEJDa3msS1HKFNr8w8HQoyBGiOTcF5dKSTNB4pDMnT+SAyetwIhCV6LOENGK2
	lj/TuATuG4LhrDg+t1MCA1TPQdTfSRKM7z6USDVvUa4c+7zTwoSwyWR8D12Fa/sf9nL87LeYtP9
	S3Vj25YaJ3gHrvFJ1ruGk61wIu76Qm0GYSOkD7xb/XN7cMwl6eytZXTOctdNbafeZuYrGgLTAAX
	k55422JnWdXMMkCgQ6VVCZc01faboOF5T3oJT+3BtcUfNdfO86cdkKQxCP8oOaDlQ13lfC15MQv
	0Z8SV+Kdd+cgc+ZnoX3O4JDK7GYhhb5CWEM1MUEiigjPsVh7ZZ4+mQUxzDwePZ1We0IG/lPFQ=
X-Google-Smtp-Source: AGHT+IEar9qLKH60P1kNdT9f2JtTKXPCs9A3ImN/hoRqoCq+NbPxpTqXev/HqB0DOzuvJJBr+yIxRA==
X-Received: by 2002:a5d:5c89:0:b0:427:5ae:eb89 with SMTP id ffacd0b85a97d-429aefafcd4mr4902287f8f.34.1761826496519;
        Thu, 30 Oct 2025 05:14:56 -0700 (PDT)
Message-ID: <5bd47e4e-f255-41de-88c2-d7f11205643b@suse.com>
Date: Thu, 30 Oct 2025 13:14:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/28] xen/domctl: wrap domain_soft_reset() with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-14-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-14-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> Function domain_soft_reset() is responsible for domain soft reset domctl-op,
> and shall be wrapped with CONFIG_MGMT_HYPERCALLS
> Tracking its calling chain, and the following functions shall also be wrapped
> with CONFIG_MGMT_HYPERCALLS:
> - grant_table_warn_active_grants()
> - argo_soft_reset()
> - arch_domain_soft_reset()
> Otherwise they will become unreachable when MGMT_HYPERCALLS=n and hence
> violating Misra rule 2.1.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

This imo wants doing differently, with all the per-arch stubs going away. I've sent
a patch (with you Cc-ed), on top of which all that should remain for this series
would be to add a dependency to the new HAS_SOFT_RESET. Possibly that could then
even be folded into some other patch (doing something similar).

Jan

