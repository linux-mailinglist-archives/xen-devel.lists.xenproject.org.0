Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEBE85A27D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 12:51:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682795.1061964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc2Ak-0007mg-1k; Mon, 19 Feb 2024 11:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682795.1061964; Mon, 19 Feb 2024 11:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc2Aj-0007kz-VE; Mon, 19 Feb 2024 11:50:57 +0000
Received: by outflank-mailman (input) for mailman id 682795;
 Mon, 19 Feb 2024 11:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ybst=J4=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1rc2Ai-0007kt-3l
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 11:50:56 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22b90609-cf1d-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 12:50:54 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso4947796a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 03:50:54 -0800 (PST)
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
X-Inumbo-ID: 22b90609-cf1d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708343453; x=1708948253; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRqMCBzf+R3oPVWN5HPILjOg+0s4Zpcn1+zkzkrhkXQ=;
        b=W04H7eKC2iT/QM3ikNKxu4xNpY1bHl26cQbIIws8x8UKOpYvYXL4XnZ0shCHC5taZA
         DY5UCTLae1rDAk2b9Ju26yxfKU+vJryVyzADfJlAsno0HH6sk+7LMY5D2m84HQ74VBOw
         HBIwba5Blxc0d1PAfFo1wbziNQlk9JeM9cE1x3xoas6KVIJmqBpnYDHy0y/eRqNUO9OE
         xvRNmIMlr3MpWLoxcWq97j/yQoQ84GVGHN9cxCCNSG3sMesovmiGquGWJ7w5XM4RA/TL
         Nj5pAPZFEsmR1AV51M3TDNzdVkycxVU8o+Fht47t7CieXNRuCaT0JWEp/RYZu+I55xPm
         X14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708343453; x=1708948253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRqMCBzf+R3oPVWN5HPILjOg+0s4Zpcn1+zkzkrhkXQ=;
        b=MHdnt669juidcjPQ6ja2wzUo9Be7onu/o6TgRCF8vgpg4lBXro8gpz/c/76x12WsE1
         3e3gnLUYyIzlsnw5pkRtqBC3H73Rz5bysIUX1KSzLzoL9raVeIFM80YUOGBCCAyYroLX
         OBq3Di1QupBQ3M3XZuA99wc3++cfXKCwInUGqUyF61iQvP8GhVqCiDaFQ9Os32V2JcdE
         K/LswyrNBp+cNsbBl8YplpxNxTk7MVAHKwIYQlQzuZHGDlOJaICFpKQCgqf3faNXUFwA
         9b1pSWM4Bn1BoEyfizKIrMWuNKmcQ+5woe3H9sLJtttsgSlY8hGpxhm4aBCJMuTmLR6p
         JhhA==
X-Forwarded-Encrypted: i=1; AJvYcCW4QDre6bbven5bQnT8lIqZZUJBCcrwsRsmS+vioLsnba87t/mpUOLBu1H2WfQLy2O6ivod75l/k+XbBT9VtrIVfAuHpW1JCUekr95wAmc=
X-Gm-Message-State: AOJu0YzrvkLN1ru4nHiKs2FVm7rZu1fgvsPphb8D4iGQGseXa+vW6LDL
	AWRfEgXIRdL5nc0GMxH62d/GBm0kc9j8Pm8Am9VjByr9BnhpXEMcwebl55tFzflvXN6lXelTZw8
	CBbsc1KcNNWDQR7ofpiPPp1ykbYbEH9z8Z6293A==
X-Google-Smtp-Source: AGHT+IEhN/N8srsegjmd62Nb46r+QdlqWsvsBnavJVQa6/fsW9epm6qk4NmB8JLwpKb908Muh40YJqXPthpU+2PGZLI=
X-Received: by 2002:aa7:d64d:0:b0:564:42e1:fa93 with SMTP id
 v13-20020aa7d64d000000b0056442e1fa93mr2860424edr.25.1708343453519; Mon, 19
 Feb 2024 03:50:53 -0800 (PST)
MIME-Version: 1.0
References: <87y1hspiyh.fsf@linaro.org> <alpine.DEB.2.22.394.2308301745530.6458@ubuntu-linux-20-04-desktop>
 <CAFEAcA8Ziov9vA9dW+4vzFE=KkSUqfMNNMZOtvQhqCXyjRytzQ@mail.gmail.com>
 <87cyz3pmgz.fsf@linaro.org> <CAFEAcA-m8G1kfTw52kOGPEvQwWPph0NWc0URVY1aQ2WwVeB_OQ@mail.gmail.com>
 <799b1754-7529-0538-1b5a-d94a362eb74d@amd.com>
In-Reply-To: <799b1754-7529-0538-1b5a-d94a362eb74d@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Feb 2024 11:50:41 +0000
Message-ID: <CAFEAcA8UwpWzD=Z1syjWPcpRev0OLSMnfyqqYg=9UEQk05s4yQ@mail.gmail.com>
Subject: Re: QEMU features useful for Xen development?
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Vikram Garhwal <vikram.garhwal@amd.com>, 
	Stefano Stabellini <stefano.stabellini@amd.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Aug 2023 at 11:32, Ayan Kumar Halder <ayankuma@amd.com> wrote:
> On 31/08/2023 11:03, Peter Maydell wrote:
> > On Thu, 31 Aug 2023 at 10:53, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>> On Thu, 31 Aug 2023 at 01:57, Stefano Stabellini <sstabellini@kernel.=
org> wrote:
> >>>> As Xen is gaining R52 and R82 support, it would be great to be able =
to
> >>>> use QEMU for development and testing there as well, but I don't thin=
k
> >>>> QEMU can emulate EL2 properly for the Cortex-R architecture. We woul=
d
> >>>> need EL2 support in the GIC/timer for R52/R82 as well.

> >>> (What sort of board model would Xen want to use it with?)

> >> We already model a bunch of the mps2/mps3 images so I'm assuming addin=
g
> >> the mps3-an536 would be a fairly simple step to do (mps2tz.c is mostly
> >> tweaking config values). The question is would it be a useful target f=
or
> >> Xen?

> Yes, it will be helpful if Qemu can model this board. We have a
> downstream port of Xen on R52 (upstreaming is in progress).
>
> So, we can test the Qemu model with Xen.

Hi, all. I just wanted to provide an update on this. We've now
completed the mps3-an536 board model, and you can find it if
you check out the head-of-git QEMU. The new board will be in the
9.0 QEMU release, but if you have a chance to give it a spin now
we'll be able to fix any bugs or problems with it before the release.

The documentation for the board is here:
https://www.qemu.org/docs/master/system/arm/mps2.html
and it lists the limitations/missing features. (If any of those
are important let me know and we can look at scheduling the work
to fill them in.)

I'd also like to draw your attention to the note about the UART
ordering on the AN536; unfortunately the hardware setup is a bit
awkward here, so if you have an "I don't see any output" problem
make sure your guest is sending to the same UART you're asking
QEMU to show you the output from :-)

thanks
-- PMM

