Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0D82D3E5B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 10:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48050.84998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmvcP-00088M-5I; Wed, 09 Dec 2020 09:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48050.84998; Wed, 09 Dec 2020 09:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmvcP-00087z-1v; Wed, 09 Dec 2020 09:18:41 +0000
Received: by outflank-mailman (input) for mailman id 48050;
 Wed, 09 Dec 2020 09:18:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmvcN-00087u-3h
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 09:18:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmvcJ-0003J4-O2; Wed, 09 Dec 2020 09:18:35 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmvcJ-0001sv-EN; Wed, 09 Dec 2020 09:18:35 +0000
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
	bh=DAahiC9NoYOt+ab4ncTjAy1i0GArZVsp5vJUbWwC1qM=; b=ovHP4iWyC2xDcIZMJVqBEoN5kz
	M2SiC4Jjt/UMig7sj3mL/5VMo3nb0UQ7qxKXHhK5Cn+wxdj8asRo/8jdQiWEbM/mzoQhwSouIb2Za
	g+olcCJ0kBnTLlca2xjT2abiEw7gv5lnSuVbP5uEmDLNSzQ8xCaJMJYAirxEw829vUjA=;
Subject: Re: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com>
 <a67bb114-a4a9-651a-338b-123b350ac4b3@xen.org>
 <9C890E87-D438-4232-8647-8EC64FF32C42@arm.com>
 <bb6a710e-4a7a-5db2-fece-b5845e06d092@xen.org>
 <9F9A955B-815C-4771-9EC0-073E9CF3E995@arm.com>
 <156ab0f5-e46d-6b96-7ff1-28ad3a748950@xen.org>
 <alpine.DEB.2.21.2012081711200.20986@sstabellini-ThinkPad-T480s>
 <BE0F99C1-AAA7-4EC7-A800-7CDEA24177DF@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <47bf1e5d-9e9e-d455-f6d8-5ddec0367ef2@xen.org>
Date: Wed, 9 Dec 2020 09:18:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <BE0F99C1-AAA7-4EC7-A800-7CDEA24177DF@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 09/12/2020 07:55, Bertrand Marquis wrote:
> Hi,

Hi,

> I also agree with the issue on the spinlock but we have no equivalent of something
> looking like a mutex for now in Xen so this would require some major redesign and
> will take us far from the linux driver.

I agree that keeping the Xen implementation close to the Linux one is 
important. However, I view this has a the secondary goal. The primary 
goal is to have a safe and secure driver.

If it means introducing a new set of lock or diverging from Linux, then 
so it be.

> 
> I would suggest to add a comment before this part of the code with a “TODO” so that
> it is clear inside the code.
> We could also add some comment in Kconfig to mention this possible “faulty” behaviour.

I think it would be enough to write in the Kconfig that the driver is 
"experimental and should not be used in production".

Ideally, I would like a list of known issues for the driver (could be in 
the cover letter or/and at the top of the source file) so we can track 
what's missing to get it supported.

Cheers,

-- 
Julien Grall

