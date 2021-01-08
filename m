Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DF92F1652
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 14:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64862.114688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxbx-0002Un-QR; Mon, 11 Jan 2021 13:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64862.114688; Mon, 11 Jan 2021 13:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxbx-0002UN-Mq; Mon, 11 Jan 2021 13:51:57 +0000
Received: by outflank-mailman (input) for mailman id 64862;
 Mon, 11 Jan 2021 13:51:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM29=GO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kyxbv-0002UF-De
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 13:51:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44831a7c-bb63-4c0e-a857-de2a9a7e4b38;
 Mon, 11 Jan 2021 13:51:54 +0000 (UTC)
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
X-Inumbo-ID: 44831a7c-bb63-4c0e-a857-de2a9a7e4b38
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610373114;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=HAcV3pYDeQumGZkHBAwCTK57xhRyJmySWgKKlDPRnHk=;
  b=LyFuE/vsld87GICCYY9FJcOdoZNFPUccMwtN5dFXftZQmrClrbtLxwE0
   tBuq6mN+g6d2tcdMqTo14Kn5a1w8uf/wIpugbSpXcu9/l/pAgghqS5SjX
   umedRGEswQP0OKX4GpBWUU8RthmzaptQB4MsvPzxgqAd1c8C/nsK6S12M
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Pbnybj48aW/KHLPzOZqhAUWjPfLt6eZwSSzSVzgcoTDkCD6Yfr4wJlMflMoHnFcrIfdQHuZdz0
 dEsF658fALDFTUbazOFa35WmGTj7+oQHwGIkaV9TUzOb5FNtmBFaBo0MGwqerDVOrLxFzfJshY
 FwcskRh5uXOIhMgjASpuTZnpcx6trEw3c+FLH+SrNnt9tGvwvJdqC87cgtI27G+WcBYytC/osU
 WQU2NT6+NIfvEzcDG9nsYPQSkRg1rOCtYYvDp+mT34GKXL0pV81cXLpcN+yZqp01dlzF5I3k3r
 RQI=
X-SBRS: 5.2
X-MesageID: 35192170
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="35192170"
Subject: Re: [PATCH v2 09/11] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: <paul@xen.org>, 'Xen-devel' <xen-devel@lists.xenproject.org>
CC: 'George Dunlap' <George.Dunlap@eu.citrix.com>, 'Ian Jackson'
	<iwj@xenproject.org>, 'Jan Beulich' <JBeulich@suse.com>, 'Stefano Stabellini'
	<sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>, 'Julien Grall'
	<julien@xen.org>, =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?=
	<michal.leszczynski@cert.pl>, 'Hubert Jasudowicz'
	<hubert.jasudowicz@cert.pl>, 'Tamas K Lengyel' <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-10-andrew.cooper3@citrix.com>
 <007a01d69260$248a2fc0$6d9e8f40$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <320c7ac7-aa89-71e0-8ff4-f95be04fa242@citrix.com>
Date: Fri, 8 Jan 2021 19:36:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <007a01d69260$248a2fc0$6d9e8f40$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: FTLPEX02CAS01.citrite.net (10.13.99.120) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 24/09/2020 11:47, Paul Durrant wrote:
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index e82307bdae..8628f51402 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -4632,7 +4632,6 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>          if ( id != (unsigned int)ioservid )
>>              break;
>>
>> -        rc = 0;
>>          for ( i = 0; i < nr_frames; i++ )
>>          {
>>              mfn_t mfn;
>> @@ -4643,6 +4642,9 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>
>>              mfn_list[i] = mfn_x(mfn);
>>          }
>> +        if ( i == nr_frames )
>> +            /* Success.  Passed nr_frames back to the caller. */
> Nit: s/passed/pass

That would change the meaning of the comment, and it would no longer be
accurate.

>
>> +            rc = nr_frames;
>>          break;
>>      }
>>  #endif
>> diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
>> index 834c5e19d1..17619f26ed 100644
>> --- a/xen/common/compat/memory.c
>> +++ b/xen/common/compat/memory.c
>> @@ -611,6 +622,21 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>                  break;
>>              }
>>
>> +            if ( split < 0 )
>> +            {
>> +                /* Contintuation occured. */
>> +                ASSERT(rc != XENMEM_acquire_resource);
> Do you mean "op !=" here?

No.  Such an assertion had better trigger every time we hit this path.

rc is the continuation information that we're in the middle of
processing.  See also the comment about this being a giant undebuggable
mess.

~Andrew

