Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B826BD32FA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 15:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142376.1476567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8IXR-0007tZ-BH; Mon, 13 Oct 2025 13:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142376.1476567; Mon, 13 Oct 2025 13:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8IXR-0007rp-8J; Mon, 13 Oct 2025 13:24:33 +0000
Received: by outflank-mailman (input) for mailman id 1142376;
 Mon, 13 Oct 2025 13:24:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8IXP-0007rj-Pn
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 13:24:31 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3126839-a837-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 15:24:30 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso3730372f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 06:24:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e13b6sm18326538f8f.44.2025.10.13.06.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 06:24:29 -0700 (PDT)
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
X-Inumbo-ID: f3126839-a837-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760361870; x=1760966670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1uFQc1nebBbLYhPe6WvI/d4nEWmxfg3cDJI+CBUazhg=;
        b=Cde2oObUsmzaVMx7h40dT/DZQ2tQp5NBuL7PLKAs8a4K6BPcu7mbOGnE10WBHwHv05
         jDAWB7ewY4NuO6tWJE20U8YUTDJwlez1j5+Lnt61U/nCG1HOWjq7Y5L9d9ZoRqQEhX/K
         i12zlpMNjoMXDADKJ89+T79CPZXlFyCsNu+XTf7PKw/VDFDOVTuQNssBJbhZtBvDVqfM
         dbgoCROwonqxdGWqXRPT9FcnBJGhu6PwCobKDyHJnfEtfgbPRtpH6PLQ2rP5Xy/EXyQJ
         jgW3DIGHk7azKmPgeJ0g+T4Yzs0cdXjxORRb+LQ/KIuzMEWXGJ0dnKwbOH7Cl4S7T8+A
         HKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361870; x=1760966670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uFQc1nebBbLYhPe6WvI/d4nEWmxfg3cDJI+CBUazhg=;
        b=J4LkWPQfPOXc0DTFrJMNpNgOpytHPoZ0hk4A9Ys9DwjurZzqkTA9iYTtE8Vg68TvOn
         bIn7F0TjmTj7moPy4dIwXTmDctgAXG+wGeFn+mB1AsovFqdMuf70pomqriFwth9dNjWi
         vyhrfvmV4Tu172FmH9Zbsbp6eAhBWkZuqqyFSfZDl2mpat/jfkV5Z8Fc/vEDmz1hc88A
         LjxtjIOk/XUVdIJavYj3qrrFC9ogUKZPwxl5BTisPeYXYlUnl3jbUWPdVG6u0TPrV0bf
         5vS3/l2vkTNlu4T05LtDdwNTYT3ieXNRDCQ9rCKi4OGgUTJ75cqtox3xuSKAXma9lUzm
         h8Yg==
X-Gm-Message-State: AOJu0YzI9wdsBSwpv8vR4h8lmEisyuZnv2H52yCq7lu7kZZaz6NGT6oS
	9+QSIlh+nqQbYmTOVNfSRRidFuD3QQiC9xcybwHLVAW9qzA+lesLkB75ouBsWJk0iA==
X-Gm-Gg: ASbGncuzvofgdTKCic7Mzwag4RP8WFBjilJu6ZADSI3cPbtSwqXHuYv1YvGEJEWLajt
	DiE2SD+v2+kdmN9XVxj/bRMhz5Cs9Utfip4AECP+35LXnGNA9shlV02uCp1u95oSpc4k9ihw4pv
	oDY7KONs1RZEzNI8sIxWFAxlLVH0hbNOA1P+DW0y4CjjrG8aI5df+hs/ZRLpH3oNSis2pGWcw+V
	ZYNeO3unNZNwaIEBJCqQdENQQsEaaylBlLrhmDL549wuJUw7q9uKeaU6yPG70FoJk7iUs5l4rSj
	sI4R0/wzDVHty0MhjWcddhAMnPX5wgL3MTZVDE24dG2UqB9VtDRTV1kqJW2wRcFLMegQxUZDO2o
	d+Peqy7+2t6muFHaLYYbprYsb7MeOQjTDs9YtjQXjsPiXPu12qOuIX3Hy9wqOG8GF80HsGpj5w7
	jgiQ4ihqND9fSePbHb/ivxPf5wD9n2WX0ew47D
X-Google-Smtp-Source: AGHT+IFJA/h/QLfdmeZVnSfEDxUMn5YwLjE6s00CujvlhYtYPN7yAh0UtTJmDAuTJfLOT+Ibj5KsQw==
X-Received: by 2002:a05:6000:4a05:b0:426:d51c:4be8 with SMTP id ffacd0b85a97d-426d51c4d09mr6166703f8f.19.1760361869738;
        Mon, 13 Oct 2025 06:24:29 -0700 (PDT)
Message-ID: <7ee0a532-0388-4977-9409-4d3600405c11@suse.com>
Date: Mon, 13 Oct 2025 15:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] XHCI_NO_64BIT_SUPPORT on ASM1042A USB controller breaks
 PCIE passthrough
