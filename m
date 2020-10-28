Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91FD29D0C0
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 16:37:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13709.34441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXnVj-0006YT-ED; Wed, 28 Oct 2020 15:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13709.34441; Wed, 28 Oct 2020 15:37:15 +0000
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
	id 1kXnVj-0006Y4-AZ; Wed, 28 Oct 2020 15:37:15 +0000
Received: by outflank-mailman (input) for mailman id 13709;
 Wed, 28 Oct 2020 15:37:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXnVh-0006XK-Ok
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:37:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6a7d713-23b2-45f3-9d49-2ebdd3068012;
 Wed, 28 Oct 2020 15:37:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0E8BADF5;
 Wed, 28 Oct 2020 15:37:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXnVh-0006XK-Ok
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:37:13 +0000
X-Inumbo-ID: d6a7d713-23b2-45f3-9d49-2ebdd3068012
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d6a7d713-23b2-45f3-9d49-2ebdd3068012;
	Wed, 28 Oct 2020 15:37:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603899432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lgefu7BR1euqQczOJFI6qiOrCVTqTjJPUkUuvPBsnHY=;
	b=Myo5jgkCI1f+9XbsYHvKMeS3Ot6h0iyk5loqJEpJqsojarUDpSQyVE57uV04Z8gccFac6W
	tV8xNXgEZ4HVeu4JSA58//HFhyMcCPDJkt8uyvHVFdvwyN5xRcasIHstOPlMyidcBYTQX7
	d/ah5/dUHAQOi0KF5RIrGmEESd6aAks=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E0E8BADF5;
	Wed, 28 Oct 2020 15:37:11 +0000 (UTC)
Subject: Re: [PATCH v1 3/4] xen/pci: Move x86 specific code to x86 directory.
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <70029e8904170c4f19d9f521847050cd00c6e39d.1603731279.git.rahul.singh@arm.com>
 <301405a2-9ec1-847d-6f61-1067a225a3a9@suse.com>
 <4F4C34EE-7035-4931-9C65-13CCFEF52D18@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a1b3e93-2f24-d377-0753-313b3773efd8@suse.com>
Date: Wed, 28 Oct 2020 16:37:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4F4C34EE-7035-4931-9C65-13CCFEF52D18@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.10.2020 16:20, Rahul Singh wrote:
>> On 28 Oct 2020, at 11:51 am, Jan Beulich <jbeulich@suse.com> wrote:
>> On 26.10.2020 18:17, Rahul Singh wrote:
>>> +int arch_pci_release_devices(struct domain *d)
>>> +{
>>> +    return pci_clean_dpci_irqs(d);
>>> +}
>>
>> Why the extra function layer?
> 
> Is that ok if I rename the function pci_clean_dpci_irqs() to arch_pci_clean_pirqs() ?

I see no problem with you doing so.

Jan

