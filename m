Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D0187B88D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:24:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692911.1080621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfRd-0002eY-8V; Thu, 14 Mar 2024 07:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692911.1080621; Thu, 14 Mar 2024 07:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfRd-0002cz-5v; Thu, 14 Mar 2024 07:24:05 +0000
Received: by outflank-mailman (input) for mailman id 692911;
 Thu, 14 Mar 2024 07:24:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkfRb-0002ct-Sp
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:24:03 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5317350-e1d3-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 08:24:02 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a4675aaa2e8so15626566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 00:24:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h25-20020a17090634d900b00a4519304f8bsm427417ejb.14.2024.03.14.00.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 00:24:02 -0700 (PDT)
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
X-Inumbo-ID: d5317350-e1d3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710401042; x=1711005842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4sDFUaYnqDqb/TMVYQI7f7jRxysLpxHHjCEPGJ6Lvyg=;
        b=VzOAl6X0nUeRs4dfNldfNoewymfPcM1+mHA4c7r3lNSWsd9vbMOOGGorraNAzJYxng
         NtxreZlEjTQnxlZ78fzfbNuL9RHmsspaZxMVoqpHaJFeb+jLdKaIlb1qiAwI3HNf+mvj
         IJ8MeGmRkADcfFtLYiXbMx1W4v97hdFw6sGvvnMywKzo2IuoD4hqyNDsLf4dS2+ibkaW
         nuQPAuYW27qtxHVbZ8acRnh0F/Wh9Y681CiVBo+3Tbv9iiWdSp9O8fpzyZHXSSowL65D
         M0RKXT/CLbb4rmtMMDs5YEliuLrpkIpMy7uvYrPwqxeSeS6bZOR1lPtHmYKKFt39dRoi
         Hxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710401042; x=1711005842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sDFUaYnqDqb/TMVYQI7f7jRxysLpxHHjCEPGJ6Lvyg=;
        b=aW+pcdfaGeImOCAlNCnW7BdbPnR+K6M5u9dz3KUrZ5wsl8erIzmBn+F4hr5v+lL/Cd
         2T1pig0AMO0tS2D00W76gFzeGhcsLO3JyMrh3kMIjzNpOEDLJwCUBNQm8NLud/JmTh//
         uXUyFTlqBPd2YRuKHv94Uww7w5eCxpCejwbrv2MXnPd1c4BfGf6KrJtyxIIqjSUJrpZc
         UdiTjRKcDQex+9g8eIKO0SKRA1xzBYNMpUbAfbC+HNtBlfcKPOdIIzfQCmhW9t1INPR5
         NWrTIHrqa8v6TOK/BNzDdw2PpX52bomh0XfMwvdyfsubcqWGX3lx7/dFVHuvKcbXjnKO
         Ag0A==
X-Gm-Message-State: AOJu0YyLnjQDKElxXKrVeJuTNp2oFUtPx/Jter1tONqbk5k0i8aQ2+TW
	qkQFCwoTqt6F1Bky33N73j1MJYJX13C4JwW5QITc1XqOXWPk6j00tL2h+BP0KQ==
X-Google-Smtp-Source: AGHT+IE2GSrgo1+8c4+6Fx6+UXTZLKakH6dZIJlaj7SOhEJgh4l4lKhn4uNNtJl/Zgzw/TZa9/oZ+g==
X-Received: by 2002:a17:906:e11:b0:a45:8b6d:9c92 with SMTP id l17-20020a1709060e1100b00a458b6d9c92mr649867eji.31.1710401042262;
        Thu, 14 Mar 2024 00:24:02 -0700 (PDT)
Message-ID: <c6e79962-0537-4ed8-b99f-f2614f5a7987@suse.com>
Date: Thu, 14 Mar 2024 08:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] multiboot2: Add load type header and support for the
 PE binary type
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 grub-devel@gnu.org
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-2-ross.lagerwall@citrix.com>
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
In-Reply-To: <20240313150748.791236-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 16:07, Ross Lagerwall wrote:
> In addition to the existing address and ELF load types, specify a new
> optional PE binary load type. This new type is a useful addition since
> PE binaries can be signed and verified (i.e. used with Secure Boot).

And the consideration to have ELF signable (by whatever extension to
the ELF spec) went nowhere?

Jan

