Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A22B98FA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 18:11:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31229.61559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnSX-0000ev-9A; Thu, 19 Nov 2020 17:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31229.61559; Thu, 19 Nov 2020 17:11:01 +0000
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
	id 1kfnSX-0000eY-5n; Thu, 19 Nov 2020 17:11:01 +0000
Received: by outflank-mailman (input) for mailman id 31229;
 Thu, 19 Nov 2020 17:10:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kfnSV-0000eR-Cm
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:10:59 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87ae63f1-c9c6-470c-a6e8-60f6d5971a18;
 Thu, 19 Nov 2020 17:10:57 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kfnSV-0000eR-Cm
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:10:59 +0000
X-Inumbo-ID: 87ae63f1-c9c6-470c-a6e8-60f6d5971a18
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 87ae63f1-c9c6-470c-a6e8-60f6d5971a18;
	Thu, 19 Nov 2020 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605805857;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Tb+i1uRCDNjzZU+/tXj6XDZlDzICgJ7qh8vlllpSiLM=;
  b=d0NrOviKLw+nAoDG5vCDru3WG36t90jsOmzAtCxMPa7WESlkjgxKXnz2
   vqxdTAF/cfToLOeKzZ3Cm0R+OayFW3V7cSWWXWVrL1ctMmuTbST0GtOfD
   U6iKqnKLS421u34gJVEnEpspnnMZ2FbGe9WQG1VDcVdQyoZDrPGlmh5Ks
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OsXCL6on6Wydif/3NuzzzoL3b53eXiZme/5wAw1IHGYQj+ck95LmsDVTrXA8jaMTghSYc5Gr+V
 chXvE7xpWvOoFnGsIQr725Y63wlNrhg3tcjmx5beaeUmAWXZ5KxlLw3EuY+TJ9EOa2j65tjWgF
 S5rSzNZuq/pRAysoIIfyjx5q9Wyl3z1tPDbR6TV8G1B7uZOQ0EW6/0EV7NZJfDlIr+4ZfCmLbb
 D+nGApZ4JQbB4DjotBEazATrgGDIaF6mmgL10k4siU+FtOPACKr72vP2aRMlHAnD+nP59ri/FX
 iNc=
X-SBRS: None
X-MesageID: 31779749
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,353,1599537600"; 
   d="scan'208";a="31779749"
Subject: Re: [PATCH] x86/Intel: avoid UB with NMI watchdog on family 15 CPUs
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <63500eb6-b1da-ce08-52e2-00b30ffe2c26@suse.com>
 <1c2ffdcb-577d-8bea-35e3-904777a0c2e5@citrix.com>
 <e056d6ff-aceb-e4f9-1fe8-a41c482e34bc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <47a30c4a-b05b-fdc5-0d7a-549fdd15a801@citrix.com>
Date: Thu, 19 Nov 2020 17:10:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e056d6ff-aceb-e4f9-1fe8-a41c482e34bc@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 19/11/2020 16:37, Jan Beulich wrote:
> On 19.11.2020 17:10, Andrew Cooper wrote:
>> On 19/11/2020 15:57, Jan Beulich wrote:
>>> Found by looking for patterns similar to the one Julien did spot in
>>> pci_vtd_quirks().
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Subject is wonky.  Is it P4 (Intel), or Fam15 (AMD) ?  I'd be tempted to
>> have the prefix as x86/nmi: either way.
> With this code:
>
>     case X86_VENDOR_INTEL:
>         switch (boot_cpu_data.x86) {
>         case 6:
>             setup_p6_watchdog((boot_cpu_data.x86_model < 14) 
>                               ? P6_EVENT_CPU_CLOCKS_NOT_HALTED
>                               : CORE_EVENT_CPU_CLOCKS_NOT_HALTED);
>             break;
>         case 15:
>             if (!setup_p4_watchdog())
>
> I think qualifying it like I did is quite reasonable. Hence ...
>
>> With that suitably adjusted, Acked-by: Andrew Cooper
>> <andrew.cooper3@citrix.com>
> ... I'd prefer to keep it as is - please clarify.

Oh - original Xeon's.  I'd honestly forgotten that quirk of history.

I'd recommend "x86/nmi: Avoid UB in for P4-era watchdogs" to avoid the
ambiguity altogether.

~Andrew

