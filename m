Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C22FCDDA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 11:38:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71323.127624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2As4-0006Ts-Sz; Wed, 20 Jan 2021 10:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71323.127624; Wed, 20 Jan 2021 10:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2As4-0006TT-P6; Wed, 20 Jan 2021 10:37:52 +0000
Received: by outflank-mailman (input) for mailman id 71323;
 Wed, 20 Jan 2021 10:37:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxJk=GX=cert.pl=hubert.jasudowicz@srs-us1.protection.inumbo.net>)
 id 1l2As3-0006TO-3R
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 10:37:51 +0000
Received: from mx.nask.net.pl (unknown [195.187.55.89])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4a669c0-e734-4941-8da9-70009fd081cf;
 Wed, 20 Jan 2021 10:37:49 +0000 (UTC)
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
X-Inumbo-ID: e4a669c0-e734-4941-8da9-70009fd081cf
Date: Wed, 20 Jan 2021 11:37:36 +0100
From: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH] x86/vmx: Remove IO bitmap from minimal VMX requirements
Message-ID: <20210120103736.zclypjyuleg2u5in@arnold.localdomain>
Mail-Followup-To: Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
References: <570e73b83c18cce4dbe4c70cc14b6df7c33f0502.1610720991.git.hubert.jasudowicz@cert.pl>
 <20210115144420.bcz7l52h2zs4ml34@Air-de-Roger>
 <5211cb4d-4a60-68eb-2c67-a16565e02f23@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5211cb4d-4a60-68eb-2c67-a16565e02f23@suse.com>

On 2021-01-19, Jan Beulich wrote:
> On 15.01.2021 15:44, Roger Pau Monné wrote:
> > On Fri, Jan 15, 2021 at 03:30:50PM +0100, Hubert Jasudowicz wrote:
> >> This patch is a result of a downstream bug report[1]. Xen fails to
> >> create a HVM domain while running under VMware Fusion 12.1.0 on
> >> a modern Intel Core i9 CPU:
> >>
> >> (XEN) VMX: CPU0 has insufficient CPU-Based Exec Control (b5b9fffe; requires 2299968c)
> >> (XEN) VMX: failed to initialise.
> >>
> >> It seems that Apple hypervisor API doesn't support this feature[2].
> >>
> >> Move this bit from minimal required features to optional.
> >>
> >> [1] https://github.com/CERT-Polska/drakvuf-sandbox/issues/418
> >> [2] https://developer.apple.com/documentation/hypervisor/cpu_based_io_bitmaps
> >>
> >> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> >> ---
> >>  xen/arch/x86/hvm/vmx/vmcs.c        | 8 +++++---
> >>  xen/include/asm-x86/hvm/vmx/vmcs.h | 2 ++
> >>  2 files changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> >> index 164535f8f0..bad4d6e206 100644
> >> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> >> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> >> @@ -276,10 +276,10 @@ static int vmx_init_vmcs_config(void)
> >>             CPU_BASED_MONITOR_EXITING |
> >>             CPU_BASED_MWAIT_EXITING |
> >>             CPU_BASED_MOV_DR_EXITING |
> >> -           CPU_BASED_ACTIVATE_IO_BITMAP |
> >>             CPU_BASED_USE_TSC_OFFSETING |
> >>             CPU_BASED_RDTSC_EXITING);
> >>      opt = (CPU_BASED_ACTIVATE_MSR_BITMAP |
> >> +           CPU_BASED_ACTIVATE_IO_BITMAP |
> >>             CPU_BASED_TPR_SHADOW |
> >>             CPU_BASED_MONITOR_TRAP_FLAG |
> >>             CPU_BASED_ACTIVATE_SECONDARY_CONTROLS);
> >> @@ -1168,8 +1168,10 @@ static int construct_vmcs(struct vcpu *v)
> >>      }
> >>  
> >>      /* I/O access bitmap. */
> >> -    __vmwrite(IO_BITMAP_A, __pa(d->arch.hvm.io_bitmap));
> >> -    __vmwrite(IO_BITMAP_B, __pa(d->arch.hvm.io_bitmap) + PAGE_SIZE);
> >> +    if ( cpu_has_vmx_io_bitmap ) {
> >> +        __vmwrite(IO_BITMAP_A, __pa(d->arch.hvm.io_bitmap));
> >> +        __vmwrite(IO_BITMAP_B, __pa(d->arch.hvm.io_bitmap) + PAGE_SIZE);
> >> +    }
> > 
> > Maybe I'm missing something, but don't you need to expand
> > EXIT_REASON_IO_INSTRUCTION in vmx_vmexit_handler when there's no IO
> > bitmap support so that all the emulation is bypassed and the IO port
> > access is replayed by Xen?
> 
> I think it's worse than this: I don't see us ever setting
> "unconditional I/O exiting", which means guests would be allowed
> access to all I/O ports. IOW I think that other bit needs setting
> when I/O bitmaps can't be made use of.
> 

Sure, I'll fix it and get back to you with a v2.

Hubert Jasudowicz

