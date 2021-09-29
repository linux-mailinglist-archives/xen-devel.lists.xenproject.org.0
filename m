Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B923D41C6AC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 16:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199208.353116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVaa3-0003BW-TS; Wed, 29 Sep 2021 14:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199208.353116; Wed, 29 Sep 2021 14:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVaa3-00038w-QD; Wed, 29 Sep 2021 14:29:07 +0000
Received: by outflank-mailman (input) for mailman id 199208;
 Wed, 29 Sep 2021 14:29:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVaa2-00038q-VS
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 14:29:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVaa2-0001rQ-R7
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 14:29:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVaa2-0006bf-Q8
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 14:29:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mVaZz-0007Px-Gw; Wed, 29 Sep 2021 15:29:03 +0100
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
	bh=5pPaFIJaKwGfQmy5oTRo+z107oHebTGHXSB/MZIjSso=; b=o3pHgr3cYAd3fYtNTkLReMxw6K
	RoJAhTy+5lGdr0F5i+tK13ulcSi/4hml+/LHvbf+D4q0J+LIOfPcIwhtkMw0+YzWL+NEDfK0cfGpD
	XXCSe7rShL3quq9uXbTbMNAnG8YVAS4QurPKF0KKupdjkJVQfqvx91EnX9liCEv+NvCI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24916.30767.245601.814518@mariner.uk.xensource.com>
Date: Wed, 29 Sep 2021 15:29:03 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Daniel De Graaf <dgdegra@tycho.nsa.gov>,
    "Daniel P.  Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH v2] build: add --full to version.sh to guess $(XEN_FULLVERSION)
In-Reply-To: <20210909143306.466836-1-anthony.perard@citrix.com>
References: <20210909143306.466836-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("[XEN PATCH v2] build: add --full to version.sh to guess $(XEN_FULLVERSION)"):
> Running $(MAKE) like that in a $(shell ) while parsing the Makefile
> doesn't work reliably. In some case, make will complain with
> "jobserver unavailable: using -j1.  Add '+' to parent make rule.".
> Also, it isn't possible to distinguish between the output produced by
> the target "xenversion" and `make`'s own output.
> 
> Instead of running make, this patch "improve" `version.sh` to try to
> guess the output of `make xenversion`.
> 
> In order to have version.sh works in more scenario, it will use
> XEN_EXTRAVERSION and XEN_VENDORVERSION from the environment when
> present. As for the cases were those two variables are overridden by a
> make command line arguments, we export them when invoking version.sh
> via a new $(XEN_FULLVERSION) macro.
> 
> That should hopefully get us to having ./version.sh returning the same
> value that `make xenversion` would.
> 
> This fix GitLab CI's build job "debian-unstable-gcc-arm64".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>

