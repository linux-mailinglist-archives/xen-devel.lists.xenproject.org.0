Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33F41ABBA5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 10:48:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP0Bj-00008c-Im; Thu, 16 Apr 2020 08:47:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HCIP=6A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jP0Bh-00008X-O8
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 08:47:57 +0000
X-Inumbo-ID: f76fe4e9-7fbe-11ea-8b67-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f76fe4e9-7fbe-11ea-8b67-12813bfff9fa;
 Thu, 16 Apr 2020 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587026877;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7v9/wyFbbQVkew1cNcrXu3u97mvWC0o4T7Is622nKEQ=;
 b=JmuCRwsltPAkGu+FghcvBbMvhbth3PdHpcrlCzffqimMh/AMIn2KQWwz
 MrAvUAuOVh8e2BIK1Ydyaya5N1yeTebl73ErMf948mxikrOCgVjwEacsv
 roKMPuRZWNwIKyg6UDi7tmpSVZ1mb3KgpYf37lfHaWn/FTeWF1WEBzxI/ o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: H/pYgj6NmDPIOA1l6Jl6wOnlNcJBkEqnZdQ4EZcAOydIgk32WMCiPSNbk1+VRhDQeiXqnn2v9h
 u7x1sSd7WjKyNvzxF2PskcVBizIGqiuT7MV7OZVykWupU/N1LjA6uW0k7kP2U1jQa+3EOE6jj3
 NuwTNN2MrybPoEpL+adQulJ/K0WPs8P2p5BSHINKH44Wr9sfA0H6h6/XymdXXI7No0rvdBBbBx
 YiB8JGttoH9r7kMFIZbciHiFjyMVIN5dBCK6OqndKIEkO4qPjOLeihLPfOdHjShJVo9OMJxyQx
 A4Y=
X-SBRS: 2.7
X-MesageID: 16440388
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,390,1580792400"; d="scan'208";a="16440388"
Subject: Re: [PATCH] x86/boot: Fix early exception handling with
 CONFIG_PERF_COUNTERS
To: Jan Beulich <jbeulich@suse.com>
References: <20200415173911.13286-1-andrew.cooper3@citrix.com>
 <72b35bfa-e795-72c0-d925-924ca18711df@suse.com>
 <4c418f62-14b5-1f77-9bf3-979b5d1f56d9@citrix.com>
 <88658e82-e38a-6230-e6ab-7cfd00e4f19f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <17d1e29a-ea6e-93f1-1fa8-393e0cd8da23@citrix.com>
Date: Thu, 16 Apr 2020 09:47:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <88658e82-e38a-6230-e6ab-7cfd00e4f19f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/04/2020 09:35, Jan Beulich wrote:
> On 16.04.2020 10:19, Andrew Cooper wrote:
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -679,7 +679,11 @@ handle_exception_saved:
>>  1:      movq  %rsp,%rdi
>>          movzbl UREGS_entry_vector(%rsp),%eax
>>          leaq  exception_table(%rip),%rdx
>> -        PERFC_INCR(exceptions, %rax, %rbx)
>> +#ifdef CONFIG_PERF_COUNTERS
>> +        lea   per_cpu__perfcounters(%rip), %rdi
>> +        add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rdi
>> +        incl  ASM_PERFC_exceptions * 4(%rdi, %rax, 4)
>> +#endif
>>          mov   (%rdx, %rax, 8), %rdx
>>          INDIRECT_CALL %rdx
>>          mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
>>
>>
>> If you're happy with that?
> I'm afraid I'm not - you can't use %rdi here, it already holds the
> called function's argument. I'd be fine with %rcx used instead.

Bah - serves me right for being lazy and not retesting.

%rcx it is.

~Andrew

