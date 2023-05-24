Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D97B70EA99
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 03:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538751.838949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1d4c-0007Aa-Po; Wed, 24 May 2023 01:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538751.838949; Wed, 24 May 2023 01:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1d4c-00077l-M4; Wed, 24 May 2023 01:13:54 +0000
Received: by outflank-mailman (input) for mailman id 538751;
 Wed, 24 May 2023 01:13:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEuA=BN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q1d4b-00077f-Mn
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 01:13:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d6d259a-f9d0-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 03:13:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5336E60C05;
 Wed, 24 May 2023 01:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B67C4339B;
 Wed, 24 May 2023 01:13:47 +0000 (UTC)
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
X-Inumbo-ID: 3d6d259a-f9d0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684890828;
	bh=Gop+BTAEidpVZdh+7oP0MH+DpcN3udcDsLwAzCMd8kA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C/Vugyj41E8Erkh4hHLNsYwzs4IT1EcfoHhUyobLMMoGs/SIidG3vo+zgngZiPGf1
	 9ACLl563cepGlYnJz2zUWdpIsbNAlw3Pt+ZjjMlQo/k6cV7gr+9NHRRdCtPJSOKiLd
	 nbyJKdcpwddJezrYfw1gpfBSKow23bB+vWcxBnkzmH9zWFkwYz6uuXGDFJsIaKZ03l
	 0zox2OKaGIcD8HzmgA8FdTfNGROw2e9pOAeRQAotLiO9QfUrE27gLUzYx0DYDlV8Bu
	 fNNrnSzO1PWP9EllCnB5+gIU5/Cf5+XrDPKlgW8xZ5WwehrgU7u73Lsxh2JUXjOd0k
	 sNLmXiUrmLfUA==
Date: Tue, 23 May 2023 18:13:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com, 
    xenia.ragiadakou@amd.com, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: PVH Dom0 related UART failure
In-Reply-To: <818859a6-883a-81c0-1222-84c62ada3200@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305231756500.44000@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop> <ZGX/Pvgy3+onJOJZ@Air-de-Roger> <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop> <ZGcu7EWW1cuNjwDA@Air-de-Roger> <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
 <ZGig68UTddfEwR6P@Air-de-Roger> <alpine.DEB.2.22.394.2305221520350.1553709@ubuntu-linux-20-04-desktop> <818859a6-883a-81c0-1222-84c62ada3200@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1473932416-1684889972=:44000"
Content-ID: <alpine.DEB.2.22.394.2305231759370.44000@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1473932416-1684889972=:44000
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2305231759371.44000@ubuntu-linux-20-04-desktop>

On Tue, 23 May 2023, Jan Beulich wrote:
> On 23.05.2023 00:20, Stefano Stabellini wrote:
> > On Sat, 20 May 2023, Roger Pau Monné wrote:
> >> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >> index ec2e978a4e6b..0ff8e940fa8d 100644
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -289,6 +289,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>       */
> >>      for_each_pdev ( pdev->domain, tmp )
> >>      {
> >> +        if ( !tmp->vpci )
> >> +        {
> >> +            printk(XENLOG_G_WARNING "%pp: not handled by vPCI for %pd\n",
> >> +                   &tmp->sbdf, pdev->domain);
> >> +            continue;
> >> +        }
> >> +
> >>          if ( tmp == pdev )
> >>          {
> >>              /*
> >> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> >> index 652807a4a454..0baef3a8d3a1 100644
> >> --- a/xen/drivers/vpci/vpci.c
> >> +++ b/xen/drivers/vpci/vpci.c
> >> @@ -72,7 +72,12 @@ int vpci_add_handlers(struct pci_dev *pdev)
> >>      unsigned int i;
> >>      int rc = 0;
> >>  
> >> -    if ( !has_vpci(pdev->domain) )
> >> +    if ( !has_vpci(pdev->domain) ||
> >> +         /*
> >> +          * Ignore RO and hidden devices, those are in use by Xen and vPCI
> >> +          * won't work on them.
> >> +          */
> >> +         pci_get_pdev(dom_xen, pdev->sbdf) )
> >>          return 0;
> >>  
> >>      /* We should not get here twice for the same device. */
> > 
> > 
> > Now this patch works! Thank you!! :-)
> > 
> > You can check the full logs here
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4329259080
> > 
> > Is the patch ready to be upstreamed aside from the commit message?
> 
> I don't think so. vPCI ought to work on "r/o" devices. Out of curiosity,
> have you also tried my (hackish and hence RFC) patch [1]?
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2021-08/msg01489.html

I don't know the code well enough to discuss what is the best solution.
I'll let you and Roger figure it out. I would only kindly request to
solve this in few days so that we can enable the real hardware PVH test
in gitlab-ci as soon as possible. I think it is critical as it will
allow us to catch many real issues going forward.

For sure I can test your patch. BTW it is also really easy for you to do
it your simply by pushing a branch to a repo on gitlab-ci and watch for
the results. If you are interested let me know I can give you a
tutorial, you just need to create a repo, and register the gitlab runner
and voila'.

This is the outcome:

https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/876808194


