Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172481DE466
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:28:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4u6-0003fg-Uj; Fri, 22 May 2020 10:27:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Somd=7E=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jc4u5-0003fb-IE
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:27:49 +0000
X-Inumbo-ID: e1fee3ce-9c16-11ea-abaf-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1fee3ce-9c16-11ea-abaf-12813bfff9fa;
 Fri, 22 May 2020 10:27:48 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2Wg7ssBM/W1QFfjkaBmKGEA0nhL9lqdJdx1//WCDmf09/2x8MkjW+CVgw7o5NSkFBsQ7/087LY
 KqrJOHwi66w8+q0s7I/cjr90EvW6JQ8V9M2i+k6P2LkoEeoA+fQD3HpNtOr9FuYSSr46RUkwuk
 /XLJdT/1gUJJrnliK2B2zOe1dJPTUQhqKFb/A58osTid8vvWxqJzR53J51MivFDqCr1cVqTRWU
 ylD/i3ObDp7jYj7gKhmKzdfV3RWIGXi4Jp8ahRiUtS+gJY00wPld6XZrXXWzOPw/RMywwBkCyn
 W/Y=
X-SBRS: 2.7
X-MesageID: 18195004
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18195004"
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
 <20200522100846.GV54375@Air-de-Roger>
 <04ec4ab4-a121-c5be-0a65-316e237dd793@citrix.com>
 <20200522102339.GX54375@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <fe6e5c7f-df0f-5436-a7cd-2949464ab9a7@citrix.com>
Date: Fri, 22 May 2020 11:27:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200522102339.GX54375@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/05/2020 11:23, Roger Pau Monné wrote:
> On Fri, May 22, 2020 at 11:14:24AM +0100, Igor Druzhinin wrote:
>> On 22/05/2020 11:08, Roger Pau Monné wrote:
>>> On Thu, May 21, 2020 at 10:43:58PM +0100, Igor Druzhinin wrote:
>>>> If a recalculation NPT fault hasn't been handled explicitly in
>>>> hvm_hap_nested_page_fault() then it's potentially safe to retry -
>>>> US bit has been re-instated in PTE and any real fault would be correctly
>>>> re-raised next time.
>>>>
>>>> This covers a specific case of migration with vGPU assigned on AMD:
>>>> global log-dirty is enabled and causes immediate recalculation NPT
>>>> fault in MMIO area upon access. This type of fault isn't described
>>>> explicitly in hvm_hap_nested_page_fault (this isn't called on
>>>> EPT misconfig exit on Intel) which results in domain crash.
>>>
>>> Couldn't direct MMIO regions be handled like other types of memory for
>>> the purposes of logdiry mode?
>>>
>>> I assume there's already a path here used for other memory types when
>>> logdirty is turned on, and hence would seem better to just make direct
>>> MMIO regions also use that path?
>>
>> The proble of handling only MMIO case is that the issue still stays.
>> It will be hit with some other memory type since it's not MMIO specific.
>> The issue is that if global recalculation is called, the next hit to
>> this type will cause a transient fault which will not be handled
>> correctly after a due fixup by neither of our handlers.
> 
> I admit I should go look at the code, but for example RAM p2m types
> don't require this fix, so I assume there's some different path taken
> in that case that avoids all this?
> 
> Ie: when global logdirty is enabled you will start to get nested page
> faults for every access, yet only direct MMIO types require this fix?

It's not "only MMIO" - it's just MMIO area is hit in my particular case.
I'd prefer this fix to address the general issue otherwise for SVM
we would have to write handlers in hvm_hap_nested_page_fault() for
every case as soon as we hit it.

Igor

