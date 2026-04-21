Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJKfNPOP52n69wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:55:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4027E43C58F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289074.1569294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFCVd-0001i1-PF; Tue, 21 Apr 2026 14:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289074.1569294; Tue, 21 Apr 2026 14:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFCVd-0001fl-Me; Tue, 21 Apr 2026 14:55:29 +0000
Received: by outflank-mailman (input) for mailman id 1289074;
 Tue, 21 Apr 2026 14:55:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFCVc-0001ff-J3
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 14:55:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFCVb-00F1Wq-VN
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 16:55:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e78fd6-5cb7-0a2a0a5109dd-0a2a450ab12e-42
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:55:27 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e78fdf-56b3-0a2a450a0019-d155802fe89e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:55:27 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so33874735e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 07:55:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc14a61asm345752095e9.15.2026.04.21.07.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 07:55:26 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776783327; x=1777388127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zHfte+xahonG06KYROzQ3LxkaMuMBihoL8iwVLaq1EA=;
        b=XEc4gnzoH3cUSKmyAJeV0xAAyQAvH++WrDlkrkzZ8sm8i9vsw17rTatm8Zw1CBtEGd
         C5tlX17DPm1pQXjivcwIeaYjaqJkRRlRTF3FyNXfq5H/P4KHvd8EVVsxcNJyhWcLcTqf
         8YoTHqdhX7y6lnUT7HGuwEZ0Z70iffKw+Oy2ygu14JpagYKVBr/LLZQ4XrvgGq8zYUMC
         5swKkd7GaVP0QyYQ/CjoaIQt32mpIDq7tbe2EOsiw1bxhRcAO8rX/oWgIEkrPU3drWZ3
         /t/XnPuNGwXTMA6B3vnkE3gkEhTEjY+SPl0pQwC5uSWNEz5zO/FvKS8qDEbindWOTuju
         N88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776783327; x=1777388127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHfte+xahonG06KYROzQ3LxkaMuMBihoL8iwVLaq1EA=;
        b=l3x0pe9hzjVkban/Eeq2dzHhOpLpAPop9WSeQOVRkllv/R5ek4bdhxdbhdIm055a0c
         AzV65zca/sGCsvC4Pxu+i18gV/93o2ghHn2NDiaF6HufSNuVVJg9hBN3sJSGPimVMEAb
         yXk4JXBmZOyRR2LmsKYnHW2oNZKCYIb8R7pBtZbSTgvHv99ZdeeGrUXaIKkwWwJKk+om
         QeRucNEAHzCG2L6XZEyiaY+yAWrxCtds0H5lhBNm42xEPSMY0YulU/5NgoGl3ndKWPyY
         vqVXjijDBxhm9rEkuX99svfuWqD4HWGNRKvJlduoYQAyLdUN98s0NCuybxCYjnYpIn56
         JFjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nyiCudsRMy+NfKi/R8yEVMj+MfajrIFZq0163nv9LtJVtkTOZx/3i9eABd5xJaQuPFNSwh9d8G90=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoCr3uFJs/LAMCcpHaxsz/0zBxJi0QyMZs7ECJj/7JfqfhjIWo
	MYLA2IbFaIIOMxVfRK82TSYhJUDT/Z3oVSxJVcnzyD8g1DGTj3aKXOBTtE08pJcoMw==
X-Gm-Gg: AeBDiev7nAx6Nvr0o8KRZgi3hxfn5MJ3spCzjJ9qErwouxc6vxQyxyAcf4Z0SezWw9Y
	V4dU+vsRcmuJOt6Zo0og7jBukAYSM7z/Vt+VQJQgd/p3/lgUeoW8BEj56hPyuD/sFj/CKJp5Jgo
	VjlMqoxK1Hra3hcKJPsXFzByohhbiNphUx08R1XD7/YvDTR965NAEX7DlW8F+x2dAHHP5CUCq30
	v2AVeQ9V61AB2ZeXjo04gjyzdWHvycLwqC1PYfoj0ygTfkn6gOUba+sK5AO+rJNUfBdrzCQpiNl
	U3Aiqf4xpw+7yzceVJj+U8CyHxAdMZcE0/QAOqoeWtPDOaS6NphvRSqLwvWKaPj4GvUgG8gEVmu
	fxpmwQFJQQDQ0zXfSMwhvAefg1nGHuvwZksut20gAdnXxyhwhvq1bwc8UPWR8W5khsOlpWNiyBR
	Oj9lQIIR1q4NTNC4O9mtoDoazcXRPlLKMCSh550a5UbyHuqTqAekYOx8bsc+RL+dEt8zcwY4bHs
	+K/cbbluk233SQBuVa8y8TAvA==
X-Received: by 2002:a05:600c:4f0c:b0:489:1c1f:35e6 with SMTP id 5b1f17b1804b1-4891c1f38c8mr142508635e9.6.1776783327164;
        Tue, 21 Apr 2026 07:55:27 -0700 (PDT)
Message-ID: <c8e664fd-59f8-482d-ad48-99ff59842682@suse.com>
Date: Tue, 21 Apr 2026 16:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] vpci: add SR-IOV support for DomUs
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <1aaf1a087ca0003d943d43c55500b3ab84195cf5.1775742115.git.mykyta_poturai@epam.com>
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
In-Reply-To: <1aaf1a087ca0003d943d43c55500b3ab84195cf5.1775742115.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776783327-CFD788B7-EC7F7163/0/0
X-purgate-type: clean
X-purgate-size: 848
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4027E43C58F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 16:01, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Emulate guest BAR register values based on PF BAR values for VFs.
> This allows creating a guest view of the normal BAR registers and emulates
> the size and properties as it is done during PCI device enumeration by
> the guest.
> 
> Expose VID/DID and class/revision to the guest.
> 
> Note, that VFs ROM BAR is read-only and is all zeros, but VF may provide
> access to the PFs ROM via emulation and is not implemented.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

So this change is merely to avoid having yet another gap on the road to
DomU support in vPCI? I.e. there's no claim or expectation that VFs
could now be used in DomU-s?

Jan

