Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38142AD3A1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 11:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23205.49833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcQou-00028y-8z; Tue, 10 Nov 2020 10:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23205.49833; Tue, 10 Nov 2020 10:24:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcQou-00028Z-5h; Tue, 10 Nov 2020 10:24:12 +0000
Received: by outflank-mailman (input) for mailman id 23205;
 Tue, 10 Nov 2020 10:24:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psMK=EQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kcQos-00028U-Vp
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 10:24:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bac013f-0e47-4d2c-aa1c-d4f5f72fd4bc;
 Tue, 10 Nov 2020 10:24:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=psMK=EQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kcQos-00028U-Vp
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 10:24:11 +0000
X-Inumbo-ID: 3bac013f-0e47-4d2c-aa1c-d4f5f72fd4bc
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3bac013f-0e47-4d2c-aa1c-d4f5f72fd4bc;
	Tue, 10 Nov 2020 10:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605003848;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Z6N2GG1EhgHfaBdcjuBZsBm/E6lBZ5//MluDHr3a23o=;
  b=QJgxgFJ+EHHKiWtigytTume6m1e6ZqPTz96KfYwq3SElMQKcG9HRHMUF
   NKsDho4sLZ2m14QF2gzhtTCutfDaus/f3oSF7A1Flz4inTPpURRhWU2XK
   dz6D66NaWYatWFZARB6HpFGplGuoHr/S4+43hzBS3CtXnrvVC3nffsNLC
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: H6iMV0iPQI+EUuavz/ExCq0936GOK0IgnvXyHcEFZ+0wKH1RBLW0/V50gK0U1+RH3XdfHu+OA5
 IWetp/ardF97cJUeH3YcYqd22SzBmzqihl9OvnttyN9oUe6EQQf2/0TJSIvsQ0cNqLMID/+0Gw
 CekVzk9emSB2dL3xWhDPFj8H/ZUiguHya98qjLshqSKqW2ESPhm48IGBWfM/E2TBn3rfx6kSdZ
 gTKzs+9qutywRdBIFLtFufAsVKkC5eof2ZfkpQ7SNJrAYDe30Lfw7Jxxp5oi54xEAj+KJJv4m9
 HgQ=
X-SBRS: None
X-MesageID: 31069019
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="31069019"
Subject: Re: [PATCH v2] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20201109173819.7817-1-andrew.cooper3@citrix.com>
 <20201109183102.mrqklmpqyka5u6bt@Air-de-Roger>
 <d76806b4-2302-bee9-d977-ecfe29089fd7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b4171eb9-6f47-e401-4049-d8b2a67c6f97@citrix.com>
Date: Tue, 10 Nov 2020 10:24:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d76806b4-2302-bee9-d977-ecfe29089fd7@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 10/11/2020 08:04, Jan Beulich wrote:
> On 09.11.2020 19:31, Roger Pau Monné wrote:
>> On Mon, Nov 09, 2020 at 05:38:19PM +0000, Andrew Cooper wrote:
>>> From: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Currently a PV hardware domain can also be given control over the CPU
>>> frequency, and such guest is allowed to write to MSR_IA32_PERF_CTL.
>>> However since commit 322ec7c89f6 the default behavior has been changed
>>> to reject accesses to not explicitly handled MSRs, preventing PV
>>> guests that manage CPU frequency from reading
>>> MSR_IA32_PERF_{STATUS/CTL}.
>>>
>>> Additionally some HVM guests (Windows at least) will attempt to read
>>> MSR_IA32_PERF_CTL and will panic if given back a #GP fault:
>>>
>>>   vmx.c:3035:d8v0 RDMSR 0x00000199 unimplemented
>>>   d8v0 VIRIDIAN CRASH: 3b c0000096 fffff806871c1651 ffffda0253683720 0
>>>
>>> Move the handling of MSR_IA32_PERF_{STATUS/CTL} to the common MSR
>>> handling shared between HVM and PV guests, and add an explicit case
>>> for reads to MSR_IA32_PERF_{STATUS/CTL}.
>>>
>>> Restore previous behavior and allow PV guests with the required
>>> permissions to read the contents of the mentioned MSRs. Non privileged
>>> guests will get 0 when trying to read those registers, as writes to
>>> MSR_IA32_PERF_CTL by such guest will already be silently dropped.
>>>
>>> Fixes: 322ec7c89f6 ('x86/pv: disallow access to unknown MSRs')
>>> Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>>
>>> v2:
>>>  * fix is_cpufreq_controller() to exclude PVH dom0, and collapse to nothing in
>>>    !CONFIG_PV builds
>>>  * Drop the cross-vendor checks.  It isn't possible to configure dom0 as
>>>    cross-vendor, and anyone using is_cpufreq_controller() without an exact
>>>    model match has far bigger problems.
> This already answers ...
>
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -1069,6 +1069,23 @@ extern enum cpufreq_controller {
>>>      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
>>>  } cpufreq_controller;
>>>  
>>> +static always_inline bool is_cpufreq_controller(const struct domain *d)
>>> +{
>>> +    /*
>>> +     * A PV dom0 can be nominated as the cpufreq controller, instead of using
>>> +     * Xen's cpufreq driver, at which point dom0 gets direct access to certain
>>> +     * MSRs.
>>> +     *
>>> +     * This interface only works when dom0 is identity pinned and has the same
>>> +     * number of vCPUs as pCPUs on the system.
>>> +     *
>>> +     * It would be far better to paravirtualise the interface.
>>> +     */
>> Would it be useful to add an assert here that the domain cpuid vendor
>> and the BSP cpuid vendor match?
>>
>> Is it even possible to fake a different cpuid vendor for dom0?
> ... your question here.

Technically at the moment it is possible to configure a non-dom0
hardware domain as cross vendor, but anyone doing so can keep all the
resulting pieces.

~Andrew

