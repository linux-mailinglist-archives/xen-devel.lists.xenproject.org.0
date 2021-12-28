Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123348091C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Dec 2021 13:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252237.433226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2Bch-0004Ns-M5; Tue, 28 Dec 2021 12:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252237.433226; Tue, 28 Dec 2021 12:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2Bch-0004Ky-J6; Tue, 28 Dec 2021 12:30:35 +0000
Received: by outflank-mailman (input) for mailman id 252237;
 Tue, 28 Dec 2021 12:30:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vDp=RN=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1n2Bcf-0004Ks-F3
 for xen-devel@lists.xenproject.org; Tue, 28 Dec 2021 12:30:33 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1312f9e-67d9-11ec-bb0b-79c175774b5d;
 Tue, 28 Dec 2021 13:30:32 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id q16so38097360wrg.7
 for <xen-devel@lists.xenproject.org>; Tue, 28 Dec 2021 04:30:29 -0800 (PST)
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
X-Inumbo-ID: f1312f9e-67d9-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E6MgPsTD0ZQ4tFjPuV9PYpjgE8Fs/AOENSo7Xqx1e+E=;
        b=aot/prwM5mlDVnUuE39ZXtTIWMGfmXPyC/fCFHBBVohU30Vm9tKSvDBO0v+bqlUHC7
         f718N5R9bGoICgECmlu4XkXMtD5U0NydwODfMVaGk9v3nw1b2G9g9RhTgn7AGS84iWEs
         G8vK6lAc+WF5E3ScMf1X9O+DqCwhSiWoYBb5hLonP5B6YxXMs2w7PrEhuL9eKKjaEa8M
         GAhgGxHRaGztIxJS3zQLaJvmwjG2AWkwjWPSEypb79vyaDcc/B7LUNQonXF+tIrCzCeH
         8RzX/AgF3jcBiWYK80Q4LNqIJxOrn/sU8mmoPp39P4q2bh2jGgoQHHtxwh8Bc/kcbvt2
         PqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E6MgPsTD0ZQ4tFjPuV9PYpjgE8Fs/AOENSo7Xqx1e+E=;
        b=rtY5aJB50BLJQaGDZi93qHW3djLxLRGLMDYSNjh7LgaKfvcdLeTiKXZt8JtzhY2Ou+
         UKXrbsVYjJIHBG/3JgoClbolE7t2eOuUI78zwKRA0JHw04Y+7wj9UOc8rJr+VAqMTyNM
         uR4eWAIdQuhKTtOcDYWO2cKMnJ7qz36Kl8kq/Gzqbqh/71Uh6WfofM7Oi1lLh/HFFnjO
         tLZt35W61Ww69j/xXVhqGbacavCkIPrxPpN4JedksUa1c77qrtAoz24PLfEBtgkjB5Mj
         CAVcpxu2Egi33e4zMSGPgBaRAYTve+0EKfA7tt82gH8O3CaCiEEeY+pivpQUF8V/n1b2
         R8DQ==
X-Gm-Message-State: AOAM531ZB2gMrP/CyKumGNNDzPe1SOkRl0jogCUlvquCZZZY8lTKYOXS
	WmfCq+b0FTzYXhFHuUhX6ottco9qZp+siV06h1M=
X-Google-Smtp-Source: ABdhPJzkdzVGxlWyn6EpHP03q/IYpbW383CpfT2hGUFQYOiqkcBfzUO4F79bBVAsJQWedr8TzVnuvfMiDpCMmtVSEKQ=
X-Received: by 2002:a05:6000:1869:: with SMTP id d9mr15988528wri.231.1640694629145;
 Tue, 28 Dec 2021 04:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20211224122451.1210382-1-gengdongjiu1@gmail.com>
 <22172c85-b024-a28a-e351-82038cf0efa1@xen.org> <CABSBigQjy2jvW6czAXHMvVc9DmHRED5HWz-5At6FN9gPLnzsng@mail.gmail.com>
 <9a1edb02-ad32-4229-6baf-dbe69d7e718b@xen.org> <CABSBigTZ--z_ZCGd6-VQEvfyu+166WA2C_Ns7qFiWPay9A=hUA@mail.gmail.com>
 <CAJ=z9a1o_-3A3=NKkbBT-s2EGM+WKJPiwxSt3q45PWs_9udcdw@mail.gmail.com> <CABSBigTyZ46OjvANi23e3sgL8+AKk73=3AOQnfvwhWcXhM-pgQ@mail.gmail.com>
In-Reply-To: <CABSBigTyZ46OjvANi23e3sgL8+AKk73=3AOQnfvwhWcXhM-pgQ@mail.gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 28 Dec 2021 13:30:18 +0100
Message-ID: <CAJ=z9a0dNOBHh3Gw5Q+JeHMRYqRqTrtDzk4p2MWDq2CaTFW4Dw@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: fix the build error for GIC on ARM64 QEMU Platform
To: Dongjiu Geng <gengdongjiu1@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 28 Dec 2021 at 12:37, Dongjiu Geng <gengdongjiu1@gmail.com> wrote:
> > Please don't update tiny64_defconfig. The goal of tiny64_defconfig is t=
o
> > have a config with only the bare-minimum. If add CONFIG_GICV3=3Dy, then=
 it will
> > be enabled when it is not necessary.
>
> Ok=EF=BC=8Cwe can let the user configure the CONFIG_GICV3 in tiny64_defco=
nfig
> according his neccesary.
> So I think my modification does not affect the tiny64_defconfig.

But you modified tiny64_defconfig. Anything you add in it means it is
going to be enabled by default.

> what
> is your concern about it?

As I wrote before, the goal of tiny64_defconfig is to enable the strict
minimum. I don't consider GICv3 to be part of this.

Instead, we should let each user decide whether they want to include it
depending on the platform they are targeting.

Cheers,

