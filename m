Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFBF403173
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 01:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181385.328465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNkLN-00087u-Ey; Tue, 07 Sep 2021 23:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181385.328465; Tue, 07 Sep 2021 23:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNkLN-00084z-BN; Tue, 07 Sep 2021 23:17:33 +0000
Received: by outflank-mailman (input) for mailman id 181385;
 Tue, 07 Sep 2021 23:17:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mNkLL-00084t-CG
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 23:17:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1aa5a533-8819-49de-b45c-841c709c772c;
 Tue, 07 Sep 2021 23:17:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3582160F14;
 Tue,  7 Sep 2021 23:17:29 +0000 (UTC)
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
X-Inumbo-ID: 1aa5a533-8819-49de-b45c-841c709c772c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631056649;
	bh=YjPWq2Wq+vSUdQyVVhKv+XleADcbhg8WXnCbpZrIKik=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UX+twxd8x6POOzQBrVSlknvMWUwFTnsr+QwKOHztzsb58c5X7R40gpqX0ZlZ1thzd
	 /wjZxl5MWTENvH6LvfGUqP7/5XDZpPU5D5mDPi/O1HwnJYJLwg3V/SfpysZ/vapLkn
	 0bzdJyy/RUkgJtsrSrq1QTlE8iRh303UrJsxyYFJsk19CNBS+MHIrBTCF5Noh1G1Xl
	 Rd5byoNSdfNOlC14YYQelo1qkLpYp3P38XHKZjprIUsKnYR3txhLDAYbL7/yJ+EJYg
	 c44hPhwh2mCyfclt7pqkBw2ZnmGAChzYfBlqzOfP7MF/T88Wm4qy20spag00Dd0y/y
	 zJvhtgnnhxokA==
Date: Tue, 7 Sep 2021 16:17:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/7] xen/arm: Taint Xen on incompatible DCZID values
In-Reply-To: <DDB381B4-1519-43B5-9DA5-DE0C0E11916B@arm.com>
Message-ID: <alpine.DEB.2.21.2109071615170.14059@sstabellini-ThinkPad-T480s>
References: <cover.1629897306.git.bertrand.marquis@arm.com> <c1868fce1bcb0bcddf7bc786be166007f91f2f67.1629897306.git.bertrand.marquis@arm.com> <alpine.DEB.2.21.2109031529400.26072@sstabellini-ThinkPad-T480s> <DDB381B4-1519-43B5-9DA5-DE0C0E11916B@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Sep 2021, Bertrand Marquis wrote:
> > On 3 Sep 2021, at 23:49, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Wed, 25 Aug 2021, Bertrand Marquis wrote:
> >> Use arm64 cpu feature sanitization to TAIN Xen if different DCZID values
> >                                        ^  TAINT
> > 
> > 
> >> are found (ftr_dczid is using only STRICT method).
> >> In this case actual memory being cleaned by DC ZVA operations would be
> >> different depending on the cores which could make a guest zeroing too
> >> much or too little memory if it is merged between CPUs.
> >> 
> >> We could, on processor supporting it, trap access to DCZID_EL0 register
> >               ^ processors
> 
> Could those typos be fixed during commit ?

Yes they can

 
> >> using HFGRTR_EL2 register but this would not solve the case where a
> >> process is being migrated during a copy or if it cached the value of the
> >> register.
> >> 
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Change in v3: none
> >> Change in v2: Patch introduced in v2
> >> ---
> >> xen/arch/arm/arm64/cpufeature.c  | 14 +++++++++++---
> >> xen/arch/arm/cpufeature.c        |  2 ++
> >> xen/include/asm-arm/cpufeature.h |  8 ++++++++
> >> 3 files changed, 21 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
> >> index 61f629ebaa..b1936ef1d6 100644
> >> --- a/xen/arch/arm/arm64/cpufeature.c
> >> +++ b/xen/arch/arm/arm64/cpufeature.c
> >> @@ -329,14 +329,11 @@ static const struct arm64_ftr_bits ftr_mvfr2[] = {
> >> 	ARM64_FTR_END,
> >> };
> >> 
> >> -#if 0
> >> -/* TODO: handle this when sanitizing cache related registers */
> >> static const struct arm64_ftr_bits ftr_dczid[] = {
> >> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, DCZID_DZP_SHIFT, 1, 1),
> >> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, DCZID_BS_SHIFT, 4, 0),
> >> 	ARM64_FTR_END,
> >> };
> >> -#endif
> >> 
> >> static const struct arm64_ftr_bits ftr_id_isar0[] = {
> >> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE_SHIFT, 4, 0),
> >> @@ -592,6 +589,17 @@ void update_system_features(const struct cpuinfo_arm *new)
> >> 
> >> 	SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
> >> 
> >> +	/*
> >> +	 * Comment from Linux:
> > 
> > I don't know if I would keep or remove "Comment from Linux"
> 
> I added that because the comment itself does not really apply to Xen.
> I could have rephrased the comment/
> Anyway I have no objection to remove that statement.
> 
> Do I need to send a v2 for that ?

No you don't need to resend just for that or the typos. However if you
are going to resend, then an update would be nice :-)

