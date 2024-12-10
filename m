Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F599EB116
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 13:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852281.1266119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKzaF-00032d-Jb; Tue, 10 Dec 2024 12:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852281.1266119; Tue, 10 Dec 2024 12:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKzaF-00030P-G7; Tue, 10 Dec 2024 12:43:23 +0000
Received: by outflank-mailman (input) for mailman id 852281;
 Tue, 10 Dec 2024 12:43:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKzaD-00030J-Ll
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 12:43:21 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56398323-b6f4-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 13:43:20 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385dece873cso2633151f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 04:43:20 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386396af76esm8294233f8f.0.2024.12.10.04.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 04:43:20 -0800 (PST)
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
X-Inumbo-ID: 56398323-b6f4-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733834600; x=1734439400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6dmuzEL6vNF13tBP+ZS3JeVgP6/ZgrvBAjRDYPlOpMM=;
        b=cUK3Qmu+hFOkliIL4YC/AV1mPxna9VUbR65UABv8ykFKUs7sh/iIqnzk5iUho9eVla
         VlyZ6JSdj9biqdzx3cxVphjNceLgYG90EEfwsIffebHuzsUpupbeWPwmc46MvsAbpZXv
         EEYrvMrr8PbzEIDgcVkA8nDr8a1rf92BkJTSWJ3AFCUWCChaN+YE6nHZhYMs4/Zsj8JV
         n5TdYrUb+JGuEO319edo6rw2VE0GMoBQdj4qTUpv5wMJik/TQpIKGsqfDYDK0Nrkl/ga
         ooar8DivJ18Lw+xPU/3AK8d9pszY7AoQjwNMifQAAmclSF33jtUtc5pigW/xr8hV7Wpv
         ceJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733834600; x=1734439400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dmuzEL6vNF13tBP+ZS3JeVgP6/ZgrvBAjRDYPlOpMM=;
        b=geEDrTA1slLWu6cjA4dzDC8pALjVrx0PjWlpBC8R6ZigWBv9KU1mMkBP90Yj9j23kG
         qPeVWufU6r+AAKIhfAfe/1cbgBHLFG08fYiOiW4TJGvSSrLRF6QZfdX4j29A8+lbTrLc
         0H2HqLqBL0lul13Vi3W07hvHHIAbn2cwnYLUZPUymWO4pKd+zrlxZP3RaZCUNiSm/OCr
         hVcMN8s2kCYX80bL8058sN4FFQQmuk6Uia9/O7WDuDDt1E81okhIyEEFM2HHsYNLjCeN
         /IMKchnK75p6LZTNPvPt0pyQN9mC+FHtnWnnVUU1rO1sLGc+maQ4RirACtFFMmfb4DmS
         frmA==
X-Forwarded-Encrypted: i=1; AJvYcCUmRQNKLsghoN0nsn6e/tc0ge6kjQG6WfMG7Z+E4ycNG9VzCYUDhC7nEu/J/jBV8Sen0RMwlQhEMIM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKitziGOF63PUX/EHnJX06MfHGHy9JjhkQga+X5Jx5q0aAU6bG
	ns2Hzq1Eg2rQwrM8zv/mMX5erthnu6gl3AkNkWTh/bzXwIagdeOQPVuFv3wyN95ELJrAIi6qkvw
	=
X-Gm-Gg: ASbGnctaGMl30AWYNk0BvlumL9rifN+iY+7jCxxHmFotEH7nAXOn6I9xYknj7lcI5zv
	m3PZp7BeqRF7nIg1GPcceDrVGFNpgTu+uTeBh4VIpD6sb6NYYZnE5TLmLFDNiU++F1X8/HwwyFv
	S3wDO/M7QRX2AEH5dNIR0uHCT1pJcuCldVIGRjVyVVSeNQgyye82XSaaBgIZ/Qfkvovy3QQMmd8
	yVOqLlMrPFWR0OwDOAPouJd1j9prZnpSD8mM0JsfXZTAJVmoMUNSuy4Zi2+ftxmsnHMd8BYrbw5
	zVtCPmXyu2wnispDIIZ4+rKGJmDhfPpc4M4nMjxF8x8hNE3HC0m/tkkneSyibEkWvKeACVvfnyB
	T9DQLWw7xAQ==
X-Google-Smtp-Source: AGHT+IF1zxvBhYF/o/bm6NSeh2b9BA0tIfr4em13GJ6uUgZ21I1gBnhfeJXBkXK33c75KJc+v1EbUw==
X-Received: by 2002:a05:6000:156f:b0:385:fd24:3303 with SMTP id ffacd0b85a97d-3862abdcca4mr10437270f8f.0.1733834600293;
        Tue, 10 Dec 2024 04:43:20 -0800 (PST)
Message-ID: <b8680a05-1605-40ae-a3e6-e013525097cc@suse.com>
Date: Tue, 10 Dec 2024 13:43:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] x86: p2m-pod: address violation of MISRA C Rule
 2.1
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <05b5fd3a85d033adacd5aa08ca81ce579cb1a120.1733827766.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <05b5fd3a85d033adacd5aa08ca81ce579cb1a120.1733827766.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.2024 11:54, Nicola Vetrini wrote:
> Rule 2.1 states: "A project shall not contain unreachable code".
> 
> The placement of the loop after "out_unmap" can be moved earlier
> in order to avoid the unconditional return to be marked as a cause of
> unreachability for the loop, as this is a consequence of
> "__builtin_unreachable" being configured in ECLAIR as being deliberately
> unreachable, and therefore not reported as causing the code after the
> "out_unmap" label to be unreachable.
> 
> Replacing one instance of "goto out_unmap" with the loop avoids
> considering the unconditional return at the end of the function as a cause
> of unreachability, while preserving the semantics of the function.
> 
> No functional change intended.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -1005,7 +1005,14 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>              {
>                  ASSERT_UNREACHABLE();
>                  domain_crash(d);
> -                goto out_unmap;
> +out_unmap:

... the label indented by one or more blanks, as per ./CODING_STYLE.
Happy to adjust while committing.

Jan

