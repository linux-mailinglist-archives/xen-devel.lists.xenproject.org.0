Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212CCBEF784
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 08:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145987.1478487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAjLy-0005Sv-Px; Mon, 20 Oct 2025 06:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145987.1478487; Mon, 20 Oct 2025 06:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAjLy-0005RV-MO; Mon, 20 Oct 2025 06:26:46 +0000
Received: by outflank-mailman (input) for mailman id 1145987;
 Mon, 20 Oct 2025 06:26:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uuZq=45=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vAjLx-0005RO-DV
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 06:26:45 +0000
Received: from mail-yx1-xb131.google.com (mail-yx1-xb131.google.com
 [2607:f8b0:4864:20::b131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be5d2fd1-ad7d-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 08:26:43 +0200 (CEST)
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-63d97bcb898so5600464d50.0
 for <xen-devel@lists.xenproject.org>; Sun, 19 Oct 2025 23:26:43 -0700 (PDT)
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
X-Inumbo-ID: be5d2fd1-ad7d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760941602; x=1761546402; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ko2sldK7uY2DT4qb99pibLMwYTBNreOTJ9xVOLP0KHM=;
        b=AEQkeyRdh+AnpO5inFktuwg9nFQ47H0ZGEhzlORTrxBCEhNtm02+RUWAM62kcMSxeT
         kOrtuzYydnGUJUcmzBy/z3NPQubQ+eADrOnxvfivMGSLpzY3nTKid2fe3LB3OgRuloHJ
         wGBGP4MV+L1yFQPvwGQXQojZKitL6Yfb7thT0SySdfP008r3t98mQrAGdaC/v5pvAX0Q
         5FCbFSG/lnlQaamjv94/F2a+XSPJVeFsMIJeVsOgfm9ppDNxKBbMyMiYaqGokjU/VOKP
         LO/FOCPL+KMxDbb52iaSHHK6DLgBX3ZLDGulAO4QlX+/3Yv6Q2P0UxmQcRlM9qEjcrup
         FBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941602; x=1761546402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ko2sldK7uY2DT4qb99pibLMwYTBNreOTJ9xVOLP0KHM=;
        b=ka5hqk8u0J8/vQTWiIXbEfFWG/EPU6EzRE1u0yLnhtTJByXtBwKlnDY4VZ3lrtS5la
         1OLwzBDtxnqPO/KH+qo5th8eKue9xbx8/l+uEVBK6l/02Q2cZAkP76Q+VSeZGFA+bSAM
         wAvMP1v0r35vcQT3qaINkQx5IO6Tl/PZFbjKW3081BYtas5db+IT8Nh1/71T5YI6mm0W
         8EwV58JyxlwsVJ6Mzxgi+91rlFmvNRHWQzNy+R9UIDjpA7iC0+BL+hpTiVUZaFU9KdJh
         9DNMZPcYJnFU4XlBrMoiHjoYXMgAbKhNLDa2ZQ6lgjoxHRIHg9kBCB8QWJxIsnSVT716
         Q1Wg==
X-Gm-Message-State: AOJu0YysGLhfeXfv0PBRLnzTasWM1UTJdb7oXG7VMW4iwSyc4OosQfm8
	I7fVEGT9WBLVl/tIhmTsssehCdRuOEnX6uOOn2vwtNjcBF4l/+r9DYSAbi5wxcqn0gdskqKFi/v
	p9jj2gqq3cdaZtOeL20XARa4Smzu06ok=
X-Gm-Gg: ASbGncvFhE7EEdBZ/N9s8hYLLhsTatxW33MkxxnEwcMUhGAaVj6PABvHqhxBfD5vSp6
	qKQlTbi/gfhZrvjDXcP2RnELe8gqDQFi4UIOhJ6evzKmmhf8nRAbc1U87OLJOit3pAe5FNVZjBx
	bzFgLqVCtktsOkATFyrXAczAAUGRzZkheqrlg0zpV9n/N7HMkgj2sl+0k1GQPZm2FZmb8TVgfPb
	8lkDNzzO5ckFC1OdThq8OdQeRokPjdQbgncKYJtYCEmrHMsWNEs/wRJyHK0gFzNbTVzhkE=
X-Google-Smtp-Source: AGHT+IFFC016dxyZqOTJWu6xLttimZVvuqxYgVeY4dk8a2s+5rL+u4tSJUR7m5KYiuWAp5Ol7+VkqNInXCBJLijJwf8=
X-Received: by 2002:a05:690e:400d:b0:63e:1521:c29f with SMTP id
 956f58d0204a3-63e1521c72fmr10017493d50.17.1760941601867; Sun, 19 Oct 2025
 23:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <bdead1be-cd8f-4cca-ae70-e9744ae8b556@citrix.com>
In-Reply-To: <bdead1be-cd8f-4cca-ae70-e9744ae8b556@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 20 Oct 2025 07:26:30 +0100
X-Gm-Features: AS18NWACJdVPlNTj6k-dlWH22XaDvU1RCo1p4X4sOGpLnjUCpr53TV-dXr4FHjM
Message-ID: <CAHt6W4eRvy_Y3w5WbnVFaOrWYZDT1SqY-vLLG8-0ha=Ckf3Ldw@mail.gmail.com>
Subject: Re: lost serial characters on boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Denis Mukhin <dmkhn@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 6:16=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> Hi,
>
> I think we've got a bug with the serial console.  I'm reliably loosing a
> small part of the boot message. e.g.:
>
> (XEN) Latest ChangeSet: Fri Oct 17 17:24:59 2025 git:5e79cfcd2100
> (XEN) build-id: d1536ff6698b3e3ba307d551abf
>  Family 25 (0x19 Stepping 1 (raw 00a00f11)
> (XEN) BSP microcode revision: 0x0a001137
>
> whereas from xl dmesg after the system boots, we see things correctly:
>
> (XEN) Latest ChangeSet: Fri Oct 17 17:24:59 2025 git:5e79cfcd2100
> (XEN) build-id: d1536ff6698b3b8968e883fc39e3ba307d551abf
> (XEN) CPU Vendor: AMD, Family 25 (0x19), Model 1 (0x1), Stepping 1 (raw
> 00a00f11)
> (XEN) BSP microcode revision: 0x0a001137
>
>
> The lost bit of text differs even when rebooting the same Xen binary,
> but it's always around this area, very early on boot.
>
> I've been seeing this for a little while, but one of my common dev
> machines is showing it fairly reliably at the moment.
>
> Checking a transcript of the terminal, we're missing characters, rather
> than having additional control characters causing the corruption.
>
> I suppose I need to stare at console_init_preirq() some more, but if
> anyone has ideas, I'm all ears.
>
> ~Andrew
>

Which kind of serial do you have ? Standard ns16550 ?

Frediano

