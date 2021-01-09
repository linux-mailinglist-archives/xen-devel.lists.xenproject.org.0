Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178C12EFC88
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 01:56:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63950.113364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky2Y3-0005Pr-OH; Sat, 09 Jan 2021 00:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63950.113364; Sat, 09 Jan 2021 00:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky2Y3-0005PS-Kb; Sat, 09 Jan 2021 00:56:07 +0000
Received: by outflank-mailman (input) for mailman id 63950;
 Sat, 09 Jan 2021 00:56:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LY79=GM=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1ky2Y1-0005PN-Qi
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 00:56:05 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2423a9bf-0c5b-4077-a24f-6927dc1dff7b;
 Sat, 09 Jan 2021 00:56:04 +0000 (UTC)
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
X-Inumbo-ID: 2423a9bf-0c5b-4077-a24f-6927dc1dff7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610153764;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=0tY0Oagrezb4fg+JAPxdBt/7whh/1q4ucIzu9Y8A5tw=;
  b=UIkv4wuvCbE5DITXoDzHRJqxUHlfcDXxoJTcewdd/nt9bQX14miucxX8
   5kpWk8EQRklUUpTz+QCk2GIL/Lfkjy7hkgCS13OH76+FIXIsneehMZomy
   Rs3VSulFrMoo6dwvhzJgjQ+54t/IbCESDboAZVdxOo4SP5cJZFM1xqsKO
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oGETOS0S0qKI87COIqBCKDKwY2KLOkBFB6tJMS849R/hgPDfOcCQMaAo35GwEIbEgaGikDjKXy
 JmEHh9XYcz3Vyb8Z2+BwPPcP+fH45GYOHAgImPKac7gRWubyiOYLWizRcLqWzPEnv0rQxdBIq3
 odcs/dwUz9H9oJpmu6kFswmbT7HlUMxmNTNX6HRKROcjDU/jcu6Ge55p7H7TxHd+GQBz/PT2MI
 seiHwBGdiB2PaSn2Ii75vFoUkydaWGtnX3TmaJfZ4I3OUC+FB0aKMkCLXDjKlGaRbTSo4RiMz7
 oFk=
X-SBRS: 5.2
X-MesageID: 36017228
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,333,1602561600"; 
   d="scan'208";a="36017228"
Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <iwj@xenproject.org>, <anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <roger.pau@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <009d01d6e598$bfdd0110$3f970330$@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com>
Date: Sat, 9 Jan 2021 00:55:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <009d01d6e598$bfdd0110$3f970330$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/01/2021 08:32, Paul Durrant wrote:
>> -----Original Message-----
>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Sent: 08 January 2021 00:47
>> To: xen-devel@lists.xenproject.org
>> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com;
>> andrew.cooper3@citrix.com; george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org;
>> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin <igor.druzhinin@citrix.com>
>> Subject: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
>>
>> TLFS 7.8.1 stipulates that "a virtual processor index must be less than
>> the maximum number of virtual processors per partition" that "can be obtained
>> through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
>> the Microsoft Hypervisor Interface" defines that starting from Windows Server
>> 2012, which allowed more than 64 CPUs to be brought up, this leaf can now
>> contain a value -1 basically assuming the hypervisor has no restriction while
>> 0 (that we currently expose) means the default restriction is still present.
>>
>> Along with previous changes exposing ExProcessorMasks this allows a recent
>> Windows VM with Viridian extension enabled to have more than 64 vCPUs without
>> going into immediate BSOD.
>>
> 
> This is very odd as I was happily testing with a 128 vCPU VM once ExProcessorMasks was implemented... no need for the extra leaf.
> The documentation for 0x40000005 states " Describes the scale limits supported in the current hypervisor implementation. If any
> value is zero, the hypervisor does not expose the corresponding information". It does not say (in section 7.8.1 or elsewhere AFAICT)
> what implications that has for VP_INDEX.
> 
> In " Requirements for Implementing the Microsoft Hypervisor Interface" I don't see anything saying what the semantics of not
> implementing leaf 0x40000005 are, only that if implementing it then -1 must be used to break the 64 VP limit. It also says that
> reporting -1 in 0x40000005 means that 40000004.EAX bits 1 and 2 *must* be clear, which is clearly not true if ExProcessorMasks is
> enabled. That document is dated June 13th 2012 so I think it should be taken with a pinch of salt.
> 
> Have you actually observed a BSOD with >64 vCPUs when ExProcessorMasks is enabled? If so, which version of Windows? I'd like to get
> a repro myself.

I return with more testing that confirm both my and your results.

1) with ExProcessorMask and 66 vCPUs assigned both current WS19 build and
pre-release 20270 of vNext boot correctly with no changes

and that would be fine but the existing documentation for ex_processor_masks
states that:
"Hence this enlightenment must be specified for guests with more
than 64 vCPUs if B<hcall_remote_tlb_flush> and/or B<hcall_ipi> are also
specified."

You then would expect 64+ vCPU VM to boot without ex_processors_mask,
hcall_remote_tlb_flush and hcall_ipi.

So,
2) without ExProcessorMaks and 66 vCPUs assigned and with hcall_remote_tlb_flush
and hcall_ipi disabled: WS19 BSODs and vNext fails to initialize secondary CPUs

After applying my change,
3) without ExProcessorMaks and 66 vCPUs assigned and with hcall_remote_tlb_flush
and hcall_ipi disabled WS19 and vNext boot correctly

So we either need to change documentation and require ExProcessorMasks for all
VMs with 64+ vCPUs or go with my change.

Igor

