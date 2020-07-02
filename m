Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F8A211ED3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 10:30:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jquas-0003Xd-NF; Thu, 02 Jul 2020 08:29:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jquar-0003XY-4g
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 08:29:17 +0000
X-Inumbo-ID: 1d808780-bc3e-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d808780-bc3e-11ea-bca7-bc764e2007e4;
 Thu, 02 Jul 2020 08:29:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6EF7FADC1;
 Thu,  2 Jul 2020 08:29:15 +0000 (UTC)
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
To: Julien Grall <julien@xen.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
 <85416128-a334-4640-7504-0865f715b3a2@xen.org>
 <48c59780-bedb-ff08-723c-be14a9b73e6b@citrix.com>
 <f2aa4cf9-0689-82c0-cb6c-55d55ecbd5c1@xen.org>
 <a9a33ba1-b121-5e6f-b74c-7d2a60c84b13@xen.org>
 <a7187837-495f-56a5-a8d0-635a53ac9234@citrix.com>
 <95154add-164a-5450-28e1-f24611e1642f@xen.org>
 <df0aa9b4-d7f7-f909-e833-3f2f3040a2dc@citrix.com>
 <de298379-43c3-648f-aade-9efc7f761970@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8df16863-2207-6747-cf17-f88124927ddb@suse.com>
Date: Thu, 2 Jul 2020 10:29:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <de298379-43c3-648f-aade-9efc7f761970@xen.org>
Content-Type: text/plain; charset=utf-8
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 luwei.kang@intel.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.07.2020 20:09, Julien Grall wrote:
> On 01/07/2020 19:06, Andrew Cooper wrote:
>> On 01/07/2020 19:02, Julien Grall wrote:
>>> On 01/07/2020 18:26, Andrew Cooper wrote:
>>>> For the sake of what is literally just one byte in common code, I stand
>>>> my original suggestion of this being a common interface.  It is not
>>>> something which should be x86 specific.
>>>
>>> This argument can also be used against putting in common code. What I
>>> am the most concern of is we are trying to guess how the interface
>>> will look like for another architecture. Your suggested interface may
>>> work, but this also may end up to be a complete mess.
>>>
>>> So I think we want to wait for a new architecture to use vmtrace
>>> before moving to common code. This is not going to be a massive effort
>>> to move that bit in common if needed.
>>
>> I suggest you read the series.
> 
> Already went through the series and ...
> 
>>
>> The only thing in common code is the bit of the interface saying "I'd
>> like buffers this big please".
> 
> ... I stand by my point. There is no need to have this code in common 
> code until someone else need it. This code can be easily implemented in 
> arch_domain_create().

I'm with Andrew here, fwiw, as long as the little bit of code that
is actually put in common/ or include/xen/ doesn't imply arbitrary
restrictions on acceptable values. For example, unless there is
proof that for all architectures of interest currently or in the
not too distant future an order value is fine (as opposed to a
size one), then an order field would be fine to live in common
code imo. Otherwise it would need to be a size one, with per-arch
enforcement of further imposed restrictions (like needing to be a
power of 2).

Jan

