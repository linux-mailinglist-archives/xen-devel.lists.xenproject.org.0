Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B51263B77C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 02:56:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449183.705821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozpqv-0008Dj-9C; Tue, 29 Nov 2022 01:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449183.705821; Tue, 29 Nov 2022 01:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozpqv-0008Ad-5N; Tue, 29 Nov 2022 01:56:05 +0000
Received: by outflank-mailman (input) for mailman id 449183;
 Tue, 29 Nov 2022 01:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMqW=35=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ozpqt-0007is-BQ
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 01:56:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9ff310d-6f88-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 02:56:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5BFF5B80F79;
 Tue, 29 Nov 2022 01:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B692FC433C1;
 Tue, 29 Nov 2022 01:55:58 +0000 (UTC)
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
X-Inumbo-ID: f9ff310d-6f88-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669686960;
	bh=jO2TGb8lksfFf8FZVpiplTYgamp7/GweM3sCOVZHZGM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tHDskdqJUKdx9veIrdH7owuqlsP2/z3W272Mfb8yglc4IzqVzE//Qju4TGMyu4TVb
	 9vKqnfAKAjv3tNCPd1fE7bD/XmWNibO9Yz2PXBtGY4dEbssfs1PCh7JwuCQl4ZHoYh
	 MsrV9EzMxaI4lgqgKrNcqJvy3Xhd74Fe0eUt91AO+AcmlxqToosre/bOryvJlYOPoA
	 q5P9OMdofw+Sg5w8pcgZ4CN7bSkZhO1rIm3z3B4Gm0V/w2tedY7t1M7yAThIIO1MP+
	 TM1GfUOqUcafKRLuaCUBjcwD2wUr3yavsmMLwUB3VCoh7fLaAHA/0Z8a8rPP7KqTjV
	 etBntbTlKZAmA==
Date: Mon, 28 Nov 2022 17:55:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/4] Static analyser finding deviation
In-Reply-To: <20221128141006.8719-1-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2211281701450.1049131@ubuntu-linux-20-04-desktop>
References: <20221128141006.8719-1-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Nov 2022, Luca Fancellu wrote:
> This serie introduces a way to suppress a static analyser finding providing a
> proper justification for it.
> The process is explained in the docs/misra/documenting-violations.rst document
> that this serie will provide.
> The tools currently supported are eclair, coverity and cppcheck, but the design
> is open to support many other static analysis tool.
> 
> The changes are split between the first two patches to reduce the review effort,
> the first patch is introducing the deviation process for the eclair and coverity
> tools, this is because their analysis system is similar.
> 
> The second patch is introducing the same deviation process for cppcheck,
> modifying the current way it is called from the makefile and improving its
> analysis.
> 
> The third patch is a fix for a tool used for cppcheck and the fourth patch
> is an example of how a deviation can be applied for some MISRA findings.

I tried testing this series with:

# scripts/xen-analysis.py --build-only --cppcheck-html --run-cppcheck --cppcheck-bin=/local/repos/cppcheck/cppcheck --cppcheck-html-bin=/local/repos/cppcheck/htmlreport/cppcheck-htmlreport

But I get this error:

ERROR: Can't find cppcheck version or version is not 2.7


Note that my cppcheck is 2.7.4:

# ./cppcheck --version
Cppcheck 2.7.4


After removing the version check in cppcheck_analysis.py, the process
starts correctly.

Also, where is the output html report created by cppcheck-html by
default?

