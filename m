Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C22D6A75
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 23:30:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49949.88319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knURL-0002ku-8G; Thu, 10 Dec 2020 22:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49949.88319; Thu, 10 Dec 2020 22:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knURL-0002kV-4f; Thu, 10 Dec 2020 22:29:35 +0000
Received: by outflank-mailman (input) for mailman id 49949;
 Thu, 10 Dec 2020 22:29:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUBE=FO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knURI-0002kN-Nq
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 22:29:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b47a5bcc-8f85-4f9f-8a89-bf4892f7b9dd;
 Thu, 10 Dec 2020 22:29:31 +0000 (UTC)
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
X-Inumbo-ID: b47a5bcc-8f85-4f9f-8a89-bf4892f7b9dd
Date: Thu, 10 Dec 2020 14:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607639371;
	bh=CnycD9TnF+3CygDQlvn/xo/dycHeDccy1iY1awK9hts=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=kYpm4onCYiatdcKs/WPFhfTtwrErr+8ZgioehIOi4pZt8pslgRjXrEy8dVi5uZ1wx
	 ADgcjQudZPmEjVrRChaxjf3sT8b8AJtRClz+tkDDlGzVWO8XWzrwZgVJoVuHH1aBSP
	 yqhLhUdrMr7fwXbbz5PNSqv31liiJb5tg78Nqo8NKnTuSIyKHgQlK3UvBFgI0vzEVk
	 iSrRy/Z9bGmBCoxby7xB5NE0DgHhtA2u18Rt80PGUAfSvRGliAc8AJsjoR99JyDtln
	 fETdZS+eypKFv7RXy9+CcuhSog97fBHNo/2/hwZdC4pwB4+/WV6RXaWV3KnqjBSK/P
	 6eNyQTuwFwfow==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/7] xen/arm: Add handler for ID registers on arm64
In-Reply-To: <4B26BDEE-DA30-4B5B-A428-9D8D4659B581@arm.com>
Message-ID: <alpine.DEB.2.21.2012101428030.20986@sstabellini-ThinkPad-T480s>
References: <cover.1607524536.git.bertrand.marquis@arm.com> <e991b05af11d00627709caf847c5de99f487cab0.1607524536.git.bertrand.marquis@arm.com> <alpine.DEB.2.21.2012091131350.20986@sstabellini-ThinkPad-T480s> <4B26BDEE-DA30-4B5B-A428-9D8D4659B581@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Dec 2020, Bertrand Marquis wrote:
> Hi Stefano,
> 
> > On 9 Dec 2020, at 19:38, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Wed, 9 Dec 2020, Bertrand Marquis wrote:
> >> Add vsysreg emulation for registers trapped when TID3 bit is activated
> >> in HSR.
> >> The emulation is returning the value stored in cpuinfo_guest structure
> >> for know registers and is handling reserved registers as RAZ.
> >> 
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in V2: Rebase
> >> Changes in V3:
> >>  Fix commit message
> >>  Fix code style for GENERATE_TID3_INFO declaration
> >>  Add handling of reserved registers as RAZ.
> >> 
> >> ---
> >> xen/arch/arm/arm64/vsysreg.c | 53 ++++++++++++++++++++++++++++++++++++
> >> 1 file changed, 53 insertions(+)
> >> 
> >> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> >> index 8a85507d9d..ef7a11dbdd 100644
> >> --- a/xen/arch/arm/arm64/vsysreg.c
> >> +++ b/xen/arch/arm/arm64/vsysreg.c
> >> @@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
> >>         break;                                                          \
> >>     }
> >> 
> >> +/* Macro to generate easily case for ID co-processor emulation */
> >> +#define GENERATE_TID3_INFO(reg, field, offset)                          \
> >> +    case HSR_SYSREG_##reg:                                              \
> >> +    {                                                                   \
> >> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,   \
> >> +                          1, guest_cpuinfo.field.bits[offset]);         \
> > 
> > [...]
> > 
> >> +    HSR_SYSREG_TID3_RESERVED_CASE:
> >> +        /* Handle all reserved registers as RAZ */
> >> +        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 1);
> > 
> > 
> > We are implementing both the known and the implementation defined
> > registers as read-as-zero. On write, we inject an exception.
> > 
> > However, reading the manual, it looks like the implementation defined
> > registers should be read-as-zero/write-ignore, is that right?
> 
> In the documentation, I did find all those defined as RO (Arm Architecture
> reference manual, chapter D12.3.1). Do you think we should handle Read
> only register as write ignore ? now i think of it RO does not explicitely mean
> if writes are ignored or should generate an exception.
> 
> > 
> > I couldn't easily find in the manual if it is OK to inject an exception
> > on write to a known register.
> 
> I am actually unsure if it should or not.
> I will try to run a test to check what is happening if this is done on the
> real hardware and come back to you on this one.

Yeah, that's the best way to do it: if writes are ignored on real
hardware, let's turn this into read-only/write-ignore, otherwise if they
generate an exception then let's keep the code as is.

Also you might want to do that both for a known register and also for an
unknown register to see if it makes a difference.

Thank you!

