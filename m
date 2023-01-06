Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CF866002E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 13:26:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472509.732741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDln6-0004IS-Q0; Fri, 06 Jan 2023 12:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472509.732741; Fri, 06 Jan 2023 12:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDln6-0004FO-L5; Fri, 06 Jan 2023 12:25:44 +0000
Received: by outflank-mailman (input) for mailman id 472509;
 Fri, 06 Jan 2023 12:25:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oE+Y=5D=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pDln4-0004FI-Oh
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 12:25:42 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b2c188f-8dbd-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 13:25:40 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id l26so937018wme.5
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 04:25:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm6055371wmb.14.2023.01.06.04.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 04:25:38 -0800 (PST)
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
X-Inumbo-ID: 3b2c188f-8dbd-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cGfTsxDRG+LfoKkBFGZZ/WvwF0lb6LoKmVVmXvkk4C0=;
        b=j2BRoliK8qTd+F+OwsZmpdkMniMJPUoh7KnKOodKcQYhH8dYCE2hyVbmWCgTN/maAx
         r6eQt2KWt4gVNOl07Yrcf+URqL26xP1qlD6w0frzh8QHhCSN6G57NOTcuvs5a31tcrL9
         avJ61vY5r0QCoAeGgk2zzuozoAT4vUlXZu5A/EzY20ki4osHwGvFAMBpj/0sBdYVdyNL
         LedpN2q7UKSxvg7sEVLNNlfg27/NpLeX6nm9lg+c6dlaKgujb7BGQ5Mwx3ltCuIq/jWm
         dGR4bfGffK1SpFmx9areMCmVEZo8cuK3QDTXkDYPkwaRZljpwDvTOyTrkKc8XHSmVEl1
         8zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGfTsxDRG+LfoKkBFGZZ/WvwF0lb6LoKmVVmXvkk4C0=;
        b=Xcc1hMaebxcfcSCDVxNv3wmXy7r8lvjF2P7XSLI3JINGd5cnpByvI4lyd2gEqB10CE
         NIcH3jH7Cs5uXMzZ9MM9bIpq0eYpeyrHxOAQUTMonw3dV6LCrSCiMPD9zLJohbZcTR8Y
         vcCWqfkifcIhvL60BfD351+xAxcNxrfTUfAczL/5KSmnNj/4mE6ek8tZV9s2ShdrosLz
         kZiaUN78HvrIhfHcpfiiZwiXdae8GHKHLs+uvMOXPWWr+3oFMziJyI84McZF0t2RcUsZ
         xKtwkGp67rRSiIwIPHz6NM1W+xv02UEKrEeSbH6DWv0B69Lu5LPkFu2KsH/Lb3S8oh6w
         WDhA==
X-Gm-Message-State: AFqh2kqj8UX47c+Civ7J/U5UJ/uCR4h6reAVXwWPNbF0I2HF6JtCcYf3
	sFlJPjZC4VAmkKN1mbgJRjE87w==
X-Google-Smtp-Source: AMrXdXtK2NS9bhPqosfbghflNCW3WATI4EQme8et2nuxBkQ/Co7cKEvbgMhqSWzvFuxk9D76m9gkLw==
X-Received: by 2002:a05:600c:3d1b:b0:3d0:6a57:66a5 with SMTP id bh27-20020a05600c3d1b00b003d06a5766a5mr38329071wmb.0.1673007938784;
        Fri, 06 Jan 2023 04:25:38 -0800 (PST)
Message-ID: <6a1a6ed8-568d-c08b-91a7-1093a2b25929@linaro.org>
Date: Fri, 6 Jan 2023 13:25:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Chuck Zmudzinski <brchuckz@aol.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <B207F213-3B7B-4E0A-A87E-DE53CD351647@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <B207F213-3B7B-4E0A-A87E-DE53CD351647@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/1/23 12:57, Bernhard Beschow wrote:
> 
> 
> Am 4. Januar 2023 15:35:33 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> +Markus/Thomas
>>
>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>>    hw/i386/pc_piix.c             |  4 +---
>>>    hw/isa/piix.c                 | 20 --------------------
>>>    include/hw/southbridge/piix.h |  1 -
>>>    3 files changed, 1 insertion(+), 24 deletions(-)


>>>    -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>> -{
>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>> -
>>> -    k->realize = piix3_realize;
>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
>>> -    dc->vmsd = &vmstate_piix3;
>>
>> IIUC, since this device is user-creatable, we can't simply remove it
>> without going thru the deprecation process.
> 
> AFAICS this device is actually not user-creatable since dc->user_creatable is set to false once in the base class. I think it is safe to remove the Xen class unless there are ABI issues.
Great news!

