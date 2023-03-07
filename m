Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17A6AE693
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507605.781332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaDn-0007Ro-6Z; Tue, 07 Mar 2023 16:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507605.781332; Tue, 07 Mar 2023 16:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaDn-0007PW-3h; Tue, 07 Mar 2023 16:31:27 +0000
Received: by outflank-mailman (input) for mailman id 507605;
 Tue, 07 Mar 2023 16:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZaDl-0007PQ-4X
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:31:25 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f5e32b7-bd05-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 17:31:23 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so7586569wmq.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 08:31:22 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a05600c075500b003e0238d9101sm13175109wmn.31.2023.03.07.08.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:31:21 -0800 (PST)
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
X-Inumbo-ID: 7f5e32b7-bd05-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678206682;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8PPHIiqZxa3L0uXzrMAf95TuF6VyLOpGaQVqR/kzng=;
        b=ShQTB23gTN45msD948o2BBk8KBe9YJifn3GhToqW84Qu3D3E4HeaiuXZHrLlw6SUe3
         H/02Y9dOtBR4N5EQVyG2n9ipP1U/PdYU70K+Id9NNOSczAKuob3DJ9edC0o+IxhnupfS
         8DUJKJ/lhOBY0h+bRKeab7TzwljNwXDLNb5RyK6F3ECP4JzTG8/ZEaJazUJ9F59iB0Tx
         VmyEJCsfLK0AfWhbm/B0zdboBomQDvpfqiZNQYTEmBm9hDcGBLeS5r/GBB6G7gp7510M
         ZDN9NdLVjtbK9R9h9xlv+wjz2KmmZ/fq4MMDNvEjy41LwLd75ag0aPuvA70k/xB3uUqo
         yzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206682;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8PPHIiqZxa3L0uXzrMAf95TuF6VyLOpGaQVqR/kzng=;
        b=2qR1JZndtXzkhP+WvcDENFa2zNYtduNXK9/kieCM0SUs45cO3uAo6bdch04Gjks5aM
         Y7wA4dNSfbZYBGu2u52oF0c6166XWois4DrQWUnX4xQTdh/wfc7aH5grPjq+vB/h4ni4
         MaCg9IrN6X753WXEMNj+ot36QCBfu4B+oaQVEJs+xjXf0tK7uESCQEoQmim/Xk3rMBDC
         NIt7JTVRh/1lqeWFML/dCgScVBbQk0NTMgfKycRzJzgTUcY+Tkq/WJCMKUs29jhRM597
         Sdy/D0Hfz1wU8TTaMPwPej22y0tPS5Z0kbicnRWU+zNwsibmZcYKoG3SzzvE83WEuijJ
         bZRA==
X-Gm-Message-State: AO0yUKUWSAjjz+PQ6BuZmaEfNtyWF/Gl75cmhD2/XuuLl7uVWPNqhcpY
	YB84BrYAOW+G/amROWyFHhQ=
X-Google-Smtp-Source: AK7set9YFZieeppgaH6M5VkSwbWJwsbmNo2aCJV0mrnxq2RJI0LIPvzDXyCZPWYdggIvhWNebxOjaw==
X-Received: by 2002:a05:600c:4fc2:b0:3eb:37ce:4c3e with SMTP id o2-20020a05600c4fc200b003eb37ce4c3emr13739027wmq.16.1678206682265;
        Tue, 07 Mar 2023 08:31:22 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3a32f2e4-b45f-ed78-3f0b-acc7050488d5@xen.org>
Date: Tue, 7 Mar 2023 16:31:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 25/25] i386/xen: Initialize Xen backends from
 pc_basic_device_init() for emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-26-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-26-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
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
> ---
>   hw/i386/pc.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


