Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A63465B2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 17:54:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100746.192145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOkHM-0003LR-6p; Tue, 23 Mar 2021 16:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100746.192145; Tue, 23 Mar 2021 16:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOkHM-0003L2-3j; Tue, 23 Mar 2021 16:53:16 +0000
Received: by outflank-mailman (input) for mailman id 100746;
 Tue, 23 Mar 2021 16:53:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOkHJ-0003Kx-Ur
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 16:53:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOkHJ-0002e6-Qw
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 16:53:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOkHJ-0000Wd-Ox
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 16:53:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOkHG-0002au-IR; Tue, 23 Mar 2021 16:53:10 +0000
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
	bh=BvoZTo5swmqmWjAIhmdG3QAN4H7/hSNkplL5xeVp2AU=; b=wF6CSwL+zUvFEwdgcRvOARil5S
	egYZCskBa2WgUv5pusMn3ALoRCnzLGMxzLVponNZ4EWlZOzy41+Jj4aSnhyC0Brk0YEcV01R2Dkju
	TJ6CSuVI3lWylUv3RWjYXZ+R7jxl4UeLqkkxRpQz7vfqHdUKjC8a060ImOs0OeOlnDDA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24666.7414.232768.961456@mariner.uk.xensource.com>
Date: Tue, 23 Mar 2021 16:53:10 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
    community.manager@xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    committers@xenproject.org,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>
Subject: Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow
In-Reply-To: <0bfab829-3841-b2cd-96f9-874340cf75c2@suse.com>
References: <24666.1682.595069.435575@mariner.uk.xensource.com>
	<0bfab829-3841-b2cd-96f9-874340cf75c2@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow"):
> On 23.03.2021 16:17, Ian Jackson wrote:
> >   I think it may be time to reconcile ourselves to not fixing this,
> >   and deciding on a suitable plan B.  Do we need to put something in
> >   the release notes, or SUPPORT.md, or implement a mitigation of some
> >   kind ?
> 
> One option of course is, like was just done for 4.13.3, to revert.
> Iirc Andrew had some thoughts towards making the new piece of code
> conditional upon the original issue actually hitting.

I would be very happy to consider a revert it someone would give me
references and explain to me the implications in words of one
syllable.

> Another
> (somewhat similar) option might be to hide the new piece of code
> behind a default-off command line option.

Likewise.

Sorry to be vague but I feel quite ignorant here!

Ian.

