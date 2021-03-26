Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB2F34A9A3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 15:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101867.195128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnOf-0005nM-KD; Fri, 26 Mar 2021 14:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101867.195128; Fri, 26 Mar 2021 14:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnOf-0005mx-Gt; Fri, 26 Mar 2021 14:25:09 +0000
Received: by outflank-mailman (input) for mailman id 101867;
 Fri, 26 Mar 2021 14:25:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnOe-0005ms-33
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:25:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnOd-0000Bk-W4
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:25:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnOd-00040X-VD
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:25:07 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPnOY-0002rX-S7; Fri, 26 Mar 2021 14:25:02 +0000
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
	bh=s3NOeMHYURNegzXa1jHT5ftjd4FkSGaEmcw1yCvvYYE=; b=ssYqb8k/g62GXzx7yZFUUBgotO
	c9Vi9zELSXiVKVuiG8UVhpkT1vZFPUiwipgeXKKutk8ED6nuegrSDbtjdLRGS+ohHbK9m12O1/Okk
	9S6+ftH4svRv9qAfq4A2aEBJwvn27rVNE0urZT0/dE3YDPVmktS2lMWYRduJiwRAxOas=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.61118.533307.438087@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 14:25:02 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>,
    Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH for-4.15 0/3] x86/msr: Fixes for XSA-351 [and 1 more messages]
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20210316161844.1658-1-andrew.cooper3@citrix.com>,
	<24658.7471.309734.168120@mariner.uk.xensource.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
	<20210316161844.1658-2-andrew.cooper3@citrix.com>
	<24658.1583.601613.903527@mariner.uk.xensource.com>
	<4b1c13ee-f121-3379-6fb3-c0d4dbb76e48@citrix.com>
	<24658.5692.932979.892439@mariner.uk.xensource.com>
	<YFIbEqh9IhrY0Lwr@Air-de-Roger>
	<24658.7471.309734.168120@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15 0/3] x86/msr: Fixes for XSA-351"):
> This is slightly complicated.  Patches 1 and 2 rearrange the code to look and
> behave more like 4.14, and patch 3 fixes a Solaris (and turbostat) bug in a
> manner which can be backported to all security trees.

As far as I can tell this series needs a respin ?

I have been through the thread and AFAICT the only comments were on
the commit message for patch 2.  Patchex 1 and 3 already have a
release-ack.  Patch 2 does not have any mind of maintainer review.

I would like this series to go in today.

Jan, since Andrew doesn't seem to have been able to do that respin
yet, would you be able to rewrite the commit message of message 2
taking into account the two comments from you an from Roger ?

I think that is all that's needed for these three to go into tree.

Ian.

