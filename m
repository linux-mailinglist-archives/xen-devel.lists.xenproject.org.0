Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578793F4AB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 13:56:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766665.1177173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOz3-0005WV-QB; Mon, 29 Jul 2024 11:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766665.1177173; Mon, 29 Jul 2024 11:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOz3-0005TT-NF; Mon, 29 Jul 2024 11:56:09 +0000
Received: by outflank-mailman (input) for mailman id 766665;
 Mon, 29 Jul 2024 11:56:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYOz2-0005TI-1C
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 11:56:08 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 894d534f-4da1-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 13:56:06 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc3447fso5026355a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 04:56:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac6377d724sm5699471a12.40.2024.07.29.04.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 04:56:05 -0700 (PDT)
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
X-Inumbo-ID: 894d534f-4da1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722254165; x=1722858965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V3aerfiNd+Qw4NIW8btZkv5t7sqtJzDuyM7luKLJjjg=;
        b=Br59XFfJcaPxTs9wozgz2IZOBbpxZ1QrSiqTLm7H4rB5gleyhfJiBsmPuLzjJK1hqd
         UN66Jnx4lBVOMoT9nJb8eDh9KLBr1w0GvR4+XfLdBgQD3ftbGIUEAJeDKbyiEgnwqwce
         BdZTeThk4szNlzDPfspJTDaVJW8XQsFi+wAeoKGV6nEblr903nuiFwedFjwAgVVUkd+p
         SOPb++rSpwHLWLGla3xrRHcykgbfnycqtrOCrkyIlQFnZFCrtppudOEecUHZT+trH7jN
         3hhewoPvWq2AwkFTQGHP9yx3uZehlSand4K84rWmA4yUQY/U1t3bBHrLFnKQmTJ2VGmn
         Fpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722254165; x=1722858965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3aerfiNd+Qw4NIW8btZkv5t7sqtJzDuyM7luKLJjjg=;
        b=HyOocZtqdrIcG/dmmzDTUWz2q1rN4h+Uwa3vfDue5gXkAa5Lna3bLYz/B23VJecWOA
         V8lvuG3HknUDDUYOVcSdrzF0DTayLMH8v2cMGRxPB3AeGe4FM2H84GpeeRLU8gdTy/Xm
         CvqWC8A5GuYKfE6ceEPcCrMp7ZWjoDAwRqu/XHJc80ZSgSTsCeICX212rnWljwPa8PUX
         FguoPg1FTfGhTEDPaDmt0SdT3vSPSQfz3Fw81W0aApjzmLZITS7cx+BdwEJBpbTd65B8
         lmhc9lhh/XCKNvLQQcPwviz6P5GQsEMIlLTvq6EGjOrA9gib0SVDpy9sIfhYQ749bEFG
         Qpdw==
X-Forwarded-Encrypted: i=1; AJvYcCUbjYp5/e1nGUmAMnWt2eRjXNNIdTfvEMqzfB4k2kuJROWlPjjBp7YBhNAhDPA5s7+RgDpXLMLVFkyM6B1yCj8xLWi5bFT0JqPYm+VmnUo=
X-Gm-Message-State: AOJu0YwQmXjVIgFt6o88TjcQqF1fIOcFRTFIn30OlW2U3ziK7jtiyyFc
	GIcMGldXBWxAB4r5y1qrFdeJgDwCuFlzkct1zyXZDuxQD4YGeqeL+XT6CudK0g==
X-Google-Smtp-Source: AGHT+IFHr70a3SxG6yXhWoKb74BCy2O7m9AAWgS3a7y4VF1wLy96iB+PI8WUE1EZRjPtNOKCgNZVWA==
X-Received: by 2002:a05:6402:34cd:b0:5a2:8f7d:aff6 with SMTP id 4fb4d7f45d1cf-5b020ba571fmr5892575a12.17.1722254165428;
        Mon, 29 Jul 2024 04:56:05 -0700 (PDT)
Message-ID: <fd95fd5c-844c-4a4b-8242-98293f63faa4@suse.com>
Date: Mon, 29 Jul 2024 13:56:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG.md: Finalize changes in 4.19 release cycle
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <32f773f72abbe114574980a8e99260ba96bd32e8.1722253791.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <32f773f72abbe114574980a8e99260ba96bd32e8.1722253791.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 13:52, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
(for whatever that's worth)


