Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413C9508C40
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309457.525732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhCML-00033G-2M; Wed, 20 Apr 2022 15:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309457.525732; Wed, 20 Apr 2022 15:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhCMK-0002zx-Us; Wed, 20 Apr 2022 15:35:12 +0000
Received: by outflank-mailman (input) for mailman id 309457;
 Wed, 20 Apr 2022 15:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Avzr=U6=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1nhCMJ-0002es-An
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:35:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76965a4c-c0bf-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 17:35:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A83F5B81EB2;
 Wed, 20 Apr 2022 15:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02272C385A0;
 Wed, 20 Apr 2022 15:35:07 +0000 (UTC)
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
X-Inumbo-ID: 76965a4c-c0bf-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650468908;
	bh=0TvdShlIkCt6RpyVO2I0TcefFwjvh8bV2p1H8fkiRCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DfCCWMrlvQ7r8C8oCO+V3OEkoZT+yCc1nyQ/di1itJ78t/ql3ehtDekGvZnIC0f0s
	 mV/030tbzJqg8eEmHPd/KpRzen1MTbg1uyRkd+cL6e1wy8uH2SYMBFGn1nzEQ7xjOp
	 VdzA+wfCOZ2exyOVSfQKaFYjz8Ke5y9C1NoSVn+Y=
Date: Wed, 20 Apr 2022 17:35:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/18] xen/usbfront: use xenbus_setup_ring() and
 xenbus_teardown_ring()
Message-ID: <YmAoKaw2Xe39oWm+@kroah.com>
References: <20220420150942.31235-1-jgross@suse.com>
 <20220420150942.31235-17-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420150942.31235-17-jgross@suse.com>

On Wed, Apr 20, 2022 at 05:09:40PM +0200, Juergen Gross wrote:
> Simplify xen-hcd's ring creation and removal via xenbus_setup_ring()
> and xenbus_teardown_ring().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/usb/host/xen-hcd.c | 55 +++++++++-----------------------------
>  1 file changed, 13 insertions(+), 42 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

