Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBCBA6765A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 15:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919191.1323696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuXvo-0007IQ-Vt; Tue, 18 Mar 2025 14:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919191.1323696; Tue, 18 Mar 2025 14:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuXvo-0007Fw-Sz; Tue, 18 Mar 2025 14:28:36 +0000
Received: by outflank-mailman (input) for mailman id 919191;
 Tue, 18 Mar 2025 14:28:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuXvn-0007Fq-Qb
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 14:28:35 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45a61c47-0405-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 15:28:34 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-394780e98easo3702318f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 07:28:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df320csm18130208f8f.7.2025.03.18.07.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 07:28:33 -0700 (PDT)
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
X-Inumbo-ID: 45a61c47-0405-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742308113; x=1742912913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oxAO9WA/MT3f5NW0dbU+3avgxxhHs0NR1TtjyEKL1aQ=;
        b=UoFuOskF0np/7ID6qV/n7juzTOLsXV6goXVcFq3U+Kuhe+6EUbJ0RrIyOF1xJJUWSh
         wVet84Q22A6yTfhP4J+lais6utww1SDKxfW2u5yl9NZ9dACFxJUI+sVvHquOgsoeYVX5
         HXn7fgCbP84o0KaacBL/cIZ93RfAvsap0ppBP0ZHly7YyuqQcpIBXT93IDsLVFUdljRI
         Z3HU0UeoX3UsarID968n3UGI5CPcapCGjZy5OP+qWudQuBuQTnF7pVcQf+i08k0Ms7vN
         QtEJhPfd9QoS/smwaDi2qLa0+xi95F+eDh4ls+REtZ9KdUJfln9ajTpA0KXFA1a6Dcs5
         7XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308113; x=1742912913;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxAO9WA/MT3f5NW0dbU+3avgxxhHs0NR1TtjyEKL1aQ=;
        b=k+yG22z/NVE86ouq0+sRj629yH1aDqyEaac4PYkrtuoilVt9W8tkDqjCZRueKhPDji
         5z48ga1HeaCdc9Ndju/8o94FrA2+qGWZz7RkEGUJEuaZRTyuTbKHhIcw2aWszXcHWYeH
         LallsJKuHWdblZtCrplOxTzdhIEMeBVnGJQFdCaidw3v8fob7sMmak1QBlcM+DhKHtnf
         kuyaXf0i3zLgN5J4OvsLOQsByAW7dvFlQYdUAYHPNTDlQs6cD01gTjBb03LHuiRXM/Fp
         r9DUgik40MG1lkjrZ1Zybaj/GgmprCv5vaME/Nz0NLE5awMhg0FHlx0JKi8n0RQd+og1
         BRlg==
X-Forwarded-Encrypted: i=1; AJvYcCX/Qwa++SZ042HZ3tzI299BFEOOyCBZDKBWrwbnu9YVPRkoJkZ1gip2KF+qeeSzxRV4+fEw3q06VdM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynxGIw8GuDRm1C6nCG7nypTsYIVQUk4bH2RZJl1J8npxkJqELt
	qW3JrtTigz46ZIUJAAzt3stC2JNh4jHrDMvtztSsmBNlCJXVuNdT1SJTIBQMKg==
X-Gm-Gg: ASbGncubTR/IXw1EHEi4l8OBVONNikZVAQASeqBniarhvwvWj2LSKJ8lzVIJ6YKZMrC
	c9UtPG1fBWkQTeUQxs/5QzkprdO0kYkE9jsDT4TREPfojeu364915oggSscj0cfR/+xaUepVunx
	HJ56PHB2IFjCkdf7s2iLRSoFuwoKbfjH1spK0/2gM9LUyQ7C6AfUCLfOJGZoqkm2+vPdWIPfe/j
	osq93d0sIGmXsV/5EmiEduxZCeu2BujYnJwW1bbGUkLXb/R2DWtEIAY2XB9p7bm9HtzM8eAoSzc
	x290ed/6pS1TNqns3V9IB+LeSIEvvs80HLiOeAxCYCfFhK1dKf95hMQypxWTTfAiTNG2SXpfDXP
	HnIIQA11ZFbk5QHD471fl9b93j2UPhA==
X-Google-Smtp-Source: AGHT+IG9/9mTU/hjQ5vBUxFN/7erS67GiMzwbFnSiCNHnG5KNyPTzwqgUZdW/MVuXsENtx0op0isEg==
X-Received: by 2002:a05:6000:4025:b0:391:43cb:43e6 with SMTP id ffacd0b85a97d-3996b4a1ee6mr4128169f8f.51.1742308113439;
        Tue, 18 Mar 2025 07:28:33 -0700 (PDT)
Message-ID: <f2fa59b3-83cd-41e4-a921-5c6eaa89e759@suse.com>
Date: Tue, 18 Mar 2025 15:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/vga: fix mapping of the VGA text buffer
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-3-roger.pau@citrix.com>
 <cc882f93-b5d0-45ad-bb2a-1c6b9455509b@citrix.com>
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
In-Reply-To: <cc882f93-b5d0-45ad-bb2a-1c6b9455509b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2025 14:11, Andrew Cooper wrote:
> On 18/03/2025 9:19 am, Roger Pau Monne wrote:
>> The call to ioremap_wc() in video_init() will always fail, because
>> video_init() is called ahead of vm_init_type(), and so the underlying
>> __vmap() call will fail to allocate the linear address space.
>>
>> Fix by reverting to the previous behavior and using ioremap() for the VGA
>> text buffer.
>>
>> Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> This is somewhat ugly.
> 
> ioremap() isn't really any better than ioremap_wc(); this only works
> because plain ioremap() has a special case for the bottom 1M where it
> does nothing and exits.

And this is exactly why I screwed up back then. Imo we would be better
off moving to using __va() directly here. Otherwise the same mistake
could be made again by someone (perhaps even me) noticing the less
efficient ioremap(), when ioremap_wc() really would be wanted.

Jan


