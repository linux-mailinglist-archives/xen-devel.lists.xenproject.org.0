Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F095833E3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 22:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376446.609216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGnEA-0003zD-EF; Wed, 27 Jul 2022 20:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376446.609216; Wed, 27 Jul 2022 20:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGnEA-0003wW-BB; Wed, 27 Jul 2022 20:01:54 +0000
Received: by outflank-mailman (input) for mailman id 376446;
 Wed, 27 Jul 2022 20:01:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oGnE8-0003wQ-7S
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 20:01:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f41c0db6-0de6-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 22:01:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0CF40B82279;
 Wed, 27 Jul 2022 20:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0BDC433C1;
 Wed, 27 Jul 2022 20:01:46 +0000 (UTC)
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
X-Inumbo-ID: f41c0db6-0de6-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658952108;
	bh=dJZDq9TeojWaAeb5Tu3v7rbFJ9sd5XQ035WL4Vgv74k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pesfyF1ImnQgavp/Y3wz3b63NaZ6uaErRuYJLdfS8p28Tl0lfRZ5YwNQ6CXtCMvbc
	 znyjyH6FUmrjJmmq9m4BSPrZy4Cv7I2P9DoUcLvK5WDVG8McUNRCs8GLFZFeUV5C6z
	 4Q1vGoCsdnLi+7huizv20KgOZGJcNDT1AS4+MLzHNePskqGaNV1hSt4R9GAtMxuN9o
	 xeCyxPrDHoXiKMfmUJzs+yYScgx23PAcs25cAX7jJEw/yiGf0rhC9kOPPs9mtgX+HO
	 Gf1jxW16Fd4ECKczURRLJh0rht3FguwHGNMrGHf685Yu5odUek7uG5kjqhCLJ/mZf7
	 pxLokSumxnB2w==
Date: Wed, 27 Jul 2022 13:01:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Shuhua Lei <lei56@purdue.edu>
cc: "Smith, Jackson" <rsmith@RiversideResearch.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [IMAGEBUILDER PATCH] uboot-script-gen: allow fit generation with
 no dom0 kernel
In-Reply-To: <CH2PR22MB1926F1B6BAAD46C9FD4E6341C0979@CH2PR22MB1926.namprd22.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2207271301350.4648@ubuntu-linux-20-04-desktop>
References: <BN0P110MB16423592266085271C069BA7CF959@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM> <alpine.DEB.2.22.394.2207261713020.4648@ubuntu-linux-20-04-desktop> <BN0P110MB16420524ED9A79C52C86629BCF979@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <CH2PR22MB1926F1B6BAAD46C9FD4E6341C0979@CH2PR22MB1926.namprd22.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Jul 2022, Jason Shuhua Lei wrote:
> Hello,
> > -----Original Message-----
> > From: Smith, Jackson <rsmith@RiversideResearch.org>
> > 
> > > -----Original Message-----
> > > From: Stefano Stabellini <sstabellini@kernel.org>
> > >
> > > On Mon, 25 Jul 2022, Smith, Jackson wrote:
> > > > Hi Stefano,
> > > >
> > > > My colleague Jason Lei and I would like to submit a patch to imagebuilder.
> > > >
> > > > It seems that generating a .fit with a true dom0less configuration
> > > > fails
> > > because an extraneous comma is included in the its file.
> > > >
> > > > We believe this change resolves the issue.
> > >
> > > Hi Jackson, thanks for your contribution!
> > >
> > > Yes, I see the problem: the code assumes there is a dom0 kernel. If
> > > there is no
> > > dom0 kernel then load_files will be wrongly starting with a ","
> > >
> > > I would be happy to commit your patch. I assume I can add your
> > > Signed-off-by to it, right?
> > 
> > Yes, that is fine. Could you also add Jason, as he worked this out initially?
> > I've added him to the message so he can give his ok.
> > 
> Yes, I would like to be signed off on the patch as well using this email.

Done, thanks!

