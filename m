Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F58859EE
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 14:27:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696407.1087314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnIR5-0003Ul-Cf; Thu, 21 Mar 2024 13:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696407.1087314; Thu, 21 Mar 2024 13:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnIR5-0003T4-9B; Thu, 21 Mar 2024 13:26:23 +0000
Received: by outflank-mailman (input) for mailman id 696407;
 Thu, 21 Mar 2024 13:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnIR3-0003Sy-Qv
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 13:26:21 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ae92bb1-e786-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 14:26:20 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso1143736a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 06:26:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o13-20020aa7c50d000000b0056bda04d745sm22216edq.80.2024.03.21.06.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 06:26:20 -0700 (PDT)
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
X-Inumbo-ID: 9ae92bb1-e786-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711027580; x=1711632380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CVxPSMKD1lzwM7YafK4bG3T2U66+9r+T9THOgldtMxs=;
        b=V6swaD7s+aUvjnHMEaTOy3LPSQ8bCgPum0Rnc1t5OaxmKsWCAIAMGCrl6erHE/4ltH
         JYi/WariTCjs0wJWvNkO8DLv0b8eijbdP2v6cxj6mibkJwI6hIJ6B4hlWAW/yYcp8XWw
         GzLMMH8rDwBQjGHVmTUi1tz1xpeZqRqxs9G1sLEyCZC9LC7KAMWRbrWbp1eLyQclbeDh
         Xco5GigyFX1UDmXPLqoH6L6eIPSPheo/tPCc049bt8LoccDM1uEjzuh3mQtOd7226UOD
         +H3ZueiXrNKXKqPP8PEDjpioyRR0eHPl7raU8YhSvMdrT3h5snRbQ4dNClm8On68Cg5v
         RsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711027580; x=1711632380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVxPSMKD1lzwM7YafK4bG3T2U66+9r+T9THOgldtMxs=;
        b=fR8Y5kwlb6xxtmqpmKIvjxurLDGhdzPE3nROoAo7/uS6Ez9SBDwk+zxqk8QrNlScF3
         6otX534lIfaIG/Ix4b/RDtbElCbNKhwbIAuwkjgl45yhfxXgCOBNRYjqBPu9IrwE6/FB
         d7LHP2Nv13F/7OlSAXcHMgB7w1SXdN5Whw4vjWLGj3gPXHMhX3GSdT7KaiByi9DetGC8
         TMCv7meuJX1pPXLazqzqGNurPwVfr0NpwE0fn8lCPEs/lv+FpoOYCjbGlbTqcBtjV9XO
         ETeuTb3SSkYBhrrulqU54H+cjIDX1uBDQdsiwBeWN81bS1ymSEgF7hDm/9JPfxJ7P38c
         hqJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZStaxqW1GYIEuBYZfxAJkGxbBWAOMUhVs2AhubNqOryQ7epkCoF6aUb3/py7SHYE1Loj5VaAVLfZgsgoJ/8Ost2ONdEa1RwFH7IWocGw=
X-Gm-Message-State: AOJu0YzwqupPzTciv/s8kYTBSgKkxUPH68G6qttaknhqbOfggAlHcjlT
	/swWV9RJ/URHJr5IITLep0mZzbViBUv/PpX6PQDt1N8SJ8qWq19za11v1cbw4A==
X-Google-Smtp-Source: AGHT+IHxy63jL0YXYB4fZTl0dsOn61VZZRDPqaMAd0usyojLOIihv3aUU6+3J9sM6kjh4WBSLL6unw==
X-Received: by 2002:a50:9e0a:0:b0:56b:cd66:52d2 with SMTP id z10-20020a509e0a000000b0056bcd6652d2mr1235925ede.23.1711027580218;
        Thu, 21 Mar 2024 06:26:20 -0700 (PDT)
Message-ID: <026c4245-5a8c-4e09-9026-44b8f3daca67@suse.com>
Date: Thu, 21 Mar 2024 14:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/20] xen/riscv: add minimal stuff to processor.h to
 build full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <c05291c698d37ac0d6d31602fe35b2accf2d518c.1710517542.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c05291c698d37ac0d6d31602fe35b2accf2d518c.1710517542.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 19:06, Oleksii Kurochko wrote:
> The cpu_relax() function, introduced in this commit, is anticipated to
> support _zihintpause by the CPU.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Looks like this can go in ahead of the other 14 patches?

Jan

