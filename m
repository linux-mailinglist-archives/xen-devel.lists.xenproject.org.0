Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B559B7742
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 10:19:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828507.1243403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RKO-0000Td-AM; Thu, 31 Oct 2024 09:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828507.1243403; Thu, 31 Oct 2024 09:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RKO-0000Rv-68; Thu, 31 Oct 2024 09:18:52 +0000
Received: by outflank-mailman (input) for mailman id 828507;
 Thu, 31 Oct 2024 09:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uh3x=R3=suse.de=tiwai@srs-se1.protection.inumbo.net>)
 id 1t6RKN-0000Rp-GC
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 09:18:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21c63721-9769-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 10:18:46 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 316DC1F835;
 Thu, 31 Oct 2024 09:18:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB49F136A5;
 Thu, 31 Oct 2024 09:18:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uBqmKHNLI2f+JgAAD6G6ig
 (envelope-from <tiwai@suse.de>); Thu, 31 Oct 2024 09:18:43 +0000
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
X-Inumbo-ID: 21c63721-9769-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5NS4xMzUuMjIzLjEzMSIsImhlbG8iOiJzbXRwLW91dDIuc3VzZS5kZSJ9
X-Custom-Transaction: eyJpZCI6IjIxYzYzNzIxLTk3NjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzY2MzI2Ljk3NjU5MSwic2VuZGVyIjoidGl3YWlAc3VzZS5kZSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730366325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8flyOdsN1Wv/gVQcgw6n18uLkNhAqVdP/ybYJ4cMEt4=;
	b=Ea95kNviZxvF/MWH1YNektTuRzffklUHTKPVt+MLD8KNcUuk+RAFwME8rOfLDmUgeoNZCY
	uHKrZVrKtjwKmHCfcdY6P5Xf2yD0jxjFQO3JjxZEAJHe6L/4OpVl2MN++X5CKYP5BBRjwP
	GYrY0rVxH2Fcy1Msv0+vT1N9t5TR4LA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730366325;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8flyOdsN1Wv/gVQcgw6n18uLkNhAqVdP/ybYJ4cMEt4=;
	b=+lYYZtpATJvtnnHjt9JH6YqR8hovRj92QK7IQ/MlTx3aBUOCUlkgzMYDVjUJg00CqGIqAq
	nLXkrGkIXGcGRXDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ea95kNvi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+lYYZtpA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730366325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8flyOdsN1Wv/gVQcgw6n18uLkNhAqVdP/ybYJ4cMEt4=;
	b=Ea95kNviZxvF/MWH1YNektTuRzffklUHTKPVt+MLD8KNcUuk+RAFwME8rOfLDmUgeoNZCY
	uHKrZVrKtjwKmHCfcdY6P5Xf2yD0jxjFQO3JjxZEAJHe6L/4OpVl2MN++X5CKYP5BBRjwP
	GYrY0rVxH2Fcy1Msv0+vT1N9t5TR4LA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730366325;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8flyOdsN1Wv/gVQcgw6n18uLkNhAqVdP/ybYJ4cMEt4=;
	b=+lYYZtpATJvtnnHjt9JH6YqR8hovRj92QK7IQ/MlTx3aBUOCUlkgzMYDVjUJg00CqGIqAq
	nLXkrGkIXGcGRXDg==
Date: Thu, 31 Oct 2024 10:19:47 +0100
Message-ID: <87plngwrws.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Philipp Stanner <pstanner@redhat.com>,	Damien Le Moal
 <dlemoal@kernel.org>,	Niklas Cassel <cassel@kernel.org>,	Sergey Shtylyov
 <s.shtylyov@omp.ru>,	Basavaraj Natikar <basavaraj.natikar@amd.com>,	Jiri
 Kosina <jikos@kernel.org>,	Benjamin Tissoires <bentiss@kernel.org>,	Arnd
 Bergmann <arnd@arndb.de>,	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,	"David S. Miller"
 <davem@davemloft.net>,	Eric Dumazet <edumazet@google.com>,	Jakub Kicinski
 <kuba@kernel.org>,	Paolo Abeni <pabeni@redhat.com>,	Rasesh Mody
 <rmody@marvell.com>,	GR-Linux-NIC-Dev@marvell.com,	Igor Mitsyanko
 <imitsyanko@quantenna.com>,	Sergey Matyukevich <geomatsi@gmail.com>,	Kalle
 Valo <kvalo@kernel.org>,	Sanjay R Mehta <sanju.mehta@amd.com>,	Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>,	Jon Mason <jdmason@kudzu.us>,	Dave Jiang
 <dave.jiang@intel.com>,	Allen Hubbe <allenbh@gmail.com>,	Bjorn Helgaas
 <bhelgaas@google.com>,	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,	Stefano Stabellini
 <sstabellini@kernel.org>,	Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Chen Ni <nichen@iscas.ac.cn>,	Mario Limonciello
 <mario.limonciello@amd.com>,	Ricky Wu <ricky_wu@realtek.com>,	Al Viro
 <viro@zeniv.linux.org.uk>,	Breno Leitao <leitao@debian.org>,	Kevin Tian
 <kevin.tian@intel.com>,	Thomas Gleixner <tglx@linutronix.de>,	Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,	Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,	Mostafa Saleh
 <smostafa@google.com>,	Jason Gunthorpe <jgg@ziepe.ca>,	Yi Liu
 <yi.l.liu@intel.com>,	Christian Brauner <brauner@kernel.org>,	Ankit Agrawal
 <ankita@nvidia.com>,	Eric Auger <eric.auger@redhat.com>,	Reinette Chatre
 <reinette.chatre@intel.com>,	Ye Bin <yebin10@huawei.com>,	Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Rui Salvaterra <rsalvaterra@gmail.com>,
	linux-ide@vger.kernel.org,	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/13] Remove implicit devres from pci_intx()
