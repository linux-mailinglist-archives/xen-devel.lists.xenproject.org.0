Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6E59ECB1A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 12:25:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854638.1267797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKpt-0007zJ-UJ; Wed, 11 Dec 2024 11:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854638.1267797; Wed, 11 Dec 2024 11:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKpt-0007xq-RH; Wed, 11 Dec 2024 11:24:57 +0000
Received: by outflank-mailman (input) for mailman id 854638;
 Wed, 11 Dec 2024 11:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLKpt-0007xk-6H
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 11:24:57 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bdfb97d-b7b2-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 12:24:55 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3862d161947so3213040f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 03:24:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd41ff3e42sm5315773a12.66.2024.12.11.03.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 03:24:54 -0800 (PST)
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
X-Inumbo-ID: 8bdfb97d-b7b2-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733916294; x=1734521094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uEOy6GUTe9DcIrZM/FqY1amRjFDGbsZuoJuVNsttO5c=;
        b=I1iFrhispkLmezTdxgHkVl0zi6JXa9RCqjBAuTbQ1F1rvn2eFDNP940sIl/kWPYPwl
         TFSZrVi+cdIkbVHdzv413wkVr1upJUmgvZIZJ/QREkFH3vGW459612cmLzj1EFRpSPAw
         yP7psEBHr6AZMeu1Ww8FPB/+5L77wPtrqYK/VdT/QHWofmG2s7UpFqZBV1s+OgR7QicG
         EK5VF2b52eCJ5lVPBJ5ZZf0UZT3+bJb1q3YIRp355a8ZqRZBMSrRtvQqMSVo6XIiQgtY
         NbhiiSvUWBEIrJGuOvbBtpxqenP3GayIroDa5E7R4uoJCPZukMtXPtKWNHm6nF2eGu1a
         VAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916294; x=1734521094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEOy6GUTe9DcIrZM/FqY1amRjFDGbsZuoJuVNsttO5c=;
        b=K3gYeiPSNXHyZrDuVzmXyNtKd5GsSflJNxbXy1sxr8GI9f1gK7+DVnO/GUwhNhiUKk
         TBDG7+zRzOqYg6CmSvKpwssbjiZ+w5q5OqRUMNjnt7gIRHb3/e8vfCJYcd5u/6j1z63H
         nQjUMwj2rS3UpFtWLeyKOfT2J4q34XWp2HBI5EAtoFZuMLb9kUzK6yDRBXkqVrBNH5CG
         jlYe+tWfm25m6cBH3eOg/EY9vksRYvLd0hXsveJvxZeW3Jf34e0csBV2GXvNVUIThoEb
         hXx61cXMdi+tYirg33Vv1vdaU/BdeFY7wqeyhmSvg2RjlZBwyqvoY3+4VZgRVMyNi6dQ
         X/DA==
X-Forwarded-Encrypted: i=1; AJvYcCX4Yxhq56+8shMx+02Hoa1+qK9pZ9kCfWo0y3RGI40aP0WJhY0U+Ga13JMkkFDbvzcr8mKI4fBYllg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2jYZGXL2/Kz4y5NB3tgxkRdyonMtWkdMs2XmFvrVbRQmDlVhx
	CI1To+EJfpyoAPZyTMunHGd8C1PadP5VDds7C4QZ/gWTebhkfg+cF2laVuQUHQ==
X-Gm-Gg: ASbGncsGVPuJtl5+bvjLSzl82lMsqcbjQPTllS+FOl5KV+AyhMHs9uEEFYg7W1gUhDi
	ITO6rGBdDNPuF9+wx+B/PRRIBnPc0oc5IGi7OwC5rsY0EBRBVY+1XoPmlWMkhBiWFVPopwL05OK
	Qfoj81hb5o3xW3ertEwqtr1JeTV314mKMB5iqXelYM7CapnT/3p7I2lrl3fv8+IDyCY3Ve+BdBg
	CD8uy3jts81fx4OVjQTFSLh3x9a9A6JpO9bY1rcp12CxUP6l4m/cq9aIkYQGW5OCHGyUq6AFWR+
	dHg/hIyXDHd3vzFLwJ68gFeAMlZCDZW2WXsGo9s=
X-Google-Smtp-Source: AGHT+IHSkUmhnIRGJjWHsZUlSQIE6ZcKlxR20+lwKTRXEsCbQeOZVk7IQ8235ZtZ+Y4r799QN9pDJA==
X-Received: by 2002:a05:6000:42c5:b0:386:3dad:8147 with SMTP id ffacd0b85a97d-3864ce6e6f2mr1190089f8f.32.1733916294683;
        Wed, 11 Dec 2024 03:24:54 -0800 (PST)
Message-ID: <e413574c-f7ab-428c-a95c-30a73c0f30c8@suse.com>
Date: Wed, 11 Dec 2024 12:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule R11.1.
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <8db58416ce215a3c5fdba8074dc21f32116e8a41.1733915076.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <8db58416ce215a3c5fdba8074dc21f32116e8a41.1733915076.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 12:05, Alessandro Zucchelli wrote:
> Rule 11.1 states as following: "Conversions shall not be performed
> between a pointer to a function and any other type".
> 
> In "xen/common/bug.c", in order to get additional debug information,
> pointer "bug_fn_t *fn" in the data section is converted to a function
> pointer, which is then used to get such information.

If the pointer converted pointed into the data section, it would fault
upon being used to call what it points to, for the lack of execute
permissions there.

The change itself looks okay to me, but the description imo needs
updating, to be as precise as possible.

Jan

