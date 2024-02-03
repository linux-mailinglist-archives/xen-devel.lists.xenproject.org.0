Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5F98488F2
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 22:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675458.1050874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWNUN-000498-QD; Sat, 03 Feb 2024 21:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675458.1050874; Sat, 03 Feb 2024 21:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWNUN-00047J-Mt; Sat, 03 Feb 2024 21:23:51 +0000
Received: by outflank-mailman (input) for mailman id 675458;
 Sat, 03 Feb 2024 21:23:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DGSX=JM=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1rWNUL-00047C-LF
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2024 21:23:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82bb4c86-c2da-11ee-98f5-efadbce2ee36;
 Sat, 03 Feb 2024 22:23:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E44B60BDE;
 Sat,  3 Feb 2024 21:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0292C433C7;
 Sat,  3 Feb 2024 21:23:43 +0000 (UTC)
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
X-Inumbo-ID: 82bb4c86-c2da-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706995424;
	bh=2cUK20HpkF3Qs4l/910Mfk2HuHRlZed/HuN6ZaSpsas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0zT/dmAGOhDbo3w43Gct1tLu57+LlgLX3XUWVqC6PWSzPvrxVSZHuEL2aVbj6HY7R
	 Gk2B6RlHxh9fIyJKccTMvL/ATtanY+uTuyVh4MHCMLcVAdrCAwNth3otAnQlgM7R/Z
	 odVM+yiI8gwrS2cguP889Ixo+vlsXtfRO1/D/uBQ=
Date: Sat, 3 Feb 2024 13:23:43 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drivers: xen: struct bus_type cleanup
Message-ID: <2024020333-unwatched-provolone-dc3c@gregkh>
References: <20240203-bus_cleanup-xen-v1-0-c2f5fe89ed95@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240203-bus_cleanup-xen-v1-0-c2f5fe89ed95@marliere.net>

On Sat, Feb 03, 2024 at 03:53:36PM -0300, Ricardo B. Marliere wrote:
> This series is part of an effort to cleanup the users of the driver
> core, as can be seen in many recent patches authored by Greg across the
> tree (e.g. [1]). Specifically, this series is part of the task of
> splitting one of his TODOs [2].
> 
> ---
> [1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=bus_cleanup&id=26105f537f0c60eacfeb430abd2e05d7ddcdd8aa
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

