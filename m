Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393BC1C023C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 18:20:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUBuI-0005WE-P2; Thu, 30 Apr 2020 16:19:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLHY=6O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUBuG-0005W8-Oi
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 16:19:24 +0000
X-Inumbo-ID: 59832986-8afe-11ea-9a7b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59832986-8afe-11ea-9a7b-12813bfff9fa;
 Thu, 30 Apr 2020 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588263563;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=uUBzPA6/hLC0qecRYft6hc4V7jTdFJeQgEvZR9Q6Yyo=;
 b=APE96icCz/4fOfATYI8XdRBLyoVX4EClN/M/tb6fqzr5FtZhdvpBkMOH
 3Ef/LOuJpvfWItEJpWjwS2FMH2yaF4yVeoiviLcSTUZu8phXq8CKQ0wDs
 l6CI77mt4xrA1PoMQL8H7kZCE+A7d+jGRp/e5GU56vQdYV87e74btSy3W A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TZikwq5VJCs0D9lB8Ft4BrVe1iDizd7+TMkj1+iXH6bvSTEQ2Fe9EYxFSDsVK5xt4NiecII5cL
 pe4qiuUKGf0RDPTukxTyx5soEF4K9PCVwSeAAZTV34nWLIabrq74Cvn4wXOjrNIqIOl6qTIgdI
 lmj+hB5Ot6ui65O/DpAw982NZGwzOypeR/xYvWVhjmitSDirKf7yiRMGtVhKwguBiJq1jGb8BW
 54WGe+a4THogXC0bOHUoHDFJHrIhc3msjVRBb8B07vLpuTQhmxpg5V03ju390b4gzoZEBkAS1M
 7Zk=
X-SBRS: 2.7
X-MesageID: 16833879
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,336,1583211600"; d="scan'208";a="16833879"
Subject: Re: [PATCH] x86/hap: be more selective with assisted TLB flush
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200429173601.77605-1-roger.pau@citrix.com>
 <4257a323-d37f-4af0-bdc6-a3f65c19438a@suse.com>
 <20200430082844.GZ28601@Air-de-Roger>
 <d5a0308b-0ac3-21f5-9a07-e1402005b663@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <487fb08f-a9f5-7de9-54f0-f158fa687e6c@citrix.com>
Date: Thu, 30 Apr 2020 17:19:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d5a0308b-0ac3-21f5-9a07-e1402005b663@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/04/2020 09:33, Jan Beulich wrote:
> On 30.04.2020 10:28, Roger Pau Monné wrote:
>> On Thu, Apr 30, 2020 at 09:20:58AM +0200, Jan Beulich wrote:
>>> On 29.04.2020 19:36, Roger Pau Monne wrote:
>>>> When doing an assisted flush on HAP the purpose of the
>>>> on_selected_cpus is just to trigger a vmexit on remote CPUs that are
>>>> in guest context, and hence just using is_vcpu_dirty_cpu is too lax,
>>>> also check that the vCPU is running.
>>> Am I right to understand that the change is relevant only to
>>> cover the period of time between ->is_running becoming false
>>> and ->dirty_cpu becoming VCPU_CPU_CLEAN? I.e. ...
>>>
>>>> --- a/xen/arch/x86/mm/hap/hap.c
>>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>>> @@ -719,7 +719,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
>>>>          hvm_asid_flush_vcpu(v);
>>>>  
>>>>          cpu = read_atomic(&v->dirty_cpu);
>>>> -        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) )
>>>> +        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
>>> ... the previous logic would have suitably covered the switch-to
>>> path, but doesn't properly cover the switch-from one, due to our
>>> lazy context switch approach?
>> Yes. Also __context_switch is not called from context_switch when
>> switching to the idle vcpu, and hence dirty_cpu is not cleared.
>>
>>> If so, I agree with the change:
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> It might be worth mentioning this detail in the description then,
>>> though.
>> Would you mind adding to the commit message if you agree:
>>
>> "Due to the lazy context switching done by Xen dirty_cpu won't always be
>> cleared when the guest vCPU is not running, and hence relying on
>> is_running allows more fine grained control of whether the vCPU is
>> actually running."
> Sure; I'll give it over the weekend though for others to comment, if
> so desired.

I think it is worth pointing out that this fixes a large perf regression
on Nehalem/Westmere systems, where L1 Shim using the enlightened
hypercall is 8x slower than unenlightened way.

~Andrew

