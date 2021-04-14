Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F354F35F30D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 13:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110540.210994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWeAU-0001fd-FX; Wed, 14 Apr 2021 11:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110540.210994; Wed, 14 Apr 2021 11:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWeAU-0001fE-CQ; Wed, 14 Apr 2021 11:58:50 +0000
Received: by outflank-mailman (input) for mailman id 110540;
 Wed, 14 Apr 2021 11:58:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQnP=JL=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1lWeAT-0001f9-7F
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 11:58:49 +0000
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8019497-9c36-491b-b146-2eb922696768;
 Wed, 14 Apr 2021 11:58:46 +0000 (UTC)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 04:58:41 -0700
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 04:58:38 -0700
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
X-Inumbo-ID: f8019497-9c36-491b-b146-2eb922696768
IronPort-SDR: r0+/vT+D/+aLk1mUQ9DqFub21BRr7h28/Ebrrx5awxfsIjMSxyUD+qzoGyIRvEOF5+mK38Putk
 OMsRhYkvTSIQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="279934442"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; 
   d="scan'208";a="279934442"
IronPort-SDR: B38S8vVuqKzwYdq23hXPr8Sm0GFo+06Lx9MbaHDNBCb0zeb9hN++yIxTBZgCk3zpSr0i6vHTFq
 qSAMEHX5ekDA==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; 
   d="scan'208";a="424708734"
Date: Wed, 14 Apr 2021 20:02:49 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] VT-d: Don't assume register-based invalidation is
 always supported
Message-ID: <20210414120248.GA29028@gao-cwp>
References: <20210414005526.36760-1-chao.gao@intel.com>
 <568f7b59-57e0-7daf-c27d-b771869209c4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568f7b59-57e0-7daf-c27d-b771869209c4@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Wed, Apr 14, 2021 at 12:07:02PM +0200, Jan Beulich wrote:
>On 14.04.2021 02:55, Chao Gao wrote:
>> According to Intel VT-d SPEC rev3.3 Section 6.5, Register-based Invalidation
>> isn't supported by Intel VT-d version 6 and beyond.
>> 
>> This hardware change impacts following two scenarios: admin can disable
>> queued invalidation via 'qinval' cmdline and use register-based interface;
>> VT-d switches to register-based invalidation when queued invalidation needs
>> to be disabled, for example, during disabling x2apic or during system
>> suspension.
>> 
>> To deal with this hardware change, if register-based invalidation isn't
>> supported, queued invalidation cannot be disabled through Xen cmdline; and
>> if queued invalidation has to be disabled temporarily in some scenarios,
>> VT-d won't switch to register-based interface but use some dummy functions
>> to catch errors in case there is any invalidation request issued when queued
>> invalidation is disabled.
>> 
>> Signed-off-by: Chao Gao <chao.gao@intel.com>
>> ---
>> I only tested Xen boot with qinval/no-qinval. I also want to do system
>> suspension and resumption to see if any unexpected error. But I don't
>> know how to trigger them. Any recommendation?
>
>Iirc, if your distro doesn't support a proper interface for this, it's
>as simple as "echo mem >/sys/power/state".

Thanks. I will give it a try. And all your comments make a lot of sense.
Will fix all of them in the next version.

Chao

