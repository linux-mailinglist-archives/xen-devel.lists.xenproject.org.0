Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA93E948C7E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:59:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772711.1183157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGyV-00081G-Jo; Tue, 06 Aug 2024 09:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772711.1183157; Tue, 06 Aug 2024 09:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGyV-0007zB-Gy; Tue, 06 Aug 2024 09:59:27 +0000
Received: by outflank-mailman (input) for mailman id 772711;
 Tue, 06 Aug 2024 09:59:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kFQN=PF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbGyU-0007z5-IW
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:59:26 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fddd7d1-53da-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 11:59:25 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5b7b6a30454so752977a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 02:59:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83b92b970sm5843527a12.72.2024.08.06.02.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 02:59:24 -0700 (PDT)
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
X-Inumbo-ID: 8fddd7d1-53da-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722938365; x=1723543165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b73ahphvk6W4hm93AWPdJsQg7PL24daLavqkCv+jrRs=;
        b=Fwc/peZmRsJHQxoQU5tl0AAJjV893UBLvdlSHe6RwrFoJsN+11JgDMosHrILnwWPe7
         FpRKDAkeIypN5ONYwypParEZvqSoM+EgVlKJH5C60vwCOJz/Y0OjQE3+jxTvCckKxJ6H
         mgbx8I5wCDwMTi9kt8H2hzML6F+85Wd0EUKFRc7HsRrSHgVHCRqoE4IEUPjesTKJSVlo
         ACNjkQjDicmo6hTU0dIpuJL2bpz4Yid2lBwY5RqukptP0jg3laLmaTJn3ItdKWD0PZF8
         Up2VP6QKmDdW80tvQS/Keij2CjI2VHp6cze7kX5pROQOtlV4nvRHIapq/oL4MMAbHaVd
         iH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722938365; x=1723543165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b73ahphvk6W4hm93AWPdJsQg7PL24daLavqkCv+jrRs=;
        b=j9m3ncwzyocAwbviszafVwkFKMHCI3uUiWmtsMcbrEOlXU603yxOUO8+A07TvYrA6p
         /rc+VHsKIP06EOOPuMZ+Dcz45lpTnKxJEDRc0kZSTrBSlpPm+xdKuS/U9tg7zLG9Ow/d
         CKDB0u/CKVqnyl9uM31idKGsfxvxrqFb58n059nZTa6M/jBdPdLcG4lH4wKG21h9WzbN
         XQrBfQVNxgE8/ewNZmU5ceEc89BxnB9fbriSaav55EGCa74FxtwjhUu9+1y4tg0zV7KB
         MLEwbjJ9+eN5xRkJ0AO+o4DZ9Vr7DGcStOs6Q+Ul+IuQaa1XYR5ReHwae47khCTh5tk0
         CTCg==
X-Forwarded-Encrypted: i=1; AJvYcCUbSBjc4n8aWShDzquQLqKJfCci3zQ3iw5Cat5mZW/S6iGbGcPUvfjqIL2CzoTmgDFqUTMoxja48mpIfi/ls2vN3xsQ0cDCo1VIzQTOtto=
X-Gm-Message-State: AOJu0YzX8eoyfLbku3EyU+JBtb2JTjB8N+gnvFcrkuZS+5TIrszZzTBz
	VXBbDD6EMy/9KSv4sNeeVPfRkk4rHG0t/IW7ok7VFgwnJiupL/s0FXH+aRt/Qw==
X-Google-Smtp-Source: AGHT+IGqGk2bEy03qvOR1KNksiFVF95trO4mA1Cy2QXqA5C0m+LzqAF9HyIQKwx+fu6+m5Hnc8O1hQ==
X-Received: by 2002:aa7:c053:0:b0:5b1:433:579b with SMTP id 4fb4d7f45d1cf-5b7f57f63f3mr8910035a12.37.1722938364834;
        Tue, 06 Aug 2024 02:59:24 -0700 (PDT)
Message-ID: <6a945181-96e8-4816-a2a8-aac6fdd1dfbb@suse.com>
Date: Tue, 6 Aug 2024 11:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
 <887c062b02e9eae9953759275d97c1fafd608d28.camel@gmail.com>
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
In-Reply-To: <887c062b02e9eae9953759275d97c1fafd608d28.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.08.2024 11:49, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
>>> +    write_pte(pte, tmp);
>>> +
>>> +    sfence_vma();
>>> +
>>> +    printk("(XEN) fixmap is mapped\n");
>>
>> Why the (XEN) prefix? And perhaps why the printk() in the first
>> place?
> printk() is available after common code started to be buildable and can
> be used here as we have already introduced early_puts() which uses
> sbi_console_putchar(). So it doesn't matter if we use printk() or
> early_printk() here the result will be the same the call of
> sbi_console_putchar().
> 
> Am I missing something?

Apparently yes, as you answered neither of my questions. To put them
differently: What value does this log message have, outside of your
own development activities? What value does the explicit (XEN) have
when printk() prepends such a prefix already anyway?

Jan

