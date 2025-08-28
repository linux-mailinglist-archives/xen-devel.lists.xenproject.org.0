Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B77AB39749
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 10:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097785.1451995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYCr-0005VI-Iq; Thu, 28 Aug 2025 08:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097785.1451995; Thu, 28 Aug 2025 08:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYCr-0005Tp-F7; Thu, 28 Aug 2025 08:42:05 +0000
Received: by outflank-mailman (input) for mailman id 1097785;
 Thu, 28 Aug 2025 08:42:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urYCp-0005Tj-Te
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 08:42:03 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de611f6d-83ea-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 10:42:02 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-61cebce2f78so209689a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 01:42:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cbabf816dsm2454376a12.21.2025.08.28.01.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 01:42:01 -0700 (PDT)
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
X-Inumbo-ID: de611f6d-83ea-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756370522; x=1756975322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Wcpp0vQrg94lHJGRgm8P/44drSFfisXzKQaSwMvnVg=;
        b=CiHxdEUk6xjoduP8lOkaMwULDxOldstiulQu+d2sXLdM/xFZ2VoSjyT1dhNBNsQJuS
         bYG4W0fqiZ2I61Jva8OSYZPvtPnl0qknolQrHkQT7zDb2vSq9Fzb/C3VWtGai4QulRMv
         +4Eo9xf7C+KxB0oVXcsx9v2XSK7mnCepZn3+32/oS8WjtK96fcg3cWYYDfEZQQqt/Gi0
         FItb7OERumImp3A3I13SDdMVQss4IYSm9YWze9LDbhFvF2wG0l4zRZ4r5wsJ2St0entr
         8W8JRqPaogzyZH9Ae0a68Cx2Oi3b1qVIr2vz/Gi7bjK/wfrZF8Brqwm5xZF2d1rna4M4
         2pKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756370522; x=1756975322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Wcpp0vQrg94lHJGRgm8P/44drSFfisXzKQaSwMvnVg=;
        b=ou8b7MFJzxsUm7b34/Mqn2NPPScJbcQ/W873qtUCHLVM1xk3JXRzoL3NjlR4pgQR61
         zaXsgPlVL/TvxP2V3ksTiCRONt5AoCjB5kP9WDaGw+F9qRoueHp8skZL3QnKgRoH5D0a
         inQ5sbc86caNRW5MLrF3BS8TQnu7BSmsagpOw2pM5Z1RmbbJbKRzRdCZN84CYGkh4Mms
         D70qToCiFigMt/MpZLXqcc/2fODEuygOW6JydQucladmzVNg7kqKvWFpV6pAsh0QisAB
         oxQgOpxnXZ29gh5VftxCIvFy26YURlXzYMEaxD3/XqZs6LmBL4hj5eioKcsb7H7jGUA0
         uJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCXP6+i2x/cxKfG9wNSVKyrTuUTbDIw3u77HH1bCsPIW1PNXXkHRse82AVG0Txb1uPUWv0Cdow5DyVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoSmpEJj3solggG5DIDrpe8QReuTOePuClXaM/OJmIOAVVM2UE
	L4TkLcz8PIlWDGtp+0GqDdvQ9AzxGT3OOZ6jlXSEkrFXwwweTvC+BoDAE3GKMUbuLQ==
X-Gm-Gg: ASbGncsNMrB5eVHSe755JndQ+gyIE/DSirXxW1wXkZs1vpfZkQBmemHdE27/1D6ek3y
	A2tYmr9p3Jg03t/c2PL91d/jVJkD5eCbvFsZmpW5hgIhIAe1cLFQj2O1B/zoXbzynKyHupM8X3x
	p1vpueM06nGfsqYyIvrcjtZ11PUE+Hjr6z4lpEtUv8qgUzTteUY4IO7SnWUQMUeGOSsItlPhciW
	gpuC8JB+brLmyGNxmOg4mkoBvRioD0HkJVxgEfboDGN1kKoDvyCEMQ4rxRmz2xLP0PZIGhS9xcF
	At8cSJs24TqyT3LhPmvUlS6h0aJ65EMda3HwRbiASpmMbIFESbxiCMkx81k966qhf68udYdg922
	BR2cXEuwSrkEURlaF6qqZeqBVmUXuFLwkiLGcKrnDORLHq2rCddGHZLeGv65Fy5sA4Jhuh7+FBa
	uTTVq59Ug=
X-Google-Smtp-Source: AGHT+IG9V2/H1qp97Ban48596nKW2MJX8cuOPXDfodb0WGr2R7tZd8uqgZFZBRolR6ZddHlBzj9DTw==
X-Received: by 2002:a05:6402:2549:b0:61c:9852:bbbd with SMTP id 4fb4d7f45d1cf-61c9852beb9mr6595245a12.34.1756370521970;
        Thu, 28 Aug 2025 01:42:01 -0700 (PDT)
Message-ID: <72b403be-bfaf-497f-90c8-d1cc9ff84ce8@suse.com>
Date: Thu, 28 Aug 2025 10:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d7768394209c65cfef4006c3ffc0a0f5d82c4c18.1756368997.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <d7768394209c65cfef4006c3ffc0a0f5d82c4c18.1756368997.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 10:17, Dmytro Prokopchuk1 wrote:
> Resolve infinite loop issue in the 'fail:' cleanup path of the function
> 'assign_shared_memory()'. The issue was caused by an 'unsigned long' type
> for the loop counter 'i', which could underflow and wrap around, violating
> termination conditions.
> Change 'i' to a signed data type ('long') to ensure safe termination of
> the 'while (--i >= 0)' loop.

If I was a maintainer of this code, I would strongly object to such a change.
A signed type variable used as (effectively) an array index is almost always
conceptually wrong. Plus i continues to be compared to nr_pages, which still
is of an unsigned type.

What imo wants changing instead is the use of the variable:

 fail:
    while ( i-- > 0 )
        put_page_nr(page + i, nr_borrowers);

or yet more simply

 fail:
    while ( i-- )
        put_page_nr(page + i, nr_borrowers);

See e.g. prepare_staticmem_pages() for a similar case.

Jan

