Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE6257404
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 09:00:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCdnC-0000y9-RP; Mon, 31 Aug 2020 06:59:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kCdnB-0000y3-Gc
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 06:59:49 +0000
X-Inumbo-ID: ff05810b-0a11-40a7-8b77-3fde5f4db78d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff05810b-0a11-40a7-8b77-3fde5f4db78d;
 Mon, 31 Aug 2020 06:59:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32EE3ACF6;
 Mon, 31 Aug 2020 07:00:22 +0000 (UTC)
Subject: Re: [PATCH] x86/intel: Expose MSR_ARCH_CAPS to dom0
To: Andrew Cooper <amc96@cam.ac.uk>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200827193713.4962-1-andrew.cooper3@citrix.com>
 <e24c49ce-82f4-955d-3a7b-03ffd5aa4144@suse.com>
 <9498c4e0-d8c7-1660-3074-8a818ba50658@cam.ac.uk>
 <70a6de86-f382-050c-9c33-eccc9cb76c9c@suse.com>
 <f585d05b-db9b-c890-898d-ed34a0122ec4@cam.ac.uk>
 <990665a8-a219-ef79-331a-79bf70c11324@suse.com>
 <93da43ae-a53c-16ac-4f23-b700cc2f6b1d@cam.ac.uk>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5c95be8f-fa2a-3955-b9a9-f195a0825b0d@suse.com>
Date: Mon, 31 Aug 2020 08:59:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <93da43ae-a53c-16ac-4f23-b700cc2f6b1d@cam.ac.uk>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.08.2020 18:38, Andrew Cooper wrote:
> On 28/08/2020 17:17, Jan Beulich wrote:
>> On 28.08.2020 18:09, Andrew Cooper wrote:
>>> On 28/08/2020 16:42, Jan Beulich wrote:
>>>> On 28.08.2020 12:23, Andrew Cooper wrote:
>>>>> On 28/08/2020 09:41, Jan Beulich wrote:
>>>>>> On 27.08.2020 21:37, Andrew Cooper wrote:
>>>>>>> The overhead of (the lack of) MDS_NO alone has been measured at 30% on some
>>>>>>> workloads.  While we're not in a position yet to offer MSR_ARCH_CAPS generally
>>>>>>> to guests, dom0 doesn't migrate, so we can pass a subset of hardware values
>>>>>>> straight through.
>>>>>>>
>>>>>>> This will cause PVH dom0's not to use KPTI by default, and all dom0's not to
>>>>>>> use VERW flushing by default,
>>>>>> To avoid VERW, shouldn't you also expose SKIP_L1DFL?
>>>>> SKIP_L1DFL is a software-only bit, specifically for nested virt.
>>>>>
>>>>> It is for Xen to tell an L1 hypervisor "you don't need to flush on
>>>>> vmentry because I'm taking care of it".
>>>> Or for a hypervisor underneath us to tell us, which we could then
>>>> hand on to Dom0?
>>> For dom0 to do what with?
>>>
>>> PV guests can't use the VMLAUNCH/VMRESUME instruction at all, and it is
>>> not currently possible to configure nested virt for a PVH dom0 to use.
>> Aren't they also using this on the exit-to-user-mode path, like we
>> do on exit-to-PV? And in certain cases when idle?
> 
> MSR_FLUSH_CMD is used used for VMEntry.  This flushes the L1D cache, and
> was to combat L1TF.  Native systems don't flush the L1D at all, and
> invert PTEs instead as a *far* lower overhead mitigation.
> 
> Then MDS came along.  VERW is used to flush the uarch buffers.  This
> needs doing in all return-to-guest contexts.
> 
> As VMEntry needs both, MSR_FLUSH_CMD's behaviour was extended to cover
> both the L1D cache and uarch buffers, so software didn't have to arrange
> for both.
> 
> Therefore, the overall mitigations are VERW on exit-to-PV, and
> MSR_FLUSH_CMD on exit-to-HVM.
> 
> 
> There is no current need for native setups to use MSR_FLUSH_CMD.  The
> only reason we expose the MSR to HVM guests is for nested-virt.

But the question was about the use of VERW on exit-to-user paths in
a PV kernel, which I apparently wrongly understood SKIP_L1DFL also
indicates to be unnecessary. I'm sorry for the confusion. So
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

