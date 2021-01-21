Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC02FED60
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 15:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72138.129613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bIZ-0001yA-Q7; Thu, 21 Jan 2021 14:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72138.129613; Thu, 21 Jan 2021 14:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bIZ-0001xi-Mc; Thu, 21 Jan 2021 14:50:59 +0000
Received: by outflank-mailman (input) for mailman id 72138;
 Thu, 21 Jan 2021 14:50:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2bIY-0001xb-1k
 for xen-devel@lists.xen.org; Thu, 21 Jan 2021 14:50:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c41b2c8e-b516-49c6-96b3-8373b79d1643;
 Thu, 21 Jan 2021 14:50:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E7BAAC9B;
 Thu, 21 Jan 2021 14:50:56 +0000 (UTC)
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
X-Inumbo-ID: c41b2c8e-b516-49c6-96b3-8373b79d1643
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611240656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A1zyQnVHKyngpdnhGOdZ3lDA4VPKoYgpDy46l1ttDW0=;
	b=s6SzouoieHKOWij0HM+MS16jCsIvZ19ZJ7E3tKMvw7KQxmdsgDihmQw+gHvBTLwgO+/7+W
	VpAYRV9rllBPttYHjg6ghVHtKVi6k42SPVLchzYiAofmPkTljCYDouPMvtbb8sBZBZW5rp
	gvTIWB1gS1ezWkkdJRWsVfn1e3q+qd0=
Subject: Re: Xen Security Advisory 360 v1 - IRQ vector leak on x86
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xen.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <E1l2afg-0006PK-Gj@xenbits.xenproject.org>
 <20210121142012.GB1592@mail-itl>
 <20210121143440.xucstdfws4ymtete@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d073bc8-418e-2b8d-9ff7-76b932f829b1@suse.com>
Date: Thu, 21 Jan 2021 15:50:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121143440.xucstdfws4ymtete@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.01.2021 15:34, Roger Pau Monné wrote:
> On Thu, Jan 21, 2021 at 03:20:12PM +0100, Marek Marczykowski-Górecki wrote:
>> On Thu, Jan 21, 2021 at 02:10:48PM +0000, Xen.org security team wrote:
>>>                     Xen Security Advisory XSA-360
>>>
>>>                         IRQ vector leak on x86
>>>
>>> ISSUE DESCRIPTION
>>> =================
>>>
>>> A x86 HVM guest with PCI pass through devices can force the allocation
>>> of all IDT vectors on the system by rebooting itself with MSI or MSI-X
>>> capabilities enabled and entries setup.
>>
>> (...)
>>
>>> MITIGATION
>>> ==========
>>>
>>> Not running HVM guests with PCI pass through devices will avoid the
>>> vulnerability.  Note that even non-malicious guests can trigger this
>>> vulnerability as part of normal operation.
>>
>> Does the 'on_reboot="destroy"' mitigate the issue too? Or on_soft_reset?
> 
> Kind of. Note you will still leak the in use vectors when the guest is
> destroyed, but that would prevent the guest from entering a reboot
> loop and exhausting all vectors on the system unless the admin starts
> it again.
> 
> In that case I think the premise of a guest 'rebooting itself' doesn't
> apply anymore, since the guest won't be able to perform such
> operation.

And how exactly would an admin tell a guest from rebooting for
fair reasons from one rebooting for malicious reasons? To me,
setting 'on_reboot="destroy"' would imply there's then some
other mechanism to restart the guest (possibly with some delay),
or else a reboot attempt by this guest would effectively be a
DoS to its users.

Jan

