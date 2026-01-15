Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83BED2339D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 09:45:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204290.1518992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgIyP-0003Nh-1O; Thu, 15 Jan 2026 08:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204290.1518992; Thu, 15 Jan 2026 08:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgIyO-0003LB-U1; Thu, 15 Jan 2026 08:44:56 +0000
Received: by outflank-mailman (input) for mailman id 1204290;
 Thu, 15 Jan 2026 08:44:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgIyN-0003L5-KL
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 08:44:55 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7689456a-f1ee-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 09:44:54 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so1027475e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 00:44:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af653787sm4457147f8f.18.2026.01.15.00.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 00:44:53 -0800 (PST)
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
X-Inumbo-ID: 7689456a-f1ee-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768466694; x=1769071494; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wjTKonMGUTxf8DA/ZyV7NizLlRvw2nj8sm+ZM78Gks8=;
        b=AzKnlMmidex2CUlrw7Crdrsf+gJGtHkdvSAszC7OvCLvqrDxYwPImA7UuDc2/c249M
         nzTy8CVbk8dLZJIOPKoE2osT0iQ1GWBntAbc7hsDyzMY+37v1NJyXr9JAP7K67RYG17p
         5neABm+yByPidXAHOY0tqu5LWQIFC/W8saFLf16+lwcU97V5wjn0grtkPy03lBM6ls34
         Qr0fHqGIb+xeBPZ6oR97ugCZOxdHxrLhL8uc06TIC+2xejwR2WRVWTV88SlAJD1mAPPR
         QZKqpZWwOZa4w8b2G+LIcoZ09SEMtDa/2ymaKZDTaFDZPfL/MjpNvGhhIAm46uPFreGI
         cQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466694; x=1769071494;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjTKonMGUTxf8DA/ZyV7NizLlRvw2nj8sm+ZM78Gks8=;
        b=NVPvc1UeSZpWMvj6y8N2jQosk6v/PM2dSGeNpcLj5UWwQlA/mfTdHwnGhaCzQaJYs6
         Qm9aSsBa6QMnGoMdaoeK/8TIDk3h0kWz+5YMVnGX15AuLYBoiDd7o2f/E/UlSmIQaPwC
         oceJb9Zlaacx0zMzpMNvX+8encDspZ2cmWKu0ysGcUPMa3fQWZUyZhYS0OR2yJKX+MDD
         ncwY458I65V/JbpRZEto4IFP3s7zpl1PqgD7qf6SVld0FvVu0bOnNLBhQ7Z0zy78H4Ca
         gwr5GrD+5ur1n+4ysg6RzYd7H4Eo6R156usS8rinifj13k5y08TuMMVRvuLRvXxhdPx3
         bu4Q==
X-Gm-Message-State: AOJu0YyK040hd+FM6/lMRC5nVuiWYjRyhQwRHKjmltDnRiNhfQHBvfD6
	baJVHzBWNNfXeglueuSBSbayvgBVmAT/ttvnxH+uKgvvLbQNyMYZpuLFZ6T1ave+OA==
X-Gm-Gg: AY/fxX49VxyD8HD+LDv2OovSihpXaC2bysh1+U+AyWpS+EHo7Z9aN0IKcSvJm+Iqw/c
	x5oNfs2lofPBvP188jNY8tlrGhKJ+OiqCjBc7iW7BOgHdHMQ/fFnpDfZrSgAq6sC6zFIfwd4Tp9
	rcRt1SZ+6YSE63zXz15oXvP5EE7jZnWXvjOV702VwYNnvjrh0Ba20FRjD3W2AQ+UtJ73lbCIaAP
	Qgyu4qdSzFS6RlPbUga4KEE9MNaJqRhMTX8ELBJLS1TPz3koPitJDo8PUwgAonBdh1SfYg7hLtc
	g8CiOO99zVsX75JqSZt2XuaKXc6Kz1WzPrhMq3IUdoG6tLdsDuN+G0kJ7sXj5fbEBZBzgKel+AK
	GL4f3nT7gtxe2DCAlDpJ98+PXDTsXoy+nObNIMgLU/w3to+j/WwYoFLNpjjHxAZ+/GrNk65n9S+
	xcplZBnr+jZzxYMm+Gd+JRSiaieCHsWTIeqBEkCD5SARK921Z8orplP0qDQsfSXLWPuJxN+mmrz
	fc=
