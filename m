Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D213220B3DB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 16:46:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jopcQ-0001rT-Mc; Fri, 26 Jun 2020 14:46:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b3dG=AH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jopcQ-0001rO-4E
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 14:46:18 +0000
X-Inumbo-ID: c9a5d966-b7bb-11ea-b7bb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9a5d966-b7bb-11ea-b7bb-bc764e2007e4;
 Fri, 26 Jun 2020 14:46:16 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bUFHq1LnhwQU5oif03q5KuADDlgQaaaQ23BYdHvfugd/oRHKtcMGNNl9S/aNHs9PiJ3oWir00j
 QYo7NRCSMSDXPMg2Vddp5Ck3AvNJC/LQcbocQxLUgCQs5b1OWCI4P16+dWYUUfhW37bgsxnRnX
 AJkwf7rsyuMagpLpFROs/ZX9Ur9/qXBNagJU2nXtDqlIWiXxPcAs/DlzMPX4Mp07q3lWGKvPtm
 e8Sum32ng+lRbK/WhmTpFo9ZCxsgI65WXMvBOr1nmwywKpjSDcNCy5qPzvLAv6Pl90OohHY6Pk
 yJ8=
X-SBRS: 2.7
X-MesageID: 21040981
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,284,1589256000"; d="scan'208";a="21040981"
Subject: Re: [PATCH v2 for-4.14] x86/livepatch: Make livepatching compatible
 with CET Shadow Stacks
To: Jan Beulich <jbeulich@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20200626122408.19151-1-andrew.cooper3@citrix.com>
 <4bd8ab3e-37d0-fde9-10a3-b6b2f9ca4da6@citrix.com>
 <29ae3614-a73e-de01-f10f-8f3a32c3372a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5756a404-2d0a-3146-0682-dc89ad4a3c61@citrix.com>
Date: Fri, 26 Jun 2020 15:46:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <29ae3614-a73e-de01-f10f-8f3a32c3372a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/06/2020 15:26, Jan Beulich wrote:
> On 26.06.2020 15:59, Ross Lagerwall wrote:
>> On 2020-06-26 13:24, Andrew Cooper wrote:
>>> @@ -56,18 +57,48 @@ int arch_livepatch_safety_check(void)
>>>      return -EBUSY;
>>>  }
>>>  
>>> -int arch_livepatch_quiesce(void)
>>> +int noinline arch_livepatch_quiesce(void)
>>>  {
>>> +    /* If Shadow Stacks are in use, disable CR4.CET so we can modify CR0.WP. */
>>> +    if ( cpu_has_xen_shstk )
>> Should this be:
>>     if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
>>
>> to match arch_livepatch_revive?
> While it may look a little asymmetric, I think it's preferable
> to is IS_ENABLED() only where really needed, i.e. here it
> guarding code that otherwise may not build.

The reason for the asymmetry is because of the asm() block, which needs
compiling out when we detect that we don't have a compatible assembler.

I was wondering whether I should make cpu_has_xen_shstk be false for
!CONFIG_XEN_SHSTK, but that would be 4.15 work at this point.

~Andrew

