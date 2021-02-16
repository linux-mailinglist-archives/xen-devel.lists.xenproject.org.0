Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7361831CDBF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 17:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85919.160821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2yz-0001aD-I1; Tue, 16 Feb 2021 16:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85919.160821; Tue, 16 Feb 2021 16:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2yz-0001Zo-En; Tue, 16 Feb 2021 16:13:49 +0000
Received: by outflank-mailman (input) for mailman id 85919;
 Tue, 16 Feb 2021 16:13:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2yy-0001Zi-Dd
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:13:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2yy-0004En-C3
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:13:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2yy-0004WE-B9
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:13:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC2yv-0000lF-0T; Tue, 16 Feb 2021 16:13:45 +0000
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
	bh=xk/YdcwjCHmroxzlKQxTpW5y3R7/G6VMsvaVS7Nkriw=; b=Zv1KGPu1SgOnumJSQ/nbCu1BIB
	R+u/wlNS2/y3jvADIWLqV1J72VHkg2rFrYk/bawK7oCCQCXgU6QBC5tM+levY1NKaYB71NuSTGYP1
	VNmY4vQrM2NaWBoFp3y4t/kpGOf7t9BmIP9Ql0FAVZgoCMP4yCyWP3pgrJIXqf5MCdcE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.61240.746260.35610@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:13:44 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 09/10] tools/libs: Add rule to generate headers.lst
In-Reply-To: <20210212153953.4582-10-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-10-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 09/10] tools/libs: Add rule to generate headers.lst"):
> abi-dumper needs a list of the public header files for shared objects, and
> only accepts this in the form of a file.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

because it's not run by default, but...

> +headers.lst: FORCE
> +	@{ $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp

Missing set -e.  If the disk fills up temporarily you might get a
partial file here...

> +	@$(call move-if-changed,$@.tmp,$@)

Ian.

