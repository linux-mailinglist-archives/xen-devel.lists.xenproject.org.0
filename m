Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2904B05829
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 12:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044006.1414066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubdFD-0007sR-DL; Tue, 15 Jul 2025 10:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044006.1414066; Tue, 15 Jul 2025 10:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubdFD-0007r0-AM; Tue, 15 Jul 2025 10:50:43 +0000
Received: by outflank-mailman (input) for mailman id 1044006;
 Tue, 15 Jul 2025 10:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubdFC-0007pL-Kj
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 10:50:42 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c618beb-6169-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 12:50:40 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45619d70c72so13154685e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 03:50:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd5e8fsm11805968b3a.29.2025.07.15.03.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 03:50:39 -0700 (PDT)
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
X-Inumbo-ID: 8c618beb-6169-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752576640; x=1753181440; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yzDbGMPgPbRODIzL7DNiHBqnNLS1RAJpx8Vmgfrztes=;
        b=E8uFDRRJwNbEhF+yHcADq34IfsyK97UlVO+xqiFX2JQCu7jVYhfoun4YlkbWSpkM2Y
         Nif+hEyXDSFhwIcLUgJtQe0NtXiWRjb6/pT36ylCe3QbJ3DOCVhdH6xTAnVaeJ7gzwUd
         JvAJ3Sz6a+HS8JJ9mrsa8k2jpW/GvQ1BYpwdUABJ285KcgTUBCc6hWw5HwptdJXpCkjo
         NPeT3XKaKbkljqqtkE3dtEu9gw2wTnh2prPUNFFqRJspFmwNbgH1qzMRVcUa+i2JQTY3
         fLUC/qIfDoqnQVhIXvFvKcqqCbFP8PNiX8j1ejakVaXknRMmoRjwbDozb67GjNBrz2DC
         sfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752576640; x=1753181440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzDbGMPgPbRODIzL7DNiHBqnNLS1RAJpx8Vmgfrztes=;
        b=vIae6QUplvHe0Kpzm5X+Oc1oQayeaj3/7zovUVlCUQvxn4mkNHMbBRLx9ZNbFwZOqY
         MbF5b846R2SV/bhyCYrTOYl6l70uOVI7fZ2rUJNbWPIhtL2rc0ahu9RBMReJ5rlrkLnU
         fFrVKyUvYqlXXDQBuu14fNgx7KMBOU7ouJmLpB21dTue68kTOGwqo6cQ4aaGKWeW9A2s
         na+3vTjZi1DF6DZm/xox9CfM6H0rDkVcRRsCZT9kLoWmpaLSjU6E5C1b7kWItxqNpwV1
         LBIYmeakcadoFPR3RCQRj5Gaei47wfy7UwnmYa3R5j4+SICek2ZnHK/UrXvxrrohdx5E
         rU7A==
X-Gm-Message-State: AOJu0YxkZXw9Tusj4uogYemPvbOIU0hzL1v7kpZpFcYvANKcr35fUbNj
	iPVszVr7Mwpl3fZojJJRIOMWCStarLkDOVKZ/rXM9AnjidG5UxGuHeBbQHkUuYiH+w==
X-Gm-Gg: ASbGncst9tBAZF446xHr9pxs9DrkzNF6tDhsF8whUbKTxleMgjWj2rwfmC1y8gbJ+1H
	mBiBwrylw1Sb7C8wNODOEOTdyp8eWYdaSDsCEMLTCu31rYU0vK1I89F5BOkwpmV1LjLVgbKVeoT
	zQsDBOMhQn5nv40C++OjGPFEZa/C/ZTrWcqfMXSH78OwA/LTZkMAyIcomWED4oeAE3ztjRm+Ikb
	3eUuVlDGFmIC4tfHnjPufYMbeKMRBBmch3nBx0yFi6txjrXweIJjhNiRJRzUyjEpD+9isaJVXP6
	FgOJiynRUJIYoyxOoBHzCeMFeQsv2s0Ycf3tgi8r3qjyP0NzOrMVzmlhYgkw97CpGb4jfSXiFYr
	7i0qKXk46+pf8ORkr6tjwd6G43yzIDyOie1pWKV6yvfK9tRSiy6DTPNe0xWHqyMgnItOIboT3HN
	DwSJHOXlk=
X-Google-Smtp-Source: AGHT+IFK+hhQD0iqu/6tuFOhv51pHCycb8cbeklwJ4Fezpk1Bbuj1OpZTJIKXKgR3djbTxhsTBbwzw==
X-Received: by 2002:a5d:5d85:0:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3b60953f903mr2077684f8f.24.1752576639839;
        Tue, 15 Jul 2025 03:50:39 -0700 (PDT)
Message-ID: <e47fafa1-e02c-432b-84bc-44c48af66859@suse.com>
Date: Tue, 15 Jul 2025 12:50:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
 <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
 <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
 <bd89ecfe-83b3-471b-8455-83b9974bdaf2@suse.com>
 <d8e714ad-e1a9-4d9d-9a2b-8eb796f21e04@epam.com>
 <a8fe1fc0-8dba-4a58-ba1f-0851dcc21e9d@suse.com>
 <ef86b7e7-1d3b-46fe-9d75-f55077c9f32a@epam.com>
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
In-Reply-To: <ef86b7e7-1d3b-46fe-9d75-f55077c9f32a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2025 12:07, Dmytro Prokopchuk1 wrote:
> ARM only are:
> -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}

This one's probably fine.

> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(parse_gnttab_limit))||macro(name(parse_gnttab_limit)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(update_gnttab_par))||macro(name(update_gnttab_par)))"}

These two look too broad: They're affecting common/grant_table.c only, aren't
they?

> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}

This one also looks overly broad, but it's perhaps unavoidable to be that way.

Jan

