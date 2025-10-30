Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9775DC1FCE5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 12:28:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153537.1483854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQpd-0008V8-8z; Thu, 30 Oct 2025 11:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153537.1483854; Thu, 30 Oct 2025 11:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQpd-0008Sx-5s; Thu, 30 Oct 2025 11:28:41 +0000
Received: by outflank-mailman (input) for mailman id 1153537;
 Thu, 30 Oct 2025 11:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEQpb-0008Sr-Rc
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 11:28:39 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9401c05d-b583-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 12:28:37 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4285169c005so548395f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 04:28:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289998f3sm37975135e9.4.2025.10.30.04.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 04:28:36 -0700 (PDT)
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
X-Inumbo-ID: 9401c05d-b583-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761823717; x=1762428517; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JUsOIBuJMtO3waOWgGDHcQ4oqntfNbAMQQfm2u29Ey0=;
        b=TRRiWa1gY407jtDx4LcgOC3npjkHRsWxTGWMP12cwOHYxB4vqk5yl4LhlLYvT5JRkw
         G9fpe1txxlRFf/NWa27qPP+eU0l8f01Bl4xGwPebDcac65uYe5gJ47TUMQKfscEE7hau
         985ZkmB0f5jALvttpcy4/X/hFaIenqRJqtWRTeBJXfKSGhnglg1XJTbt97afNgplZ8VJ
         4hOaJfq3WjiIcrw5GkpVS3KQPiCXloJyNGeP0qOf4uV2YXfF8vO6qCEAzyWAh8cN63L7
         GLs2V3fl1uPwWZoJRgThcsO+ltHFeEa1Z6M/EEPfGsKJbBuRbgNBf1M7ysg+zzksMx1C
         MhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761823717; x=1762428517;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUsOIBuJMtO3waOWgGDHcQ4oqntfNbAMQQfm2u29Ey0=;
        b=f9DdTGauvjfDekFxM4Ya/Kw1Y+zgJvBGogLzVSu5u30hyNOCrsPMgBsI4/WZjzb5J4
         AL6ojG1c+qJSUqY3Yk0yyhxTbmuATc8+mEKKfDCvBx5758BjeuEp8lCFGLmXNQu9kF9n
         oOdrqzDqUGMKo+kRtucxCJCK1lmRLNzKLxYyrh1d9D55/8ato0ubu91ecp7DQtW5worC
         4i+B/U7hgx7Va/cmuBpEdPYqZN+yZ5XDGyjumQsRycf5UjqeimLJum3ODTzIJtui4985
         O8XqM4PtZnX67QhC9HdV7SaMsCKEbUohdbc7JAV0AaTHKXsPtLppYFbbPS6ffif52qqr
         rGMg==
X-Forwarded-Encrypted: i=1; AJvYcCWHHuw8hFrKr/5Plq3FOEOr64jPwJEc9pbOODVMJfco0HsE6rmNVMA4CVYNm4N67ra7Y17cc2Q2DA8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiJPexzBC4ZOEnio5caKCrPfwf7Nwpu3qTEt+ifACCWV8qa1Xh
	QdClT/Pc4Ivob9XHtpNltjpKjj8CzooykJ9XSHhvPkr6wyXcDWWDr7+2bEL9Luj68g==
X-Gm-Gg: ASbGncvWT/dSBcaMMvJlzAdSbLFa8P2mN4z6HqVAG+QItu+mG98/k1e5+lKf5CNZs1O
	2ru2yw6TyOmtOvVEiUe5Cj+f+weJrvyLAMjkl4VuIYSmlysKMTA6sMgjVuGT00ww+4/BSzp2RvA
	XH0Y0q2aNKmm43tLP3xStdjmGHt+3Fe+MlN1ICXCCmK6/gACKpdcn17SXcsabFUx25i5TMPvqNP
	EwUVdRklBsqfyTIfnOTu/21mOca/qMj62GZeTk+QNBWGR3mpbPJPT93FilKnAOKdBa9xfogpPsa
	gN74MpW8S6fdIhPZY88RdhbvEu9U3IkoFM2j7/Z6cBB0+q8qfoWzKVy7/U9q/xijJ61QA26dDT5
	njPF3jVt7Zg6Fch3vpMyAf+TyaMLxKSH7tRkbAvSqow+wkZWXYgQ3IotuSfpS6g2AzitvtE+kJh
	eQO1aL2zA9k+1elm1AXDXjIbUBTpUT2/oOFY0ak28v1Phc8qTlOl7Hv2YXeJOUzksBjgq36l8=
X-Google-Smtp-Source: AGHT+IG7ElBtN0wmB2+fWeDEZCHRL5H6FgQPJskmXPmxJarNy12JkSHpL/pcnDeI3E9Mf4vV+XbNtA==
X-Received: by 2002:a05:6000:220f:b0:3c7:df1d:3d9 with SMTP id ffacd0b85a97d-429aefb9b7emr5418680f8f.39.1761823717222;
        Thu, 30 Oct 2025 04:28:37 -0700 (PDT)
Message-ID: <91c9b1e1-e0a8-4a68-9b8f-abbf9ca2c406@suse.com>
Date: Thu, 30 Oct 2025 12:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/28] xen/domctl: wrap
 domain_pause_by_systemcontroller() with MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-13-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-13-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> Function domain_pause_by_systemcontroller() is responsible for
> XEN_DOMCTL_pausedomain domctl-op, and shall be wrapped around with
> CONFIG_MGMT_HYPERCALLS. Otherwiae it will become unreachable when
> MGMT_HYPERCALLS=n and hence violating Misra rule 2.1.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
> - provide transient wrapping around XEN_DOMCTL_pausedomain-case
> ---
> v2 -> v3:
> - remove transient wrapping around XEN_DOMCTL_pausedomain-case
> - address "violating Misra rule 2.1" in commit message

Fine with me, but imo this purely mechanical change wants combining with the
similar ones in patches 14 and 16, both touching the same file.

Jan

