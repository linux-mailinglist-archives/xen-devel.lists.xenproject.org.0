Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8BE27D2B6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.274.701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHYP-0000Tl-5z; Tue, 29 Sep 2020 15:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274.701; Tue, 29 Sep 2020 15:28:33 +0000
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
	id 1kNHYP-0000TL-1l; Tue, 29 Sep 2020 15:28:33 +0000
Received: by outflank-mailman (input) for mailman id 274;
 Tue, 29 Sep 2020 15:28:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhT6=DG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNHYM-0000T9-Vp
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:28:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74b9f53d-8f33-4136-80fb-fa02dd132d8e;
 Tue, 29 Sep 2020 15:28:29 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dhT6=DG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNHYM-0000T9-Vp
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:28:31 +0000
X-Inumbo-ID: 74b9f53d-8f33-4136-80fb-fa02dd132d8e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 74b9f53d-8f33-4136-80fb-fa02dd132d8e;
	Tue, 29 Sep 2020 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601393310;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=fCpOiE7d7u1H00SH4UgmNTpz5QwfowjqXOXaWqa8ArI=;
  b=P8p3mMH1w2YCcOkP1IqEt8AbWw/68tWeLNxtqPq4gkS1gyXN4NlrIylR
   ypSG7YzMI5NeNVYLn3WDA3iEzZr/e9K7w28UBtq6WwMR+XwT/rDGnnvnX
   u/AD4a4aju3WFVkfrihhGAofWiptrt/fFXOCEdKwbaC3/+1h29OSFAyFZ
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HlS1tVZZ6coygHYexknCeDX0vI4ihE53Mb+jEYTAAKlK5b8s6TWSAOmmitF/kHPO+CEpQyq5c8
 h8pVBqy+sAOjsEw2Kly5gHJlP38t3WMubw/vgk82XORAa8c9sZo/b+1XmrQN6M/iHPlHtcA9cq
 elpm45J9hwfLKhMS0bk8aLzLRx4G5T0B5Qz3qbiHH3TdBIWLZcVXDjn3FvZeGs5B0t2TM+Ukb2
 W7nJ/vQcIyIinqBbo4rbiY9m21fR6Y/ionzvTrIN95UkuAsMH3AU0xSXSxHbE5vaVjXH6PmIo/
 O7U=
X-SBRS: None
X-MesageID: 28207606
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,319,1596513600"; 
   d="scan'208";a="28207606"
Subject: Re: [PATCH] tools/cpuid: Plumb nested_virt down into
 xc_cpuid_apply_policy()
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20200929134852.9235-1-andrew.cooper3@citrix.com>
 <df563d52-2cca-dc02-55ae-12326e38a8be@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f718ee66-56f7-9066-1bda-fcd1c96201ca@citrix.com>
Date: Tue, 29 Sep 2020 16:28:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <df563d52-2cca-dc02-55ae-12326e38a8be@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 29/09/2020 15:05, Jan Beulich wrote:
> On 29.09.2020 15:48, Andrew Cooper wrote:
>> --- a/tools/libs/guest/xg_cpuid_x86.c
>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>> @@ -427,7 +427,7 @@ static int xc_cpuid_xend_policy(
>>  
>>  int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>                            const uint32_t *featureset, unsigned int nr_features,
>> -                          bool pae, bool itsc,
>> +                          bool pae, bool itsc, bool nested_virt,
> This increasing number of bools next to each other bears an
> increasing risk of callers getting the order wrong. Luckily
> there's just one within the tree, so perhaps not an immediate
> problem.

As the commit message said, this is the final special case.

This prototype won't grow any further, although it needs to remain until
Xen 4.13 is thoroughly obsolete, and we're not liable to find a pre-4.14
VM which lacks CPUID data in its migration stream.

>> @@ -559,7 +559,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>          p->extd.itsc = itsc;
>>  
>>          if ( di.hvm )
>> +        {
>>              p->basic.pae = pae;
>> +            p->basic.vmx = nested_virt;
>> +            p->extd.svm = nested_virt;
>> +        }
>>      }
>>  
>>      if ( !di.hvm )
>> @@ -625,14 +629,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>              }
>>              break;
>>          }
>> -
>> -        /*
>> -         * These settings are necessary to cause earlier HVM_PARAM_NESTEDHVM
>> -         * to be reflected correctly in CPUID.  Xen will discard these bits if
>> -         * configuration hasn't been set for the domain.
>> -         */
>> -        p->basic.vmx = true;
>> -        p->extd.svm = true;
>>      }
> While I can see how the first sentence in the comment has become
> irrelevant now, what about the second?

Well - I'm writing the series to actually make it irrelevant.

> It's still odd to see both
> svm and vmx getting set to identical values. Therefore perhaps
> worth to retain a shorter comment there?

The comment is true for every feature bit, and is not special to
vmx/svm.  With the absence of the first part, the second part isn't
relevant.

~Andrew

