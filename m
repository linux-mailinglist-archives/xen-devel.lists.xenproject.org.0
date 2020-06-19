Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B12200A1E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 15:29:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmH4q-0000vK-2M; Fri, 19 Jun 2020 13:29:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezQq=AA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jmH4o-0000vF-Nl
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 13:29:02 +0000
X-Inumbo-ID: d6205d3c-b230-11ea-b7bb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6205d3c-b230-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 13:29:01 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pLU/hlGo7Oq7gTSVlXPjoEOWkvHOyHO5R+EV8dws81gr5+18S3Od+/LcaTrmn816kWm3qcD/2R
 mylw4vFh7kSsLe31EpNVNGACoIi0cfh/mMqhgkyHfOziidCFI70uPYUFfaqBrW9pju84R4BXNP
 LoVBInbpEhBTsub7dkVF+pAntjxYU6Z412x5N5TYHK+fXDiiDo4koFeK9ij9jFqjT/2JJy8h9Y
 nxhtw/d0pr62sS3UYbZKaIGvD97eDDXa1q+lZYAHm7VSLdKFim/tNsw+cdBuab0fsWnllqjChK
 ljc=
X-SBRS: 2.7
X-MesageID: 20817032
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,255,1589256000"; d="scan'208";a="20817032"
Subject: Re: [PATCH for-4.14] x86/msr: Disallow access to Processor Trace MSRs
To: Jan Beulich <jbeulich@suse.com>
References: <20200619115823.22243-1-andrew.cooper3@citrix.com>
 <32440578-e346-85cc-abad-1aa5694f0ab2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <855c1668-3f91-c084-70d5-76f3e171f074@citrix.com>
Date: Fri, 19 Jun 2020 14:28:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <32440578-e346-85cc-abad-1aa5694f0ab2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/06/2020 13:48, Jan Beulich wrote:
> On 19.06.2020 13:58, Andrew Cooper wrote:
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -168,6 +168,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>      case MSR_TSX_FORCE_ABORT:
>>      case MSR_TSX_CTRL:
>>      case MSR_MCU_OPT_CTRL:
>> +    case MSR_RTIT_OUTPUT_BASE:
>> +    case MSR_RTIT_OUTPUT_MASK:
>> +    case MSR_RTIT_CTL:
>> +    case MSR_RTIT_STATUS:
>> +    case MSR_RTIT_CR3_MATCH:
>> +    case MSR_RTIT_ADDR_A(0) ... MSR_RTIT_ADDR_B(3):
> The respective CPUID field is 3 bits wide, so wouldn't it be better
> to cover the full possible range (0...6 afaict)?

Last time I tried, you objected to me covering MSR ranges which weren't
defined.

If you want to extend the range like that, it ought to be
MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7) to cover the entire area
which seems to be exclusively for PT.

~Andrew

