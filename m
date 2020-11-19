Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5AC2B9902
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 18:12:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31238.61571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnUG-0000oM-Kr; Thu, 19 Nov 2020 17:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31238.61571; Thu, 19 Nov 2020 17:12:48 +0000
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
	id 1kfnUG-0000nx-HU; Thu, 19 Nov 2020 17:12:48 +0000
Received: by outflank-mailman (input) for mailman id 31238;
 Thu, 19 Nov 2020 17:12:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kfnUE-0000ns-NV
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:12:46 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59a51098-f8d7-467e-9ee9-3075b5101549;
 Thu, 19 Nov 2020 17:12:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kfnUE-0000ns-NV
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:12:46 +0000
X-Inumbo-ID: 59a51098-f8d7-467e-9ee9-3075b5101549
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 59a51098-f8d7-467e-9ee9-3075b5101549;
	Thu, 19 Nov 2020 17:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605805965;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Fmi5hEM+WmL9aeHow3ArAEOoU8Z7m3Doroo4VnoxGZs=;
  b=h89GzyrzkJPzyRzXM0lkUetqT/XjOZc32q+k+jna8uum2UKNeuub/Ke6
   5QOlG/tnhFCZDDV+hVHU6bFn5ciiaWrOC17gkh+ue4IjMmxg/uFE0n0Gf
   5i03QZW2GcUDwqrUBT0NqDggKRDqp3AzC+avGwGv5KmQ6YgNVNJKH08Qw
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aFl85dS2FUjx5v5H/nbfX9iVLtW+1T2O3EZyt10CJbZ00RvRbGaNYgrwWN/pc7/IVpMULGEq09
 +a7i6TOG6EjCUbXn1hF6VLTpXtppYX+pY7Xw5LhfQ9Gh5hEoPUM7ggL4mtduQaKOPdf0CCZDjZ
 peF7ri3qDwbpSKhuqLYrgzbBogQ7B9DjvUjywaRVj3REAkCQjPecSjxAoh7K2RM7B3NFVIwcXw
 a3/WcW9Ega5ISKsiH+p/VmKHW8zb7wwN42znHxlH/58DW18L/wSehAsxEMPPI0yvjkGx23KXCF
 en4=
X-SBRS: None
X-MesageID: 31779965
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,353,1599537600"; 
   d="scan'208";a="31779965"
Subject: Re: [PATCH] x86/Intel: avoid UB with NMI watchdog on family 15 CPUs
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <63500eb6-b1da-ce08-52e2-00b30ffe2c26@suse.com>
 <1c2ffdcb-577d-8bea-35e3-904777a0c2e5@citrix.com>
 <e056d6ff-aceb-e4f9-1fe8-a41c482e34bc@suse.com>
 <47a30c4a-b05b-fdc5-0d7a-549fdd15a801@citrix.com>
Message-ID: <25c7cb0e-951a-9466-6434-41faf748cbd0@citrix.com>
Date: Thu, 19 Nov 2020 17:12:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <47a30c4a-b05b-fdc5-0d7a-549fdd15a801@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 19/11/2020 17:10, Andrew Cooper wrote:
> On 19/11/2020 16:37, Jan Beulich wrote:
>> On 19.11.2020 17:10, Andrew Cooper wrote:
>>> On 19/11/2020 15:57, Jan Beulich wrote:
>>>> Found by looking for patterns similar to the one Julien did spot in
>>>> pci_vtd_quirks().
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Subject is wonky.  Is it P4 (Intel), or Fam15 (AMD) ?  I'd be tempted to
>>> have the prefix as x86/nmi: either way.
>> With this code:
>>
>>     case X86_VENDOR_INTEL:
>>         switch (boot_cpu_data.x86) {
>>         case 6:
>>             setup_p6_watchdog((boot_cpu_data.x86_model < 14) 
>>                               ? P6_EVENT_CPU_CLOCKS_NOT_HALTED
>>                               : CORE_EVENT_CPU_CLOCKS_NOT_HALTED);
>>             break;
>>         case 15:
>>             if (!setup_p4_watchdog())
>>
>> I think qualifying it like I did is quite reasonable. Hence ...
>>
>>> With that suitably adjusted, Acked-by: Andrew Cooper
>>> <andrew.cooper3@citrix.com>
>> ... I'd prefer to keep it as is - please clarify.
> Oh - original Xeon's.  I'd honestly forgotten that quirk of history.
>
> I'd recommend "x86/nmi: Avoid UB in for P4-era watchdogs" to avoid the
> ambiguity altogether.

And if I could actually english, that would read "Avoid UB for P4-".

~Andrew

