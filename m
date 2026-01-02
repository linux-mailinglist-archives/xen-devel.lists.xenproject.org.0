Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98474CEE6E7
	for <lists+xen-devel@lfdr.de>; Fri, 02 Jan 2026 12:54:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194920.1513070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbdia-000430-D3; Fri, 02 Jan 2026 11:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194920.1513070; Fri, 02 Jan 2026 11:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbdia-00041Y-9A; Fri, 02 Jan 2026 11:53:20 +0000
Received: by outflank-mailman (input) for mailman id 1194920;
 Fri, 02 Jan 2026 11:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OG7i=7H=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vbdiY-00041S-GO
 for xen-devel@lists.xenproject.org; Fri, 02 Jan 2026 11:53:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e912b33-e7d1-11f0-9ccf-f158ae23cfc8;
 Fri, 02 Jan 2026 12:53:14 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 1E5C54EE3BF1;
 Fri,  2 Jan 2026 12:53:13 +0100 (CET)
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
X-Inumbo-ID: 9e912b33-e7d1-11f0-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1767354793;
	b=lWHe1KvKwMy5ygJTclDXNClhXYzLMMu8LTcFTc73BTyjpTAHtYhY+J2hhjDaj1N36Bwh
	 +NoH5UR53JsmUHUb4ohH4Mtx1NqWDA5D+F1SQ4nI3Nzanaf7R/ikPyKSE1yeIEphOGbAZ
	 ghu6oavOq/QDK9KtRGPYGMa4X1pCCaLjGDmZQql7eOTxI/rz/XldB/Yhf/gV1VXX/ivWJ
	 FYsh1a+35iXJrZ7HH+0to7t6tXRsDJsLJwVL8SpGs9FpqKrtZMnzMg5pnC2C/J0gF/Hl3
	 t271Q++lRDiuh+Z8jKK1OHO84/CSWOHJjIsaAM20ujlwH6yaFURpsj3zKM5HQSZB5pvEb
	 28FTdVc7+f4/g+JjfG+0e8npgzC/9WyRRB7C6qgC4tTY5NFG1/N34i98sqvy+phi9nstY
	 YIW2M2Vjhd6+lpgLssRYd6ux8tA0NJqumyUHJZelU0XaFsb60Ba4xaux2S1YALHVsf8CY
	 85eLLh1dNgFBbRj+jAn8/Z6/AwSR00sa7aT5pHprcArFYDyOYrOSmH4nQaI5jSQcUl6/B
	 7V3mjn2b2qZuuQ1e2Ckn04PCErbzIshEURi+75f11FmquB8sDBlDBy8p8WVtryb2Q/tEP
	 kAumo+Eddov6V9vHWBNSecki12n1+iS+rdOPIzJTW6/PvMaPKSc37eTVoo0YIog=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1767354793;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=GBQdkdQCLkFLBwvjCkDIdwxPjwFznPD3sgAMOHZLt9I=;
	b=s2k9kVC0d06DjDnjYj3++oONo0LkKVNJavym+BKQu7V0jdU+2N5GmhMgOj+ea1CiK/Ax
	 G+HfLZ/MAGvAl1akUszlMyI4hAsqselXHMBzMDRL1HYmMFfpszqwWFkCdcXQ9MPj13Mfd
	 x+kdvz28+8Ex2o9MRdIakGwImxbEvuzEbDQNAD71SWEafbryC4+tKe/9OtcuoCyapTl23
	 hYfQaf73lZB3hpYiA2atykzZpvP2VVC2ZzCMgJ7J3JkxK1t/C4aX3r4txcsv544oMFzEo
	 BRJcnNXqfzt/YKYZjQqwUUXE3d9kGdUzMcYpEAhyqQPaLWUFBmEnhKS0Mglx5NeFlILoM
	 3GcvT6YMzUqF6FiKBcBmPaS7sQu27Y25E7E6+PZa3S7+1fOKl9qf0X0B14mqsCcUPId28
	 SkUOIlM4gbnm2Wr+jf++TRP/sPZG8auGkzZZK+PfiqTT5MLzfK91NQR+pjBXHKER7GasE
	 LLDs2uzIZA8eIg3fyC/4R6+dTWGvI9pkq18PI+oye73RC41XQOSHKBIVilUijJDnlSTkh
	 tjGODwRhYrEU2EQK5V77DSdAJvdmYTOyAg4sPZeLSnJGwqeRxe1XWhhsGJ6dMk/bWayjn
	 mjgsfWPjX9zPwm+JPWz87q86FyJPxm18nbO63IyMMt6IInGwGcW62OTaHL7QWRA=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1767354793; bh=Npq9oEZbZzzLWGpHEQTOn38Lskoh4OH7F8bHIUAeYq4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=loooHjHphBWZ6+8s9NRNPPTQVxdRLrpABLlY+jUxL5anqc0YJ02gipFDDEdaw0Lp+
	 dWPahfr8Fr/RLoiL2K34Z3Z1lMgW+E8AuxXMetz0HiHhBfWLvY60QQdQ5QNn3CqrPK
	 QWEfiMmvGdGDDM1r89V/e10dUI4pqD8zo1kyxjW5u38d9BE2RlBXWX+NpxmReQVmJp
	 AGMKGPWjeXlfXk2t6vQwq+RCeVLqlKyK+xFZbP07y0BMEvmgqOuIrF8SCkcsHxyI0F
	 qlqbDduYYYa52GpT6A/tKlv1Opv16dLGE3ilfuS70dN42sxTNuC30YKLA6QDPspwhQ
	 Hj0aZX4c6z+Ig==
