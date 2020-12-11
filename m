Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28F42D7EF4
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 20:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50835.89627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knneR-0004ca-At; Fri, 11 Dec 2020 19:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50835.89627; Fri, 11 Dec 2020 19:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knneR-0004cA-7a; Fri, 11 Dec 2020 19:00:23 +0000
Received: by outflank-mailman (input) for mailman id 50835;
 Fri, 11 Dec 2020 19:00:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKjA=FP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knneP-0004c5-14
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 19:00:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd98cb23-33b2-4ebe-aa99-567cf0d7e846;
 Fri, 11 Dec 2020 19:00:20 +0000 (UTC)
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
X-Inumbo-ID: cd98cb23-33b2-4ebe-aa99-567cf0d7e846
Date: Fri, 11 Dec 2020 11:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607713219;
	bh=oyG2ewwl/dtGy3sv7RnoOIWcrm8Zb6PwqCrc4VzsygU=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=iArBkGo0IWe4TkIBzvZKsM0vgEiDOgUMbMjPzlqAxDK5zH0umTJJGxLmVgyHMhgpq
	 +/GBuQP7r3wt/ozQFln2VNYgD9AukCkjspqXD5fKB45mokEAZcI2s8oZK3p+CjZ2TK
	 rXGGVci+VdWvuujEY9PFHmgAPuJXYH/aGg11x/YqzVkOcskf3BKiqBZo/T5TpFCPUn
	 gIP0GTVoUxrnRWqu5fGFIrfzQsKO+cJdG3MPYO0czN9YwTRi9WItKBhjLOZ5kFMF5u
	 O3TJ7prJyRLU2hI6LCmjiqG8eaIB4J4k8KQhpDDV+vNKPnWzwkqC6ypDm8So+ajVK8
	 PZs05XHODxuOg==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/7] xen/arm: Add handler for ID registers on arm64
In-Reply-To: <5C3F0DF9-417B-4946-A906-FE2A9CD4A38F@arm.com>
Message-ID: <alpine.DEB.2.21.2012111058410.10222@sstabellini-ThinkPad-T480s>
References: <cover.1607524536.git.bertrand.marquis@arm.com> <e991b05af11d00627709caf847c5de99f487cab0.1607524536.git.bertrand.marquis@arm.com> <alpine.DEB.2.21.2012091131350.20986@sstabellini-ThinkPad-T480s> <4B26BDEE-DA30-4B5B-A428-9D8D4659B581@arm.com>
 <alpine.DEB.2.21.2012101428030.20986@sstabellini-ThinkPad-T480s> <5C3F0DF9-417B-4946-A906-FE2A9CD4A38F@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Dec 2020, Bertrand Marquis wrote:
> Hi Stefano,
> 
> > On 10 Dec 2020, at 22:29, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 10 Dec 2020, Bertrand Marquis wrote:
> >> Hi Stefano,
> >> 
> >>> On 9 Dec 2020, at 19:38, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>> 
> >>> On Wed, 9 Dec 2020, Bertrand Marquis wrote:
> >>>> Add vsysreg emulation for registers trapped when TID3 bit is activated
> >>>> in HSR.
> >>>> The emulation is returning the value stored in cpuinfo_guest structure
> >>>> for know registers and is handling reserved registers as RAZ.
> >>>> 
> >>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> ---
> >>>> Changes in V2: Rebase
> >>>> Changes in V3:
> >>>> Fix commit message
> >>>> Fix code style for GENERATE_TID3_INFO declaration
> >>>> Add handling of reserved registers as RAZ.
> >>>> 
> >>>> ---
> >>>> xen/arch/arm/arm64/vsysreg.c | 53 ++++++++++++++++++++++++++++++++++++
> >>>> 1 file changed, 53 insertions(+)
> >>>> 
> >>>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> >>>> index 8a85507d9d..ef7a11dbdd 100644
> >>>> --- a/xen/arch/arm/arm64/vsysreg.c
> >>>> +++ b/xen/arch/arm/arm64/vsysreg.c
> >>>> @@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
> >>>>        break;                                                          \
> >>>>    }
> >>>> 
> >>>> +/* Macro to generate easily case for ID co-processor emulation */
> >>>> +#define GENERATE_TID3_INFO(reg, field, offset)                          \
> >>>> +    case HSR_SYSREG_##reg:                                              \
> >>>> +    {                                                                   \
> >>>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,   \
> >>>> +                          1, guest_cpuinfo.field.bits[offset]);         \
> >>> 
> >>> [...]
> >>> 
> >>>> +    HSR_SYSREG_TID3_RESERVED_CASE:
> >>>> +        /* Handle all reserved registers as RAZ */
> >>>> +        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 1);
> >>> 
> >>> 
> >>> We are implementing both the known and the implementation defined
> >>> registers as read-as-zero. On write, we inject an exception.
> >>> 
> >>> However, reading the manual, it looks like the implementation defined
> >>> registers should be read-as-zero/write-ignore, is that right?
> >> 
> >> In the documentation, I did find all those defined as RO (Arm Architecture
> >> reference manual, chapter D12.3.1). Do you think we should handle Read
> >> only register as write ignore ? now i think of it RO does not explicitely mean
> >> if writes are ignored or should generate an exception.
> >> 
> >>> 
> >>> I couldn't easily find in the manual if it is OK to inject an exception
> >>> on write to a known register.
> >> 
> >> I am actually unsure if it should or not.
> >> I will try to run a test to check what is happening if this is done on the
> >> real hardware and come back to you on this one.
> > 
> > Yeah, that's the best way to do it: if writes are ignored on real
> > hardware, let's turn this into read-only/write-ignore, otherwise if they
> > generate an exception then let's keep the code as is.
> > 
> > Also you might want to do that both for a known register and also for an
> > unknown register to see if it makes a difference.
> 
> I did a test with the following:
> - WRITE_SYSREG64(0xf, S3_0_C0_C3_3)
> - WRITE_SYSREG64(0xf, ID_MMFR0_EL1)
> - WRITE_SYSREG64(0xf, ID_AA64MMFR0_EL1)
> 
> All generate exceptions like:
> Hypervisor Trap. HSR=0x2000000 EC=0x0 IL=1 Syndrome=0x0
> 
> So I think it is right to generate an exception if one of them is accessed.

Great, thanks for checking. In that case the patch is fine as is.

