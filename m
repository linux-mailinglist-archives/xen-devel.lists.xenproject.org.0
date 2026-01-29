Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id X32TMzmAe2mQFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:43:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A82B1979
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:43:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216764.1526700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUBH-00047I-1J; Thu, 29 Jan 2026 15:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216764.1526700; Thu, 29 Jan 2026 15:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUBG-00044q-U7; Thu, 29 Jan 2026 15:43:38 +0000
Received: by outflank-mailman (input) for mailman id 1216764;
 Thu, 29 Jan 2026 15:43:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlUBG-00044k-5s
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 15:43:38 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45d15303-fd29-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 16:43:35 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso10205025e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 07:43:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5d64e84sm6934505e9.8.2026.01.29.07.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 07:43:34 -0800 (PST)
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
X-Inumbo-ID: 45d15303-fd29-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769701415; x=1770306215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K3M0D+2vMkG/JiL3ryK/fSU6dBdjb9kIbYCGZYfg1yE=;
        b=XwTSLMOzxr6kI4Mt1rPWgEju8nfAzKd7i/6YNpXUafC9moMrH8799Xd2yCQsQwpJG8
         T3x2SyOZKcJnMFEvosAEelzShmXZjWy1IwJRTUwpiFYywMyylBm9WM6s8gVoE+kulW+l
         nniEy+hsdDIIY9iu7eqjMgI17GqHY7RLAPL8LsmWaIw3pqYjydn9Nw+Th9q8sKPozKo2
         KO2HfBabkSPtvherynKN0IOvvojVwpYwtVNtB9q/kravtAW1YDZr7eysPYmIDplwjw+Y
         9VQ0CKE9mc2r410UPusnQFjaEkmXvj3dW6VBsmqMdBNvunvCT2WwvAoXgKvESBLgAw8h
         wK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769701415; x=1770306215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3M0D+2vMkG/JiL3ryK/fSU6dBdjb9kIbYCGZYfg1yE=;
        b=Bl5WsoLQbUiPiqKkvU6GqAZZvbO1ZYujMA4jsnUQdQMu4XZP99kPDFhiAtgqHbQgfE
         Owo/zVY1ofL5A/PaESA9RZxLLvXsMHEMBbGevyeAVuCyzeg1zQdlaEcItjb/OMz6bYY0
         CyNPh6f3WIn75NtPaweLEB1Xh3I4B7VYa4Iiqf/XUYcs6kSu/S1CUJPGWv39NreAqXug
         EG/yTY+3mRfTsXyoDkcjP6Af6lgFikoKzGB3qRQS6ZRqQAPsVKh783Y2+DuZJ1ZxyzkM
         YXeFouMB7L55y6O9H+JpSfiGEg5T7bnmw48P2Q/o70UkVfcPE65odW8pE2IkO+CMXm5A
         USuA==
X-Forwarded-Encrypted: i=1; AJvYcCVuBbWlSHk9XOPFNSpx8QWdfx9G32uaaYJq0lkh+s3XRot0sryoTO+9don7e8psImoBjErfFdJigks=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuWGeSPmIFIFfR3LhZ8f+BZBEuYARUsjumVgklWilpGINi4MEK
	iVXp1ErnkcWtMTNCLHFxi+azgX86J37Rd7qp07wZHQwrgHc1L4n/KaaO3A4nWvxlhoViWoZK+Ou
	eyNg=
X-Gm-Gg: AZuq6aKPs/RuBJmyNZ7Nb0i1Fl79kWaiWqEJ4XW1qyqXj6FZ96l7fkE+RI5kE20ATe8
	omZfmS/AZX8OHES4S59ynTeHPcj7jxCIq6W9RnfCotgpg+I1593TDpCC3p5RgMR9cket/xWEfZm
	7UivI9U0H3glImH00iYojx9d876Me0vYw7K5jnluUl3dQY1Z3U0IldDrtjiZxGdaLrwzinrkaPI
	p2i9M4n4CROoy8VqylhVlE70QdfPs6tYOIlQFwdcWkdZsyTj+asvoW9JAcKR1Vwx7HQ8iE30T1O
	wpvtBipMEbMraUJaMgkLPQtOlYQmrE64NZdPKoV1N5xJEEfxQx8R00EnXkpTImOY5RmDOmjj6hZ
	RmLceYogFd+RrewOItQXMBBvm4Qb3y1iuY6C1DnHNzBSKzswuz4WQWytYvAhlOxZpWEUqKPIrT2
	KCJnFNagsBSPZw0Q05r0L6OLXCOXe2wCXkTgO4QEVVRnBXR3E3LgHGC1SkEKIsf9PVI3Uhn8Hhs
	uA=
X-Received: by 2002:a05:600c:81ca:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-480828a6f7dmr43752675e9.8.1769701415143;
        Thu, 29 Jan 2026 07:43:35 -0800 (PST)
Message-ID: <3b2a9dbe-fa14-43a3-a7c3-a4c1396a5c70@suse.com>
Date: Thu, 29 Jan 2026 16:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: route unhandled interrupts to
 do_unexpected_trap()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <f6d0cc1a6d960acf96d0f43813bfe6a62ca9a041.1769697450.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f6d0cc1a6d960acf96d0f43813bfe6a62ca9a041.1769697450.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 34A82B1979
X-Rspamd-Action: no action

On 29.01.2026 15:40, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -196,6 +196,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>          {
>              /* Handle interrupt */
>              unsigned long icause = cause & ~CAUSE_IRQ_FLAG;
> +            bool intr_handled = true;

Of course I don't know what your further plans are here, so maybe doing
it this way really is desirable. As the code is right now, I wonder if
you couldn't make this a 2-line change, ...

> @@ -204,10 +205,12 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>                  break;

... using return here and ...

>              default:
> +                intr_handled = false;
>                  break;
>              }
>  
> -            break;
> +            if ( intr_handled )
> +                break;

... simply dropping this break altogether.

Jan