In-Reply-To: <20241030221737.GA1223682@bhelgaas>
References: <20241015185124.64726-1-pstanner@redhat.com>
	<20241030221737.GA1223682@bhelgaas>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 316DC1F835
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,omp.ru,amd.com,arndb.de,linuxfoundation.org,yahoo.com,marvell.com,davemloft.net,google.com,quantenna.com,gmail.com,kudzu.us,intel.com,suse.com,epam.com,perex.cz,iscas.ac.cn,realtek.com,zeniv.linux.org.uk,debian.org,linutronix.de,linux.intel.com,ziepe.ca,nvidia.com,huawei.com,invisiblethingslab.com,linux.dev,vger.kernel.org,lists.linux.dev,lists.xenproject.org];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_GT_50(0.00)[67];
	R_RATELIMIT(0.00)[to_ip_from(RLrrkwc4rnabsqsjbq9gcqj97h)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 30 Oct 2024 23:17:37 +0100,
Bjorn Helgaas wrote:
> 
> On Tue, Oct 15, 2024 at 08:51:10PM +0200, Philipp Stanner wrote:
> > @Driver-Maintainers: Your driver might be touched by patch "Remove
> > devres from pci_intx()". You might want to take a look.
> > 
> > Changes since the RFC [1]:
> >   - Add a patch deprecating pci{m}_intx(). (Heiner, Andy, Me)
> >   - Add Acked-by's already given.
> >   - Export pcim_intx() as a GPL function. (Alex)
> >   - Drop patch for rts5280, since this driver will be removed quite
> >     soon. (Philipp Hortmann, Greg)
> >   - Use early-return in pci_intx_unmanaged() and pci_intx(). (Andy)
> > 
> > Hi all,
> > 
> > this series removes a problematic feature from pci_intx(). That function
> > sometimes implicitly uses devres for automatic cleanup. We should get
> > rid of this implicit behavior.
> > 
> > To do so, a pci_intx() version that is always-managed, and one that is
> > never-managed are provided. Then, all pci_intx() users are ported to the
> > version they need. Afterwards, pci_intx() can be cleaned up and the
> > users of the never-managed version be ported back to pci_intx().
> > 
> > This way we'd get this PCI API consistent again.
> > 
> > Patch "Remove devres from pci_intx()" obviously reverts the previous
> > patches that made drivers use pci_intx_unmanaged(). But this way it's
> > easier to review and approve. It also makes sure that each checked out
> > commit should provide correct behavior, not just the entire series as a
> > whole.
> > 
> > Merge plan for this is to enter through the PCI tree.
> > 
> > [1] https://lore.kernel.org/all/20241009083519.10088-1-pstanner@redhat.com/
> 
> I *think* this series depends on resolution of Takashi's "Restore the
> original INTX_DISABLE bit by pcim_intx()" patch [2], right?

IIUC, it's not really dependent, as pcim_intx() has been used in
pci_intx() internally when the PCI device is already managed.
My patch is to correct the already existing behavior.  So I guess you
can take this series, and I'll post the revised patch later (sorry, I
was too busy for other tasks).


thanks,

Takashi

> 
> For now I'm postponing this series, but let me know if that's not the
> right thing.
> 
> [2] https://lore.kernel.org/r/20241024155539.19416-1-tiwai@suse.de
> 
> > Philipp Stanner (13):
> >   PCI: Prepare removing devres from pci_intx()
> >   ALSA: hda_intel: Use always-managed version of pcim_intx()
> >   drivers/xen: Use never-managed version of pci_intx()
> >   net/ethernet: Use never-managed version of pci_intx()
> >   net/ntb: Use never-managed version of pci_intx()
> >   misc: Use never-managed version of pci_intx()
> >   vfio/pci: Use never-managed version of pci_intx()
> >   PCI: MSI: Use never-managed version of pci_intx()
> >   ata: Use always-managed version of pci_intx()
> >   wifi: qtnfmac: use always-managed version of pcim_intx()
> >   HID: amd_sfh: Use always-managed version of pcim_intx()
> >   Remove devres from pci_intx()
> >   PCI: Deprecate pci_intx(), pcim_intx()
> > 
> >  drivers/ata/ahci.c                            |  2 +-
> >  drivers/ata/ata_piix.c                        |  2 +-
> >  drivers/ata/pata_rdc.c                        |  2 +-
> >  drivers/ata/sata_sil24.c                      |  2 +-
> >  drivers/ata/sata_sis.c                        |  2 +-
> >  drivers/ata/sata_uli.c                        |  2 +-
> >  drivers/ata/sata_vsc.c                        |  2 +-
> >  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 +--
> >  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  2 +-
> >  .../wireless/quantenna/qtnfmac/pcie/pcie.c    |  2 +-
> >  drivers/pci/devres.c                          | 29 +++++--------------
> >  drivers/pci/pci.c                             | 19 ++++--------
> >  include/linux/pci.h                           |  1 +
> >  sound/pci/hda/hda_intel.c                     |  2 +-
> >  14 files changed, 26 insertions(+), 47 deletions(-)
> > 
> > -- 
> > 2.47.0
> > 

