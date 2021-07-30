Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCDB3DB667
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 11:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162438.297892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9PA5-0002t2-Dh; Fri, 30 Jul 2021 09:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162438.297892; Fri, 30 Jul 2021 09:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9PA5-0002qE-A0; Fri, 30 Jul 2021 09:50:37 +0000
Received: by outflank-mailman (input) for mailman id 162438;
 Fri, 30 Jul 2021 09:50:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9PA3-0002q4-It
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 09:50:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9PA3-0000Rr-Hp
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 09:50:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9PA3-0003HO-Gq
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 09:50:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m9PA0-0005Yd-8U; Fri, 30 Jul 2021 10:50:32 +0100
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
	bh=0dvIEM61qnUMGjKKUr54lGVaetcRl+yBPRHcCtH/utY=; b=DyDPUSki4lSWquvbDgz7AIymG6
	aIo2yuWcmKFGMmpvwEDBT0BTekJvx/SV/3wBDWn7j9GIGaWYE96OMDSlv/OpCquNGcJC6evA3k9kc
	0Nj13zRo76ehvpu8puHxsIxf+bE7hSlgR2FcUURPMfhhEFXjUPFgoYqOj387nycjm4f0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24835.52072.16195.851941@mariner.uk.xensource.com>
Date: Fri, 30 Jul 2021 10:50:32 +0100
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Andrew Cooper <Andrew.Cooper3@citrix.com>,
    George Dunlap <George.Dunlap@citrix.com>,
    "Jan  Beulich" <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    "Stefano  Stabellini" <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/lib: Fix strcmp() and strncmp()
In-Reply-To: <70190796-7fe2-91c3-655b-aec9914b1e5b@citrix.com>
References: <20210727184715.17699-1-jane.malalane@citrix.com>
	<24833.13489.362056.292831@mariner.uk.xensource.com>
	<70190796-7fe2-91c3-655b-aec9914b1e5b@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jane Malalane writes ("Re: [PATCH] xen/lib: Fix strcmp() and strncmp()"):
> On 28/07/2021 11:42, Ian Jackson wrote:
>     What are the practical effects of this bug ?  AFAICT in the hypervisor
>     code all the call sites simply test for zero/nonzero.
...
>     This fix was just to make the code spec compliant and mainly for practice as I'm currently being introduced to Xen.

OK, great.  As I say it looks correct to me.  I just wanted to make
sure I wasn't missing anything.

So,

Reviewed-by: Ian Jackson <iwj@xenproject.org>

and I will queue this.

Ian.

