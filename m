Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB732A76045
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 09:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931968.1334154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz9mj-0008UJ-OF; Mon, 31 Mar 2025 07:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931968.1334154; Mon, 31 Mar 2025 07:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz9mj-0008Rq-LJ; Mon, 31 Mar 2025 07:42:17 +0000
Received: by outflank-mailman (input) for mailman id 931968;
 Mon, 31 Mar 2025 07:42:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tz9mi-0008Rk-Jb
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 07:42:16 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9991c03-0e03-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 09:42:14 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43948021a45so41766095e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 00:42:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fbc10e1sm112933915e9.12.2025.03.31.00.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 00:42:13 -0700 (PDT)
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
X-Inumbo-ID: a9991c03-0e03-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743406934; x=1744011734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kTH+44uyqZQ2AnKI4gU4wAgOXUxVo/Mrp/QtLIgJgjc=;
        b=SyEcoXpdZE+UwanC7lip/2lqGqiml01+IEtjBbpqI0Gpxfz4qZ1alZ3TAo7dRRIf+Z
         JQEhqYE7Zlun/c3M05rZ4cs+Zv8uhZOR2oUkAzejPRbMUr3nQqEDvgdYG8KjnCo//HnR
         xAxEt6uMLJTqGRmJQCI7Rkr7FhFhEZYJ7szR1NXlI39L0r9OK2mZYKrxMyAMEUZpf+4Q
         qvoqUHcztvrkf1K3VWcCNbHV8ivb3B8xHFgYl/hm2vsCC3JPOuXFGOa32B0NdWAqpsLH
         AzfUUSG6zBvGQAJD7r5+Q104UrhR9gGP3yNDDqJOoO4g2rQ/qRixy7ALRqMJ8UUMnDbj
         VTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743406934; x=1744011734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTH+44uyqZQ2AnKI4gU4wAgOXUxVo/Mrp/QtLIgJgjc=;
        b=Hd/REk6UPylFB+urb/UnpLlgxhfEhI8L66MUgpriijQxnli6IiCBU3NhBVp5pvkPx9
         7N+hNyG8WmsheD1a5xUoLMi4PF4rW1yRtFgmeOlKBZIryS50lCxblwUlPx4ZL899cgeF
         cPEpAP/xpuwoX8ql8jroduLOp0V6xHavdStvNmKj7qspnSP77GhaFLtmgTtVYcybFujw
         HKDrRlHz9jBdJ0jKTTPyKwGVtzI+SgmCF6hGQXgKosfRRb1k1+grtScbSUYY8NseGs6Y
         foE57Yj8GjNkVJEnEpNQGqx9iM3lx5p9qQXiPziwVvEJVc5h5jzuZONM06ntCIhjO4Mq
         a+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsQaNFC/H61EQbfYm4JIpB2pwl92g+xcQ6HNJDkFjyEOMYzoZrVLxS6z7VsnBRzmtnB+bs1RlC/wQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAE1t8ZV/P29SpoR2i5rC5vwUcsoAb6s5ywmsOnpCWQwLNzsPn
	qh18oSHAkrwNVFSXvSLJORzkhDCHLSD2O5ke/vblcTpRxcctW2Y7lxvYQt8IOw==
X-Gm-Gg: ASbGncvQUyXSs18GWU9g6F/hZ6CxW3IwwSuGjZpYI3Oc5i4IGmN6+hum4+pq+Occfrc
	13imVmZybMHg5jgv7lJzVmRR1dQnvhVY2MXO3bHYbbf+HA3hPa4N/HEiDegLvdzsJ9CF1wjLidS
	5AnF9bDkRT6HCSpdiF5tL689tPIhKqAHtHZ/FJMoATUCDXQTO7ZOLHyVN7Xw7wUL/Pl+A2Tji+5
	pGhXYvXVOnk1szP+51ug06KKkQTRcfrr+ZRkWjxmlEd5zh0vXYifC/CuQkiohxbjrqkc/wAvKbn
	++/NtpLVUJZqCictkb7UnSnCJS0odG7qkI4GIvwEF/wSniz7y7Yu4HHvzvATa+iQl2ACWbp7OC1
	LB8c6PFdHKssKNerjt4HiPRfr8y0Olg==
X-Google-Smtp-Source: AGHT+IHQetVlKCsNKPAX7Bj5tw/Gf6Vk7+bBfq3wAq/oR0fUWreC+HAI2vHmKRUAtcX4KX/wWkMTnw==
X-Received: by 2002:a05:600c:c0f:b0:43d:b51:46fb with SMTP id 5b1f17b1804b1-43db61d8dd7mr67899755e9.2.1743406933738;
        Mon, 31 Mar 2025 00:42:13 -0700 (PDT)
Message-ID: <88971ebb-6a58-4d7e-b7e6-2db9b78fa341@suse.com>
Date: Mon, 31 Mar 2025 09:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/16] xen: Remove __{BIG,LITTLE}_ENDIAN_BITFIELD
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Lin Liu <lin.liu@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
 <20250328134427.874848-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250328134427.874848-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 14:44, Andrew Cooper wrote:
> There is a singular user.  It's unlikely we'll gain a big-endian build of Xen,
> but it's far more unlikely that bitfields will differ from main endianness.

Just one point: While endian-ness in general is dictated by hardware, endian-
ness of bitfields is entirely a psABI thing, aiui. Hence tying both together
(beyond the latter defaulting to the former) doesn't seem quite appropriate
to me.

> I'm tempted to simply drop the logic in maptrack_node.  If any big-endian
> build of Xen came along, that's probably the least of it's worries.

As long as it's not obviously broken, I'd prefer to keep such. While it may
not be a primary worry, it's still one less of all the worries then.

Jan

