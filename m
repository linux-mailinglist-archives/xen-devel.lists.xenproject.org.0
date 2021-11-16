Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD4745385C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 18:15:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226465.391399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn22y-0001kH-LU; Tue, 16 Nov 2021 17:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226465.391399; Tue, 16 Nov 2021 17:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn22y-0001i6-HT; Tue, 16 Nov 2021 17:15:04 +0000
Received: by outflank-mailman (input) for mailman id 226465;
 Tue, 16 Nov 2021 17:15:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn22x-0001i0-Jk
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:15:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn22x-0000Qo-Iq
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:15:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn22x-0008Gm-Hz
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:15:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mn22i-0000oT-Ox; Tue, 16 Nov 2021 17:14:48 +0000
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
	bh=3LPmevwv6RPCOZkV8ejeBtam2JjH5bBBRsymDpXAKHU=; b=pG9zB0OdTyTUfYZYcNpKDvXMDx
	HlXWuzr4kOPQe7L53iyzycItrfg6f9vxZvf3SVosXYpRFb8UdWH0y9W70TMEOx+hlnLYU5pAOV4bB
	ijTqutNjFYq/GOonbTYLe+jNnommdYinS0Z7AgNtwtpTviRDZ3z+rDvgkpPTEaLvR/0g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24979.59134.479277.441001@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 17:14:38 +0000
To: Julien Grall <julien@xen.org>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Christian Lindig <christian.lindig@citrix.com>,
    David Scott  <dave@recoil.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH for-4.16 1/4] domctl: introduce a macro to set the grant
 table max version
In-Reply-To: <7a8b5bd1-6b34-eb32-72e4-f55cee5905ed@xen.org>
References: <20211115121741.3719-1-roger.pau@citrix.com>
	<20211115121741.3719-2-roger.pau@citrix.com>
	<7a8b5bd1-6b34-eb32-72e4-f55cee5905ed@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH for-4.16 1/4] domctl: introduce a macro to set the grant table max version"):
> On 15/11/2021 12:17, Roger Pau Monne wrote:
> > Such macro just clamps the passed version to fit in the designated
> > bits of the domctl field. The main purpose is to make it clearer in
> > the code when max grant version is being set in the grant_opts field.
> > 
> > Existing users that where setting the version in the grant_opts field
> > are switched to use the macro.
> > 
> > No functional change intended.
> > 
> > Requested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

