Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC2A02FE6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 19:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865882.1277161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUs4V-0000hX-Hq; Mon, 06 Jan 2025 18:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865882.1277161; Mon, 06 Jan 2025 18:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUs4V-0000gC-Ej; Mon, 06 Jan 2025 18:43:27 +0000
Received: by outflank-mailman (input) for mailman id 865882;
 Mon, 06 Jan 2025 18:43:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/Ld=T6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tUs4T-0000fL-OW
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 18:43:25 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b3a7664-cc5e-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 19:43:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5FE6BA41BDA;
 Mon,  6 Jan 2025 18:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6499EC4CED6;
 Mon,  6 Jan 2025 18:43:20 +0000 (UTC)
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
X-Inumbo-ID: 1b3a7664-cc5e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736189001;
	bh=14MEyWRNSFX0IA/wocvzdjWMOg7YPH0VVd6GhgzZZC0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HtNMLdSDpqs+CvqRws1WtE+1iITuDh94nw2qj9X1ZHn3Po0rM1CyxVfz55i0TEfcj
	 MMEesBo7cVIzm0dCwMSf/R7SbOLkjWZ9+mTQRZitGeaFfVSPyDbt3tkSJENkqL4gTG
	 gOioa7CXKlvlb46SdSQPiBTMmLCTurkjxnvM7++vHR87NfLmGX2AE3R4DuxFpTXdb/
	 SfbefUbmeSy+3Sllf6g+WQnGsbqKCc3W4K6B/A62YLfDp1GOO2qR4trbL1NMpFRSob
	 4tfz/45GgGKM4XfFUO21XjK1ngfo4lnMayMdfaUvZ3ic9gIUvTh8MaqxvpyBwQS1kX
	 49dRm8M4cRMJg==
Date: Mon, 6 Jan 2025 10:43:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH 2/5] xen/perfc: Add perfc_defn.h to asm-generic
In-Reply-To: <de2fb1d4daddcfb2a9de18fb7911c603@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2501061042590.133435@ubuntu-linux-20-04-desktop>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com> <20250102192508.2405687-3-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2501031525580.16425@ubuntu-linux-20-04-desktop> <de2fb1d4daddcfb2a9de18fb7911c603@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-375353694-1736189001=:133435"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-375353694-1736189001=:133435
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 4 Jan 2025, Nicola Vetrini wrote:
> On 2025-01-04 00:29, Stefano Stabellini wrote:
> > On Thu, 2 Jan 2025, Andrew Cooper wrote:
> > > ... and hook it up for RISC-V and PPC.
> > > 
> > > On RISC-V at least, no combination of headers pulls in errno.h, so include
> > > it
> > > explicitly.
> > > 
> > > Guard the hypercalls array declaration based on NR_hypercalls existing.
> > > This
> > > is sufficient to get PERF_COUNTERS fully working on RISC-V and PPC, so
> > > drop
> > > the randconfig override.
> > > 
> > > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > ---
> > > CC: Jan Beulich <JBeulich@suse.com>
> > > CC: Roger Pau Monné <roger.pau@citrix.com>
> > > CC: Stefano Stabellini <sstabellini@kernel.org>
> > > CC: Julien Grall <julien@xen.org>
> > > CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > > CC: Bertrand Marquis <bertrand.marquis@arm.com>
> > > CC: Michal Orzel <michal.orzel@amd.com>
> > > CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> > > ---
> > >  automation/gitlab-ci/build.yaml      | 1 -
> > >  xen/arch/ppc/include/asm/Makefile    | 1 +
> > >  xen/arch/riscv/include/asm/Makefile  | 1 +
> > >  xen/common/perfc.c                   | 1 +
> > >  xen/include/asm-generic/perfc_defn.h | 5 +++++
> > >  xen/include/xen/perfc_defn.h         | 2 ++
> > >  6 files changed, 10 insertions(+), 1 deletion(-)
> > >  create mode 100644 xen/include/asm-generic/perfc_defn.h
> > > 
> 
> > > diff --git a/xen/include/asm-generic/perfc_defn.h
> > > b/xen/include/asm-generic/perfc_defn.h
> > > new file mode 100644
> > > index 000000000000..8237636d83fb
> > > --- /dev/null
> > > +++ b/xen/include/asm-generic/perfc_defn.h
> > > @@ -0,0 +1,5 @@
> > > +/* This file is legitimately included multiple times. */
> > 
> > It is a good idea to add comment here to explain. This is effectively
> > the same as a deviation of MISRA D4.10. SAF-8-safe is defined as
> > "Headers that deliberatively leave the responsability of their correct
> > inclusion to the caller are allowed". I think it applies, please add
> > SAF-8-safe to this comment and also the other perfc_defn.h, e.g.:
> > 
> > /* SAF-8-safe This file is legitimately included multiple times. */
> > 
> 
> There is already a deviation in place for this kind of files, so I think
> that's good as is, no need for a SAF tag.
> 
> -doc_begin="Files that are intended to be included more than once do not need
> to
> conform to the directive."
> -config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* This file is
> legitimately included multiple times\\. \\*/$, begin-4))"}

Thanks Nicola, I didn't realize that.

In that case:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

--8323329-375353694-1736189001=:133435--

