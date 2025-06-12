Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A106AD6AB9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 10:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012530.1390999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdJB-00015D-0B; Thu, 12 Jun 2025 08:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012530.1390999; Thu, 12 Jun 2025 08:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdJA-00012f-TE; Thu, 12 Jun 2025 08:29:12 +0000
Received: by outflank-mailman (input) for mailman id 1012530;
 Thu, 12 Jun 2025 08:29:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPdJ9-00012Z-Cl
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 08:29:11 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dea4b90-4767-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 10:29:06 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so508464f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 01:29:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e6f9947sm8477765ad.165.2025.06.12.01.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 01:29:05 -0700 (PDT)
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
X-Inumbo-ID: 4dea4b90-4767-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749716946; x=1750321746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tfYnUlMdjfkjCy+wffoMiBlnRhmb8dVbSvb5s3dGTwc=;
        b=efNDeojhv+Nf9eS35HFjJQEROtyrJtI/MeYmXVLRv6UmygCLotgNF1DsixRJrhff4v
         0DY7Uaf5FVK1wRb5nJ+b80Uw6WXiNgSEGyn7gCI1Vt7WJIkxeSBtSJ08ZJEnUpupBi2Q
         ib6BqX01yXHk5Rfe4796R2nFbyCI2FNElpg/m8wHFofZ+LdlusqIOYp9wnwCapKCIWXl
         hBVtbqK9FGe0Scxv/GR5Gw3QC5ZlZbq9oCfvj/28CEljtEVCOrRCE1RSdjYDYthyfcuN
         ub+3F0Tt96dKfuATjHui+55rk4mkKaxxvPXwPHtGYGz4Ywjl1lyEq82wvOlnPdOyqhop
         JwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749716946; x=1750321746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfYnUlMdjfkjCy+wffoMiBlnRhmb8dVbSvb5s3dGTwc=;
        b=MqXnorhmZY+RInP/++9RSO/pLnDx61AT143dKD0+wsYZiihvOIIgO5x9B/a51ysIXW
         UTlhGjzCJEovevbmEph+11WbcvnsZ2qBKYIIsfqRqxqry1V0AVU23jSZMjH/aJVq0geY
         w67S/NfPLJcYkPEphcPQIl/tYaT0ixSIfOEFSwV9j1vSTWsKJIl7zjScaU98Cp1D9uCu
         Bi/dDntMZw9vBDtMysyYeE+80ptFhPCj913rVNx+38/2v0A8fOxcYUD3zn/C4IEmSwEi
         DosCH3B+Cxp0/H5wnZG8A5I9jtQbbvS3z9RcugYXAi/N1yXW7h9b6xaxhqFpiKQGZWLM
         lpzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDJ7tDhDtZwIR8puZHuCSZy0TKwF8PPGC4j6kHziY9C2xk1xhUBjZpZ+MN2Y3iruy9YSQuOxyWrD4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEL6HRrnSFJSD1tbI2+kW0waRDXjOiNThWGh63rcAHbnKNOudu
	Flr3xRdHyDG7g4oprD/Td5Afs7dOmuW4JRo/J7Y13R4vF2Zv4XoD9srV+fQSBVUwYQ==
X-Gm-Gg: ASbGncsuX1+uFsrX+xoUyv8bSu9y5jIhZ0OwzxD2FXvxdkHqTv3lwpKPL9ariG2fy4+
	1mkBmQJGF2uZctV/K6Sla+2Q6hj4h+AlBvEjHz6Hf68VMSD+taLf7OGCzvsqRuTw6KXbrvjF4gj
	u8rD9o23o9lh43PhzMKtBq8viabubrLg9iYrwzB95Hb9Z8AFLuEW11e2wv47Xx3qeQrcu8geOoJ
	Fe7HHD8XE3oj8T6oQnYvEQsruEisYR9BpJVXNmb0eXddOnGmPAuJx3ut811gjkf40LKNd+Ta+YE
	j2F3YeoxY5UONpQehYGe4Df48Hc3VYCS0dyaWwtUTdxj1OVPgZY+KfB/YV1GE31VN5xPhgOXLVf
	M7R5CAH49/R8vjRKpUr+Gu91KG41PtsmHKieYUyQAUsuAmaI=
X-Google-Smtp-Source: AGHT+IENprURkM4AtEC+0GB35h7UXDu9b2J8WguGdmFd3MmgFbgTXqHqsciMUCh3imOXuHrDb4p/kA==
X-Received: by 2002:a05:6000:2893:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3a5612f1629mr1390844f8f.3.1749716945844;
        Thu, 12 Jun 2025 01:29:05 -0700 (PDT)
Message-ID: <d145be23-c55e-4565-91ee-f77c93399aae@suse.com>
Date: Thu, 12 Jun 2025 10:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] kconfig: turn PDX compression into a choice
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-4-roger.pau@citrix.com>
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
In-Reply-To: <20250611171636.5674-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2025 19:16, Roger Pau Monne wrote:
> Rename the current CONFIG_PDX_COMPRESSION to CONFIG_PDX_MASK_COMPRESSION,
> and make it part of the PDX compression choice block, in preparation for
> adding further PDX compression algorithms.
> 
> No functional change intended as the PDX compression defaults should still
> be the same for all architectures, however the choice block cannot be
> protected under EXPERT and still have a default choice being
> unconditionally selected.  As a result, the new "PDX (Page inDeX)
> compression" item will be unconditionally visible in Kconfig.
> 
> As part of this preparation work to introduce new PDX compressions, adjust
> some of the comments on pdx.h to note they apply to a specific PDX
> compression.  Also shuffle function prototypes and dummy implementations
> around to make it easier to introduce a new PDX compression.  Note all
> PDX compression implementations are expected to provide a
> pdx_is_region_compressible() that takes the same set of arguments.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


