Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2A9311040
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 19:46:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81884.151420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l867t-0003zR-F3; Fri, 05 Feb 2021 18:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81884.151420; Fri, 05 Feb 2021 18:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l867t-0003z5-BY; Fri, 05 Feb 2021 18:46:41 +0000
Received: by outflank-mailman (input) for mailman id 81884;
 Fri, 05 Feb 2021 18:46:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l867s-0003yz-55
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 18:46:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l867s-0004DW-3S
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 18:46:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l867s-00044T-2b
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 18:46:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l867o-0003ON-UO; Fri, 05 Feb 2021 18:46:36 +0000
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
	bh=fIqVCLKUuQmL4EbaGNZnTj94fj/XiYx4QW7u+aQe0v0=; b=qrJrBtfYR7Zw9WcXYOTlUgp6gX
	Yd5mYv2Yv7CLtb+3CTkpUKnTyOVRqN3YBeSqluMoXZjIR/ZfIQBh27ng94qYnH45yG6cwMBAX0Eub
	5k87GZGWMAvDOXiApZ41WjA1yreQe4MRI1BXRzMhv2kHvME6oBSz68nMVtK+ceVj+H7c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24605.37516.737667.412159@mariner.uk.xensource.com>
Date: Fri, 5 Feb 2021 18:46:36 +0000
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    <iwj@xenproject.org>,
    <wl@xen.org>,
    <anthony.perard@citrix.com>,
    <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH v2 2/2] tools/libxl: only set viridian flags on new domains
In-Reply-To: <1612382824-20232-2-git-send-email-igor.druzhinin@citrix.com>
References: <1612382824-20232-1-git-send-email-igor.druzhinin@citrix.com>
	<1612382824-20232-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Igor Druzhinin writes ("[PATCH v2 2/2] tools/libxl: only set viridian flags on new domains"):
> Domains migrating or restoring should have viridian HVM param key in
> the migration stream already and setting that twice results in Xen
> returing -EEXIST on the second attempt later (during migration stream parsing)
> in case the values don't match. That causes migration/restore operation
> to fail at destination side.
> 
> That issue is now resurfaced by the latest commits (983524671 and 7e5cffcd1e)
> extending default viridian feature set making the values from the previous
> migration streams and those set at domain construction different.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Thanks for splitting this up.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Andy, I think from irc that this meets with your approval but can I
have a formal R-b ?  If so please put my tools maintainer ack on it
too.

Thanks,
Ian.

