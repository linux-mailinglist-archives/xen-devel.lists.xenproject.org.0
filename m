Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188E45764BA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 17:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368323.599543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCNWl-000738-I2; Fri, 15 Jul 2022 15:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368323.599543; Fri, 15 Jul 2022 15:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCNWl-00070L-FE; Fri, 15 Jul 2022 15:46:51 +0000
Received: by outflank-mailman (input) for mailman id 368323;
 Fri, 15 Jul 2022 15:46:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tST6=XU=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oCNWj-00070F-Pb
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 15:46:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55a08c82-0455-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 17:46:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9B94620A3;
 Fri, 15 Jul 2022 15:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BE5C34115;
 Fri, 15 Jul 2022 15:46:45 +0000 (UTC)
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
X-Inumbo-ID: 55a08c82-0455-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657900006;
	bh=1pP6wpTZR6yxJttIfhQ8GaI8CR+vOrFTZHxcwN15uk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nTS1MBom8JQTTyxEVLiCJsH0hjcLXRd+KWRW8j3+FwNB94NtVwxVS2b96USqC+sj4
	 X/y9CH5O8YMTLBPq2aLd6pHgYwMMkzcQE8XH7EE5DFEuPgy48tsQv1wK1nuHVA8sjv
	 d9LxY2RmBRhHoOoqQHLHJmdKo67NuGc+5QL5hrDXhUzcvX1aesCIXJLRFKlGsLsT+U
	 rvJ9XJYf3yOkXRvfjwP0iY+hRoZsNgrRJ1SbPWaq5DYVaa4NkP9SzzfADd2GOYlAmX
	 BGuzgB7BqNF8zrOFWIG+/Hiit3qJ6zHtel3LuLoAF7S4p7KhMQcV/CU9YTJSlfi0if
	 u/t2DHgvbMY0g==
From: SeongJae Park <sj@kernel.org>
To: Andrii Chepurnyi <andrii.chepurnyi82@gmail.com>
Cc: Oleksandr <olekstysh@gmail.com>,
	SeongJae Park <sj@kernel.org>,
	roger.pau@citrix.com,
	jgross@suse.com,
	axboe@kernel.dk,
	boris.ostrovsky@oracle.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] xen-blkback: fix persistent grants negotiation
Date: Fri, 15 Jul 2022 15:46:43 +0000
Message-Id: <20220715154643.54334-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAJwUmVB6H3iTs-C+U=v-pwJB7-_ZRHPxHzKRJZ22xEPW7z8a=g@mail.gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,


Oleksandr, thank you for Cc-ing Andrii.  Andrii, thank you for the comment!

On Fri, 15 Jul 2022 15:00:10 +0300 Andrii Chepurnyi <andrii.chepurnyi82@gmail.com> wrote:

> [-- Attachment #1: Type: text/plain, Size: 5237 bytes --]
> 
> Hello All,
> 
> I faced the mentioned issue recently and just to bring more context here is
> our setup:
> We use pvblock backend for Android guest. It starts using u-boot with
> pvblock support(which frontend doesn't support the persistent grants
> feature), later it loads and starts the Linux kernel(which frontend
> supports the persistent grants feature). So in total, we have sequent two
> different frontends reconnection, the first of which doesn't support
> persistent grants.
> So the original patch [1] perfectly solves the original issue and provides
> the ability to use persistent grants after the reconnection when Linux
> frontend which supports persistent grants comes into play.
> At the same time [2] will disable the persistent grants feature for the
> first and second frontend.

Thank you for this great explanation of your situation.

> Is it possible to keep [1]  as is?

Yes, my concerns about Max's original patch[1] are conflicting behavior
description in the document[1] and different behavior on blkfront-side
'feature_persistent' parameter.  I will post Max's patch again with patches for
blkfront behavior change and Documents updates.

[1] https://lore.kernel.org/xen-devel/20220121102309.27802-1-sj@kernel.org/


Thanks,
SJ

> 
> [1]
> https://lore.kernel.org/xen-devel/20220106091013.126076-1-mheyne@amazon.de/
> [2] https://lore.kernel.org/xen-devel/20220714224410.51147-1-sj@kernel.org/
> 
> Best regards,
> Andrii
> 
> On Fri, Jul 15, 2022 at 1:15 PM Oleksandr <olekstysh@gmail.com> wrote:
> 
> >
> > On 15.07.22 01:44, SeongJae Park wrote:
> >
> >
> > Hello all.
> >
> > Adding Andrii Chepurnyi to CC who have played with the use-case which
> > required reconnect recently and faced some issues with
> > feature_persistent handling.
[...]

