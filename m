Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DB3AD2E0F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 08:44:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010493.1388598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOsiF-0006CD-2k; Tue, 10 Jun 2025 06:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010493.1388598; Tue, 10 Jun 2025 06:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOsiE-0006AQ-Vo; Tue, 10 Jun 2025 06:43:58 +0000
Received: by outflank-mailman (input) for mailman id 1010493;
 Tue, 10 Jun 2025 06:43:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOsiD-00069l-Ad
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 06:43:57 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 480b8629-45c6-11f0-a305-13f23c93f187;
 Tue, 10 Jun 2025 08:43:56 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a510432236so3935322f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jun 2025 23:43:56 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4521370961csm130811365e9.22.2025.06.09.23.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 23:43:55 -0700 (PDT)
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
X-Inumbo-ID: 480b8629-45c6-11f0-a305-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749537836; x=1750142636; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0497diRMmIdHmG8eB0z+//O422UTY2BZrz9eG39NyrA=;
        b=Wsq0wTs3npPX1DQrYFzGt3ZHKzfr2deQ0aZTl/XDdwVNYSd1uco1FhoCsyFLuBhb2g
         Ta2ph9gADsvkhAJiStOKf90QKMIjjXF8uEfDX+Z9EXCUKCYadFfl+6YohEqRDHzUn+Lr
         cU1MTAl6YLr6aTz/vCea2z9k5vieFKpEl8dmT3GUF903MtCjxWofporRgZCmoe5NMdn1
         soKFHJ0RIBPgAbB3EugMWslHZw9j1zmz+Xp/qd+BhCXTcERm8R8/rFZv9XGIeGIzjqw0
         H21dvuRfCJ9X4kg9DIG/29efDPLLGDJW2rRPEw1OKjycteMpBaeoohwYsgyW9hmLQnPK
         2+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749537836; x=1750142636;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0497diRMmIdHmG8eB0z+//O422UTY2BZrz9eG39NyrA=;
        b=bERE7y6IFpLw1Z8l3w6Dp/LOy+OGsO/p1AnYe8QyuocBSLRE7Tck6dDK1hTTrxsIr7
         9HeJ99lSUPnYWgX/9ubpzOpaxt3iHY2DprT4g/B7FmRuZs2P5c+YqDa06Vw6CS6YIRKY
         aDbiWPTnO8J1CYfbVW8QleGnzFN7Hko18FX40yLKJK5y+i+UR0iUO0tONzQmrtJ662Vy
         PU7QSYA7VAKBhlKG9nK2fhHIhuz45t8kuk9IJQLEFjZ7bbPbeMG2K65zHySfr+E98J2z
         rjORj2TPmSoyS/ZGn9miA1U87+qM67W9kn9R1Ii0N3JP7J88AF3BCerTPsdKV4W3X7w4
         FSaw==
X-Gm-Message-State: AOJu0YxXrVTiBW56ZMtgWBZY+v4sfR/U3t/nXOaDSpi1hQfOlRscwgLf
	8GLTB/D0mTXzOAak0wnKlWMbqLvznj7Xmgm3aM//ZW7AemmEMdvsy21kJBDnl+Vj4A==
X-Gm-Gg: ASbGncueDFb9qxA8q4kYkmr9HP+7E3JFyIrr1TWiUvRl+B+DzDYbUMNrPOzh9hUUs0c
	4Xvw16IFpfAEiGY9DePsS+dxrPUhAyoQqHh/rLP3Hk3Y5Vw9oViCOox7xxfH238JQIbFXEbArkr
	Oyg0R484WOY9fBl84zjj12NzgRiy/mewMyZJLrHTtGXvb3FtbACr6oHXkRUT0zuEGcuVTKkkXxL
	W0iIFiI1AFXoAungTLt5Ka6+sGacCj2sHoCfQETt5b8M4eqhNI3YQ+zNNk8OuOjGSkECE4AxGg4
	F4eCwdVemtZ6MWcMDoWWvc9XxeYwa40pVQ8TQTX18/HfTw6pB69hK162BWemEu9ekHKM+oFVfET
	+MG9IChrnHd2ZR/jUvmkbPlFbvyXZvfdLJQeJkgmFk4cA0dcjNFUfXBhY0/6mVyRu3wbq5ojrTN
	sFk1Jz8pMa19737P07X2XV