(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:00.2
(XEN) PCI add device 0000:00:01.0
(XEN) PCI add device 0000:00:02.0
(XEN) Assertion 'd == dom_xen && system_state < SYS_STATE_active' failed at drivers/vpci/header.c:313
(XEN) ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
(XEN) CPU:    14
(XEN) RIP:    e008:[<ffff82d04026839e>] drivers/vpci/header.c#modify_bars+0x3ba/0x4a3
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
(XEN) rax: ffff830390164000   rbx: ffff83038bd8a7f0   rcx: 0000000000000010
(XEN) rdx: ffff83038e3b7fff   rsi: ffff83038e3c83a0   rdi: ffff83038e3c8398
(XEN) rbp: ffff83038e3b7c08   rsp: ffff83038e3b7b98   r8:  0000000000000001
(XEN) r9:  ffff83038dcfa000   r10: 000000000000000e   r11: 0000000000000000
(XEN) r12: 0000000000000007   r13: 00000000000dcc03   r14: ffff83039016ad10
(XEN) r15: 00000000000dcc00   cr0: 000000008005003b   cr4: 0000000000f506e0
(XEN) cr3: 000000038ddfe000   cr2: ffff88814e3ff000
(XEN) fsb: 0000000000000000   gsb: ffff888149a00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d04026839e> (drivers/vpci/header.c#modify_bars+0x3ba/0x4a3):
(XEN)  3d c4 d1 37 00 02 76 c0 <0f> 0b 4c 8b 75 b0 0f ae e8 48 83 7d 98 00 74 2b
(XEN) Xen stack trace from rsp=ffff83038e3b7b98:
(XEN)    0000000000000002 ffff830390150230 ffff830390164000 ffff830390164158
(XEN)    ffff830390150230 00ff830300000000 ffff83038dcf8b00 0000000000000003
(XEN)    0000000000000206 ffff83038bd8c010 0000000000000000 0000000000000002
(XEN)    0000000000000002 0000000000000004 ffff83038e3b7c18 ffff82d040268909
(XEN)    ffff83038e3b7ca0 ffff82d040267998 000000118e3b7ca0 0000000000117803
(XEN)    0000000400000000 ffff830390150230 0000000000000000 0000000000000000
(XEN)    0000000400000002 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000002 0000000000000000 0000000000000004 0000000000000000
(XEN)    ffff82d04041df40 ffff83038e3b7cd0 ffff82d0402cb649 0000001140332c9e
(XEN)    ffff83038e3b7d88 0000000000000000 ffff83038dd094a0 ffff83038e3b7d30
(XEN)    ffff82d0402caa72 ffff83038e3b7ce0 00000cfc00000002 0000000000000000
(XEN)    0000000000000002 0000000000000000 ffff83038dd094a0 ffff83038e3b7d88
(XEN)    0000000000000001 0000000000000000 0000000000000000 ffff83038e3b7d58
(XEN)    ffff82d0402cab08 0000000000000002 ffff83038dcfa000 ffff83038e3b7e28
(XEN)    ffff83038e3b7dd0 ffff82d0402ba4ee 0000000000000cfc 0000000000000000
(XEN)    ffff83038e38f000 0000000000000000 0000000000000cfc 0000000000000000
(XEN)    0000000200000001 0001000000000000 0000000000000002 0000000000000002
(XEN)    0000000000000000 ffff83038e3b7e44 ffff83038dcfa000 ffff83038e3b7e10
(XEN)    ffff82d0402ba871 0000000000000000 ffff83038e3b7e44 0000000000000002
(XEN)    0000000000000cfc ffff83038dcf6000 0000000000000000 ffff83038e3b7e30
(XEN) Xen call trace:
(XEN)    [<ffff82d04026839e>] R drivers/vpci/header.c#modify_bars+0x3ba/0x4a3
(XEN)    [<ffff82d040268909>] F drivers/vpci/header.c#cmd_write+0x2c/0x3b
(XEN)    [<ffff82d040267998>] F vpci_write+0x14c/0x268
(XEN)    [<ffff82d0402cb649>] F arch/x86/hvm/io.c#vpci_portio_write+0xa0/0xa7
(XEN)    [<ffff82d0402caa72>] F hvm_process_io_intercept+0x203/0x26f
(XEN)    [<ffff82d0402cab08>] F hvm_io_intercept+0x2a/0x4c
(XEN)    [<ffff82d0402ba4ee>] F arch/x86/hvm/emulate.c#hvmemul_do_io+0x29a/0x5ee
(XEN)    [<ffff82d0402ba871>] F arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x2f/0x6a
(XEN)    [<ffff82d0402bbd10>] F hvmemul_do_pio_buffer+0x33/0x35
(XEN)    [<ffff82d0402cb41d>] F handle_pio+0x6d/0x1b8
(XEN)    [<ffff82d0402a2e4d>] F svm_vmexit_handler+0x10fe/0x18e2
(XEN)    [<ffff82d0402034dc>] F svm_stgi_label+0x5/0x15


You can also check how I applied the patch here:
https://gitlab.com/xen-project/people/sstabellini/xen/-/commit/851e76bf0a1cf6f040b6e90795d216ebfcc069cc
--8323329-1473932416-1684889972=:44000--

