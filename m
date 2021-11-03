Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81804440AA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 12:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220836.382256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miEYJ-0007lk-Rf; Wed, 03 Nov 2021 11:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220836.382256; Wed, 03 Nov 2021 11:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miEYJ-0007jE-OJ; Wed, 03 Nov 2021 11:35:35 +0000
Received: by outflank-mailman (input) for mailman id 220836;
 Wed, 03 Nov 2021 11:35:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MX4X=PW=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1miEYH-0007j5-It
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 11:35:33 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d8322479-a767-48ac-b4e4-ded55c68ab86;
 Wed, 03 Nov 2021 11:35:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4077D6E;
 Wed,  3 Nov 2021 04:35:31 -0700 (PDT)
Received: from [10.57.22.11] (unknown [10.57.22.11])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B167F3F7B4;
 Wed,  3 Nov 2021 04:35:29 -0700 (PDT)
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
X-Inumbo-ID: d8322479-a767-48ac-b4e4-ded55c68ab86
Subject: Re: [PATCH v2 00/15] xen: drop hypercall function tables
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <20211101152015.28488-1-jgross@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <f9f3aed5-46b3-4eb0-0cb4-1303eb42a454@arm.com>
Date: Wed, 3 Nov 2021 12:35:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01.11.2021 16:20, Juergen Gross wrote:
> In order to avoid indirect function calls on the hypercall path as
> much as possible this series is removing the hypercall function tables
> and is replacing the hypercall handler calls via the function array
> by automatically generated call macros.
> 
> Another by-product of generating the call macros is the automatic
> generating of the hypercall handler prototypes from the same data base
> which is used to generate the macros.
> 
> This has the additional advantage of using type safe calls of the
> handlers and to ensure related handler (e.g. PV and HVM ones) share
> the same prototypes.
> 
> A very brief performance test (parallel build of the Xen hypervisor
> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
> the performance with the patches applied. The test was performed using
> a PV and a PVH guest.
> 
> Changes in V2:
> - new patches 6, 14, 15
> - patch 7: support hypercall priorities for faster code
> - comments addressed

For the ARM part:
Apart from the issue I found and reported in patch 7/15, the build was successful.
I tested the following basics also successfully:
-booting a dom0
-booting domUs
-networking between guest and dom0 using NAT
-stressing hypercall xen_version

so,

Tested-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

