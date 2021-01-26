Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0970303C1A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:51:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74901.134689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Msv-0006ft-O6; Tue, 26 Jan 2021 11:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74901.134689; Tue, 26 Jan 2021 11:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Msv-0006fU-Kt; Tue, 26 Jan 2021 11:51:49 +0000
Received: by outflank-mailman (input) for mailman id 74901;
 Tue, 26 Jan 2021 11:51:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4Mst-0006fO-Ma
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:51:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4Mst-00056I-Js
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:51:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4Mst-00089i-II
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:51:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4Msq-0006WS-8r; Tue, 26 Jan 2021 11:51:44 +0000
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
	bh=d8QXjyohNieFUr7gMsxw1DPmtY0Spr73TqonkxwwpEE=; b=tgdLQtPrAx85/VNoF/Iz60+2mm
	GRVZLVZfRmnqXH8a6e6AtwQSKxnwmiVwZ+QVa7n4a8uleJ8jRLYKEbGGeaDL/01Vv0wMxX3GN3VQ1
	VVt4IBeFXrFb1hZrGC+PRJl679rpybrolXrKo8YEt9HBiNwNMDrWmCxGIQ1Nz89zKX7I=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24592.591.978125.717379@mariner.uk.xensource.com>
Date: Tue, 26 Jan 2021 11:51:43 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 01/15] libxenguest: add get_unaligned_le32()
In-Reply-To: <a6cafbb2-9a85-e83a-7954-de5f8962c9a6@suse.com>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
	<a6cafbb2-9a85-e83a-7954-de5f8962c9a6@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v3 01/15] libxenguest: add get_unaligned_le32()"):
> Abstract xc_dom_check_gzip()'s reading of the uncompressed size into a
> helper re-usable, in particular, by other decompressor code.
> 
> Sadly in the mini-os case this conflicts with other functions of the
> same name (and purpose), which can't be easily replaced individually.
> Yet it was requested that no full set of helpers be introduced at this
> point in the release cycle. Hence the awkward XG_NEED_UNALIGNED.

How irritating.

> Requested-by: Ian Jackson <iwj@xenproject.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks,
Ian.

