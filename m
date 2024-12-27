Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D633C9FD298
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2024 10:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863421.1274839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tR6rL-0005yj-N2; Fri, 27 Dec 2024 09:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863421.1274839; Fri, 27 Dec 2024 09:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tR6rL-0005vu-KP; Fri, 27 Dec 2024 09:42:19 +0000
Received: by outflank-mailman (input) for mailman id 863421;
 Fri, 27 Dec 2024 09:42:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tR6rK-0005vn-FZ
 for xen-devel@lists.xen.org; Fri, 27 Dec 2024 09:42:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db959ba2-c436-11ef-99a3-01e77a169b0f;
 Fri, 27 Dec 2024 10:42:16 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso74928885e9.0
 for <xen-devel@lists.xen.org>; Fri, 27 Dec 2024 01:42:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c639sm257366265e9.31.2024.12.27.01.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2024 01:42:15 -0800 (PST)
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
X-Inumbo-ID: db959ba2-c436-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735292536; x=1735897336; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hMkg6nJm+8tDQOsqliPzeAtAuL0Dhm0Kvji69eQ02E4=;
        b=UYc7MwtI3EJUluSlaK2CBDGIQr82oGRlWlWJF+ESysJEnaRKzrVnqiapRbN+RU21tg
         Ubg3ga5oTmHV1ZGVFytAwDRj7pQKxkoi06UwKw0/jkfQUknqVghBTwyUpLXhSubTmTQ5
         +K5J7+Y0qlNhQZyn8hv7nV8PmPTgabKpzhnHxUyzTf+WWLvrTlmxW/TYz/QSttsOmzwS
         AXuOXnbiKfab2kHlWYjspzsIKH71VHHX/OabKcknnClWphiRmRo0U1J97d0IJK4MaVhP
         fvKJZiUjYyftLNiq4T7aNBHyRdVtVrpteNkR0O0I+eYvD0jfW52niRtGM8p7pf0TXsUB
         Eu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735292536; x=1735897336;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMkg6nJm+8tDQOsqliPzeAtAuL0Dhm0Kvji69eQ02E4=;
        b=PDYL4QdZg4IPbbaVkwLjTw+ePY79kY/P94dwIDgoibNyWiAJgBREJK7GILYQiwbgYP
         u0oXaeposLSLCUK5yCAeDmL6QWtIcA494QVYFY7Wuvn0pUTZAtzo2JjpbCDbfVnuhox0
         Y162rc38HwAhCIyHaJXWUux47hZ0pDVTCQW4coZsjt+B6jymOJpAEn5uF1yXvM3F1vpe
         55zrLyFtYuX638q6RH+0VL6kSgRfRFoxfBlAP86Zr3kScL54czZqWlsCJQW7SA5LylGM
         YrFxSNzoN3ypGACBxszIU2Iumj7UVE0A91bQvE6e9PlfA1c3UU7Q+swApSjj1k869zYv
         izxw==
X-Gm-Message-State: AOJu0YwVZSujjRhzDq36I38XfadxFI3SMjIMrc35OygeMwkbGBH6wo4S
	zidii0hADeMsW7WALjM/tmEa0W53QSvZro6r27QOS9Mg8tli0kJfDDp/H+nWCA==
X-Gm-Gg: ASbGncvRHb0HAn0e6V60vYVlE5UZmLm9yfScrst6enC5lYqWfRHmfE3XYWlxojWHEAX
	sLUSEWI/V+luvvBLMyS5IV9Y8IXJ7VtGH0KZ5GCSzkD1em29mwSB6xxKs40JjlBtR7HBgmuh8YR
	6nHgeC+ECigEYeI65tyoha7rA9l7Ty5b4QfM5PP1+S4cYXGbUjTVfVY8rAUrlJxXMJMWsPoidOP
	XACLVRlpmqB6WEZhrlu+WdSCcthf3pdD0zJ9es1Q3QmdB6zJFWMjii862aaMjSiETG3LLBJWret
	rye519BLJMqGPAtyTCsNu8T1pC2UTXVMwnMb7dMIYA==
X-Google-Smtp-Source: AGHT+IFMAjKo2LJr8cildJj02etxFJ5+6YB577wdHuoxl46qaORGItyQP5gzW+g61a5aWmSi6Huo6w==
X-Received: by 2002:a05:6000:461e:b0:388:e377:8a1b with SMTP id ffacd0b85a97d-38a221f38b4mr20252778f8f.28.1735292535701;
        Fri, 27 Dec 2024 01:42:15 -0800 (PST)
Message-ID: <66f2784e-3b7c-4c54-96ca-bcaa58eba319@suse.com>
Date: Fri, 27 Dec 2024 10:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
To: David Woodhouse <dwmw2@infradead.org>
Cc: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
 <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
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
In-Reply-To: <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.12.2024 15:24, David Woodhouse wrote:
> On Tue, 2024-12-17 at 12:18 +0000, Xen.org security team wrote:
>>              Xen Security Advisory CVE-2024-53241 / XSA-466
>>                                 version 3
>>
>>          Xen hypercall page unsafe against speculative attacks
>>
>> UPDATES IN VERSION 3
>> ====================
>>
>> Update of patch 5, public release.
> 
> Can't we even use the hypercall page early in boot? Surely we have to
> know whether we're running on an Intel or AMD CPU before we get to the
> point where we can enable any of the new control-flow integrity
> support? Do we need to jump through those hoops do do that early
> detection and setup?

Yes, putting it e.g. in .init.text ought to be possible and not violate
security requirements.

> Enabling the hypercall page is also one of the two points where Xen
> will 'latch' that the guest is 64-bit, which affects the layout of the
> shared_info, vcpu_info and runstate structures.

Hmm, this is a side effect which I fear wasn't considered when putting
together all of this. Making ourselves dependent upon ...

> The other such latching point is when the guest sets
> HVM_PARAM_CALLBACK_IRQ, and I *think* that should work in all
> implementations of the Xen ABI (including QEMU/KVM and EC2). But would
> want to test.

... just this may end up too little, especially when considering
transitions between OSes / OS-like environments (boot loader -> OS,
OS -> kexec-ed OS).

> But perhaps it wouldn't hurt for maximal compatibility for Linux to set
> the hypercall page *anyway*, even if Linux doesn't then use it — or
> only uses it during early boot?

Indeed.

Jan

