Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC0B42F89E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 18:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210914.367945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQME-0003Zk-KU; Fri, 15 Oct 2021 16:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210914.367945; Fri, 15 Oct 2021 16:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQME-0003Wb-Gg; Fri, 15 Oct 2021 16:46:58 +0000
Received: by outflank-mailman (input) for mailman id 210914;
 Fri, 15 Oct 2021 16:46:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7YSI=PD=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1mbQMD-0003WV-8X
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 16:46:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b810e61a-0567-40f7-9460-bdfc37587462;
 Fri, 15 Oct 2021 16:46:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34DF061164;
 Fri, 15 Oct 2021 16:46:55 +0000 (UTC)
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
X-Inumbo-ID: b810e61a-0567-40f7-9460-bdfc37587462
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634316415;
	bh=UazkFhnF58o243B84E27T2Q0kziPCzNQlAM0EXnPs+0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=uJA4ra39P0Gv6naQSVcILGvPjCJywIq0xOMKparacmz05rvVX6Np5K3P9TBtMV+Q6
	 0fZMoqlsDqrvmOr81us08+gZah/AgsMkvZGLUZdvStWvkLQD9P6+IT1gNPD5kGzCTz
	 OqQa78pHkuTPX/IwPxuJYSyFJgvQojor9CCfmM0cFvkyP8yz7FerO3C6Xj6Ja6G65F
	 0JNWOrnI2B9XClHx9c5DgYXjOqp4IU9Zrxk/YET9tVYaYS+dnGehAv9e/YWKzwcbHz
	 D1LRfA0mXkjJ2/mnwlueLADrqQ5YuEa5UTY+rPKkoEu2iEn918jjZk3T8fIflFmK8o
	 yGBq7Ksq4IKXA==
Date: Fri, 15 Oct 2021 11:46:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pci <linux-pci@vger.kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Borislav Petkov <bp@alien8.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"David S. Miller" <davem@davemloft.net>,
	Fiona Trahe <fiona.trahe@intel.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"H. Peter Anvin" <hpa@zytor.com>, Ido Schimmel <idosch@nvidia.com>,
	Ingo Molnar <mingo@redhat.com>, Jack Xu <jack.xu@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Jiri Pirko <jiri@nvidia.com>,
	Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Marco Chiappero <marco.chiappero@intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathias Nyman <mathias.nyman@intel.com>, Michael Buesch <m@bues.ch>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver O'Halloran <oohall@gmail.com>,
	Paul Mackerras <paulus@samba.org>,
	Peter Zijlstra <peterz@infradead.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Russell Currey <ruscur@russell.cc>,
	Salil Mehta <salil.mehta@huawei.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	Simon Horman <simon.horman@corigine.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Taras Chornyi <tchornyi@marvell.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tomaszx Kowalik <tomaszx.kowalik@intel.com>,
	Vadym Kochan <vkochan@marvell.com>,
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	linux-crypto <linux-crypto@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	"open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>,
	linux-scsi <linux-scsi@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>,
	"open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>,
	MPT-FusionLinux.pdl@broadcom.com, netdev <netdev@vger.kernel.org>,
	oss-drivers@corigine.com, qat-linux@intel.com,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 00/11] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20211015164653.GA2108651@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWbdvc7EWEZLVTHM@smile.fi.intel.com>

On Wed, Oct 13, 2021 at 04:23:09PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 13, 2021 at 06:33:56AM -0500, Bjorn Helgaas wrote:
> > On Wed, Oct 13, 2021 at 12:26:42PM +0300, Andy Shevchenko wrote:
> > > On Wed, Oct 13, 2021 at 2:33 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Mon, Oct 04, 2021 at 02:59:24PM +0200, Uwe Kleine-König wrote:

> > > > +       return drv && drv->resume ?
> > > > +                       drv->resume(pci_dev) : pci_pm_reenable_device(pci_dev);
> > > 
> > > One line?
> > 
> > I don't think I touched that line.
> 
> Then why they are both in + section?

They're both in the + section of the interdiff because Uwe's v6 patch
looks like this:

  static int pci_legacy_resume(struct device *dev)
  {
          struct pci_dev *pci_dev = to_pci_dev(dev);
  -       return drv && drv->resume ?
  -                       drv->resume(pci_dev) : pci_pm_reenable_device(pci_dev);
  +       if (pci_dev->dev.driver) {
  +               struct pci_driver *drv = to_pci_driver(pci_dev->dev.driver);
  +
  +               if (drv->resume)
  +                       return drv->resume(pci_dev);
  +       }
  +
  +       return pci_pm_reenable_device(pci_dev);

and my revision looks like this:

   static int pci_legacy_resume(struct device *dev)
   {
	  struct pci_dev *pci_dev = to_pci_dev(dev);
  -       struct pci_driver *drv = pci_dev->driver;
  +       struct pci_driver *drv = to_pci_driver(dev->driver);

so compared to Uwe's v6, I restored that section to the original code.
My goal here was to make the patch as simple and easy to review as
possible.

> > > > +       struct pci_driver *drv = to_pci_driver(dev->dev.driver);
> > > >         const struct pci_error_handlers *err_handler =
> > > > -                       dev->dev.driver ? to_pci_driver(dev->dev.driver)->err_handler : NULL;
> > > > +                       drv ? drv->err_handler : NULL;
> > > 
> > > Isn't dev->driver == to_pci_driver(dev->dev.driver)?
> > 
> > Yes, I think so, but not sure what you're getting at here, can you
> > elaborate?
> 
> Getting pointer from another pointer seems waste of resources, why we
> can't simply
> 
> 	struct pci_driver *drv = dev->driver;

I think this is in pci_dev_save_and_disable(), and "dev" here is a
struct pci_dev *.  We're removing the dev->driver member.  Let me know
if I'm still missing something.

> > > > -                               "bad request in aer recovery "
> > > > -                               "operation!\n");
> > > > +                               "bad request in AER recovery operation!\n");

> > > Stray change? Or is it in a separate patch in your tree?
> > 
> > Could be skipped.  The string now fits on one line so I combined it to
> > make it more greppable.
> 
> This is inconsistency in your changes, in one case you are objecting of
> doing something close to the changed lines, in the other you are doing
> unrelated change.

You're right, this didn't make much sense in that patch.  I moved the
line join to the previous patch, which unindented this section and
made space for this to fit on one line.  Here's the revised commit:

  https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/commit/?id=34ab316d7287


