Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3F62B0434
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 12:45:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25729.53688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdB2g-00042H-DP; Thu, 12 Nov 2020 11:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25729.53688; Thu, 12 Nov 2020 11:45:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdB2g-00041s-9N; Thu, 12 Nov 2020 11:45:30 +0000
Received: by outflank-mailman (input) for mailman id 25729;
 Thu, 12 Nov 2020 11:45:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdB2f-00041n-1d
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:45:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1746a42-f8f6-4254-9aa5-f0a225258117;
 Thu, 12 Nov 2020 11:45:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84525ACC5;
 Thu, 12 Nov 2020 11:45:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdB2f-00041n-1d
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:45:29 +0000
X-Inumbo-ID: e1746a42-f8f6-4254-9aa5-f0a225258117
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e1746a42-f8f6-4254-9aa5-f0a225258117;
	Thu, 12 Nov 2020 11:45:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605181527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YFJm6E5HGuad0fA181svJ/18xIJWlypV9xdVgzVR5Lc=;
	b=RY51nvZDc2/5azrSsHSumcFNTniZw3dC1G4TwWzOXFiYJOyfiU53XdHGH3LGYeQ+3bT4BD
	xLYI5qifGiunAJ2eroXSgiIrkKBPqvteKOz/HH/RFtOtZJKPH5rxbDzYIUQQ3cqNhJK6B9
	eGlTYq+k7eIoTLGX7GVVrE20dY6cmfI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 84525ACC5;
	Thu, 12 Nov 2020 11:45:27 +0000 (UTC)
Subject: Re: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved
 function names
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, Paul Durrant <paul@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-13-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e3064b77-71c3-9d8d-2324-6839895101f4@suse.com>
Date: Thu, 12 Nov 2020 12:45:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-13-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch removes "hvm" prefixes and infixes from IOREQ
> related function names in the common code.

AT least some of the functions touched here would be nice to be
moved to a more consistent new naming scheme right away, to
avoid having to touch all the same places again. I guess ioreq
server functions would be nice to all start with ioreq_server_
and ioreq functions to all start with ioreq_. E.g. ioreq_send()
and ioreq_server_select().

Paul, thoughts?

Jan

