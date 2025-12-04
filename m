Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E7ACA300A
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 10:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177444.1501720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5gr-00038v-68; Thu, 04 Dec 2025 09:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177444.1501720; Thu, 04 Dec 2025 09:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5gr-00036U-3J; Thu, 04 Dec 2025 09:31:57 +0000
Received: by outflank-mailman (input) for mailman id 1177444;
 Thu, 04 Dec 2025 09:31:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vR5gq-000359-37
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 09:31:56 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1234a07b-d0f4-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 10:31:54 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so5790585e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 01:31:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479310b8e70sm20908175e9.5.2025.12.04.01.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 01:31:53 -0800 (PST)
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
X-Inumbo-ID: 1234a07b-d0f4-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764840714; x=1765445514; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=up1sLWmb1tJsYJEmq1cqZ3IzyimJLi4b3TqXUWc5gU8=;
        b=DC6a3Ah8PdN7YvrJI3guU8vdm+gTCCebz4GSenIak2KlOUXAu2ZbKB6REo8REiSCjW
         6FNx+QurU/jkiewFioVZanNDIPnakL9rJZEIZMj6E3VJGDbs7i3cQiUCpyARQ9uX+gdV
         JThdy6tZY4QlbhMl+CCbn7ic3f8LJdeFF9+uvxFAeavFTFoxX+v+bTmZmEPZcBOslo6g
         a9LxFzq987fITBRufCmQpGG5Dlf0L7P6GjaNlcTaG2LqS7hwvWjq8eBTJdg9WXtdMuBx
         0F7p3hrhKMqAG3EFOcRFUTFh850qAzYVbtcu0mXpWvd98xl8IdkG7psWsoJ83I3Qu8tU
         ciFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764840714; x=1765445514;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=up1sLWmb1tJsYJEmq1cqZ3IzyimJLi4b3TqXUWc5gU8=;
        b=m9fm+EfBS/ysAUglQOYkSYnLN2OQv4bJ6w1UmQTPrgLp9Dn86Tg4F8gRJXOAxSfzPe
         X4+juInidp09ETSm0ETW+2nOPGcSQyfvKvrtqqDPXTEk4OWmnrSrz02+PeGCqWFudF67
         9ztLBmT3qpoZJJYatyHsgYiS21hzsyUZKJfFydQf0GLKf3whJZoNRW281A9pHAQBeWhT
         ZO0Z9BXEudBBwxbfndhAI/c9D7fxygNca6lLMhaYw8rDBYHV8VZpVZ3H9TePsmc63xzp
         2F0A0reZiZebo+QMORk+TiTC0zGnOVIYQV5N57upWWSPyyUcOq2hpR1onGGsphajU0TZ
         bnJg==
X-Forwarded-Encrypted: i=1; AJvYcCVudJeXshTIY4ugR3ZzNe16j9fLLleH6LjQSS1zDjhA5lBrFA/NWJHyLRl/xi1lxPiHuftjYLoHsgM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFoSvPSHEbkJdeT5qdjQwLRWMz2DM2o9utuNQS4LbdMg3dAqec
	tzLCxQ9J7ZNCJuliMUaQ5Cmsh0uNwApQLIcZVsWC8/YLSR2+Kiflg4tHicu0NBXz1A==
X-Gm-Gg: ASbGncvjyNUgg/rka6cZDd1CnboWiTkVif0Bc06IQsxbPZ2BKbj9ZQ/JJyS5RYSHk3A
	8Xa9d3iygk5l5dGfEXqLovw97FMhMFvqxtRzqbnYZ0uSv8BivC7F15pOraqkGLu/BvJoMKVp2Gv
	xwZaPwdQ9vsC1IUm2OCtcnU4r7pfcF3yKXlp/BptVhJ1Bxz6qwD3uOzsewOdGet49qXqj2TNpqu
	kAfFQW2uXqV6PFABBbhi1Js+Vh6ruZAcXuXXTLBcnjom9yMcUy8ksGEFaOyhfZi52l88CaFln3S
	53A4g7DSI3AGdhgMgSKTXo0a4OinztfMvThKBvMQ8FqLTGC7NNavl0eRW3vXeKkfuWYKsSxdN2S
	hsRLspPYZDCGkYadKinERtXDr/qxUPoi6g/75h++yYQYR9qRcCdNY2JTMMlNi7yDDgBbRFxIeaK
	nrWQksp174dg+wbCqFI3P3iDqE9Isw6QbjiwCMtJm+K4dUI4P5anahJnXdGvbKBb7AS6GTssdv4
	m/NfZaobPjS3A==
X-Google-Smtp-Source: AGHT+IGMEJ+DkqONC/SsjB+n9852gKmHwppncMIjTU+mL43JOZDv3YRKFT8Y1I7a3NHzoeK6q4OKAw==
X-Received: by 2002:a05:600c:4706:b0:477:8ba7:fe17 with SMTP id 5b1f17b1804b1-4792f244c3bmr23145455e9.7.1764840713990;
        Thu, 04 Dec 2025 01:31:53 -0800 (PST)
Message-ID: <835cd913-d280-4c99-af0d-80fcaf23db76@suse.com>
Date: Thu, 4 Dec 2025 10:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: Drop ThumbEE support
To: Julien Grall <julien@xen.org>
Cc: Hans van Kranenburg <hans@knorrie.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Maximilian Engelhardt <maxi@daemonizer.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
 <f081cd84-a626-4b02-8c8b-6c0c0b723b84@xen.org>
 <875a6a6c-f81f-449e-bd57-7e720d07e8a2@citrix.com>
 <9ddb8824-2d88-444e-819a-e46be4b406d1@xen.org>
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
In-Reply-To: <9ddb8824-2d88-444e-819a-e46be4b406d1@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2025 22:02, Julien Grall wrote:
> I agree. Do we need to include the fix in 4.19 (I think Jan asked to cut 
> it tomorrow)? Thanks for sending the patch!

Too late for 4.19.4 now, but 4.19.5 can still get it once ready.

Jan

