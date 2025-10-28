Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0139FC13D49
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 10:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152039.1482579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDg4c-0007Q9-9K; Tue, 28 Oct 2025 09:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152039.1482579; Tue, 28 Oct 2025 09:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDg4c-0007Nr-6U; Tue, 28 Oct 2025 09:33:02 +0000
Received: by outflank-mailman (input) for mailman id 1152039;
 Tue, 28 Oct 2025 09:33:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDg4b-0007NR-1P
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 09:33:01 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16d93c69-b3e1-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 10:32:58 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-475c9881821so35156145e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 02:32:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd48a07dsm185246965e9.17.2025.10.28.02.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 02:32:56 -0700 (PDT)
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
X-Inumbo-ID: 16d93c69-b3e1-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761643978; x=1762248778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F0/el5DbS/rcPRLxGln4dovr5O6ID+Nut9az+4W6bMA=;
        b=NrVdVXK7o52DvkcM8MFSbgMMXTCoXk5JWaEt+AF88hTH6lnygF1OivrAeUTPsCK0Zb
         4OS9K8nuypZ+P2aodZ9d3uK/kme49x3u3SgccCcFRJXTRcX8Dp3He0ajto2dDiMPGJmZ
         woIYMjl6CH49p7dfmtFUHR5rB7W6V9NlnYyJWJtRC6w1E0UMYUcQ0pyOpBkogFNHoivI
         7YvWOOQeF0QNxIouBgu1U12g/IzI9icrHtnzsDcrDn6wyJbv66Yw8ZOyLLTbyDQSkGcm
         vJ+pa5SQpbL0vZgAKoXHOFf1yxWk10kwlcqaxOhjlnidKR9WfN8ndymEGQJo85w1Xq1R
         cSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643978; x=1762248778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0/el5DbS/rcPRLxGln4dovr5O6ID+Nut9az+4W6bMA=;
        b=GzXRI1PIk1tBXRJv1SPLHF5l+hp4Q7f2FGc+YncipsFtYnC080r77hrJqtabksgC/Q
         uruyIme0wikGBOUmdqhM3n8ysTm+YD0kkrAMKVUph2uJRO3ZMTJ0Fgn9aWhqoob9TR13
         MUyZ634zL9Vc0waX/+fnpx1l/ya5TBuU0ScI5W5qeHgVmSvc5J1+G7Ov67W3Egwuhtdy
         QR3TQOSbQVP4DIHdBiMr6Kc+ZwpyV8O1VfZuQ/sZRnBDE8GzN6eddi8X4cALjPyv6p+8
         jVTLjMWesNGypmZSJfFIxJ1SokbmYrrW2fFmqkQ6HTwyCB/PL14exrVI/wb7VX0xOsLp
         pntg==
X-Forwarded-Encrypted: i=1; AJvYcCV8F6Nk4WL/wXGrrlj+w21SrGNzHB78dbgRXL/+z7GxjC58XL1JHQXDx5KVvVk8Szn0LqgQAzIQc9Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyr/E6ZbK1qzXCcPXBiIBnD4yBKq/UY6im1TlECJuJFBCmoEATS
	OUnw4JUs7ueGPCcirZKl90uPTTd+qn/5WshbjIJAHEJGTyec+gG2H/mHTid8WWSunncpAshKvns
	S65Q=
X-Gm-Gg: ASbGnctRQmKlM670yGvk5araEQ6k7zPFjjoY2TJJ/xXbWe8/9AbH1u1zl1hTnlvshf7
	IJ0LIs93m7E9pZiCLr031kmpPdPHTbmVJdJPRyEQdxHwtyzZt+5044CTOV5GrJBGH76wwk4PAfT
	hv3vkeQMpCpYG2TfEqDkoCE65ibqn3GfcnjH4/lJPn1PcU90cZfx08D351C0zRgUiOVwwgZ+9If
	P7yK4pbRS4uLM4nv9xjhO4+ODdzk0egvp3sg7eLNFUP73dcDqPinvBKWtoi2FsRVum37WkGMfF7
	iLPmjZaluJJKuxzVYteZYKhjDNzUApqLc8EEt30Gr/Ajeg2DxhbyYF3Z8zecpgBBEat8cfWvlZz
	uebn96oMLw/SBfbsKFlQXTbBsVAEncINxrv2pKb8zgJLoKemSg00w1IP2EwU0fA7ebbWPx7lBwn
	b92bPg+/EgK3q4fEVzQyil5QFGJ9YuSJjRv/Cpum46kdyqAg8BQfRpKE19H0bV
X-Google-Smtp-Source: AGHT+IEgt0TMuxuTv/XgJYaPHQj04zyP1SEELNgAVQj3+P5f2UGqRb0L10tzU0khfmP0rVqX+9iOfA==
X-Received: by 2002:a05:600c:2052:b0:475:dc32:5600 with SMTP id 5b1f17b1804b1-477181a9835mr16806355e9.19.1761643977624;
        Tue, 28 Oct 2025 02:32:57 -0700 (PDT)
Message-ID: <1636aa0d-1ab6-4f6d-ba74-f41a9c561b55@suse.com>
Date: Tue, 28 Oct 2025 10:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] x86/ucode: Refine the boundary checks for
 Entrysign
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
 <20251027221702.3362552-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251027221702.3362552-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.10.2025 23:17, Andrew Cooper wrote:
> After initial publication, the SB-7033 / CVE-2024-36347 bulletin was updated
> to list Zen5 CPUs as vulnerable.  Use Fam1ah as an upper bound, and adjust the
> command line documentation.
> 
> When the Zen6 (also Fam1ah processors) model numbers are known, they'll want
> excluding from the family ranges.

I.e. we're firmly promised the problem won't be there anymore going forward?

> Fixes: 630e8875ab36 ("x86/ucode: Perform extra SHA2 checks on AMD Fam17h/19h microcode")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


