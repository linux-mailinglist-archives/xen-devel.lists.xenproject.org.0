Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2727A22A57
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 10:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879421.1289629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdQsh-0005xq-Pm; Thu, 30 Jan 2025 09:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879421.1289629; Thu, 30 Jan 2025 09:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdQsh-0005wO-MF; Thu, 30 Jan 2025 09:30:39 +0000
Received: by outflank-mailman (input) for mailman id 879421;
 Thu, 30 Jan 2025 09:30:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdQsg-0005wH-G4
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 09:30:38 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbd21b19-deec-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 10:30:35 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so86575066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 01:30:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc7204517csm775702a12.0.2025.01.30.01.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 01:30:34 -0800 (PST)
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
X-Inumbo-ID: dbd21b19-deec-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738229435; x=1738834235; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DWNKTu1xMedq7YoRUSSpTvvZsiNpq+yhrTRNnSA0368=;
        b=IwZbhSEJ2T0+V4jk2Q+o+prupbgRxdkNDHpJu3KdaHy7DruyDQQXXb+3OfcBs04obe
         ZgBeeMZpzA6IWynDDt6A5ZVbtb5fVq4PQ7SGX1NZEoAjMOcoI7Vei5TAtgX2e1+Nzg++
         dNu0Vv/MJlunrPPyYb/52JcdXq9IasX+eydKpvhMsGGubnpbb/USBKadg40+F5uMNR+9
         FkZNw+TlFQ394zrHzC4LJyjIj8nxLP0Mq+Evcyj79ecaX7/Q96u5W0MtEGU5sgDMohyJ
         9N4RRQBUl0Wi14Xk6gwKq+/FkmuwUNDMA+1HpwtvcbcC1h6/DECkdKK7ay9gE02Dg6hb
         yogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229435; x=1738834235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWNKTu1xMedq7YoRUSSpTvvZsiNpq+yhrTRNnSA0368=;
        b=IQCQDnsgqFyTTiVPBseAqHlV/HVa+HFdGU21Nw/fYYHwW2gW3Bt9dRj1jEQQeR8iep
         yWul5fCrQfU74wjo66lZBv3HpYFPIq5pamtHgQv/YwjfjXPsQHZBHK7OA1sUdzM7smrt
         O3iTHYPFnUAxs2AtI2cvqHo1vrU7XjmTIKo3ffefqOVFNhyok4zF7ONDmnYi9PsrwLmM
         ip1rulnu6qym9FuT5dfEeZjluvje+/bsrzT4iBf3E0QC+Vlmsr4VruG/2VwkRmEF007H
         FKuK2ksDKUruGoYoHpJ4PN7zxQcg+NmI5Yn0z6p9a4NSoDl3bENnUeM2DlDajkm8ePjJ
         K/HQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1iZllHanoeocXIl8tH5gUHd3LJBepFtqBFdmo5oxY7jsrKWQnbil3wiWbgXfWfL8g51CNxRN3fwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbEkkfO6InyHQqN3Kro+sTSFls6gcI1TyPK1GjZ3U98ziTLT3a
	xr7GjWihdd+zHxF0VBguhYbcuRdr9csvUDrX85l5xe5ojHsC48UZd2LUIBynfg==
X-Gm-Gg: ASbGncu26x8nLr+SBDn4SC4cE/wxBlXFKL9FCirEZ5cq7Qa0LaWNt8A2x2OKOKGwo1n
	EXOctemlhGSfypiT6oRLE9TMCZn/26ulo7rZ2kaPs0G4YQfeGOXOaK2147UMEjPgN6WGA96ZXT9
	EizCdQKNldtb5oAlgJv2wqwBjyQA2y1HWhvItkdT0e4vF3RnOgzsE/aUTlosF9dzgrZSj0ihab4
	CJDzrwJ6GzJ0pXK0owLc/PrHyOAO5CGTCWg+PEI1w1CNkDxutDxtT6rrblDm89n4uZK4HH8tzWN
	VYoX/J4rgarzyDpH+40w3L/glQy4CWUGOETe/YjKfy5jyZizMQART1/KPv22+FlwTEEZvvGx/AJ
	G
X-Google-Smtp-Source: AGHT+IF0gyawJlcEkylXCscP5ByYoAc8DNLoaGkczxxW7yrMEL0xgpxHngznG1VR9QUPt+Fv9sC/Rw==
X-Received: by 2002:a05:6402:34c8:b0:5d9:84ee:ff31 with SMTP id 4fb4d7f45d1cf-5dc5efa8c21mr15653014a12.3.1738229434702;
        Thu, 30 Jan 2025 01:30:34 -0800 (PST)
