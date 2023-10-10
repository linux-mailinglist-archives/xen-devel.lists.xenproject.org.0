Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5C87C43F7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 00:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615171.956414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqLBY-0002Va-8X; Tue, 10 Oct 2023 22:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615171.956414; Tue, 10 Oct 2023 22:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqLBY-0002Tt-50; Tue, 10 Oct 2023 22:26:40 +0000
Received: by outflank-mailman (input) for mailman id 615171;
 Tue, 10 Oct 2023 22:26:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XImq=FY=infradead.org=mcgrof@srs-se1.protection.inumbo.net>)
 id 1qqLBV-0002TV-U4
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 22:26:38 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 124ef577-67bc-11ee-98d3-6d05b1d4d9a1;
 Wed, 11 Oct 2023 00:26:36 +0200 (CEST)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1qqLAv-00EFvQ-2z; Tue, 10 Oct 2023 22:26:01 +0000
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
X-Inumbo-ID: 124ef577-67bc-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Jt7zMqKrLNJ4K7VS3w7XNGV+SpqUurU0PXBkkxalgKc=; b=1PL/j3Yl0CuSo7Wvorcy1SBbas
	I+6DqkyUbYtUIZ9pkGSDQa8ByQS3UkqTwbfjdaotfSES7NdqYqgxx29fk4+tzLW3FRROafO4ZtsvZ
	l+W8U6dorpda5yasc9Kqeau3Zz3sh/qCL49nsyxtkbllVRGWd6OzS9TccFLxGNwC4uVawQz8L4W7d
	AcCH9bEiJX5jVmwx9rhI9AetmVYQ337XpotHrDcgLYa0oedh5OhdR8LhKPPVwrBxYyGTxqsN2NJUq
	t3JisqYnKbp3RUciBZn8l5IbE1O6D3K7GhlblXGtYAWbn3INUlqHRA26oYGxooXJSmeyHUHhjfGWo
	wvcm+phA==;
Date: Tue, 10 Oct 2023 15:26:01 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: j.granados@samsung.com
Cc: willy@infradead.org, josh@joshtriplett.org,
	Kees Cook <keescook@chromium.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Doug Gilbert <dgilbert@interlog.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Corey Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Robin Holt <robinmholt@gmail.com>, Steve Wahl <steve.wahl@hpe.com>,
	Russ Weight <russell.h.weight@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Song Liu <song@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-serial@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 00/15] sysctl: Remove sentinel elements from drivers
Message-ID: <ZSXPeVDv6FfKiTp5@bombadil.infradead.org>
References: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Mon, Oct 02, 2023 at 10:55:17AM +0200, Joel Granados via B4 Relay wrote:
> Changes in v2:
> - Left the dangling comma in the ctl_table arrays.
> - Link to v1: https://lore.kernel.org/r/20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com

Thanks! Pushed onto sysctl-next for wider testing.

  Luis

