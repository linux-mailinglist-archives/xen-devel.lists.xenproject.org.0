Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA2B359778
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 10:16:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107680.205811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUmJf-0007fD-JA; Fri, 09 Apr 2021 08:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107680.205811; Fri, 09 Apr 2021 08:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUmJf-0007eo-Fv; Fri, 09 Apr 2021 08:16:35 +0000
Received: by outflank-mailman (input) for mailman id 107680;
 Fri, 09 Apr 2021 08:16:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rPLO=JG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUmJd-0007ej-Nb
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 08:16:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47bb7726-d768-411c-81e5-a53ef148c778;
 Fri, 09 Apr 2021 08:16:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19461AFF2;
 Fri,  9 Apr 2021 08:16:32 +0000 (UTC)
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
X-Inumbo-ID: 47bb7726-d768-411c-81e5-a53ef148c778
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617956192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1mNZEOqQAy+ATL6Tydb56njuwQFMfru48PyX5E2zoGw=;
	b=EfcJxKCbjbZHzaaePt9zcKCLHbOVU798Xe+sl/ore9ksJspcKUdg2EEnV9+JHHFnrRzEJ5
	rSFo8adaDEf1p0VYJNlTB+DQr2KP9/ZEdjEmWVj7ehvR5osqb2Lwkc/msVDk1yNnITOE1v
	xiHcwB7P2bnfKJfi6VtK/v8juaSpXvA=
Subject: Re: [PATCH 1/3] xen-pciback: redo VF placement in the virtual
 topology
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
 <32d6a8d4-c06f-7fe0-1376-4b80fac8c6de@suse.com>
 <b41663ff-6a90-877d-9cd3-7e052c28eb6a@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e39de85-1b03-0fb4-805a-69a16bbaafa6@suse.com>
Date: Fri, 9 Apr 2021 10:16:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b41663ff-6a90-877d-9cd3-7e052c28eb6a@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.04.2021 00:28, Boris Ostrovsky wrote:
> 
> On 4/7/21 10:37 AM, Jan Beulich wrote:
>> The commit referenced below was incomplete: It merely affected what
>> would get written to the vdev-<N> xenstore node. The guest would still
>> find the function at the original function number as long as 
>> __xen_pcibk_get_pci_dev() wouldn't be in sync. The same goes for AER wrt
>> __xen_pcibk_get_pcifront_dev().
>>
>> Undo overriding the function to zero and instead make sure that VFs at
>> function zero remain alone in their slot. This has the added benefit of
>> improving overall capacity, considering that there's only a total of 32
>> slots available right now (PCI segment and bus can both only ever be
>> zero at present).
>>
>> Fixes: 8a5248fe10b1 ("xen PV passthru: assign SR-IOV virtual functions to separate virtual slots")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Cc: stable@vger.kernel.org
>> ---
>> Like the original change this has the effect of changing where devices
>> would appear in the guest, when there are multiple of them. I don't see
>> an immediate problem with this, but if there is we may need to reduce
>> the effect of the change.
>> Taking into account, besides the described breakage, how xen-pcifront's
>> pcifront_scan_bus() works, I also wonder what problem it was in the
>> first place that needed fixing. It may therefore also be worth to
>> consider simply reverting the original change.
> 
> 
> Perhaps this is no longer a problem, it's been 9 years since that patch. Have you tried reverting to 8a5248fe10b101104d92d01438f918e899414fd1~1 and testing that?

Well, no, for the simple reason that I don't really understand how that
change was meant to make a difference. Hence while simply reverting may
be an option, it's not something I would want to suggest myself (simply
because I couldn't fully justify doing so).

Jan

