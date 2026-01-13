Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E93D17A4E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 10:33:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201308.1516967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfall-00066n-CO; Tue, 13 Jan 2026 09:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201308.1516967; Tue, 13 Jan 2026 09:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfall-00064P-9N; Tue, 13 Jan 2026 09:32:57 +0000
Received: by outflank-mailman (input) for mailman id 1201308;
 Tue, 13 Jan 2026 09:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfalk-00064J-7D
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 09:32:56 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d61dc032-f062-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 10:32:54 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so69873765e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 01:32:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ed9b3aa99sm12825095e9.0.2026.01.13.01.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 01:32:53 -0800 (PST)
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
X-Inumbo-ID: d61dc032-f062-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768296773; x=1768901573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xe98Dtl2+pp2XcPfTk3G1Xuv4ZAGxJ7JxTbli3Z1kWY=;
        b=XjkFKego4KFEEnlb4pf6rSk/RtmpA+Kt1OhrDH7KRHiLHXkoBEY9kzXOE1aMzj2acQ
         CenThXUGpUepa+tTfjopuSYiSLgnebWJLIph7LCMbnu1jymfIaOoR0r9YZUf90c7yIbJ
         l0HCVGQ9X9/r+Fam1m94h1bYnBNpbcXKv1V8eWkQbAid8b3cxdwD9sBPANzY6ClNrf++
         hUWAsGFtLNEXnuBzeVAKEgXIwcwPPKaA9aM4UpyAtbm/OsJRWcxrL397Z28gg+zVzRwo
         jZ9YCG3Gi7A1XcMjoYod9PRd/XWm0YpHF8oVcr6Kc+ngs9Hn7OCA59bJpW+h7raXd5iJ
         Q6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296773; x=1768901573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe98Dtl2+pp2XcPfTk3G1Xuv4ZAGxJ7JxTbli3Z1kWY=;
        b=ms0exi50+sn59jUrCPTdYpzTZstGSQtJuETOjNiUKFKSIF33lrpt12CF7XpvuSZUU0
         l4sR9cYcYMNbu5L6fvslEI9MxH3f9rtVN9Ldbi6J9PmJZhMNRU5qDl+3eJFZoYpjvxhX
         0GLvBaSJvvGv/mXwq2ybLDOMDe9grdz7P2JyzNCDGEMKL+ssC70JndtiPX1vUJNpWFIK
         PxWlQCPRHF2S6xlbmmxwFyYiGJBIcItCzVn1i+QtBG7AEhVTxIssS2xLA8kX1VGiXhg+
         27SCH3QijiPyvDff5W7uR/cNfBOZfWxTSv5jV1GiB+klfN1I5QJk4LHkofp6xoEndcg+
         L98A==
X-Forwarded-Encrypted: i=1; AJvYcCUyh91eKaVRw0JhxNyerFNNF/9qR5INf0iSMP7EfpJm1L4f34HYMmu9utia0txsjEveeNrtHe9Tfus=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS3h/ypy0ul/kKXJXJ6FnN8CfjmBjr4SHJh6Ll9Ssz8t0/kZo0
	Ir7J+wzozvP3pbUCFA5X5QswiU6LNHEX+zxU+BraNYIOVL03DUgZW659FQ5Y0yAMMQ==
X-Gm-Gg: AY/fxX4caqIyq+oLrFPgC6lb8b32qmm3Uc7+U/doZCbdjtvbJ3MlnAsCmY+82vc5y/N
	kx9no3gBS1wIKkM+d/Oud9FrsJrrDCi8zWNQALwIxwcrNMh+lzrnwTTA+Uh1Rsf9uajbzf9o3LD
	tgPPA4snM87zabuw05MrE1U+iStAVfVJSscM2mSexW+x12EP7mnFHR0U1gr5tlsnyhl750laOjq
	I4nkEOVuzHzGNqzlMsUGnYCyL2I7SVqCG7ImJjV9mYyaWyf3QNC41OIYhiuhMZjos2ua8KkgPbL
	vZgm4RDCXgxJWWchvizU9kwECDIQCT/9upbjvJZ/C4xIUWCf+d0sPDLSWNGRtytjDyBNSAmZKME
	lGMnMZUicc1eDPmxGF1Nx/gmFiL9jwL2qkpNmEVCMM24OSwaj14Ce3LVvp7GjN3N93dQl+qcNQL
	fByeQ44HX7DtwBTj4SA8L2W1vW64lrBIQ4il8roIB6cu6eJPn/r+Xhqq4U7dCUJM4dzlQTYu31j
	7U=
X-Google-Smtp-Source: AGHT+IEjDCtwbElFR8X6BWvyOthu6ddo5vHBMTT4lsxrhBQJ1eLrbuzbfL40NOge6CKMzxpvw2AgNA==
X-Received: by 2002:a05:600c:3114:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-47d84b18954mr206879575e9.2.1768296773329;
        Tue, 13 Jan 2026 01:32:53 -0800 (PST)
Message-ID: <89ee7840-b8a4-4354-8a94-ebe92824bf44@suse.com>
Date: Tue, 13 Jan 2026 10:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
 <76a8969cd7b8bd956605662edcf2ec3c4af3a178.1768293759.git.mykyta_poturai@epam.com>
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
In-Reply-To: <76a8969cd7b8bd956605662edcf2ec3c4af3a178.1768293759.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2026 09:45, Mykyta Poturai wrote:
> --- a/tools/misc/Makefile
> +++ b/tools/misc/Makefile
> @@ -16,7 +16,6 @@ INSTALL_BIN                    += xencov_split
>  INSTALL_BIN += $(INSTALL_BIN-y)
>  
>  # Everything to be installed in regular sbin/
> -INSTALL_SBIN-$(CONFIG_MIGRATE) += xen-hptool
>  INSTALL_SBIN-$(CONFIG_X86)     += xen-hvmcrash
>  INSTALL_SBIN-$(CONFIG_X86)     += xen-hvmctx
>  INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
> @@ -34,6 +33,7 @@ INSTALL_SBIN                   += xenwatchdogd
>  INSTALL_SBIN                   += xen-access
>  INSTALL_SBIN                   += xen-livepatch
>  INSTALL_SBIN                   += xen-diag
> +INSTALL_SBIN                   += xen-hptool
>  INSTALL_SBIN += $(INSTALL_SBIN-y)

As per [1] I think the line should be edited in place.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-01/msg00285.html

