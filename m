Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E786647146C
	for <lists+xen-devel@lfdr.de>; Sat, 11 Dec 2021 16:22:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245372.423417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw4Cn-0004S4-Hl; Sat, 11 Dec 2021 15:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245372.423417; Sat, 11 Dec 2021 15:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw4Cn-0004Ps-EI; Sat, 11 Dec 2021 15:22:33 +0000
Received: by outflank-mailman (input) for mailman id 245372;
 Sat, 11 Dec 2021 15:22:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=koyS=Q4=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1mw4Ck-0003xO-V2
 for xen-devel@lists.xenproject.org; Sat, 11 Dec 2021 15:22:31 +0000
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27c844ff-5a96-11ec-a74f-db008197e53d;
 Sat, 11 Dec 2021 16:22:30 +0100 (CET)
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Msqpq-1mgTGP1obI-00tEJR for <xen-devel@lists.xenproject.org>; Sat, 11 Dec
 2021 16:22:29 +0100
Received: by mail-wm1-f43.google.com with SMTP id 133so8956061wme.0
 for <xen-devel@lists.xenproject.org>; Sat, 11 Dec 2021 07:22:29 -0800 (PST)
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
X-Inumbo-ID: 27c844ff-5a96-11ec-a74f-db008197e53d
X-Gm-Message-State: AOAM532gurwP4uzRbhBTK5q/IPwAShcnPGS6DoP34fkj/236fwG4hmUC
	/WIdaw1DkOiuf+Qfj6Y9MCZUdOXVPoTGFaW3V4I=
X-Google-Smtp-Source: ABdhPJyOlfLidEd9162beuC5UM1yFpg2300rafM4JRbY2mJjNOXxVFZo/cAEJoaFFS655TaSoVWjWn5yGpFZ9WnPivI=
X-Received: by 2002:a05:600c:6d2:: with SMTP id b18mr25037494wmn.98.1639236149109;
 Sat, 11 Dec 2021 07:22:29 -0800 (PST)
MIME-Version: 1.0
References: <20211210221642.869015045@linutronix.de> <20211210221813.617178827@linutronix.de>
In-Reply-To: <20211210221813.617178827@linutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 11 Dec 2021 16:22:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0SPopq871z7hbeTZbgnpO=cnEz-4Pmi1Ko3SHFTpU-mg@mail.gmail.com>
Message-ID: <CAK8P3a0SPopq871z7hbeTZbgnpO=cnEz-4Pmi1Ko3SHFTpU-mg@mail.gmail.com>
Subject: Re: [patch V3 07/35] device: Move MSI related data into a struct
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Marc Zygnier <maz@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, 
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, 
	Ashok Raj <ashok.raj@intel.com>, linux-pci <linux-pci@vger.kernel.org>, 
	Cedric Le Goater <clg@kaod.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Stuart Yoder <stuyoder@gmail.com>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	"open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Sinan Kaya <okaya@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:kLhBncfpdlXjXo8Z/i0X8RYODod4emiEurxyvqYPg1zTiPUicuI
 2ep7TgyO1eBjujt/ksqxQLMBfBJhnNZ+mqf3151Wkh3hxdHdrRYJj4LCs1j2il7WSPT6yIL
 rgt8YAl6/Er/EGamTSSlQY6zbZ49AZ5pyBo2//yhRcwsscmqXWuFQr/94AkKd6wQ4t4yQO3
 alIjNrC8qlkXaKzFTimRQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+iBXNxuGYzw=:KzBY+9E+8FBTea/BqfftdE
 UWwW3jCnnZ5S6cstPl8GjIBMMfIeZATR7cJkPccL9RysaCP5jfROg/T3969zqepvPwcHEQXJq
 U33ZF/zFCREgPdf3M9YYyHUBC4nhSn+0GFCyzuFgmOc+XHiLmy0RI036bXIJTRkUbx+5VBH/B
 SP25XIW5t8eS/jXiWnNEgbyQBKJCBSl+PxtUKCcL5loYkQZzeUaJEy3CiAkbfYZMgw1+ENhY6
 NMNlFtJJhm5g2k1IY5G6dYvMoey2IdKEYqgclh4IFZb0SZ87F/WVtQK685/rhZSzBM3QGk0d8
 kPNhQ5Emk27d+3Recmb2AfyIDwHJ7f6TciJX/BX/PiAFyc6Wz8MFDFy+pNgd4M3r1MqDGwyzs
 UNYqnhYU9DG1jbWCRJ11Aq6b3j05NGMCErrTQ0cDCJPWy05jcetbOs3LgQcdXaIFeemB/C+6t
 i0MdfoWml3WxLYPgDZCuT4PxVZsCdmEQ/Mr3AtkwksqmPpPbSJ8IBpzBqwsEMYiuskQEZilnr
 EQWWA6GGbd9vrkHpftOeV2hUSU5Wl1i2Zksh6J2p42IyAOF7h7bNo3dqPL8vAa08st+oiM/Yo
 itpIpsQUHv9ZehRAukFD0Ts20pib+VVjU7lvFV3JCOa9rZG0EFV5aBzbWXwdvaDGU88jKV2Oy
 gjvjV2kOsGRMb1beYVVxKiXSEBrDk8kk2RnnMypN//yMa8xMjRQBY5McyPsFOUpNrV6wNZ2v1
 gGdz0hARGbQNd2zwQ+NdXcjTZ+f2BvasMDT3J8PQXkLdZhKaknnAfTXUdloh9NIKPcapjk9fS
 JtzgkdOh6uDe2MdBfN/9BkY0V7oNF7PSz9//3ShJ8DVmF5zRmY=

On Fri, Dec 10, 2021 at 11:18 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> The only unconditional part of MSI data in struct device is the irqdomain
> pointer. Everything else can be allocated on demand. Create a data
> structure and move the irqdomain pointer into it. The other MSI specific
> parts are going to be removed from struct device in later steps.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

