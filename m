Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83C1DDC26
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 02:27:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbvW2-0004lx-Aj; Fri, 22 May 2020 00:26:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Somd=7E=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jbvW0-0004ls-To
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 00:26:20 +0000
X-Inumbo-ID: db8d919c-9bc2-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db8d919c-9bc2-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 00:26:20 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rLk77qZTgtHcHA50Wf4zZehurxawrcI6a+T+LPFa5uROfHZGX4LZDRs4/5HRvGzPR6X96cNiIB
 ZaS5P2oikfTuTJ9kCDWjqB4c5kgU3VsowI6rqyykgDGHJDTRCsAVc3QCB7h+jcXX1/2tiVDMBl
 DdF4CtnefIWdzz6EomrC+OzstG6AHT1fNAZlhAXWfN04tzkFKt2LW+BbKNCz9/kwU6XPSJUeML
 Us1Q7/Novv8jgX9eCErCEbSpwuIBdXVTp0ksm/tzIXt4rNJ+66K7QcI4q9CFrTw27+gc3/fntI
 p0E=
X-SBRS: 2.7
X-MesageID: 18421092
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,419,1583211600"; d="scan'208";a="18421092"
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
To: <xen-devel@lists.xenproject.org>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <5727f0fd-38ed-91af-ee2c-0f1f6fb830f1@citrix.com>
Date: Fri, 22 May 2020 01:26:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: andrew.cooper3@citrix.com, wl@xen.org, jbeulich@suse.com,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/05/2020 22:43, Igor Druzhinin wrote:
> If a recalculation NPT fault hasn't been handled explicitly in
> hvm_hap_nested_page_fault() then it's potentially safe to retry -
> US bit has been re-instated in PTE and any real fault would be correctly
> re-raised next time.
> 
> This covers a specific case of migration with vGPU assigned on AMD:
> global log-dirty is enabled and causes immediate recalculation NPT
> fault in MMIO area upon access. This type of fault isn't described
> explicitly in hvm_hap_nested_page_fault (this isn't called on
> EPT misconfig exit on Intel) which results in domain crash.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---

Alternatively, I can re-raise the fault immediately after recalculation is
done which is less efficient (will take one more VMEXIT) but safer IMO -
hvm_hap_nested_page_fault might potentially leave VM in inconsistent state
in case of a real failure and cause second page fault to conceal it.

Another alternative is to inject fall_through bool into hvm_hap_nested_page_fault
to give it the idea of expected behavior in that case and avoid guessing in SVM
code. I think that's an improvement over suggestion in v1 and a candidate for v2. 

Igor

