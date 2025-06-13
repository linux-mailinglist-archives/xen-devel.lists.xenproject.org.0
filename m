Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA05BAD97EF
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 00:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014983.1392968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQCTm-0006Ad-0o; Fri, 13 Jun 2025 22:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014983.1392968; Fri, 13 Jun 2025 22:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQCTl-00068o-UC; Fri, 13 Jun 2025 22:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1014983;
 Fri, 13 Jun 2025 22:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZty=Y4=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uQCTj-00068P-Av
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 22:02:28 +0000
Received: from 16.mo583.mail-out.ovh.net (16.mo583.mail-out.ovh.net
 [87.98.174.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15e4d123-48a2-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 00:02:24 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.139.43])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4bJtfl3BRfz1V6B
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 22:02:23 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-s646q (unknown [10.110.178.126])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 64279C0298;
 Fri, 13 Jun 2025 22:02:22 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.102])
 by ghost-submission-5b5ff79f4f-s646q with ESMTPSA
 id IUl4Ae6fTGi+Li0ALs7SAA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 13 Jun 2025 22:02:22 +0000
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
X-Inumbo-ID: 15e4d123-48a2-11f0-a309-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-102R004075e58a4-1b67-4f52-abf0-04d9927e4d83,
                    FF81FBFBD66CD586AFAA25B56E63FC5C08F599B2) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sat, 14 Jun 2025 01:01:52 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: ross.philipson@oracle.com
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v3 08/22] x86/slaunch: restore boot MTRRs after Intel TXT
 DRTM
Message-ID: <aEyf0IYQyLKGSrkP@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5b6b9bf165a4fd9444dc53848fb8faa2cea30781.1748611041.git.sergii.dmytruk@3mdeb.com>
 <b5a083fc-ed94-4d94-acf3-e3b454440a3e@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5a083fc-ed94-4d94-acf3-e3b454440a3e@oracle.com>
X-Ovh-Tracer-Id: 11524429973350954140
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduledutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevveevgefgvdekvefhffevgeejgffghfehiedvffdtgfevudetkefhgfekfeffvdenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekgedrvddvuddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeefmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=uROBNkJrqlizsEP7Y2MP2ACbfBDRCUXSKMG0sr3LgHo=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1749852143; v=1;
 b=aCPfZbdkfSXf8dWSfQpilUNY7+JpvfN2+7vD6bNaXD7E/lHZGXbZOPn47iaDcxiL6soTGM/T
 LmYOiO2dPNo7Ch75UkNphlX9AU3xk3r5YYAapUrIoiDK//+plfB/v3wz76TE/RjRMEnyEFIKxhg
 M/BqKN1cIUIziNN+kgH/sNVggtyFBTGjROTAXU8+QF6mneZJAAxFuHcwv3gvwT+ugqFv0WLMJ7S
 a100INb8eUmQX6mdBgv7Y/TUcpfpbCI2xYbT4i8YC0q/tyadOrcy0WjbkCFri/38rB8Ux3wCsBE
 FVNd2OEqGIhasRnIK+egv15qV2iycKMTR6ztb6+ugy66A==

On Tue, Jun 03, 2025 at 12:43:30PM -0700, ross.philipson@oracle.com wrote:
> On 5/30/25 6:17 AM, Sergii Dmytruk wrote:
> > From: Krystian Hebel <krystian.hebel@3mdeb.com>
> >
> > In preparation for TXT SENTER call, GRUB had to modify MTRR settings
> > to be UC for everything except SINIT ACM. Old values are restored
> > from SLRT where they were saved by the bootloader.
> >
> > Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> > Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
> > Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> > ---
> >   xen/arch/x86/e820.c                  |  5 ++
> >   xen/arch/x86/include/asm/intel-txt.h |  3 ++
> >   xen/arch/x86/intel-txt.c             | 75 ++++++++++++++++++++++++++++
> >   3 files changed, 83 insertions(+)
> >
> > diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
> > index ca577c0bde..60f00e5259 100644
> > --- a/xen/arch/x86/e820.c
> > +++ b/xen/arch/x86/e820.c
> > @@ -11,6 +11,8 @@
> >   #include <asm/mtrr.h>
> >   #include <asm/msr.h>
> >   #include <asm/guest.h>
> > +#include <asm/intel-txt.h>
> > +#include <asm/slaunch.h>
> >   /*
> >    * opt_mem: Limit maximum address of physical RAM.
> > @@ -442,6 +444,9 @@ static uint64_t __init mtrr_top_of_ram(void)
> >       ASSERT(paddr_bits);
> >       addr_mask = ((1ULL << paddr_bits) - 1) & PAGE_MASK;
> > +    if ( slaunch_active )
> > +        txt_restore_mtrrs(e820_verbose);
> > +
>
> I was just curious why they are being restored here in the e820 code? It
> seems that could be restored earlier. Until they are restored, most of RAM
> is set UC as you know. I also don't have an exact idea how early in Xen boot
> cycle this is occurring so maybe this is fine but obviously for performance
> reasons it should be done as early as possible.
>
> Thanks,
> Ross

Original MTRR values are in SLRT which is deliberately measured before
being used by e820 code.  I'm not sure if anything precludes moving that
part (mapping memory, interacting with TPM) earlier in __start_xen().
Could be worth trying moving it up.

Regards

