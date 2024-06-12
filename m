Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0AA904EE5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 11:14:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739035.1145946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHK3B-0003C7-26; Wed, 12 Jun 2024 09:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739035.1145946; Wed, 12 Jun 2024 09:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHK3A-00039n-Vb; Wed, 12 Jun 2024 09:13:48 +0000
Received: by outflank-mailman (input) for mailman id 739035;
 Wed, 12 Jun 2024 09:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHK3A-00036N-8M
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 09:13:48 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12c3bf47-289c-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 11:13:46 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57ca8e45a1bso632874a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 02:13:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cab4fe431sm719264a12.61.2024.06.12.02.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 02:13:46 -0700 (PDT)
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
X-Inumbo-ID: 12c3bf47-289c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718183626; x=1718788426; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JeHwpJrOKwSwOR/lxPqxf/lKQ8BcNFSutmoLuilAq0I=;
        b=Nl4143ohJDc6LB6661SzyNWfTh6Rm0ZE9wRt1kcwCQugGvWUgLhJsBtRRnB50tMMD2
         ak9X9+Lm9yFpmh5DaDjTgW0MxfLRPmTQwyg1C27j4TKyxLE/8R0kWnEG8NQoXbeR95RY
         MpmWUjLiphG/lgHPtseVNiZDD5vOvYAYvHuihWq856AofHXnxPXqFaJVY0dcG/CovI4C
         suoIHYlmAA4iUvy0b/qzBf0uwgE7f5L2CD5vfxBYBtC6wGtY+5jT3f5khPLT+xHsXwhJ
         EyB9nHpRS2XeaAcKyWBzPIYVvEyt6kGWy/n1j9Jzy5IWXI/E6tw+B4QWGxvKne3tvBIR
         E+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718183626; x=1718788426;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeHwpJrOKwSwOR/lxPqxf/lKQ8BcNFSutmoLuilAq0I=;
        b=r7q+KK4jmWeA3ZS4KczvjsUA5LIpO+X3xl2T2OLvnD+wfY5/oJyLuBwO/NPv971Rlk
         hkRZal+3btjlA13OZJ7LZfyYRPqzBdF0uOUGblyZFKfpZLNe5RXX5uqTKtcMFVJjgKA/
         WWRF1ZSqqhFvJ5XOfR1WgcmjhGOnU5ogejBDKFKtTXlrm3iqg0BkWKBwIMWZeJcfOskl
         ZA8fmOiTeDpdQ8yd6EJg2BzyhybDV8cE70jQohkm94jWYByiQbJsrdvyW3ZWK+ieMouz
         WN/GsQx3DoThceJbAELk8COrNBmcMsNCsudFEg2QBR2avvzrIpr6n2UoFHS7sFTTb8fC
         orqw==
X-Forwarded-Encrypted: i=1; AJvYcCX8xBpXv95hSi1QJcvGxbxdcb4AMOGC640wMf8JcraHs6WQvfo/HiwOio3/R6Adh4JrPrN5b1kSskOEJMKgE2kARh6IIMDXyhV7GVnGwJU=
X-Gm-Message-State: AOJu0Yx4C2cB4E4VOTisOVk0Fa9ehvUlnElUkYzNRc3Tp0Gd27rCe2Tc
	PoCSQPmXJs3hDwhfvt1ueIr0T83ZdVwUIEzlFro55Y/ji7ruY2lhRhHNtMX2Gg==
X-Google-Smtp-Source: AGHT+IHLpflgp4IjhWs5Tlqr/xG++cBBxfZTyQDwrePgzAh128ePS8WSFMQr+mdvuE4amIGOCs8EdQ==
X-Received: by 2002:a50:9f41:0:b0:57c:9dbc:2b6e with SMTP id 4fb4d7f45d1cf-57caaac753dmr929725a12.42.1718183626264;
        Wed, 12 Jun 2024 02:13:46 -0700 (PDT)
Message-ID: <6d392d69-c062-4dd3-a6d6-1ef08b1619f0@suse.com>
Date: Wed, 12 Jun 2024 11:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/6] xen/guest_access: address violations of MISRA
 rule 20.7
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1718117557.git.nicola.vetrini@bugseng.com>
 <2dbc4b40261b91de2148e467ce0fdade5cc89c50.1718117557.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <2dbc4b40261b91de2148e467ce0fdade5cc89c50.1718117557.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2024 17:53, Nicola Vetrini wrote:
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



