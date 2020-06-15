Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181E01FA00D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 21:15:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkuYv-0003Q9-J4; Mon, 15 Jun 2020 19:14:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdYW=74=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jkuYu-0003Q4-Rw
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 19:14:28 +0000
X-Inumbo-ID: 6e60ee24-af3c-11ea-bb8b-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e60ee24-af3c-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 19:14:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id t21so12329431edr.12
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 12:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tROvkrjLc9wHL2NHb6pbuOEf92Mjj7qEKcDXhQREEzo=;
 b=FPf+SZgnBdXkL7xsPfvJd6pSnWUwfgVmITDTr8bV4NLyNFcbfXMq8L81avvnCYy1gr
 Jrd/wrvyo41gkjzEFDsMGkFKFbp3tqjWLpWMgpTtudfGWxuESRj+Ga1jPueVsLlzei5K
 bbpjZ5V4MGxpvzJLux7xEBCR2VVPmau6dof1MrEs+4m1OhzBsOFtcXWSA52HiuQAcwpU
 BS+iqPpcWGPwyoZwGcIODzKdly5a3HmWa+IjIfrk41x6/omKZYQ+9zWcIsSv3Md6IgJw
 oR0SrCtPv2oiLnoF4xWOoaqbcKKhTqzh/HPVleDqgjR4Q39UBlptrsBMBofel3JRGPI0
 DR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tROvkrjLc9wHL2NHb6pbuOEf92Mjj7qEKcDXhQREEzo=;
 b=WUQMqW+ZNaA6hQxyfe/WLTr5BCHQS/o1MrOz6+Sj1hxKeAXYvbgbINJ2pXci/ijDif
 GxC7f+qAnJrPlCbryUWEHXBF73iGM63bfsiojZjVl4EQO1R7qtViz8oi0Tn8WrmecZlh
 0GDgmpMxgVWY4Qsv2Rv3vIsQbjOnI3ekCl1IyK6UkKAkhCMgdq/AfRQvDFgnani+HP84
 SuuErkuqhmFQBgR8oG3GQdz4PT6jL7WkCCi7tVjzIJ6YBG/4mTBc0Rk1lishOcv86nr9
 lzGk/aPLPp+n7Hs51UTjc1XS06iFPNVXFLulJ6q0wg/sJVqRIIxFwqdARm0ttmbWFC2T
 +8jQ==
X-Gm-Message-State: AOAM532P+6USZ2IxqU9UfwvHsCnHDrv3tOFjBA+8GJwPHJxNvxRDfVpT
 +/O6kLjm4n67uZlSxYHQnxavyIaqk4oGLWhJ5i8=
X-Google-Smtp-Source: ABdhPJxQDbQDCl+YK9nOGLMGUCfWD2J/F3oaisbG5jgMI5i6CGhuy0eYWnxDU2frw1hL49Mf8KQNThPZTZ4Rqum7xU8=
X-Received: by 2002:a05:6402:1d96:: with SMTP id
 dk22mr25867754edb.258.1592248466965; 
 Mon, 15 Jun 2020 12:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
 <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
 <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
 <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
 <6033f9cecbf10f50f4a713ce52105426@kernel.org>
 <CAJ=z9a1k606A+sA467eY8iPuHnptMUFzxEFithpe=JKHogjt0g@mail.gmail.com>
In-Reply-To: <CAJ=z9a1k606A+sA467eY8iPuHnptMUFzxEFithpe=JKHogjt0g@mail.gmail.com>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Mon, 15 Jun 2020 15:14:10 -0400
Message-ID: <CALYbLDjF8_eoNB_pSfbD73LkC3Ppyxpi0MxHgtS5y_wc-TVfzQ@mail.gmail.com>
Subject: Re: Keystone Issue
To: Julien Grall <julien.grall.oss@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Marc Zyngier <maz@kernel.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 10, 2020 at 5:46 PM Julien Grall <julien.grall.oss@gmail.com> wrote:
>
> Hi Marc,
>
> On Tue, 9 Jun 2020 at 18:45, Marc Zyngier <maz@kernel.org> wrote:
> > > I was wondering if you heard about any potential issue with guest EOI
> > > not forwarded to the host. This is on TI Keystone (Cortex A-15).
> >
> > Not that I know of. A-15 definitely works (TC2, Tegra-K1, Calxeda Midway
> > all run just fine with guest EOI), and GIC-400 is a pretty solid piece
> > of kit (it is just sloooooow...).
> >
> > Thinking of it, you would see something like that if the GIC was seeing
> > the writes coming from the guest as secure instead of NS (cue the early
> > firmware on XGene that exposed the wrong side of GIC-400).
>
> Ah, I remember that one.  We used to carry an hack in Xen [1] for
> X-Gene. Thankfully they fixed the firmware!
>
> If it is a similar issue, then the firmware path would definitely be
> my preference.
>
> Thank you for the input!

Thank you all for the information.  If I pull the changes to use the
maintenance interrupt for the X-Gene back into the latest build of Xen
then my issue with the Edge and Level interrupts is resolved.  My
ethernet and other devices work fine again for the Keystone in dom0.
Are there any concerns over operating this way, meaning with the
maintenance interrupt workaround rather than the EOI?  Is this safe?

Also, the latest linux kernel still has the X-Gene storm distributor
address as "0x78010000" in the device tree, which is what the Xen code
considers a match with the old firmware.  What were the addresses for
the device tree supposed to be changed to?  Is my understanding
correct that there is a different base address required to access the
"non-secure" region instead of the "secure" 0x78010000 region?  I'm
trying to see if there are corresponding different addresses for the
keystone K2E, but haven't found them yet in the manuals.

>
> Cheers,
>
> [1] http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=50dcb3de603927db2fd87ba09e29c817415aaa44

