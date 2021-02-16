Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA6231CE15
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 17:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85954.160920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3FV-0004BB-Vw; Tue, 16 Feb 2021 16:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85954.160920; Tue, 16 Feb 2021 16:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3FV-0004Am-SK; Tue, 16 Feb 2021 16:30:53 +0000
Received: by outflank-mailman (input) for mailman id 85954;
 Tue, 16 Feb 2021 16:30:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3FT-0004Ah-L1
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:30:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3FT-0004Xx-Gx
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:30:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3FT-0005tN-EK
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:30:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC3FQ-0000pm-3u; Tue, 16 Feb 2021 16:30:48 +0000
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
	bh=OhJRJlAMpzAAh07WuVPnM89I4Bmu//KXS2FG5XMcqVk=; b=lT4/iBXjo+IsctsMKaRK/FCSHM
	Ru1xR5NMxNKhUVU7J6qVzzAZ6X0v+uKbZCGH28izGJ/CAKbQ5LPY8CGXl8OXEAMjElvIXU8V7tk2T
	zRyKbqjPNyj645CXMKwNVgRP+RnY6Alvas91LDvHkx8477re3/ZhGu9iMfJ6w3c0P/NA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.62263.884017.217332@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:30:47 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 10/10] tools/libs: Write out an ABI analysis when abi-dumper is available
In-Reply-To: <20210212153953.4582-11-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-11-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 10/10] tools/libs: Write out an ABI analysis when abi-dumper is available"):
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
...
> +# If abi-dumper is available, write out the ABI analysis
> +ifneq ($(ABI_DUMPER),)
> +libs: $(PKG_ABI)
> +$(PKG_ABI): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) headers.lst
> +	abi-dumper $< -o $@ -public-headers headers.lst -lver $(MAJOR).$(MINOR)
> +endif

Kind of annoying that we don't have a variable for
   lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)

Reviewed-by: Ian Jackson <iwj@xenproject.org>

