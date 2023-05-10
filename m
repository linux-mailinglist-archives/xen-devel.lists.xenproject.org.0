Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF146FE0A2
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 16:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532874.829211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwl1L-000174-6C; Wed, 10 May 2023 14:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532874.829211; Wed, 10 May 2023 14:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwl1L-00015O-3Y; Wed, 10 May 2023 14:42:23 +0000
Received: by outflank-mailman (input) for mailman id 532874;
 Wed, 10 May 2023 14:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e4GJ=A7=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pwl1K-00015I-Js
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 14:42:22 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de8db5ac-ef40-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 16:42:21 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-965d2749e2eso1030987266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 May 2023 07:42:21 -0700 (PDT)
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
X-Inumbo-ID: de8db5ac-ef40-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683729740; x=1686321740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83YNIqPiNpjGrPITv2xRDuTxFYp7ZVQdya3neYw7aEY=;
        b=N2Uhr2yN86qrROtaUAzgCc5rnQv4HFgiV7dRYt/vgA2mJs0O03w+kfXUD3YR4fbRuJ
         Qcwb/ir0cM3hw9WJ+ewDq+xe//7wgDnPVSnfek4z4titPXZHvKZao3eHPf0kSB9rP2+6
         qSWCIgW+kN6Z7C//mwEpf/qhLUqDIRIQAk/P8CAZBVdntF7Iyo8uc+VCqt5JGSULFWwU
         Cir3oDd6qilfJbKQ5a0D8gv1p7jSy6w/gIUeWBEPYGLPrBfvkm+TGjbwOtw9HLpcCllq
         Sw6gu8mtA3HUgitnlZed+B0ocWwqX/Gu6S9GNcyxXYrSB4Da4MVv4jybCOZrn7/OrzAd
         BpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683729740; x=1686321740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83YNIqPiNpjGrPITv2xRDuTxFYp7ZVQdya3neYw7aEY=;
        b=FzlUKjwu84Ce2B6lm6jQAfXZDv6mV5Rl5qvmLm4bws2BpHtbBzrC1+PuGZBciAtSkb
         Di49hMTK/i473gNw3EjY/R7vawiR+/JxPZU8lXtO4Kv5D84Q2Mh/8r1+67IXmCZXVy6H
         9bGBeHznwVIf4YS+825bcdINA+IBX62ir5zgS+LpOUBqxiXR7UBplJSrpVYQ7M7MmDW+
         FOoUQMoZjA6ANiG8DMMr5wsWWLeF/XJK5Imzp0PsgwQVGfreaRShPe+W0JkTRHU+G3Km
         cdLReVKScfKnx7r0IMUBfUwZZJL40QBG1Wof/iQ+jGwVMbwrYilsmMEhkBWfc4Hp71CG
         kByA==
X-Gm-Message-State: AC+VfDzX2Ns4V11BE96ZW1AlQfcE422pAriqh2esX4XV8ehPUwogbnUi
	AXjdqQW63rWYVBlML1pSZei02/hqKc4eNMebb8U=
X-Google-Smtp-Source: ACHHUZ6TO7lPHNH+bKvUr4CrwpQOrZgtyft6XS7sSLk0GVNo5CgNr6qEPUE4OUn/fndTnUvdkQfy+3GzzuNNnPu/XbA=
X-Received: by 2002:a17:907:318b:b0:962:9ffa:be19 with SMTP id
 xe11-20020a170907318b00b009629ffabe19mr16116821ejb.5.1683729740576; Wed, 10
 May 2023 07:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230508171437.27424-1-olaf@aepfle.de>
In-Reply-To: <20230508171437.27424-1-olaf@aepfle.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 May 2023 10:42:08 -0400
Message-ID: <CAKf6xpv8Oj4k6bf6fcHk=0gqEAeP95OSygCkA2HZw4dcThKWSA@mail.gmail.com>
Subject: Re: [PATCH v2] Fix install.sh for systemd
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 1:14=E2=80=AFPM Olaf Hering <olaf@aepfle.de> wrote:
>
> On a fedora system, if you run `sudo sh install.sh` you break your
> system.  The installation clobbers /var/run, a symlink to /run.  A
> subsequent boot fails when /var/run and /run are different since
> accesses through /var/run can't find items that now only exist in /run
> and vice-versa.
>
> Skip populating /var/run/xen during make install.
> The directory is already created by some scripts. Adjust all remaining
> scripts to create XEN_RUN_DIR at runtime.
>
> XEN_RUN_STORED is covered by XEN_RUN_DIR because xenstored is usually
> started afterwards.
>
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Tested-by: Jason Andryuk <jandryuk@gmail.com>

I tested with Fedora/systemd.

Thanks, Olaf.

Regards,
Jason

