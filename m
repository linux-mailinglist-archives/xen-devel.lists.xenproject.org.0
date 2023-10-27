Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E77D991E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 14:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624371.972901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMPS-00033L-Gq; Fri, 27 Oct 2023 12:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624371.972901; Fri, 27 Oct 2023 12:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMPS-00030f-Dc; Fri, 27 Oct 2023 12:57:54 +0000
Received: by outflank-mailman (input) for mailman id 624371;
 Fri, 27 Oct 2023 12:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rgxb=GJ=users.sourceforge.jp=ysato@srs-se1.protection.inumbo.net>)
 id 1qwM0M-0007Cv-T6
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 12:31:58 +0000
Received: from hsmtpd-def.xspmail.jp (hsmtpd-def.xspmail.jp [202.238.198.240])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d02a24ac-74c4-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 14:31:57 +0200 (CEST)
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by hsmtpd-out-0.asahinet.cluster.xspmail.jp (Halon) with ESMTPA
 id cf9071da-cfc2-430a-aae8-d12cacb28888;
 Fri, 27 Oct 2023 21:31:54 +0900 (JST)
Received: from SIOS1075.ysato.ml (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 755761C0037;
 Fri, 27 Oct 2023 21:31:45 +0900 (JST)
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
X-Inumbo-ID: d02a24ac-74c4-11ee-98d6-6d05b1d4d9a1
X-Country-Code: JP
Date: Fri, 27 Oct 2023 21:31:44 +0900
Message-ID: <87sf5wi6vj.wl-ysato@users.sourceforge.jp>
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org,	Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,	Peter Maydell
 <peter.maydell@linaro.org>,	Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>,	Niek Linnenbank
 <nieklinnenbank@gmail.com>,	=?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>,	Andrew Jeffery <andrew@aj.id.au>,	Joel Stanley
 <joel@jms.id.au>,	Igor Mitsyanko <i.mitsyanko@gmail.com>,	Jean-Christophe
 Dubois <jcd@tribudubois.net>,	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,	Rob Herring
 <robh@kernel.org>,	Subbaraya Sundeep <sundeep.lkml@gmail.com>,	Jan Kiszka
 <jan.kiszka@web.de>,	Tyrone Ting <kfting@nuvoton.com>,	Hao Wu
 <wuhaotsh@google.com>,	Radoslaw Biernacki <rad@semihalf.com>,	Leif Lindholm
 <quic_llindhol@quicinc.com>,	Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,	"Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,	Alistair Francis <alistair@alistair23.me>,
	Helge Deller <deller@gmx.de>,	Paolo Bonzini <pbonzini@redhat.com>,	Eduardo
 Habkost <eduardo@habkost.net>,	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,	Song Gao
 <gaosong@loongson.cn>,	Thomas Huth <huth@tuxfamily.org>,	Laurent Vivier
 <laurent@vivier.eu>,	Huacai Chen <chenhuacai@kernel.org>,	Jiaxun Yang
 <jiaxun.yang@flygoat.com>,	=?ISO-8859-1?Q?Herv=E9?= Poussineau
 <hpoussin@reactos.org>,	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,	Jason Wang <jasowang@redhat.com>,
	Jia Liu <proljc@gmail.com>,	Stafford Horne <shorne@gmail.com>,	Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,	Nicholas Piggin
 <npiggin@gmail.com>,	Daniel Henrique Barboza <danielhb413@gmail.com>,	David
 Gibson <david@gibson.dropbear.id.au>,	Harsh Prateek Bora
 <harshpb@linux.ibm.com>,	Bin Meng <bin.meng@windriver.com>,	Palmer Dabbelt
 <palmer@dabbelt.com>,	Weiwei Li <liweiwei@iscas.ac.cn>,	Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,	David Hildenbrand <david@redhat.com>,	Ilya
 Leoshkevich <iii@linux.ibm.com>,	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,	Eric Farman
 <farman@linux.ibm.com>,	Magnus Damm <magnus.damm@gmail.com>,	Artyom
 Tarasenko <atar4qemu@gmail.com>,	Stefano Stabellini
 <sstabellini@kernel.org>,	Anthony Perard <anthony.perard@citrix.com>,	Paul
 Durrant <paul@xen.org>,	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,	qemu-ppc@nongnu.org,	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 18/45] hw/sh4/r2d: use pci_init_nic_devices()
In-Reply-To: <20231022155200.436340-19-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
	<20231022155200.436340-19-dwmw2@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.2 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Oct 2023 00:51:33 +0900,
David Woodhouse wrote:
> 
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Previously, the first PCI NIC would be assigned to slot 2 even if the
> user override the model and made it something other than an rtl8139
> which is the default. Everything else would be dynamically assigned.
> 
> Now, the first rtl8139 gets slot 2 and everything else is dynamic.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>

> ---
>  hw/sh4/r2d.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index 4944994e9c..e9f316a6ce 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -240,7 +240,6 @@ static void r2d_init(MachineState *machine)
>      MemoryRegion *sdram = g_new(MemoryRegion, 1);
>      qemu_irq *irq;
>      DriveInfo *dinfo;
> -    int i;
>      DeviceState *dev;
>      SysBusDevice *busdev;
>      MemoryRegion *address_space_mem = get_system_memory();
> @@ -309,9 +308,8 @@ static void r2d_init(MachineState *machine)
>                            0x555, 0x2aa, 0);
>  
>      /* NIC: rtl8139 on-board, and 2 slots. */
> -    for (i = 0; i < nb_nics; i++)
> -        pci_nic_init_nofail(&nd_table[i], pci_bus,
> -                            mc->default_nic, i == 0 ? "2" : NULL);
> +    pci_init_nic_in_slot(pci_bus, mc->default_nic, NULL, "2");
> +    pci_init_nic_devices(pci_bus, mc->default_nic);
>  
>      /* USB keyboard */
>      usb_create_simple(usb_bus_find(-1), "usb-kbd");
> -- 
> 2.40.1
> 

-- 
Yosinori Sato

