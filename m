Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B2331CD57
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 16:57:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85888.160722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2it-0006tu-5x; Tue, 16 Feb 2021 15:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85888.160722; Tue, 16 Feb 2021 15:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2it-0006tV-2V; Tue, 16 Feb 2021 15:57:11 +0000
Received: by outflank-mailman (input) for mailman id 85888;
 Tue, 16 Feb 2021 15:57:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2ir-0006tQ-N6
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 15:57:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2ir-0003Oa-ME
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 15:57:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2ir-0002vk-LE
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 15:57:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC2io-0000h0-BU; Tue, 16 Feb 2021 15:57:06 +0000
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
	bh=I5DR9HPMrvd5IRmtN2NQE3F2mFp0XM5vCEOoF2ijlXA=; b=DyjrxL/GJSUJD3gs86YzphYkwU
	8akfydlcklfXPTu21QiYe9HOk3nwrADlEuklLR3q/zBMrc6MBzi57SGg2M0jR3JilUegXtizXGhdW
	zkm/tEgRY85Sd0epme4RxRII94g0+YaCZgMeeJcpadxUEz8AUDH95sY87T8J6YpZ/Bjo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.60242.137678.510238@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 15:57:06 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 01/10] tools/xl: Fix exit code for `xl vkbattach`
In-Reply-To: <20210212153953.4582-2-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 01/10] tools/xl: Fix exit code for `xl vkbattach`"):
> Various version of gcc, when compiling with -Og, complain:
> 
>   xl_vkb.c: In function 'main_vkbattach':
>   xl_vkb.c:79:12: error: 'rc' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      79 |     return rc;
>         |            ^~
> 
> The dryrun_only path really does leave rc uninitalised.  Introduce a done
> label for success paths to use.
> 
> Fixes: a15166af7c3 ("xl: add vkb config parser and CLI")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

