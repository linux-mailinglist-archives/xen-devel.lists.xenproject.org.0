Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD69298477C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 16:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802988.1213362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6MW-0003Mv-4M; Tue, 24 Sep 2024 14:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802988.1213362; Tue, 24 Sep 2024 14:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6MW-0003KU-1a; Tue, 24 Sep 2024 14:17:56 +0000
Received: by outflank-mailman (input) for mailman id 802988;
 Tue, 24 Sep 2024 14:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st6MU-0003KN-0T
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 14:17:54 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c958d839-7a7f-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 16:17:53 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a90188ae58eso712442066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 07:17:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3489dsm89863566b.3.2024.09.24.07.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 07:17:52 -0700 (PDT)
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
X-Inumbo-ID: c958d839-7a7f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727187472; x=1727792272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J1g/d5jSkuBJt12TZaSnWtZsdda74j7BhfmEJaKXp48=;
        b=CyOtdI6I3K0HKY/r8qdVUCySNv2Wx59dA8J3FphycPw04RbB8Vr3+TfoYfWaoNUFqZ
         W8x8hiJc8x6rydtNmyhIJqdkRvEC7gztpX44hwEp3pCXUhhrOVpvYb4XLzVt0BBxDElQ
         IMiOr62wfelc3X9rdqTe2zzGSuPdXsEB2r/jx7tufY9+4DEN2ZXbzi6oF/WXR8ymtSXw
         bRnsH3avjXjRwZT81baLpmM4cFremYf7ehVoaZCT5yoA30NlbqahtOs9IxUzN/jBzdmG
         MRN2OQ9sTE4CKcd/gykcM+fzZOt6Rf8i/V8Z71YkrFhTU/bH50EXwacDNfbCQPf1RtBx
         orHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187472; x=1727792272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1g/d5jSkuBJt12TZaSnWtZsdda74j7BhfmEJaKXp48=;
        b=ZYnr1GPrI40bRpsI3JsoQVyKeFasBlChjsciRSxn89LP2w5G42eOfosMJPYxw4yRB4
         Y/L7KNwhUU+E6pnhESS/iT8opxem7HMtaKu5xyKT3ghhQz/UiNA0+qF34n1uWsXc734t
         8AuTraA1i81dke4tiEixrJze5WmtDAAlwWYRPKRDyg2KTu67qN7Ipkfdl03fMBCDoz8J
         2bYlh0MBeY3NG0pzmBNLLfcHlM/BXtw269opkbzU/tKtGFwfrXVpaymcmJ0aExoLFufa
         cw7V88lGj05lJnct/uV8chGiifFR9Z5oOS/Bec02m5ZMgZ5hYyoU3HJOK/30NnT3LtPG
         8Oug==
X-Forwarded-Encrypted: i=1; AJvYcCVCg3s3ax/YFi2a3QACItuzoNSyP2PM53yT/gmsTc8zDWT0W2Ai7mp74fehIVC1XuFu/JaIYsxyGB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDubZT9Dof8QrEnwu5P3IijxVLWQxnca26I/PF9E+lxasY242u
	6bJNRbGtT7qeAOGz7RqRONItbLl0XkntBHLow8p/qOrI7XE7bWOI4Kc9x6GIkg==
X-Google-Smtp-Source: AGHT+IGJa7MCa9Pq4V6b1nDGj7ahu9MpO+bwD7qyNBEXVgoUFvrT9wuPp2kW3B8bbP6omS+blwPvpw==
X-Received: by 2002:a17:906:fe02:b0:a86:ac91:a571 with SMTP id a640c23a62f3a-a90d599afe2mr1645319366b.56.1727187472315;
        Tue, 24 Sep 2024 07:17:52 -0700 (PDT)
Message-ID: <7b684c1a-0e3b-412a-ae44-995463510fa9@suse.com>
Date: Tue, 24 Sep 2024 16:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240924102811.86884-1-frediano.ziglio@cloud.com>
 <20240924102811.86884-4-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240924102811.86884-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2024 12:28, Frediano Ziglio wrote:
> No need to have it coded in assembly.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - update some comments;
> - explain why %ebx is saved before calling efi_parse_mbi2;
> - move lea before test instruction;
> - removed asmlinkage from efi_multiboot2 and add to efi_parse_mbi2;
> - fix line length;
> - update an error message specifying "Multiboot2" instead of "Multiboot";
> - use obj-bin-X instead of obj-X in Makefile;
> - avoid restoring %eax (MBI magic).

Despite this long list of changes earlier comments were left unaddressed.
The new function is still named as if it did only parsing, the stub change
is still in here and (if already not separated out) not mentioned at all
in the description, and (as Andrew has now also pointed out) the
declaration of efi_multiboot2() didn't move to a header. Maybe I forgot
some more. Please make sure you address earlier comments before sending a
new version.

Jan

