Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CDA7DFC4D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 23:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627019.977849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyg2H-0006wO-I5; Thu, 02 Nov 2023 22:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627019.977849; Thu, 02 Nov 2023 22:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyg2H-0006tC-FD; Thu, 02 Nov 2023 22:19:33 +0000
Received: by outflank-mailman (input) for mailman id 627019;
 Thu, 02 Nov 2023 22:19:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmZ/=GP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qyg2G-0006t6-AF
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 22:19:32 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3879bd2-79cd-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 23:19:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 46549B81CA3;
 Thu,  2 Nov 2023 22:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27EBC433C8;
 Thu,  2 Nov 2023 22:19:26 +0000 (UTC)
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
X-Inumbo-ID: e3879bd2-79cd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698963567;
	bh=byD+YuTd3iXirB/rWOPno319fKmJ/3C6tGOusnVGaDg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lZjXGocBte2uFYgWtLxJcNilgQj1B09KCexpJFWnMpDKfNx7btRb4S0o8hXoDU9MS
	 HnAi/1tZWKemizlUbAVPZGJ+szaElpKFV6Hwga3Q2a0uV9SNVrX72ZltWCq/beHKIt
	 zFyjqQKq6NG4opQ3mpJ48VXZMiDe2bVpgLvDtBCYiV2DKMFRs5auQtT6PSSB6eajHd
	 R0QrZYBtDiWgDYUBOBnCF+/jSYLh57q5dWsFZFSzpS/YKBM1tzIPcR5K7g9dvUds3Y
	 6CRxFZDbA1StcfrSeon2KB8edJoj6UI2P55p5fUpwoj3+lAAllF3cwgec/RIy1yiHk
	 +toLilmHqVcdA==
Date: Thu, 2 Nov 2023 15:19:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/irq: do not insert IRQ_MSI_EMU in emuirq mappings
In-Reply-To: <c586aa91-c35f-5f0c-7d1e-0df47efe79eb@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311021506330.2125691@ubuntu-linux-20-04-desktop>
References: <20231031133037.157936-1-xenia.ragiadakou@amd.com> <ZUEsabItf_lpvi25@macbook> <c586aa91-c35f-5f0c-7d1e-0df47efe79eb@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1772198601-1698962922=:2125691"
Content-ID: <alpine.DEB.2.22.394.2311021508580.2125691@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1772198601-1698962922=:2125691
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311021508581.2125691@ubuntu-linux-20-04-desktop>

On Thu, 2 Nov 2023, Jan Beulich wrote:
> On 31.10.2023 17:33, Roger Pau Monné wrote:
> > On Tue, Oct 31, 2023 at 03:30:37PM +0200, Xenia Ragiadakou wrote:
> >> Do not use emuirq mappings for MSIs injected by emulated devices.
> >> This kind of pirq shares the same emuirq value and is not remapped.
> > 
> > AFAICT adding the extra emuirq mappings is harmless, and just adds
> > an extra layer of translation?
> > 
> > Or is this causing issues, but we haven't realized because we don't
> > provide emulated devices that use MSI(-X) by default?
> 
> Yeah, whether there's anything wrong with this or whether this change
> is merely trying to optimize things wants spelling out.
> 
> >> Fixes: 88fccdd11ca0 ('xen: event channel remapping for emulated MSIs')
> >> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> >> ---
> >>
> >> Question: is there any strong reason why Linux HVM guests still use pirqs?
> > 
> > Baggage I guess.  I've suggested in the past to switch PIRQs off by
> > default for HVM, but I had no figures to show how much of a
> > performance penalty that would be for passthrough devices.
> > 
> > My suggestion would be to introduce an xl.cfg option to select the
> > availability of PIRQs for HVM guests, and set it to off by default.
> > You would also need to make sure that migration (or save/restore)
> > works fine, and that incoming guests from previous Xen versions (that
> > won't have the option) will result in PIRQs still being enabled.
> > 
> > There's already a XEN_X86_EMU_USE_PIRQ flag in xen_arch_domainconfig,
> > so you just need to wire the tools side in order to allow selection by
> > users.
> > 
> >>
> >>  xen/arch/x86/irq.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> >> index f42ad539dc..cdc8dc5a55 100644
> >> --- a/xen/arch/x86/irq.c
> >> +++ b/xen/arch/x86/irq.c
> >> @@ -2684,7 +2684,7 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq)
> >>      }
> >>  
> >>      old_emuirq = domain_pirq_to_emuirq(d, pirq);
> >> -    if ( emuirq != IRQ_PT )
> >> +    if ( (emuirq != IRQ_PT) && (emuirq != IRQ_MSI_EMU) )
> >>          old_pirq = domain_emuirq_to_pirq(d, emuirq);
> > 
> > I think you can just use emuirq >= 0, as we then only need the emuirq
> > translation for passthrough interrupts, same for the rest of the
> > changed conditions.

I think this should work


> > Looking further, the function seems to be useless when called with
> > emuirq < 0, and hence it might be better to avoid such calls in the
> > first place?
> > 
> > I have to admit I've always been very confused with the PIRQ logic, so
> > it's possible I'm missing some relevant stuff here.
> 
> For any emuirq questions I'd like to suggest to Cc Stefano, who iirc was
> the one introducing this machinery. Like you I've never gained proper
> understanding of the concept and implementation, and hence I can always
> only refer back to Stefano.

At the time it was introduced as a minor performance improvement and
also because it helped us get the right hooks in place in Linux to
upstream Dom0 support (the MSI/MSI-X setup hooks). The feature came with
a high cost in complexity but it was worth it.

Now that many years have passed, Dom0 support has been in Linux for a
long time, the performance improvement alone is not worth keeping this
complexity in Xen. Especially considering direct interrupt injection is
a feature available in many modern interrupt controllers across arches
(x86, ARM, RISC-V).

I think it is time to get rid of XEN_X86_EMU_USE_PIRQ so that guests
stop using the feature. It is fragile. Removing XEN_X86_EMU_USE_PIRQ is
on my todo list but I welcome anyone doing it.
--8323329-1772198601-1698962922=:2125691--

