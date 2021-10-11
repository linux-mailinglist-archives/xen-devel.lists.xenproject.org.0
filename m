Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C826A428C97
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 14:07:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205899.361328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZu52-0002LS-Pv; Mon, 11 Oct 2021 12:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205899.361328; Mon, 11 Oct 2021 12:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZu52-0002Ik-Mj; Mon, 11 Oct 2021 12:06:56 +0000
Received: by outflank-mailman (input) for mailman id 205899;
 Mon, 11 Oct 2021 12:06:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tf9x=O7=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mZu50-0002I0-Cf
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 12:06:54 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b872abf9-2a8b-11ec-80d7-12813bfff9fa;
 Mon, 11 Oct 2021 12:06:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 272951063;
 Mon, 11 Oct 2021 05:06:53 -0700 (PDT)
Received: from [10.57.19.78] (unknown [10.57.19.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36D473F70D;
 Mon, 11 Oct 2021 05:06:50 -0700 (PDT)
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
X-Inumbo-ID: b872abf9-2a8b-11ec-80d7-12813bfff9fa
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andre.Przywara@arm.com, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <669869e3-3c99-49d1-26df-428334e0c68e@arm.com>
Date: Mon, 11 Oct 2021 14:06:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Roger,

On 11.10.2021 11:27, Roger Pau Monné wrote:
> On Wed, Oct 06, 2021 at 06:40:33PM +0100, Rahul Singh wrote:
>> Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
>> Reject the use of this new flag for x86 as VPCI is not supported for
>> DOMU guests for x86.
> 
> I don't like this approach, XEN_DOMCTL_CDF_vpci should be set for x86
> PVH dom0, like we do for any other CDF flags when Xen builds dom0.
> 
> Things like PVH vs PV get translated into CDF flags by create_dom0,
> and processed normally by the sanitise_domain_config logic, vPCI
> should be handled that way.
> 
> Do you think you could see about fixing this?
> 
> Thanks, Roger.
> 

As Rahul is on leave:
I agree with you. XEN_DOMCTL_CDF_vpci should be set in dom0_cfg.flags in create_dom0 for pvh.
We can do such fix in a new patch together with adding physcap for vpci.

Cheers,
Michal

