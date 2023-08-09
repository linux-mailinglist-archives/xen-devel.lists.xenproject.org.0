Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA61776971
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581300.909923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpQS-0000Kw-Ot; Wed, 09 Aug 2023 20:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581300.909923; Wed, 09 Aug 2023 20:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpQS-0000IS-MA; Wed, 09 Aug 2023 20:05:00 +0000
Received: by outflank-mailman (input) for mailman id 581300;
 Wed, 09 Aug 2023 20:04:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTpQR-00009o-Lj
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:04:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03ddfbb9-36f0-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 22:04:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7AD1647E7;
 Wed,  9 Aug 2023 20:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861B4C433C8;
 Wed,  9 Aug 2023 20:04:55 +0000 (UTC)
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
X-Inumbo-ID: 03ddfbb9-36f0-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691611497;
	bh=OlA84lxKgd9t+5y59oDJoB/kbiieGIrCsjl/EpEXR5c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P17sIxGZBrYK2FTKrCRgiHKf7D1szRcGQF/gnPtgA4mYMUjOw5H4wCtyHMcPoBPWP
	 JMs1AgyC+pVtANDeW8DppfwmH+m8DFWbmqlDR7W6k74Uew0PkQ2XBPGUUnSG4As7BM
	 H6FpNhzywMz/KN+3EI7jFL8EaGd9LHJIPUguaSPEmtzW/exRyvDLBnfW9/Hlyc5RaN
	 0fq0dgYx+6JozpkHWCeC/6y94J/8fZzcD2YctksIKA3lGUewwwGw/g1DQ7XTqPqFNI
	 fmHblEAYR5Pse02brwThki+MBq8AjTvYyPi/HJoeAx9QcydRZ0fTOe0vyfqHNk0IoM
	 wnTMSAQKeStVQ==
Date: Wed, 9 Aug 2023 13:04:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, 
    "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 2/8] xen/memory: address MISRA C:2012 Rule 8.4
In-Reply-To: <2AD1EA83-AE7F-485C-ABFA-D285B4BAB1CC@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308091304410.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com> <844e7bf57c2eb7b20d8b1f81a7730a7612f1b6ac.1691575243.git.nicola.vetrini@bugseng.com> <2AD1EA83-AE7F-485C-ABFA-D285B4BAB1CC@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-51032565-1691611497=:2127516"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-51032565-1691611497=:2127516
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 9 Aug 2023, Luca Fancellu wrote:
> > On 9 Aug 2023, at 12:02, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
> > 
> > The function 'ioreq_server_max_frames' can be defined static,
> > as its only uses are within the same file. This in turn avoids
> > violating Rule 8.4 because no declaration is present.
> > 
> > No functional change.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Makes sense,
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> Maybe it’s also better adding this:
> Fixes: 9244528955de ("xen/memory: Fix acquire_resource size semantics”)
> 
> If the maintainers agree

Yes
--8323329-51032565-1691611497=:2127516--

