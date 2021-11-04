Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA5445C63
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 23:49:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221930.383869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1milXG-00019p-9b; Thu, 04 Nov 2021 22:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221930.383869; Thu, 04 Nov 2021 22:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1milXG-00016a-5N; Thu, 04 Nov 2021 22:48:42 +0000
Received: by outflank-mailman (input) for mailman id 221930;
 Thu, 04 Nov 2021 22:48:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqP1=PX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1milXF-00016U-FM
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 22:48:41 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5978d6cf-3dc1-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 23:48:39 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CB0D60F36;
 Thu,  4 Nov 2021 22:48:37 +0000 (UTC)
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
X-Inumbo-ID: 5978d6cf-3dc1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636066117;
	bh=P/qJiLsk3+QIAFTv3HSmlpPSXkju1Ch8wH/OgNp5Y00=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IUY5eA9spIIm21FwVJ/H+OGyRZufRuRy72RXrDvzkNIEqPNnm7ILeEdGs+Ve1Sp6u
	 L8i4hUZp6glw/zVDZUyhCWQhh/E7z+YncLHkkfXh5apowsVhl5/cKi1f4fAj5X85ye
	 t5flE7YhVdGaC03/OJBH/Vin/DoaUJSGPlx+m5zWk7UX+wkoCEavxq8RIdRmQo5itx
	 1juLHaFPlr9xiFz/mO7yhyAkJc1dDV1ndtDhb0ntWLZ9WCzMzSppiJTnd5mvp0wP6g
	 3QgA2YzCN05TBoyCVCdPDlNB5aoJUMCvNvs2M0o4T2hek1sWnbgn36WxEwwIwKCkaG
	 gAFMPuEUL/wzA==
Date: Thu, 4 Nov 2021 15:48:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <fnu.vikram@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
Subject: Re: [XEN][PATCH v2 1/1] Update libfdt to v1.6.1
In-Reply-To: <1636006796-360115-2-git-send-email-fnu.vikram@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2111041546030.284830@ubuntu-linux-20-04-desktop>
References: <1636006796-360115-1-git-send-email-fnu.vikram@xilinx.com> <1636006796-360115-2-git-send-email-fnu.vikram@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Nov 2021, Vikram Garhwal wrote:
> Update libfdt to v1.6.1 of libfdt taken from git://github.com/dgibson/dtc.
> This update is done to support device tree overlays.
> 
> A few minor changes are done to make it compatible with Xen:
> fdt_overlay.c: overlay_fixup_phandle()
>     Replace  strtoul() simple_strtoul() as strtoul() is not available in Xen lib
>     and included lib.h.
>     Change char *endptr to const char *endptr.
> 
> libfdt_env.h:
>     Changed path for config.h and stdbool.h. Remaining Xen changes to
>     libfdt_env.h carried over from existing libfdt (v1.4.0)

Hi Vikram, thanks for the patch!

Would you be able to split this patch into two patches:

- the first patch pulls in the new libfdt
- the second patch makes the necessary changes to make it compatible
  with Xen

I understand that the first patch alone would break the build, but they
can be easily squashed together on commit. And reading the two patches
separately it would make them a lot easier to review.

