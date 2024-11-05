Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41E9BD111
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 16:52:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830432.1245428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Lqj-00061h-IX; Tue, 05 Nov 2024 15:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830432.1245428; Tue, 05 Nov 2024 15:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Lqj-0005zF-FH; Tue, 05 Nov 2024 15:52:09 +0000
Received: by outflank-mailman (input) for mailman id 830432;
 Tue, 05 Nov 2024 15:52:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8Lqi-0005z9-AO
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 15:52:08 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7cabe6a-9b8d-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 16:52:05 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d8901cb98so4230908f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 07:52:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116ac7dsm16545978f8f.105.2024.11.05.07.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 07:52:04 -0800 (PST)
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
X-Inumbo-ID: e7cabe6a-9b8d-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmIiLCJoZWxvIjoibWFpbC13cjEteDQyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU3Y2FiZTZhLTliOGQtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODIxOTI1LjYzMzU4Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730821925; x=1731426725; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5V6YiShfAlO5Mtb2kPexMqh/C5PT5wN308rnYqycMs=;
        b=UNgqlb8bqwpzzbNrGWXeVIu8DO4YSXqGA3fanMRLtz7EIgMiJqebguIItt81150iG0
         XheqH4sWR2c5GHh/lNY/JQ+iY+lx1fWbLJLqs0V+6yChWNLOyNoL2e4XDdmZspngkfQl
         1+lrooxlMPs8LB2Gq3dorkCgsVetgpveDjoIIF0oZcRwO1q0fAoAQKVd7VySX0NM+i9p
         eao6b9CI2triKVekRLJ6wnbQhftqhVRfjYseIldJELc8TKFaE6Xvmjd1018wclmxlGNL
         mgpDytkck06nGcV7bwAxFnRAFDXDFcBlN+27YKGIQi2f3CBAbmRuZ6TXsRJb/irSRQDR
         xTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730821925; x=1731426725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5V6YiShfAlO5Mtb2kPexMqh/C5PT5wN308rnYqycMs=;
        b=DPnflDLDq2aqg6XTkkcVhxO4c/e3mcyg4lHoltONH1L+Y7DeHGniNnCfiGL5RXsJPG
         nJ434YsVtOKT8dpBIiK39jrutNXT0h0hKJGX11AFGytHlfI78izsDHwSlg3AEuWfva3+
         16ixEeleIgopvLuwxXwi7HsX8VYur8OfKI1tFgAv1TyEMWX4j0JZiuGNQlpvI5ZH6pOO
         4eZg1xQdSgDMsq3O6s0JGhPj3QTtIEfo002v6dWIMYlQowZOOZL8c5qLZVplvQe4lJLe
         gFoluw+S6GcWk3sirWyx13dlmY8tc56PEl2i15IUv20fcTbGouOIAeuHQAR3SAwXF+JM
         sLpA==
X-Forwarded-Encrypted: i=1; AJvYcCWv4hPrEIWnCXOwyoLNmhrfi1Ki5fkUgVXeO+gRuMIvkC5URtZ0yACzMGnDT8fRMUBXbpIg9AqmNPY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdHBSoNnyQI5avqkn4TVk5cQ9VkJ4De9/SRj5Wt7MJtDCP2Ox3
	oCZexTy4ssLsDkWkZlb3kiyJIYKuAdH2u44XGQge2AoKlH++yCt9rmixAUhIfw==
X-Google-Smtp-Source: AGHT+IFcUuequf/MZ5+Maiyp0x42AEyr2HuWxjJeM8L/oJrA9hFRh00E5KtDNV9t1QImseaqg/Lytw==
X-Received: by 2002:a5d:59af:0:b0:37d:3b31:7a9d with SMTP id ffacd0b85a97d-381c79e3b6amr13261277f8f.23.1730821924897;
        Tue, 05 Nov 2024 07:52:04 -0800 (PST)
Message-ID: <93573119-f83a-4e2e-9e8e-16e3073d766b@suse.com>
Date: Tue, 5 Nov 2024 16:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/13] xen/arm: add support for cache coloring
 configuration via device-tree
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
 <20241025095014.42376-8-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20241025095014.42376-8-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.10.2024 11:50, Carlo Nonato wrote:
> Add the "llc-colors" Device Tree attribute to express DomUs and Dom0less
> color configurations.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # non-Arm



