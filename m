Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 302CF57E22B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 15:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373224.605313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEsY9-0004o7-NQ; Fri, 22 Jul 2022 13:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373224.605313; Fri, 22 Jul 2022 13:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEsY9-0004lO-KQ; Fri, 22 Jul 2022 13:18:37 +0000
Received: by outflank-mailman (input) for mailman id 373224;
 Fri, 22 Jul 2022 13:18:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVTW=X3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oEsY8-0004lI-D9
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 13:18:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9673e80-09c0-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 15:18:35 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658495909825547.7375402127639;
 Fri, 22 Jul 2022 06:18:29 -0700 (PDT)
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
X-Inumbo-ID: c9673e80-09c0-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1658495911; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L6W8owW4oMEfYqZq3zJCxIdmscPmof7zK3n/FXGXM3WxSkTszR9VUl5KDGCjSgWP9uDnCkWMse5vGmLG+AQgkzWvDkXCMmbuHjCkbroj6q5vl1GxVolQMgKzYew4cfCUFmpKG6rnlpf6mp9e9/N7cQdAjiSQMlrvKDfenFSKeJs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658495911; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=2mi9QCDrdMzvMaCAfbcQVzTwqX6ZUDeJ0EiZEI1lqXg=; 
	b=D6IFtofJBR/KB8dK8IpShKlDP5+2RM9lSIs7El+jHvO+YJuZzzcbLQaP1BRZ80gmBgk+u0TimzZAjzqnppXiI+VyRzEXdMBm/7FVz34YGmO5JdCsSA4IV23UDPpdCkYJGkVE86l0c49EXc43apl9pQpQ6mDGHwvfAgyMRgaf7Og=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658495911;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2mi9QCDrdMzvMaCAfbcQVzTwqX6ZUDeJ0EiZEI1lqXg=;
	b=a+/SY8DG7AS9wUgru3xdULUfquQIpXOtStqfFZ8ICVt8BBBkRUn6E4FhXG52cB2M
	ZfdE+YsH9xH/2Bxs8hLfhVSy0kfsg8eW0vmo+tOiHTkIma+DvvWJv9GMMgSxkXn3Xyd
	gHpeCqLTns/AxSdXQRISCRKccrHve1gqfXCXcuME=
Message-ID: <c3323164-1b37-9949-3a2f-0e0df46ce690@apertussolutions.com>
Date: Fri, 22 Jul 2022 09:18:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 06/18] fdt: make fdt handling reusable across arch
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-7-dpsmith@apertussolutions.com>
 <ed9b1e17-6c44-0c59-138b-c1552df9eea8@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <ed9b1e17-6c44-0c59-138b-c1552df9eea8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 7/19/22 05:36, Jan Beulich wrote:
> On 06.07.2022 23:04, Daniel P. Smith wrote:
>> This refactors reusable code from Arm's bootfdt.c and device-tree.h that is
>> general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
>> introduced for when the ability of parsing DTB files is needed by a capability
>> such as hyperlaunch.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
>> ---
>>  xen/arch/arm/bootfdt.c        | 115 +----------------------------
>>  xen/common/Kconfig            |   4 ++
>>  xen/common/Makefile           |   3 +-
>>  xen/common/fdt.c              | 131 ++++++++++++++++++++++++++++++++++
>>  xen/include/xen/device_tree.h |  50 +------------
>>  xen/include/xen/fdt.h         |  79 ++++++++++++++++++++
>>  6 files changed, 218 insertions(+), 164 deletions(-)
>>  create mode 100644 xen/common/fdt.c
>>  create mode 100644 xen/include/xen/fdt.h
> 
> I think this wants to be accompanied by an update to ./MAINTAINERS,
> so maintainership doesn't silently transition to THE REST.

ack

> I further think that the moved code would want to have style adjusted
> to match present guidelines - I've noticed a number of u<N> uses which
> should be uint<N>_t. I didn't look closely to see whether other style
> violations are also retained in the moved code.

ack

v/r,
dps

