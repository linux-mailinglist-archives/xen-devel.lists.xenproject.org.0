Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DE83556A9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 16:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106037.202769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmih-0000Qb-12; Tue, 06 Apr 2021 14:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106037.202769; Tue, 06 Apr 2021 14:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmig-0000QC-Ty; Tue, 06 Apr 2021 14:30:18 +0000
Received: by outflank-mailman (input) for mailman id 106037;
 Tue, 06 Apr 2021 14:30:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTmif-0000Q7-FH
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 14:30:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTmiS-00005O-9w; Tue, 06 Apr 2021 14:30:04 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTmiR-0002ru-Uw; Tue, 06 Apr 2021 14:30:04 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4VuphpQoTljxn36MwFBsTKWynD9cpY1d7cs+Iyo0pFc=; b=F2LFwi0WNB61Gf5ADYVva2d5Ze
	0VxoWjxhbTj7R1zHTtjTbWOxsKSykkFZ4EHrUzWO8jlw36u4wVxfQKUjwrPk4eA0sdO8c06mPL2cd
	RO5fdJ+ZQlbGiurn0pD/qzcO71SO43TiE92QGPxBlNDiufR8KGdvS2SIAB7qjlEJ1/7E=;
Subject: Re: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <cover.1617702520.git.rahul.singh@arm.com>
 <4471ba4fffc8a0cef24cc11314fc788334f85ccc.1617702520.git.rahul.singh@arm.com>
 <YGxsfdK9GEefLgAv@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <75848a0d-d060-6a8b-5ebc-7376ffc14af0@xen.org>
Date: Tue, 6 Apr 2021 15:30:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGxsfdK9GEefLgAv@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 06/04/2021 15:13, Roger Pau Monné wrote:
> On Tue, Apr 06, 2021 at 12:39:11PM +0100, Rahul Singh wrote:
>> MSI support is not implemented for ARM architecture but it is enabled
>> for x86 architecture and referenced in common passthrough/pci.c code.
>>
>> Therefore introducing the new flag to gate the MSI code for ARM in
>> common code to avoid compilation error when HAS_PCI is enabled for ARM.
> 
> Is such option really interesting long term?
> 
> IIRC PCI Express mandates MSI support, at which point I don't see much
> value in being able to compile out the MSI support.

I am pretty sure there are board out with PCI support but no MSI 
support. Anyway, even if the spec may mandate it...

> 
> So while maybe helpful for Arm PCI efforts ATM, I'm not sure it
> warrants a Kconfig option, I would rather see Arm introduce dummy
> helpers for the missing functionality, even if unimplemented at the
> moment.

... from my understanding, most of (if not all) the MSI code is not very 
useful on Arm when using the GICv3 ITS.

The GICv3 ITS will do the isolation for you and therefore we should not 
need to keep track of the state at the vPCI level.

So I think we want to be able to compile out the code if not used. That 
said, I think providing stub would be better to avoid multiple #ifdef in 
the same function.

Cheers,

-- 
Julien Grall

