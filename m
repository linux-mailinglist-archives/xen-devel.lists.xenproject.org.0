Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449AB4DBA72
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 22:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291296.494337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUbfO-0000EP-9h; Wed, 16 Mar 2022 21:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291296.494337; Wed, 16 Mar 2022 21:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUbfO-0000Bi-6n; Wed, 16 Mar 2022 21:58:50 +0000
Received: by outflank-mailman (input) for mailman id 291296;
 Wed, 16 Mar 2022 21:58:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79/6=T3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nUbfM-0000Bc-4v
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 21:58:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 409c6adc-a574-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 22:58:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49FB9B81CE8;
 Wed, 16 Mar 2022 21:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3FFC340EC;
 Wed, 16 Mar 2022 21:58:43 +0000 (UTC)
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
X-Inumbo-ID: 409c6adc-a574-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647467924;
	bh=m9a45UArasMKXAuzGU+/iR16SFfI45YODgIE0+d6UqY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hlCnXA7/OYiVj77Dcly3yajnIZQJcCoHqnY2fTKUxRFPmbjNiuhkGsJEPoyjdZPGq
	 iYzpRA5AIQNewI2SXyDXMQw+mdqjLruNm4O1Gc1sjrgGmWF0rIAGOCjHeWsx8HDPd0
	 ujewsumqE4FcZAMUinGAI/8yn8dwgCJg4sLMoje3LZCFrKzBglCQoeJ3I5Uc9lW+V4
	 xqvZ5drJRkgpg9uu+9lXg/WFNkcw8vQdWD1E44gvtm1CmMroPPvfU7YudPJc6MPT9q
	 toX3RjJ4hyjmQAnJWiQZdXq7s7YKQxIZdM+oRnPrwSy+R52CLBiEjAfjGv8guVrPqB
	 ZBuU4Uuond40g==
Date: Wed, 16 Mar 2022 14:58:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech, 
    lucmiccio@gmail.com, Julien Grall <jgrall@amazon.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
In-Reply-To: <26d41f77-085a-62e4-088b-49dcda63c100@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203161457410.3497@ubuntu-linux-20-04-desktop>
References: <20220309112048.17377-1-julien@xen.org> <20220309112048.17377-5-julien@xen.org> <alpine.DEB.2.22.394.2203111721130.3497@ubuntu-linux-20-04-desktop> <ece8f698-0abd-42eb-625e-693f69f02e27@xen.org> <alpine.DEB.2.22.394.2203141459360.3497@ubuntu-linux-20-04-desktop>
 <26d41f77-085a-62e4-088b-49dcda63c100@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Mar 2022, Julien Grall wrote:
> On 14/03/2022 23:48, Stefano Stabellini wrote:
> > > > - we save the current mapping
> > > > - update it with the Xen 1:1
> > > > - switch_ttbr
> > > > - remove Xen 1:1
> > > > - restore mapping
> > > > 
> > > > It should work, right? Basically, a mapping conflict shouldn't be an
> > > > issue given that the mapping has only to live long enough to call
> > > > switch_ttbr_id.
> > > 
> > > Today switch_ttbr() is called before we initialized most of the memory
> > > layout.
> > > So clashing with the VMAP and frametable is not a problem.
> > > 
> > > However, the identity mapping may also clash with the region used to map
> > > Xen.
> > > That said, technically, we are not able to handle Xen when its start
> > > address
> > > is in region 2MB + 4K to 4MB (Xen is loaded at a 4KB aligned address).
> > > 
> > > The trouble is some features (e.g. UBSAN, GCOV) can generate Xen image
> > > over
> > > 2MB. IOW, the range where Xen cannot be loaded will increase.
> > > 
> > > This is an issue because AFAIK, there is no away to tell GRUB "You can't
> > > load
> > > Xen at this region". But even if there were one, I feel this restriction
> > > is
> > > sort of random.
> > > 
> > > I already wrote a patch to get rid of the restriction. The code is not too
> > > bad
> > > (we only need an extra indirection). But I haven't sent it yet because it
> > > is
> > > less critical with the re-shuffling of the memory layout.
> > 
> > Interesting! I am curious: how did you manage to do it?
> 
> When the identity mapping is clashing with Xen runtime address, I am creating
> a temporary mapping for Xen at a different fixed address.
> 
> Once the MMU is turned on, we can jump to the temporary mapping. After that we
> are safe to remove the identity mapping and create the runtime Xen mapping.
> The last step is to jump on the runtime mapping and then remove the temporary
> mapping.

Cool! I was guessing something along those lines.


