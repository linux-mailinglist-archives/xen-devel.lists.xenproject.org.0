Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6C682EC5D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 10:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667695.1039215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPgCy-0006cT-Ng; Tue, 16 Jan 2024 09:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667695.1039215; Tue, 16 Jan 2024 09:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPgCy-0006ah-J0; Tue, 16 Jan 2024 09:58:12 +0000
Received: by outflank-mailman (input) for mailman id 667695;
 Tue, 16 Jan 2024 09:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPgCx-0006ab-3Z
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 09:58:11 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0e3bdd2-b455-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 10:58:09 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cddf596321so4584141fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 01:58:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05687044d400b002060e99b486sm2959038oai.22.2024.01.16.01.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 01:58:08 -0800 (PST)
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
X-Inumbo-ID: c0e3bdd2-b455-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705399089; x=1706003889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pSuM/UmNt07xCDdjZ412hbmgTqRAAFf8vSrsjLDFpCY=;
        b=WJj1SMHTR624pJ+STFxldQ6OBUb136suVGOr1Dw3RPZnJRDwkYzN/fNpbiXSWf84zf
         KuomTPyChnjz8NqATgxFDoXo3Mn4PdygDvA//RIckTOHTuXZDIbLowcYMQrYU94oQA9v
         stvMTc90Oy9npsBxcU5pE9AAG0XAGlhjtNEBP71TYFqM9Sx/k/VirKW7P8ex3wRCRzh4
         z3VU+1JgWabB0zmNrxptf29effuFvPd01v5aoM9zNXWRzf/Z4CGP1oYfurc/t19vLH5+
         WmijdhRGFcleOWV/7Qogo6yUuGA3DIZMQCz8pxpHFcURlQpsipHWJa7LzoDEi5ih7JAP
         JyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705399089; x=1706003889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSuM/UmNt07xCDdjZ412hbmgTqRAAFf8vSrsjLDFpCY=;
        b=aPG3XM+tXbBAXfrH9rUQ1G543pIOqrw2I4t77nnqHna34q1D6b+ptxkb6x3HObRbKI
         vSfI4kSxNV4CHKCeafppMQPtZBysgFr7buY54qtO8sa/qMG5X8nhsaggeC25172ivcyg
         a6XESshb62zpvTe2wWMaZcn5wQTeq5ZWNA80jFijq435OQtaFXPIkhF2JdCorNv348r3
         8bwTRVMoH0SK4e8j88KPujwwbYRgCNaMg8+VfcUn/0FkgWMIbwi0AdRnQm5B4sCJBBDf
         pTD+DkCF8WQ9Liz7rQRuZHmIIzTfrAL3ZIs2x9PJYzSUlMZ3CCbkWt/pctTQUmto3HuO
         8sng==
X-Gm-Message-State: AOJu0YyHOS876IgQAatCqXXR8QbVv/SIYaWGb5kC65UtpZhWq2PmFs5q
	YjVgddqIgkNn/t5DE5A4RFVQhdzeg/BXLt60XM3TWoMdmA==
X-Google-Smtp-Source: AGHT+IHsc/nZgzXIlAACB3vdpls/z03r323FuyzphYvy3Rg8VcW/rIHwcmd1vvHEmAUScm89NN362Q==
X-Received: by 2002:a2e:86da:0:b0:2cd:36ff:4d76 with SMTP id n26-20020a2e86da000000b002cd36ff4d76mr3206237ljj.76.1705399089233;
        Tue, 16 Jan 2024 01:58:09 -0800 (PST)
Message-ID: <cafae481-d193-433f-bffb-5e80a9dd7646@suse.com>
Date: Tue, 16 Jan 2024 10:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thunderbolt (and other PCI hotplug) isolation
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <ZaXoCXNhYSnhLyOe@mail-itl>
Cc: xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <ZaXoCXNhYSnhLyOe@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.01.2024 03:20, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> A little background:
> In Qubes OS we try to isolate external (especially hot pluggable)
> devices as much as possible. For PCI devices, we do PCI passthrough to
> dedicated domains (sys-net, sys-usb - mostly the latter). The goal is to
> prevent unauthorized device to compromise the whole system, especially
> using DMA (either initiated by a malicious device itself, or by a
> compromised driver). For the discussion here, lets ignore what happens
> before Xen starts.
> 
> The matter becomes much more complicated for hot plugged devices. I did
> some test recently, enabled PCI hoplug in dom0 kernel (we have it
> disabled by default), and this is what I got:
> 1. Hot plugged devices were properly detected, and dom0 told Xen about
> them. In my case, it was two PCI bridges and an NVMe disk.
> 2. New devices were assigned to dom0 automatically.
> 3. New leaf device (the disk) can be assigned to a HVM domU and seems to work.
> 4. The bridges cannot be assigned to a domU.
> 
> Now, there are (at least) two problems with the above:
> i) The second point above: new device automatically gain ability to DMA (at
> least) into dom0 memory. I guess this should be easy-ish solvable for
> leaf devices by assigning them to a quarantine domain by default. There
> is an issue how to decide what devices to handle this way (for example,
> what about external devices present during Xen/dom0 startup already),
> but it feels like a problem solvable with some configuration. And of
> course dom0 will need to be adjusted to not talk to such devices
> automatically (via drivers blacklisting or similar approach). But for
> the bridge devices, it's more complicated, basically the second point
> below.
> 
> ii) The fourth point above: an external PCI device remains in dom0
> (including being able to dom0 into dom0's memory) just because it happen
> to have some specific bits in its config space set. When considering
> malicious device, it doesn't even need to function as a bridge - it's
> just enough to present itself as a bridge, wait for dom0's thunderbolt
> driver to authorize the device so it gets assigned dom0's IOMMU context,
> and boom. On the other hand, a bridge has privileged function by
> design, for example IIUC takes part in discovering devices behind it
> (which then needs to be properly registered in Xen, assigned IOMMU
> context etc).

I may not be following the underlying concept here: If you consider a
device potentially malicious, why would you even connect it to your
system? And if you mean Dom0 to not drive devices, why would you even
build the respective drivers for such a Dom0 kernel?

> iii) Untested, but it feels like there is a lot of room for various race
> conditions in the hot plug handling. For example, device must be
> allowed any DMA only after its IOMMU context is properly configured.

Isn't that the case already? Any attempt to DMA without respective
device / context table entry (AMD / Intel terminology) ought to result
in IOMMU faults.

Jan

> I
> believe thunderbolt technically allows that (plain PCIe hotplug most
> likely not), but my guess is it's not the case currently.
> 
> My question is mostly: what can be done about the "ii" problem above?
> 


