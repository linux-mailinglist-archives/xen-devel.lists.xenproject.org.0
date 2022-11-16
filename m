Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F1162C8D2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 20:16:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444395.699556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovNsn-0006KJ-P7; Wed, 16 Nov 2022 19:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444395.699556; Wed, 16 Nov 2022 19:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovNsn-0006Hf-MR; Wed, 16 Nov 2022 19:15:37 +0000
Received: by outflank-mailman (input) for mailman id 444395;
 Wed, 16 Nov 2022 19:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=APSV=3Q=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ovNsm-0006HZ-5r
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 19:15:36 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0be2eefa-65e3-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 20:15:35 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id 21so28093281edv.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Nov 2022 11:15:35 -0800 (PST)
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
X-Inumbo-ID: 0be2eefa-65e3-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9qI+icUfecGM5aEXi1wLqFbcmy/8kfIaJ2CdGEr+qY=;
        b=pp08S/M4nd8Tjj7HnvOL2k/2yxOseTicNANPQqj1LsB2RCtM7K68HZcK4ruJ7zBLaa
         2V4rHUU4qtKg76l7LaozxgXlyZHzu5LCIMvzEFQIYf4u/nT7v+GKTYjATzrAf/mgV21B
         p6ySG1lTvBwzIx/vFU+FuKpYKSK6R+zqW77J227TMq0Jj8sLb/2+zoh29YhE+NExG2NN
         BUJR3I5ZaYWEOGdh6j8tpUMUx/iVagV9hcdqJZYvCqRculJiFlagl1vU8pF4dSFfeLnX
         tNvlVGOt1oMuWbe0kqQmgJupRO3VNz8UTg79zAVm9nwTn2JxykxnRCeYxWWQSAhvex57
         K61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9qI+icUfecGM5aEXi1wLqFbcmy/8kfIaJ2CdGEr+qY=;
        b=5DaaHXqzx9fEccU1ZBrT9nLKW57Ot1ecm9H2IcNCk/a22N5YFuzwFTqWKgUoed4z3b
         w4sy6dCbeDSVIzTNfEQWS7E72tJqdhwxx4hltPje2MQBU+RcLOFnAJ+/yu0O5xtXk6I8
         Xgruk3lz2Ph8/9r0nG760InjfaBjZdSTOqPoU84PNnhnMhyz7GzaAZbqcQwCo+25bG9a
         EazXmq3JtT5xyCpDqFvf6CcBKF33g+F2Fu4ZVNXJ21GXTxOWg0lTduUDA25NHXD6PiKb
         KBZl6i/Q0vhMWgibx7EwTJwaZMfLFdOMJfIJJLKL8d6P6eCt9EUG/badqAXwyucpNu7p
         CcWA==
X-Gm-Message-State: ANoB5pkNeQPg0Fmb4SJ0cmhABS9JLq8mtLH+jMihnLxp/r1atk2mpySl
	nmt8U1xDeUU2vHbO3KLUPGs0jrQY+/MAdyRYVCI=
X-Google-Smtp-Source: AA0mqf460KZmOzPdB65VsL8WstVQNNL/kkGB4YpwZ1HtXGdIP15UNObEbaawGu1MRfPB5+lI836EXhqkCxAOgiIZPO8=
X-Received: by 2002:a05:6402:229b:b0:457:d794:f5ee with SMTP id
 cw27-20020a056402229b00b00457d794f5eemr20852477edb.227.1668626134584; Wed, 16
 Nov 2022 11:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com> <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
In-Reply-To: <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 16 Nov 2022 14:15:22 -0500
Message-ID: <CAKf6xpvpsJuMZx98vLJ7CAmUWG-vW91Am0L8817eD8nmAN4NUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on Xen
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 2:21 PM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> The /dev/mem is used for two purposes:
>  - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
>  - reading Pending Bit Array (PBA)
>
> The first one was originally done because when Xen did not send all
> vector ctrl writes to the device model, so QEMU might have outdated old
> register value. This has been changed in Xen, so QEMU can now use its
> cached value of the register instead.
>
> The Pending Bit Array (PBA) handling is for the case where it lives on
> the same page as the MSI-X table itself. Xen has been extended to handle
> this case too (as well as other registers that may live on those pages),
> so QEMU handling is not necessary anymore.
>
> Removing /dev/mem access is useful to work within stubdomain, and
> necessary when dom0 kernel runs in lockdown mode.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

I put the Xen, QEMU, and xen-pciback patches into OpenXT and gave a
little test.  When pci_permissive=3D0, iwlwifi fails to load its
firmware.  With pci_permissive=3D1, it looks like MSI-X is enabled. (I
previously included your libxl allow_interrupt_control patch - that
seemed to get regular MSIs working prior to the MSI-X patches.)  I
also removed the OpenXT equivalent of 0005-Disable-MSI-X-caps.patch.
I am testing with Linux 5.4.y, so that could be another factor.

One strange thing is the lspci output.  Dom0 shows MSI-X enabled.
Meanwhile NDVM (sys-net) does not show the MSI-X capability.  If you
`hexdump -C /sys/bus/pci/devices/$dev/config` you can see MSI-X
enabled, but you also see that the MSI capability has 00 as the next
pointer, so lspci stops parsing.

MSI cap stubdom:
00000040  10 00 92 00 c0 0e 00 00  10 0c 10 00 00 00 00 00  |..............=
..|
0x41 -> next 0x00
MSI cap dom0:
00000040  10 80 92 00 c0 0e 00 10  10 0c 10 00 00 00 00 00  |..............=
..|
0x41 -> next 0x80

MSI-X:
00000080  11 00 0f 80 00 20 00 00  00 30 00 00 00 00 00 00

AFAIU, the value 0x80 at offset 0x83 is MSI-X Enabled.

I had a boot where assignment failed with the hypervisor printing:
d12: assign (0000:00:14.3) failed (-16)
Rebooting the laptop seemed to clear that.

Regards,
Jason

