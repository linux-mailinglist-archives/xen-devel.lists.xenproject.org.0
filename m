Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEB97D761E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 22:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623302.971047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvkw6-0001xQ-Ba; Wed, 25 Oct 2023 20:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623302.971047; Wed, 25 Oct 2023 20:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvkw6-0001vO-8t; Wed, 25 Oct 2023 20:57:06 +0000
Received: by outflank-mailman (input) for mailman id 623302;
 Wed, 25 Oct 2023 20:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NE+=GH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvkw4-0001uA-U1
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 20:57:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b8a92b8-7379-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 22:57:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0BC2F62359;
 Wed, 25 Oct 2023 20:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A03C433C9;
 Wed, 25 Oct 2023 20:56:59 +0000 (UTC)
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
X-Inumbo-ID: 0b8a92b8-7379-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698267420;
	bh=lhUJfRSR6+tv+A1Myf0He+l1zu+AQD84/V1buK1mlhM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZnsgA4vGWPqBR68knsBp8zmjl3/dVW1bq4aquDyW2wV9eiisuUsKRxz9GCsYy/3Ss
	 A7KXkckT2G0uR8v5p0I+3lgPDM5x0fL+KvGO9v1qLI8+L5kIiGTnwJtRM9HDBFZOUH
	 SCeVtRhQOTdx7wJZQnni6jSLoIAnw9Cyz4lA6wmU1FZKqmhLsnunNr18/Gi1aH6vEY
	 16RYB8TxLplnkiA6ellhyniiUHfuRy8FFILJuL17tbr7Uula4puTOT8lDOckFeAsE2
	 asxtZ+nOQEBGitYmabxowAGSIxNXQ0SMFbEXb7tnPQ1xfZ6OYRRoTV+UC2TuvwlMzC
	 /amg1FzZc7b9w==
Date: Wed, 25 Oct 2023 13:56:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <Michal.Orzel@amd.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Generalise the usage of exclude-list.json
In-Reply-To: <aa78ac18-b127-da92-bb04-6cbdaded3bef@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310251356480.271731@ubuntu-linux-20-04-desktop>
References: <5883E219-2C0C-4809-852B-704C6ED0E736@arm.com> <aa78ac18-b127-da92-bb04-6cbdaded3bef@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1474863570-1698267420=:271731"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1474863570-1698267420=:271731
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 25 Oct 2023, Jan Beulich wrote:
> On 25.10.2023 10:35, Luca Fancellu wrote:
> > I’m sending this mail looking for feedbacks about generalising the exclude-list.json, as suggested (IIRC) by Jan
> > this list can be used by multiple users and not only for MISRA, by adding a field to every entry.
> > 
> > These are the modifications I would like to do to the list, I will implement them if we reach an agreement.
> 
> Looks okay to me, thanks. Just one comment on wording:

Looks okay to me too
--8323329-1474863570-1698267420=:271731--

