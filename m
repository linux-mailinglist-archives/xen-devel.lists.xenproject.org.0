Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7251FD0A2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 17:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlZm7-0006c7-Ai; Wed, 17 Jun 2020 15:14:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FoJ=76=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlZm5-0006c2-Re
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 15:14:49 +0000
X-Inumbo-ID: 48aecb02-b0ad-11ea-b9f5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48aecb02-b0ad-11ea-b9f5-12813bfff9fa;
 Wed, 17 Jun 2020 15:14:48 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QTcOO6OqT59JxABZcSZ+l2UW6aTZ3UkOgqrrW/A8ICzqXAEEixBuIxDM0wCIGvtFGziSHJQRd4
 b02YZ7f5XnL3G9JIARxNDR67lcCuiH+AV+ncKS23sH+bG7rBRcT8TwBUUVAx3VmkN4dA5pRdFX
 yogZMpnU28dAfZN3xNGkwv6+MbdqomXMDbAZ0EXwXcMWZIiQl0L/idNwSbPGk2j6kqRaZH1EvM
 NkD6Ra1+CFxM3iAPocu/ZOmtfseSZfFR2JgPoOsmNz0WlHiqyJMfCttKyVp8NxRyjDXeCvmo5O
 NAA=
X-SBRS: 2.7
X-MesageID: 20629293
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,523,1583211600"; d="scan'208";a="20629293"
Subject: Re: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
 <20200616173857.GU735@Air-de-Roger>
 <676696113.8782412.1592329627666.JavaMail.zimbra@cert.pl>
 <20200617090942.GY735@Air-de-Roger>
 <574150.9103505.1592394885283.JavaMail.zimbra@cert.pl>
 <20200617125146.GA735@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5ad138bb-9195-a8de-5566-468db553422e@citrix.com>
Date: Wed, 17 Jun 2020 16:14:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617125146.GA735@Air-de-Roger>
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
Cc: Kevin Tian <kevin.tian@intel.com>, luwei.kang@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/06/2020 13:51, Roger Pau Monné wrote:
> On Wed, Jun 17, 2020 at 01:54:45PM +0200, Michał Leszczyński wrote:
>> ----- 17 cze 2020 o 11:09, Roger Pau Monné roger.pau@citrix.com napisał(a):
>>
>>> 24 Virtual Machine Control Structures -> 24.8 VM-entry Control Fields -> 24.8.1 VM-Entry Controls
>>> Software should consult the VMX capability MSRs IA32_VMX_ENTRY_CTLS to determine how it should set the reserved bits.
>> Please look at bit position 18 "Load IA32_RTIT_CTL".
> I think this is something different from what I was referring to.
> Those options you refer to (load/clear IA32_RTIT_CTL) deal with
> loading/storing a specific field on the vmcs that maps to the guest
> IA32_RTIT_CTL.
>
> OTOH MSR load lists can be used to load and store any arbitrary MSR on
> vmentry/vmexit, see section 26.4 LOADING MSRS on the SDM. There's
> already infrastructure on Xen to do so, see vmx_{add/del/find}_msr.

If I remember the historic roadmaps correctly, there are 3 cases.

The first hardware to support PT (Broadwell?) prohibited its use
completely in VMX operations.  In this case, we can use it to trace PV
guests iff we don't enable VMX in hardware to begin with.

This was relaxed in later hardware (Skylake?) to permit use within VMX
operations, but without any help in the VMCS.  (i.e. manual context
switching per this patch, or MSR load lists as noted in the SDM.)

Subsequent support for "virtualised PT" was added (IceLake?) which adds
the load/save controls, and the ability to translate the output buffer
under EPT.


All of this is from memory so I'm quite possibly wrong with details, but
I believe this is why the current complexity exists.

~Andrew

