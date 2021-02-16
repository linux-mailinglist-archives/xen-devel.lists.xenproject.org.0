Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C231CDF7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 17:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85937.160872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3BH-0002wK-Lu; Tue, 16 Feb 2021 16:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85937.160872; Tue, 16 Feb 2021 16:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3BH-0002vu-IO; Tue, 16 Feb 2021 16:26:31 +0000
Received: by outflank-mailman (input) for mailman id 85937;
 Tue, 16 Feb 2021 16:26:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3BG-0002vo-CO
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:26:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3BG-0004RS-BW
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:26:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3BG-0005aR-Ak
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:26:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC3BC-0000oW-Sv; Tue, 16 Feb 2021 16:26:26 +0000
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
	bh=xujiUnVe7uienQ0IKm30itwOU1hhpKUE444zbfdEHH8=; b=3d8U3E7xJakLqYq42wJXXrwPbn
	OzU+sglZ/SeEZDYl65vfgAn8w4Et2XiqmU+muaZmyR/PZtDAcTpnvszT10Vtpv1h5Xb+g3lUPwokG
	y7iGdrFT7I2Lo3pYmJ2KWHnZD0mugbidTtIY2m94VbdRxO1KU0tfjqGbRi/f6xpClEXQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <24619.62002.658637.648192@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:26:26 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 05/10] tools/libxl: Fix uninitialised variable in libxl__write_stub_dmargs()
In-Reply-To: <20210212153953.4582-6-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-6-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 05/10] tools/libxl: Fix uninitialised variable in libxl__write_stub_dmargs()"):
> Various version of gcc, when compiling with -Og, complain:
> 
>   libxl_dm.c: In function ‘libxl__write_stub_dmargs’:
>   libxl_dm.c:2166:16: error: ‘dmargs’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>                rc = libxl__xs_write_checked(gc, t, path, dmargs);
>                ~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reviewed-by: Ian Jackson <iwj@xenproject.org>

