Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E323C86CB93
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 15:28:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687181.1070208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhOV-0004SX-O3; Thu, 29 Feb 2024 14:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687181.1070208; Thu, 29 Feb 2024 14:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhOV-0004QC-LR; Thu, 29 Feb 2024 14:28:19 +0000
Received: by outflank-mailman (input) for mailman id 687181;
 Thu, 29 Feb 2024 14:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfhOU-0004Q6-IW
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 14:28:18 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7af538a-d70e-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 15:28:17 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-565a3910f86so1564538a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 06:28:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h2-20020a0564020e8200b005653439cadcsm662894eda.25.2024.02.29.06.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 06:28:16 -0800 (PST)
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
X-Inumbo-ID: c7af538a-d70e-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709216897; x=1709821697; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3W/0jISBokMHOR0jW03nKtLF0I9Wu2tJsHJKhuUaHk=;
        b=cwJniDIy+jz5jXaY4PX+wKRxVWb7OnslZSWeY3cmLDkh7PygaRblnDmXv8YUoZ5HHN
         r2hBBPxPZWkrffSe6zzbZKuRGgfuEwvR+mgu5cSSPVDMFF03pvsVj6GAoMbp9j+/t99v
         3cCPdLrGNvXPlyhfL8rMIrmfFX5mAay84JTAIHhMSbXgJgLu7M8iSsqB1wTGB+kZPqTj
         kpa++4W1pLakI7HLQzWJ0XvMS9iD6mABS3ihsonDGhGGxRiBg92Wa3BAOf7D0zE9ueUz
         O72Q1CV7+rP1v+xfa3b/pPgF+4WxApt77daSAOfEwZNjhygGIaor2szmF9C5pFyW53R0
         OQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709216897; x=1709821697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3W/0jISBokMHOR0jW03nKtLF0I9Wu2tJsHJKhuUaHk=;
        b=auiCyzpiFUWw9fYdyhtdAmX8PTGiPENNVw0gpk6ed0ziSIPftT3EvvF0jsZu/TklpD
         2SL9PwZ51Cce/EZxXmBJRdrG5lLPtBmIen7gYvCg6QAG/ud2wvukbneXKMh6jvDnqzYC
         PYMv7MAjJVB2KKMPlznlTydSuqd9zTWecsm2FTtHDO0vupXK/B2iU6gSkfTi/HrmEYB5
         IYaxPIB3/HT/+VB3GNb6LL7yezqZtz87vtia08K3BdADYkMAQTFhH+qsCayYWLVaFoJk
         oR0+Ra1kxd/VOn7+c/rsm1xOa+eRl6Sw64bbUayadu/t4s0+IhW0EkVZFPuYc2GPvnjn
         ROEw==
X-Forwarded-Encrypted: i=1; AJvYcCXKna5bAUdzlJzPY5NGK0mfRWgMjtsB97QKWYB2GHcI2Xz1gDtc3fCZrcL2imw75qSeqfoiCLB78wZusmzl40Hm5J6ULxcpVgcfYGJfrK8=
X-Gm-Message-State: AOJu0Yx7W/01efItOqBDGEeIf3BUt8CjrDCRhrCRZM1nnl3DlWoCVsvc
	yhmDld/0xbBnaEXZo/79J377OG+0K1jGMjttBrzX8xswwX/BPKq3TGIgQVnrUQ==
X-Google-Smtp-Source: AGHT+IHxz2PKqhrTMzysxz0ryH9Zq3DbFrfJHpUto2xJBRZsGkcKIbprSpxkR4m05ppcA+wv04P6iw==
X-Received: by 2002:a50:cc46:0:b0:565:1815:dfc5 with SMTP id n6-20020a50cc46000000b005651815dfc5mr1555654edi.0.1709216897152;
        Thu, 29 Feb 2024 06:28:17 -0800 (PST)
Message-ID: <51df7369-b77b-4e48-8759-b736358cd06a@suse.com>
Date: Thu, 29 Feb 2024 15:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] README: bump minimum required clang/llvm version
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <20240229095529.17723-1-roger.pau@citrix.com>
 <20240229095529.17723-2-roger.pau@citrix.com>
 <780ec3ab-08e3-4fd8-a85f-0e89ea75dcc8@suse.com> <ZeB7S6i7pIwzkUNE@macbook>
 <78032daf-9052-4ab8-ba05-456fa4aee17b@suse.com>
 <132dde96-d7d3-4823-8a0e-7b4a62526f2e@suse.com> <ZeCS0OC4FsbEXo8S@macbook>
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
In-Reply-To: <ZeCS0OC4FsbEXo8S@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 15:21, Roger Pau Monné wrote:
> On Thu, Feb 29, 2024 at 02:12:26PM +0100, Jan Beulich wrote:
>> Bah, that's not even Clang, only LLVM.
> 
> I'm confused by this, doesn't your llvm package include clang?

No, there are quite a few RPMs in general in SLES to cover everything,
yet on the distro in question the clang* one(s) are (is) missing.

Jan

