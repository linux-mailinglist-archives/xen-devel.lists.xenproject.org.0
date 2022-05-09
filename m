Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59135205F9
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 22:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324802.547029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noA6P-0008Re-FJ; Mon, 09 May 2022 20:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324802.547029; Mon, 09 May 2022 20:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noA6P-0008Pq-CY; Mon, 09 May 2022 20:35:33 +0000
Received: by outflank-mailman (input) for mailman id 324802;
 Mon, 09 May 2022 20:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6vu7=VR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1noA6N-0008Pk-Od
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 20:35:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90a6cbc6-cfd7-11ec-a406-831a346695d4;
 Mon, 09 May 2022 22:35:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD758616EB;
 Mon,  9 May 2022 20:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F63AC385BA;
 Mon,  9 May 2022 20:35:27 +0000 (UTC)
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
X-Inumbo-ID: 90a6cbc6-cfd7-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652128528;
	bh=JCyEzhSs3fnamCMlMIPypnKlHjQavh2tngborH1qRgM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=U/WOUBKvKbEQNou1Mkn5jl6u6yvfq2mTfppnqrU893UsQADjdb3fKsZshufBgd1Xx
	 3VBJXr4IFRWnUhQMSzARifhcT3coIPKRlcJcKMRnwUTtX/XCYNyBA2OWBJd6Q47SLO
	 JKuFuDR32hMYnkfv6aGpvMsZhKQT7Q/hPix1HhYsoD7w3uWhUBOqxhKQSGpnY+V8KP
	 o8Nmr1+YMikqLrEOyYxdtjMIrayTa2Gqz11zsbnTxgTTA/2MlIQOEDOrqNu57ifHkX
	 K6g2xcp0d4SEMJAMp9P639Sz8ct4U6S6uscr3nKtFHimyj6dncSyUiZJMjTOwLUcHC
	 JZQE58/efcnkA==
Date: Mon, 9 May 2022 13:35:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 0/7] Boot time cpupools
In-Reply-To: <20220506120012.32326-1-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205091334290.43560@ubuntu-linux-20-04-desktop>
References: <20220506120012.32326-1-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 May 2022, Luca Fancellu wrote:
> *** Resending the serie adding the maintainers ***
> *** Patches #4 and #6 needs a review from the maintainer of that area ***

Committed, thanks!

