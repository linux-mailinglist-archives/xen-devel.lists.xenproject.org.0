Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07EB526ABA
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 21:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328721.551824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npbHQ-0000rn-Ky; Fri, 13 May 2022 19:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328721.551824; Fri, 13 May 2022 19:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npbHQ-0000ow-Gh; Fri, 13 May 2022 19:48:52 +0000
Received: by outflank-mailman (input) for mailman id 328721;
 Fri, 13 May 2022 19:48:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIfh=VV=gmail.com=colton.reeder@srs-se1.protection.inumbo.net>)
 id 1npbHO-0000oq-E5
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 19:48:50 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b462504d-d2f5-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 21:48:48 +0200 (CEST)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ebf4b91212so100854967b3.8
 for <xen-devel@lists.xenproject.org>; Fri, 13 May 2022 12:48:48 -0700 (PDT)
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
X-Inumbo-ID: b462504d-d2f5-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+8spOjZA4NY0YGn23DOFXT8YympyMRk58+kwRnpI6rA=;
        b=RSDCo5w1kBotXYyiggcXdJdDa5BWoMq/e/5Nv3Q0Z0gHdeQfOuZkBpTTWOf+YmMLhG
         6ThmeiYGTu6PF/+3kGtZDGfxOYvL03VRXOCwwz6u6LsallJHKZc0Y09+WYv2TEPHFDtS
         EgA39gMQJVOjH0SioN2vAOBG7IVApKo8F3R6lAiQ67kzynlZWmisFu+idKhkTlhWHSI0
         hIXHnSgx5EgiYcpKmTWHKEC2VXMGeIARS1h+kYD+hRS/PYKLmCw6CElttjro+10UasKf
         T1AoQ/pcPy4keWja2XtOtQtMaBeHVQLiMWpOkQwnnSJb2CRfgVUhQyuwzmp0AmAjvNDD
         BAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+8spOjZA4NY0YGn23DOFXT8YympyMRk58+kwRnpI6rA=;
        b=1Vj2V2sh/1IGLeyA4YnaFsqc01TM2+gPNmKLcOaL6P2JpPa/g2fTjn0pZN5RRS99CD
         H38EYgWuVG3UI1fmiJi3+M/Qv+uBoPQXpT2ofXyICLutlIytchgWc0HpfMgenv7404JX
         sReU3u0YWYe3bvhsLQ1Z8K8XnEDdF26PRaxaFNzMNroCyIqtjxZMYQMxM1TOHaL3Q+FZ
         9vTaT8hvJLtsMtv7AjHdNDTHBuPUpNCHHGO1fYtj9iTn5/YlkVxl2uxQsixcR58WfB71
         qJU3PtqV80iZIZTjp1ZuZfk9hFOHAD9rJtmOrDMS5YcPz+9RhLy0t/aBuHfUwD+q39Cq
         qD6g==
X-Gm-Message-State: AOAM53081+8dTiPuWHjYFmmiSxEZbrmE33hQYOHzArYInFlK94wP84ZC
	8afM10C+Sjc6wqgrpNBtoPX02ov3Kex1jMvdk6U=
X-Google-Smtp-Source: ABdhPJyou25gEAV0ud5WxO6bkP84FteocSKtoESAitv8VDqKphBPHi/1BxPpk02OZgFijl1ODxEXEL/fT7MVaLpOaww=
X-Received: by 2002:a81:6a41:0:b0:2f8:5459:353e with SMTP id
 f62-20020a816a41000000b002f85459353emr7886565ywc.218.1652471327188; Fri, 13
 May 2022 12:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAHq+1YiXwgOwPzUoRc37pA4t8Ef-AriROA1XYr2fpfMXOjdwhQ@mail.gmail.com>
 <YnpJ+E6eGZeq0Jsp@Air-de-Roger>
In-Reply-To: <YnpJ+E6eGZeq0Jsp@Air-de-Roger>
From: Colton Reeder <colton.reeder@gmail.com>
Date: Fri, 13 May 2022 12:49:31 -0700
Message-ID: <CAHq+1YgW=b52qOmfDtga_Rn+yDoQ=9bGvOYRYiWJuR=XgA9vMw@mail.gmail.com>
Subject: Re: OPNSense running in domU has no network connectivity on 5.15.29+
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://pastebin.com/uqME2J8W Theres the configuration from both VMs.
You are correct, Ive never had any issues with the Linux PV guest "Services=
"

I will work on getting the other information you requested as soon as I can=
.

On Tue, May 10, 2022 at 4:18 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Tue, May 03, 2022 at 12:36:43PM -0700, Colton Reeder wrote:
> > Hello,
> >
> > I am running the FreeBSD-based router OS OPNSense in a domU. I
> > recently upgraded my dom0 kernel from 5.15.26 to 5.15.32 and with the
> > new kernel, OPNSense had no connectivity. I downloaded from kernel.org
> > 5.15.26-32, built and installed each version and booted them
> > consecutively until I found the version that no longer worked. It
> > turned out to be 5.15.29.
> >
> > I looked through the change log of 5.15.29 and found two commits for xe=
n-netback
> >
> > commit 2708ceb4e5cc84ef179bad25a2d7890573ef78be commit
> > fe39ab30dcc204e321c2670cc1cf55904af35d01
> >
> > I reverted these changes (a revert of a revert, yes)  in 5.15.32,
> > built and installed. Now the network works. Now I dont know enough to
> > know thats for sure the right fix.
>
> Could you try if reverting only one of those fixes your issue?
>
> > Maybe I have a config issue, I dont
> > know, but reverting that change fixes the problem. What should I do?
> > I was asked to provide xenstore -ls https://pastebin.com/hHPWgrEy
>
> It's better to post the output of `xenstore-ls -fp`, as that's way
> easier to read.
>
> So it's only OPNSense that's affected, other VMs run fine?
>
> Do you get any output from Linux dmesg?
>
> From the output of xenstore that you pasted, you do have another
> guests that seems to be running fine regarding network, are there any
> differences in the configuration file?
>
> FWIW, it seems like the netback instances are stuck in state 2.
>
> I think we need the guest config file, plus the output from `xl
> -vvv create config_file.cfg`
>
> Thanks, Roger.

