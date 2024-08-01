Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC73944A80
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 13:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769608.1180495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZU6X-00014l-Ja; Thu, 01 Aug 2024 11:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769608.1180495; Thu, 01 Aug 2024 11:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZU6X-00012I-GQ; Thu, 01 Aug 2024 11:36:21 +0000
Received: by outflank-mailman (input) for mailman id 769608;
 Thu, 01 Aug 2024 11:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZU6V-00011t-OW
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 11:36:19 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44bafc1d-4ffa-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 13:36:18 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7ab63a388bso510317966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 04:36:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac60918cb4sm10069685a12.0.2024.08.01.04.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 04:36:17 -0700 (PDT)
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
X-Inumbo-ID: 44bafc1d-4ffa-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722512178; x=1723116978; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iawzlA4G7XRT8YTrL3OcBNppLD/qXnwZmoNYDWYsy80=;
        b=M9QhCF/0aM33t4CSaGPLHIe9oT1riUH0PfFbZ4icKDwC3tEIJ7Fm91Q/r02ptRRfLc
         XMr0g4ANBqhZfpFx152mdqdxvrcGado2QhBahfyGpap85443XNUDBSftHffMavRQ/lzP
         W0svDLy5O+wNXodEa2JD4oP0GLEI39oSEg7aDoe263ylB4t+3NYJZVzww3XAgTlstxME
         gng3bSJmflPj5lWBseItoKD8KiUUNt2yvRjFg5clbxPRuxb1eGCKjbtGiVp8mcenqTjJ
         aUnYsvbxdA0unVfWrzV1TcNPHFFKD+KMLFOhuKvh1XZOiLeuKJ/2KYH2QZYD4eMNbqp5
         5VEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722512178; x=1723116978;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iawzlA4G7XRT8YTrL3OcBNppLD/qXnwZmoNYDWYsy80=;
        b=Xi6o+rdYVn/YXdvpG7fvXstIc1+nxmvOEa6QGgsM4Fdgho6/RKNeWn1PDlV3iisMsr
         6WOuPSvV231Do1O0A8CkYwT0rgN6e793mQXDZsMp3OQd3YPvArRxwygaF1uQOBHZbOp4
         BFEEW896zRy5AmUPon1x3AA/hJKbX+VFqnr+XuYLQb+kfo8+vNzRiAOnxACtRjL60jy4
         2s7dy6m/xnjOspt/0tdHfWmjD3FxrlErLVZ2J/W4J97cJjW14jU4jlX9MY68lYxhrRqT
         gV14Wc9RKz+/7oHWbDrwXSueI535kYQZq5P4akcah/Vz2Ru5zLqO49dzNjC3gQkDAZ7X
         qu5w==
X-Gm-Message-State: AOJu0YwFqwhw4BGixDTXqOMNuAmgt7MqCGduyuJuNkI22bwVN2VIESRF
	Jds7VBYjGSCBuuGhafuh8DR8lk8x13NWlJaO5jijr0cozIEnq7v91Z6AvN49rw==
X-Google-Smtp-Source: AGHT+IHPWO9bAMp5hBjL+QJejIqFeeHuJXTI9RAtV6gi6E8vckSUqYVigfTLCxXZnpxoYve5GNQ4eQ==
X-Received: by 2002:a05:6402:148a:b0:5af:758a:693b with SMTP id 4fb4d7f45d1cf-5b6fe92514amr1772177a12.4.1722512177926;
        Thu, 01 Aug 2024 04:36:17 -0700 (PDT)
Message-ID: <ec95b413-519d-46a4-be41-ebb6a375612a@suse.com>
Date: Thu, 1 Aug 2024 13:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com> <ZqtsQwZNyFzflDQt@macbook>
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
In-Reply-To: <ZqtsQwZNyFzflDQt@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.08.2024 13:06, Roger Pau Monné wrote:
> On Mon, Jul 08, 2024 at 07:41:21PM +0800, Jiqian Chen wrote:
>> Remaining comment @Daniel P . Smith:
>> +        ret = -EPERM;
>> +        if ( !irq_access_permitted(currd, irq) ||
>> +             xsm_irq_permission(XSM_HOOK, d, irq, access_flag) )
>> +            goto gsi_permission_out;
>> Is it okay to issue the XSM check using the translated value, 
>> not the one that was originally passed into the hypercall?
> 
> FWIW, I don't see the GSI -> IRQ translation much different from the
> pIRQ -> IRQ translation done by pirq_access_permitted(), which is also
> ahead of the xsm check.

The question (which I raised originally) isn't an ordering one, but an
auditing one: Is it okay to pass the XSM hook a value that isn't what
was passed into the hypercall?

And Daniel, please, can you finally take a moment to help here, in your
role as XSM maintainer? Elsewhere you complained you weren't Cc-ed or
asked; now that you were asked, you haven't responded for weeks if not
months.

Jan

