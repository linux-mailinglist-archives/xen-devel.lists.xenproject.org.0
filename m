Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F0C9EB312
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:23:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852498.1266272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL18z-000076-Rx; Tue, 10 Dec 2024 14:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852498.1266272; Tue, 10 Dec 2024 14:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL18z-0008Vh-ON; Tue, 10 Dec 2024 14:23:21 +0000
Received: by outflank-mailman (input) for mailman id 852498;
 Tue, 10 Dec 2024 14:23:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL18x-0008Vb-JO
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:23:19 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cb58324-b702-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 15:23:17 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434e9716feaso19434335e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:23:17 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f7676d45sm78958245e9.33.2024.12.10.06.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 06:23:16 -0800 (PST)
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
X-Inumbo-ID: 4cb58324-b702-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733840597; x=1734445397; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TK3qUKMI9El/3oT5DKlkszXI6r0GfSJAYOm6NcZVniw=;
        b=btoCCQve0Z1ervu975a8m0DGyyg6YetQpagKDpMxCi7I8sUPZO1WLjMbjrOBiDbQYy
         Xd7i7ZMBVIX0eSz6FLT1IZPA3jYj/jeH64Br3+wkm/yqReAicHUxYW7t/gEuuwpzAq5L
         unOzhPZlFWjH4QvSwPL0boL9KV3PQGQP7ch1FIu110JygMmTLOooU3+49MQm2HdZnF0N
         0/d/gGhAinYlo3ysiEmn2bmNws/+9kCzfQUdReRmz+iDMbYoY6aEmvuzIVNfLg9lSEX4
         gOrVssLkRNwyoq3WUeP7uNOdPOb0rQHlI3exVCtYiTu91x/WO4YcGMLWLfEhGFycwTxs
         DalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733840597; x=1734445397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TK3qUKMI9El/3oT5DKlkszXI6r0GfSJAYOm6NcZVniw=;
        b=vZCAPc7ZuZ4AsX8XBxQdjOIFZFMcSFMbvnJafFpiN052NrcHvZEBPiNZibyTWusVNL
         tZ89tOIVC3g5a5/Q8z6qQKwoW3TN71hPkm3yb1orz/NSLK0/mvMDJPscSCIIfqGaB6+u
         Bpf0qIeS3Jh7sU21u+0OAyQ0jHVVWYgU44nrCONQWz7shaoykTI1E6CcwUqXMVXJZl8m
         cSFUX2BFVf7h+2tw5Dxkwe8RPMj5srMrlH7eGCpI/yr/QxAaTa+tbAwP710tR5FagPDN
         dUpjJyZ0TXFoWQBzClHkvcYDmTEcItPsy/MNc15musUVBTC2mv/qQhGxZpATDRz9+GgY
         BE6w==
X-Forwarded-Encrypted: i=1; AJvYcCXNDKJWcO88eIgUZWTQvg54OOiM47Tctsg5yTdrdzTCZ+T2O+FzFSamvzldSCq5V39PUpYra4VITPY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyX4Rog5q23UG5B5oeZnJ6gyhj5rAxO9LwOseTOVKp2UCvbLQhv
	netOkBSX86zrPaOcSUpuEE85tO2hn3974pHKHuGL3I0uKD95YUWcX278sc/DSw==
X-Gm-Gg: ASbGncs/KEbmLk6YoinRe1zP6BZrq4fgpZAiz+n8etIJRE2ebM8E++tM1PcqA7GmIA6
	bcX0S8zHDDpOkwkcqGe7kYqqVkZ4CHciH5gQiLPOt/KlyhcVHvjPUJuicsQFbn2cPYJMcVP16kX
	glwOBGd8X8wkBL/dbfVb+BxeLrKs2L8SpPldI8XedIZreEiahDZU4i+C2gKc7lYsoDIAp/mhZGZ
	hBBFoPdk3GuUKNOuAnEOUwJkV2rAsb0N6l+gJe/U17s6rHBef6WzvuPicmiFb1Rr31ZMQ91BxtI
	YVMCtBfj6JeBbSwrQbvvlr7Ako43LueREIQEL/W+4sG+I1I6A2JKnkC575geIP8F/hm5QP2eaFF
	WEt07Vom/HA==
X-Google-Smtp-Source: AGHT+IEHsyuhq+DGhOeH8Zdb6gHwYoyo7v7x5zc6xIzjI5Q8Y3e4O/1NrZt2cCqJVDq1OgCctx5Vnw==
X-Received: by 2002:a05:600c:4710:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-434ddeddac4mr148869445e9.30.1733840597153;
        Tue, 10 Dec 2024 06:23:17 -0800 (PST)
Message-ID: <5ced20ec-44d2-40ec-870c-e7f5f256186f@suse.com>
Date: Tue, 10 Dec 2024 15:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/35] xen/console: rename console_rx to console_owner
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-15-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-15-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> Preparation for the follow on change to switch console_owner to
> domid_t address space.

As with the earlier change - it's one thing to (plan to) change the
number space, and another to go from input only to general console.

Jan

