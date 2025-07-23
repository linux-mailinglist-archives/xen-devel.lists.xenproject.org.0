Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A046FB0E7B5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 02:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053189.1421954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueNiS-00040O-NU; Wed, 23 Jul 2025 00:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053189.1421954; Wed, 23 Jul 2025 00:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueNiS-0003yw-Kl; Wed, 23 Jul 2025 00:52:16 +0000
Received: by outflank-mailman (input) for mailman id 1053189;
 Wed, 23 Jul 2025 00:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KKGU=2E=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueNiR-0003yq-MX
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 00:52:15 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44b81cfe-675f-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 02:52:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8CF15A56513;
 Wed, 23 Jul 2025 00:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECF6C4CEF7;
 Wed, 23 Jul 2025 00:52:09 +0000 (UTC)
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
X-Inumbo-ID: 44b81cfe-675f-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753231931;
	bh=Ikgm9Jx/57fTWv9UzWPZPHP4VN/TE99csv48a9iYnFQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZhYKwf4WrzuTES8O5PDzpbbVThtGgOLw0+f9U9OrS0Fj45cqXhIGzSYADoWGgXNK3
	 ANCgApOj+Gm9YkhKofGq7swvDYYfZovvSQeDPMMXF5NYbsdiNSgA9FRba9Ya9dGwvU
	 iMwxxIYdsA1Vnq8hZmoojSPqrNxvuCi4FuT2pWABSCHKS1dCTSqZRzfEy5+FxKuHk/
	 P9qtezmhy3oLW84fi2HfcWh+6Lm0MFXBLr3UT4NeksAvBcEUWfF5aKskMFy6AxwVtt
	 NFUlehLa9JVEnfoVIjd3ljIqbg5YjkxeUoCANt2k973OBm66IMfwuhyGlE9MDzNLn7
	 cys/Mh2OqzFOg==
Date: Tue, 22 Jul 2025 17:52:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
In-Reply-To: <20250722001958.174294-2-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507221752010.7043@ubuntu-linux-20-04-desktop>
References: <20250722001958.174294-1-jason.andryuk@amd.com> <20250722001958.174294-2-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Jul 2025, Jason Andryuk wrote:
> Expose a domain's capabilities - control, hardware or xenstore - through
> stable get domain state hypercall.
> 
> The xenstore domain can use this information to assign appropriate
> permissions on connections.
> 
> Repurpose the 16bit pad field for this purpose.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


