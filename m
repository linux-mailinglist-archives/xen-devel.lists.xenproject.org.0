Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C155A49B98B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 18:03:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260511.450134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCPDZ-0001YR-0j; Tue, 25 Jan 2022 17:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260511.450134; Tue, 25 Jan 2022 17:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCPDY-0001Vx-Tw; Tue, 25 Jan 2022 17:02:52 +0000
Received: by outflank-mailman (input) for mailman id 260511;
 Tue, 25 Jan 2022 17:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BuoU=SJ=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1nCPDX-0001Vr-TC
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 17:02:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a0150201-7e00-11ec-8eb8-a37418f5ba1a;
 Tue, 25 Jan 2022 18:02:49 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF54E1FB;
 Tue, 25 Jan 2022 09:02:48 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A49183F766;
 Tue, 25 Jan 2022 09:02:47 -0800 (PST)
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
X-Inumbo-ID: a0150201-7e00-11ec-8eb8-a37418f5ba1a
Date: Tue, 25 Jan 2022 17:02:45 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Julien Grall <julien@xen.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 stefanos@xilinx.com, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 jbeulich@suse.com, wei.chen@arm.com
Subject: Re: [XEN v3] xen/arm64: io: Decode ldr/str post-indexing
 instructions
Message-ID: <20220125170245.3262e0a4@donnerap.cambridge.arm.com>
In-Reply-To: <9609102e-8d58-8378-29b8-4e1190eb1e3c@xen.org>
References: <20220120215527.28138-1-ayankuma@xilinx.com>
 <20220122013046.6a786d3f@slackpad.fritz.box>
 <18e715ae-111d-58e6-55f9-a48a521e99b3@xilinx.com>
 <20220124143601.3e2ac6ac@donnerap.cambridge.arm.com>
 <9609102e-8d58-8378-29b8-4e1190eb1e3c@xen.org>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Jan 2022 17:58:55 +0000
Julien Grall <julien@xen.org> wrote:

Hi Julien,

> Hi Andre,
> 
> On 24/01/2022 14:36, Andre Przywara wrote:
> > On Mon, 24 Jan 2022 12:07:42 +0000  
> >> Also, if an instruction is being modified by the guest (after it has
> >> been loaded in the I cache), and if the guest does not invalidate the I
> >> cache + ISB, then this is a malicious behavior by the guest. Is my
> >> understanding correct ?  
> > 
> > I wouldn't say malicious per se, there might be legitimate reasons to do
> > so, but in the Xen context this is mostly irrelevant, since we don't trust
> > the guest anyway. So whether it's malicious or accidental, the hypervisor
> > might be mislead.  
> 
> I agree the hypervisor will be mislead to execute the wrong instruction. 
> But, in reality, I don't see how this is a massive problem as this 
> thread seems to imply. At best the guest will shoot itself in the foot.

I didn't really imply anything, I genuinely meant that I don't want to
spend brain cells thinking about possible exploits - I always figured you
(and Xen people in general) are so much better in this. (genuine
compliment!)
I was just pointing out that this emulation might be wrong then.
That ties back to the original question of how many bitter pills you want
to swallow for having this emulation code - which is your decision to make.

Cheers,
Andre

> IOW, for now, I think it is fine to assume that the guest will have 
> invalidated the cache instruction before executing any instruction that 
> may fault with ISV=0. This could be revisted if we have use-cases where 
> we really need to know what the guest executed.
> 
> Cheers,
> 


