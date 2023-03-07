Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2286AEC9D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 18:56:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507761.781732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZbYB-0005al-4U; Tue, 07 Mar 2023 17:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507761.781732; Tue, 07 Mar 2023 17:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZbYB-0005Xw-1A; Tue, 07 Mar 2023 17:56:35 +0000
Received: by outflank-mailman (input) for mailman id 507761;
 Tue, 07 Mar 2023 17:56:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZbYA-0005Xq-8A
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 17:56:34 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 655d4ebd-bd11-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 18:56:33 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so7755651wmq.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 09:56:33 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a056000110400b002ce3b31753fsm12186758wrw.26.2023.03.07.09.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 09:56:32 -0800 (PST)
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
X-Inumbo-ID: 655d4ebd-bd11-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678211793;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gQSkQKXVqCcGQhbgWI2VTbT227cYGUJyB9WO8S2uqmU=;
        b=GHgrklShTonRXBkjDkbzTfw2hfrq8ZCqc7Ne5PdUD9OdYtMyn3jpERxviqNAXRA2hr
         pgf1Sfvubx7F+s2nP6jwCCj0hEa9C/SaBSCzO6EWncetroCmh/h85Av5I6LGaYVRT38t
         IedjlRVy664vFo8n0W1ysf0AqlTPsKaG+ZPDuh8UwtkMBTPjDOl7ICund4Db4hme47n1
         +fi3XPkWF2S9TlIgXe7QbMf9HBPymMfUIkGYlEBqRoGqJa/HTNJ8YMETIL6q2VA9glJX
         9zJfe0sa1Lx+zK/LxBEKra2AUp2z2pzrPjb+ODhqcQHW4ypOQQ3aKwbG26zw2E5TBrst
         +QUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678211793;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQSkQKXVqCcGQhbgWI2VTbT227cYGUJyB9WO8S2uqmU=;
        b=TeUn1xtDEUWgOyVl7l9M/+UBdeqSJq7s64AbbBGdRkxxWfX903OqX9TwxfIvoXhN1m
         qPm6nK6lrcp/JBz109GMlvs9rG4udeHXOACXCkg8+W9SVECRtjUe110UqX8D2yM7iAjM
         nj0ywrT384BTt2Zy09GN7ojZTQ3Nyo2x1Kp1FMks1VhtiQvOUzncDp+NT4kMgUHqUfWX
         SWDV7g1UK2VhaP1iMn09g2ukaSyp32I4T8hbTJwS42BeVWA5Nsxjux7ujAzIE1efGxmk
         YuMWo/Jq/mf9SGLFLgS37n3MWJkgd7w6imzA64Ut6TxX4Rh7hervWeedCIwJaJw0tF5T
         DxQg==
X-Gm-Message-State: AO0yUKWCMYucJly9t9iWdqk6vXv9iMPN+whNEZAd2HC38iOPgzBAHDiP
	tBhrjR1VUZhYpZHzItpjtdU=
X-Google-Smtp-Source: AK7set8wB+t7FiQ93ofPjATTc2z5iVBSASwMKrkgOs4VWWEY+CZ2vNEPWitNrR1Z0toY8rg2O7Rsnw==
X-Received: by 2002:a05:600c:468e:b0:3eb:29fe:f922 with SMTP id p14-20020a05600c468e00b003eb29fef922mr13585282wmo.29.1678211792618;
        Tue, 07 Mar 2023 09:56:32 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <cc9471d5-c2ce-31fb-14bb-6262abbfbd83@xen.org>
Date: Tue, 7 Mar 2023 17:56:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 25/27] i386/xen: Initialize Xen backends from
 pc_basic_device_init() for emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
 <20230307171750.2293175-26-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230307171750.2293175-26-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2023 17:17, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Now that all the work is done to enable the PV backends to work without
> actual Xen, instantiate the bus from pc_basic_device_init() for emulated
> mode.
> 
> This allows us finally to launch an emulated Xen guest with PV disk.
> 
>     qemu-system-x86_64 -serial mon:stdio -M q35 -cpu host -display none \
>       -m 1G -smp 2 -accel kvm,xen-version=0x4000a,kernel-irqchip=split \
>       -kernel bzImage -append "console=ttyS0 root=/dev/xvda1" \
>       -drive file=/var/lib/libvirt/images/fedora28.qcow2,if=none,id=disk \
>       -device xen-disk,drive=disk,vdev=xvda
> 
> If we use -M pc instead of q35, we can even add an IDE disk and boot a
> guest image normally through grub. But q35 gives us AHCI and that isn't
> unplugged by the Xen magic, so the guests ends up seeing "both" disks.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   hw/i386/pc.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 

Also...

Tested-by: Paul Durrant <paul@xen.org>

... on real Xen (master branch, 4.18) with a Debian guest.


