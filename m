Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911551EE289
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 12:34:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgnCC-0000bu-Qm; Thu, 04 Jun 2020 10:34:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jgnCB-0000bm-BK
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 10:33:59 +0000
X-Inumbo-ID: e5b40e6c-a64e-11ea-ae5d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5b40e6c-a64e-11ea-ae5d-12813bfff9fa;
 Thu, 04 Jun 2020 10:33:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 90A30ABCF;
 Thu,  4 Jun 2020 10:34:00 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc NPT
 faults immediately
To: paul@xen.org
References: <1591224108-564-1-git-send-email-igor.druzhinin@citrix.com>
 <006401d63a44$a27349e0$e759dda0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4d1da8eb-a06e-c97a-09a0-e84070dc5ec8@suse.com>
Date: Thu, 4 Jun 2020 12:33:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <006401d63a44$a27349e0$e759dda0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.06.2020 09:49, Paul Durrant wrote:
>> -----Original Message-----
>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Sent: 03 June 2020 23:42
>> To: xen-devel@lists.xenproject.org
>> Cc: jbeulich@suse.com; andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com;
>> george.dunlap@citrix.com; paul@xen.org; Igor Druzhinin <igor.druzhinin@citrix.com>
>> Subject: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc NPT faults immediately
>>
>> A recalculation NPT fault doesn't always require additional handling
>> in hvm_hap_nested_page_fault(), moreover in general case if there is no
>> explicit handling done there - the fault is wrongly considered fatal.
>>
>> This covers a specific case of migration with vGPU assigned which
>> uses direct MMIO mappings made by XEN_DOMCTL_memory_mapping hypercall:
>> at a moment log-dirty is enabled globally, recalculation is requested
>> for the whole guest memory including those mapped MMIO regions
> 
> I still think it is odd to put this in the commit comment since, as I
> said before, Xen ensures that this situation cannot happen at
> the moment.

Aiui Igor had replaced reference to passed-through devices by reference
to mere handing of an MMIO range to a guest. Are you saying we suppress
log-dirty enabling in this case as well? I didn't think we do:

    if ( has_arch_pdevs(d) && log_global )
    {
        /*
         * Refuse to turn on global log-dirty mode
         * if the domain is sharing the P2M with the IOMMU.
         */
        return -EINVAL;
    }

Seeing this code I wonder about the non-sharing case: If what the
comment says was true, the condition would need to change, but I
think it's the comment which is wrong, and we don't want global
log-dirty as long as an IOMMU is in use at all for a domain.

Jan

