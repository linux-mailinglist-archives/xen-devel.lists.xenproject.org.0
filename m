Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893C69EE5D3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 12:58:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855899.1268688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhov-00006T-LO; Thu, 12 Dec 2024 11:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855899.1268688; Thu, 12 Dec 2024 11:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhov-00004r-Hl; Thu, 12 Dec 2024 11:57:29 +0000
Received: by outflank-mailman (input) for mailman id 855899;
 Thu, 12 Dec 2024 11:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLhou-0008WP-Oo
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 11:57:28 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42208f59-b880-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 12:57:27 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d122cf8e52so841276a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 03:57:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d14c7aaeefsm10521397a12.87.2024.12.12.03.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 03:57:26 -0800 (PST)
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
X-Inumbo-ID: 42208f59-b880-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734004647; x=1734609447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=usKq8skEY+IpS3zo9O1EK2cETBYBqBsvKJLc30SBBAY=;
        b=NtlK0trjTujQYR9Sv7l1zLyjuiaMJCck3MsowEM4tdXQPQEX2Z6ibz+XpCUOFjEWrd
         zBIGq6EHCRuyDph/R6qPR8bCNYL5n6xLnf+2hk1vR3gZ/cqfc6n+Ol11agCVQA5bs9PU
         xgkEtasVZFqV9V5zoZZ8BZXTFaTjYI974LhhCJMo4+s5YkPvJGT2EviZfDhTGtxWplq9
         7Vza2OqNnHGrNWW5xcQI8p1zIIza0ZrmROvk0u1Zun9w8qbiw7MW7vbJYIovZxa7QB+e
         qfEuBtGCdTGIdO/92IiFnjKC2gpilBbte2VslTiMtoCP7vJXzGV6Zo8TkFH4gXoxruoe
         40Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734004647; x=1734609447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usKq8skEY+IpS3zo9O1EK2cETBYBqBsvKJLc30SBBAY=;
        b=W1koE5nrbz+MAPZsyqu6xki6JhXfKlKHfKw/vM9wlhWYl3jMEsSNMm/0TokwrCQGTb
         NeI6s3KO8hXAUUWgZwX0XAk0AmfK31NFLG2T5hCrvRNutKMwnqGmkTnkY0ElvEVSGxWC
         WhLzIE3iQSldWnHBay5pzjozonbjXObpni6UOahQVF7NFvWerKexVzWhUbVh7lEdFNxA
         I55hjrVYU76kW5WISvnr0nqSsQx74k17eBAoblFhaDtQb4JwSOm7e96lzqh730UR6Xbl
         h4tghsanQk/isDVhJZZCM1Aj0J1jZCsNbsESYdt7lkBndIUPU72LpsFDSF7s5jDtGqPg
         vSUw==
X-Gm-Message-State: AOJu0YxGWDT11DeQTqIpoDkCUFQ45uTDvqZpctanhe0LrrJG1I2uj1Za
	3mcj37wRyLZKLtZVxENjjF1i1TI47DrrDyhlFNHC95Rkpt7a1DgX1ur1T7fNZQ==
X-Gm-Gg: ASbGncspaINLyzKL3uQaW4AK2ZhuxCYHDqrpzTxPzNJstxQyVd8kfqwYlz7pbSAnuGc
	skBY8ZUOxR0rFZUmJCYF7PCHZT/ZEgo8xO1QjbjIPS3FGE7ORtxQr1xBKjz6k2P9kvdLfzztz2L
	UKvuALsfTICqlwZz4KKPBdPZDXVqG4tQhzsmxVeejv6CFtMVSqNJiuMiOw9eZXUjvr6G/oGI8Ct
	sMtBtlvayC29T8ht7cdExJhLx3tivhPDTfXh+87Obo7qiVPOsAlXcn92fIDA2OiY7XjhZ4MwZGi
	LspsElxlzlQAATEUSwkILBJdUTeeaC4MC99y7w8esQ==
X-Google-Smtp-Source: AGHT+IGO+RPQ/h17MLOv7YZxSPfHIgyKH7prsAsiPvLcfX/WLyvBnGBiWEEdrHtDnW+KPPnjLs3n/g==
X-Received: by 2002:a05:6402:2106:b0:5d2:723c:a577 with SMTP id 4fb4d7f45d1cf-5d4edce03d7mr893975a12.14.1734004647289;
        Thu, 12 Dec 2024 03:57:27 -0800 (PST)
Message-ID: <8e5ce2dd-f888-42a3-937f-98ed1269c66c@suse.com>
Date: Thu, 12 Dec 2024 12:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/35] xen/console: introduce printk_common()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com>
 <Z1qpk55qKBywx26R@macbook.local>
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
In-Reply-To: <Z1qpk55qKBywx26R@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.12.2024 10:14, Roger Pau Monné wrote:
> On Thu, Dec 05, 2024 at 08:41:46PM -0800, Denis Mukhin via B4 Relay wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Introduce new printk() variant for convenient printouts which skip '(XEN)'
>> prefix on xen console. This is needed for the case when physical console is
>> owned by a domain w/ in-hypervisor UART emulation enabled.
> 
> IIRC the ns8250 can only send or receive one byte (character) at a
> time, so you should likely put that on the console as soon as it's
> received?
> 
> For the hardware domain we explicitly don't buffer writes to the
> console (see guest_console_write() hardware domain special handling).
> 
> I wonder however how you deal with domains that don't have the console
> focus (ie: != console_rx), as for those I think you still want to use
> the (d<domid>) prefix?

Imo no matter what domain has the focus, the (d<domid>) prefix should
always be logged. Just to avoid possible confusion.

Jan

