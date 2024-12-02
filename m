Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EB89E012A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 13:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846613.1261769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI56H-0008Lo-3p; Mon, 02 Dec 2024 12:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846613.1261769; Mon, 02 Dec 2024 12:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI56H-0008KL-0p; Mon, 02 Dec 2024 12:00:25 +0000
Received: by outflank-mailman (input) for mailman id 846613;
 Mon, 02 Dec 2024 12:00:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI56E-0008KB-Uz
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 12:00:22 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00c392a8-b0a5-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 13:00:20 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385e25c5d75so1432099f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 04:00:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385f8448d32sm824502f8f.96.2024.12.02.04.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 04:00:18 -0800 (PST)
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
X-Inumbo-ID: 00c392a8-b0a5-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmMiLCJoZWxvIjoibWFpbC13cjEteDQyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAwYzM5MmE4LWIwYTUtMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTQwODIwLjI4Mzk0NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733140819; x=1733745619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4b96tTSo18/UJ5vXpie39GiiFQDkPf0RfaBo0sXQzKE=;
        b=PmmFNDU30Z/ig/hwEWDZYDft5mO6W8YzNEVnRI0GR0t+CdLJ5nkrir89StuJx7c6pN
         G6ds4Dder7NfYttydjdZK7tWPM7nYakk0PsyNvX+jFykHmlfcmcJVziAP6mu7Qmj0pXO
         7pKlSs8zVnNW8WrGTVtiNvShguKn9Yd0bcovpxBRXC78GPpOSkJxfB3BVrB3Vz+NXmCD
         m6xJ8j37dnxKl989qmOJD3gHRFV7QdMrzd0h+t1Qry9Z6mRQYbGvnf3hvM87N/PvyqQ/
         PTY1u+4G4HQMNPF0fa26Ou8P1BV6r16s8bepVlIpl5uJoS/v+Y3ldqvdtdIBYU0TqLAq
         TkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733140819; x=1733745619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4b96tTSo18/UJ5vXpie39GiiFQDkPf0RfaBo0sXQzKE=;
        b=uWnE8nUOjJRl9MY2pL50kLmR5DuNg4D+d770Gr+Hiw5OTph/P0Ea1h4NVDXK8vNPid
         KZsXn5hiObRbotMPGBFLljYLOP5osn/784Z4tabSRXuVNmH/jVVPrOeJ0GbrhXKO8Ftg
         bxuic4RWN4cqhROejEqUdHVtVS9zgaEY1pGXhtZGN6iNqOH32OMPe1J3Nc5oKHH+tEA2
         hIVLsYl7/SI0W7P4OeNeepm5/fLxReY+JOvLuJDLHeU4GyWMlguI8BoxOk5HeuQt6xGc
         OzoJHxuopMis6HmDTYO7sVGhhn+Upcgid6Ltm/8QVq0U6DbJRUhooNrqKOPX5kJpc59A
         5/Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW0ylp+VRm7DSHXXcEC/75lvxY79bXYnazSiFcikeB4M6xschXs5gYw2fu2mtow52mXRaKvKfN5Bi8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhHjVAmAvuihUduu4zX8XTKY3rIUrWTjF/8IMK5vqDbDamd55w
	e2yjawzYnBvfS2E/XrB8Br47iUwFx4P2esFNSmRbrov0GJ4Ult+kuxCQKd43DQ==
X-Gm-Gg: ASbGncsWw51ue2MLYmbs0dnevqQZGDpKY5hQh0rgF3u0bO9pRza+YLo4CdxJtZxVBQz
	fps/1YpCuwaBF8fyTxwXs7pSV6xR4CzleXXrlB6y52w7TUSRQDAEwyZxMMY0rp/3LY7BUrv3gjn
	Ln7u8piPGdqanvfYzurhyR3eQ5gjdZEGdZi/qNzR3bm+lBStV3r/jsR2lS+yQ2/S4xUSwvAXbTf
	AZnpcE6vxosgDbW1naecRt7OnMvk2FbJ1rpRU7XkNEpnqjoBctgDTXeL2sl3IoGbpIorKM5fN1A
	08yy7yywIczjB3K2YXdobId7ju5i7B2Gus8=
X-Google-Smtp-Source: AGHT+IFAy7vm/qZ68W05kBIAmoDwdHgtnv6bA9nn1qAC3gFO+DCF18Cuu2KyjmKkTX0U6TZNWVGKOg==
X-Received: by 2002:a5d:6f09:0:b0:385:eecb:6f02 with SMTP id ffacd0b85a97d-385eecb7143mr4456149f8f.28.1733140819629;
        Mon, 02 Dec 2024 04:00:19 -0800 (PST)
Message-ID: <4dbd5882-0724-4023-9c0e-43c82eba2b80@suse.com>
Date: Mon, 2 Dec 2024 13:00:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/hyperlaunch: add domain id parsing to domain
 config
To: Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-12-dpsmith@apertussolutions.com>
 <99177823-38d9-4aca-af84-150ae6f37a25@amd.com>
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
In-Reply-To: <99177823-38d9-4aca-af84-150ae6f37a25@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2024 00:45, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> @@ -186,6 +209,12 @@ static int __init process_domain_node(
>>           return -EFAULT;
>>       }
>>   
>> +    if ( bd->domid == DOMID_INVALID )
>> +        bd->domid = get_initial_domain_id();
>> +    else
>> +        if ( bd->domid != get_initial_domain_id() )
> 
> single line "else if"?

Yes.

>> +            printk(XENLOG_WARNING "WARN: unsuported booting not using initial domid\n");
> 
> "unsupported"
> 
> Maybe "Booting without initial domid not supported"?

Plus the line then wants splitting after XENLOG_WARNING.

Jan

