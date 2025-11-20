Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069D4C748BD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 15:27:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167478.1493782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5cv-0007LD-6b; Thu, 20 Nov 2025 14:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167478.1493782; Thu, 20 Nov 2025 14:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5cv-0007J8-3P; Thu, 20 Nov 2025 14:27:13 +0000
Received: by outflank-mailman (input) for mailman id 1167478;
 Thu, 20 Nov 2025 14:27:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM5ct-0007J2-PL
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 14:27:11 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff294266-c61c-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 15:27:09 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b762de65c07so147126866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 06:27:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fcfd9fsm225001766b.40.2025.11.20.06.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 06:27:07 -0800 (PST)
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
X-Inumbo-ID: ff294266-c61c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763648829; x=1764253629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D7L9EFBQ3o6pcH5dSS+PqsTzFIgQtfRVoBAHf5DCryg=;
        b=DmlQ4cEN1F0RwxfMkSeUvoNZDbOg9ZNIYKBHgNzK93AF46d91GJwJV++wHtRPujVFG
         RfZKst8asPpYO6/cdXURlx06C91PcFkzp4Wee0EYXlPoS657YjakHDvnH3+6iLpbqE+V
         X65zBpoVF09Kr+xvW6Si3V4ku+0Ov70ja5k3vJ62laLHFTLmBmVgStUK4nDhSrQq6nB8
         uLGIBgrk588ELe8soltgj2DScFtEqqH97VjGXAWTAzwmhBwc5KpAy92o7XYWfNwI7Pk9
         EJMvTTlYsDseK5tE6dvdJ4kTCOkg0Ta92zAAu2NB7SWVHYl7wCUxfeKEOfxhb4fBHhGg
         DTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763648829; x=1764253629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7L9EFBQ3o6pcH5dSS+PqsTzFIgQtfRVoBAHf5DCryg=;
        b=g3GlSnQu02n86NKGZC32f4dbcQk6dMZN6LnNxyGqvl1hNFPftNNkfwmMOrFRk6lL3N
         7aQFhj9LT+tcqnYFAp47cOqvFyfgsLC6k+TIAbi+26tE1OsqdTrNP1E+4l/6xYbKhWG8
         Fh5/zNCrifyn3zMuWEPazOnBqE8DudhtdRkhAmIavqSTRQGf9f6LQre/6myN5f0IHnZ7
         oL4AMMwIGuGTXxf8qvBsl3WzFe3ZQPI2xlkiaG4PVZRTgUgX43EVq1npik7RQKHmy2R7
         H9AEhJAZdi3g9VrD49UOpaveHsnAnyjksSv5RYCksZ1KHjRS0lWfjdHZ8sBnt9nhjFTV
         Wsgw==
X-Forwarded-Encrypted: i=1; AJvYcCXNijkyYQswof0KLgQ5NERsAjwxqY1m5rIMZhmczoKbOVQeBbqljiUgttiY35zYq7Cy7FC+/TpIzSs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0nGCAwC92N7/d/RboMA9iEwoDTkFPx6dr4fYXglqH4Rw86fqy
	/lbefu9AxxugyFVCk1HFEEnIJbiw2kYYnUkgxrJyKfSkQUkLY5++mK6USWRlpULc7YQmWqXcMvK
	h6PI=
X-Gm-Gg: ASbGncsjvGeL8tCXIEhKk7ccUl/A0m/gpNTtYt/hPECkRDliCYmkI7rI1oepbdJAaX+
	0apvSM4v5mQVy9bnNJtNflyqhN31B3yvw7m6S1Lp7i96jgi7eDansFAcWg7BPncfzpyRhhkiDH1
	3E9Puld9C3Wv2jrjxATxpONlYgUFkoKdKizVPYrzi77eVKR0xD5EUIqF3nOWGfJJEX+xWBkEGdE
	ZktMEItl000SgGBd3pK3oXcyCQ1kw9PJA+8QBQJxm9Kc9xpEBkHS4b69N5FJfaI0BIugbZPIhS7
	brtGEwkq9dAiMTHVCAQ6wHIVZdur9u66kwEn5D2lNJjUdHzX2bEU02PpKtoWTq2NpTJWUjLns05
	1XiJI6vELu6S/rjarVm046Yx2gZJUt+Jf4ZmxqalgwCxqOKYhvF+Y68xG1RjETwNA1ygXgrN3Xc
	oDzl4CFx41p6Cl5E3V5SJmURZmCYSOkk1C3HrwyOawzxq3E1Kg72fyg46pG9HprLmMLffWeOq2q
	mg=
X-Google-Smtp-Source: AGHT+IGZMKn/CGbMADU0K0ImOp9/OL0dDqjz8f8dP6q6RkmFVXQ7nswXFNTt8xDaF77Tg8w2iiuNpw==
X-Received: by 2002:a17:907:3f1f:b0:b73:467e:47f6 with SMTP id a640c23a62f3a-b7654dd6700mr373990866b.15.1763648828494;
        Thu, 20 Nov 2025 06:27:08 -0800 (PST)
Message-ID: <cd41f345-f5db-4d64-8914-a6984f7fa83e@suse.com>
Date: Thu, 20 Nov 2025 15:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] x86/io-apic: purge usage of logical mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-6-roger.pau@citrix.com>
 <63a4f416-f475-4b6b-8f44-db570b7a75d9@citrix.com>
Content-Language: en-US
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
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
In-Reply-To: <63a4f416-f475-4b6b-8f44-db570b7a75d9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 14:18, Andrew Cooper wrote:
> On 20/11/2025 9:06 am, Roger Pau Monne wrote:
>> The IO-APIC RTEs are unconditionally programmed with physical destination
>> mode, and hence the field to set in the RTE is always physical_dest.
>>
>> Remove the mode parameter from SET_DEST() and take the opportunity to
>> convert it into a function, there's no need for it to be a macro.
>>
>> This is a benign fix, because due to the endianness of x86 the start of the
>> physical_dest and logical_dest fields on the RTE overlap.
> 
> RTEs do not have overlapping fields; it's Xen's abstraction of the
> IO-APIC which is buggy.

I wouldn't put it this negatively. In the old days, ...

> For starters, Xen's IO_APIC_route_entry still only has a 4-bit
> physical_dest field which hasn't been true since the Pentium 4 days. 
> This might explain some of the interrupt bugs we see.

... as you mention here, the two fields were distinct (and hence overlapping).
In a number of places we passed "logical" to SET_DEST() as the middle argument,
thus covering for the too narrow field width of physical_dest. Dropping that
parameter and always using physical_dest requires that field to be widened,
though (or else we'll end up chopping off the top 4 bits, as we already do in
disable_IO_APIC() and unlock_ExtINT_logic() - both benign as long as the CPU
used always has APIC ID 0, which will at least typically be the case, I think).

Jan

