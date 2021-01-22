Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F0300885
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 17:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72946.131493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zCo-0000bJ-Pe; Fri, 22 Jan 2021 16:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72946.131493; Fri, 22 Jan 2021 16:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zCo-0000au-MQ; Fri, 22 Jan 2021 16:22:38 +0000
Received: by outflank-mailman (input) for mailman id 72946;
 Fri, 22 Jan 2021 16:22:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2zCm-0000ap-Le
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:22:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2zCm-0003Nx-Hd
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:22:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2zCm-0002EQ-EH
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:22:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2zCj-0004GJ-5A; Fri, 22 Jan 2021 16:22:33 +0000
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
	bh=fnfW3SVBMONFtom3Dvx63/GpRDk4iVv08ABHdSCtmqU=; b=Lp3dlIklbKTluNQcM+K7FUSTK4
	7jjcC9kP29OoEvMY/6N7NkYUFc2fBMj1QRa/RKF6KTZzlqmTIR6J+sdcDV5sZGRSRqpX5D951qziI
	Chb+LxRKMjLSjNtMForupLU5fOttDpGDWVXKpBLy8OHQ7JVVMPpCyhU1G0MZYcLrES9w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24586.64456.905401.474099@mariner.uk.xensource.com>
Date: Fri, 22 Jan 2021 16:22:32 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
    Edwin =?iso-8859-1?Q?T=F6r=F6k?= <edvin.torok@citrix.com>,
    Christian Lindig <christian.lindig@citrix.com>,
    =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
In-Reply-To: <0361ffd5-a640-ac59-c222-4a2d5a9a4727@citrix.com>
References: <20210122155603.23402-1-iwj@xenproject.org>
	<20210122155603.23402-7-iwj@xenproject.org>
	<0361ffd5-a640-ac59-c222-4a2d5a9a4727@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored"):
> A couple of quick questions/observations.  Does this cope in a sensible
> way if, for whatever reason, the chosen daemon isn't present?

That would depend on what you mean by "sensible".  I think that given
that we now think we support both on all architectures, "sensible"
means "the tests fail if one of the xenstoreds doesn't build".  And

that's what this will do :-).

> How hard would it be to add the 3rd option, stub-cxenstored into this
> mix?  It is just one other key in xencommons to tweak.

We would presumably want to do that for a smaller set of tests, but
yes, that could be done as a future enhancement.

> SUPPORT.md doesn't appear to make any statements about the disposition
> of xenstoreds, but stub-cxenstored is used by at least two major
> downstreams so is obviously has security support in practice, and ought
> to be tested.

Looking at /etc/default/xencommons, I think that testing would be done
by setting XENSTORETYPE=domain.  Do we want to test stub C xentored or
stub ocaml xenstored or both ?  The config seems not to have a way to
specify which.  Do we build only one ?

Ian.

