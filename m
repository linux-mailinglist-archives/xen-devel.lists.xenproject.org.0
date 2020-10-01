Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD67027FBDD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 10:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117.3671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNuGu-0003r3-Qk; Thu, 01 Oct 2020 08:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117.3671; Thu, 01 Oct 2020 08:49:04 +0000
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
	id 1kNuGu-0003qe-Mz; Thu, 01 Oct 2020 08:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1117;
 Thu, 01 Oct 2020 08:49:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNuGt-0003qZ-ED
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:49:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb6f5109-3802-4d8b-9998-06c7722580c8;
 Thu, 01 Oct 2020 08:49:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9DCD0B112;
 Thu,  1 Oct 2020 08:49:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNuGt-0003qZ-ED
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:49:03 +0000
X-Inumbo-ID: bb6f5109-3802-4d8b-9998-06c7722580c8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bb6f5109-3802-4d8b-9998-06c7722580c8;
	Thu, 01 Oct 2020 08:49:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601542141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+MoeYfLNvInenjJr0Ucx2IezWcBplPP6iKHM4JqmFo=;
	b=KQrtL8cA7Z7RMntCRqwoJETZNHAydfERJfiIfXpFpAiI0Gu2Q5H2T2V8L2WTpyHs2iESX4
	Srguj0bhs/VgXQPpkZsKfV4/LngPNN66SEpHJulg8Baj82FNwx3rTj5fJ5Z/X1NYcj8VcD
	GHGs/QMgs+rDLCyk7PLCN+w4Sm2MwhY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9DCD0B112;
	Thu,  1 Oct 2020 08:49:01 +0000 (UTC)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Julien Grall <julien@xen.org>
Cc: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
 paul@xen.org, 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Kevin Tian'
 <kevin.tian@intel.com>, 'Tim Deegan' <tim@xen.org>,
 'Julien Grall' <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <3997a705-ccb1-4b8f-41ca-c5507360c759@xen.org>
 <000201d69314$97bd8fa0$c738aee0$@xen.org>
 <c9131bce-f028-2824-9ffc-b4db08017569@gmail.com>
 <2cbe7efd-f356-0f1b-0bb1-bfb2243f180c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f768df9-6e28-a0ed-92e7-b17303c24996@suse.com>
Date: Thu, 1 Oct 2020 10:49:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2cbe7efd-f356-0f1b-0bb1-bfb2243f180c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 19:47, Julien Grall wrote:
> Regarding the fix itself, I am not sure what sort of synchronization we 
> can do. Are you suggesting to wait for the I/O to complete? If so, how 
> do we handle the case the IOREQ server died?

In simple cases retrying the entire request may be an option. However,
if the server died after some parts of a multi-part operation were
done already, I guess the resulting loss of state is bad enough to
warrant crashing the guest. This shouldn't be much different from e.g.
a device disappearing from a bare metal system - any partial I/O done
to/from it will leave the machine in an unpredictable state, which it
may be too difficult to recover from without rebooting. (Of course,
staying with this analogue, it may also be okay to simple consider
the operation "complete", leaving it to the guest to recover. The
main issue on the hypervisor side then would be to ensure we don't
expose any uninitialized [due to not having got written to] data to
the guest.)

Jan

