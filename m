Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD971347764
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 12:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100923.192587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1iM-00009v-0Q; Wed, 24 Mar 2021 11:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100923.192587; Wed, 24 Mar 2021 11:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1iL-00009W-T1; Wed, 24 Mar 2021 11:30:17 +0000
Received: by outflank-mailman (input) for mailman id 100923;
 Wed, 24 Mar 2021 11:30:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP1iK-00009R-NL
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:30:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP1iK-00089s-Kc
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:30:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP1iK-0006i8-Ik
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:30:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lP1iH-0004sI-5Q; Wed, 24 Mar 2021 11:30:13 +0000
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
	bh=pfDQjMJUz4k7QKACjLX6dU6icLBu934H/nrWL/BAeq8=; b=FFHl+HY1uEPrMurB2snnhMjIGU
	m2ZA7HrLQfZklyVUuUHKfyoQElsWXKcHZgOto+pHavOBrSrvNf97z/sLkC4ShKsjGTMVsDMfD4nDs
	2sceugbstoe6zAtC9sPw/44blbXD9IavQ1js3nklmNBTBKvU4h6sTX81z4RPF0dDj3qc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24667.8900.993418.152255@mariner.uk.xensource.com>
Date: Wed, 24 Mar 2021 11:30:12 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH-for-4.15] tools/libs/store: cleanup libxenstore interface
In-Reply-To: <b6e10cf8-5ea2-53c8-30ba-f617bdb96f81@suse.com>
References: <20210324072645.10596-1-jgross@suse.com>
	<24667.7211.431280.743192@mariner.uk.xensource.com>
	<b6e10cf8-5ea2-53c8-30ba-f617bdb96f81@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jürgen Groß writes ("Re: [PATCH-for-4.15] tools/libs/store: cleanup libxenstore interface"):
> On 24.03.21 12:02, Ian Jackson wrote:
> > Is it possible to do sort this out in a more minimal way ?  Eg we
> > could change the name to namespace it properly.  (I haven't looked at
> > the code in detail and am still rather under-caffeinated so maybe I am
> > talking nonsense here.)
> 
> No nonsense. This would be the really minimum option (apart from doing
> nothing).
> 
> I can setup the patch for that and keep the rest for 4.16 (which will
> then probably need to bump the so version).

Hmmm.  Maybe it would be less disruptive to punt the whole lot for
xen-next.  That way we don't have a silent withdrawl in one release
followed by a soname bump in the next.

If you're keen to change this for 4.15, please feel free to show me
what the patch looks like.  But I would be inclined to postpone this.

Thanks,
Ian.

