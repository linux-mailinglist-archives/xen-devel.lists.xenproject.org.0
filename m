Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E2742CF5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 21:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557025.870004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEx4e-0002ZC-DK; Thu, 29 Jun 2023 19:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557025.870004; Thu, 29 Jun 2023 19:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEx4e-0002XX-AU; Thu, 29 Jun 2023 19:13:00 +0000
Received: by outflank-mailman (input) for mailman id 557025;
 Thu, 29 Jun 2023 19:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWGL=CR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qEx4d-0002XJ-87
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 19:12:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3d3e294-16b0-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 21:12:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 403CB615E7;
 Thu, 29 Jun 2023 19:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1101C433C0;
 Thu, 29 Jun 2023 19:12:52 +0000 (UTC)
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
X-Inumbo-ID: f3d3e294-16b0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688065974;
	bh=rdECzaccBaa5IG+eqZ/dSfppJRjb0we3BID2NdDlhrM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q95ALkTx8AdmAq1vxS0VjQSBDc0/DDfUc7i/Z4YBFzEaVZqCaIaMVtbY0euKraIPa
	 4vcrglCybhjj9jNIXfTbh/spqhl9cP2NnhwKvJwphCiLNWhW7S/LQN0c1o1U4GVfqf
	 eVllHbSmtyQbswyefH50VLVLvrWwPDkkU5x96qBT0jc4XNoc8iOXka5+QvJaLeo5EQ
	 cZbY24qoO9mLrMvZU4/i9BDoLn+LiDXI7P6LifN/+Msig8yeD1KN7T/mrHTZ3iJVU8
	 WDL6CT43zMe7WVAlwDlmpGl00EIUu7KVnEET02i+hIDs5AAJBO3lg63g2gpkwJFILz
	 N+RvNUKa1mhqw==
Date: Thu, 29 Jun 2023 12:12:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, 
    "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3 2/3] xen/drivers/passthrough/arm/smmu-v3.c: fix
 violations of MISRA C:2012 Rule 3.1
In-Reply-To: <55390224-89CC-44E9-95B1-BBA491BBFEF3@arm.com>
Message-ID: <alpine.DEB.2.22.394.2306291212300.3936094@ubuntu-linux-20-04-desktop>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com> <8a8d5ed47f24791d3927345fafed07023a8b0b76.1688032865.git.nicola.vetrini@bugseng.com> <55390224-89CC-44E9-95B1-BBA491BBFEF3@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-414435028-1688065974=:3936094"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-414435028-1688065974=:3936094
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 29 Jun 2023, Luca Fancellu wrote:
> > On 29 Jun 2023, at 11:06, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
> > 
> > In the file `xen/drivers/passthrough/arm/smmu-v3.c' there are a few occurrences
> 
> here you use a different character to enclose the file path (` vs ‘) may I suggest to
> use only (‘)?
> 
> > of nested '//' character sequences inside C-style comment blocks, which violate
> > Rule 3.1.
> > 
> > The patch aims to resolve those by replacing the nested comments with
> > equivalent constructs that do not violate the rule.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> You are missing the “---“ here, meaning that the lines below are part of the
> commit message and I’m sure you don’t want that.
> 
> Also here, may I suggest to use this commit title instead?
> “xen/arm: smmuv3: Fix violations of MISRA C:2012 Rule 3.1”
> 
> Apart from that, changes looks good to me:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Will be the maintainer/committer to decide if addressing these comment,
> if accepted, on commit or if you need to send another version, in which
> case you can retain my r-by provided that no other modifications are done.
 
I think it can be done on commit. With the changes suggested by Luca:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> > Changes:
> > - Resending the patch with the right maintainers in CC.
> > Changes in V2:
> > - Split the patch into a series and reworked the fix.
> > - Apply the fix to the arm32 `flushtlb.h' file, for consistency
> > Changes in V3:
> > - Revised the comment to make it clear the function the parallel control
> > flows in the comment belong to.
> > ---
> > xen/drivers/passthrough/arm/smmu-v3.c | 8 ++++----
> > 1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> > index 720aa69ff2..cdbb505134 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.c
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> > @@ -1047,10 +1047,10 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
> > * before we read 'nr_ats_masters' in case of a concurrent call to
> > * arm_smmu_enable_ats():
> > *
> > - * // unmap() // arm_smmu_enable_ats()
> > - * TLBI+SYNC atomic_inc(&nr_ats_masters);
> > - * smp_mb(); [...]
> > - * atomic_read(&nr_ats_masters); pci_enable_ats() // writel()
> > + * --- unmap() ---                 --- arm_smmu_enable_ats() ---
> > + * TLBI+SYNC                       atomic_inc(&nr_ats_masters);
> > + * smp_mb();                       [...]
> > + * atomic_read(&nr_ats_masters);   pci_enable_ats() (see writel())
> > *
> > * Ensures that we always see the incremented 'nr_ats_masters' count if
> > * ATS was enabled at the PCI device before completion of the TLBI.
> > -- 
> > 2.34.1
> > 
> > 
> 
> 
--8323329-414435028-1688065974=:3936094--

