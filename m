Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785BB1B634A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 20:25:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRgWq-00033t-E9; Thu, 23 Apr 2020 18:24:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RhWH=6H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jRgWo-00033o-SU
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 18:24:50 +0000
X-Inumbo-ID: b79bb30c-858f-11ea-b4f4-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b79bb30c-858f-11ea-b4f4-bc764e2007e4;
 Thu, 23 Apr 2020 18:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587666289;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZuRPvzP5RhQQj1vPpkgmGQcC/jvY/fJcAxuR7XGimWY=;
 b=CKnj5y+ZGWIpOARsD2CWO30ooIg/eb0oVYEi7TTt1ZrM+aOQj8lGsJAP
 OXObOPpxJ4dhGMNeLVQAicyEPpqMJo+bhNKpp2wSbbDXpqjQVCNu8jbDa
 iby/fWlFcQxfflLYTaWM6mQvE79/wQmo+K/KVW6KYbsvnmQ73+8q+LDLY U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Oy3YT2v5iaX1icqMggkX0F81kutOMdVNB+pKUOJXDGRofviPmU3r3zHo7Mqz7+QcsBZXYvEfhm
 ZW3Ejix3Ol0aEXmwECU+wQhkXxpSbkq0zf/FKUUoD2RnY9XfEppbYVVryh1BN1qQMikNWP7Z3q
 aV4TUtsAgdLTtubludoWIlp1YOdbuv2VgqBccvx+ILUIwQ1nilfp6nXcridXxOZveFJSd4k4Fk
 slCFeaeVTCAdA9sDH3cBn/nLa/6G8z+4KdQUeKqVWfcZifvVsviHcdM3/pr2+oew/vf7aD9/U7
 iLE=
X-SBRS: 2.7
X-MesageID: 16466474
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208";a="16466474"
Subject: Re: [PATCH 1/3] x86/S3: Use percpu_traps_init() rather than
 opencoding SYSCALL/SYSENTER restoration
To: Jan Beulich <jbeulich@suse.com>
References: <20200420145911.5708-1-andrew.cooper3@citrix.com>
 <20200420145911.5708-2-andrew.cooper3@citrix.com>
 <db70738a-4750-2780-2f44-b0bcd3a5f93b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4ff5227c-a9a4-f6cc-2068-ddd41165ebaf@citrix.com>
Date: Thu, 23 Apr 2020 19:24:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <db70738a-4750-2780-2f44-b0bcd3a5f93b@suse.com>
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

On 21/04/2020 08:24, Jan Beulich wrote:
> On 20.04.2020 16:59, Andrew Cooper wrote:
>> @@ -46,24 +36,13 @@ void restore_rest_processor_state(void)
>>      /* Restore full CR4 (inc MCE) now that the IDT is in place. */
>>      write_cr4(mmu_cr4_features);
>>  
>> -    /* Recover syscall MSRs */
>> -    wrmsrl(MSR_LSTAR, saved_lstar);
>> -    wrmsrl(MSR_CSTAR, saved_cstar);
>> -    wrmsrl(MSR_STAR, XEN_MSR_STAR);
>> -    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
>> +    /* (re)initialise SYSCALL/SYSENTER state, amongst other things. */
>> +    percpu_traps_init();
> Without tweaks to subarch_percpu_traps_init() this assumes that,
> now and going forward, map_domain_page() will work reliably at
> this early point of resume. I'm not opposed, i.e.
> Acked-by: Jan Beulich <jbeulich@suse.com>

I think this reasonable to expect, and robust going forward.

We are properly in d[IDLE]v0 context when it comes to pagetables, and
there is nothing interesting between this point and coming fully back
online.

That said, I could easily move the call to later in the resume path for
even more certainty.

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 3ad7dfc9a3..d5a468eddd 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -297,6 +297,8 @@ static int enter_state(u32 state)
     ci->spec_ctrl_flags |= (default_spec_ctrl_flags & SCF_ist_wrmsr);
     spec_ctrl_exit_idle(ci);
 
+    /* (re)initialise SYSCALL/SYSENTER state, amongst other things. */
+    percpu_traps_init();
+
  done:
     spin_debug_enable();
     local_irq_restore(flags);

In fact - I prefer this, because it works towards one low priority goal
of deleting {save,restore}_rest_processor_state() which I've still got a
pending series for.

Would your ack still stand if I tweak the patch in this way?

> but it would feel less fragile if the redundant re-writing of
> the stubs would be skipped in the BSP resume case (I didn't
> check whether it's also redundant for APs, but I suspect it's
> not, as the stub pages may get allocated anew).

I don't really agree.  Symmetry (even if it is expected to be redundant)
is much more easy to reason about in terms of robustness.  S3 is not a
fastpath.

~Andrew

