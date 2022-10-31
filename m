Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4A161312D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 08:24:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432678.685346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opP99-0004OA-F2; Mon, 31 Oct 2022 07:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432678.685346; Mon, 31 Oct 2022 07:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opP99-0004LZ-Bv; Mon, 31 Oct 2022 07:23:47 +0000
Received: by outflank-mailman (input) for mailman id 432678;
 Mon, 31 Oct 2022 07:23:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eVFZ=3A=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1opP97-0004LT-Cx
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 07:23:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c7ae62-58ec-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 08:23:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FA5160FF8;
 Mon, 31 Oct 2022 07:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D9FC433D6;
 Mon, 31 Oct 2022 07:23:39 +0000 (UTC)
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
X-Inumbo-ID: f1c7ae62-58ec-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667201019;
	bh=Io6zd5E1x1tJ/A9M6wscatLJ3A4vcR7XMXt55LhYVlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rxgrY6l/YrO7UgwPm7uvOk1I0IqGWoWy8vQIiIZi+nKCmQAtC3eoqTg6LzFy8hDS/
	 L7t+Up37mXudXsWdX754npknNRx52BSV1gk5OQzmU+EhYBPsinXNpCnIblFjbb3fmF
	 XEitYEI81AgR4/bWn11D7ZU99wB56rj0oIRvhhGA=
Date: Mon, 31 Oct 2022 08:24:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Sasha Levin <sashal@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	"M. Vefa Bicakci" <m.v.b@runbox.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] xen/gntdev: Accommodate VMA splitting
Message-ID: <Y194M/6GboCwWiZX@kroah.com>
References: <20221030071243.1580-1-demi@invisiblethingslab.com>
 <20221030071243.1580-4-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221030071243.1580-4-demi@invisiblethingslab.com>

On Sun, Oct 30, 2022 at 03:12:43AM -0400, Demi Marie Obenour wrote:
> From: "M. Vefa Bicakci" <m.v.b@runbox.com>
> 
> Prior to this commit, the gntdev driver code did not handle the
> following scenario correctly with paravirtualized (PV) Xen domains:

This is already in 5.10.152, do we need to add it again?

thanks,

greg k-h

