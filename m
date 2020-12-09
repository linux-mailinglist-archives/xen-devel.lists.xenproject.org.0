Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C972D489D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 19:09:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48608.85968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn3td-00009A-Eq; Wed, 09 Dec 2020 18:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48608.85968; Wed, 09 Dec 2020 18:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn3td-00008l-Bl; Wed, 09 Dec 2020 18:09:01 +0000
Received: by outflank-mailman (input) for mailman id 48608;
 Wed, 09 Dec 2020 18:09:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJeK=FN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kn3tc-00008g-AN
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 18:09:00 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 375ceb45-e9a5-4588-87be-34dad0fe1fd8;
 Wed, 09 Dec 2020 18:08:58 +0000 (UTC)
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
X-Inumbo-ID: 375ceb45-e9a5-4588-87be-34dad0fe1fd8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607537338;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=cBU3LS98o+fjiQPofsknAqLnUizj3TVodTJMvLkvuNM=;
  b=RQoLXZIhaIQxMgWSbCc/hoJAIe2tWhA/opPx2v2T1nR5mcyIjw7jRERe
   +Rzfq9SGkPKbdUXhY4ajIdgX7GpLbWHSSkij8Kt9jpjNBAsgL+ZKHb/pa
   KnurcWxgDb3lvA8l1bjjd1LZF1FQtXm9YFamOO7y6JgjSPnTCOa+CFv5u
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ilHGjCB9KEJmVYK57iapJYRZLA7WicDig9i8/+OCfrMqEi/awjt07bWeqo0cMmYsQZN6eZcBhX
 z8lgvCEvr2LQ0llrSb8IyiHtW1V5ke3fqTODLq8i8memPKcRbtScbN2D9JEqawPT0oKV3kLpnV
 v/fVFj6S/knaBzv7iSV9zFUI54aHcfN+LsLcvpX/U5P5zLavyd+1IKlxqHCPwyWI/35bsXxTb1
 9CdhzXcCVCFILAiEDy+VyVbI5g5COuS4pCI/x1lce2kYfRvCyrbxwZLiGKaCE3mAGNDYn9fFEv
 vtI=
X-SBRS: 5.2
X-MesageID: 32883396
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,405,1599537600"; 
   d="scan'208";a="32883396"
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
References: <20201208175738.GA3390@antioche.eu.org>
 <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
 <20201209101512.GA1299@antioche.eu.org>
 <3f7e50bb-24ad-1e32-9ea1-ba87007d3796@citrix.com>
 <20201209135908.GA4269@antioche.eu.org>
 <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
 <20201209154431.GA4913@antioche.eu.org>
 <52e1b10d-75d4-63ac-f91e-cb8f0dcca493@citrix.com>
 <20201209163049.GA6158@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
Date: Wed, 9 Dec 2020 18:08:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209163049.GA6158@antioche.eu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 09/12/2020 16:30, Manuel Bouyer wrote:
> On Wed, Dec 09, 2020 at 04:00:02PM +0000, Andrew Cooper wrote:
>> [...]
>>>> I wonder if the LDT is set up correctly.
>>> I guess it is, otherwise it wouldn't boot with a Xen 4.13 kernel, isn't it ?
>> Well - you said you always saw it once on 4.13, which clearly shows that
>> something was wonky, but it managed to unblock itself.
>>
>>>> How about this incremental delta?
>>> Here's the output
>>> (XEN) IRET fault: #PF[0000]                                                    
>>> (XEN) %cr2 ffff820000010040, LDT base ffffc4800000a000, limit 0057             
>>> (XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  
>>> (XEN) IRET fault: #PF[0000]                                                    
>>> (XEN) %cr2 ffff820000010040, LDT base ffffc4800000a000, limit 0057             
>>> (XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  
>>> (XEN) IRET fault: #PF[0000]                                                 
>> Ok, so the promotion definitely fails, but we don't get as far as
>> inspecting the content of the LDT frame.  This probably means it failed
>> to change the page type, which probably means there are still
>> outstanding writeable references.
>>
>> I'm expecting the final printk to be the one which triggers.
> It's not. 
> Here's the output:
> (XEN) IRET fault: #PF[0000]
> (XEN) %cr2 ffff820000010040, LDT base ffffbd000000a000, limit 0057
> (XEN) *** LDT: gl1e 0000000000000000 not present
> (XEN) *** pv_map_ldt_shadow_page(0x40) failed
> (XEN) IRET fault: #PF[0000]
> (XEN) %cr2 ffff820000010040, LDT base ffffbd000000a000, limit 0057
> (XEN) *** LDT: gl1e 0000000000000000 not present
> (XEN) *** pv_map_ldt_shadow_page(0x40) failed

Ok.  So the mapping registered for the LDT is not yet present.  Xen
should be raising #PF with the guest, and would be in every case other
than the weird context on IRET, where we've confused bad guest state
with bad hypervisor state.

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 3ac07a84c3..35c24ed668 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1235,10 +1235,6 @@ static int handle_ldt_mapping_fault(unsigned int
offset,
     {
         printk(XENLOG_ERR "*** pv_map_ldt_shadow_page(%#x) failed\n",
offset);
 
-        /* In hypervisor mode? Leave it to the #PF handler to fix up. */
-        if ( !guest_mode(regs) )
-            return 0;
-
         /* Access would have become non-canonical? Pass #GP[sel] back. */
         if ( unlikely(!is_canonical_address(curr->arch.pv.ldt_base +
offset)) )
         {


This bodge ought to cause a #PF to be delivered suitably, but may make
other corner cases not quite work correctly, so isn't a clean fix.

~Andrew

