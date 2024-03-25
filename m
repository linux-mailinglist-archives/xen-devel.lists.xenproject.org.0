Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034298897EC
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:23:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697625.1088559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogXx-0005bW-Bx; Mon, 25 Mar 2024 09:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697625.1088559; Mon, 25 Mar 2024 09:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogXx-0005Zq-8I; Mon, 25 Mar 2024 09:23:13 +0000
Received: by outflank-mailman (input) for mailman id 697625;
 Mon, 25 Mar 2024 09:23:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rogXw-0005Zk-R1
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 09:23:12 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c465cdb-ea89-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 10:23:10 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso5554479a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 02:23:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090639c200b00a471cbc4ddbsm2852188eje.26.2024.03.25.02.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 02:23:10 -0700 (PDT)
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
X-Inumbo-ID: 4c465cdb-ea89-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711358590; x=1711963390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GAfcqGCRxepAg7AVdXv8r0pD9kLR3bV2QzuVMdtPw64=;
        b=K+Zz0/5B8DhHHSLAo8Qsb1ERQBu+teJ6y0FHd4vA9Yu/sb5iRHLWDHPyEVYPZl4phd
         lPg1K8kMUO+NDkP6okgEcOHcKKTEO4+vwgfKtPzp/UkmryXkp66mOsVZy7hEp/6TcImx
         SCZgwEJ4+nniKwCXyaCO7POjg0SRM1yBlypHWDmgYxblp26bCoTErfYgqyEhyqD+725a
         ECtF1N6QZPrbSKZMjaswNJVPa7L+h42ruCUjht4uKHaweUPqjnq+8orZRBHoAVf1+TIc
         8MlIzrVDSn9zc3u6uHXNcxYmvXJ5BvSRQykZY7KL5NzabRaWLdMF1wqlOlmSCkgtFZgJ
         Zqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711358590; x=1711963390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GAfcqGCRxepAg7AVdXv8r0pD9kLR3bV2QzuVMdtPw64=;
        b=E3wSGQrEx1M0u8HDQ7AdTwDh04jiWecvsGAZT+c138aRQIn0RMvCmyKfweAhD7FHHN
         WV/t01fRDtew8MW4ODIgygGMNE3WlRFkyCnPUe3ZvlQ8jKq304ZIxs1KKPjlvxV/CvQO
         3UkSWfq0oBmaStk2NdXJg4iMhejPuB5eEVowutjBe8+ob34UOTEaGCN+GJY/ifhqeWFv
         rSnmVSYudGojpDOmlq0nJJCh30KtTqWpe2f0N7O0NIdZTOL67dtWkMa6Upo7qwBiY87t
         hnEp6E/BAaN+0X7ehSQo10J3PwfxmsSxplSfTVd8jsfRlolrkYWEKdXvtoDXd2V4p20z
         DAgw==
X-Forwarded-Encrypted: i=1; AJvYcCWDW/cfU8W8BnIevv20OdnDjIhgyfPex5eawyb7q4an28Pf/JoUfNzF0P1jSmxseOEQ/XJzlMuwGWqEYs/cid66OCP7ShLqCxZ9Co80XmU=
X-Gm-Message-State: AOJu0YxmldJBaYVrmvWBKYpjn8BK7WuwY90Ra/vYnrme2fKsN9QMQT70
	SsYh0bcFHPAppmATibBfZqhEMTgu5cjSziQWWROpXf4e7X+b9y93a4efSI+3+Q==
X-Google-Smtp-Source: AGHT+IHVlE1UYgmkyxYr//Grmdv30ddMt9o/VrIzo6tqQhiGVTUhuK5pi+N5N2KkcCXC2wGFrEHQrQ==
X-Received: by 2002:a17:906:dacd:b0:a4d:2021:32e5 with SMTP id xi13-20020a170906dacd00b00a4d202132e5mr223038ejb.50.1711358590266;
        Mon, 25 Mar 2024 02:23:10 -0700 (PDT)
Message-ID: <80f05150-2c7f-400e-bbea-c48f2ee81d46@suse.com>
Date: Mon, 25 Mar 2024 10:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 05/11] xen: address MISRA C Rule 20.7 violation in
 generated hypercall
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <323c77d56f8dcbd6bf8f60c84aacff162265807e.1711118582.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <323c77d56f8dcbd6bf8f60c84aacff162265807e.1711118582.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 17:01, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



