Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAA4369DDC
	for <lists+xen-devel@lfdr.de>; Sat, 24 Apr 2021 02:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116638.222570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1la6L3-0002fX-Rf; Sat, 24 Apr 2021 00:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116638.222570; Sat, 24 Apr 2021 00:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1la6L3-0002dq-O9; Sat, 24 Apr 2021 00:40:01 +0000
Received: by outflank-mailman (input) for mailman id 116638;
 Sat, 24 Apr 2021 00:40:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CxGy=JV=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1la6L2-0002Zm-6q
 for xen-devel@lists.xen.org; Sat, 24 Apr 2021 00:40:00 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3ee4539-3b97-4398-ac63-139050e47350;
 Sat, 24 Apr 2021 00:39:59 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h4so40915701wrt.12
 for <xen-devel@lists.xen.org>; Fri, 23 Apr 2021 17:39:59 -0700 (PDT)
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
X-Inumbo-ID: d3ee4539-3b97-4398-ac63-139050e47350
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KeRpwwQ0WZSBvMpY61pldxkCfDHTnFpFBEBLy8my2d4=;
        b=dMLbdK79bOzfizftLd1/Adw+NZXlbsbKf0UBjHV3XyjwvBlhWCI3QwUOxy7Xn1F18I
         sHtARt21zXXBCOQgEo9WnL5eUg/nHAWOMm02Xp8KPYS5nUJP5+m/PeK12Sajc8yTCaOm
         f3DGzQjNm6Bsm9Zx7LIWK6axkgwL/ZQsv/yjnsRwGQ8yiNl+1ijqSmWfoymi9m0+dWL8
         DmhdxV7c7Jh1jLbOo5+HZbeysrI8m5hlx8Hsz2Ktl9XeqS3NTxkjF+QgEIYcmsWphE2Y
         RkuzB/rWbTMz31i9OivbcPE82J640nRlQ08oHskmwaIrzMIJP4mQdWJ5ZOcVPs5MCbmm
         pGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KeRpwwQ0WZSBvMpY61pldxkCfDHTnFpFBEBLy8my2d4=;
        b=umC76d55oKJwXuP6ouUIHF5JHdcejK9pkgGNn5bSaYYjH/BzuCXUTs2V/7dyHy6w60
         GyPwpW/kODdPBLoCXxtnyjx5JykN4+blaRrH6N0YFSAYKPLQGN4RVYtJEnrtPnxOPqsi
         Gepg78eKP+Lsjs7D+IP3uHbHLkM5XVjLbtOswvZQ/fVSYVgkgeyCUqG7jq+eN5NvlldR
         zwlxWO5RUfeMilptO7IhluMHPevOiOiHq3YzzkQ2MHhEnEdlWN0PInpooBed+UegSCIC
         hYgOs/aqH+lPMwfpiYFcu5m16UhuO5cEbe1ssJY74f+8IWS2kKIfUTmpECa07q+iEbyz
         u4Sg==
X-Gm-Message-State: AOAM533PhvqZcmgtgP3RLorB0Q6NTuuLZzGsdfoyo/6z71Fv19AIjOT/
	nxoW/xR9UJTdpJEhnd/192RGfWooejsZXPswjF8=
X-Google-Smtp-Source: ABdhPJzYlntdsjyen5FLD/+V2t8bt1to0si7ga4SKeiZaFNHIbd+Fobe4JT7tPrQaps22S/Zbg58r55dIAUVXsp+nBc=
X-Received: by 2002:adf:b301:: with SMTP id j1mr7886858wrd.301.1619224798165;
 Fri, 23 Apr 2021 17:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <6237e102-f2cf-a66e-09b6-954ebfe28f8c@list.ru> <46f8bf3e-cd6e-e2de-94c1-c8a55fb10648@list.ru>
 <YILi/Qft51Vh5QZy@Air-de-Roger> <e8770b62-753a-beed-66b2-e8c99db9a57e@list.ru>
In-Reply-To: <e8770b62-753a-beed-66b2-e8c99db9a57e@list.ru>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 23 Apr 2021 20:39:25 -0400
Message-ID: <CABfawhmGLHTqPbXKhnpK=saf4ULFQNsK-xHg+GzMJrOawRx0ZA@mail.gmail.com>
Subject: Re: Fwd: [BUG] Windows is frozen after restore from snapshot
To: Sergey Kovalev <valor@list.ru>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xen.org>, zaytsevgu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 12:19 PM Sergey Kovalev <valor@list.ru> wrote:
>
>
> 23.04.2021 18:08, Roger Pau Monn=C3=A9 =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Apr 23, 2021 at 01:22:34PM +0300, Sergey Kovalev wrote:
> >> # Abstract
> >>
> >> After `xl save win win.mem` and then `xl restore win.hvm win.mem`
> >> the Windows 10 VM remain frozen for about a minute. After the
> >> minute it becomes responsive.
> >>
> >> During the freeze the OS remains semi-responsive: on `Ctrl+Shift+Esc`
> >> press the wait cursor appears (blue circle indicator).
> >>
> >> This is an intermittent fault been reproduced only twice.
> >>
> >> # Technical notes
> >>
> >> It have been noticed that there were no timer interrupts during
> >> the freeze.
> >>
> >> zaytsevgu@gmail.com has debugged the received Xen state file and
> >> noticed that the flag HPET_TN_PERIODIC been set after unfreeze.
> >>
> >> Based on that he provided two Python scripts: one to check the
> >> value and one to patch it.
> >>
> >> Both "broken" state files we have been detected and patched
> >> successfully.
> >>
> >> # Other information
> >>
> >> ## Target machine
> >>
> >> ```bash
> >> $ uname -a
> >> Linux localhost 5.4.0-66-generic #74~18.04.2-Ubuntu SMP
> >> Fri Feb 5 11:17:31 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
> >> ```
> >>
> >> ## Xen version
> >>
> >> Build from source on tag RELEASE-4.12.4
> >>
> >> ## OS version
> >>
> >> * Windows 10 build 1803 x64
> >
> > Do you also run other versions of Windows, and in which case I assume
> > you have never seen the issue on those, or it's this specific version
> > the only that you use?
> >
> > Thanks, Roger.
> >
>
> We use Windows 7 SP1 x86/x64, Windows 8.1 update1 and
> Windows 10 1803 x64.
>
> The Windows 10 is the only one affected by the bug at
> the time.

I can confirm that I have ran into this issue as well in the past, but
never had time to dig deeper into the root cause. I may add that with
snapshots taken of Windows 10 on Xen 4.14 or 4.15 and using those for
restoring I haven't seen it happen yet. The Win10 version didn't
change on my end, only the hypervisor got upgraded. So this may be a
bug that got fixed in newer Xen versions.

Tamas

