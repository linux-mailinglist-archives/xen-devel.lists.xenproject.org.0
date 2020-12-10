Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCB22D634E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 18:19:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49641.87777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPaa-0000fl-RR; Thu, 10 Dec 2020 17:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49641.87777; Thu, 10 Dec 2020 17:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPaa-0000fR-OA; Thu, 10 Dec 2020 17:18:48 +0000
Received: by outflank-mailman (input) for mailman id 49641;
 Thu, 10 Dec 2020 17:18:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25P7=FO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1knPaY-0000fM-Nd
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 17:18:46 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb64facd-6afa-42c8-9b42-4225489d2e77;
 Thu, 10 Dec 2020 17:18:45 +0000 (UTC)
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
X-Inumbo-ID: eb64facd-6afa-42c8-9b42-4225489d2e77
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607620725;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Ml0eq08gHz2a2b7moZyOahLuVT9xnMoVnmNf0GtMZPA=;
  b=d2w0mPM/OL4o/633Nf3rvrq2MFSfd/23Q2MbAZtRxIG00KUEN4PwMncL
   CgUgGeQbdd3ZooFlZjh/ZiTsayIOBEyP8+Fk6yYPh1M33lmcoS2GEY2UU
   GrQYotPhQV6jC+0oCDYfIunV9LatsEtdv+iGRWBMZTD7S7URfIDsvoprV
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3MmlqKstwSYTXm0HfeOnmb2teyx2tQn+CHBet464J0xI+5zswoZNcFQiJZjzw4qTCnIjlviT4P
 2YUguIgKNkWoLVA4t+yYSa7fYmZinR58cHO0RGz4MpCpJsWUq8Cv2VHlf9xWNn9fGG0+lhO7Q/
 Kkn12ZwqQrS/PTUo0ZqhnYyxQxFCuEXi4m362EUmCMBbQJlZnBXyL32nASweu4bdp1hnzhYfY/
 fP0BKX0+IaC4xeTCSkPgDdHezKKGr3pQ+9ZWhW/MZ8GIvOMurUWJi4+IjXXg4eUb8Ro+UDr3Um
 Y2c=
X-SBRS: 5.2
X-MesageID: 32974499
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,408,1599537600"; 
   d="scan'208";a="32974499"
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
References: <20201209135908.GA4269@antioche.eu.org>
 <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
 <20201209154431.GA4913@antioche.eu.org>
 <52e1b10d-75d4-63ac-f91e-cb8f0dcca493@citrix.com>
 <20201209163049.GA6158@antioche.eu.org>
 <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
 <20201209185714.GS1469@antioche.eu.org>
 <6c06abf1-7efe-f02c-536a-337a2704e265@citrix.com>
 <20201210095139.GA455@antioche.eu.org>
 <4c3bff12-821b-83fb-e054-61b07b97fa70@citrix.com>
 <20201210170319.GG455@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ed06a0f4-8468-addf-2797-be3ba3a2d607@citrix.com>
Date: Thu, 10 Dec 2020 17:18:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210170319.GG455@antioche.eu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 10/12/2020 17:03, Manuel Bouyer wrote:
> On Thu, Dec 10, 2020 at 03:51:46PM +0000, Andrew Cooper wrote:
>>> [   7.6617663] cs 0x47  ds 0x23  es 0x23  fs 0000  gs 0000  ss 0x3f
>>> [   7.7345663] fsbase 000000000000000000 gsbase 000000000000000000
>>>
>>> so it looks like something resets %fs to 0 ...
>>>
>>> Anyway the fault address 0xffffbd800000a040 is in the hypervisor's range,
>>> isn't it ?
>> No.  Its the kernel's LDT.  From previous debugging:
>>> (XEN) %cr2 ffff820000010040, LDT base ffffbd000000a000, limit 0057
>> LDT handling in Xen is a bit complicated.  To maintain host safety, we
>> must map it into Xen's range, and we explicitly support a PV guest doing
>> on-demand mapping of the LDT.  (This pertains to the experimental
>> Windows XP PV support which never made it beyond a prototype.  Windows
>> can page out the LDT.)  Either way, we lazily map the LDT frames on
>> first use.
>>
>> So %cr2 is the real hardware faulting address, and is in the Xen range. 
>> We spot that it is an LDT access, and try to lazily map the frame (at
>> LDT base), but find that the kernel's virtual address mapping
>> 0xffffbd000000a000 is not present (the gl1e printk).
>>
>> Therefore, we pass #PF to the guest kernel, adjusting vCR2 to what would
>> have happened had Xen not mapped the real LDT elsewhere, which is
>> expected to cause the guest kernel to do whatever demand mapping is
>> necessary to pull the LDT back in.
>>
>>
>> I suppose it is worth taking a step back and ascertaining how exactly
>> NetBSD handles (or, should be handling) the LDT.
>>
>> Do you mind elaborating on how it is supposed to work?
> Note that I'm not familiar with this selector stuff; and I usually get
> it wrong the first time I go back to it.
>
> AFAIK, in the Xen PV case, a page is allocated an mapped in kernel
> space, and registered to Xen with MMUEXT_SET_LDT.
> From what I found, in the common case the LDT is the same for all processes.
> Does it make sense ?

The debugging earlier shows that MMUEXT_SET_LDT has indeed been called. 
Presumably 0xffffbd000000a000 is a plausible virtual address for NetBSD
to position the LDT?

However, Xen finds the mapping not-present when trying to demand-map it,
hence why the #PF is forwarded to the kernel.

The way we pull guest virtual addresses was altered by XSA-286 (released
not too long ago despite its apparent age), but *should* have been no
functional change.  I wonder if we accidentally broke something there. 
What exactly are you running, Xen-wise, with the 4.13 version?

Given that this is init failing, presumably the issue would repro with
the net installer version too?

~Andrew

