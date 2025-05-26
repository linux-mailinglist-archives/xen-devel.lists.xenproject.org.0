Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559B1AC42E5
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 18:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997608.1378428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJaXg-0001pT-6T; Mon, 26 May 2025 16:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997608.1378428; Mon, 26 May 2025 16:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJaXg-0001nF-3O; Mon, 26 May 2025 16:19:12 +0000
Received: by outflank-mailman (input) for mailman id 997608;
 Mon, 26 May 2025 16:19:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uJaXe-0001n9-Sj
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 16:19:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJaXd-003R7Z-0N;
 Mon, 26 May 2025 16:19:09 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJaXd-00EFKx-0X;
 Mon, 26 May 2025 16:19:08 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=TOX79ZSmgRULME2Nk+t8dw5ev91nIx7AxNQiiFtsGbI=; b=yq8Ra8XR+FLBIw4lnHakNx4rqr
	ccdqJqBawJiZ5pL2iuGinOI6+RGKft2Jk/X2JmoExCCsv39a1hNmeXxNT3B43Sn61usPWjtF6cfHW
	GyzzvqofNsZG2Ofw5bOzpw3ApY/w95APDqYmjC7YYyy1eSm3BlRJ8hcTOf0d7KQUoDb8=;
Date: Mon, 26 May 2025 18:19:06 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Liam Merwick <liam.merwick@oracle.com>
Cc: dwmw@amazon.co.uk, roger.pau@citrix.com, xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/xen: Fix trace_xs_node_read() params
Message-ID: <aDSUesF-KUYnIoxM@l14>
References: <20250523160134.218997-1-liam.merwick@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523160134.218997-1-liam.merwick@oracle.com>

On Fri, May 23, 2025 at 04:01:34PM +0000, Liam Merwick wrote:
> When the '--enable-trace-backends=syslog' build option is configured,
> the following compilation error is encountered.
> 
> In file included from /usr/include/sys/syslog.h:207,
>                  from /usr/include/syslog.h:1,
>                  from ./trace/trace-hw_xen.h:224,
>                  from ../hw/xen/trace.h:1,
>                  from ../hw/xen/xen-bus-helper.c:13:
> In function ‘syslog’,
>     inlined from ‘_nocheck__trace_xs_node_read’ at ../hw/xen/trace-events:41:9,
>     inlined from ‘trace_xs_node_read’ at trace/trace-hw_xen.h:903:9,
>     inlined from ‘xs_node_read’ at ../hw/xen/xen-bus-helper.c:154:5:
> /usr/include/bits/syslog.h:45:3: error: ‘%s’ directive argument is null [-Werror=format-overflow=]
>    45 |   __syslog_chk (__pri, __USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Add a check that 'value' is not null before passing it to trace_xs_node_read().
> 
> Fixes: e6cdeee95990 ("hw/xen: Add xs_node_read() helper function")
> Signed-off-by: Liam Merwick <liam.merwick@oracle.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

