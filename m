Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA1BA9515
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 15:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132893.1471110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3DoR-0006MX-IM; Mon, 29 Sep 2025 13:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132893.1471110; Mon, 29 Sep 2025 13:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3DoR-0006Jo-Fh; Mon, 29 Sep 2025 13:21:07 +0000
Received: by outflank-mailman (input) for mailman id 1132893;
 Mon, 29 Sep 2025 13:21:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1v3DoR-0006Ji-1A
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 13:21:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3DoQ-00GYq3-0R;
 Mon, 29 Sep 2025 13:21:06 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3DoQ-004RhK-0H;
 Mon, 29 Sep 2025 13:21:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=sNHZjtNfG2q8oc5l8nFvNB4eU1aaQOodtx2TEvCMTaU=; b=c702pkLnawxSLysLiZBgVUyDTY
	+RAiwJdL0VFsKls4PQoDycU/XHBVBvhWDzG19VtASMUNGqQykVQew9PEBrPTBOBDCdA74I18+SlDB
	iWNmtqDlZmNOq4s5VuItSCzgBOJbERTKMUcNG2F4gsxjRhfx4uW5eP6X9XVE7KkN7i9A=;
Date: Mon, 29 Sep 2025 15:21:04 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2 0/3] xenconsole: Add connection flag
Message-ID: <aNqHwGSihJfigmXC@l14>
References: <20250822213946.245307-1-jason.andryuk@amd.com>
 <e5382a07-7044-4999-9232-07dcf677fb97@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5382a07-7044-4999-9232-07dcf677fb97@suse.com>

On Tue, Sep 09, 2025 at 12:18:26PM +0200, Jürgen Groß wrote:
> On 22.08.25 23:39, Jason Andryuk wrote:
> > Add a connection flag to the console interface page so a domain can tell
> > if it is connected or not.  This became a series in v2 to add flag
> > setting to libxenguest.
> > 
> > Jason Andryuk (3):
> >    xenconsole: Add connection flag
> >    libs/guest: Set console page to disconnected
> >    libs/guest: Set console as disconnected on resume
> > 
> >   tools/console/daemon/io.c                |  4 +++
> >   tools/include/xenguest.h                 |  4 +++
> >   tools/libs/guest/xg_dom_arm.c            |  2 +-
> >   tools/libs/guest/xg_dom_boot.c           | 36 ++++++++++++++++++++++++
> >   tools/libs/guest/xg_dom_x86.c            |  6 ++--
> >   tools/libs/guest/xg_sr_restore_x86_hvm.c |  2 +-
> >   tools/libs/guest/xg_sr_restore_x86_pv.c  |  1 +
> >   xen/include/public/io/console.h          | 13 +++++++++
> >   8 files changed, 63 insertions(+), 5 deletions(-)
> > 
> 
> For the series:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

For the series:
Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Hi Oleksii,
I think this series needs your "release-ack" tag.

Thanks,

-- 
Anthony PERARD

