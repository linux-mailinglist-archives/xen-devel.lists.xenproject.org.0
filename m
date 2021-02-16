Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF11331CD8C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 17:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85903.160761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2sU-0000DF-LM; Tue, 16 Feb 2021 16:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85903.160761; Tue, 16 Feb 2021 16:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2sU-0000Cq-I3; Tue, 16 Feb 2021 16:07:06 +0000
Received: by outflank-mailman (input) for mailman id 85903;
 Tue, 16 Feb 2021 16:07:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2sS-0000CQ-VD
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:07:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2sS-00047J-Qz
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:07:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2sS-0003qC-Pi
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:07:04 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC2sP-0000j7-Kn; Tue, 16 Feb 2021 16:07:01 +0000
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
	bh=KPxoidAHBajHVmadRtmD47OFaWAuEME/xon5R2DQX0U=; b=Bl7xw4wGHCPuYX7E7xLSZsQ+8i
	b5I+II1XYD4QzBojXS/i7aHWta9zLrFQraCGyydibWwtUxRDe/FUkZWeAz9KkbhYhDBsmTc2G3yVh
	uQn+Td4mU/k3PtkLdUEvgk5ioj+pFF2nTG5LtwEFlBPiqUPpwaeK3QrY79Ley1TKpuC4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.60837.362896.565993@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:07:01 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 04/10] tools/libxl: Fix uninitialised variable in libxl__domain_get_device_model_uid()
In-Reply-To: <20210212153953.4582-5-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-5-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 04/10] tools/libxl: Fix uninitialised variable in libxl__domain_get_device_model_uid()"):
> The logic is sufficiently complicated I can't figure out if the complain is
> legitimate or not.  There is exactly one path wanting kill_by_uid set to true,
> so default it to false and drop the existing workaround for this problem at
> other optimisation levels.

The place where it's used is here:

    if (!rc && user) {
            state->dm_runas = user;
                    if (kill_by_uid)
                                state->dm_kill_uid = GCSPRINTF("%ld",...
        
This is gated by !rc.  So for this to be used uninitialised, we'd have
to get here with rc==0 but uninitialised kill_by_uid.

The label `out` is preceded by a nonzero assignment to rc.

All the `goto out` are preceded by either (i) nonzero assignment to
rc, or (ii) assignment to kill_by_uid and setting rc=0.

So the compiler is wrong.

If only we had sum types.

In the absence of sum types I suggest the following restructuring:
Change all the `rc = ERROR...; goto out;` to `goto err` and make `goto
out` be the success path only.

Ian.

