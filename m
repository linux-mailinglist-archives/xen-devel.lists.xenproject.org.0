Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8A7313B61
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 18:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83000.153637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9AeM-0004aJ-Ax; Mon, 08 Feb 2021 17:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83000.153637; Mon, 08 Feb 2021 17:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9AeM-0004Zx-7R; Mon, 08 Feb 2021 17:48:38 +0000
Received: by outflank-mailman (input) for mailman id 83000;
 Mon, 08 Feb 2021 17:48:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9AeK-0004Zr-Q7
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:48:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9AeK-0000y9-OT
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:48:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9AeK-0000bz-Mr
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:48:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9AeH-00039j-H7; Mon, 08 Feb 2021 17:48:33 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=gi2DaL39nSETXfcihFpkI2eRsVfIa+o38yQUx/utY6g=; b=UIHX6qBzDXFnkLhmKQE5TnmmYJ
	ReIPN+yGno4OByLYgG4GvvJjvXdmKHvyptvWefPR53RGGmW4rcegczmuLgdP6a0eOF+v2CuuObuc5
	mmv+bo+3vxSMsb/iSM81JTRQ4HwTDAZoV1Z0xI02KYb0KiF9CJz1C/7HSoMbBgfMpH6c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.31087.818313.780529@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 17:48:31 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210111 05/39] tools: add with-xen-scriptdir configure
 option
In-Reply-To: <20210208182311.53dac1a3.olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-6-olaf@aepfle.de>
	<24609.24785.791060.128298@mariner.uk.xensource.com>
	<20210208182311.53dac1a3.olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("Re: [PATCH v20210111 05/39] tools: add with-xen-scriptdir configure option"):
> The reason is the ordering of assignments in the file:
> AC_ARG_WITH comes early in the file, XEN_CONFIG_DIR= is assigned much later.

Ah.

> It seems the assignments for CONFIG_DIR and XEN_CONFIG_DIR can be moved up, because $sysconfdir is expected to be set already. As a result the new AC_ARG_WITH= can continue to use "$XEN_CONFIG_DIR/scripts" for the default case.

That would be best I think.

> I assume the current ordering is to have a separate AC_ARG_WITH and AC_SUBST section.

I could be wrong, but I don't think the location of AC_SUBST matters.

Ian.

