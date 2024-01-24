Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A783AAAB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 14:09:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670986.1044101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSczs-0002Ro-DU; Wed, 24 Jan 2024 13:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670986.1044101; Wed, 24 Jan 2024 13:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSczs-0002P3-Ah; Wed, 24 Jan 2024 13:08:52 +0000
Received: by outflank-mailman (input) for mailman id 670986;
 Wed, 24 Jan 2024 13:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I+Nb=JC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rSczr-0002Ox-02
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 13:08:51 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b65f62b6-bab9-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 14:08:48 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so5464177f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 05:08:48 -0800 (PST)
Received: from [192.168.69.100] (lgp44-h02-176-184-8-67.dsl.sta.abo.bbox.fr.
 [176.184.8.67]) by smtp.gmail.com with ESMTPSA id
 b13-20020a05600010cd00b003392c1f40acsm10050862wrx.28.2024.01.24.05.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 05:08:47 -0800 (PST)
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
X-Inumbo-ID: b65f62b6-bab9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706101728; x=1706706528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+w00aYVWLDaZ0z/ysw7lebbGl9R7ORAINPsdBB0cUQ=;
        b=hTOS2p0ExjKaXNqUUFh7nzWGkqXaVI3m3z/InsnrNvtezYv7hK9pBXZK46feyi6Qn/
         2Zut8GU2gGmWkjMTH9bnNPO5YdtSIWSkeeWvza/bH6fOLds738+HC5pLE+3RD5L727bl
         SbuDquAcWPmRcMzi1DQxJ0kVpyKPVNhxgfu8Ami/7WQWa+0PN3G8WaydOXZ7n4WbOPhQ
         gCW6xK9NA2au3pIa4l0ZSQV9Nnisar1kIU8uI5+kmwcoBoSDXfHwPPG2uJBYw7pOX77g
         Uww28HUlt8po741cB7UHM/A9CtN/f5xroRwC//Bacy3HBWP987B9eMDnncWsrYS36NN5
         yYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706101728; x=1706706528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+w00aYVWLDaZ0z/ysw7lebbGl9R7ORAINPsdBB0cUQ=;
        b=FDPWshnofT51Aj8QH0DlYSpzNlBDNYmEL8LTRS499/7cZtS2j0P+4kHwVIQATvznPG
         vQ/lB24UHDYHCMrYlyCMzWU28uHl+x2UBgfOQ/WNP4VAbiTR+ZuCiZxO+NbZe33wZPr9
         W29fVmlhW0bLbkLUk2EhpHCkNOL4ca3SXSQ5lDWxf8Y7nwNWXIQ4XG+93h21GJoNOk+3
         rsrGmjEF73ua/oxM/JblACk25lD8MV7m1D5/lmiHJHb30yLBz34Wi/h5QcSRRWpKkoma
         VbUqv9r/3+fjg5jKtvZQWNT9WG4BsrkG7ljOwVFIvjjpxcy2t51VhkaW7H57CFqaTrIX
         2Rsw==
X-Gm-Message-State: AOJu0Yzhnsv3aXiyN7nxC9Alve/V6A2LvOA/2Agv8uL/dcZz2buoKjfp
	YLw190QxmUcARg9u8DQA8yOhRLceSzOqS3eOjoZy6egGI5APpd7rT16vMQb4JmU=
X-Google-Smtp-Source: AGHT+IEuxiEzF8Ew3KDQATXOxVv+0frNsAg3XzkqsJwP9FR2cDsB2gTwNv0P4S9O4vtXVDRoWYc33w==
X-Received: by 2002:a05:6000:1291:b0:337:c4d3:cfa2 with SMTP id f17-20020a056000129100b00337c4d3cfa2mr512592wrx.30.1706101728284;
        Wed, 24 Jan 2024 05:08:48 -0800 (PST)
Message-ID: <33478869-d1c5-4f1c-9814-314e4076bfe5@linaro.org>
Date: Wed, 24 Jan 2024 14:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i386/pc_piix: Make piix_intx_routing_notifier_xen()
 more device independent
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Chuck Zmudzinski <brchuckz@aol.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson
 <richard.henderson@linaro.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240107231623.5282-1-shentey@gmail.com>
 <B404ABCE-E6B5-4716-BA60-3CEE74B72701@gmail.com>
 <20240114072529-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240114072529-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/1/24 13:25, Michael S. Tsirkin wrote:
> On Sun, Jan 14, 2024 at 12:21:59PM +0000, Bernhard Beschow wrote:
>>
>>
>> Am 7. Januar 2024 23:16:23 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>> This is a follow-up on commit 89965db43cce "hw/isa/piix3: Avoid Xen-specific
>>> variant of piix3_write_config()" which introduced
>>> piix_intx_routing_notifier_xen(). This function is implemented in board code but
>>> accesses the PCI configuration space of the PIIX ISA function to determine the
>>> PCI interrupt routes. Avoid this by reusing pci_device_route_intx_to_irq() which
>>> makes piix_intx_routing_notifier_xen() more device-agnostic.
>>>
>>> One remaining improvement would be making piix_intx_routing_notifier_xen()
>>> agnostic towards the number of PCI interrupt routes and move it to xen-hvm.
>>> This might be useful for possible Q35 Xen efforts but remains a future exercise
>>> for now.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>
>> Hi Michael,
>>
>> could you tag this, too? Or do we need another R-b?
>>
>> Best regards,
>> Bernhard
> 
> tagged, too.

FYI merged as commit ebd92d6de3.

