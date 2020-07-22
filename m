Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FE22295BC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 12:11:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyBhu-0001ef-3j; Wed, 22 Jul 2020 10:10:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvI5=BB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyBhs-0001eX-A7
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 10:10:36 +0000
X-Inumbo-ID: 953654ec-cc03-11ea-8624-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 953654ec-cc03-11ea-8624-bc764e2007e4;
 Wed, 22 Jul 2020 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595412635;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UGfBbfqXa3WXsAAtVp2FenTiXCWIaqeavpt7/jw6NqY=;
 b=AAyTLt5oT5SkOz5zaO7XHO2wOcMU6G5kCIWDKmye9IoR+ROCg2HLYyec
 NHKblxokCMKrfuokO9NphMlP5Tdf7Ti6ulvk6FXiwrYnS+HLn9sXj00S3
 vvP5s+kusffi2W49d9ov25BBX8PN47WaKTE5U5gV4gzF2dR4nufwM+Fy1 k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vGPfRNGf89t5C0y6RFfWnkADcWMfJQoOgNOR62KHeuC/U1WsgeLA6Z7m69CT45NyZW/ZZHDTmI
 x2rLgHuRGXmG9wrg9LRQIm+GKekSPsjYMo7ZX3UiAauIbzrqrnu57zgAhQZdiXOCBRIneAj50w
 LMZ2nLudQ39Fm2FVYEs36sw4Gin7A55aOZbdgQNush4bU1ZlSPApZENm/iGsnl3ztsQB1W2wko
 Bh21HyrPQ794GIvxGqAdorBeH44w+2pWDtSykGQnsxaZD4qyD41W5ug2+n5YUKsxJ4tbrhXs30
 0Ig=
X-SBRS: 2.7
X-MesageID: 23783273
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23783273"
Subject: Re: [PATCH] x86/svm: Fold nsvm_{wr,rd}msr() into
 svm_msr_{read,write}_intercept()
To: Jan Beulich <jbeulich@suse.com>
References: <20200721172208.12176-1-andrew.cooper3@citrix.com>
 <b3c3dfa9-d2b8-1042-ecf1-8f51351807e1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <96e0cb7b-c597-075c-f142-6b35aae1a881@citrix.com>
Date: Wed, 22 Jul 2020 11:10:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b3c3dfa9-d2b8-1042-ecf1-8f51351807e1@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/07/2020 10:16, Jan Beulich wrote:
> On 21.07.2020 19:22, Andrew Cooper wrote:
>> ... to simplify the default cases.
>>
>> There are multiple errors with the handling of these three MSRs, but they are
>> deliberately not addressed this point.
>>
>> This removes the dance converting -1/0/1 into X86EMUL_*, allowing for the
>> removal of the 'ret' variable.
>>
>> While cleaning this up, drop the gdprintk()'s for #GP conditions, and the
>> 'result' variable from svm_msr_write_intercept() is it is never modified.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> However, ...
>
>> @@ -2085,6 +2091,22 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>              goto gpf;
>>          break;
>>  
>> +    case MSR_K8_VM_CR:
>> +        /* ignore write. handle all bits as read-only. */
>> +        break;
>> +
>> +    case MSR_K8_VM_HSAVE_PA:
>> +        if ( (msr_content & ~PAGE_MASK) || msr_content > 0xfd00000000ULL )
> ... while you're moving this code here, wouldn't it be worthwhile
> to at least fix the > to be >= ?

I'd prefer not to, to avoid breaking the "No Functional Change" aspect.

In reality, this needs to be a path which takes an extra ref on the
nominated frame and globally maps it, seeing as we memcpy to/from it on
every virtual vmentry/exit.  The check against the HT range is quite bogus.

~Andrew

