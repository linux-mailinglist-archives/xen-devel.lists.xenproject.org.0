Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C069F197D1B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 15:38:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIuZi-0000mN-MB; Mon, 30 Mar 2020 13:35:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MEvi=5P=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jIuZh-0000mI-27
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 13:35:33 +0000
X-Inumbo-ID: 5417c973-728b-11ea-b9da-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5417c973-728b-11ea-b9da-12813bfff9fa;
 Mon, 30 Mar 2020 13:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=XOjtC8gvgwNV3MESpkdWwCXSbne30xVf8C31EVgpnuc=; b=grQHsjEuLETiG33p0N+Uv1EuZT
 dJvA2Svz+iVjFd/OvrcvdINk8GJ8/YYl+bDBaZ+S805ATy7lDVCUiOYJk3gpIdq0ncL0TpTeg/Tjs
 gztUwcnx0Vswc9JAFzqooXNP+DmcY0Ty+TV9k/FFVyeMYwG0CS7UcFMOiaMK9k6wMeeM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIuZf-0004tz-KB; Mon, 30 Mar 2020 13:35:31 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIuZf-0007lt-B6; Mon, 30 Mar 2020 13:35:31 +0000
Date: Mon, 30 Mar 2020 14:35:28 +0100
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20200330133528.k75ajffmadtbdrl4@debian>
References: <20200312145417.106812-1-jandryuk@gmail.com>
 <20200312145417.106812-3-jandryuk@gmail.com>
 <20200330132556.fjskeqkqlpd6g2er@debian>
 <24193.62462.682761.732817@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24193.62462.682761.732817@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 2/2] scripts: Use stat to check lock claim
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Mar 30, 2020 at 02:28:30PM +0100, Ian Jackson wrote:
> Wei Liu writes ("Re: [PATCH 2/2] scripts: Use stat to check lock claim"):
> > On Thu, Mar 12, 2020 at 10:54:17AM -0400, Jason Andryuk wrote:
> > > Replace the perl locking check with stat(1).  Stat is able to fstat
> > > stdin (file descriptor 0) when passed '-' as an argument.  This is now
> > > used to check $_lockfd.  stat(1) support for '-' was introduced to
> > > coreutils in 2009.
> > > 
> > > After A releases its lock, script B will return from flock and execute
> > > stat.  Since the lockfile has been removed by A, stat prints an error to
> > > stderr and exits non-zero.  Redirect stderr to /dev/null to avoid
> > > filling /var/log/xen/xen-hotplug.log with "No such file or directory"
> > > messages.
> > > 
> > > Placing the stat call inside the "if" condition ensures we only check
> > > the stat output when the command completed successfully.
> > > 
> > > This change removes the only runtime dependency of the xen toolstack on
> > > perl.
> > > 
> > > Suggested-by: Ian Jackson <ian.jackson@citrix.com>
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > 
> > Ian, ping?
> > 
> > I already applied patch 1. This patch looks to be good as well.
> 
> Sorry.  Yes.
> 
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks, I will apply this patch shortly.

Wei.

