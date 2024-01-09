Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7673828FEF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 23:29:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665202.1035381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNKb8-0006fH-6U; Tue, 09 Jan 2024 22:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665202.1035381; Tue, 09 Jan 2024 22:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNKb8-0006cw-3a; Tue, 09 Jan 2024 22:29:26 +0000
Received: by outflank-mailman (input) for mailman id 665202;
 Tue, 09 Jan 2024 22:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1ngr=IT=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1rNKb6-0006cm-JI
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 22:29:24 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a196618-af3e-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 23:29:23 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e5521db08so3784305e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 14:29:23 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-075-077.77.183.pool.telefonica.de.
 [77.183.75.77]) by smtp.gmail.com with ESMTPSA id
 gv2-20020a170906f10200b00a26a80a58fcsm1436941ejb.196.2024.01.09.14.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 14:29:22 -0800 (PST)
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
X-Inumbo-ID: 8a196618-af3e-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704839363; x=1705444163; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eShGOOYzJgkxXcf3BN0KmzlHl9tWf4UCVl9RkW3Vs4=;
        b=bja3Pwrds4+IRtEpG7FDoqVoFCRU1rY42RD8VxMZlCEtmfms0MvvkghwzlJewHMdim
         6utkzv3TmfwSjwdkFLZX3PhmkrTb65OTu1A0jdm+sWA8mPlaQYPzy7lpfOmW921V70BW
         TPfYpVzLW+dQ8pc24lsrtOcBwHALBm0V6iJtMaw9wcd3vb+BD8kWlpkSNR5DtdsBYMBg
         NdWDz8ZalFrk7F1VzZ9UQAYTT8kdaNJKYbZaMlmKqd8zQ5bcOimIFemyfCJyI5f6WJqh
         EQa9bwE8+QCyPWFw+Eht7LoQo/lLngXyF4k12u6tyNdOeLJS9Ro8V0Ef5ILqHIoDh1aj
         3RnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704839363; x=1705444163;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eShGOOYzJgkxXcf3BN0KmzlHl9tWf4UCVl9RkW3Vs4=;
        b=JukPT4gJ3dvjRa+K9sGuLJL49p0QwyjGPMRwnz1m30MUj18LT2HK+/sh5bGxNzbQjy
         X9ZviVKFIrULo/GICrudeodbd+30AcJxdGLbPI8lf1TYBbeZOpI2/QWBswOpE01ZxbDL
         p+ZidxsvqJlmogvTUXM1bHy3AFXttEj1wjQKOXYNS21RNt960nDt2hrpvbyfQfQMwP2J
         fVqbBbNj82wbDbd/bcPM9FDA0kn3I6LZcNNPNMrLGvPMZagq4HE9c8S/q4Vp4BuZaWPo
         EVU0ZgjcnNoXtmS+LHDOKfsu2beghPmlYl07Ta8kHV5dMX6iEYN3nLImfoY8cR8SM19u
         mAgA==
X-Gm-Message-State: AOJu0YxEfYbT48oPLyffPhNSrLuc9Pua9W8bjV80fzj/sn0obI4EszTU
	pbVQt56buWg9tJpihrlXDP8=
X-Google-Smtp-Source: AGHT+IGsBx67M/CXG5ZKy9tf7B4FVsHy9jr6Taj33qNRJvhUESGymMQxI/zxyIILVvrQVh9ToM40Dw==
X-Received: by 2002:a05:600c:68d4:b0:40e:48e6:a6e3 with SMTP id jd20-20020a05600c68d400b0040e48e6a6e3mr8858wmb.149.1704839362816;
        Tue, 09 Jan 2024 14:29:22 -0800 (PST)
Date: Tue, 09 Jan 2024 22:29:14 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
CC: Chuck Zmudzinski <brchuckz@aol.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_hw/i386/pc=5Fpiix=3A_Make_piix=5Fintx=5Fr?= =?US-ASCII?Q?outing=5Fnotifier=5Fxen=28=29_more_device_independent?=
In-Reply-To: <7d24b5aa384a492b3bd33f50906e3f000b1ff6a0.camel@infradead.org>
References: <20240107231623.5282-1-shentey@gmail.com> <7d24b5aa384a492b3bd33f50906e3f000b1ff6a0.camel@infradead.org>
Message-ID: <9FEEB450-CA3D-4960-8C7D-BC837C93E58D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 9=2E Januar 2024 08:51:37 UTC schrieb David Woodhouse <dwmw2@infradead=
=2Eorg>:
>On Mon, 2024-01-08 at 00:16 +0100, Bernhard Beschow wrote:
>> This is a follow-up on commit 89965db43cce "hw/isa/piix3: Avoid Xen-spe=
cific
>> variant of piix3_write_config()" which introduced
>> piix_intx_routing_notifier_xen()=2E This function is implemented in boa=
rd code but
>> accesses the PCI configuration space of the PIIX ISA function to determ=
ine the
>> PCI interrupt routes=2E Avoid this by reusing pci_device_route_intx_to_=
irq() which
>> makes piix_intx_routing_notifier_xen() more device-agnostic=2E
>>=20
>> One remaining improvement would be making piix_intx_routing_notifier_xe=
n()
>> agnostic towards the number of PCI interrupt routes and move it to xen-=
hvm=2E
>> This might be useful for possible Q35 Xen efforts but remains a future =
exercise
>> for now=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>
>I'm still moderately unhappy that all this code is written with the
>apparent assumption that there is only *one* IRQ# which is the target
>for a given INTx, when in fact it gets routed to that pin# on the
>legacy PIC and a potentially *different* pin# on the I/O APIC=2E

Would TYPE_SPLIT_IRQ help in any way?

>
>But you aren't making that worse, so
>
>Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>

Thanks!

