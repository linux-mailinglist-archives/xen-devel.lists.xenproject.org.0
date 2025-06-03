Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8113DACCCCB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 20:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004769.1384471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMWGO-0002Vw-3m; Tue, 03 Jun 2025 18:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004769.1384471; Tue, 03 Jun 2025 18:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMWGO-0002TD-0q; Tue, 03 Jun 2025 18:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1004769;
 Tue, 03 Jun 2025 18:21:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D1uS=YS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMWGM-0002T7-K9
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 18:21:26 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e33b9dc-40a7-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 20:21:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4731161129;
 Tue,  3 Jun 2025 18:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF20C4CEF2;
 Tue,  3 Jun 2025 18:21:21 +0000 (UTC)
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
X-Inumbo-ID: 8e33b9dc-40a7-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748974883;
	bh=a2w6lkekBlhpt9rgrFUNnuxqvuKrr/zY0TaVVm9GB8g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NkEq6okHcd3Owb+/GYt6ghnt3eMZewbW0HR6UZfp5vKQ3mW5b2zwKsrHB9x/ccZzP
	 9fRDQs0mnS7zB0c+IpQn+VzU/Va6VS3PqrMHrD07ZkcvSo6NGkmITbBYr4+csYH+Jy
	 zjK4JXa8DGm9AFvXOyaKz2/BBMz661oEu2W3KSm6A+U8XKDQEqazGJcqJjvpJpSBMG
	 H40zakLMsd7otalZGwnA61Sr8o3Q431GNY6Ib78GwGmyvb0UEUUg08VL2MXl37MpeP
	 7H04VPzVqPphEQNe15r51Uez9edFbnqRgHZYWwKQ9KVtUootMnK/mEB9r/mAqCpbB1
	 +syZgFqfkVRDg==
Date: Tue, 3 Jun 2025 11:21:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/9] CI: Add SELECTED_JOBS_ONLY to analyze.yaml
In-Reply-To: <66c1a541-c6b2-4bf5-b1a7-9fb9ae19b4a0@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2506031121120.1147082@ubuntu-linux-20-04-desktop>
References: <20250603124222.52057-1-anthony@xenproject.org> <20250603124222.52057-2-anthony@xenproject.org> <66c1a541-c6b2-4bf5-b1a7-9fb9ae19b4a0@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Jun 2025, Andrew Cooper wrote:
> On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

