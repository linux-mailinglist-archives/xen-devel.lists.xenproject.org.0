Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2661FEF2E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 12:03:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlrNu-0002Lu-Pf; Thu, 18 Jun 2020 10:03:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlrNs-0002Ll-Pd
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 10:03:00 +0000
X-Inumbo-ID: e3a26054-b14a-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3a26054-b14a-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 10:02:59 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7kl0LJ4HmwHIk9rU3Qfabu2Urcr72izzaoXcC4B/NzeSRv9olhlvbpcwjfLPD1aQcurqlDdIj+
 RBnpjmcIAd20qK6+yfp+YeGsfCOsLaKl96POSMZCM2q4IizuQUc8sOiY+PDNxVabjdn7L03cpj
 4W8A3Kj3EdkaO4huqt7IFNpUKAyaJUg8iH9lhCzJNN9Z3fuGFb2TQLKxJuYKUkWBR2HSsnHowH
 S3tKCTWndkKobCVDa+C3O0YdMdn3RpCI+loXWsCGA1q30jRpJR1me43gQXuMKX1o6UDIQnmOsu
 bh8=
X-SBRS: 2.7
X-MesageID: 20351516
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20351516"
Subject: Re: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
To: "Kang, Luwei" <luwei.kang@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
 <20200616173857.GU735@Air-de-Roger>
 <676696113.8782412.1592329627666.JavaMail.zimbra@cert.pl>
 <20200617090942.GY735@Air-de-Roger>
 <574150.9103505.1592394885283.JavaMail.zimbra@cert.pl>
 <20200617125146.GA735@Air-de-Roger>
 <5ad138bb-9195-a8de-5566-468db553422e@citrix.com>
 <DM5PR1101MB226679FFAF57E63704958110809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1c476a2b-8d05-7634-3543-ba1c2768bb99@citrix.com>
Date: Thu, 18 Jun 2020 11:02:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <DM5PR1101MB226679FFAF57E63704958110809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/06/2020 00:30, Kang, Luwei wrote:
>>> On Wed, Jun 17, 2020 at 01:54:45PM +0200, Michał Leszczyński wrote:
>>>> ----- 17 cze 2020 o 11:09, Roger Pau Monné roger.pau@citrix.com napisał(a):
>>>>
>>>>> 24 Virtual Machine Control Structures -> 24.8 VM-entry Control
>>>>> Fields -> 24.8.1 VM-Entry Controls Software should consult the VMX
>> capability MSRs IA32_VMX_ENTRY_CTLS to determine how it should set the
>> reserved bits.
>>>> Please look at bit position 18 "Load IA32_RTIT_CTL".
>>> I think this is something different from what I was referring to.
>>> Those options you refer to (load/clear IA32_RTIT_CTL) deal with
>>> loading/storing a specific field on the vmcs that maps to the guest
>>> IA32_RTIT_CTL.
>>>
>>> OTOH MSR load lists can be used to load and store any arbitrary MSR on
>>> vmentry/vmexit, see section 26.4 LOADING MSRS on the SDM. There's
>>> already infrastructure on Xen to do so, see vmx_{add/del/find}_msr.
>> If I remember the historic roadmaps correctly, there are 3 cases.
>>
>> The first hardware to support PT (Broadwell?) prohibited its use completely in
>> VMX operations.  In this case, we can use it to trace PV guests iff we don't
>> enable VMX in hardware to begin with.
>>
>> This was relaxed in later hardware (Skylake?) to permit use within VMX
>> operations, but without any help in the VMCS.  (i.e. manual context switching
>> per this patch, or MSR load lists as noted in the SDM.)
>>
>> Subsequent support for "virtualised PT" was added (IceLake?) which adds the
>> load/save controls, and the ability to translate the output buffer under EPT.
>>
>>
>> All of this is from memory so I'm quite possibly wrong with details, but I believe
>> this is why the current complexity exists.
> Yes, It include 3 cases.
> 1. Before IA32_VMX_MISC[bit 14]:
>      Intel PT doesn't support tracing in VMX operation. Execution of the VMXON instruction clears IA32_RTIT_CTL.TraceEn and any attempt to write IA32_RTIT_CTL in VMX operation causes a general-protection exception (#GP)
> 2. Support IA32_VMX_MISC[bit 14] but no EPT to direct PT output:
>     Intel PT can be enabled across VMX but the address of Intel PT buffer is always HPA from HW point of view. There is not VMCS support in this stage. The MSR load list can be used for Intel PT context switch(VM-Entry/Exit).
> 3. Intel PT VM improvements (start from Icelake):
>     Add a new guest IA32_RTIT_CTL field in VMCS, and HW treat the PT output addresses as GPA and translate them using EPT.

Thanks for the details, and confirming.  I think for now we can ignore
case 1 for simplicity, as I don't think it is likely that we'll have
someone on Broadwell hardware intending to run without VMX.  (If people
really want it, we can retrofit it, but I don't think the effort is
worth it for now)

~Andrew

