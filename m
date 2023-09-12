Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D808D79C62C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 07:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599908.935518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfvdZ-0008NT-Mc; Tue, 12 Sep 2023 05:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599908.935518; Tue, 12 Sep 2023 05:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfvdZ-0008KA-J0; Tue, 12 Sep 2023 05:08:33 +0000
Received: by outflank-mailman (input) for mailman id 599908;
 Tue, 12 Sep 2023 05:08:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DQab=E4=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qfvdX-0008K4-49
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 05:08:32 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6807e664-512a-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 07:08:28 +0200 (CEST)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-68faf930054so2104695b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 22:08:27 -0700 (PDT)
Received: from leoy-huanghe ([64.227.105.120])
 by smtp.gmail.com with ESMTPSA id
 b11-20020aa7810b000000b00687a4b70d1esm6417586pfi.218.2023.09.11.22.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 22:08:25 -0700 (PDT)
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
X-Inumbo-ID: 6807e664-512a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694495306; x=1695100106; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5s8Q6I375tNey0kH0Jy6D0hvEH0hxpEeww2Q8hsdJcs=;
        b=t+6NFpeI7B509k9Ior+lzREcoriBgNie9tGo+3yORRWYXqP6FZ4/HFRzBJMYLOG4o9
         GZEFnkkOpgcHIkg+EHlE7Zg1RjIXJTbUxjmWviMzHk1+MAO87Mi/kFKcd/9qeqOGdgLd
         Mbt10eosvtXkiV8GAc0TWS8sMhbwk+A3yy6OtA7oK4Wu2XFM7V/emKTl5yQHYILPr8r8
         rsVZbSyYjuTdU6l2yb6v79ap0siVDRRmRznERNN1OwKeK+rYlrLO50G9Xi8iq2NQQq7S
         Z40UomHSINYOrM4tLpIpi8WqUIE+AcALinBKGcWrPj1RWurU13gQyqvD2vxsHXoyEUvG
         o0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694495306; x=1695100106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5s8Q6I375tNey0kH0Jy6D0hvEH0hxpEeww2Q8hsdJcs=;
        b=gCvyWiEImKKtByc70cZWFHypU4pm1TXhnxyT24uY/dXfdI2ohkYAllrRau/isFYY01
         l3ESc5Dyet80PMvgOosGcawIvH2wQVc8Mu6Uf96hkqHbI9lY59JlM7HTtARxu0v4tgS7
         VHBuQwas95aZf4fYzcxsfjM74MsLS+RgpR+XrcfTB2Esp3iL7MJw9Ew7yJJFzqxPjmdR
         iD7oQGo8gUyP13GkVXuLVYucBL9ynAhJGtI9sRQMe5EVbQ0mBGDN/pbdMlWe6lW0t4AB
         B6OSYlA7ff6t+i3LtSVjOyQp/1/waVxzVdeO+1o+ojiwOYaN9mnEN1SgkCc0nKiNtDSA
         CS3w==
X-Gm-Message-State: AOJu0YzXQeBaHrLplrq9E94rhNE1wNAAfdK8G4Wksl4oDGP4XeLFxGub
	FF3I1Pw6gDEEnfRhG+WAwhJSig==
X-Google-Smtp-Source: AGHT+IFbCN7zibmDkGyreCae36wh5XZ5t9aVZS+sJyBjiK1ZdIhtUDbf2BEYaHi5LailC08pI4XYGQ==
X-Received: by 2002:a05:6a00:1c99:b0:68f:b731:b6de with SMTP id y25-20020a056a001c9900b0068fb731b6demr6902580pfw.7.1694495306321;
        Mon, 11 Sep 2023 22:08:26 -0700 (PDT)
Date: Tue, 12 Sep 2023 13:08:18 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Julien Grall <julien@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH RESEND v2 2/2] xen/arm: Enlarge identity map space to
 127TiB
Message-ID: <20230912050818.GC122656@leoy-huanghe>
References: <20230909083410.870726-1-leo.yan@linaro.org>
 <20230909083410.870726-3-leo.yan@linaro.org>
 <d526b697-ca64-473d-8a82-72b9052487fa@xen.org>
 <20230912024127.GB122656@leoy-huanghe>
 <A51D9BC5-B464-4979-860B-8365E478844F@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A51D9BC5-B464-4979-860B-8365E478844F@arm.com>

Hi Henry,

On Tue, Sep 12, 2023 at 03:01:30AM +0000, Henry Wang wrote:

[...]

> At Arm we also test Xen on AVA in our CI, but our setup is based on Yocto
> meta-adlink-ampere layer [1].

Thanks for sharing the info.  Yes, we (Linaro) also work with Yocto
based on EWAOL [1] or TRS [2].

> >> Also, in v1, the problem was also depending on the firmware version. Do you
> >> know if it fails booting on a new or old firmware?
> > 
> > My colleague Alexey (CCed) and I both tested Xen hypervisor on own AVA
> > machine, Alexey produced this issue on his machine with the old
> > firmware, I upgraded to the new firmware so I cannot see the issue
> > anymore.
> > 
> >>>   (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
> >>>   (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
> >>>   (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
> >>>   (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
> 
> I tried to dig a bit more about Xen log printed by our AVA setup, and [2] is our
> RAM and MODULES setup, just FYI and hopefully it helps.

Yeah, the log shows the high address space is above 8TB:

  (XEN) RAM: 0000080000000000 - 000008007fffffff
  (XEN) RAM: 0000080100000000 - 000008039bffffff
  (XEN) RAM: 000008039c000000 - 00000803ffffffff

Appreciate for the log and it's helpful!

Leo

> [1] https://github.com/ADLINK/meta-adlink-ampere
> [2] https://pastebin.com/raw/0DQpmJP1
> 
> Kind regards,
> Henry
> 
> 

