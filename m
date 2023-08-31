Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B278EC63
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 13:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593817.926917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbg4R-0004of-F1; Thu, 31 Aug 2023 11:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593817.926917; Thu, 31 Aug 2023 11:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbg4R-0004lj-C7; Thu, 31 Aug 2023 11:42:43 +0000
Received: by outflank-mailman (input) for mailman id 593817;
 Thu, 31 Aug 2023 11:42:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYAZ=EQ=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1qbg4O-0004kX-Un
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 11:42:41 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c8d19e3-47f3-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 13:42:38 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-522dd6b6438so884986a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 04:42:38 -0700 (PDT)
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
X-Inumbo-ID: 7c8d19e3-47f3-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693482158; x=1694086958; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZYYMlf2Q/sBIqNnlNnSd1DVS5c7jiyWNWe7v8r7llI=;
        b=OJ9bLoJC8FTSo93Zl00XEyCoAjRf7FuP/10xoi/JJIldCcUXuZYXRanZZEHjnqDG/W
         VBaTM5+a0CqGQC47LtgudkeZ47XoWEbgAOCmRnm4aqdpz7YMuZozhtMCDrSpGs0alCwK
         bkJf53NUiiNzNDjX2tBVOnULvOup1DqPUgs5b30TC9Fs4ERChPnG4Hz1SEZGZUfxvESE
         TmmwVazBg+Fzr2VsmFTzuieGqTEWzjkPrH5LGvOV88Gu/meXyDRmSEA8G9mxDkhu4/7g
         ECXsCswajHGNFqixsdBMgm4iVCYCnWggpU1njYK8LRY3Elvv7okLJ5OLOXYmhSC6vZaJ
         PCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693482158; x=1694086958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZYYMlf2Q/sBIqNnlNnSd1DVS5c7jiyWNWe7v8r7llI=;
        b=gTqnRtGkSkwQ4mBb9bNHRCQTV58wfg3TVlgMmCwSgYDa9zMbaemloVQKHtle+bqQ8o
         BQ4YC2/3iAKyoypOR7oyBEG1QxBngEbcMP9BDW7EtIQXBO2oPtTSonW3eJerwpHOGqMR
         i64GwgVvdrLN8M0VOy+QszlkZ6fgBF/VXG/Qk+c1dOL3Gv+i+S1G+OXBvIpc3xLTl1th
         iK90FVX2ZUTC+Gy2rg6fSQzPKcuWnM3cbe74aOwqtSFQncPMlIHJp4lLvmmUF9w0GzGE
         vRLsjlcpqiNvZQQl9ORlm9lUB1oPuR3j5bQWy4pSj7tbMV6GBaFBa6cDbNPaXrU0a+rz
         PMPg==
X-Gm-Message-State: AOJu0YwqRxLGvT25KzoPSFZq7rL3JDFcTx0kEnpVNqlmRUJk3OUW9Ho5
	S7Lvbv9Vbf//B3o/P16FID8RH4efis5k/9Nvv7l21g==
X-Google-Smtp-Source: AGHT+IFl4wwDm0ua5CjWpvaFUGyolXCkXUNGWOEKAEJSJIc3bB6h9uhvyAyd6pxrYHp+x7WDevFt9lIiV4C29oUEVcI=
X-Received: by 2002:aa7:c414:0:b0:51e:ed6:df38 with SMTP id
 j20-20020aa7c414000000b0051e0ed6df38mr3890545edq.13.1693482158356; Thu, 31
 Aug 2023 04:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <87y1hspiyh.fsf@linaro.org> <alpine.DEB.2.22.394.2308301745530.6458@ubuntu-linux-20-04-desktop>
 <CAFEAcA8Ziov9vA9dW+4vzFE=KkSUqfMNNMZOtvQhqCXyjRytzQ@mail.gmail.com>
 <87cyz3pmgz.fsf@linaro.org> <CAFEAcA-m8G1kfTw52kOGPEvQwWPph0NWc0URVY1aQ2WwVeB_OQ@mail.gmail.com>
 <878r9rpjvl.fsf@linaro.org>
In-Reply-To: <878r9rpjvl.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Aug 2023 12:42:27 +0100
Message-ID: <CAFEAcA8ZdkHmtJ1r5zi-bW4msSUqvCdo1L6QbqMjEaJHf5Ji1g@mail.gmail.com>
Subject: Re: QEMU features useful for Xen development?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Vikram Garhwal <vikram.garhwal@amd.com>, 
	Stefano Stabellini <stefano.stabellini@amd.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Aug 2023 at 11:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > All our MPS2/MPS3 boards are M-profile. That means we have the
> > device models for all the interesting devices on the board, but
> > it would be simpler to write the an536 board model separately.
> > (In particular, the M-profile boards are wrappers around an
> > "ARMSSE" sort-of-like-an-SoC component; there's no equivalent
> > for the Cortex-R52.)
> >
> >>   https://developer.arm.com/documentation/dai0536/latest/
>
> It's not super clear from the design notes but it does mention the
> SSE-200 sub-system as the basis for peripherals. Specifically the blocks
> are:
>
>   Arm Cortex-R52 Processor
>   Arm CoreSight SoC-400 (n/a for QEMU)
>   Cortex-M System Design Kit
>   PL022 Serial Port
>   NIC-400 Network interconnect
>
> But if writing it from scratch is simpler so be it. The real question is
> what new hardware would we need to model to be able to bring something
> up that is useful to Xen?

Just the board, basically. The SSE-200 is specifically a
dual-Cortex-M33 block; all the references to it in the
AN536 appnote look like cases where text wasn't sufficiently
cleaned up when creating it based on the M-profile doc...

-- PMM

