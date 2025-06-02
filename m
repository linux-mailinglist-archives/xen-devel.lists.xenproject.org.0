Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95079ACA998
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 08:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002771.1382160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLyzI-0004pY-SW; Mon, 02 Jun 2025 06:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002771.1382160; Mon, 02 Jun 2025 06:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLyzI-0004oA-MR; Mon, 02 Jun 2025 06:49:36 +0000
Received: by outflank-mailman (input) for mailman id 1002771;
 Mon, 02 Jun 2025 06:49:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uLyzG-0004o4-Cx
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 06:49:34 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bce224de-3f7d-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 08:49:32 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a361b8a66cso2337907f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 01 Jun 2025 23:49:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed4c0dsm6920862b3a.78.2025.06.01.23.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Jun 2025 23:49:31 -0700 (PDT)
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
X-Inumbo-ID: bce224de-3f7d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748846972; x=1749451772; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m2RxsPqHpa5wh8pm65f/H2m2AcFGOITAGjFZl22tFVQ=;
        b=L3b1hVxjSV9rGsP7dI9hWcCjTzEN2tIF9F0TEnooP5fT4nhNb2BFJPVTDVQuappTO2
         0QON+ib+ZEj/Z9YOLChqIDtol8oj0GX3g5w49r+mxhzrRZRtBF2x1TuN3b0D9N0Ks+T5
         pXNBEb3Jh5UUBBHRgJJzEwaK//IhWuebHdTwNq0OpRTI6lHHjRTJu+bcKOAm0wfdp816
         nMTxEQ0aIil3B07/5HoTXA7Ic9Z/6lITY+ZAAjqZDBJx5L0s4RPQBwfCQPCiKVXV0Nk5
         OdjwZ3ByU2mnAmGTjgyRHgH+anvCo5U+VZbnbQo7lZSi/xgvYEMjAEQoaZP9fpYd1Uw6
         6GXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748846972; x=1749451772;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2RxsPqHpa5wh8pm65f/H2m2AcFGOITAGjFZl22tFVQ=;
        b=YSX78gcs9+49g1pddfq0mOyeoZ5ppHbnV36I/EaXvysLMKSP2LFVRR6n0OlIDYdyrp
         9f+JCqB9AulODX9UNY9cFhQjE3/keJcBCpzxqITtdZSblZi6SHxnvVZv2JfYBSS9mSMR
         Hbezh2ozRnYBAPLAl3LtXKltUpb054Xc2x0LN/qOojTTzTpgC3NpU7b5NyyH9pQDnH/y
         sQUDimhGaEhQ2JN18oZ2D/hayiMrVQtr2FV0ZhOruYtehUEfSmC2WXZDXwSR9zgkoaBm
         e4P1Dmvqj9RtKGeddl5LqSJXKwQAQc45M0VDB/S9JzRtrCvfGJe80bTh+4avfdSouIb0
         NJjA==
X-Forwarded-Encrypted: i=1; AJvYcCUORgIPDKMv3n5FWT6SeTbhvF/IEZeHpBXiGiXTsFvCYYFA1xhhCPfOPzZu1JQGVlrmudg0QVol1+s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydhoTkRTCGTdIZnWbNB+v2r+hwDiMx9C4MhsXRedqBqAb8fgrw
	LAe2IFrbI5IEiUcabHZNF8v6NsTVBY4mAORMvlHlvTvTq6DsDeyUOvYBX59/q/Gl8Q==
X-Gm-Gg: ASbGncsFM7dMDL2+Jtb6ycbYEno3mBWEkC3Ux7kOHn7kYUIMpRFhCQAjFvf7miqzfsy
	QFfbNjKnl+q+2nKwUgvmSXcvkw6h33gECX4f2uxxA4HTuq8TgCpA2YLIpTaeoDNUiseXDU64VXl
	UgFg3vdTsX7vINweR9rBPTlyszhla4vQhbjSzbpW3vqvT8b5QnSV5Wn91hfO5GqW9+vy7HRhakO
	oTj0qh6t7JgFqqb2Y05uIaiE7pAJXe/hmamTIkOGfGCof+hOdPYv7zZ18DYw6WrvMhmI4l6C0oJ
	G4XCMZxoAes0pKVXqzEKG4m0lAfutdngnLvGsG6e6LC9OI2BJgYXBpN0Ve8HBo+ULYgSrk0xJV/
	IQTrzxiyGrBtPDNiMLhkL3Za/cLjJkOTV/L5f
X-Google-Smtp-Source: AGHT+IGrT2DIP96VTQfFcdTuFxnn7mT9xAQmQ2RhxvdFjYHVaTvbPjBFmlurqNHaEL6hv2qip9DBgg==
X-Received: by 2002:a05:6000:178b:b0:3a3:6415:96c8 with SMTP id ffacd0b85a97d-3a4fe398e60mr4990761f8f.41.1748846971610;
        Sun, 01 Jun 2025 23:49:31 -0700 (PDT)
Message-ID: <968ed926-41cb-4ba2-a312-a11e0a812e72@suse.com>
Date: Mon, 2 Jun 2025 08:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1745918678.git.mykyta_poturai@epam.com>
 <ef583aaae0a311ac8fec8fe4f18e76e9d62432ca.1745918678.git.mykyta_poturai@epam.com>
 <c40af488-b706-472b-ba89-50b856ccce37@suse.com>
 <f1a9fc2a-1920-458e-b707-75e6fe8420d1@epam.com>
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
In-Reply-To: <f1a9fc2a-1920-458e-b707-75e6fe8420d1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:14, Mykyta Poturai wrote:
> On 29.04.25 15:20, Jan Beulich wrote:
>> On 29.04.2025 13:52, Mykyta Poturai wrote: 
>> I further notice that you didn't adjust the "reset" sub-op handling, despite
>> my earlier hint in that direction. Looking at the commit message, you only
>> mention PHYSDEVOP_pci_device_add anyway. I think all three need mentioning
>> there, which would then (hopefully) clarify what the deal is with
>> PHYSDEVOP_pci_device_reset.
>>
>> Jan
> 
> PHYSDEVOP_pci_device_reset doesn't check if PCI passthrough is enabled 
> or not,

And you're convinced this is correct this way?

Jan

> so there is no reason to add special clauses. I will add this to 
> the commit message to be clear.
> 


