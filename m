Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AB01FBDC0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 20:15:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlG63-0000wU-CB; Tue, 16 Jun 2020 18:14:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddVf=75=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jlG61-0000wP-Vk
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 18:14:06 +0000
X-Inumbo-ID: 298a3dca-affd-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 298a3dca-affd-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 18:14:05 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id q19so22623033eja.7
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 11:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BmjCZtF1kgQ7PeaIEx8/UxbYmvWysAGr4o2NegH2AmY=;
 b=n/GveDtdtOhjYSOp7LF79tbS7jWdCSCfEyPFmO5XLwB3GwNMeqmr4a1zdqYMfir3Ui
 VUylr1ts4L2rpSiBfNm52HzQ+PazA6BJAGzvT/zAHimNN1SQYdp6BdAuC8gkJpB+Zaoe
 sgvXQFCFz8lYZo4lEzqL80Q4HVzcxeBza32xExymMNmDsVf0P7JTLkNHjYrI1HFowb8k
 PN5vSz7Ik/i/iI/n1gXZgNuMucGHzMzb2oUGHrJPof30nOYVRM0XI6yiEM6nK08JRGuc
 k/mVFgisHys2ZZa744fDzwUi4CW5LYfpCCeOb61DEUmffrczXhIHNMzXLf1afePmbnw0
 JIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BmjCZtF1kgQ7PeaIEx8/UxbYmvWysAGr4o2NegH2AmY=;
 b=tr26rRjK940XXF2IQXm/0kseOfVEa2XOqp6Ftv1/vHRJPTvBMN8XdcczdKTyt/3dEP
 I0UttWOEUVIxBTIoTgCeeOm/rdnZTWmydZnjhfTeTXl2pOQyxNDpR73cYoXudcmMgyVg
 2tjdFDNL9WebxfWlm9zHsBTlTwKtN6nu9ayrkO9kePykz6DiXNYwktBgN6rV7nZll6YB
 zAA7yk9Hf7F+y9pmHxMtCFiriX4m0K94ba26iWX59xxww+CkOtzQz25kp+dUR/JAx77D
 qzzkYZCuGXiXow83ofCE1AUKJeURstuFMe20eDql84SrAyJ8Xrb29T8jtKLdSQPQMzDd
 RMoQ==
X-Gm-Message-State: AOAM530z/qIf4/252J63vcU3Qf3JrfJeKI2f0xHZIVukD+IHaFDVK17o
 54rYp+DKre18069mBWVHcDMaMVrsubSmeQVIHLg=
X-Google-Smtp-Source: ABdhPJxkOnz6lRTtovRk+ANFmtyCHd/dTqvRSqcCw2W9M4fCozGArZY86RTCbUZ8nS9dvWdDL+XbVVwp+0jYTsfbM3w=
X-Received: by 2002:a17:906:5f93:: with SMTP id
 a19mr3877092eju.10.1592331244326; 
 Tue, 16 Jun 2020 11:14:04 -0700 (PDT)
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
 <CALYbLDjF8_eoNB_pSfbD73LkC3Ppyxpi0MxHgtS5y_wc-TVfzQ@mail.gmail.com>
 <4bab90465acfddae5868ce2311bd9889@kernel.org>
In-Reply-To: <4bab90465acfddae5868ce2311bd9889@kernel.org>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Tue, 16 Jun 2020 14:13:51 -0400
Message-ID: <CALYbLDjNF5s2SXkunjJNv4x9jQAcDfoMBWp3WFHBkjnNdfT3Sg@mail.gmail.com>
Subject: Re: Keystone Issue
To: Marc Zyngier <maz@kernel.org>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 4:11 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-06-15 20:14, CodeWiz2280 wrote:
>
> [...]
>
> > Also, the latest linux kernel still has the X-Gene storm distributor
> > address as "0x78010000" in the device tree, which is what the Xen code
> > considers a match with the old firmware.  What were the addresses for
> > the device tree supposed to be changed to?
>
> We usually don't care, as the GIC address is provided by the bootloader,
> whether via DT or ACPI (this is certainly what happens on Mustang).
> Whatever is still in the kernel tree is just as dead as the platform it
> describes.
>
> > Is my understanding
> > correct that there is a different base address required to access the
> > "non-secure" region instead of the "secure" 0x78010000 region?  I'm
> > trying to see if there are corresponding different addresses for the
> > keystone K2E, but haven't found them yet in the manuals.
>
> There is no such address. Think of the NS bit as an *address space*
> identifier.
>
> The only reason XGene presents the NS part of the GIC at a different
> address is because XGene is broken enough not to have EL3, hence no
> secure mode. To wire the GIC (and other standard ARM IPs) to the core,
> the designers simply used the CPU NS signal as an address bit.
>
> On your platform, the NS bit does exist. I strongly suppose that it
> isn't wired to the GIC. Please talk to your SoC vendor for whether iot
> is possible to work around this.
>
I do have a question about this out to TI, but at least this method
gives me something to work with in the meantime.  I was just looking
to confirm that there wouldn't be any other undesirable side effects
with Dom0 or DomU when using it.  Was there an actual FPGA for the
X-Gene that needed to be updated which controlled the GIC access?  Or
by firmware do you mean the boot loader (e.g. uboot).  Thanks for the
support so far to all.

>          M.
> --
> Jazz is not dead. It just smells funny...

