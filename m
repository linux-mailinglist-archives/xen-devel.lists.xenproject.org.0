Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD9F32D5DB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 16:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93327.176171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpWo-0002Uq-4b; Thu, 04 Mar 2021 15:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93327.176171; Thu, 04 Mar 2021 15:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpWo-0002UR-0p; Thu, 04 Mar 2021 15:04:38 +0000
Received: by outflank-mailman (input) for mailman id 93327;
 Thu, 04 Mar 2021 15:04:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHpWm-0002UG-7v
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 15:04:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHpWm-0005Qj-4l
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 15:04:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHpWm-0006eq-3m
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 15:04:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHpWi-0005ZY-Nr; Thu, 04 Mar 2021 15:04:32 +0000
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
	bh=uT4CK0PIEjqmIu89qdI07TfJkHCeNCiWC0InLxpYT2Y=; b=qoY5DOkNL+0boGCDTvGw1/OGAy
	gqQzkHWAdO9+DT63KyFF5wyGGSUptTcAbH4sgN5acHfOKD90e6+RQ0ClJZF5VFMfpcHpL8QX0dKHq
	PGkCBQ02qKrhgljpXEUFWZ581FPzoaDGPhkq3MdknfnVAmQLhpePliOEieHWc16JzRjo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24640.63232.437509.771806@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 15:04:32 +0000
To: Norbert Manthey <nmanthey@amazon.de>
Cc: <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Julien Grall <jgrall@amazon.co.uk>,
    Michael Kurth <mku@amazon.de>
Subject: Re: [PATCH XENSTORE v1 09/10] xs: handle daemon socket error
In-Reply-To: <99bc1eef-7e1f-39b4-f0b7-59b6f52185aa@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
	<20210226144144.9252-10-nmanthey@amazon.de>
	<24639.46501.489245.30690@mariner.uk.xensource.com>
	<99bc1eef-7e1f-39b4-f0b7-59b6f52185aa@amazon.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Norbert Manthey writes ("Re: [PATCH XENSTORE v1 09/10] xs: handle daemon socket error"):
> On 3/3/21 5:13 PM, Ian Jackson wrote:
> > Norbert Manthey writes ("[PATCH XENSTORE v1 09/10] xs: handle daemon socket error"):
> >> When starting the daemon, we might see a NULL pointer instead of the
> >> path to the socket.
..
> > ... this is client code ?
> 
> This is client code, yes. The patched 'get_handle' function receives the
> parameter 'connect_to' in the function xs_open. There, the value of the
> functions 'xs_deamon_socket_ro', 'xs_deamon_socket' and 'xs_domain_dev'
> are passed to this function, without checking for the value NULL.
> 
> I agree that the description might be confusing, as the fix is applied
> to a function that does not cause the actual problem. How about
> rephrasing the first part of the commit message to the above proposal?

Improving the commit message seems to me to be needed in any case
since as far as I can tell from what I read here, the existing one is
actualy wrong :-).

With my maintainer/reviewer hat on, I think this new exit path
involves returning an error from this function without setting errno,
so it's wrong ?

As for the release, I think this is a very low-impact bug and now it
seems not 100% obvious, so unless someone would like to explain why it
should go into 4.15 I'd like to see it in -next.

Thanks,
Ian.

