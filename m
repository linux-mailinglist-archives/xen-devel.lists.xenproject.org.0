Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66566255CEF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 16:46:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBfda-0002lA-Tz; Fri, 28 Aug 2020 14:45:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+vO4=CG=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kBfdY-0002jn-VJ
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 14:45:52 +0000
X-Inumbo-ID: 96bb9e54-4d0b-4e16-8346-bc5b4ca87d78
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96bb9e54-4d0b-4e16-8346-bc5b4ca87d78;
 Fri, 28 Aug 2020 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598625951;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YwTkfblPvDJ8J67XR64S6avnrbBRUB23UqDce4cUXgM=;
 b=BEWRdoHeBMA7jthQxdw2Ga7chZ/7ep4PpsunELrzd8/raeRGJGMB9PdC
 OFLpyM3Mppgv+AW2NdbU+eIVm+hq1zKDOSxai5Gk28aN066QiS7BpJCh7
 sQmaKtGL73rV/+1WyG+SczUsWHUIu+F3V3uO7T8Ls0SiaymV8VypKyqlc 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uuyVz0Xmzb4HVBD9gtdnT7ShrN0yWrGoxH/Rs6Pi5KN/RPrnq+eYbifA8jyvOHl2sRW85uMR56
 PdqXRulsMBKyEVtWvOIkEGQ+5hJIvXRtKF91LdSyeMx7EGfKw9xk+pEoCs1kIcdcZzZEbR9VqT
 p9D3JlnxgEsyzjAfJtcZAQmIwZUNQoNGyJjCFnvPy6KzAFcy0B79348D+KmIR6n9r12nzYNE6X
 jL8b3d8m/DQ8ogxzwOnrwqDmbNDL6b+AVPAiWf5B2xYArvbzeSr0ol9HOYwOi+8U7K+b7tQIhW
 wyM=
X-SBRS: 2.7
X-MesageID: 26474038
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,364,1592884800"; d="scan'208";a="26474038"
Subject: Re: [PATCH] hvmloader: indicate firmware tables as ACPI NVS in e820
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
 <roger.pau@citrix.com>, <wl@xen.org>, <iwj@xenproject.org>
References: <1598573599-23792-1-git-send-email-igor.druzhinin@citrix.com>
 <4f3a5ac9-06aa-65f5-b4e0-1d9ab01adb5a@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <2f1f937a-81f2-2aa3-f414-3bf8467715bd@citrix.com>
Date: Fri, 28 Aug 2020 15:45:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4f3a5ac9-06aa-65f5-b4e0-1d9ab01adb5a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 28/08/2020 08:51, Jan Beulich wrote:
> On 28.08.2020 02:13, Igor Druzhinin wrote:
>> Guest kernel does need to know in some cases where the tables are located
>> to treat these regions properly. One example is kexec process where
>> the first kernel needs to pass firmware region locations to the second
>> kernel which is now a requirement after 02a3e3cdb7f12 ("x86/boot: Parse SRAT
>> table and count immovable memory regions").
>>
>> The memory that hvmloader allocates in the reserved region mostly contains
>> these useful tables and could be safely indicated as ACPI without the need
>> to designate a sub-region specially for that. Making it non-reclaimable
>> (ACPI NVS) would avoid potential reuse of this memory by the guest.
>> Swtiching from Reserved to ACPI NVS type for this memory would also mean
>> its content is preserved across S4 (which is true for any ACPI type according
>> to the spec).
> 
> Marking the range as ACPI is certainly fine, but why did you choose NVS?
> There's nothing non-volatile there afaict. And the part of the last
> sentence in parentheses suggests to me that the "normal" ACPI type is as
> suitable for the purpose you're after.

The problem with normal ACPI type is that according to the spec it's reclaimable
by the OS:
"This range is available RAM usable by the OS after it reads the ACPI tables."
while NVS type is specifically designated as non-reclaimable. The spec is also
denotes that both normal and NVS types should be preserved across S4 - that sounds
ambiguous to me. But it might mean that non-NVS preservation is not OS
responsibility as it's assumed to be static.

Our region also contains VM86 TSS which we certainly need at runtime (although that
could be allocated from the reserved region above if desirable).

To stay on the safe side and do not rely on perceived sensible OS behavior NVS type
was chosen which OS shouldn't touch under any circumstances.

In fact while writing this response I found that document which confirms some of my
suspicions:
http://www.baldwin.cx/~phoenix/reference/docs/acpi_impguide.pdf

>> --- a/tools/firmware/hvmloader/e820.c
>> +++ b/tools/firmware/hvmloader/e820.c
>> @@ -155,6 +155,8 @@ int build_e820_table(struct e820entry *e820,
>>  {
>>      unsigned int nr = 0, i, j;
>>      uint32_t low_mem_end = hvm_info->low_mem_pgend << PAGE_SHIFT;
>> +    uint32_t firmware_mem_end =
>> +        RESERVED_MEMORY_DYNAMIC_START + (mem_mfns_allocated() << PAGE_SHIFT);
> 
> Here and elsewhere - please avoid uint32_t and friends when a plain
> C type (unsigned int or unsigned long in this case) will do.

Ok, should I also take a chance and convert some of the surroundings?

>> @@ -210,8 +223,8 @@ int build_e820_table(struct e820entry *e820,
>>      {
>>          uint32_t igd_opregion_base = igd_opregion_pgbase << PAGE_SHIFT;
>>  
>> -        e820[nr].addr = RESERVED_MEMBASE;
>> -        e820[nr].size = (uint32_t) igd_opregion_base - RESERVED_MEMBASE;
>> +        e820[nr].addr = firmware_mem_end;
>> +        e820[nr].size = (uint32_t) igd_opregion_base - firmware_mem_end;
> 
> Any chance I could talk you into also dropping the pointless cast
> at this occasion?

Sure.

Igor

