Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59742A91F6F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957804.1350833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Q86-00026J-GI; Thu, 17 Apr 2025 14:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957804.1350833; Thu, 17 Apr 2025 14:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Q86-00023y-Db; Thu, 17 Apr 2025 14:22:14 +0000
Received: by outflank-mailman (input) for mailman id 957804;
 Thu, 17 Apr 2025 14:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5Q85-00023s-4w
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:22:13 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59cac851-1b97-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 16:22:11 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39ee57c0b8cso858324f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:22:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c7a894242asm1176275085a.21.2025.04.17.07.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 07:22:10 -0700 (PDT)
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
X-Inumbo-ID: 59cac851-1b97-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744899730; x=1745504530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PpRiUxxVaEuE2HSoJN29KkDYD/p+86L1y1Xdcz4dohA=;
        b=RRuXLDx09DO5eMaTMIpwUpxi+l6GNmR03KXG1fk2QgZdgN7oEgHuMIjB/TCko+QADd
         6ISXpaA1TzWJ7kq6eMZoVj9gCKLc2eb7xwIjcdEGMG0e3hH9pt9LrWijDBnjsdK0UslO
         mK8ngziFEPWF9OmrLVETD54pyGz3g0MOLIeILyyfTahTXVwAxcJ1bWyFyCsYeLr6vBf5
         Q3MTtZRr4WnQmrlzAUZsMsL8onh97w306/hdDo3GBBz1n5NQNFmVjcC6uTzmuG5BlolS
         UkpK2VUXrY0My+QRNufP9EBOHsDbb3ehlfWs6cbbMUss/m6BXKPkPJZGV59HmvVzOIHk
         x9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899730; x=1745504530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpRiUxxVaEuE2HSoJN29KkDYD/p+86L1y1Xdcz4dohA=;
        b=vke09ERGXerHZn+LfeTMzuUBNcWHaqGHubLd3wHrRheRq73FpA+VjLZdiPTuifT1m5
         ultAxGePTgWDEPTTdZmAQZJ4KX7q150sGSl2dmLn6eFBbh74I1CDsbNsSFI61jdZCrOP
         uUHo6GfVgl9Taimw9pZBjnEBH04Pa1aMdj/XBcfARPVJ9EqYT/7FwzNQU3rmFVZ+w/lR
         Gn2rOEhO9wqBrRzhG413n4QWi0EeYNrS7li+fe+5/klNiJd+gWItVCl4PBBbQjkUeiuZ
         uAo2xAiHkEAwjvDkRxcpobH8U2kBu6Z3oF4YHXEBJ922HJICfyoBGlXqhwS1f2ZB6XhQ
         gWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaUM0k+GCzEhVrMH4+wsYWREwkzM+A/BQTK8xJMlrEYhOOmHFplAlt4jXd2ssLOZVZH3Q9z8SwLDk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNBxkEwWlbKf3NAOY1pwUQkNS3+pfkkAw52qQX1knKaShzeYgG
	T8rB1R3ENp5Rbn3k0B+h9flact4Cz29ipqjIhWuygbSPiw0krpQeXGqvFRAMBw==
X-Gm-Gg: ASbGncu7HC5Ytf8MYSvPoPdKg16BPa152wa2Qo9BvHNKORw48olAt29FdTuc+AW8FL6
	3+nIqGXvL9wYuHWxeAfym/WqjY/ilFfTZ3HtTiux6omyWK+gbQ4RP/NI05s14gBVjtxcpww6vMj
	xcQzWZygibc/yWLuYzZPoW4eHqrGIYJmhQtt/t8cor1YpCe0OnNQb4rjGzy2BkuxWhSUywn0yQ8
	Fi9WiEfQ4vAHxnK2uaSjbSrwgebDWnz60PyfLBqxuIkDy142oE30Ut30qdNEjuMyin/GQoCAsPH
	SU8MJr8UbwdR1jUIZcjSuSWuJioceUENaWEiV+WSyCIiysLRuDB/W9XfTg/lLhlJI+vcp9iNm/3
	RDLI6RF0oMNPxZRpvomH3A/Wopw==
X-Google-Smtp-Source: AGHT+IHvy838ePYeIB9GDBQ5EemhJxOLcvp82KteNM0EqwJplf+411esDyUNCmNKAKj08MWkDHllsQ==
X-Received: by 2002:a05:6000:2505:b0:39a:c9fe:f069 with SMTP id ffacd0b85a97d-39ee5b373d3mr5231230f8f.30.1744899730441;
        Thu, 17 Apr 2025 07:22:10 -0700 (PDT)
Message-ID: <0e451481-9543-4c35-b8fd-886ff838b2fd@suse.com>
Date: Thu, 17 Apr 2025 16:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/io: provide helpers for multi size MMIO
 accesses
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250415153246.81688-1-roger.pau@citrix.com>
 <20250415153246.81688-2-roger.pau@citrix.com>
 <1c4f6304-a272-4fb2-8892-43118d080641@suse.com>
 <aAENSnhKDQHQERgl@macbook.lan>
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
In-Reply-To: <aAENSnhKDQHQERgl@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.04.2025 16:16, Roger Pau Monné wrote:
> On Thu, Apr 17, 2025 at 09:43:09AM +0200, Jan Beulich wrote:
>> On 15.04.2025 17:32, Roger Pau Monne wrote:
>>> @@ -5115,7 +5115,6 @@ static void subpage_mmio_write_emulate(
>>>  
>>>      if ( test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
>>>      {
>>> - write_ignored:
>>>          gprintk(XENLOG_WARNING,
>>>                  "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
>>>                  mfn_x(mfn), offset, len);
>>> @@ -5131,26 +5130,7 @@ static void subpage_mmio_write_emulate(
>>>          return;
>>>      }
>>>  
>>> -    addr += offset;
>>> -    switch ( len )
>>> -    {
>>> -    case 1:
>>> -        writeb(*(const uint8_t*)data, addr);
>>> -        break;
>>> -    case 2:
>>> -        writew(*(const uint16_t*)data, addr);
>>> -        break;
>>> -    case 4:
>>> -        writel(*(const uint32_t*)data, addr);
>>> -        break;
>>> -    case 8:
>>> -        writeq(*(const uint64_t*)data, addr);
>>> -        break;
>>> -    default:
>>> -        /* mmio_ro_emulated_write() already validated the size */
>>> -        ASSERT_UNREACHABLE();
>>> -        goto write_ignored;
>>> -    }
>>> +    write_mmio(addr + offset, data, len);
>>>  }
>>
>> Should probably have noticed this on v1 already: The log message is now lost
>> for the write-ignored case. It looks easy enough to have the function return
>> a boolean indicating "done", to retain original behavior here.
> 
> Hm, I didn't seem to me the message wants conserving, as it's
> unreachable code.  I can try to add again, but we don't print such
> message in other cases.

This sub-page stuff is special, but I wouldn't mind if we dropped the
message altogether. The "unreachable code" argument is slightly weak,
as it's in particular when the assumption is violated that we would
want to know about it.

Jan

