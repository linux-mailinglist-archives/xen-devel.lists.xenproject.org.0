Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78E2D4A84
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 20:39:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48683.86109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn5IB-0001W2-57; Wed, 09 Dec 2020 19:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48683.86109; Wed, 09 Dec 2020 19:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn5IB-0001Vd-1a; Wed, 09 Dec 2020 19:38:27 +0000
Received: by outflank-mailman (input) for mailman id 48683;
 Wed, 09 Dec 2020 19:38:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kn5IA-0001VY-9U
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 19:38:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8acd188a-a50f-420b-886f-a3933b814d71;
 Wed, 09 Dec 2020 19:38:25 +0000 (UTC)
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
X-Inumbo-ID: 8acd188a-a50f-420b-886f-a3933b814d71
Date: Wed, 9 Dec 2020 11:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607542704;
	bh=DHOd1MbYdbEzgawURuOXyNtKiflOem05991XPrCV4Aw=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=dHET5MeYuD/SknaQWidwf77TU58L0TDLghH6GeEF7Amga7ej3ZzvSx2rYv9XrCjFO
	 vg+NgW1Wm2aNFFsRzKK5HQ0vezVcsz+dihbrjYL2zypdXp6INOzbcQiqqq5+ofs9uo
	 9xP37Efr/h7ioiZWdYUZ4V+ZJtq/6PT5BPOL4gBTYiNJNKopO+/qLW2zB7hV+IvIgz
	 Xcb2fZSBfrgyGgF6paIOP7tk0wfQZZjUr52L9Ic/zZ9BkIhTOb9y6PiIFC0LruPpV+
	 qKuzjj9KQJb8IL4n4qXtIGLdcF/3iHQmHcnQDx8mVPWL/LyFM9GqzsjoMVBuVWQh/5
	 t1DmsnTJKLcKQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/7] xen/arm: Add handler for ID registers on arm64
In-Reply-To: <e991b05af11d00627709caf847c5de99f487cab0.1607524536.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012091131350.20986@sstabellini-ThinkPad-T480s>
References: <cover.1607524536.git.bertrand.marquis@arm.com> <e991b05af11d00627709caf847c5de99f487cab0.1607524536.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Dec 2020, Bertrand Marquis wrote:
> Add vsysreg emulation for registers trapped when TID3 bit is activated
> in HSR.
> The emulation is returning the value stored in cpuinfo_guest structure
> for know registers and is handling reserved registers as RAZ.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in V2: Rebase
> Changes in V3:
>   Fix commit message
>   Fix code style for GENERATE_TID3_INFO declaration
>   Add handling of reserved registers as RAZ.
> 
> ---
>  xen/arch/arm/arm64/vsysreg.c | 53 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index 8a85507d9d..ef7a11dbdd 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
>          break;                                                          \
>      }
>  
> +/* Macro to generate easily case for ID co-processor emulation */
> +#define GENERATE_TID3_INFO(reg, field, offset)                          \
> +    case HSR_SYSREG_##reg:                                              \
> +    {                                                                   \
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,   \
> +                          1, guest_cpuinfo.field.bits[offset]);         \

[...]

> +    HSR_SYSREG_TID3_RESERVED_CASE:
> +        /* Handle all reserved registers as RAZ */
> +        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 1);


We are implementing both the known and the implementation defined
registers as read-as-zero. On write, we inject an exception.

However, reading the manual, it looks like the implementation defined
registers should be read-as-zero/write-ignore, is that right?

I couldn't easily find in the manual if it is OK to inject an exception
on write to a known register.

