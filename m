Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B61F1ABB03
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 10:20:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOzkN-0005qM-71; Thu, 16 Apr 2020 08:19:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HCIP=6A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOzkL-0005qH-UO
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 08:19:42 +0000
X-Inumbo-ID: 048bcee8-7fbb-11ea-b4f4-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 048bcee8-7fbb-11ea-b4f4-bc764e2007e4;
 Thu, 16 Apr 2020 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587025180;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0ixsc0CzeYa9zcT53ZlBUs1gmBMK2SR725xlwyoE4ZM=;
 b=eVYBkwBev+9fNMKU2Tid7Fzc4QLU3r1PDsdHJ8NFm1s8ZWeKUg1DFgJT
 1uXYl+9VJJTgH8/oHi2qF0LHuNdBGcaQM8+34eOx7/yc02EVNpaELz9Ni
 Lft7H3mQZCZW+7dYNHhOAxiE48ZTq0I1yHFOXRWS+2LM73fkbficXAIUD k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /bAA3odhOw10A5EzH+a+1ebWjyrYZhaSwwTURssJnoQp+Bh1rM9tld+zkkliewSayEVB+Vb7k2
 4bAKPynN0BfD22egjxFhxXmt3B1G6jWIj5DqA6q9IiYkUr0y9VekVebFUqhX40uqetL5zo5/6l
 3YD8CAtOM4+XbvTAk2uy5nHsRnr7MDIluQfx1cT0LacvQKINJ3WQwak+YCzh7t4uPXJTRgb3zF
 ZApKluZahbesdr3I/jqk42rFD4MwLs+kuHs3jdBjf0SwbHg0ifn86mSBH7jbBFre7cNEYuFn4q
 IaI=
X-SBRS: 2.7
X-MesageID: 16165154
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,390,1580792400"; d="scan'208";a="16165154"
Subject: Re: [PATCH] x86/boot: Fix early exception handling with
 CONFIG_PERF_COUNTERS
To: Jan Beulich <jbeulich@suse.com>
References: <20200415173911.13286-1-andrew.cooper3@citrix.com>
 <72b35bfa-e795-72c0-d925-924ca18711df@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4c418f62-14b5-1f77-9bf3-979b5d1f56d9@citrix.com>
Date: Thu, 16 Apr 2020 09:19:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <72b35bfa-e795-72c0-d925-924ca18711df@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On 16/04/2020 08:19, Jan Beulich wrote:
> On 15.04.2020 19:39, Andrew Cooper wrote:
>> The PERFC_INCR() macro uses current->processor, but current is not valid
>> during early boot.  This causes the following crash to occur if
>> e.g. rdmsr_safe() has to recover from a #GP fault.
>>
>>   (XEN) Early fatal page fault at e008:ffff82d0803b1a39 (cr2=0000000000000004, ec=0000)
>>   (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
>>   (XEN) CPU:    0
>>   (XEN) RIP:    e008:[<ffff82d0803b1a39>] x86_64/entry.S#handle_exception_saved+0x64/0xb8
>>   ...
>>   (XEN) Xen call trace:
>>   (XEN)    [<ffff82d0803b1a39>] R x86_64/entry.S#handle_exception_saved+0x64/0xb8
>>   (XEN)    [<ffff82d0806394fe>] F __start_xen+0x2cd/0x2980
>>   (XEN)    [<ffff82d0802000ec>] F __high_start+0x4c/0x4e
>>
>> Furthermore, the PERFC_INCR() macro is wildly inefficient.  There has been a
>> single caller for many releases now, so inline it and delete the macro
>> completely.
>>
>> For the assembly, move entry_vector from %eax into %ecx.  There is no encoding
>> benefit for movzbl, and it frees up %eax to be used inside the
>> CONFIG_PERF_COUNTERS block where there is an encoding benefit.
> I don't mind the change in register use, but I'd certainly like to
> understand the supposed "encoding benefit". Afaics ...
>
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -677,10 +677,14 @@ handle_exception_saved:
>>  #endif /* CONFIG_PV */
>>          sti
>>  1:      movq  %rsp,%rdi
>> -        movzbl UREGS_entry_vector(%rsp),%eax
>> +        movzbl UREGS_entry_vector(%rsp), %ecx
>>          leaq  exception_table(%rip),%rdx
>> -        PERFC_INCR(exceptions, %rax, %rbx)
>> -        mov   (%rdx, %rax, 8), %rdx
>> +#ifdef CONFIG_PERF_COUNTERS
>> +        lea   per_cpu__perfcounters(%rip), %rax
>> +        add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rax
>> +        incl  ASM_PERFC_exceptions * 4(%rax, %rcx, 4)
>> +#endif
> ... all insns inside the block use a ModR/M byte, and there's also
> no special SIB encoding form used (i.e. one where the disp size
> would increase because of register choice).

Hmm - I suppose it is stale, written for an older version of the logic
before I spotted a further optimisation.

> With this clarified, i.e. possibly the commit message updated
> accordingly, and possibly even code churn reduced by undoing the
> change of register used,

Leaving %eax as was, and using %rdi for the single temporary looks like:

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 997c481ecb..1984bb7948 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -679,7 +679,11 @@ handle_exception_saved:
 1:      movq  %rsp,%rdi
         movzbl UREGS_entry_vector(%rsp),%eax
         leaq  exception_table(%rip),%rdx
-        PERFC_INCR(exceptions, %rax, %rbx)
+#ifdef CONFIG_PERF_COUNTERS
+        lea   per_cpu__perfcounters(%rip), %rdi
+        add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rdi
+        incl  ASM_PERFC_exceptions * 4(%rdi, %rax, 4)
+#endif
         mov   (%rdx, %rax, 8), %rdx
         INDIRECT_CALL %rdx
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)


If you're happy with that?

~Andrew

