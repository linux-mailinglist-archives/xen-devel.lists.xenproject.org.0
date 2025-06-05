Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64847ACE9E8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 08:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006245.1385431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN3sv-0005TW-2T; Thu, 05 Jun 2025 06:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006245.1385431; Thu, 05 Jun 2025 06:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN3su-0005QO-Vn; Thu, 05 Jun 2025 06:15:28 +0000
Received: by outflank-mailman (input) for mailman id 1006245;
 Thu, 05 Jun 2025 06:15:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN3st-0005QI-OI
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 06:15:27 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7882195b-41d4-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 08:15:26 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so4380305e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 23:15:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-235e7322a81sm17043625ad.66.2025.06.04.23.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 23:15:25 -0700 (PDT)
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
X-Inumbo-ID: 7882195b-41d4-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749104125; x=1749708925; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AhHIwwgaIgRJqqWACaKi7GDCYSOcejbHNvKR1zKjwK8=;
        b=F1xmzeNfmsJo+idmjv96NrxqbQEsXRdi1bI5HeBN4Y5DI9WeoxJC/1PV9zV3FMKhfO
         d9VcplYrEKjp5M3uh5pQR1IKDTyEifY62e6z8vhGb/WdUOUpGvjgEJMuXiptFYLJ5Pi4
         XstiGsX19jxhlfxqYqS+/0JR/QZ/TL/PsiKdNGIW5jvrz/LOq0xz6vQoqCHhOikf9Qxp
         b5Mpb8TeyPNEU0aY16HQpWK4NQJ6kzlaUzRSDt3TQLztAtOVyYuAkw8R2PzAyxszhisK
         y0fafI0VoX+cJc7iCPLFDL2Td9oPVEqSxdZvXAvbqSmf1Aq6SZG03ACOiEAdl0ljIQeK
         t34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104125; x=1749708925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhHIwwgaIgRJqqWACaKi7GDCYSOcejbHNvKR1zKjwK8=;
        b=R2Z/JnsPtF6PPzQpcIx/nMPFcvl8+Iyvh2+guBZ6BWrsyTCI5P/VMtGgSeyqr8uETN
         FAeTcFDTHJSQexu8qL2PbaFZ9LvcJV6Yq4JAOD1ESLcLFoJxbNcVzvxKsjQ3RrUvv7H6
         cXOfoXo5yaIrHBEj8vvmZOtMBGftCrCkqazek2CcQkdWQYAQ/UdZrPSL/pRlWlx38wxz
         QzOMQXBXpt4tr2noJXCZshv1h1bn+2LX3v0SxGSgg6GeQsFDxFnXT2jnSNM8DPBAapa/
         alOiM1gorCRe7+NOeqCrOrpZ8UFJT+Iyau1zqhln+4syFeuj2CEsN0jw/CSPT7YI/WXx
         FAdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3kB//ADjEsjt9qF8UeoJMq6NWSQsPfIzX/NDn5PcZrjcXf4F9H5EiVofabfI+6+R7oBtCG/cbQwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxb/Iu/2+457LQe/eo33kYsXrxJMEXWvbnPjxlzmSPvq0ZBvgEV
	QLqMBonuL33gk9Gj7OywYJEEhQhHqAx5zu1TzIr987UkpfDaL6ifUQePjpDthPCQWQ==
X-Gm-Gg: ASbGncv40jyhFxM2aEpFnu4jqMT9Qjl23Z6Y+lEwk8JYtNpSc7M1cIUmQtC1yMz0gqV
	U308y/1HBuaaS9ru0PxOTqnRk+ROwvpiugeEzfsH8+S7/ReWEOHErPLEFGJgVjeHpI2sdYcf5W2
	LextFonGkgKKs1bpeiC+ifAt0+egynIdsc87DpG4w8CdhidLdWxUO/aP+jDjQ8GYltLRD31bCI9
	wFhWObAp7jBS2QfBt7PYuDTr1rAWEJTZ1o0abeks5/JzLiD88DI3d04fRLlXqGjpe0kcs+SqCwa
	oXK0qUqlt1WauJz59ghqHoAdw3sbBElIsMTEk2hl0opn1IahhcN4PYSiAImUviJPzDtjgBT/V6c
	YzRboh40SARbXLR56nZiL3Og7a14dmuAfPI6K
X-Google-Smtp-Source: AGHT+IHTpQz2jONjMnc2ZNbXX0DTzZ44iXVyzIgq7XEY/yF0j6iuEupiYkSykAlztXbBaZbTeyIZTw==
X-Received: by 2002:a05:6000:2489:b0:3a4:ed1e:405b with SMTP id ffacd0b85a97d-3a51d974bddmr4548277f8f.46.1749104125466;
        Wed, 04 Jun 2025 23:15:25 -0700 (PDT)
Message-ID: <8585aaa1-65fc-44cf-822b-d69429d81020@suse.com>
Date: Thu, 5 Jun 2025 08:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen/console: unify printout behavior for UART
 emulators
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250531000417.81750-1-dmukhin@ford.com>
 <20250531000417.81750-3-dmukhin@ford.com>
 <71318dd2-0724-4c2a-9786-40b676411e56@suse.com> <aEDrcJ9JE3p6Xj7Q@kraken>
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
In-Reply-To: <aEDrcJ9JE3p6Xj7Q@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 02:57, dmkhn@proton.me wrote:
> On Wed, Jun 04, 2025 at 12:48:05PM +0200, Jan Beulich wrote:
>> On 31.05.2025 02:04, dmkhn@proton.me wrote:
>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -577,7 +577,7 @@ static int cf_check hvm_print_line(
>>>      if ( (cd->pbuf_idx == (DOMAIN_PBUF_SIZE - 1)) || (c == '\n') )
>>>      {
>>>          cd->pbuf[cd->pbuf_idx] = '\0';
>>> -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
>>> +        guest_printk(cd, "%s\n", cd->pbuf);
>>>          cd->pbuf_idx = 0;
>>>      }
>>
>> Why this and ...
>>
>>> @@ -755,7 +765,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>>>              else
>>>              {
>>>                  cd->pbuf[cd->pbuf_idx] = '\0';
>>> -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf);
>>> +                guest_printk(cd, "%s%s\n", cd->pbuf, kbuf);
>>>                  cd->pbuf_idx = 0;
>>>              }
>>
>> ... this change? There's no compensation for it ...
>>
>>> @@ -1013,12 +1023,21 @@ void printk(const char *fmt, ...)
>>>      va_end(args);
>>>  }
>>>
>>> +/*
>>> + * Print message from the guest on the diagnostic console.
>>> + * Prefixes all messages w/ "(dX)" if domain X does not own physical console
>>> + * focus.
>>> + */
>>>  void guest_printk(const struct domain *d, const char *fmt, ...)
>>>  {
>>>      va_list args;
>>> -    char prefix[16];
>>> +    char prefix[16] = "";
>>> +    struct domain *consd;
>>>
>>> -    snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
>>> +    consd = console_get_domain();
>>> +    if ( consd != d )
>>> +        snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
>>> +    console_put_domain(consd);
>>>
>>>      va_start(args, fmt);
>>>      vprintk_common(fmt, args, prefix);
>>
>> ... here afaics, so it looks like you're undermining rate-limiting of
>> those messages.
> 
> I droppped behavior change for I/O debug port on x86 and HYPERVISOR_console_io
> hypercall.
> 
> But my understanding is that all guest debugging facilities, if enabled, should
> not be rate-limited.

I certainly disagree there. How much rate limiting to apply to guest output is a
matter of the guest_loglvl= command line option. Its default settings are the way
they are for a reason.

Jan

