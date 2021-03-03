Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE31132B917
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 17:10:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92900.175168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU4h-0007iX-IB; Wed, 03 Mar 2021 16:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92900.175168; Wed, 03 Mar 2021 16:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU4h-0007i8-Et; Wed, 03 Mar 2021 16:10:11 +0000
Received: by outflank-mailman (input) for mailman id 92900;
 Wed, 03 Mar 2021 16:10:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU4g-0007i3-DO
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:10:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU4g-00041a-CZ
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:10:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU4g-0005fT-Bk
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:10:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHU4d-0002Ve-1T; Wed, 03 Mar 2021 16:10:07 +0000
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
	bh=DVLSgcK5zaBMulebW4DcYpNeqdnCO5So83EVAKndzdQ=; b=k3uk8JwIhG95qcDjQZwzIQl+sc
	HsTBzByX4fsn4C8sIyktNWb7ilro/HoIUToCjuNZogDoWtUuwlh/WytpHAkknR6YMeC10pLDVM4Tt
	+EauS0byOp1dxdINMVdPMSvPnUlYrrxyo/7iwNdcx1hJBFr2tFYFdWKK9AKIiIxXCkNU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.46302.755089.845426@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 16:10:06 +0000
To: Norbert Manthey <nmanthey@amazon.de>
Cc: <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Julien Grall <jgrall@amazon.co.uk>,
    Michael Kurth <mku@amazon.de>
Subject: Re: [PATCH XENSTORE v1 04/10] xenstore_client: handle memory on error
In-Reply-To: <20210226144144.9252-5-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
	<20210226144144.9252-5-nmanthey@amazon.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Norbert Manthey writes ("[PATCH XENSTORE v1 04/10] xenstore_client: handle memory on error"):
> In case a command fails, also free the memory. As this is for the CLI
> client, currently the leaked memory is freed right after receiving the
> error, as the application terminates next.
> 
> Similarly, if the allocation fails, do not use the NULL pointer
> afterwards, but instead error out.

I think this is not for 4.15.

Thanks,
Ian.

