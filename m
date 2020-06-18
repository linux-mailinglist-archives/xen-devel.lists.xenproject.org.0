Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51A71FFED9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 01:44:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm4CU-0001vQ-PQ; Thu, 18 Jun 2020 23:44:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jm4CT-0001uX-MN
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 23:44:05 +0000
X-Inumbo-ID: 94ae3310-b1bd-11ea-bb8b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94ae3310-b1bd-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 23:43:59 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uFy2yF6A3Sz1dmKVsQj8ZhJG1SABuqaEaoPwHhB8Y6/iNzyUA/U/xV0ZpN9d06cQS2bdfVIWUl
 bJauUP46LSy9HaJd9th/lLF/rusg4AEYsYC3H3U3qZSnhLmyUsXEBzhX60YNVoA7JT9g+2tbAY
 aXLXo3bBlfCVkM2VNolaXd54+MZl/cAY7DOx+9NcGqeV/paOHuf3GYs+ehwff2bdptf4xVmY3U
 Ni3Mx7ShySsIofO22N9sHbMdVgGtEUW1RpTfVDBJf0ZkQW48nJALoxJRXZFaqQFu/5mc+nlXXH
 geE=
X-SBRS: 2.7
X-MesageID: 20650521
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,253,1589256000"; d="scan'208";a="20650521"
Subject: Re: Event delivery and "domain blocking" on PVHv2
To: Martin Lucina <martin@lucina.net>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
 <mirageos-devel@lists.xenproject.org>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
 <20200618101330.GB10330@nodbug.lucina.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2f5c8fbc-0153-17b7-4a44-8f8ba0e3179f@citrix.com>
Date: Fri, 19 Jun 2020 00:43:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618101330.GB10330@nodbug.lucina.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/06/2020 11:13, Martin Lucina wrote:
> On Monday, 15.06.2020 at 17:58, Andrew Cooper wrote:
>> On 15/06/2020 15:25, Martin Lucina wrote:
>>> Hi,
>>>
>>> puzzle time: In my continuing explorations of the PVHv2 ABIs for the
>>> new MirageOS Xen stack, I've run into some issues with what looks like
>>> missed deliveries of events on event channels.
>>>
>>> While a simple unikernel that only uses the Xen console and
>>> effectively does for (1..5) { printf("foo"); sleep(1); } works fine,
>>> once I plug in the existing OCaml Xenstore and Netfront code, the
>>> behaviour I see is that the unikernel hangs in random places, blocking
>>> as if an event that should have been delivered has been missed.
>> You can see what is going on, event channel wise, with the 'e'
>> debug-key.  This will highlight cases such as the event channel being
>> masked and pending, which is a common guest bug ending up in this state.
> Ok, based on your and Roger's suggestions I've made some changes:
>
> 1. I've dropped all the legacy PIC initialisation code from the Solo5
> parts, written some basic APIC initialisation code and switched to using
> HVMOP_set_evtchn_upcall_vector for upcall registration, along with setting
> HVM_PARAM_CALLBACK_IRQ to 1 as suggested by Roger and done by Xen when
> running as a guest. Commit at [1], nothing controversial there.

Well...

    uint64_t apic_base = rdmsrq(MSR_IA32_APIC_BASE);
    wrmsrq(MSR_IA32_APIC_BASE,
            apic_base | (APIC_BASE << 4) | MSR_IA32_APIC_BASE_ENABLE);
    apic_base = rdmsrq(MSR_IA32_APIC_BASE);
    if (!(apic_base & MSR_IA32_APIC_BASE_ENABLE)) {
        log(ERROR, "Solo5: Could not enable APIC or not present\n");
        assert(false);
    }

The only reason Xen doesn't crash your guest on that WRMSR is because
0xfee00080ull | (0xfee00000u << 4) == 0xfee00080ull, due to truncation
and 0xfe | 0xee == 0xfe.

Either way, the logic isn't correct.

Xen doesn't support moving the APIC MMIO window (and almost certainly
never will, because the only thing which changes it is malware).  You
can rely on the default state being correct, because it is
architecturally specified.

~Andrew

