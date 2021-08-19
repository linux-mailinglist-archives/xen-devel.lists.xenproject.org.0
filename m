Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97D63F19A3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:45:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168747.308095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhQK-00042c-AH; Thu, 19 Aug 2021 12:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168747.308095; Thu, 19 Aug 2021 12:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhQK-00040o-6r; Thu, 19 Aug 2021 12:45:32 +0000
Received: by outflank-mailman (input) for mailman id 168747;
 Thu, 19 Aug 2021 12:45:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhQI-00040d-Ei
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:45:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhQI-0007bd-Dv
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:45:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhQI-0004R7-Ct
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:45:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGhQF-0001fx-4v; Thu, 19 Aug 2021 13:45:27 +0100
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
	bh=V0f/xIkcdFGzB6lu500fhFnYuxWlRxQbjzZDwAfoGZ8=; b=YU4LTY3GrjXiCo5JOMHydh7jpu
	mOPH64o3hNwUXJcmVQICnKyu0AepfGjrxZLlMwTiXVPe/qEAUrRY69Eup4whj9X9wnyCKEE48f6jf
	ImUH5vfY4ritMZBm7OtBgeW/ebJ46GI2QWpIjLxiEnSLdbM1TaB3evtZ39/wko9EDvFo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.21094.866583.748384@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 13:45:26 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [xen-unstable test] 164237: regressions - FAIL
In-Reply-To: <63c26289-4797-9ac0-af95-56b6efd64cc3@suse.com>
References: <osstest-164237-mainreport@xen.org>
	<63c26289-4797-9ac0-af95-56b6efd64cc3@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-unstable test] 164237: regressions - FAIL"):
> Looks like this didn't sort itself (yet). Do you continue to be
> convinced that it will, eventually?

Hooray for explanations in commit messages.

I will (1) drop this test and (2) force push staging in the meantime.

Ian.

commit 6abb2f113025c37e3e5c6bb590b8e5f60c39a861
Author: Wei Liu <wei.liu2@citrix.com>
Date:   Thu Nov 2 15:15:04 2017 +0000

    make-flight: guest should use jessie to test pvgrub
    
    stretch has 64bit feature enabled for ext4, which pvgrub can't cope.
    We want to continue to test pvgrub, so specify jessie in the guest
    suite field.
    
    A consequence is that this test will test jessie forever.  Eventually
    jessie will rot so badly that this test fails and then we will no
    longer be testing pvgrub1.  Hopefully by then no-one will be using it.
    
    CC: Juergen Gross <jgross@suse.com>
    Signed-off-by: Wei Liu <wei.liu2@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

