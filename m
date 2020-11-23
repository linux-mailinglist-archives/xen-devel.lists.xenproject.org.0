Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2452C116B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 18:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34886.66157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFK7-0002X1-8L; Mon, 23 Nov 2020 17:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34886.66157; Mon, 23 Nov 2020 17:08:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFK7-0002Wc-4o; Mon, 23 Nov 2020 17:08:19 +0000
Received: by outflank-mailman (input) for mailman id 34886;
 Mon, 23 Nov 2020 17:08:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1khFK5-0002WW-Sd
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:08:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1khFK5-0005nQ-RE
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:08:17 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1khFK5-0005xo-QS
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:08:17 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1khFJx-0004JM-Rg; Mon, 23 Nov 2020 17:08:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1khFK5-0002WW-Sd
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=s7qzcMd4ZKa+8U82fxWH/zht3/KC7larJAj01W7JFbs=; b=o9FNcy3zazJrNTUvnc9Z49IdSe
	yY/TD+EeMmZf7VbLH2a3YFcjwV64CyWXFi0O/1+bj3WGwNnZthf81Zx5VrHueH9EfYHEjDOhrgtcd
	L+YL+KtRVu5DeAMUQcO9BeB77F8ZWmE46VV5O09J2njl9dgNj+2nnGmkOgL/G/cjP0ks=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1khFK5-0005nQ-RE
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:08:17 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1khFK5-0005xo-QS
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:08:17 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
	(envelope-from <iwj@xenproject.org>)
	id 1khFJx-0004JM-Rg; Mon, 23 Nov 2020 17:08:09 +0000
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24507.60537.640007.567348@mariner.uk.xensource.com>
Date: Mon, 23 Nov 2020 17:08:09 +0000
To: George Dunlap <george.dunlap@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Roger Pau Monne <roger.pau@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    "Julien  Grall" <julien@xen.org>
Subject: Re: [PATCH] MAINTINERS: Propose Ian Jackson as new release manager
In-Reply-To: <20201123160400.1273386-1-george.dunlap@citrix.com>
References: <20201123160400.1273386-1-george.dunlap@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

George Dunlap writes ("[PATCH] MAINTINERS: Propose Ian Jackson as new release manager"):
> Ian Jackson has agreed to be the release manager for 4.15.  Signify
> this by giving him maintainership over CHANGELOG.md.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Obviously that signifies my consent but I think it needs more acks.

Wei, Juergen, Paul, I think I am likely to ask you some questions.
Any tips etc would be welcome.

Thanks,
Ian.

