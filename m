Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114E2198DD7
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 10:00:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJBmV-0003HY-6e; Tue, 31 Mar 2020 07:57:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJBmU-0003HT-6S
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 07:57:54 +0000
X-Inumbo-ID: 51ba199d-7325-11ea-ba05-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51ba199d-7325-11ea-ba05-12813bfff9fa;
 Tue, 31 Mar 2020 07:57:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AD1B5ACB8;
 Tue, 31 Mar 2020 07:57:51 +0000 (UTC)
Subject: Re: [PATCH V7] x86/altp2m: Hypercall to set altp2m view visibility
To: Isaila Alexandru <aisaila@bitdefender.com>
References: <20200330065434.5952-1-aisaila@bitdefender.com>
 <47e96f1f-067d-470e-4796-b92956ca65bf@suse.com>
 <182c7207-6fd9-5b9b-0c99-ea31ee29b8d6@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a16dca7-d281-04e4-0d22-d2a32e90b841@suse.com>
Date: Tue, 31 Mar 2020 09:57:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <182c7207-6fd9-5b9b-0c99-ea31ee29b8d6@bitdefender.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 09:54, Isaila Alexandru wrote:
> 
> 
> On 31.03.2020 10:43, Jan Beulich wrote:
>> On 30.03.2020 08:54, Alexandru Isaila wrote:
>>> At this moment a guest can call vmfunc to change the altp2m view. This
>>> should be limited in order to avoid any unwanted view switch.
>>>
>>> The new xc_altp2m_set_visibility() solves this by making views invisible
>>> to vmfunc.
>>> This is done by having a separate arch.altp2m_working_eptp that is
>>> populated and made invalid in the same places as altp2m_eptp. This is
>>> written to EPTP_LIST_ADDR.
>>> The views are made in/visible by marking them with INVALID_MFN or
>>> copying them back from altp2m_eptp.
>>> To have consistency the visibility also applies to
>>> p2m_switch_domain_altp2m_by_id().
>>>
>>> The usage of this hypercall is aimed at dom0 having a logic with a number of views
>>> created and at some time there is a need to be sure that only some of the views
>>> can be switched, saving the rest and making them visible when the time
>>> is right.
>>>
>>> Note: If altp2m mode is set to mixed the guest is able to change the view
>>> visibility and then call vmfunc.
>>>
>>> Signed-off-by: Alexandru Isaila <aisaila@bitdefender.com>
>>
>> For v6 I did provide a hypervisor side R-b; I didn't think ...
> 
> No you didn't.

https://lists.xenproject.org/archives/html/xen-devel/2020-03/msg00145.html

Jan

