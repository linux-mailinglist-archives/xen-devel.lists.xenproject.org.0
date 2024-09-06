Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB8996F478
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 14:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791788.1201793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smYH9-0007n2-EY; Fri, 06 Sep 2024 12:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791788.1201793; Fri, 06 Sep 2024 12:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smYH9-0007kf-Bt; Fri, 06 Sep 2024 12:41:19 +0000
Received: by outflank-mailman (input) for mailman id 791788;
 Fri, 06 Sep 2024 12:41:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1smYH7-0007kZ-MT
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 12:41:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1smYH5-0002Hr-Bn; Fri, 06 Sep 2024 12:41:15 +0000
Received: from [82.67.99.167] (helo=l14) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1smYH5-0003n1-11; Fri, 06 Sep 2024 12:41:15 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=SBOAxdH2tEj/BwoU5pBQghNSzJMD0bIzSy/H/eNAb3M=; b=PdnbgQyqMaXL8ZANlVzYf2vOMy
	WJtpjR5Vf/oKKCbYYN4rfa0WzveOiwoLy3YYSsS1yftymBP1EZeDaWnVbn7EqbwjU6HH7+McqKtj5
	N/6G6S+M9GSI91WIQhOqR0IeTkMAZZ8FJUEobb37yZ+U/Ss2FsefJX/WZ5wL8eQ045vM=;
Date: Fri, 6 Sep 2024 14:41:13 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable test] 187507: regressions - FAIL
Message-ID: <Ztr4aTuYzQrsxQmx@l14>
References: <osstest-187507-mainreport@xen.org>
 <ba5fb24b-52fd-4a7f-a3dd-3c83c2a97e8a@suse.com>
 <5ba7f4ea-4772-4bbf-9e9e-88d45c81b73a@citrix.com>
 <779f69aa-f1d3-4582-b08d-83f92d4614c2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <779f69aa-f1d3-4582-b08d-83f92d4614c2@citrix.com>

On Fri, Sep 06, 2024 at 11:07:06AM +0100, Andrew Cooper wrote:
> Interestingly, Gitlab's x86_32 build test missed this.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7762103169 passed.
> 
> I wonder if there's anything we should have done to get better coverage.

osstest does `make build` before `make` (equivalent to `make all` or
`make dist`). On gitlab, it's only `make dist`.

`make all` in root Makefile doesn't call `all` in sub-directories,
instead it calls `make install` recursively.

The "install: all" rules seems to only be written in leaf makefile
(probably for the best). Since there's nothing to install for
x86_emulate, it doesn't depends on the "all" rule. So only "osstest" is
going to build the tests.

Cheers,

-- 
Anthony PERARD

