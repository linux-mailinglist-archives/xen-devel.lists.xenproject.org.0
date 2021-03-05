Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C132EC12
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:28:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93702.176815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAUb-0006zC-Ey; Fri, 05 Mar 2021 13:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93702.176815; Fri, 05 Mar 2021 13:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAUb-0006yl-Bc; Fri, 05 Mar 2021 13:27:45 +0000
Received: by outflank-mailman (input) for mailman id 93702;
 Fri, 05 Mar 2021 13:27:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAUa-0006yc-DT
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:27:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAUa-0006mf-BH
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:27:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAUa-000245-AV
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:27:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIAUV-0008Pl-E5; Fri, 05 Mar 2021 13:27:39 +0000
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
	bh=FVddYPRvUs8u+pd+WUgmO30Y4O7uGJrllArfzOYlnNs=; b=hH+jhuGtHny3amSn5NmzvyJUG+
	U8WgFcFknuq4EohL+z1eFIf8FAHcjKBRwMWyUfmr9Tu25boUT5ZwnUyWYP9kxpuja6L3F4xvlWALd
	CYc0AktArPkHuhWUloSPpM1q9oZBKvJRU/ntk7gN+D9eIFYiaJPnw4cSu6asadLXcNUY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24642.12747.126941.615066@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 13:27:39 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>,
    xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for
 xprintf() and barf{,_perror}()
In-Reply-To: <0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
References: <20210305124003.13582-1-julien@xen.org>
	<20210305124003.13582-3-julien@xen.org>
	<0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jürgen Groß writes ("Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for xprintf() and barf{,_perror}()"):
> On 05.03.21 13:40, Julien Grall wrote:
> > -extern void (*xprintf)(const char *fmt, ...);
> > +void barf(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
> > +void barf_perror(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
> > +
> > +extern void (*xprintf)(const char *fmt, ...) PRINTF_ATTRIBUTE(1, 2);
> 
> ... the extern here would be dropped.

With my RM hat on I don't have an opinion on that and my R-A can
stand.

With my maintainer hat on I agree with Jürgen's style opinion - it's
nicer without the "extern", but I'm also happy with the patch as is.

Ian.

