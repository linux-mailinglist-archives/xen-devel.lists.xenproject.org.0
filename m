Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D443C513
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 10:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216705.376417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfeHN-0003DQ-GT; Wed, 27 Oct 2021 08:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216705.376417; Wed, 27 Oct 2021 08:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfeHN-0003BB-DJ; Wed, 27 Oct 2021 08:27:25 +0000
Received: by outflank-mailman (input) for mailman id 216705;
 Wed, 27 Oct 2021 08:27:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUNZ=PP=desiato.srs.infradead.org=BATV+d69366bb991552d278a6+6639+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1mfeHJ-0003Az-8S
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 08:27:23 +0000
Received: from desiato.infradead.org (unknown
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f90c6cd-4eff-4d10-ad05-9ada09e376a6;
 Wed, 27 Oct 2021 08:27:17 +0000 (UTC)
Received: from [2a01:4c8:1042:994a:f240:791a:356:222b] (helo=[IPv6:::1])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfeH5-00CWGM-QL; Wed, 27 Oct 2021 08:27:08 +0000
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
X-Inumbo-ID: 0f90c6cd-4eff-4d10-ad05-9ada09e376a6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bKTTpLjfT+n7D7d5y1NK/WDhv2vPZZwx7SAZZ1V4Qk8=; b=p160wzfSkkAtYownhlB08CDof4
	0Rg4aZGlAEx6gTpzXTIZH5K7do2NBBrbHQNJWFYtY2bn//b17UD3/ADazi/f7hK88TcrmXkckro/v
	McbkBXEAv23iNzDU32O36DXEItsJohT6Tmky89El7yZT19Sm0h7sISOCoop2EWqbi1Zz34b19uvpe
	omQZVnECTKSI/43I2dIsfwCOm0eTtvitCjp5zz74i8CEWhVGIOSPs0PNeqFXoMt852QQwty2Edvjr
	2zdBcKS1aWMVq0w8Cqol4ektwLIETr19CKh3+00GgrYKqH0hQUW58ZwD8N0ORiL3Om5wOvwzjJ2nn
	Z4ceSGzg==;
Date: Wed, 27 Oct 2021 09:26:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Josef Johansson <josef@oderland.se>, Jason Andryuk <jandryuk@gmail.com>,
 Marc Zyngier <maz@kernel.org>
CC: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_PCI/MSI=3A_Re-add_chec?= =?US-ASCII?Q?ks_for_skip_masking_MSI-X_on_Xen_PV?=
User-Agent: K-9 Mail for Android
In-Reply-To: <4af6ccf5-1e52-be65-0acc-cbc53b724dfe@oderland.se>
References: <20211019202906.GA2397931@bhelgaas> <5f050b30-fa1c-8387-0d6b-a667851b34b0@oderland.se> <877de7dfl2.wl-maz@kernel.org> <CAKf6xpt=ZYGyJXMwM7ccOWkx71R0O-QeLjkBF-LtdDcbSnzHsA@mail.gmail.com> <3434cb2d-4060-7969-d4c4-089c68190527@oderland.se> <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se> <CAKf6xpvZ8fxuBY4BZ51UZzF92zDUcvfav9_pOT7F3w-Bc8YkwA@mail.gmail.com> <c4d27d67-1027-e72b-c5bf-5546c5b0e2e9@oderland.se> <ee23eafce1993ba7da8fdf4c03cedbcb3362ef1d.camel@infradead.org> <4af6ccf5-1e52-be65-0acc-cbc53b724dfe@oderland.se>
Message-ID: <980274EA-3A57-412A-BCE9-1950989AD64E@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html



On 27 October 2021 09:13:36 BST, Josef Johansson <josef@oderland=2Ese> wro=
te:
>On 10/27/21 08:24, David Woodhouse wrote:
>> On Mon, 2021-10-25 at 21:21 +0200, Josef Johansson wrote:
>>> +       if (!(pci_msi_ignore_mask || entry->msi_attrib=2Eis_virtual))
>> Is it just me, or is that a lot easier to read if you write it as the
>> tautologically-identical (!pci_msi_ignore_mask && !entry->=E2=80=A6is_v=
irtual)?
>Sure, the less parentheses the better=2E
>>
>>> @@ -546,7 +548,8 @@ static int msi_capability_init(struct pci_dev *dev=
, int nvec,
>>>                 return -ENOMEM;
>>>         /* All MSIs are unmasked by default; mask them all *
>>> -       pci_msi_mask(entry, msi_multi_mask(entry))
>>> +       if (!pci_msi_ignore_mask)
>>> +               pci_msi_mask(entry, msi_multi_mask(entry));
>>>
>>>         list_add_tail(&entry->list, dev_to_msi_list(&dev->dev));
>>
>> Hm, I thought that older kernels *did* do this part (or at least the
>> later ones in pci_msi*_hutdown)=2E I was watching it when I did the Xen
>> hosting implementation I mentioned before; even a hack to unmask them
>> all when the VM was started, wasn't working because the guest would
>> *mask* all MSI-X, just never unmask them again=2E
>When you're saying *did* here, do you mean that they mask even though
>pci_msi_ignore_mask =3D 0?
>
>As I was looking through pre Thomas' changes and post, it seems that we
>did indeed
>check for pci_msi_ignore_mask in msi_capability_init=2E


Ah, maybe not so old=2E When my VMM part didn't work with standard ancient=
 distro test images I turned to a relatively current git HEAD=2E

So I was probably just unfortunate, and masking MSI under Xen at setup tim=
e was a temporary aberration; on older kernels the hack of enabling each ve=
ctor at startup might have worked?

I'll disable my eventual VMM-side fix and retest different guest kernels t=
o be sure (and to make sure I have the full permutation set for regression =
testing because regardless of how insane Xen's behaviour is, I need to fait=
hfully emulate it for every Linux kernel behaviour that existed)=2E


--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

