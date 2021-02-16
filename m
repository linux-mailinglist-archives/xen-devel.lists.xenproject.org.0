Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB4A31CFB8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 18:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86008.161024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4bo-0003oi-I6; Tue, 16 Feb 2021 17:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86008.161024; Tue, 16 Feb 2021 17:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4bo-0003oJ-Ez; Tue, 16 Feb 2021 17:58:00 +0000
Received: by outflank-mailman (input) for mailman id 86008;
 Tue, 16 Feb 2021 17:57:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4bm-0003oE-VJ
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 17:57:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4bm-0005y0-RS
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 17:57:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4bm-0001PP-OZ
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 17:57:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC4bj-00013M-F7; Tue, 16 Feb 2021 17:57:55 +0000
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
	bh=zdLuxJR9BFfxTCVW0soQh3MiN+REhXu+qW4qHAdtfF0=; b=4HpC/DHi+wtnXoLYxYOOOZBpJi
	ilvzPRF6g3UQ1UW2qP75PCrI4ZpaGZVQuAE/9dK56sQpynGim/0t/8TobkNUfuYNay9Rifgka6v8A
	VGaOHfZuptgx2yXVMPa72FnakQN7L00diYLPxUpSJYigksY9sbEhd5nHXIle8yWTZlUY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24620.1955.243860.253052@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 17:57:55 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 04/10] tools/libxl: Fix uninitialised variable in libxl__domain_get_device_model_uid()
In-Reply-To: <20210216174327.8086-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-5-andrew.cooper3@citrix.com>
	<20210216174327.8086-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v2 04/10] tools/libxl: Fix uninitialised variable in libxl__domain_get_device_model_uid()"):
> Various version of gcc, when compiling with -Og, complain:
> 
>   libxl_dm.c: In function 'libxl__domain_get_device_model_uid':
>   libxl_dm.c:256:12: error: 'kill_by_uid' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     256 |         if (kill_by_uid)
...
> @@ -176,7 +176,6 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
>          LOGD(DEBUG, guest_domid,
>               "dm_restrict disabled, starting QEMU as root");
>          user = NULL; /* Should already be null, but just in case */
> -        kill_by_uid = false; /* Keep older versions of gcc happy */
>          rc = 0;
>          goto out;

Uhhhhh.  I think this and the other one seem to be stray hunks which
each introduce a new uninitialised variable bug ?

Isn.

