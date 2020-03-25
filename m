Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92633192856
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 13:29:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH56E-0005Yx-0x; Wed, 25 Mar 2020 12:25:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH56D-0005Ys-E2
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 12:25:33 +0000
X-Inumbo-ID: b8498580-6e93-11ea-85f5-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8498580-6e93-11ea-85f5-12813bfff9fa;
 Wed, 25 Mar 2020 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585139132;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2oqW9p+kO00e9oQGyUirUvrQNjHAzFoIzSUJAdMZ+HU=;
 b=cYVlIsw9ZmlRZEDJClifg52F2hcuGg3z2eIUsm8PsgMVblKROigGa2ck
 dMuwIMyK/zidgOI/iuiZ1iw9BHMvqgunHNDFAykC4r1XhYS1IEP38fuk7
 JIq+DK3iUE1+staWbNjVv/x5zXfEZE9LrvgsbMWz9UpWlFBXjcOJH64E5 E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: y8uxJ+COmieRDDZ5uYYLPJmsCpqF2OBak7eFAXD2D4wO67OU5RRPNjHHtu2OuBx7kuRSJo/HrN
 zzqBQt+ArStYmSeZmQULK8fjryplm6s++HypE42cnvdVIlZIRKY0G12DCb3p/xwwvJuTusNt5r
 mIx8uhnVYVPXDW7rRjWKQE6gIOGhO6Rm6J+wJGKvTEIDqmGeQVqPg/tixsZMjhdJBrP73p54IM
 JqHy29LgQyU4fHnFOm2mt/1bfYU7ry4kggaEkfeeJF+Rtm8w7PdBxfvJbTkn3QO50Ql+rFEcjv
 3Gc=
X-SBRS: 2.7
X-MesageID: 14585883
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14585883"
To: Jan Beulich <jbeulich@suse.com>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
 <78b62646-6fd4-e5b3-bc09-783bb017eaaa@suse.com>
 <9af3c1bb-5b8f-4ff5-c9ce-2f34af652814@citrix.com>
 <6fe56e73-6d6c-9f8a-136d-ace39e9c8b09@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0eba5bb2-90f4-12ab-be51-71d22bd04cd7@citrix.com>
Date: Wed, 25 Mar 2020 12:25:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6fe56e73-6d6c-9f8a-136d-ace39e9c8b09@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 7/7] x86emul: support SYSRET
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/03/2020 11:55, Jan Beulich wrote:
> On 25.03.2020 11:00, Andrew Cooper wrote:
>> On 24/03/2020 16:29, Jan Beulich wrote:
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>> @@ -5975,6 +5975,60 @@ x86_emulate(
>>>              goto done;
>>>          break;
>>>  
>>> +    case X86EMUL_OPC(0x0f, 0x07): /* sysret */
>>> +        vcpu_must_have(syscall);
>>> +        /* Inject #UD if syscall/sysret are disabled. */
>>> +        fail_if(!ops->read_msr);
>>> +        if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
>>> +            goto done;
>>> +        generate_exception_if((msr_val & EFER_SCE) == 0, EXC_UD);
>> (as with the SYSCALL side), no need for the vcpu_must_have(syscall) as
>> well as this check.
> Upon re-reading I'm now confused - are you suggesting to also drop
> the EFER.SCE check?

No.  The SCE check is critical and needs to remain.

The exact delta I had put together was:

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c
b/xen/arch/x86/x86_emulate/x86_emulate.c
index c730511ebe..57ce7e00be 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5883,9 +5883,11 @@ x86_emulate(
 
 #ifdef __XEN__
     case X86EMUL_OPC(0x0f, 0x05): /* syscall */
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
+        if ( !in_protmode(ctxt, ops) ||
+             ((ctxt->cpuid->x86_vendor & X86_VENDOR_INTEL) &&
!mode_64bit()) )
+            generate_exception(EXC_UD);
 
-        /* Inject #UD if syscall/sysret are disabled. */
+        /* Inject #UD if SCE is disabled.  Subsumes the SYSCALL CPUID
check. */
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) !=
X86EMUL_OKAY )
             goto done;


(Looking at the commit date, Mon Dec 19 13:32:11 2016 is quite a long
time ago...)

~Andrew


