Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FFB524D53
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 14:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327642.550470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np8Ds-0004Uj-Po; Thu, 12 May 2022 12:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327642.550470; Thu, 12 May 2022 12:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np8Ds-0004SP-Ml; Thu, 12 May 2022 12:47:16 +0000
Received: by outflank-mailman (input) for mailman id 327642;
 Thu, 12 May 2022 12:47:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dtm=VU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1np8Dr-0004SJ-JG
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 12:47:15 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a59e296c-d1f1-11ec-a406-831a346695d4;
 Thu, 12 May 2022 14:47:14 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id 4so6320609ljw.11
 for <xen-devel@lists.xenproject.org>; Thu, 12 May 2022 05:47:13 -0700 (PDT)
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
X-Inumbo-ID: a59e296c-d1f1-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/tJqOE6kIQEi+zf0nBOFhftnda4KhXXFhymTqP7PX/A=;
        b=ANg1dHlLXiscebbTBA27YCBP3/8bvN0Q1F9smzyveliXg1jpczAA47yuuPxLLd5+/j
         DotORAGJaiXV45KJaPf34b6rl27ToBX6Kkfu8vwRlqwDKVxJCdhWixHoqxOXhl15gxmd
         Mf0TQ3nois2yjgAwYpLfDuG4BVL+Oy7Yr85Wf9/+/Xsc+wcMPuxmf122gxSCiQG5P198
         FnyD8Np6AxE1j2F5DLsHizDl/gK+msOv9cIzpwFsh2NubbhOS9bGNLdBHTsFKbT08z39
         Dxr70DavysPntEwZAwm5xjtMGnG5MhzaUALNG/48/73IXC9TfltqUcwUoDeU7bLvHsXR
         xamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/tJqOE6kIQEi+zf0nBOFhftnda4KhXXFhymTqP7PX/A=;
        b=8GHPZIjEEjR8mPVa14BF4d2OYYnJx0jRUKA3uLtM/2ScC0wh2as/Ap7Wp/w6JhaU0m
         gzzI8v/XmEu73FhqnWYUZo8u7Q/h1PF/BC1orSzdnMd8Fk62l0EE4WFsn7/+WwlMGdap
         3XndlqsbmwhgyrhXNKXZRVq06Av8iygMifpr/EM1cjco37zdrGtImYuTyCsTgkyA1mr1
         7k+uXiFpHIEATK7FGq4EiX1H0DUkrQKT3EsyWFUkSCDiwtpWZu0KDSA1v7DFlS8CoNr1
         Hj/LED/G8fgegtsIveSsoJBmjvl1wRvm+ZaM9ejfcHtl4d1SDpPspxrnKS7rQVv+Hzl5
         C4/Q==
X-Gm-Message-State: AOAM530IkGhgYR+wNy2uN2bSFwA3zGuOa2A4E7iI1XNjGcX/VM/FYErF
	lbhrF2rCgAW2olvy0zO+NIVR5DIrvK3lZXh2y/4PUl5100s=
X-Google-Smtp-Source: ABdhPJy8qUI9Ry+PFIGC+JQOoY3GG2BXMeVTfCuRyEbnQU7FK/YO97mirOuwUu0/qyNn3ohAKQjn+0oA9HrffontGX4=
X-Received: by 2002:a2e:a7cd:0:b0:24f:505f:737d with SMTP id
 x13-20020a2ea7cd000000b0024f505f737dmr20798135ljp.168.1652359633099; Thu, 12
 May 2022 05:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <YnwNjgtWtKaVLIuu@mail-itl>
