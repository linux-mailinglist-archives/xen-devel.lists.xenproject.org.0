Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE87CAD4A8
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:38:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180562.1503725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbRY-0007wy-QL; Mon, 08 Dec 2025 13:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180562.1503725; Mon, 08 Dec 2025 13:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbRY-0007uI-NR; Mon, 08 Dec 2025 13:38:24 +0000
Received: by outflank-mailman (input) for mailman id 1180562;
 Mon, 08 Dec 2025 13:38:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSbRX-0007t3-Ef
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:38:23 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a09a0f7-d43b-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 14:38:22 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso36874245e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:38:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a2e8fc130sm53476355e9.20.2025.12.08.05.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 05:38:19 -0800 (PST)
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
X-Inumbo-ID: 2a09a0f7-d43b-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765201102; x=1765805902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=23k958jc9ZmNK3dWsyoxG4gDAttOYQvSF84lxr0SY/E=;
        b=ZJbzuKFWCsDHwu6D0cnEzA5GExUdoLkpHMTevAd3XG3UJ0Ej1+KnyG1zk1fDiDl8mb
         BzAFwCOVMIqqaYyixpJZ/X+fk4Dji90bG+XK5i4Rt0i3RdmBMr8QhB2CRi7YDGAfNHiK
         hPRNlJxpyHC9YOPpuwmlskCV99eCGxPPwlqzc8q/MCYtaSndAfa+UkQQ/7H6nvM9DzGm
         nV7w3YDxZ2qe+JI7I2vOGb+wCw/0/DIvRkJW/1L1Qwsg6xmtF2XQgUj2wOH7I+uYHsPs
         wqLzO/XLnsoDasIgXYbLkesijAxmo8Hv22QN/i2ohJtNGczGqNqi9vjK9gL3CHroPzEI
         gawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765201102; x=1765805902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23k958jc9ZmNK3dWsyoxG4gDAttOYQvSF84lxr0SY/E=;
        b=DVwo+SWIkg4Q1AXj7w1MaQFUQGSDX3Icz8zYyuwPlIO5+wVkjWyPfBdTOeaS9NIVZP
         IvRXHabCE/k7twWUABVCKKZU4U9uw+HdERFcMgtkuB6NWCbZAwgKFK0qtwdDFFlymsyc
         aEEfgBW6PUGNZe4xhxwOx5KBvuxaHKf2f7mPo0pheDS+CPsIviNDaSlKMuzDVDqfoCf9
         KY9BIzTTAjyRSu0LhjcEh5nPwqs+gFwf4O4iYORl6HoG+jr8hpaBFU/B1RwtyJEB1LLf
         Od0RIZ9wS5gVHnZNLokKQTZLAV1gAAnOOWOglnvqAPCp7EbP7vmATYJScbykaldOnT45
         3uKw==
X-Forwarded-Encrypted: i=1; AJvYcCVflIc25spNdvTF0BB8BiC5XPTbK/m+Gsw63VOZTp+bDZMrqYQRgAJ7ariDotdu9QNLbdUUpti4mhs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5Eh3tq7XLrPOJ9ehLFyVGvwPabe6Ip3sTMYQfP+t3al8+YhRM
	e1jVz/0af8ijCtx+6Faq3vteaGibBokHeqP+TvhN1DLHD4YLoyjS83HFrtZs9dK/Tg==
X-Gm-Gg: ASbGncuN9z+1owWPG0gJ/9UOEHYq6PclDKqr09vLzC92HD3Dv2wb2/NCotgWzOzmrAj
	WNZoAx3JNR/j6f4hLQ7xpqsUzFbH/NpQJaRA71zNnswsLEBtu+AvtLrHBWcuBtzJT9FpLkY2Mms
	XGsLRxgXQxFp03ZpDIW2QgEYIjVYEffrXbDGwWMJo6WnAeXkF6jG260qeNvPVxODwT/X57CA5QF
	NRT0bfxG5V7WY17X7Ro9ZztkGpIJacq7vXFkWGaWHaav8bxjugCDjUukW9y0uc80qVuU4ShxXTV
	l0+2iY0D7o6R8tiJO2mfjEk/SX2O27a1Hh1mO+CA5tY5vhbsbv8VUYZDXQ4M7XFUzKDkXxspVyK
	iXtcnOZEH3rEZNQWpWmHnH/NYDU/Qd7ee82sus3xQdgjuPjt8fd9kRkInwmSSXvmxji9ck6w9We
	e4ZJ6w+qaCooiDbNfPjmqGdyDpgJfAhULacIluf9YzG6ln39WacIrrma4E16pDNOC5DBU4ywNv5
	xg=
X-Google-Smtp-Source: AGHT+IGCtP0ycMr/p4pndlsoKZ4RDH5vgRzYyppqaIvZALWFc/aN3QIFecS1oXnXE1L20wGSs3RG5A==
X-Received: by 2002:a05:600c:3b13:b0:477:9c73:2680 with SMTP id 5b1f17b1804b1-47939e275dcmr76833185e9.23.1765201101591;
        Mon, 08 Dec 2025 05:38:21 -0800 (PST)
Message-ID: <15416ebe-9bff-4930-bb23-166070fa8598@suse.com>
Date: Mon, 8 Dec 2025 14:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] xen: Strip xen.efi by default
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20251205160942.46694-1-frediano.ziglio@citrix.com>
 <20251205160942.46694-3-frediano.ziglio@citrix.com>
 <4fb15575-cbfc-4842-b48b-4113fe658137@suse.com>
 <CAHt6W4e=7nCH=owhGEAjh+tjTo3j0KptW-y9WuDRYTDWsNyWEw@mail.gmail.com>
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
In-Reply-To: <CAHt6W4e=7nCH=owhGEAjh+tjTo3j0KptW-y9WuDRYTDWsNyWEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2025 14:31, Frediano Ziglio wrote:
> On Mon, 8 Dec 2025 at 08:25, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.12.2025 17:09, Frediano Ziglio wrote:
>>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>
>>> For xen.gz file we strip all symbols and have an additional
>>> xen-syms.efi file version with all symbols.
>>> Make xen.efi more coherent stripping all symbols too.
>>> xen-syms.efi can be used for debugging.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>> ---
>>> Changes since v1:
>>> - avoid leaving target if some command fails.
>>>
>>> Changes since v2:
>>> - do not convert type but retain PE format;
>>> - use xen-syms.efi for new file name, more consistent with ELF.
>>>
>>> Changes since v3:
>>> - update documentation;
>>> - do not remove xen.efi.elf;
>>> - check endbr instruction before generating final target.
>>>
>>> Changes since v4:
>>> - simplify condition check;
>>> - avoid reuse of $@.tmp file.
>>>
>>> Changes since v5:
>>> - avoid creation of temporary file.
>>>
>>> Changes since v6:
>>> - install xen-syms.efi;
>>> - always strip xen.efi;
>>> - restore EFI_LDFLAGS check during rule execution;
>>> - update CHANGELOG.md;
>>> - added xen-syms.efi to .gitignore.
>>>
>>> Changes since v7:
>>> - move and improve CHANGELOG.md changes.
>>>
>>> Changes since v8:
>>> - rebase on master;
>>> - clean xen-syms.efi file.
>>
>> I.e. not addressing my prior, more fundamental comments.
> 
>   In version 8 you commented that code should not double linking, and
> the current version does not double link.

That was the reply directly to you. There was also a reply to Marek's comments,
as to extending the probing of the toolchain that we do to figure out how well
the PE/COFF linking actually works.

Jan

