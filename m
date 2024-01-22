Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6F083645B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669883.1042366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuEA-0007Zw-RC; Mon, 22 Jan 2024 13:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669883.1042366; Mon, 22 Jan 2024 13:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuEA-0007YC-NO; Mon, 22 Jan 2024 13:20:38 +0000
Received: by outflank-mailman (input) for mailman id 669883;
 Mon, 22 Jan 2024 13:20:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRuE9-0007Xw-PU
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:20:37 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07735d03-b929-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 14:20:36 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cd0d05838fso36137851fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 05:20:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 19-20020a056e0211b300b00361a84b89cfsm2495832ilj.51.2024.01.22.05.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 05:20:35 -0800 (PST)
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
X-Inumbo-ID: 07735d03-b929-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705929636; x=1706534436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p7AmNgbJ3zH9PsORNpnlF7F2Mq2+Eedbj8vmjYc7fQI=;
        b=GkHXrFd9jg0gZVVi3hp2qul4isi7M3WjkgBmIb2ji4Xeu+uQBSm9HPIYqaCm+/6ceu
         WXtkrltg4xmaHI1uDnCS/3dKv6rC1dwmCH7CxwQ7OPaLF7oYdZ+f7Or0jdej0imBPOB7
         XMZDDtlyBvW99qLyOmt1gTN+bH0wH7QUdjuENMaCU6k186W22TE3ogN/Bqxsfk2pVcPs
         F0qqGlbONHpAB2+Rth9zW9mhWls+guAqP8wakl0ve6QbWdS0KJIXCSHqZPZWYemcDcyv
         jbb69f4JhnYVjjtxx4wlWvNQ6fhE9VboVd2Z5k/UPsuDQyhn/LmOd0qjeZD7Zrt6ac/V
         sdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705929636; x=1706534436;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7AmNgbJ3zH9PsORNpnlF7F2Mq2+Eedbj8vmjYc7fQI=;
        b=bPrCNxNwvrhhMxcfmYKlYqyoGlwGLL+AQFs5DKJC+++RBor4zrbdzfu4tR3gfCNbNh
         kqXFm0eeQNA2G8Fl8PwOnzJqe1b3qIbnjuTKzWq8HYN1vosu6jNLZPz16sPH98yiYjT2
         S8pXMZSFIink8zPlMiRMli8eEyKeHBGUxeLsBStTJS8C6YJplP79SOaIfsHBaV3GlZ+d
         EwuB58AzCczyRokbBwPTbiPaQnwthIYKvKHFfo3FPFVPDLTKk2BeegXhkVg0a/p4kr1F
         n92lRwxoBMzQCihLNGVZCC1eTrIK7GMlh5+Bk11gx/ae5NJ1biLZGd3IJbYNXzWztYbL
         0vJg==
X-Gm-Message-State: AOJu0YxFeYDrxJ/NEj3fIKbiZlwM6+uCWNs59bdD7m5SnuoMvEiZfzNT
	gCXOi21uo1oHEN2b76XmCpyU9xl3Nh9fnCoOHZ1o5+VDKrbiuzltOiOQ+IviFQ==
X-Google-Smtp-Source: AGHT+IFFvN7zdj9cKRSrZal03jhtIqb0qKOLEy8jlZXt9GwQdU9HThoYmJi1zu85jlRVQFmIakw9nA==
X-Received: by 2002:a2e:9985:0:b0:2cc:eae4:cf4b with SMTP id w5-20020a2e9985000000b002cceae4cf4bmr1583257lji.66.1705929636124;
        Mon, 22 Jan 2024 05:20:36 -0800 (PST)
Message-ID: <49798d43-00c8-40e0-bb65-4f5e699c4d76@suse.com>
Date: Mon, 22 Jan 2024 14:20:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH v5 6/8] PPC: switch entry point annotations to common
 model
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <36004375-1398-4f94-b455-8bfdafe0c9d7@suse.com>
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
In-Reply-To: <36004375-1398-4f94-b455-8bfdafe0c9d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2024 15:38, Jan Beulich wrote:
> Use the generic framework in xen/linkage.h. No change in generated code
> except of course the converted symbols change to be hidden ones.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

The other architectures have been at least partly switched; would be nice
for PPC to follow suit. May I ask for an ack (or otherwise here), please?

Thanks, Jan

