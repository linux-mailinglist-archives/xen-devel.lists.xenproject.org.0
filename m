Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E17A35E29
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 14:01:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888790.1298088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tivJk-0004SB-Cd; Fri, 14 Feb 2025 13:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888790.1298088; Fri, 14 Feb 2025 13:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tivJk-0004QV-9z; Fri, 14 Feb 2025 13:01:16 +0000
Received: by outflank-mailman (input) for mailman id 888790;
 Fri, 14 Feb 2025 13:01:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tivJi-0004QP-Kp
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 13:01:14 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4fae9ae-ead3-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 14:01:13 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5de74599749so3137794a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 05:01:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1d374fsm3021334a12.41.2025.02.14.05.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 05:01:11 -0800 (PST)
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
X-Inumbo-ID: c4fae9ae-ead3-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739538073; x=1740142873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=37h15gJ65G/DslpufaPX266DHjnjmY391muRnj/3rBE=;
        b=fg+NrqtGL0I+NhLfxREOQmGxa50oowW66qjJ4LjSQg01HsffAXb5lVWL0y+2hRsDg6
         foCFSYiK4eGkHHO/Nt9sYE8HtzSJgitkh7eLzd5/Mtiyb8hilyDjalZTPpqVaS0ppF09
         E/YBswNilobYHNnWTu41mfkFB3NgVokdzEMPCYkkQAB9QANaDOV2xQvYev4I50eHVuBe
         SgMijL2uW6SDsoyD2TRZ02QqdRiBfzOPtV/YCH5WvaDNfLWKyqJwVO8qfy8MMnLGO9qf
         IOTPj4C33iU0W55uWVfBsqpxzXBh17UPU5RnvGv+rN803Voq6uCzm9P410FuICVU95Pm
         JpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739538073; x=1740142873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37h15gJ65G/DslpufaPX266DHjnjmY391muRnj/3rBE=;
        b=DWHox6FzqS3WJotXDlCMWXh5nRj2LhQiCYMRw3RL/AxRoDOOXqtsZyf3046oJ/GxId
         gLCAnx35FW+9AEtizIq3uxOsJj8gMdjr7fnqNkZM8Z/l3KKsH6ltKmOpYSInDwARdp/1
         Jrv4RbgibKFvkkqPS1svx2NlWMJtnQMDYKbavuhbLcPcKC2C/o6gNSpuC2vIbnSp+SUC
         tQT72vvyjM8Br0DOphAv3TydtDs774moGTILqTvza2yUtxO/R5Ec3aZYqLQfMz+TTJ1u
         /i64WpFZVvfCswv14JOVLOxL1es082eF2mRfdc963+SlWjRynL/OEp5bCS5HnA2GSM2C
         cO2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFY9ESw8pU1pr0iCVngeUADTH+k2P0osikBDSxRYDjGE6mhNMlnfAc1su1uK4wHd6CBsBMIcN0m2A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCmu2+lhXD6Y3JbjlGGOj7cFFgSzNKbd+lNRJfSIkNVviJUM8L
	sGyGFNuUMuD2mMbul6c3nvTEUrE6J5kLOD4AI+GCsCigQQYyWponb9QAS/Qbmw==
X-Gm-Gg: ASbGncsacQTHtb8GJqordoYw368JaI0iuT3yYCkZpYlz4iYpp+jgpQm1C5DhR/HBfGE
	ELa/ntMrPONf4EyTOOdXBZiHgapAEDGIwMOePTylqCsIFdd2uYTlIvnp8QT3M8YzoKQbkC3zH3u
	vxfDTTV0XbohN4EoP6uoqLf+oXBl24F11eaNwz2bv0e9vg1rtshbR3qDEKutDxYd8tXZfhXSKGe
	PV9qvUVnG7pQAHKZAJp72oekAF9axertmZnDSh4Jg9+zO6tjMo8UUyhAWTtKemew/+bKu3GUJUT
	PlUFMgzfyI87JlXGqcmOMoI3cqKe0RPjtCW6Xl/MGoa8vGFLbZ+CO3QydFuDTorFzdc2XL9y7L4
	3
X-Google-Smtp-Source: AGHT+IE1SX63daH2FLxY9XgFgNvR9/F6IbaFaQw794FBS0vf4nIiyef8BCOKzc1H4mbFF+Xvd65Lyg==
X-Received: by 2002:a05:6402:13c9:b0:5d0:bcdd:ffa1 with SMTP id 4fb4d7f45d1cf-5dec9d326f5mr6524673a12.2.1739538072048;
        Fri, 14 Feb 2025 05:01:12 -0800 (PST)
Message-ID: <5bd90a77-eb82-438f-8f78-bfcf98507d58@suse.com>
Date: Fri, 14 Feb 2025 14:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20?] x86/dom0: be less restrictive with the
 Interrupt Address Range
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250212153800.5159-1-roger.pau@citrix.com>
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
In-Reply-To: <20250212153800.5159-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2025 16:38, Roger Pau Monne wrote:
> There's also the following restriction noted in Intel VT-d:
> 
>> Software must not program paging-structure entries to remap any address to
>> the interrupt address range. Untranslated requests and translation requests
>> that result in an address in the interrupt range will be blocked with
>> condition code LGN.4 or SGN.8. Translated requests with an address in the
>> interrupt address range are treated as Unsupported Request (UR).
> 
> However this restriction doesn't apply to the identity mappings possibly
> created for dom0, since the interrupt address range is never subject to DMA
> remapping.

Coming back to this also with your on-demand-p2m-populating patch in mind:
I'm having some trouble following your comment on this quotation. The doc
text is quite clear that page table entries must not point at the interrupt
address range. They don't make an exception for identity mappings. And we
don't know how the IOMMUs internally work, e.g. what sanity checks they do
(and what failure thereof would result in).

Instead I'm now wondering whether we don't need to
- prevent ept_set_entry() from propagating to the IOMMU mappings targeting
  the interrupt range,
- demand non-shared page tables if any such mapping is to be established
  in the CPU page tables.

Then again I won't assert that my interpretation of that quoted text makes
sense at all.

Jan

