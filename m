Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C084B602
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 14:10:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676908.1053251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLDW-00050o-BP; Tue, 06 Feb 2024 13:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676908.1053251; Tue, 06 Feb 2024 13:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLDW-0004yn-8Z; Tue, 06 Feb 2024 13:10:26 +0000
Received: by outflank-mailman (input) for mailman id 676908;
 Tue, 06 Feb 2024 13:10:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXLDU-0004yh-Q0
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 13:10:24 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15986c18-c4f1-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 14:10:22 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51117bfd452so9396383e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 05:10:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f3-20020a05621400c300b0068c67e305edsm1009470qvs.49.2024.02.06.05.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 05:10:21 -0800 (PST)
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
X-Inumbo-ID: 15986c18-c4f1-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707225022; x=1707829822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sbu5zSZw+7rAbIx1HfYcvSHGwrUqEhEUfT+cea6T//M=;
        b=U9wzEGdHOLZ6fze3gLyl+BDvF7uSCLzd1XsJgP2+ZwlG0TXIU4ICMqEqPFn/eGW2Qo
         BEFFrbrLkeZTUkG6RZluopVQNuCpgm9IQMoT11Es9vBHVLrkbC2KcqvoPGRT2rgBFVoC
         ETCfQzYdrHbyPP4IMMseZR9jBr7hZDU4H5TksRWKIXLlCer4O9ewL2hal3T0Ky7YrYII
         pHjj5VUE/yk3b6acxSN8NbxJCIi6WmmeEnZ9kVTZB9CgwFm2ngAjdvQUtJiL7dWDrU8P
         PtZ1eAaC6d7n5oYqvb81pBz64bRI1BWpbrcgG/EVJOnpcuYFJcKN72cyhNl/zwK7vsmb
         dedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707225022; x=1707829822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sbu5zSZw+7rAbIx1HfYcvSHGwrUqEhEUfT+cea6T//M=;
        b=Dkm0bj/fWlPzVxuTs5G/9cXldXqzy/BjezKOu7sCoYzYLYMHveWO4cLyOrfP0XzzDI
         QibJaKJGjVhL+AMY5c5z3bPOoem4SNECgNwOP+FyXgXNUnbgHc+oziIOqkXluazQH78S
         I/iMwoqwyQSouYauAl1gueC4aN9l39NUPe83I8K/b443TGBTF6IElaWMMz4vxEPA0DkW
         ibogpMBuPIqcinE2Qd6UjqKrYu4N7vIfuVLEAewVuKSmQmfGbhfdBrVNFnFMv7KqVI7x
         ZvCnA8p3xW+7MiCg79cwGOVaLEfRPD3w6LPiSJ76ATCbLb17AWkecfW5HEXjW4Urm35o
         e/nA==
X-Gm-Message-State: AOJu0YyuZmpVtpCNgQvVivQ86lbwTSNlR1ud2+gclYywZYDS8+qrhQX8
	7qhZSyLqZwl3P47U5xw1Uo6ZCzd1P9CWzaLptwjajetpCFlaFncBayAjtW9Z9Q==
X-Google-Smtp-Source: AGHT+IGX/rwwY+EG7JQeSwLT2bTjHMAizpUmw51UJ/nnZSwfFjzjLodVx/JYFa/z7KFd1wzmaBV5WQ==
X-Received: by 2002:ac2:5a1a:0:b0:511:4307:f6a4 with SMTP id q26-20020ac25a1a000000b005114307f6a4mr1604777lfn.60.1707225021965;
        Tue, 06 Feb 2024 05:10:21 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUXkiX9vw/MX7PahvaCwNgEqnVwwfSLBtzhTgBDFrKGQjBd3rgOjISp3BePnTd5IKxQjF2wLqQZE5qv490af66h+DVJmodA6mHJvTGyGOsPWlA5kzpfaxCjTe305iV+zaYpUyFfSfKCrTEt8OLSfLEYLgfEzetLY1bcrQwhFIvz2Gq1lVlzguk3CnueF5Rc1WyCmQkbCRg6QetB+vca51dSP1SZxpR6hdBndubMhmmO/zqvSAzqTTm8mOCLOYB4kLdPw2Ymp5+xs/j1FDCuanz81QRmT+RsLT1KHQ==
Message-ID: <2c897009-8cc0-4ea4-90b1-a6af1512b58e@suse.com>
Date: Tue, 6 Feb 2024 14:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 2/4] xen/ns16550: address violations of MISRA
 C:2012 Rule 13.1
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
 <08f1d4a7475c557da016482025067f54e2e56b99.1706886631.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <08f1d4a7475c557da016482025067f54e2e56b99.1706886631.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2024 16:16, Simone Ballarin wrote:
> Rule 13.1: Initializer lists shall not contain persistent side effects
> 
> The assignment operation in:
> 
> .irq = rc = uart->irq,
> 
> is a persistent side effect in a struct initializer list.
> 
> This patch assigns rc separately outside the structure.
> 
> No functional change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless I think this would have benefited from limiting rc's
scope.

Jan

