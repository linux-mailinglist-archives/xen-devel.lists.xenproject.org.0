Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C633ACEAC6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 09:18:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006328.1385519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4ra-0001Is-Fh; Thu, 05 Jun 2025 07:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006328.1385519; Thu, 05 Jun 2025 07:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4ra-0001GY-Cj; Thu, 05 Jun 2025 07:18:10 +0000
Received: by outflank-mailman (input) for mailman id 1006328;
 Thu, 05 Jun 2025 07:18:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN4rZ-0001GS-Na
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 07:18:09 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36443da3-41dd-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 09:18:00 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so5323905e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 00:18:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bc8537sm114103595ad.26.2025.06.05.00.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 00:17:59 -0700 (PDT)
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
X-Inumbo-ID: 36443da3-41dd-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749107880; x=1749712680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t3rkpb+NSz/2FWkgizVVfnTh5Y+dQnHK84NxNFRckzY=;
        b=NpkZGVXlYObb7K2QMqkWaRev/17RSHY1JxXtEzOkeJMWpo5M+yHHXA1Hmb5ckJt7QT
         iP8lztyLomnVQjm3qDL+w+carek7pzFY66+fdc5BZhC26Kf3AJAB73bvuFydKbCuG9qZ
         URchJiKs2Fpmt1sa9pNiUq/rf0TO7I2aVnv1aWcIXJYoVWMcGn1gtL0GUz+EUgoBFSMA
         k2WddICD2Kyl2X61RtgUv14wNFZ1Rn0r9CTF/y2LISQkRotCOUBr085aFPaO/seqbN5r
         cQZuu6j8ye4P4+Uz4P7FoFFvsu6O6q0I5r4URtmuu0BtFQjfO9V/j35t5fKBPJG1uI3o
         n2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107880; x=1749712680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3rkpb+NSz/2FWkgizVVfnTh5Y+dQnHK84NxNFRckzY=;
        b=kKAltYwYo/9bCPt8VwoNTpdZQuWjuYIzsJMfuKlJ596oQvemtcE+kpyypQuyC5+x4h
         3qByLUkPgBSxejNem3xusKF2V7JvRM3qACS03wnyM7h4heFtgqlplnMZSsba9LhLxXFV
         l+tSOz/R8k95bYGv6bscJ0Q+j78BFep6TPLSM1xRZFfTBEhrZR1X+VeD6M0ZcBz8OKMx
         QR3sbC5KiOAwUUWTbo0NJs1UGwELqGlByP8bg7nQGs5tvFUAQdKdzCUAa/aUDVp0OGwH
         gXP50nrdXamaTMZs5l1W3RUE9x1cPtdFUS+fNyxQqGpZ80tZAx9pJkdyLZkUkOmtDMbq
         UVjg==
X-Forwarded-Encrypted: i=1; AJvYcCUmC1qLJ1Hl/jhcQgC3QMsFntU+3XyE0BOGUODi/G5qqa6ZfALC4/jJf8pSzjWx4JIq1XezRRxG26U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzobJWN7Z+CEtNZ/bXyp0nKsnGRws0OFwmO9qdF3zCkujZR4q/9
	4nedsXK0rqqeWIxIDJtFZ0soYx7cdkGudp84H2Y5H73Zgb3Aqu8vuESkfVXZ2AJwRg==
X-Gm-Gg: ASbGncsWRy1LGkCB1lZImoZ+3qmfxyvhehS/Kl+KKY1VkJ0mdL+hUxfcDKNlcDBSAHs
	kJj3lkW5Rzo6N3shKBg5RisCRv0yJ/t7lGuHSI/khmOxLmalKivlaZ34+asA8oNZzp2r90bMRX1
	ZH+V/KTcDmU73RAP9QutdLwwKFZZA4xbSvpaNaQTllv8gLj+mj+oyO1cmtYBecYhUpg6pGHkdGY
	g1b02RpqPwBWGjH/3LE/eyaV6Za04pam46Enl5oz5JKO2j7rreFsxs9FJ4Q9PX4JT+go0EWn/q8
	IAfwdkphEYiwIHNrq0m7cu700rB+GKEkAxlNrcoGD3Jhl+GSvtiECZ3ZLXKFe0EiEd2MonoBUKD
	rRYYa3MzcEhKYuJpETrmbtlJbKwh/7Y+1QYRy
X-Google-Smtp-Source: AGHT+IFQ30LGdW7a8Eg2tDU1UjLXNj7pFE3NuxLSuwGwVoN3UgXjOsMqhh4ITqNrNEdUnYz7pgpWnA==
X-Received: by 2002:a5d:64ee:0:b0:3a4:f41d:696e with SMTP id ffacd0b85a97d-3a51d9708b0mr4781030f8f.27.1749107879776;
        Thu, 05 Jun 2025 00:17:59 -0700 (PDT)
Message-ID: <9e3a7b1b-7fbe-428b-888a-c18c95d8ee37@suse.com>
Date: Thu, 5 Jun 2025 09:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/keyhandler: add missing noreturn attribute
To: victorm.lira@amd.com
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?B?Um9nZXIgUGF1IE1vbm7Dg8Kp?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20250604235034.1595881-1-victorm.lira@amd.com>
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
In-Reply-To: <20250604235034.1595881-1-victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 01:49, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Function `reboot_machine' does not return, but lacks the `noreturn' attribute,
> therefore causing a violation of MISRA C Rule 2.1: "A project shall not contain
> unreachable code".

Is this (uniformly) true? Looking at ...

> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -251,7 +251,7 @@ static void cf_check dump_hwdom_registers(unsigned char key)
>      }
>  }
> 
> -static void cf_check reboot_machine(unsigned char key, bool unused)
> +static void noreturn cf_check reboot_machine(unsigned char key, bool unused)
>  {
>      printk("'%c' pressed -> rebooting machine\n", key);
>      machine_restart(0);

... generated code here, I can see that the compiler is perfectly able to
leverage the noreturn that machine_restart() has, resulting in no
unreachable code to be generated. That is - neither in source nor in
binary there is any unreachable code. Therefore I'm having a hard time
seeing what the violation is here.

That said, I certainly don't mind the addition of the (seemingly) missing
attribute. Otoh I wonder whether an attribute the removal of which has no
effect wouldn't count as "dead code" or alike, violating some other rule.

Jan