In-Reply-To: <YnwNjgtWtKaVLIuu@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 12 May 2022 08:47:01 -0400
Message-ID: <CAKf6xpt8TeRYkbG3p=trqWjsw86sahYV_NKVPxergjsu7orocQ@mail.gmail.com>
Subject: Re: xen-blkfront crash on xl block-detach of not fully attached device
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 3:25 PM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> Hi,
>
> The reproducer is trivial:
>
> [user@dom0 ~]$ sudo xl block-attach work backend=3Dsys-usb vdev=3Dxvdi ta=
rget=3D/dev/sdz
> [user@dom0 ~]$ xl block-list work
> Vdev  BE  handle state evt-ch ring-ref BE-path
> 51712 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51=
712
> 51728 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51=
728
> 51744 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51=
744
> 51760 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51=
760
> 51840 3   241    3     -1     -1       /local/domain/3/backend/vbd/241/51=
840
>                  ^ note state, the /dev/sdz doesn't exist in the backend
>
> [user@dom0 ~]$ sudo xl block-detach work xvdi
> [user@dom0 ~]$ xl block-list work
> Vdev  BE  handle state evt-ch ring-ref BE-path
> work is an invalid domain identifier
>
> And its console has:
>
> BUG: kernel NULL pointer dereference, address: 0000000000000050
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 80000000edebb067 P4D 80000000edebb067 PUD edec2067 PMD 0
> Oops: 0000 [#1] PREEMPT SMP PTI
> CPU: 1 PID: 52 Comm: xenwatch Not tainted 5.16.18-2.43.fc32.qubes.x86_64 =
#1
> RIP: 0010:blk_mq_stop_hw_queues+0x5/0x40
> Code: 00 48 83 e0 fd 83 c3 01 48 89 85 a8 00 00 00 41 39 5c 24 50 77 c0 5=
b 5d 41 5c 41 5d c3 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 <8b> 47 50 85 c0=
 74 32 41 54 49 89 fc 55 53 31 db 49 8b 44 24 48 48
> RSP: 0018:ffffc90000bcfe98 EFLAGS: 00010293
> RAX: ffffffffc0008370 RBX: 0000000000000005 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000000
> RBP: ffff88800775f000 R08: 0000000000000001 R09: ffff888006e620b8
> R10: ffff888006e620b0 R11: f000000000000000 R12: ffff8880bff39000
> R13: ffff8880bff39000 R14: 0000000000000000 R15: ffff88800604be00
> FS:  0000000000000000(0000) GS:ffff8880f3300000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000050 CR3: 00000000e932e002 CR4: 00000000003706e0
> Call Trace:
>  <TASK>
>  blkback_changed+0x95/0x137 [xen_blkfront]
>  ? read_reply+0x160/0x160
>  xenwatch_thread+0xc0/0x1a0
>  ? do_wait_intr_irq+0xa0/0xa0
>  kthread+0x16b/0x190
>  ? set_kthread_struct+0x40/0x40
>  ret_from_fork+0x22/0x30
>  </TASK>
> Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_t=
imer snd soundcore ipt_REJECT nf_reject_ipv4 xt_state xt_conntrack nft_coun=
ter nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defra=
g_ipv4 nft_compat nf_tables nfnetlink intel_rapl_msr intel_rapl_common crct=
10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel xen_netfront pcs=
pkr xen_scsiback target_core_mod xen_netback xen_privcmd xen_gntdev xen_gnt=
alloc xen_blkback xen_evtchn ipmi_devintf ipmi_msghandler fuse bpf_preload =
ip_tables overlay xen_blkfront
> CR2: 0000000000000050
> ---[ end trace 7bc9597fd06ae89d ]---
> RIP: 0010:blk_mq_stop_hw_queues+0x5/0x40
> Code: 00 48 83 e0 fd 83 c3 01 48 89 85 a8 00 00 00 41 39 5c 24 50 77 c0 5=
b 5d 41 5c 41 5d c3 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 <8b> 47 50 85 c0=
 74 32 41 54 49 89 fc 55 53 31 db 49 8b 44 24 48 48
> RSP: 0018:ffffc90000bcfe98 EFLAGS: 00010293
> RAX: ffffffffc0008370 RBX: 0000000000000005 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000000
> RBP: ffff88800775f000 R08: 0000000000000001 R09: ffff888006e620b8
> R10: ffff888006e620b0 R11: f000000000000000 R12: ffff8880bff39000
> R13: ffff8880bff39000 R14: 0000000000000000 R15: ffff88800604be00
> FS:  0000000000000000(0000) GS:ffff8880f3300000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000050 CR3: 00000000e932e002 CR4: 00000000003706e0
> Kernel panic - not syncing: Fatal exception
> Kernel Offset: disabled

This looks like it may be blkfront_closing() calling
blk_mq_stop_hw_queues() with info->rq =3D=3D NULL.  info->rq is only
assigned in blkfront_connect(), which is called for state 4, but your
vbd never made it through there.  It seems like blkfront_closing()
should NULL check info->rq and info->gd before using them.

Regards,
Jason

