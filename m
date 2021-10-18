Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5255F431747
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 13:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212089.369841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQnY-0005ky-Sl; Mon, 18 Oct 2021 11:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212089.369841; Mon, 18 Oct 2021 11:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQnY-0005iM-Pb; Mon, 18 Oct 2021 11:27:20 +0000
Received: by outflank-mailman (input) for mailman id 212089;
 Mon, 18 Oct 2021 11:27:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQnW-0005iG-Um
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:27:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQnW-0003d7-To
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:27:18 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQnW-0005jn-S1
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:27:18 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcQnT-0005gx-I8; Mon, 18 Oct 2021 12:27:15 +0100
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
	bh=a/kGvnmYWhg1GxvH9ZcGpFKbseIOXzdNmvJ6uAuOmxQ=; b=M43zsTCWlA/z/Z6057oXnxJP/0
	UuqwyjoGWg+iNsHPMQnROBOta7jFE6z7zhadDgD4OenISNr7FiQ8BWcVT6kUysn8mgZvo4lNmn4yL
	u64ZBg1E3sTFX8FqszOy4QKi5YqZ+d7yKyMTCu+Ze+aXPur7VKQAPDG12iU6izxlb6Wc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24941.23059.261983.36065@mariner.uk.xensource.com>
Date: Mon, 18 Oct 2021 12:27:15 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] x86/HVM: correct cleanup after failed
 viridian_vcpu_init()
In-Reply-To: <16076406-9a32-5cdf-0ea6-72a8b21f420b@suse.com>
References: <55570db5-3823-8996-f69b-c2b00bcd4227@suse.com>
	<24941.20394.574634.548545@mariner.uk.xensource.com>
	<16076406-9a32-5cdf-0ea6-72a8b21f420b@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] x86/HVM: correct cleanup after failed viridian_vcpu_init()"):
> Since you've been looking here - any chance of getting a release ack?

I don't think one is needed[1], but FTR

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

> Perhaps also on "x86/shadow: make a local variable in sh_page_fault()
> HVM-only" and "x86/PV: address odd UB in I/O emulation"? Aiui that's
> going to be needed from today on ...

I assume these are bugfixes too ?

[1] I think I will send out a mail clearly stating the current state
of the tree.

Ian.

