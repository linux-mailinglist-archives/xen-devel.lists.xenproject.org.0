Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A147146D
	for <lists+xen-devel@lfdr.de>; Sat, 11 Dec 2021 16:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245370.423405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw4CL-00040N-9H; Sat, 11 Dec 2021 15:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245370.423405; Sat, 11 Dec 2021 15:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw4CL-0003xU-60; Sat, 11 Dec 2021 15:22:05 +0000
Received: by outflank-mailman (input) for mailman id 245370;
 Sat, 11 Dec 2021 15:22:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=koyS=Q4=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1mw4CJ-0003xO-FJ
 for xen-devel@lists.xenproject.org; Sat, 11 Dec 2021 15:22:03 +0000
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15fa73df-5a96-11ec-a74f-db008197e53d;
 Sat, 11 Dec 2021 16:22:00 +0100 (CET)
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M5Q2f-1mvFNi3tcD-001S7t for <xen-devel@lists.xenproject.org>; Sat, 11 Dec
 2021 16:21:59 +0100
Received: by mail-wr1-f54.google.com with SMTP id c4so19692161wrd.9
 for <xen-devel@lists.xenproject.org>; Sat, 11 Dec 2021 07:21:59 -0800 (PST)
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
X-Inumbo-ID: 15fa73df-5a96-11ec-a74f-db008197e53d
X-Gm-Message-State: AOAM531u2iNcAiIsvVkst4qnfDZMSoRWOqqcPGzcoWJTBNWpwceCbdp5
	qOBSzeqoy4ZcDd+MqeALppsZ1Wim5V1LIsEnbE8=
X-Google-Smtp-Source: ABdhPJw71fHmkJDBQfwdVvTsQemVVjs0TdIXte5O3MuH5722pvreNXPnvtVfyYQ4NEpRi0VtDUcmnQ9Z/Qh6+K4QE8c=
X-Received: by 2002:a5d:530e:: with SMTP id e14mr21123035wrv.12.1639236119426;
 Sat, 11 Dec 2021 07:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20211210221642.869015045@linutronix.de> <20211210221813.493922179@linutronix.de>
In-Reply-To: <20211210221813.493922179@linutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 11 Dec 2021 16:21:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3U2DSm_DWS+iDkzH14hNMwyOQ77iS=W4HoAyHPh6pqUw@mail.gmail.com>
Message-ID: <CAK8P3a3U2DSm_DWS+iDkzH14hNMwyOQ77iS=W4HoAyHPh6pqUw@mail.gmail.com>
Subject: Re: [patch V3 05/35] powerpc/cell/axon_msi: Use PCI device property
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Marc Zygnier <maz@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, 
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, 
	Ashok Raj <ashok.raj@intel.com>, linux-pci <linux-pci@vger.kernel.org>, 
	Cedric Le Goater <clg@kaod.org>, Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nishanth Menon <nm@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Vinod Koul <vkoul@kernel.org>, 
	dmaengine@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	"open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Sinan Kaya <okaya@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PnjKuyYjy9duBmOnr/Ax1BQCrhXd68/MUs87X0Z/DS6lu2wGj1P
 rkIwLe9REnoT9GoDlt6r98qmBOGtVQCRlzmkXvAFq+QTYErxRQhPhvvj7hV8rQJVZyHNudU
 XhAyhRU6+7G7tk+IW4GOI7MlI5heA1uYu0l7WQ83X2WR5zpQn+E2MNvT6E4VFk5XNg2lRLD
 Cih7dll93+vufBCEvvsjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:O7bqQV7w8Go=:5Gok6PnW6NZHMMDpHLs6x7
 m1esQUKjl+2t2xugtYbKOOonefOQhh4vdhQyTbhHlZC0q7KjxwiUjBHiVww8mP8dl9AXon3eJ
 WIixOKApM7DPS/fpMpJXWewDqeUr0NwRAHHuncRK1tvY+tzMw6IggQWSkPBwr+eNBjEUSDn7F
 /+yXcBfERPN4Wdd7goZezmUGtj1aer0YlV0Spkb0JuyQns/TdlgZ+Ks0MAcRNlEPYvR/nfAhI
 XeX4bRn3ZF92GRrQvy5N6XHVHFZ+Ml9uIvqPzlqh2hrP0dzTsxV+rknd1VXp13qB8TCTa/k6e
 ZE2pVPjGWCsl47rSkuBz4RNlxXy/HKM0Q4DUQgU9pXIAvcpOB279UtTHfNGnNHVnjuTJ3m7H1
 zaCWEI37vEgkLH7XguQKNNtCor9snfF/7mJizhQ/2qS+5XJpsnvhspSOFObPfujFknRzu567Z
 cHebYm/xhXO56cLG88irnvMhMNSoCXV88GIl5qb73nTKSQx5c6drwEN6kgCAQnrGDLKOkLrID
 7AVotgtmB0uLntyJKd59qTlYPqRfSEv6UzyXQhGS6VNKPkILAHQCFS2RzguPZ6h69C778QLq8
 Ixb6tvDnyXUuVSYmtVc+zKRxsyhxNg4m/ifytFCbDBgqf61Rb/2kQkUuTq3r7xCUGYrca1e65
 SK4DCDJ22ExY4ph++8YGmL3audek8OeX437nPrqBLgAAaGbMWTKtrQ+fW+nm3aNm+kPFuqtUs
 WRc8RZcl8ErFLayQRz8gCe64aqmkS9hwDmoOVLF4foy4/OY1AOcDVt500WJ8tTTWo3daK/yxE
 11r1slbjmYMvOsFrc5KLPInoJle9CSxqn645lHdsezKb03H+Rs=

On Fri, Dec 10, 2021 at 11:18 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> instead of fiddling with MSI descriptors.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>

