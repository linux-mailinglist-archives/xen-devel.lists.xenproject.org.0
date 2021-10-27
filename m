Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614DD43C4DD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 10:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216693.376394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfe48-00016I-0u; Wed, 27 Oct 2021 08:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216693.376394; Wed, 27 Oct 2021 08:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfe47-00013z-Tw; Wed, 27 Oct 2021 08:13:43 +0000
Received: by outflank-mailman (input) for mailman id 216693;
 Wed, 27 Oct 2021 08:13:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EkRf=PP=oderland.se=josef@srs-us1.protection.inumbo.net>)
 id 1mfe47-00013t-32
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 08:13:43 +0000
Received: from office.oderland.com (unknown [91.201.60.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb6cf974-36fd-11ec-8454-12813bfff9fa;
 Wed, 27 Oct 2021 08:13:41 +0000 (UTC)
Received: from [193.180.18.161] (port=56998 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1mfe44-0082c3-35; Wed, 27 Oct 2021 10:13:40 +0200
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
X-Inumbo-ID: cb6cf974-36fd-11ec-8454-12813bfff9fa
Message-ID: <4af6ccf5-1e52-be65-0acc-cbc53b724dfe@oderland.se>
Date: Wed, 27 Oct 2021 10:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Subject: Re: [PATCH v2] PCI/MSI: Re-add checks for skip masking MSI-X on Xen
 PV
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Jason Andryuk
 <jandryuk@gmail.com>, Marc Zyngier <maz@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20211019202906.GA2397931@bhelgaas>
 <5f050b30-fa1c-8387-0d6b-a667851b34b0@oderland.se>
 <877de7dfl2.wl-maz@kernel.org>
 <CAKf6xpt=ZYGyJXMwM7ccOWkx71R0O-QeLjkBF-LtdDcbSnzHsA@mail.gmail.com>
 <3434cb2d-4060-7969-d4c4-089c68190527@oderland.se>
 <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
 <CAKf6xpvZ8fxuBY4BZ51UZzF92zDUcvfav9_pOT7F3w-Bc8YkwA@mail.gmail.com>
 <c4d27d67-1027-e72b-c5bf-5546c5b0e2e9@oderland.se>
 <ee23eafce1993ba7da8fdf4c03cedbcb3362ef1d.camel@infradead.org>
From: Josef Johansson <josef@oderland.se>
In-Reply-To: <ee23eafce1993ba7da8fdf4c03cedbcb3362ef1d.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

On 10/27/21 08:24, David Woodhouse wrote:
> On Mon, 2021-10-25 at 21:21 +0200, Josef Johansson wrote:
>> +       if (!(pci_msi_ignore_mask || entry->msi_attrib.is_virtual))
> Is it just me, or is that a lot easier to read if you write it as the
> tautologically-identical (!pci_msi_ignore_mask && !entry->…is_virtual)?
Sure, the less parentheses the better.
>
>> @@ -546,7 +548,8 @@ static int msi_capability_init(struct pci_dev *dev, int nvec,
>>                 return -ENOMEM;
>>         /* All MSIs are unmasked by default; mask them all *
>> -       pci_msi_mask(entry, msi_multi_mask(entry))
>> +       if (!pci_msi_ignore_mask)
>> +               pci_msi_mask(entry, msi_multi_mask(entry));
>>
>>         list_add_tail(&entry->list, dev_to_msi_list(&dev->dev));
>
> Hm, I thought that older kernels *did* do this part (or at least the
> later ones in pci_msi*_hutdown). I was watching it when I did the Xen
> hosting implementation I mentioned before; even a hack to unmask them
> all when the VM was started, wasn't working because the guest would
> *mask* all MSI-X, just never unmask them again.
When you're saying *did* here, do you mean that they mask even though
pci_msi_ignore_mask = 0?

As I was looking through pre Thomas' changes and post, it seems that we
did indeed
check for pci_msi_ignore_mask in msi_capability_init.
>
> I wonder if we should rename 'pci_msi_ignore_mask' to something with
> Xen in its name because Xen is the only user of this abomination (which
> fundamentally seems to require that the virtual hardware use MSI
> entries even while they're masked, so hopefully nobody else would
> *ever* do such a thing), and the required behaviour is very Xen-
> specific.
Second that, i.e. pci_msi_masked_by_xen.

