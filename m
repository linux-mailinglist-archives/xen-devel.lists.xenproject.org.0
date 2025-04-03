Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01926A7A1F2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936657.1337847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IoN-0004ev-Fj; Thu, 03 Apr 2025 11:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936657.1337847; Thu, 03 Apr 2025 11:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IoN-0004dS-CH; Thu, 03 Apr 2025 11:32:43 +0000
Received: by outflank-mailman (input) for mailman id 936657;
 Thu, 03 Apr 2025 11:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0IoL-0004dM-Rb
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:32:41 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a17a5c4-107f-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 13:32:40 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so7476955e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 04:32:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34ae0c5sm16068655e9.15.2025.04.03.04.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 04:32:39 -0700 (PDT)
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
X-Inumbo-ID: 5a17a5c4-107f-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743679960; x=1744284760; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i5pZZco6E76e1EG3F3nlkL9lhN/8NZwEMQ1WVZgezSc=;
        b=MtUt+Bui1lHVM3vlZKs4d5gg6QJ6JzEVmW8JeE87EiuKe8dK40wwRzpHSrR10t0JOD
         YbmtJWY7xMpOwQaQArzEDOu6k21/vhaONyrxHsh3hFabMVEv6YGLFcHEDkBw0nRB8bnJ
         iEwFGW97UBH4EtVMVf6FiaYVGUpBx7p6oG1WFbeOhVwetHOziZV3YUWil0zZNlsobvft
         uRvifJNuYgnXTl9z0ZQcCyA1tfX4M9pCe7YPB/V1EBPWgWMBplhiaGU3mMELpV4GfxVr
         A0YTxKkwdmnE8Bkiv6g9DCJcDnmWoQMFTxpF+E0ztJ7mTjJjHcsYZOcHOUYY51BzSqKD
         lBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679960; x=1744284760;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5pZZco6E76e1EG3F3nlkL9lhN/8NZwEMQ1WVZgezSc=;
        b=O8DpaWrVYH0CJNHdNkgycdeBhhOGvNrWKcgtV6ekpT657kRsujxqjXaZH5yaylZfYS
         C5IdsVoyOdv+wYkx/pQ+4qX/K1XonvYNl6xF6SGlTfp2XFKJ/QE5y0XkeNX7JJU4Rk1r
         wXu6My5lEyAkidIGjAq5wW/LSncY7D1TwDoQn4EDn7/nSV5lk8lKWkm5I4YOri+hcDJu
         sA3Bk9i13+YYBrsdp6F+ovHM6RJY5VhLaZ5afokFtYdnRbiBr0uPZwcz8ANm514inVqi
         0K+jVjhIgk1biaiOP8lIRvVWllfExQJVj6agpQNXwA7iRg1N6NFFahxJ7zw/9PwRPFUm
         F6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMxywjQsxwGLfunKI0Dy3snv2qTOeAPeiyQdMjBdae2rMXKUbHCRDsEwTj32n8yLfEHIPABls/l+I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzy6YmJL5Q4yFvBcjPl7jcrMdTR8z83Vy50h+MjuP+YgQIOH6tN
	IzTqh38VBt/GWtIo9DVn4LODRXa5cFevDK4gXe7AaYsfbAiTRfn4S60PcREftA==
X-Gm-Gg: ASbGnctz8X7MRgTpO8mvEhHsyeSiZm4Ya7P8o1y6klTXT1k6UFZD3LZtlu/uA1qUUbL
	gxhiQzErz5ALLHiwi5Yu2QD1AiUFrx/clK2TViY+hlpBH1vIiOREB0LXb+nGke0NPtLN7DUedrb
	Qs9zFJSvlzUcHh1250MyU72dclb7UzDRZG1Y5HBwMmNVcY98rgxO+lthwSZ718xBMZyoltaE15g
	jmPewjOFQwH+rlrWATeFA9YnJehohIYWTMl4bfkfEJg4Nkv+SHm9wkolLIzm65FDWq+hoeL+F5l
	H0PNb1dMXs9Evd2faLHZHbE5QtaLOenGVIGZRbBfgTc7rXypRTqGop1/ieGpZrRilaD7ijvtQWp
	lGSftxoWsJiE64FDQAGZ8o/9An2vhww==
X-Google-Smtp-Source: AGHT+IGQrdOSvgUSqPSOjLurAzzucnpBSQIk3jA0WVH2CjlndY2mf4mXxnt7ptT3Eymf8ZL/ZxfADA==
X-Received: by 2002:a05:600c:4fd1:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43db8527142mr219466125e9.31.1743679960224;
        Thu, 03 Apr 2025 04:32:40 -0700 (PDT)
Message-ID: <9e4660fc-b78f-4323-8a1b-aca3d410edd3@suse.com>
Date: Thu, 3 Apr 2025 13:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/11] ci: increase timeout for hw tests
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
 <7578489af5c7df525d4c82231b68bbb7d955d2b4.1743678257.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <7578489af5c7df525d4c82231b68bbb7d955d2b4.1743678257.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2025 13:04, Marek Marczykowski-Górecki wrote:
> It appears as sometimes it takes more time for Xen even start booting,
> mostly due to firmware and fetching large boot files by grub. In some
> jobs the current timeout is pretty close to the actual time needed, and
> sometimes (rarely for now) test fails due to timeout expiring in the
> middle of dom0 booting. This will be happening more often if the
> initramfs will grow (and with more complex tests).

With that, ...

> This has been observed on some dom0pvh-hvm jobs, at least on runners hw3
> and hw11.
> 
> Increase the timeout by yet another 60s (up to 180s now).

... is this little a bump going to be sufficient? How about moving straight
to 5min?

As to observed failing jobs - the PV Dom0 boot failure seen today looks to
also be due to too short a timeout.

Jan

