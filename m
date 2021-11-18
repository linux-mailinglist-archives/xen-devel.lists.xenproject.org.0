Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5686455206
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 02:12:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227053.392584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnVxi-0000CP-Ef; Thu, 18 Nov 2021 01:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227053.392584; Thu, 18 Nov 2021 01:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnVxi-00009g-BT; Thu, 18 Nov 2021 01:11:38 +0000
Received: by outflank-mailman (input) for mailman id 227053;
 Thu, 18 Nov 2021 01:11:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl7d=QF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mnVxg-00009Z-Sl
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 01:11:37 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77f3bf75-480c-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 02:11:35 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E38261B64;
 Thu, 18 Nov 2021 01:11:32 +0000 (UTC)
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
X-Inumbo-ID: 77f3bf75-480c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637197892;
	bh=WHCgBZ0aPRt3WgEFcwwwa71uGk27HMJM2oDlG51kC/U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P8+RAozWhfszcaFtxMxOY5y9Oj0+LPBthFUkRPg8bL3xYvPrHPuRPfayQ9E9lP3Mw
	 Dsu/YDMkBL9UetUDyV1L6K0wysOKW8FtwJu2jJLlqmslxRtnO7iw61P5RyLbvuEi1E
	 YLw5ZZ/tQdxQ5IadO8pu7gsZlVoNtC5esvMe8uxI1BwmY+LW3MwZNbpRZn4DEWRour
	 47tH9AK1OErQmWmHwCYsD0lla6lMN7F90sod3LPqp0yESnku2zNmjCOXiVf6OKnKnd
	 0vwwPh/l+zD+tiqjhXBB0zzk8o3iOJHl6Lrye/D3++rfvSf1XYfxW1LQkMIXF4s2Um
	 yawTLBk04eOug==
Date: Wed, 17 Nov 2021 17:11:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen/ARM - Query about a data abort seen while reading GICD
 registers