Message-ID: <cfe0af0e-132b-4390-a3b0-dde0e6326e19@suse.com>
Date: Thu, 30 Jan 2025 10:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <Z5mOKQUrgeF_r6te@mail-itl> <20250129184825.GA484760@bhelgaas>
 <Z5sGW4b0pMtm38Y-@mail-itl>
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
In-Reply-To: <Z5sGW4b0pMtm38Y-@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.01.2025 05:55, Marek Marczykowski-Górecki wrote:
> I've added logging of all config read/write to this device. Full log at
> [1].
> 
> A little explanation:
> - it's done in pci_conf_read/pci_conf_write in https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/x86/pci.c;h=97b792e578f1093194466081ad3651ade21cae7d;hb=HEAD
> - cf8 means cf8 port value (BDF + register)
> - bytes is read/write size (1/2/4)
> - offset is the offset in the register (on top of cf8), but not in data
> - data is either retrieved value, or written value, depending on
>   function
> - it's logging only accesses to 01:00.0
> 
> interesting part:
> 
> lspci before reset:
> (XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0x61614c3
> (XEN) d0v3 conf read cf8 0x80010004 bytes 4 offset 0 data 0x100000
> (XEN) d0v3 conf read cf8 0x80010008 bytes 4 offset 0 data 0x2800000
> (XEN) d0v3 conf read cf8 0x8001000c bytes 4 offset 0 data 0x10
> (XEN) d0v3 conf read cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v3 conf read cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v3 conf read cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v3 conf read cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x80010028 bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x8001002c bytes 4 offset 0 data 0xe61614c3
> (XEN) d0v3 conf read cf8 0x80010030 bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x80010034 bytes 4 offset 0 data 0x80
> (XEN) d0v3 conf read cf8 0x80010038 bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x8001003c bytes 4 offset 0 data 0x1ff
> (XEN) d0v3 conf read cf8 0x80010080 bytes 4 offset 0 data 0x2e010
> (XEN) d0v3 conf read cf8 0x800100e0 bytes 4 offset 0 data 0x18af805
> (XEN) d0v3 conf read cf8 0x800100f8 bytes 4 offset 0 data 0xc8030001
> 
> reset:
> (XEN) d0v1 conf read cf8 0x800100fc bytes 2 offset 0 data 0x8
> (XEN) d0v1 conf read cf8 0x800100fc bytes 2 offset 0 data 0x8
> (XEN) d0v1 conf read cf8 0x8001008c bytes 4 offset 0 data 0x145dc12
> (XEN) d0v1 conf read cf8 0x80010000 bytes 4 offset 0 data 0x61614c3
> (XEN) d0v1 conf read cf8 0x80010004 bytes 4 offset 0 data 0x100000
> (XEN) d0v1 conf read cf8 0x80010008 bytes 4 offset 0 data 0x2800000
> (XEN) d0v1 conf read cf8 0x8001000c bytes 4 offset 0 data 0x10
> (XEN) d0v1 conf read cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v1 conf read cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v1 conf read cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v1 conf read cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x80010028 bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x8001002c bytes 4 offset 0 data 0xe61614c3
> (XEN) d0v1 conf read cf8 0x80010030 bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x80010034 bytes 4 offset 0 data 0x80
> (XEN) d0v1 conf read cf8 0x80010038 bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x8001003c bytes 4 offset 0 data 0x1ff
> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
> (XEN) d0v1 conf read cf8 0x80010090 bytes 2 offset 0 data 0x1c2
> (XEN) d0v1 conf read cf8 0x800100a8 bytes 2 offset 0 data 0x400
> (XEN) d0v1 conf read cf8 0x800100b0 bytes 2 offset 0 data 0x2
> (XEN) d0v1 conf read cf8 0x80010004 bytes 2 offset 2 data 0x10
> (XEN) d0v1 conf read cf8 0x80010034 bytes 1 offset 0 data 0x80
> (XEN) d0v1 conf read cf8 0x80010080 bytes 2 offset 0 data 0xe010
> (XEN) d0v1 conf read cf8 0x800100e0 bytes 2 offset 0 data 0xf805
> (XEN) d0v1 conf read cf8 0x800100f8 bytes 2 offset 0 data 0x1
> (XEN) d0v1 conf write cf8 0x80010004 bytes 2 offset 0 data 0x400
> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 2 data 0x9
> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
> (XEN) d0v1 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910

This is the express capability's Link Control 2 Register afaict. As per
the copy of the 6.0 spec that I have the top 4 bits have only two
defined encodings - 0b0000 and 0b0001. 0b1000, as is being set here, is
not defined.

Yet then the earlier questions remain: Why has this suddenly become a
problem? And why would this depend on how the present session was
started, and what was running in the previous session? Is this write
perhaps conditional upon something that has changed?

Jan

> (XEN) d0v2 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf read cf8 0x80010090 bytes 2 offset 0 data 0xffff
> (XEN) d0v2 conf write cf8 0x80010090 bytes 2 offset 0 data 0xfffc
> (XEN) d0v2 conf write cf8 0x80010090 bytes 2 offset 0 data 0xffff
> (XEN) d0v2 conf write cf8 0x80010088 bytes 2 offset 0 data 0x2910
> (XEN) d0v2 conf write cf8 0x80010090 bytes 2 offset 0 data 0x1c2
> (XEN) d0v2 conf write cf8 0x800100a8 bytes 2 offset 0 data 0x400
> (XEN) d0v2 conf write cf8 0x800100b0 bytes 2 offset 0 data 0x2
> (XEN) d0v2 conf read cf8 0x8001003c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001003c bytes 4 offset 0 data 0x1ff
> (XEN) d0v2 conf read cf8 0x80010038 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010038 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010034 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010034 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010030 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010030 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001002c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001002c bytes 4 offset 0 data 0xe61614c3
> (XEN) d0v2 conf read cf8 0x80010028 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010028 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x8001000c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001000c bytes 4 offset 0 data 0x10
> (XEN) d0v2 conf read cf8 0x80010008 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010008 bytes 4 offset 0 data 0x2800000
> (XEN) d0v2 conf read cf8 0x80010004 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010004 bytes 4 offset 0 data 0x100000
> (XEN) d0v2 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010000 bytes 4 offset 0 data 0x61614c3
> (XEN) d0v2 conf read cf8 0x80010004 bytes 2 offset 2 data 0xffff
> (XEN) d0v2 conf read cf8 0x80010034 bytes 1 offset 0 data 0xff
> (XEN) d0v2 conf read cf8 0x800100fc bytes 2 offset 0 data 0xffff
> 
> 
> [1] https://gist.github.com/marmarek/b4391c71801145e52590e877c559c5e0
> 


