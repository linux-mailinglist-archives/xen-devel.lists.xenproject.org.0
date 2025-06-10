Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B267AD2FEC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 10:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010586.1388717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOuEr-0008Ln-Kj; Tue, 10 Jun 2025 08:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010586.1388717; Tue, 10 Jun 2025 08:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOuEr-0008Jz-I9; Tue, 10 Jun 2025 08:21:45 +0000
Received: by outflank-mailman (input) for mailman id 1010586;
 Tue, 10 Jun 2025 08:21:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOuEq-0008Js-3v
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 08:21:44 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f01cbf76-45d3-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 10:21:41 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so40763205e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 01:21:41 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229d9ddsm11468200f8f.4.2025.06.10.01.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 01:21:41 -0700 (PDT)
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
X-Inumbo-ID: f01cbf76-45d3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749543701; x=1750148501; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x/9/yjQE7Q8N0Y/EC7l+Zl3+4gJyi+alReqTzeTmkTs=;
        b=FVAoAliX6Jy6kXajAXCyAAi/DMv7AZ9+e/lyUoKkmVngwwzUlnOQKf1j8WnBLoweGf
         lU57ZQ75HTnl+upvjtZsivNg+seTR9QLbEhfd6QFu0LvOG11MLOZdzrzSvAvWDwxSJnG
         8qhO/2HvGHklbCshy+xg7CasgbHV0nz6/PkVzUR2KQn3o086wxJM4A9B1PVuqpEoyUnK
         I2TGgDsPO2ErFtpp6+GmxLI64/Qa5yVjl2M41as8KU1l5bkZ/2vFnNB100CAS+4E/yho
         wZzVrbpt0/2wDxZvE/8eXHcycjtMoho+8ZFVMS6d9KkU6YMOjMx+YRCzGDb2Xl63N038
         T8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543701; x=1750148501;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/9/yjQE7Q8N0Y/EC7l+Zl3+4gJyi+alReqTzeTmkTs=;
        b=WCJBHjVdfSwjNlPO7cWKo5KQ/Jm8UfCsTnUhvc98VUp+GdC93Ahutaa5g5+ZdWhvW4
         Snif9yC1a9sFIyG1SATBEIjMieZFD6nuAvuExENrMWGvIdIBFce/JblpPXKa5Vj9Hy3M
         3AYprTZSu4po3IOCMiQzFi82rQua1JTcKnUMK+wokDFagpK/yTNbXfarBZMKdITxIxhn
         yY6Umc5akfcFZ26TlwEkQnjdGsTCm/2OU0PrT0ak/9P4nQ6sN9h2W11xykna5k8GmZ6V
         ymHncv+S9gwAdPB2eBDFeVv5NAMUbafJAvUVLdPLrlRNvebQL5WG0JLlE9Mc7dt10p4X
         9Ekw==
X-Forwarded-Encrypted: i=1; AJvYcCWyc9Guxu1JtVnHaFmZ75CHhWpsthu6Rjg24RsKhlEH0dRwfaTbb2xWatBiV7Cm3Ag8gdtOcx77tNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxwlece4D/FJl3rE2JN9Z3WpAY5qUXTYZjLDHYPXxhWGV/3zkxX
	vFQZE8de/JGuXNAO19VL+ib0y8JMc/A0/0EimQQVmn8dI4A/TaAn/jRRs/S5LZMwfA==
X-Gm-Gg: ASbGncuIUHNxrzQiQftRwsMrXxBe1+1LhTL2C9sPfzdI0Nq1VA12KfLllYXOlwsWiwE
	MWfCZXDI3lgaaTKzLf3s7ZmEXa6bPAwAOc1Juws94Tg8evdxnC+Xy9R30Rm1skIeDnEd8nlQCQL
	2lhsFqDdx1tkyis6XJ4UDdWP7rrhGaydMdQFhkvkx1nqhs3jGmS3ZvMwoUxecNNJCdyTdVCg+J0
	CjbKbAQDm/dn+j11HOaXj7tvR6aIp6PF2NA0IIjrMNJhvirU73p/OSVDyfz2Ds78123qRZsUwtO
	OkOmL/AB76wQHgC6TTjs9PcbWXJ/xFVYYno0N8g6N8H0yIVKTNzWYhDNdd09IcE2Heves3SIwSu
	BstIL/w6nehcxmuPKF2Mxbip8sQsqu5tayONJvQzfdyGIJM0y8fMtz37CGvI8Jo72XpeqlIEhVj
	RDjfjw0Le06mfvqIaK3iYR
X-Google-Smtp-Source: AGHT+IFb4QL8wtEsn4E6xzaiCdPP1MT4ihH0HKy5KCpbSK4aL70aCsN479uYSTEROwL0BBm+yJXtXA==
X-Received: by 2002:a05:600c:a412:b0:453:697:6f08 with SMTP id 5b1f17b1804b1-45306977143mr71828795e9.26.1749543701325;
        Tue, 10 Jun 2025 01:21:41 -0700 (PDT)
Message-ID: <bcb3d553-b8aa-42ab-a9c8-7abf6f5d02c3@suse.com>
Date: Tue, 10 Jun 2025 10:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART
 emulators
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250606201102.2414022-1-dmukhin@ford.com>
 <20250606201102.2414022-3-dmukhin@ford.com>
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
In-Reply-To: <20250606201102.2414022-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 22:11, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> If virtual UART from domain X prints on the physical console, the behavior is
> updated to (see [1]):
> - console focus in domain X: do not prefix messages;
> - no console focus in domain X: prefix all messages with "(dX)".

While, as indicated (much) earlier, I can see why omitting the prefix
may make sense for the domain having input focus, ...

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -740,7 +740,17 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>          if ( is_hardware_domain(cd) )
>          {
>              /* Use direct console output as it could be interactive */
> +            char prefix[16] = "";
> +            struct domain *consd;
> +
> +            consd = console_get_domain();
> +            if ( consd != cd )
> +                snprintf(prefix, sizeof(prefix), "(d%d) ", cd->domain_id);
> +            console_put_domain(consd);
> +
>              nrspin_lock_irq(&console_lock);
> +            if ( prefix[0] != '\0' )
> +                console_send(prefix, strlen(prefix), flags);
>              console_send(kbuf, kcount, flags);
>              nrspin_unlock_irq(&console_lock);
>          }

... this, aiui, is a behavioral change for the non-dom0less case, where
Dom0 output will suddenly also gain the prefix. Which I don't think is
wanted: Switching focus between Xen and Dom0 should remain unaffected
in this regard.

Jan

