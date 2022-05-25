Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E453345B
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 02:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336793.561211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntezO-0001QC-DR; Wed, 25 May 2022 00:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336793.561211; Wed, 25 May 2022 00:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntezO-0001NK-8S; Wed, 25 May 2022 00:35:02 +0000
Received: by outflank-mailman (input) for mailman id 336793;
 Wed, 25 May 2022 00:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIJu=WB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ntezM-0001N9-7z
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 00:35:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8071f897-dbc2-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 02:34:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FF5A615B1;
 Wed, 25 May 2022 00:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0238CC34100;
 Wed, 25 May 2022 00:34:54 +0000 (UTC)
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
X-Inumbo-ID: 8071f897-dbc2-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653438895;
	bh=z6rZJmg35HTbcLY6xC8GV/XUKS+KBk9uUWKRQMRZZoU=;
	h=Date:From:To:cc:Subject:From;
	b=k3AEw6UojlF+K/aq3V079hAIDieSNXTyOcxC0ycuCTDSLGGVSYhvcXPEP+f2yqNMP
	 +tl8IT7+9nrf5zhUbWPlLQXP/SEBdR3phdwxPUFferIX6uT98cfkJVC6qVVdz7bUJP
	 /T5k01u589lgUdcaAMdq3xpDMlHxqf6B+J+XEm81Axe3nitQZYh8gCFduA13kGUpvO
	 nd6p2fHMhY2z0ll53sXK0pKe/SUMN4ZaNGOT8NLVWOfHaQXKtNWonyPJozfYZUo4uA
	 OCMdC+YgUj41ErTt2D53xk8wgfZFq+CTMCKDUYPO2qaft7kNOFTTCgXe9UZ1T88eV6
	 kHvfdSiR+3yjA==
Date: Tue, 24 May 2022 17:34:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, jbeulich@suse.com, 
    roger.pau@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com, 
    George.Dunlap@citrix.com
Subject: [PATCH 0/2] introduce docs/misra/rules.rst
Message-ID: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This patch series is a follow-up from the MISRA C meeting last Thursday,
when we went through the list of MISRA C rules on the spreadsheet and
agreed to accept into the Xen coding style the first ones, starting from
Dir 2.1 up until Rule 5.1 (except for Rule 2.2) in descending popularity
order.

This is the full list of accepted rules so far:

Dir 2.1
Dir 4.7
Dir 4.10
Dir 4.14
Rule 1.3
Rule 3.2
Rule 5.1
Rule 6.2
Rule 8.1
Rule 8.4
Rule 8.5
Rule 8.6
Rule 8.8
Rule 8.12

This short patch series add them as a new document under docs/misra as a
list in rst format. The file can be used as input to cppcheck using a
small python script from Bertrand (who will send it to the xen-devel
separately.)

Cheers,

Stefano