X-Google-Smtp-Source: AGHT+IH+QdtC3LD/N3T/PM3BdTjfK15R74xinuSNxPe1G+V8mDHEDqxP1yPaX4m/hoCXgjQpScIt7g==
X-Received: by 2002:a5d:5c84:0:b0:3a4:fc37:70f5 with SMTP id ffacd0b85a97d-3a531cf1c12mr12249621f8f.58.1749537835811;
        Mon, 09 Jun 2025 23:43:55 -0700 (PDT)
Message-ID: <ba196894-7a02-4daf-b736-dd5f0889188d@suse.com>
Date: Tue, 10 Jun 2025 08:43:55 +0200
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
 <a3145ba8-3372-4c3a-af39-df8cb84229ef@suse.com> <aENFsfo8J5HGg4tN@kraken>
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
In-Reply-To: <aENFsfo8J5HGg4tN@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 21:47, dmkhn@proton.me wrote:
> On Fri, Jun 06, 2025 at 09:12:06AM +0200, Jan Beulich wrote:
>> On 06.06.2025 09:06, dmkhn@proton.me wrote:
>>> On Thu, Jun 05, 2025 at 08:18:34AM +0200, Jan Beulich wrote:
>>>> On 05.06.2025 02:46, dmkhn@proton.me wrote:
>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>>
>>>>> If virtual UART from domain X prints on the physical console, the behavior is
>>>>> updated to (see [1]):
>>>>> - console focus in domain X: do not prefix messages;
>>>>> - no console focus in domain X: prefix all messages with "(dX)".
>>>>>
>>>>> Use guest_printk() without rate-limiting in all current in-hypervisor UART
>>>>> emulators. That aligns the behavior with debug I/O port 0xe9 handler on x86 and
>>>>> slightly improves the logging since guest_printk() already prints the domain
>>>>> ID. guest_printk() was modified to account for console focus ownership.
>>>>>
>>>>> Modify guest_console_write() for hardware domain case by adding domain ID to
>>>>> the message when hwdom does not have console focus.
>>>>>
>>>>> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2412121655360.463523@ubuntu-linux-20-04-desktop/
>>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>>>> ---
>>>>> Changes since v1:
>>>>> - dropped change for debug port and for HYPERVISOR_console_io hypercall
>>>>
>>>> Yet then what about ...
>>>>
>>>>> --- a/xen/arch/arm/vuart.c
>>>>> +++ b/xen/arch/arm/vuart.c
>>>>> @@ -89,7 +89,7 @@ static void vuart_print_char(struct vcpu *v, char c)
>>>>>          if ( c != '\n' )
>>>>>              uart->buf[uart->idx++] = '\n';
>>>>>          uart->buf[uart->idx] = '\0';
>>>>> -        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
>>>>> +        guest_printk(d, "%s", uart->buf);
>>>>>          uart->idx = 0;
>>>>>      }
>>>>>      spin_unlock(&uart->lock);
>>>>
>>>> ... this dropping of XENLOG_G_DEBUG? In fact I'd have expected such to
>>>> be _added_ where presently missing.
>>>
>>> vUART is a debugging facility. This flavor of UART is specifically for guest OS
>>> early boot debugging.
>>> I think it is not desirable to potentially lose guest messages while doing such
>>> early guest OS boot debugging.
>>
>> That is the host admin's decision, not a policy we should enforce.
> 
> re: policy: agreed, I will drop that hunk.
> 
> I think for the policy control, there can be a compile time setting (separate
> patch) which enables/disables the debug output rate-limiting - and that setting
> applies to:
>   - vUARTs (currently vpl011 and "vuart", later ns16550 (x86) and upcoming
>     emulator for RISC-V)
>   - debug port on x86
>   - HYPERVISOR_console_io
> 
> What do you think?

I'm not convinced, but much would depend on the justification for such a change.

Jan

