Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E47D42A84C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207433.363265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJlF-0001MV-6A; Tue, 12 Oct 2021 15:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207433.363265; Tue, 12 Oct 2021 15:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJlF-0001Kd-2W; Tue, 12 Oct 2021 15:32:13 +0000
Received: by outflank-mailman (input) for mailman id 207433;
 Tue, 12 Oct 2021 15:32:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJlD-0001KX-WC
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:32:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJlD-0003yS-VQ
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:32:11 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJlD-0004xz-Ub
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:32:11 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maJl8-0004nO-Gb; Tue, 12 Oct 2021 16:32:06 +0100
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
	bh=bbo1bLL+rsvqnjjWkOSva+bJDV1jaPw/6AVQKLIJMfM=; b=E76Xw8qSPG1A68NTt+HyDHW3+y
	oRQLauxtPrN/xr2O/iTPuFyzjvkY+lM8Zp4WdqlNFKcKBhd3wqFwznjMW0XHrnE/nDSaDNSO8fcxq
	k5guj2uhNCe5QVuY77I5iqz5JWv6HQsiu/HxvW5cdy7sxns2bkeu+IHMvAP39obKjI9I=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24933.43638.23413.704241@mariner.uk.xensource.com>
Date: Tue, 12 Oct 2021 16:32:06 +0100
To: Oleksandr <olekstysh@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <37b38f3c-ffc6-b808-13a3-525dcac07d4e@gmail.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
	<1633974539-7380-3-git-send-email-olekstysh@gmail.com>
	<37b38f3c-ffc6-b808-13a3-525dcac07d4e@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Oleksandr writes ("Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for DomU"):
> On 11.10.21 20:48, Oleksandr Tyshchenko wrote:
> Hi Ian, Stefano
> > +        LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"\n",
> 
> If this appears to be the last version, may I please ask to remove 
> unneeded "\n" in the message above while committing? Thank you.

I think Stefano will be committing this but: personally I don't like
the "edit on commit" workflow.  Committers are already a bottleneck
and it is easy to make uncontrolled mistakes.  I find the most
convenient workflow to be to acquire a git branch from somewhere and
commit that, so if you provide a git branch with the acks folded in
and this kind of minor fix included, that would be ideal.  Ie,
git-request-merge format or something like it.

Thanks,
Ian.

