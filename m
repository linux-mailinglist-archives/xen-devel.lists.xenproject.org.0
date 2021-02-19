Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB4C31FD2B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 17:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86982.163775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8kJ-00018c-6F; Fri, 19 Feb 2021 16:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86982.163775; Fri, 19 Feb 2021 16:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8kJ-00018G-31; Fri, 19 Feb 2021 16:35:11 +0000
Received: by outflank-mailman (input) for mailman id 86982;
 Fri, 19 Feb 2021 16:35:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8kI-00018B-5I
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:35:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8kI-0004eG-4Y
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:35:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8kI-0001th-3f
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:35:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lD8kE-0001NK-V9; Fri, 19 Feb 2021 16:35:06 +0000
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
	bh=3AsbATIsLWhono4AHYbRjfdqSrx+oa1XHvVDsYGMgDs=; b=Tf2LjBfcqb7XLUpKa1UssD7xQQ
	lfRnWOB2bz7aJ6YHXyOR44phaHV1qHQgMGUqTS9vvl4JQVnF+cgIy9nVtb6FKyuOuB5fJJeIB0UQI
	NshXzYLh2L4BCAtlcemAHBpgWP8JHScsGFsuF9QLAC32Igxhgti6j24l5W60SrGc8ydc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24623.59578.746852.719352@mariner.uk.xensource.com>
Date: Fri, 19 Feb 2021 16:35:06 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 for-4.15] tools/libxl: Work around unintialised variable libxl__domain_get_device_model_uid()
In-Reply-To: <20210219150426.8498-1-andrew.cooper3@citrix.com>
References: <20210219150426.8498-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v2 for-4.15] tools/libxl: Work around unintialised variable libxl__domain_get_device_model_uid()"):
> Various version of gcc, when compiling with -Og, complain:
> 
>   libxl_dm.c: In function 'libxl__domain_get_device_model_uid':
>   libxl_dm.c:256:12: error: 'kill_by_uid' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     256 |         if (kill_by_uid)
>         |            ^
> 
> The logic is very tangled.  Set kill_by_uid on every path.
> 
> No funcational change.
> 
> Requested-by: Ian Jackson <iwj@xenproject.org>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Not-acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

