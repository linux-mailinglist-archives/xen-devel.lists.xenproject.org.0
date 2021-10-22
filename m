Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055FC4374A9
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 11:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214881.373706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdqkd-00036v-Ux; Fri, 22 Oct 2021 09:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214881.373706; Fri, 22 Oct 2021 09:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdqkd-000359-RV; Fri, 22 Oct 2021 09:22:11 +0000
Received: by outflank-mailman (input) for mailman id 214881;
 Fri, 22 Oct 2021 09:22:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdqkc-00034z-EP
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 09:22:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdqkc-0000Rh-Df
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 09:22:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdqkc-0001S0-CQ
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 09:22:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>) id 1mdqka-000121-7p
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 10:22:08 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=oCd8SK+N+URiKkT/8L7rieGTlsybO36V2bZXVwEfhlw=; b=6wCvqtu3VzDMXGLF8/5poy8XLL
	oGtLcyOseVJxCp0rUmpjLefIB9flCA0lUDiFqcZ7SDLLISayLTCz1vwFQnVK+h11PoC7I8YmRXcNH
	x1NRuoA6kLEiD8jSuT/ujoMT0dEfru3vH640Bd4qEAasXmMS8poKA3KO9Z1nKUeJUDoU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24946.33471.667852.296915@mariner.uk.xensource.com>
Date: Fri, 22 Oct 2021 10:22:07 +0100
To: xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable test] 165712: regressions - FAIL
In-Reply-To: <osstest-165712-mainreport@xen.org>
References: <osstest-165712-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

osstest service owner writes ("[xen-unstable test] 165712: regressions - FAIL"):
> flight 165712 xen-unstable real [real]
> flight 165727 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/165712/
> http://logs.test-lab.xenproject.org/osstest/logs/165727/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 165699
> 

This was not a genuine regression.  There is an infelicity in this
particular job: it runs on any host, but only some hosts support
FreeBSD (which is what this is).  In particular the albanas have UEFI
firmware which doesn't work.

I have force pushed this.  This test will continue to run here due to
the failure.  This will do for now, but really I need to do something
more subtle.

> version targeted for testing:
>  xen                  98f60e5de00baf650c574c9352bb19aedb082dea

Ian.