In-Reply-To: <c7bda1d6-355e-3240-1d09-59d7c13c4262@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111171701390.1412361@ubuntu-linux-20-04-desktop>
References: <1489a1b9-aefa-0ddf-8dba-4a566388cc6f@xilinx.com> <CED537AF-44AA-41B8-9458-17A5C43FBECC@arm.com> <f91fd718-040e-88a3-ca96-30d1efe9a689@xilinx.com> <0ACF6308-EDB0-4B98-A029-1C7B23820198@arm.com> <636b9fe8-4c10-45f5-da95-513c87e5939f@xilinx.com>
 <BA07700B-D025-492D-A376-513408927F68@arm.com> <c7bda1d6-355e-3240-1d09-59d7c13c4262@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-199181399-1637197892=:1412361"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-199181399-1637197892=:1412361
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 17 Nov 2021, Julien Grall wrote:
> I will combine my answers for this thread in one single e-mail.
> 
> On 17/11/2021 16:35, Bertrand Marquis wrote:
> > > On 17 Nov 2021, at 16:21, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
> > > wrote:
> > > 
> > > Hi Bertrand,
> > > 
> > > Many thanks for your response.
> > > 
> > > On 17/11/2021 15:48, Bertrand Marquis wrote:
> > > > Hi Ayan,
> > > > > On 16 Nov 2021, at 16:24, Ayan Kumar Halder
> > > > > <ayan.kumar.halder@xilinx.com> wrote:
> > > > > 
> > > > > Hi Bertrand,
> > > > > 
> > > > > Thanks for looking into it.
> > > > > 
> > > > > On 16/11/2021 15:36, Bertrand Marquis wrote:
> > > > > > Hi Ayan,
> > > > > > > On 16 Nov 2021, at 15:27, Ayan Kumar Halder
> > > > > > > <ayan.kumar.halder@xilinx.com> wrote:
> > > > > > > 
> > > > > > > Hi Xen/Arm experts,
> > > > > > > 
> > > > > > > I am facing a very strange issue while running a baremetal
> > > > > > > application as a DomU guest on arm64 platform.
> > > > > > > 
> > > > > > > The baremetal app tries to read the GICD register with post
> > > > > > > indexing as follows :-
> > > > > > > ldr x1, =0x3001000
> > > > > > > ldr w2, [x1], #4 <<<------ PC = 0x40000ca8
> > > > > > Increment on on load is not supported by the emulation layer.
> > > > > 
> > > > > That is surprising. The reason being if I try to read the GICC
> > > > > register (0x3002000) with post indexing then it works fine.
> > > > When the ISV bit is not set, Xen would have to decode the instruction to
> > > > actually emulate the access and properly modify the registers values as
> > > > long as providing the “emulated” access value.
> > > 
> > > This is very interesting. Is this being done for any of the other
> > > instructions in Xen ?
> > 
> > No Xen is not trying to decode any instructions.
> 
> We actually decode some instructions (see arch/arm/decode.c). This was
> necessary because early revision of Cortex-A15 would not properly fill
> syndrome for Thumb instructions.
> 
> decode_instruction() could be extended to handle the specific instruction if
> needed.
> 
> > If you look at Linux source code, this is the kind of stuff that the kernel
> > is delegating to user application (qemu) to do as it can be quite complex.
> > 
> > > > There is not such a decoder in Xen right now which means those kind of
> > > > accesses are not supported for emulated mmio accesses.
> > > 
> > > I am actually trying to understand where I will need to make the changes
> > > if I have to add support for the decoder. The reason being this issue is
> > > being faced by one of our customer application.
> > > Besides changing the instruction to prevent post increment, is there any
> > > other mitigation ?
> > 
> > Not that I know of.
> 
> Decoding the instruction is the only solution if you don't want to update the
> baremetal app.
> 
> > > 
> > > The reason being I don't see a way to instruct the compiler to not
> > > generate the post indexing instructions.
> In general, it is not safe to let the compiler decide for you how to access
> the MMIO registers as it can do all sort of optimization behind your back.
> That's why...
> 
> > 
> > You can define io access functions instead of letting the compiler generate
> > the read/write functions.
> > Look at arch/arm64/include/asm-arm/io.h in linux for example.
> 
> ... Linux provides io{read, write} helpers.
> 
> @Ayan, is the code written in assembly or C? If the latter, how is it written?

I chatted with Ayan this morning and he will try to contact the original
author and get a proper answer, but I am pretty sure that it is written
in C. What makes it worse is that I believe the issue only started to
appear recently due to updating compiler (hence new compiler
optimizations.) Which means that this issue might become more common in
the future in other environments too :-(

I believe this is the code (source [1]):

    XScuGic_WriteReg(BaseAddress, XSCUGIC_DIST_EN_OFFSET, 0UL);

which expands to:

    #define XScuGic_WriteReg(BaseAddress, RegOffset, Data) \
    	(Xil_Out32(((BaseAddress) + (RegOffset)), ((u32)(Data))))

Which is:

    static INLINE void Xil_Out32(UINTPTR Addr, u32 Value)
    {
    	/* write 32 bit value to specified address */
    #ifndef ENABLE_SAFETY
    	volatile u32 *LocalAddr = (volatile u32 *)Addr;
    	*LocalAddr = Value;
    #else
    	XStl_RegUpdate(Addr, Value);
    #endif
    }

[1] https://github.com/Xilinx/embeddedsw/tree/master/XilinxProcessorIPLib/drivers/scugic/examples/xscugic_low_level_example.c


So it seems to be a pretty standard volatile write in a static inline
function.


> That said, the ldr writeback instructions should be safe to use. It happens
> that we never had OS using them before.

Yeah I agree... My two cents is that if we can find a way to decode the
instruction without a huge amount of code then it would be worth doing
it.
--8323329-199181399-1637197892=:1412361--

