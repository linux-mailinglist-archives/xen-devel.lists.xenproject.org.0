Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B307ACFD45
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007997.1387203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRFU-0006o9-2f; Fri, 06 Jun 2025 07:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007997.1387203; Fri, 06 Jun 2025 07:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRFT-0006mI-Vc; Fri, 06 Jun 2025 07:12:19 +0000
Received: by outflank-mailman (input) for mailman id 1007997;
 Fri, 06 Jun 2025 07:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNRFS-0006m5-5G
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:12:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9426a53b-42a5-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 09:12:17 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-450d668c2a1so20039745e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 00:12:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5ed58d5bsm664288a12.14.2025.06.06.00.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 00:12:16 -0700 (PDT)
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
X-Inumbo-ID: 9426a53b-42a5-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749193937; x=1749798737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JTiPZ9vuQoMWmNUBBOl9xiWho2oF5oPhLBgvl/VL6F0=;
        b=cz1VTrioomRgOCqHecRpbZVorINNaIVgLkbrf/6zTk2KthU1Yjld7fmTls0CRinv3S
         GjetHddPYyrVyBtRw8gZzwgYE8x+zqor9LtA0/GRjMYl+LnuMxp2f9E92pGl73czzSJs
         1MbA8tQBg0vWiK/qTvG+vsCuouUrBnVLLc/FFiZo93XXAgQy6kfQAPHrfr9hz5sWl+LC
         OeSOdCRn4yFzxIu/hg0dpx2mPkIfjWhEX05TwZTR6aCKlBEDpPoUz5+lNBYXYS3tpwRl
         14eiyKMDwlSo9RM514D7vTH78pQswcDKrCFhe6nygSKh02oCeBwhQcsrCSrd+bTitn4D
         xYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749193937; x=1749798737;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTiPZ9vuQoMWmNUBBOl9xiWho2oF5oPhLBgvl/VL6F0=;
        b=vk0z0xa0A6RL2KYu3pgcrMJlSSvEvGEWJ9UgP7PP/CR0xZKjLe4ypf4tpd8NtHqFvA
         c7hXbZsrZ/K7GsZb0wMFmeH1kmUfrzlC96ET6oDAvPGORGt9dIIKVl72Gcy+aC1GPjf1
         OfUFTGLIPbcKZMv7MAx4pJFmUWv8Ukd/mgsVb1k0hMZSDjrEPEtoRbF5IqsBBr9Sz0KR
         yz/68OzO2gXqE0R5W+Ngwmyiexk+so8dj899T3K3ZRUNjrydZKXCd5FjkIYseVWpK0OB
         1PiwWXg1LX8oGl3b8Zr5q2g20dg1byK2FnfzsBcMAop5rY27V6sB1E0IFepbjSUUI8Qo
         M6lA==
X-Gm-Message-State: AOJu0YwY0I4l59I3oK/Qvb9eXcO5Qp2/3pF8OPFrDoxQkvAgP2cW8dlH
	LEeNDA3Nh6WD5aD8i68n4Rd2UAPhCe2O3hOvKBp8O0qtGYdgQ7mdd/3f9JjVQi1Exg==
X-Gm-Gg: ASbGnctez3oiTfg279yPI7QU6En/OJAl0J29l1UPZoykqmsYz+YWxZKFdtG1GnSCl0p
	CumypgLpmur4wK6qKyioczyp9sOSJd8Q9MRkl3oDaAtVqKtKHvhUZkyHKez5revpyMUI3SbnNqv
	9uL0ma1bpEMPaii09Ik4ykbUFhlASCAQ+AwRUmXk9h/lcyj/4OR6jWARnc45S5fdr5LaoklTX+w
	xCkEcnKcgxXKYx1gzb0ST9bp8aiEv8bRAsodReCKnaD49GEsxw07nJIfSSsb78PGg4xTZGht5s9
	kDLjuAXFbw1cYX9/8OGY3asC1fjAOJEK3WoYaCb317+LzSR4y7ay9DFsf4MAg7mC2viGk7ZmBjp
	Te5Za7eJjy1u/jqQVPbGFdqi/hA/Vkw8Nkz3psrHsUxhh4uQ=
X-Google-Smtp-Source: AGHT+IESxVjUJOpbxFmC6PHgIA+KFMj4c99r1EcX22Cfd+aAUhq+l++wtdzA+mPIfZ50Wml3lpv8RA==
X-Received: by 2002:a05:6000:40e1:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3a526e0cc1dmr5996779f8f.18.1749193936654;
        Fri, 06 Jun 2025 00:12:16 -0700 (PDT)
Message-ID: <a3145ba8-3372-4c3a-af39-df8cb84229ef@suse.com>
Date: Fri, 6 Jun 2025 09:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/console: unify printout behavior for UART
 emulators
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20250605004601.1142090-1-dmukhin@ford.com>
 <20250605004601.1142090-3-dmukhin@ford.com>
 <842528df-d0ba-4ab2-b182-b6f824c82dc1@suse.com> <aEKTfxwSZwE78mr5@kraken>
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
In-Reply-To: <aEKTfxwSZwE78mr5@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 09:06, dmkhn@proton.me wrote:
> On Thu, Jun 05, 2025 at 08:18:34AM +0200, Jan Beulich wrote:
>> On 05.06.2025 02:46, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> If virtual UART from domain X prints on the physical console, the behavior is
>>> updated to (see [1]):
>>> - console focus in domain X: do not prefix messages;
>>> - no console focus in domain X: prefix all messages with "(dX)".
>>>
>>> Use guest_printk() without rate-limiting in all current in-hypervisor UART
>>> emulators. That aligns the behavior with debug I/O port 0xe9 handler on x86 and
>>> slightly improves the logging since guest_printk() already prints the domain
>>> ID. guest_printk() was modified to account for console focus ownership.
>>>
>>> Modify guest_console_write() for hardware domain case by adding domain ID to
>>> the message when hwdom does not have console focus.
>>>
>>> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2412121655360.463523@ubuntu-linux-20-04-desktop/
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>> ---
>>> Changes since v1:
>>> - dropped change for debug port and for HYPERVISOR_console_io hypercall
>>
>> Yet then what about ...
>>
>>> --- a/xen/arch/arm/vuart.c
>>> +++ b/xen/arch/arm/vuart.c
>>> @@ -89,7 +89,7 @@ static void vuart_print_char(struct vcpu *v, char c)
>>>          if ( c != '\n' )
>>>              uart->buf[uart->idx++] = '\n';
>>>          uart->buf[uart->idx] = '\0';
>>> -        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
>>> +        guest_printk(d, "%s", uart->buf);
>>>          uart->idx = 0;
>>>      }
>>>      spin_unlock(&uart->lock);
>>
>> ... this dropping of XENLOG_G_DEBUG? In fact I'd have expected such to
>> be _added_ where presently missing.
> 
> vUART is a debugging facility. This flavor of UART is specifically for guest OS
> early boot debugging.
> I think it is not desirable to potentially lose guest messages while doing such
> early guest OS boot debugging.

That is the host admin's decision, not a policy we should enforce.

Jan