MIME-Version: 1.0
Date: Fri, 02 Jan 2026 12:53:13 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] xen: rework deviation to address varargs MISRA
 violations
In-Reply-To: <24aefd91-18ef-4ac2-a1b2-6098aa31e716@citrix.com>
References: <d2ba22d6a36a4f2b952a80712aac2cfe632e8609.1767174251.git.nicola.vetrini@bugseng.com>
 <24aefd91-18ef-4ac2-a1b2-6098aa31e716@citrix.com>
Message-ID: <6a0d6249997997a1b152d860932f68bc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-02 10:42, Andrew Cooper wrote:
> On 31/12/2025 11:22 am, Nicola Vetrini wrote:
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 219ba6993b90..7dee4a488d45 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -570,13 +570,11 @@ safe."
>>  # Series 17.
>>  #
>> 
>> --doc_begin="printf()-like functions are allowed to use the variadic 
>> features provided by stdarg.h."
>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
>> --config=MC3A2.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
>> +-doc_begin="printf()-like or scanf()-like functions are allowed to 
>> use the variadic features provided by stdarg.h,
>> +provided that they are declared using the `format' attribute."
>> +-decl_selector+={format_attr, "property(format)"}
>> +-config=MC3A2.R17.1,reports+={deliberate, 
>> "any_area(^.*va_list.*$&&context(ancestor_or_self(format_attr)))"}
>> +-config=MC3A2.R17.1,macros+={deliberate , 
>> "^va_(arg|start|copy|end)$"}
>>  -doc_end
>> 
>>  -doc_begin="Not using the return value of a function does not 
>> endanger safety if it coincides with an actual argument."
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index b3431ef24e26..584907b048ec 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -570,8 +570,8 @@ Deviations related to MISRA C:2012 Rules:
>>       - Tagged as `deliberate` for ECLAIR.
>> 
>>     * - R17.1
>> -     - printf()-like functions  are allowed to use the variadic 
>> features provided
>> -       by `stdarg.h`.
>> +     - printf()-like or scanf()-like functions are allowed to use the 
>> variadic
>> +       features provided by `stdarg.h`.
>>       - Tagged as `deliberate` for ECLAIR.
> 
> Much nicer.  But don't we want to repeat the part about
> __attribute__((format(...))) here?  After all, that is the 
> justification
> of why it's safer than nothing.
> 

Ok, that would be more accurate for sure. I didn't do that to preserve 
the original intention of the deviation, but they are practically 
equivalent with the current codebase, so changing the text makes little 
difference. I'll tweak that.

> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

