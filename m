Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B16054A27E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 01:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348501.574737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0tKn-00033q-Hu; Mon, 13 Jun 2022 23:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348501.574737; Mon, 13 Jun 2022 23:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0tKn-00030Q-Dc; Mon, 13 Jun 2022 23:19:01 +0000
Received: by outflank-mailman (input) for mailman id 348501;
 Mon, 13 Jun 2022 23:19:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWck=WU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o0tKm-0002Vh-0p
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 23:19:00 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 342682d0-eb6f-11ec-8901-93a377f238d6;
 Tue, 14 Jun 2022 01:18:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 903DBB8113A;
 Mon, 13 Jun 2022 23:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22CCC34114;
 Mon, 13 Jun 2022 23:18:56 +0000 (UTC)
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
X-Inumbo-ID: 342682d0-eb6f-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655162337;
	bh=n7XgE+j94TbHRvuizJ0bzXRSmHEAXiTemoGzgyt3cqw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GjXXUPje6LHJbFRU8cf6PAeLywslA6Woopn7t37ft458+bn/idfe0IJubSMtAkkYd
	 +0RvCaBHhI5KzGYaECNLZ3WWiJfDEsCyPmbZdtA3Jpnt9aGDlWb1D+6VBJComGBeeb
	 JcjzucvgAa63F/fg0Va9z4wtJi9X3P5MxtCVknI/uq2iynxZVol98yP9Aoivn6a2o+
	 0xAG5SpUP5MgJj9We2dRohQ2BmEUTtOvnnd5vJiSJlTfqAluYusDwjYnEErbJG8IZ0
	 Prd5ro7Yyqf2IO8Uq98DZpRo1HH6jdslkZXE0Jf/08iS0ZkpbBlv4opfSuP64mSS/G
	 RYakYxlkqfjtA==
Date: Mon, 13 Jun 2022 16:18:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
In-Reply-To: <569a6d37-157a-d237-3ef9-d77fae32d002@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206131618300.1837490@ubuntu-linux-20-04-desktop>
References: <20220609061812.422130-1-jens.wiklander@linaro.org> <20220609061812.422130-2-jens.wiklander@linaro.org> <alpine.DEB.2.22.394.2206101733020.756493@ubuntu-linux-20-04-desktop> <569a6d37-157a-d237-3ef9-d77fae32d002@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 11 Jun 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 11/06/2022 01:41, Stefano Stabellini wrote:
> > On Thu, 9 Jun 2022, Jens Wiklander wrote:
> > > +    /* Store the registers x0 - x17 into the result structure */
> > > +    stp	x0, x1, [x19, #0]
> > > +    stp	x2, x3, [x19, #16]
> > > +    stp	x4, x5, [x19, #32]
> > > +    stp	x6, x7, [x19, #48]
> > > +    stp	x8, x9, [x19, #64]
> > > +    stp	x10, x11, [x19, #80]
> > > +    stp	x12, x13, [x19, #96]
> > > +    stp	x14, x15, [x19, #112]
> > > +    stp	x16, x17, [x19, #128]
> > 
> > I noticed that in the original commit the offsets are declared as
> > ARM_SMCCC_1_2_REGS_X0_OFFS, etc. In Xen we could add them to
> > xen/arch/arm/arm64/asm-offsets.c given that they are only used in asm.
> > 
> > That said, there isn't a huge value in declaring them given that they
> > are always read and written in order and there is nothing else in the
> > struct, so I am fine either way.
> 
> While we don't support big-endian in Xen (yet?), the offsets will be inverted.
> 
> Furthermore, I prefer to avoid open-coded value (in particular when they are
> related to offset). They are unlikely going to change, but at least we have
> the compiler that will compute them for us (so less chance for a problem).

I am OK with that

