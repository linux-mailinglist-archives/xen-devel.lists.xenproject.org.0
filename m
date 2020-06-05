Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2380B1EF826
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 14:42:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhBg6-0006cx-Cc; Fri, 05 Jun 2020 12:42:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us8T=7S=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jhBg4-0006cs-Qb
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 12:42:28 +0000
X-Inumbo-ID: 038a3f2a-a72a-11ea-96fb-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 038a3f2a-a72a-11ea-96fb-bc764e2007e4;
 Fri, 05 Jun 2020 12:42:28 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id x1so9922150ejd.8
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 05:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7gDE5ftp8pEVvtW1JgGQS31oKVudle1B73F3+TfRCJU=;
 b=tzoKny5QrTn9O8a5QtdURekaFnSepbgiaSdd/YNn7oa1M9FtL7/JzOU+21tPoy9BN9
 sjGMjQ3sx4tfMdacDawQhJH/LlZ3UJS9Q9RwVzGxWWdtE7MFeDAIuPOLM8LUd1zjSGeA
 PqE8sMkLzyV5M7p1ymvHFInL/CCHKgP358772GPM3ad9m8dw1DypxeBAH7ceZ4/q4C5X
 Ai3oF1iap86M+nqUi0Q8zheJ/De3e0N1nD2RFw5vvMiuj4EOCbWgLFQu68+JCRfrDZRE
 JKMJH7wff92gV237F0TPYXK24WMmGkWI5z0Ai+4cx/ao7Mo7+zP/OhaxwLhsPbKIj6/A
 8EJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7gDE5ftp8pEVvtW1JgGQS31oKVudle1B73F3+TfRCJU=;
 b=kd9QDzua2/5CPAJ/AMyVozXwoxlzOE6Hb/3ZOBu9PI3TxC/1pXce/tESgl0ySByv7J
 qqy47UfxRhug/b7OPVcxjpyPssktpKBWOJSpHhDfIrBtqZQAopPB0fhY259o70JbyDKm
 zaI/ZiXtsf92VSq0jfqwnk3JXzvacqrb4XtJIsEstVFEhRY2yBXSG94MWcWYU2FVzEXI
 M/6fCmzJ3EYj4fSmJ5qZd78Y5b+hmyv3BRoUgnUCcVp718dFRgbiS6jewC97uaGSuW/K
 Tp2E8FPy8YrQMdTXeagAE3eKns+HAXQHwp9TgpR7S8RldU+aCAZ/Pr0fivLct3vTqAYS
 N51w==
X-Gm-Message-State: AOAM533pO53dqOMUY/LjXFKhSyV6mvVYig3mYAVETKk+r/vXyB2kLh4c
 K41qHiE42nnwggI1l0Cq/fyn8QWUQMzMXrkYs1iDMPEI
X-Google-Smtp-Source: ABdhPJwgoXdzC3T3k2GsSNP9FxvFRmlpJM/O49j2fgGcdtv8C3Ttz+W/5pQj3HiKXRyOj3pyxgkCD+dKsr675ap0ffU=
X-Received: by 2002:a17:906:5f93:: with SMTP id
 a19mr8386660eju.10.1591360947505; 
 Fri, 05 Jun 2020 05:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
 <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
 <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
 <8C39F9D0-8351-4671-9A39-D5D4BFF02BD6@arm.com>
 <3ff17aa9-0aae-d598-40ce-4e90d4e50cc7@xen.org>
 <00E14EAD-BD23-4A3A-872E-0C47C26B7B41@arm.com>
 <c2466674-a56e-08a4-7f3f-2438d5565953@xen.org>
 <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
 <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
In-Reply-To: <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Fri, 5 Jun 2020 08:42:14 -0400
Message-ID: <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
Subject: Re: Keystone Issue
To: Julien Grall <julien@xen.org>
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 5, 2020 at 8:30 AM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 05/06/2020 13:25, CodeWiz2280 wrote:
> > The Keystone uses the netcp driver, which has interrupts from 40-79
> > listed in the device tree (arch/arm/boot/keystone-k2e-netcp.dtsi).
> > I'm using the same device tree between my non-xen standalone kernel
> > and my dom0 kernel booted by xen.  In the standalone (non-xen) kernel
> > the ethernet works fine, but I don't see any of its interrupts in the
> > output of /proc/iomem.  I'm not seeing them in /proc/iomem when
> > running dom0 under Xen either.  When booting with Xen I get this
> > behavior where the ifconfig output shows 1 RX message and 1 TX
> > message, and then nothing else.
>
> I am not sure whether this is a typo in the e-mail. /proc/iomem is
> listing the list of the MMIO regions. You want to use /proc/interrupts.
>
> Can you confirm which path you are dumping?
Yes, that was a typo.  Sorry about that.  I meant that I am dumping
/proc/interrupts and do not
see them under the non-xen kernel or xen booted dom0.
>
> Cheers,
>
> --
> Julien Grall

