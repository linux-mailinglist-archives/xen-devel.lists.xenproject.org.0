Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA639A9179D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 11:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957267.1350424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5LQv-0004BR-9I; Thu, 17 Apr 2025 09:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957267.1350424; Thu, 17 Apr 2025 09:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5LQv-00049z-6a; Thu, 17 Apr 2025 09:21:21 +0000
Received: by outflank-mailman (input) for mailman id 957267;
 Thu, 17 Apr 2025 09:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5LQt-00048U-1N
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 09:21:19 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51705c90-1b6d-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 11:21:18 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so1133147f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 02:21:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd21c4e51sm12240931b3a.55.2025.04.17.02.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 02:21:17 -0700 (PDT)
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
X-Inumbo-ID: 51705c90-1b6d-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744881677; x=1745486477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J7HHmfJ05alZnkLyjBX4nn87YBocuUGqZLpMrT9P06k=;
        b=Zz0kTcCxCXcH5nLTcFyyBMvIuBYkZGGumdxBfcRy+pof0rfDeJ/zN0knDjUtmYOdxl
         e6GDQrOmJtCG7eYA+QtK2YmTxiCc4Dlr4lOpydSrcR5tjh7wPCxZD3GB8kJyZkpJ1/vi
         gvnq5FhRNP7oGqBBW7dztufOrBa2SkarHV8TkZKAB4oe/4sdxmpo5p+ccRna2NbxUE7u
         POfK4gHrtbDSdR72y68Q34UtkCdLQuPrlbYB9iT8AC5mFZbUeuuiyWcKxTE3apDUci58
         1/VT/qeWgTM9Acf2FR9BXNHJhVpiJF/VIrAk19DWdPOZK5egseFF/uulr0EQFzBRjRej
         WEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881677; x=1745486477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7HHmfJ05alZnkLyjBX4nn87YBocuUGqZLpMrT9P06k=;
        b=h65Vk8njz+BZwwTFnyPeaGvZJzMotxTwaIg9KS4e2gFRhTgJtNdrbr3lE1d8niCS+o
         0Xly4WzERCk1gpkxxVny3T1ZwpWG/VwbMMSBgvEi7d5Gu6IoYJWHK8cNNRKT9tVGnglK
         0pxP0FogvGE9P24IdkuSXttzFpy5jDLfTe4JPX+R0bH2tlibx0pX6CIYLiiH1qHQ1vvC
         K8+XkRoHQOlqH8kWGZgZdIVbymhT+GheqasH6NGrNuj6rjx9eDD/fA509wXWgm0UmC1o
         9Qs+zRmUZUbP8RA6teVBeqnb9gDvT4nb0+jYpsemWEGhvjhCJFmpFEZm4Fl0DLelkcn3
         rF0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVI6eXwFDrWDuLscUk76qzjxm1HmibfaaRxQYysXDtYTwA6kkulsCuAvZmQX9ELDYeV2YNm6ohwPOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxK+aq6BEojuX/fN/FHzFYGcQWcAR18+Z/7PqWhW/WGZ3/rZREM
	ttLp+UR2L9g3yre4WSXF5CWAhQLiHwwXFFnnVJNR3tjWLLc8D6lE6t2BFLL58Q==
X-Gm-Gg: ASbGncuxk48Rol0CVDeIwEG3oy5nP1cISWgA2FGWlKTGPTUw31n/nWChOjf8pC61Pcq
	wUP1DNQ3ifvyFt0LuZzANLxvWKVxFJ5N/NK2H6Ac3Qg66du7+xxP0tlj1X+g/+m6Si/06QnLkFu
	Us255z54USnmcuXpz0oweQYECZYFFicaa2RSf9b81UEVgIlMpncQyCeZ010rmYBjbNkXUKl4cv3
	VRKBl+f3yp9qfCtcd3QVZU97hRmHqoNI64yCphJ5xiJn6yjDx6zjvIKwfMFdXtaX1TFcwS7j4+c
	IXLVqL6oZ2wz2dzkJsqdWX4L1Gb795Nq0ei/tPCl1fEjn/1+mTJeX6z2PwFEFGx9StJbuVLHz/q
	awRyDXVp9VCLzSZluObgPscrqUw==
X-Google-Smtp-Source: AGHT+IExUcmjRW9ys44E0Ow+n7do0QjobneFeIpWfmuvbFUORLBIv7au4O9u0gb8673tOo+T9doPwA==
X-Received: by 2002:a5d:5f52:0:b0:39c:30f7:a599 with SMTP id ffacd0b85a97d-39eea304084mr1621755f8f.18.1744881677588;
        Thu, 17 Apr 2025 02:21:17 -0700 (PDT)
Message-ID: <731804b3-d363-43cc-a146-f92380425c63@suse.com>
Date: Thu, 17 Apr 2025 11:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/percpu: NUMA-position the per-CPU area
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250417085302.2554018-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250417085302.2554018-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 10:53, Andrew Cooper wrote:
> This seems to have been quite an oversite in Xen's NUMA support, albeit it

Nit: oversight?

> probably because NUMA was arch-specific at first.
> 
> Take the opportunity to sort the includes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> For the !NUMA case, cpu_to_node() defaults to 0 rather than NUMA_NO_NODE,
> making memflags nonzero.  I'm not sure how wise this is, but ARM runs seem
> happy with it.

As to Arm: May be worth noting in the commit message that this is unlikely
to have any useful effect when SEPARATE_XENHEAP=y. I guess our only option
to address that (if any Arm32 NUMA systems exist) would be to use vmap().

Jan

