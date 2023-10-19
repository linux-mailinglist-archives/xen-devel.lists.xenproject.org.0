Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8B7D02AE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 21:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619566.964852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtYvo-0007dR-0u; Thu, 19 Oct 2023 19:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619566.964852; Thu, 19 Oct 2023 19:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtYvn-0007bR-UB; Thu, 19 Oct 2023 19:43:43 +0000
Received: by outflank-mailman (input) for mailman id 619566;
 Thu, 19 Oct 2023 19:43:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtYvm-0007bL-Gr
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 19:43:42 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccc21940-6eb7-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 21:43:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0AC0CE315B;
 Thu, 19 Oct 2023 19:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCB8C433CB;
 Thu, 19 Oct 2023 19:43:33 +0000 (UTC)
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
X-Inumbo-ID: ccc21940-6eb7-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697744614;
	bh=+qamTx3Q3cmywi/l9y++MqbR2GYmqwvrbi9+l5lFaBM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RlixDy9v4BI+WNqhYGyqMoUnG4SVyS3Anx4UdVXMp8NIxssRuAT/1ZjEmOSBiuaZ5
	 VphwctMuKtxmJFW8vIXwr9VMfJgKN9HdeebSYUPPZNfy5XNVhSDszjIbL/HZiHvtkx
	 rlRxmNZJ7igI8pICkJ6V7k2G6H2GzXlPKtobm4MK3PlKWsRflnyyddNmuRj9m2f2zD
	 2SmjS6WWTLaPefnvu2cAycv4kWAuM4n4iJJRRkiahxq8UzT9nUZo4w+pWWfxw/mGx5
	 vAkNjvkpkInUKf1CB1jwVDGaZGMt9TCpt8ah9gCp9xbN4F7/wBtt6YZaPCv15Ubilq
	 xqVizpntUmfFw==
Date: Thu, 19 Oct 2023 12:43:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.18] CI: (More) Always pull base image when building
 a container
In-Reply-To: <f8cb1c63-b634-4bd2-9bce-54d2e3e6dbe3@perard>
Message-ID: <alpine.DEB.2.22.394.2310191243260.2099202@ubuntu-linux-20-04-desktop>
References: <20231019171452.1704276-1-andrew.cooper3@citrix.com> <f8cb1c63-b634-4bd2-9bce-54d2e3e6dbe3@perard>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Oct 2023, Anthony PERARD wrote:
> On Thu, Oct 19, 2023 at 06:14:52PM +0100, Andrew Cooper wrote:
> > Repeat c/s 26ecc08b98fc ("automation: Always pull base image when building a
> > container") for the other makefile we've got building containers.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > 
> > For 4.18.  This is CI infrastructure, not part of the regular build.
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

