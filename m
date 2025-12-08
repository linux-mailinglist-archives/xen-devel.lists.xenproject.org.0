Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F21ACAD490
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:35:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180547.1503715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbOW-00071j-Cx; Mon, 08 Dec 2025 13:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180547.1503715; Mon, 08 Dec 2025 13:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbOW-0006zq-AI; Mon, 08 Dec 2025 13:35:16 +0000
Received: by outflank-mailman (input) for mailman id 1180547;
 Mon, 08 Dec 2025 13:35:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSbOU-0006za-Md
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:35:14 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8e44b07-d43a-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 14:35:12 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so45867495e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:35:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479310a6db3sm257438085e9.1.2025.12.08.05.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 05:35:11 -0800 (PST)
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
X-Inumbo-ID: b8e44b07-d43a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765200912; x=1765805712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/XutU6eGL3fU/XVIZpnl+cDCs39PO028KPT25z5CEk=;
        b=OsCjoKQX1JbPn1O0ZHbnEJ2mXC9pBqBYRwc6mlqTsoboPY55+rgsIu/NaThv/DLPWf
         uMOjyPSHKh4nHae3Xt1EpWeAYXIAkMYQ1jHm4q/WXZF/xOB/62x/3CXMD0GoujTUnH9p
         D4uD2SxFzIkXvNl6pYdBu8/56HELoGn0/RKj3jD8CjFcos9l0+cUvR7JngUVM3jAjsVM
         8NE/yMxkiMI2Rbrc5LfH1FIslIFnrtsDtthScthIbCqSMHbyvNyxWlf62Z3tNsrq6qIe
         S7ZFEZHoAvUNcqozP+YOe5h13GnZEXJ4mjZ2ioRo3ykXV4UIwD0qBUjtG7ntbN0HHeoq
         Y9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765200912; x=1765805712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/XutU6eGL3fU/XVIZpnl+cDCs39PO028KPT25z5CEk=;
        b=sh3QXwLOBzCufBJlaEyrpwSKDyABms8kr34d5/EyYY87aHrW3pt3gGh61BtF9vhM93
         XVQE/jYi9ni/b5pr8rPhe/MQ3mBrvtUzfV3ox/PWgQe7xfAZyMLlms6Z8NKDaMydfkCW
         R+FvFwfu6vtj2aiu2B5yI1T03+nFdVYZRlW3t9XIbF7IT228kgpUUdexBL1AgB0XjjPm
         ouWP/+Y2kljwZw2jokxDPoCFvZMkVNNuA9gUL9ZQxs12MyLPf3Hz7fYeZmxbLmhwGKrd
         RJUqI3CxHhtmed08ujR2dOfpxmGpgWHf7b1Fj0s+ekcRWEhXV5U+6IyA1Xn/IO0yimwM
         Mm0g==
X-Forwarded-Encrypted: i=1; AJvYcCVw9jl+qaYGjLOy5ZXenHpwbPxrk0imsQw9w8GzCqKO2Uf2ek7uavxfy0HtijEZDX4eDetcxzyW8PA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQZ96S4hShl+VDrca7nikYQXl4UtxCChj1kEXPjN/fxVgLHonB
	A7hLRslPNczrZt0VTKa3gsf5ZudXSggJyKFmABlC/wh16okxg2UY4vwgDBxXzB/n1w==
X-Gm-Gg: ASbGncvrbmDCFFj7ddJ1EgNv7RVqaaa4gegIBfG4n/XyJ5zYh2PLQryxZGdm1nZ4lbP
	Ge60fnmbB7kQw4ThzomhPIBeJU8N1CXy4cmmJyDVBSmZJRplg761Jg3bbx708Rb8V33KJIFAY+y
	ykLZfHr9332h9Ea5VhY/yNnud37a+QbuPLnxUDO9FgJD1K3DWh3UKE3P4Qt21nrdfovTFlSwcY3
	s+zHl+2OCRd1sBuH7BLjqDi3gOdMz9zm+R9pHE7imG+PbtpiCdLinZF5JfQ/7lAaEVEUdHoX3QL
	7k8f/YNtdjo3vI1MxtEf/g9yRYA9cZBk0K3M/DKAcD+5QBYlRs0cUFJCZC6Usw3/twNklRA0+DH
	IVcnlAqPL8KHDr7O6ljJafl0qXiFaRN3MNqfVbJ+iuxl+dhTg8QVU3WjvsORFChHXdzFnQeIvEM
	cx1o7Y6VSOlybPJ10IfNGZ0fFKS0ZsPc202zzCZYDAAXiz+PfwBdxjiwTvNfIX+81b05vigZq8f
	aM=
X-Google-Smtp-Source: AGHT+IH7mwJTnrOJKwCnl7b6+HZWFH9HLJ1p0ageBtKU68zt+aGj2Id3AOOz0paXkexZYrsuH8m9mQ==
X-Received: by 2002:a05:600c:6d0:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-47939e4910emr52834215e9.30.1765200911913;
        Mon, 08 Dec 2025 05:35:11 -0800 (PST)
Message-ID: <79b05298-1042-4cc7-b5bf-5c3698c4da9e@suse.com>
Date: Mon, 8 Dec 2025 14:35:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Align handling of domctl/sysctl unsupported commands
To: Milan Djokic <milan_djokic@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1764961645.git.milan_djokic@epam.com>
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
In-Reply-To: <cover.1764961645.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 21:36, Milan Djokic wrote:
> This patch series provides minor updates to the domctl and sysctl handling
> of unsupported commands. Currently the behavior diverges: some commands
> return -EOPNOTSUPP, while others fall back to the generic -ENOSYS.  
> This series aligns the behavior so that unsupported commands consistently
> return the appropriate error code, allowing the control domain to correctly
> identify unsupported operations.

What, even after having looked at all the patches (and their descriptions),
still isn't clear to me is why the distinction ENOSYS vs EOPNOTSUPP would
matter. Tool stacks still need to be prepared to get back ENOSYS, at the
very least as long as they mean to run on older hypervisors as well. And
with Penny's work to allow excluding domctl/sysctl altogether, I expect
ENOSYS would then also be what results if that option is made use of.

Jan

