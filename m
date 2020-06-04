Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9EC1EE2DF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 13:00:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgnaz-0002jr-Gk; Thu, 04 Jun 2020 10:59:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lkaD=7R=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jgnay-0002jm-3h
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 10:59:36 +0000
X-Inumbo-ID: 794d7688-a652-11ea-81bc-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 794d7688-a652-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 10:59:34 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XVxB87/Z9g5o5YKbU2OBpRABk1sML0trbpWTiJ0zUHsznL9Ul24n3cKKc0zfuvprxY67muag5Y
 rJCOnGelI58TqsyAyn3HtL9r06Cxf4y0tZsiepM8xymJkhbeOTkYnCdueP24ZWPtCMYwxYj0x2
 k4p76QZ1y6a63AQEQ/WVWxaJZH2apWQfbqeasWfw7DV/abLRbEtnPwNKXKYvWv+1q5nCgGEGQr
 UmqhgAXukFApC1qH0U1bvfNK4gE0VFpPQO22vphqQcfC/eINoigF8Si6oqnm3XXJFNAiDvZZbT
 1r0=
X-SBRS: 2.7
X-MesageID: 19502629
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,472,1583211600"; d="scan'208";a="19502629"
Subject: Re: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc NPT
 faults immediately
To: <paul@xen.org>, 'Jan Beulich' <jbeulich@suse.com>
References: <1591224108-564-1-git-send-email-igor.druzhinin@citrix.com>
 <006401d63a44$a27349e0$e759dda0$@xen.org>
 <4d1da8eb-a06e-c97a-09a0-e84070dc5ec8@suse.com>
 <000f01d63a5d$fe3787f0$faa697d0$@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <caf77909-cc09-b281-a9ab-a4e8c83cf397@citrix.com>
Date: Thu, 4 Jun 2020 11:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <000f01d63a5d$fe3787f0$faa697d0$@xen.org>
Content-Type: text/plain; charset="utf-8"
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 george.dunlap@citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/06/2020 11:50, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 04 June 2020 11:34
>> To: paul@xen.org
>> Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>; xen-devel@lists.xenproject.org;
>> andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com; george.dunlap@citrix.com
>> Subject: Re: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc NPT faults immediately
>>
>> On 04.06.2020 09:49, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> Sent: 03 June 2020 23:42
>>>> To: xen-devel@lists.xenproject.org
>>>> Cc: jbeulich@suse.com; andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com;
>>>> george.dunlap@citrix.com; paul@xen.org; Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> Subject: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc NPT faults immediately
>>>>
>>>> A recalculation NPT fault doesn't always require additional handling
>>>> in hvm_hap_nested_page_fault(), moreover in general case if there is no
>>>> explicit handling done there - the fault is wrongly considered fatal.
>>>>
>>>> This covers a specific case of migration with vGPU assigned which
>>>> uses direct MMIO mappings made by XEN_DOMCTL_memory_mapping hypercall:
>>>> at a moment log-dirty is enabled globally, recalculation is requested
>>>> for the whole guest memory including those mapped MMIO regions
>>>
>>> I still think it is odd to put this in the commit comment since, as I
>>> said before, Xen ensures that this situation cannot happen at
>>> the moment.
>>
>> Aiui Igor had replaced reference to passed-through devices by reference
>> to mere handing of an MMIO range to a guest. Are you saying we suppress
>> log-dirty enabling in this case as well? I didn't think we do:
> 
> No, but the comment says "migration with vGPU *assigned*" (my emphasis), which surely means has_arch_pdevs() will be true.

You may replace it with 'associated' or something if you don't like this word.

>>
>>     if ( has_arch_pdevs(d) && log_global )
>>     {
>>         /*
>>          * Refuse to turn on global log-dirty mode
>>          * if the domain is sharing the P2M with the IOMMU.
>>          */
>>         return -EINVAL;
>>     }
>>
>> Seeing this code I wonder about the non-sharing case: If what the
>> comment says was true, the condition would need to change, but I
>> think it's the comment which is wrong, and we don't want global
>> log-dirty as long as an IOMMU is in use at all for a domain.
> 
> I think is the comment that is correct, not the condition. It is only when using shared EPT that enabling logdirty is clearly an unsafe thing to do. Using sync-ed IOMMU mappings should be ok.

It seems that the case of simple MMIO mappings made without IOMMU being
enabled for a domain, in fact, irrelevant to the this condition.
I take it as a separate discussion on a different topic.

Igor

