Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E72CE510CC4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 01:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314241.532208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njUkk-0002pV-1R; Tue, 26 Apr 2022 23:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314241.532208; Tue, 26 Apr 2022 23:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njUkj-0002me-TB; Tue, 26 Apr 2022 23:37:53 +0000
Received: by outflank-mailman (input) for mailman id 314241;
 Tue, 26 Apr 2022 23:37:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1njUki-0002mD-G0
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 23:37:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2c01ce3-c5b9-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 01:37:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07DEFB8239F;
 Tue, 26 Apr 2022 23:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3803FC385A0;
 Tue, 26 Apr 2022 23:37:48 +0000 (UTC)
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
X-Inumbo-ID: e2c01ce3-c5b9-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651016268;
	bh=YE9YLQzw9ENo9x7H0w3OgmMdjFjl9v8cSbC2PgqSlCk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OX+a6NR9mzlXjwCyN8c8yla5kNPzkSYu5EogDzLExI+1ubQNO4VZqf40PRiAswlAz
	 th1V7+UtCbqvlKJJdZc1ydBkZf5k/qAc8q67jCYep7Jv1JgEyUryWTYzC4PoseBtRk
	 33LGNnu2rFwJ06I1Xm09Z3+BdThfzc77VM/EJvIluB3Q6A2/vjJX2q6PQGrEEjayq+
	 /fVYxPEmfI7bh3TdnJMaUWG3Z/BeP2whkVhzDRhqtYrT4b50Mcmq2T9GPI6smCAxrK
	 Yk6ZakKseFp8/goDjLHB9EEiZ/UAVZHsFNEzgi+IuWYhRt/mSuXrftfahuO0NqhQef
	 7uXXwLTo9++7w==
Date: Tue, 26 Apr 2022 16:37:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
cc: David Vrabel <dvrabel@cantab.net>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, George Dunlap <George.Dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    David Vrabel <dvrabel@amazon.co.uk>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap
 alloc/free
In-Reply-To: <cd228d72-59ab-087e-92f8-c056a1478e15@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2204261635490.915916@ubuntu-linux-20-04-desktop>
References: <20220425132801.1076759-1-dvrabel@cantab.net> <f5a45b8e-644d-15aa-951f-aa6d89ce4c5b@suse.com> <ecb4876e-c6d4-4bff-d964-92af83d39dff@xen.org> <0b7c4df3-e6f2-7791-4e8e-9655eb8c6f6f@cantab.net> <cd228d72-59ab-087e-92f8-c056a1478e15@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1498627440-1651016269=:915916"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1498627440-1651016269=:915916
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 26 Apr 2022, Andrew Cooper wrote:
> > Can my (personal) GitLab be added as a Developer to the Xen Project
> > group? I think this is the intended way for people to run the CI
> > pipelines on their own branches.
> 
> It is.  Username?

David, let us know if you have any issues with gitlab. Once added, you
should be able to trigger gitlab-ci runs, which include 3 ARM runtime
tests dom0 and dom0less. You should be able to see the failures with
your original patch and the failure being fixed with Julien's patch.
--8323329-1498627440-1651016269=:915916--

