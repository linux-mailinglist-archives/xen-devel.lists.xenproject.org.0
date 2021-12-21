Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C359A47C64E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 19:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250553.431572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzjjM-0005SD-5c; Tue, 21 Dec 2021 18:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250553.431572; Tue, 21 Dec 2021 18:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzjjM-0005Pa-2c; Tue, 21 Dec 2021 18:19:20 +0000
Received: by outflank-mailman (input) for mailman id 250553;
 Tue, 21 Dec 2021 18:19:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9qtw=RG=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1mzjjJ-0005PU-SC
 for xen-devel@lists.xen.org; Tue, 21 Dec 2021 18:19:17 +0000
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81550fe5-628a-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 19:19:16 +0100 (CET)
Received: by mail-io1-f46.google.com with SMTP id z26so18763060iod.10
 for <xen-devel@lists.xen.org>; Tue, 21 Dec 2021 10:19:16 -0800 (PST)
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
X-Inumbo-ID: 81550fe5-628a-11ec-bb0b-79c175774b5d
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDlfNhDCr4ohIGOVlzAAXPJw620YBKRYu7z6otJRRqo=;
        b=GZ2tcSgVyh42LN23MarqaNcX4TPV7atVeU2oPlNLEZLHq2ApbA3AGEvZmjQRxDsPOL
         mm246/dOxROrFDHCWpEBnqvQXhySNBkqxwdI9bj/M4irwZ5FJZ9gPAqsx4KQZ0DiL+DG
         lB198IUgCsQPHRroAr6wu8QCadZlM1JRe22UBkqoRxdH7fc7ylRVrRwfLgdgBOs4luyo
         kW4BC2v9E2SG57apOmKQUnG/SS5b3PvuuBCxSHPEOv9G31DDiSzijmEacfMi5lgWID1T
         71ru9ZwyvBwZ6h1N2YyqYehLLD+IuwaoObwo1Ln8EpdnFUO/eJQY0aF61LcZJC69zfcG
         ffOg==
X-Gm-Message-State: AOAM531PBSEU3Fdk2EzgHbFm81nhy+Rn9J3cvV4rcXXQjq3MUXwmqJDB
	ZCjv8nIh0tsQxqVcaKWeyOJ3EWicDU9pCSxH8Ec=
X-Google-Smtp-Source: ABdhPJw9kK6GIdqU+VGH8k3QRZaYrwVr2GgW50MNN73utoaTGpsAs7UdysR7LSzU6J+BsoJ5GaC0gFVs++jSwVTX3IU=
X-Received: by 2002:a05:6638:2055:: with SMTP id t21mr985394jaj.298.1640110755202;
 Tue, 21 Dec 2021 10:19:15 -0800 (PST)
MIME-Version: 1.0
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
 <CAKhsbWYLC+cEuaJefi4Zy1ZcZaOtM6_2WV+9uq8=pTdi5NYLJA@mail.gmail.com>
 <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com> <YcHbuug9AECvKXm9@Air-de-Roger>
In-Reply-To: <YcHbuug9AECvKXm9@Air-de-Roger>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Wed, 22 Dec 2021 02:19:03 +0800
Message-ID: <CAKhsbWZkSoM-N=HXfb_OeSGLqYMdtcxRph+=_vqp6tjHgikYVQ@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"

> > I omitted all operational details with the assumption that you are familiar
> > with TrueNAS and iSCSI setup.
>
> Not really. Ideally I would like a way to reproduce that can be done
> using iperf, nc or similar simple command line tool, without requiring
> to setup iSCSI.
I think it would be tricky then. The problem hide itself well enough
that I wasn't
aware soon after upgrading since everything else works flawlessly --
nfs, ssh, web etc.

> Can you also paste the output of `ifconfig xn0`?
Here it is:
xn0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
    options=503<RXCSUM,TXCSUM,TSO4,LRO>
    ether 00:18:3c:51:6e:4c
    inet 192.168.1.9 netmask 0xffffff00 broadcast 192.168.1.255
    media: Ethernet manual
    status: active
    nd6 options=1<PERFORMNUD>

>
> If I provided a patch for the FreeBSD kernel, would you be able to
> apply and test it?
Probably. I did this before when your XEN support for freeBSD was not
available out-of-box.
Just need to recreate all the required environments to apply the patch.

BTW, uname -a gives me the following;
>12.2-RELEASE-p11 FreeBSD 12.2-RELEASE-p11 75566f060d4(HEAD) TRUENAS  amd64

Thanks,
Timothy

