Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DEF80C7FA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 12:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651669.1017465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCeRv-0007LP-2q; Mon, 11 Dec 2023 11:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651669.1017465; Mon, 11 Dec 2023 11:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCeRv-0007JC-02; Mon, 11 Dec 2023 11:27:47 +0000
Received: by outflank-mailman (input) for mailman id 651669;
 Mon, 11 Dec 2023 11:27:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCeRt-0007J6-Jt
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 11:27:45 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cf4f15e-9818-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 12:27:43 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3333224c7b9so3920219f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 03:27:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e17-20020adf9bd1000000b003334992c578sm8391754wrc.10.2023.12.11.03.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 03:27:42 -0800 (PST)
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
X-Inumbo-ID: 4cf4f15e-9818-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702294063; x=1702898863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9rXtPfcSJ64zkJwr34XMtBLEYaGZDgRPhGf8h2fliHM=;
        b=WnZr9mmC/gaRGArKu/qg6hqZ5tpj09rBfenZcdbsSl6E3blxTmUIzEzOygnU6DleR8
         BW89TbeR6J9+C39EAvpPL7OXV6f4vpXXxGQALol9lCIEp47x0u8oHtNkJLk1O9GdxB6+
         4KqmaqYJiUIYS8Rx9p1BnWNN02gy+QsL7nVtMrhTKP1txqpEAz6RTnC4UAHNxZALxvHP
         trqNDqTjANlg8bdpaUo7M2e0Grql0+Ziuwa8VggFURXWLrP7s73dWqiMTXtien2kCRye
         yXwSZ35PiZoE40KGQwJKe2OHIcpsYw/VKRvU3gSyV20CS/rlrcdpO6gZ58LwkwLMYikU
         icGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702294063; x=1702898863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rXtPfcSJ64zkJwr34XMtBLEYaGZDgRPhGf8h2fliHM=;
        b=xTOrtOXcdvhlfuzlGSdGvme15bOgvELOtMPCTo7BnbZxFs1WDH+P9q6pNEr4zyDVBl
         dZiVnp0lQob8f1tzn7hLFOfn83abkPEI3HvxqCOpyxGgDP+8HwbReH8mjj6FFIN0OcLV
         QKqjbdxg0FE2BEBBiYUX6bATMevBjZ/HewtDQ2Sv0LdQ6Kry+T2ZPwF7V0kx4tkTpSTH
         8bDOLlhNNN/V9/b0yZSJRnsKhioUWRTbnrrGEXeCZ4LBz+hVH8MlXBLD/pqzT/LuK49l
         ee/WvMVBy8wmJKASCfnw1Pme8U8o7TVWLr8z7CZw5rVtfrRUrG99A4k+FnoPP4Ozed9q
         uZXg==
X-Gm-Message-State: AOJu0YypXE95TOJ8mKHHbDGvwJ6hKTxJJaRATd1TEvarmEdBQuWPe9Fz
	0RJFjkMyDhRvrIYX0wiTyU1VtbUPCY4KwJ07H891
X-Google-Smtp-Source: AGHT+IGgZgnvW1aXAGeKnvw3e6t3ylHT0xu8Gjx4ImjXBWXnJfcMdQaYp/68cms35BG6cKulunLxQQ==
X-Received: by 2002:adf:fd04:0:b0:332:e3f1:9656 with SMTP id e4-20020adffd04000000b00332e3f19656mr2127125wrr.35.1702294062914;
        Mon, 11 Dec 2023 03:27:42 -0800 (PST)
Message-ID: <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com>
Date: Mon, 11 Dec 2023 12:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com>
 <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com>
 <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
 <435d159f-96d5-49af-82ec-bce6961e3391@suse.com>
 <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
 <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
 <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com>
 <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2023 12:09, Sébastien Chaumat wrote:
> Le lun. 11 déc. 2023 à 10:18, Sébastien Chaumat <euidzero@gmail.com> a écrit :
>>
>>> On 05.12.2023 21:31, Sébastien Chaumat wrote:
>>>>> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
>>>>
>>>> Is it expected that IRQ7 goes from fasteoi (kernel 6.6.4 ) to
>>>> ioapic-edge and IRQ9 to ioapic-level ?
>>>>
>>>> IR-IO-APIC    7-fasteoi   pinctrl_amd
>>>> IR-IO-APIC    9-fasteoi   acpi
>>>>
>>>> to (xen 4.18.0)
>>>>
>>>> xen-pirq     -ioapic-edge  pinctrl_amd
>>>> xen-pirq     -ioapic-level  acpi
>>>>
>>>> ?
> 
> This look similar to
> https://yhbt.net/lore/all/20201006044941.fdjsp346kc5thyzy@Rk/t/
> 
> This issue seems that IRQ 7 (the GPIO controller) is natively fasteoi
> (so level type) while in xen it  is mapped to oapic-edge  instead of
> oapic-level
> as the SSDT indicates :
> 
>  Device (GPIO)
> 
>      {
>          Name (_HID, "AMDI0030")  // _HID: Hardware ID
>          Name (_CID, "AMDI0030")  // _CID: Compatible ID
>          Name (_UID, Zero)  // _UID: Unique ID
>          Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>          {
>              Name (RBUF, ResourceTemplate ()
>              {
>                  Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>                  {
>                      0x00000007,
>            }
> Any idea why ?

Information coming from AML is required to be handed down by Dom0 to Xen.
May want checking that (a) Dom0 properly does so and (b) Xen doesn't screw
up in consuming that data. See PHYSDEVOP_setup_gsi. I wonder if this is
specific to it being IRQ7 which GPIO uses, as at the (master) PIC IRQ7 is
also the spurious vector. You may want to retry with the tip of the 4.17
branch (soon to become 4.17.3) - while it doesn't look very likely to me
that recent backports there were related, it may still be that they make
a difference.

Jan