To: Aliz 'Randomdude' <randomdude@gmail.com>
References: <CAEMXWCDS37Bd87SA=d3bSEVOzJsM_+TJoT0kO4ZUT0ShgNiA5A@mail.gmail.com>
Content-Language: en-US
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
In-Reply-To: <CAEMXWCDS37Bd87SA=d3bSEVOzJsM_+TJoT0kO4ZUT0ShgNiA5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 15:15, Aliz 'Randomdude' wrote:
> Hi all. Many thanks for Xen.
> 
> I'm attempting to perform PCI passthrough of my RocketU 1144D USB
> controller from an XCP-ng host (XCP-ng 8.3.0, kernel 4.19.0+1) to a
> Linux guest. This card uses a PLX PCIe switch IC and four ASM1042A USB
> controller ICs, of which I forward a single ASM1042A.
> 
> The ASM1042A is detected in the guest VM and initially appears to work
> OK, but after I dd some gigabytes to an attached USB disk device, the
> controller appears to go away:
> 
> [   81.076381] xhci_hcd 0000:00:09.0: xHCI host not responding to stop
> endpoint command
> [   81.079319] xhci_hcd 0000:00:09.0: xHCI host controller not
> responding, assume dead
> [   81.081503] xhci_hcd 0000:00:09.0: HC died; cleaning up
> [   81.083388] usb 5-1: USB disconnect, device number 2
> 
> At this point, the controller is unusable until I reset it (via
> /sys/bus/pci/devices/../remove and /sys/bus/pci/rescan). I am able to
> trigger this behavior reliably, although sometimes some 30GB must be
> transferred before symptoms appear.
> 
> The guest is running a 6.12.50 kernel I built from vanilla sources.
> 
> After much head-scratching, I discovered that some older guest kernels
> function correctly, and do not exhibit the bug, allowing sustained use
> of the controller.
> 
> I then proceeded to bisect my way to the following Linux kernel patch
> (see https://lists-ec2.96boards.org/archives/list/linux-stable-mirror@lists.linaro.org/thread/WEVQDDJC72LMLPQY37JOZZNKMJ7OHHFL/):
> 
>> I've confirmed that both the ASMedia ASM1042A and ASM3242 have the same
>> problem as the ASM1142 and ASM2142/ASM3142, where they lose some of the
>> upper bits of 64-bit DMA addresses. As with the other chips, this can
>> cause problems on systems where the upper bits matter, and adding the
>> XHCI_NO_64BIT_SUPPORT quirk completely fixes the issue.
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Forest Crossman cyrozap@gmail.com
>> Signed-off-by: Mathias Nyman mathias.nyman@linux.intel.com
>> ---
>>  drivers/usb/host/xhci-pci.c | 8 ++++++--
>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>
>>
>> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
>> index 1f989a49c8c6..5bbccc9a0179 100644
>> --- a/drivers/usb/host/xhci-pci.c
>> +++ b/drivers/usb/host/xhci-pci.c
>> @@ -66,6 +66,7 @@
>> #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI 0x1142
>>  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI 0x1242
>>  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI 0x2142
>> +#define PCI_DEVICE_ID_ASMEDIA_3242_XHCI 0x3242
>>
>>
>> static const char hcd_name[] = "xhci_hcd";
>>
>>
>> @@ -276,11 +277,14 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>>      pdev->device == PCI_DEVICE_ID_ASMEDIA_1042_XHCI)
>>      xhci->quirks |= XHCI_BROKEN_STREAMS;
>>     if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
>> - pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
>> + pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI) {
>>      xhci->quirks |= XHCI_TRUST_TX_LENGTH;
>> + xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
>> + }
>>     if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
>>         (pdev->device == PCI_DEVICE_ID_ASMEDIA_1142_XHCI ||
>> -      pdev->device == PCI_DEVICE_ID_ASMEDIA_2142_XHCI))
>> +      pdev->device == PCI_DEVICE_ID_ASMEDIA_2142_XHCI ||
>> +      pdev->device == PCI_DEVICE_ID_ASMEDIA_3242_XHCI))
>>      xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
>>
>>
>> if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> 
> Reverting this patch fixes my immediate issue - the USB controller now
> functions as expected. However, I am way out of my depth here and
> strongly suspect that doing so will break things in subtle ways, and
> so this is where I hand off to the experts for proper analysis. In
> particular, I'd be interested to learn under which circumstances
> reverting this patch is dangerous - does 'systems where the upper bits
> matter' apply only to something relatively exotic? I ask in order to
> determine if it is safe to revert this patch in my homelab-grade
> setup.

I fear that with this report xen-devel@ isn't a useful list to send to;
you rather want to report to the corresponding Linux list.

Jan

> In case it is useful, here are further details of my set-up:
> 
> * Dell R710 with BIOS 6.0.0
> * 2x E5630 CPU and 64GB RAM
> * XCP-ng 8.3.0 on the host
> * Guest OS is Linux 6.12.0, built from vanilla kernel.org sources
> * Guest runs in PVHVM mode
> * PCI controller is the RocketU 1144D, which uses a PLX PEX8609 PCIe
> switch IC connected to four ASM1042A controllers (allowing me to
> forward each controller to a seperate VM)
> * The firmware on the ASM1042A is up-to-date AFAICT
> * The forwarded PCI device is connected to a JMS578-based disk array
> containing three mechanical disks
> * The problem exhibits in the guest VM after I run 'dd if=/dev/urandom
> of=/dev/<disk> bs=1M count=10240 conv=sync', although it sometimes
> needs up to three invokations
> * After reverting the patch, I can run the above command without
> problems ten times
> * The same hardware works OK in ESXi.
> 
> I'm happy to provide further details, and please accept my apologies
> in advance for any breach of etiquette - I don't report this kind of
> bug very often.
> 


