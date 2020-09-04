Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864CF25D566
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 11:48:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE8K3-0005X4-A6; Fri, 04 Sep 2020 09:47:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtGI=CN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kE8K2-0005Wv-M8
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 09:47:54 +0000
X-Inumbo-ID: d058353c-2d8e-4b47-8968-f4966f72bb55
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d058353c-2d8e-4b47-8968-f4966f72bb55;
 Fri, 04 Sep 2020 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599212873;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3pwiXvZe7/mobXWP+by0Bip8BN/N0N63wKrY25xs3S8=;
 b=gz/CNRpdgvJkuYm7fMlYetG6aA83ofrxiloeaAqaxGI1+QMziA+/dNLK
 E68Up2QbS614Cm77EvkXCAEc9hG5RyNu7lwdU3nirYHrqDDeItjmSXLq3
 TNyMeW94hB4+2G0ouIbAa+bcU1wkFAOcz/ka/CW65Aanb3L/kO6QafF/q E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Zp6604uL2+s0HC5C9RZhg8lzEJV9aQt9ncHgyEd/55kl3hWPXKBt6qV9UR9AF7XCC+BMRBjD5g
 z5gR9nllYWXalOVuySzWqwF8TVumFlZ8eKxG0N2+mt8T2srSEKWwyC/shhGH4hJ0KZ01JkV7ZX
 id/WoudKHvn+STE1DERJMQQoY7S0JNdRx8B0txVJeROb3GdsQRMwvk58oC+chiat0E6Cu/rZBK
 /sp2AFc7e5+0vMSt3nNad/4CC5QKr19YMUcjrtg+qqWTs7LRh8sJOT834ixDVwhGS83LGKA+to
 LqU=
X-SBRS: 2.7
X-MesageID: 26005004
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26005004"
Subject: Re: [PATCH v3 2/8] x86/svm: silently drop writes to SYSCFG and
 related MSRs
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-3-roger.pau@citrix.com>
 <104af385-f554-b2f6-6d08-37281bb72bba@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <668cef32-5cb6-6024-192a-0e6eb7caa301@citrix.com>
Date: Fri, 4 Sep 2020 10:47:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <104af385-f554-b2f6-6d08-37281bb72bba@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 04/09/2020 09:36, Jan Beulich wrote:
> On 01.09.2020 12:54, Roger Pau Monne wrote:
>> The SYSCFG, TOP_MEM1 and TOP_MEM2 MSRs are currently exposed to guests
>> and writes are silently discarded. Make this explicit in the SVM code
>> now, and just return default constant values when attempting to read
>> any of the MSRs, while continuing to silently drop writes.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -1917,6 +1917,9 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>              goto gpf;
>>          break;
>>  
>> +    case MSR_K8_SYSCFG:
>> +    case MSR_K8_TOP_MEM1:
>> +    case MSR_K8_TOP_MEM2:
>>      case MSR_K8_VM_CR:
>>          *msr_content = 0;
>>          break;
> Andrew, since you did suggest otherwise before, may I ask for an
> explicit statement of yours here, be it in ack/nak form or something
> less formal?

I'm not entirely convinced it is a safe thing to do, but lets see what
happens.

There is likely to be a bug tail from the flipping the default behaviour
at the end of the series, and this is certainly a simpler set of logic
than the alternative.

~Andrew

