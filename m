Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8AB203DA5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 19:17:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnQ3n-00065b-6K; Mon, 22 Jun 2020 17:16:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MNSJ=AD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jnQ3l-00065W-Ng
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 17:16:41 +0000
X-Inumbo-ID: 22ef1c20-b4ac-11ea-beb0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22ef1c20-b4ac-11ea-beb0-12813bfff9fa;
 Mon, 22 Jun 2020 17:16:40 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hJvmAA4P5Vj+eLdeFrVChFjHf5w+aJy5ku8a4hfTC99wEquHUHSsi8DRHjpIjcKawhiN4izQfK
 BXv4Tk8l85oZUHDrJYbWl2xo0II6jp0kXYqvwvitNmbE+M6Hd2tTPVFyD6e5QOXSac7vIwILOy
 T3P/AVBW7o4++AvJfjZkZ+7sEwXgZZbFuzdMaqt2Qr8xnxv500aYr+GXCubcuYFj17yzg0wy5c
 PhVENiCYkrAqnnAVqh8r+GCX2uZmCXgptp/ROj+jUY3TnDLiZ+SYSBHXvdY23DSVTmk7OkSiry
 QQ4=
X-SBRS: 2.7
X-MesageID: 20865635
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,268,1589256000"; d="scan'208";a="20865635"
Subject: Re: [PATCH for-4.14] x86/msr: Disallow access to Processor Trace MSRs
To: Jan Beulich <jbeulich@suse.com>
References: <20200619115823.22243-1-andrew.cooper3@citrix.com>
 <32440578-e346-85cc-abad-1aa5694f0ab2@suse.com>
 <855c1668-3f91-c084-70d5-76f3e171f074@citrix.com>
 <f2152e32-ab27-12d2-f82c-7108c0c9867b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d0b118e7-5c46-bebe-b8ec-c8ae06283529@citrix.com>
Date: Mon, 22 Jun 2020 18:16:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f2152e32-ab27-12d2-f82c-7108c0c9867b@suse.com>
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
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/06/2020 14:39, Jan Beulich wrote:
> On 19.06.2020 15:28, Andrew Cooper wrote:
>> On 19/06/2020 13:48, Jan Beulich wrote:
>>> On 19.06.2020 13:58, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/msr.c
>>>> +++ b/xen/arch/x86/msr.c
>>>> @@ -168,6 +168,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>>      case MSR_TSX_FORCE_ABORT:
>>>>      case MSR_TSX_CTRL:
>>>>      case MSR_MCU_OPT_CTRL:
>>>> +    case MSR_RTIT_OUTPUT_BASE:
>>>> +    case MSR_RTIT_OUTPUT_MASK:
>>>> +    case MSR_RTIT_CTL:
>>>> +    case MSR_RTIT_STATUS:
>>>> +    case MSR_RTIT_CR3_MATCH:
>>>> +    case MSR_RTIT_ADDR_A(0) ... MSR_RTIT_ADDR_B(3):
>>> The respective CPUID field is 3 bits wide, so wouldn't it be better
>>> to cover the full possible range (0...6 afaict)?
>> Last time I tried, you objected to me covering MSR ranges which weren't
>> defined.
> Wasn't that for a range where some number had been re-used from
> earlier models (with entirely different purpose)?

I don't recall, but the answer isn't relevant to whether the MSRs at
those indices ought to be available to guests.

>> If you want to extend the range like that, it ought to be
>> MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7) to cover the entire area
>> which seems to be exclusively for PT.
> I'd be okay with that, just that I'm not sure about (7): While
> SDM Vol 2 oddly enough doesn't seem to list anything for leaf 7
> subleaf 1 (or I'm sufficiently blind today), Vol 4 clearly says
> for n=0...3 "If CPUID.(EAX=07H,ECX=1):EAX[2:0] > <n>", and the
> field obviously can't be > 7.

7 gives the top of the bank of MSRs.  It isn't related to CPUID data.

~Andrew