X-Received: by 2002:a5d:5f83:0:b0:432:dc5c:25cf with SMTP id ffacd0b85a97d-4342d5b27e0mr5796979f8f.18.1768466693679;
        Thu, 15 Jan 2026 00:44:53 -0800 (PST)
Message-ID: <11e81503-615b-48a1-8136-14386c57c4a5@suse.com>
Date: Thu, 15 Jan 2026 09:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cpufreq drivers not working on T480S
To: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
 <7dbd26d1-0d9a-454f-90d8-5a7f3d8e12da@suse.com>
 <qo8wx-b_cpRuzol0X0mW_NHY1mu3tOBCzMvy5Y_8IASOkmy1oxPdJWdbrndDL63d5lMbw1FDMkI9gCSH9BS2UFWiuyjhycfqWpJWueeHq2E=@proton.me>
 <8a2125c7-c5ec-4be1-a7a5-61b2936cc90f@suse.com>
 <rhr8suTtSGv9hTwateK8Tx8Cm9xetzvaOsOIzexIaY-VaPyxsgzA3K0pYTeyyrKFtkc5gHJ3SrJ0I5VKjGsxBKdQm-QKPRVF_bugbAHM9uI=@proton.me>
 <FEKky8EG7uaCBf24_kJ7c8fNFwXgajV7RH98tbwxsty3gGkFcMJuI4plVzNAVqiLYKWFGwCUo6HsOFKD_abqWU9wZtxgTNXPJz8w7vv-PYI=@proton.me>
 <c713530f-5f54-44e0-9f45-8df8329c7aef@suse.com>
 <f7_mi42KcNcLkQfNwAwz-wjxWoXv_gbqEKrmEeFp43XDrFgoWBrSAP2doOzxvIUUM21AAXV3duZB_gZT03x5S8iT6WmU6A24H32vOu40iIc=@proton.me>
 <98b1ba19-40d3-4f36-9723-2773580df3e3@suse.com>
 <BJw95xUj4xE_QnaIZqUhBPTYt2jsi6f31o_CLj8Tu4OhIyiNQid8lafTuvCgFGnCB7yZeuIP0HixAjJ4-GxO_7ndGaBQBWmW60BYhwMMaFs=@proton.me>
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
In-Reply-To: <BJw95xUj4xE_QnaIZqUhBPTYt2jsi6f31o_CLj8Tu4OhIyiNQid8lafTuvCgFGnCB7yZeuIP0HixAjJ4-GxO_7ndGaBQBWmW60BYhwMMaFs=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2026 09:40, Milky wrote:
> On Thursday, January 15th, 2026 at 10:51 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.01.2026 00:42, Milky wrote:
>>> In that case, would you say this is settled now? Would it make sense to report back to the QubesOS community that librebooted T480/S will run underclocked, due to the missing data in ACPI tables and lack of native support in Xen? This information is important, as the device is only barely usable.
>>
>> What to suggest to the Qubes community needs to be discussed there, I think.
> 
> I was just hoping to confirm with you that my understanding is correct, in order not to pass the wrong information. In fact I intend to report this to the libreboot/coreboot community too, in case there is a way to include the missing data in ACPI tables. But first I wanted to make sure that from the Xen perspective, we got to the bottom of it. 

Well, "got to the bottom" builds upon the needed ACPI data indeed being absent.
Which I can't confirm, only you can.

Jan

