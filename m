Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F486FDD2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 10:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688242.1072224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4mo-0007PO-Mk; Mon, 04 Mar 2024 09:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688242.1072224; Mon, 04 Mar 2024 09:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4mo-0007Ni-JT; Mon, 04 Mar 2024 09:39:06 +0000
Received: by outflank-mailman (input) for mailman id 688242;
 Mon, 04 Mar 2024 09:39:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh4mo-0007Nb-0B
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 09:39:06 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09a4b81d-da0b-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 10:39:03 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so750319866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 01:39:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gq13-20020a170906e24d00b00a45621ded4bsm565362ejb.146.2024.03.04.01.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 01:39:03 -0800 (PST)
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
X-Inumbo-ID: 09a4b81d-da0b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709545143; x=1710149943; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BYefA596srdPM8s5itzd8N/YwFI3FPSMmRtIyZ5Bl9w=;
        b=Ac7FNUTw/7//3xHqOO78H7d4WeJ47lFNU0jbNpRQ5+lVM5WV3yjoPuGI8UzUB6/G8M
         qrB7p1mdakdXEhB/Y83ckOjskh6oZM05AcbAEg/hdIG/3sRTkYrsz5z3OvW0kVsls7CE
         ATDnU9yPxNVIaXaF3emOInJowBcRIciib523VabCT14hxaIFmVyiv9jXf/c/PQhY/QDk
         HrXbqxxJUQ8Xge/qJ4cucLlv+ExeVaJkSecMUFjZojIl2z5RjKbCNrDhzpd3VsoagX21
         kZi+sLL7wH/SXWyPR63EcopSXJS9V6Lm9R/vWYTiO/KLJTMobu0R4dqfGETX6AaSNThX
         Sp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709545143; x=1710149943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYefA596srdPM8s5itzd8N/YwFI3FPSMmRtIyZ5Bl9w=;
        b=b5hcXPz2IJnjsDYBqacOs/EW5pJnRpR7K/+lqqMHj3EwdU6TSB6wysQuNxpQMleakA
         fO2K/ZfVJc7Onajxw8J/ZUB+TgfIk4XS/0Yl9MjpvQBOsf57XLUnXqcxuH7pu44L2K10
         jW83xJBlnGmfSB3xtyxMw6hpxb4Fgzm+u/Gw3HNNUQW3xwGdFbdF2WFWftTJTt4yi9Cg
         2cxehsRd8Og65mCJhT+GYEc2VFlv1zDY0mHQ355XXrqf99nE3aOFaEisVRtd3Z9/dI9o
         DwYDgbaZ7L8Arj/cUPqQogWObpAnXj6TiyhI3QWEjJbZW3rU/OyXxtg23WYgPNxbAljR
         tmew==
X-Forwarded-Encrypted: i=1; AJvYcCUlaikwGoAnxg22+J7z8BPUNK5cRQAG5G1/NpmNwI2UeaFuUPG4+1W/e5ewqzzVUqPeIvB0b6ftQRkMD7pXWye7fFe8kmIcqabUiG9XRAY=
X-Gm-Message-State: AOJu0Yx2LBf4BiMJIAK3uEIz9mhdOWIjNkHioZm8TwGxr+gPNfyNv6yh
	QN74Sb1tj/6ojUIyJ3gy5E8+G4VrxIU9B3f0bBo+gZUZDMSMCnCD0LF5qcrN2w==
X-Google-Smtp-Source: AGHT+IE+FP3KXfK9AwYeTUsq3uLVEidZc1AjJq+YVerYjwe5ZHJnSnmQDEFejGL9qpcONRE9BCydAg==
X-Received: by 2002:a17:906:af42:b0:a44:4c8e:f167 with SMTP id ly2-20020a170906af4200b00a444c8ef167mr4856378ejb.69.1709545143246;
        Mon, 04 Mar 2024 01:39:03 -0800 (PST)
Message-ID: <c84513ac-d3bd-403a-9bb7-a96d2a29aaa1@suse.com>
Date: Mon, 4 Mar 2024 10:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 08/10] xen/errno: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <92dbcd9e5aa2ab45c50f3f567ddece59108568ad.1709219010.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <92dbcd9e5aa2ab45c50f3f567ddece59108568ad.1709219010.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 16:28, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



