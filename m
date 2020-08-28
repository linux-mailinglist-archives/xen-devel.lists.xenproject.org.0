Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A84255E11
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:43:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgWc-0002w5-By; Fri, 28 Aug 2020 15:42:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8pf4=CG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBgWb-0002w0-D3
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:42:45 +0000
X-Inumbo-ID: 4b68f543-95d7-475c-a19e-122461c8bf0a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b68f543-95d7-475c-a19e-122461c8bf0a;
 Fri, 28 Aug 2020 15:42:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3E29AEA5;
 Fri, 28 Aug 2020 15:43:16 +0000 (UTC)
Subject: Re: [PATCH] x86/intel: Expose MSR_ARCH_CAPS to dom0
To: Andrew Cooper <amc96@cam.ac.uk>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200827193713.4962-1-andrew.cooper3@citrix.com>
 <e24c49ce-82f4-955d-3a7b-03ffd5aa4144@suse.com>
 <9498c4e0-d8c7-1660-3074-8a818ba50658@cam.ac.uk>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <70a6de86-f382-050c-9c33-eccc9cb76c9c@suse.com>
Date: Fri, 28 Aug 2020 17:42:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9498c4e0-d8c7-1660-3074-8a818ba50658@cam.ac.uk>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.08.2020 12:23, Andrew Cooper wrote:
> On 28/08/2020 09:41, Jan Beulich wrote:
>> On 27.08.2020 21:37, Andrew Cooper wrote:
>>> The overhead of (the lack of) MDS_NO alone has been measured at 30% on some
>>> workloads.  While we're not in a position yet to offer MSR_ARCH_CAPS generally
>>> to guests, dom0 doesn't migrate, so we can pass a subset of hardware values
>>> straight through.
>>>
>>> This will cause PVH dom0's not to use KPTI by default, and all dom0's not to
>>> use VERW flushing by default,
>> To avoid VERW, shouldn't you also expose SKIP_L1DFL?
> 
> SKIP_L1DFL is a software-only bit, specifically for nested virt.
> 
> It is for Xen to tell an L1 hypervisor "you don't need to flush on
> vmentry because I'm taking care of it".

Or for a hypervisor underneath us to tell us, which we could then
hand on to Dom0?

Jan

