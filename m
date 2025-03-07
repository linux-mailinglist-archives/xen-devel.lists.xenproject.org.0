Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED7A57066
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 19:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905294.1313167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqcLJ-0004nm-8J; Fri, 07 Mar 2025 18:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905294.1313167; Fri, 07 Mar 2025 18:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqcLJ-0004la-5D; Fri, 07 Mar 2025 18:22:41 +0000
Received: by outflank-mailman (input) for mailman id 905294;
 Fri, 07 Mar 2025 18:22:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siCl=V2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tqcLH-0004lU-A9
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 18:22:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 258ccfc0-fb81-11ef-9ab7-95dc52dad729;
 Fri, 07 Mar 2025 19:22:37 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 8E9BA4EF40C8;
 Fri,  7 Mar 2025 19:22:35 +0100 (CET)
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
X-Inumbo-ID: 258ccfc0-fb81-11ef-9ab7-95dc52dad729
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1741371756;
	b=UN0U9/VsPmFBbaXcHoqfkajsooPKYZdiatLuuOoEMiZHz77SowIz4zMDucZkZwYmSCCY
	 tRU1BwHFyxsUeiY9Md8VWjHyWz7eI3JcdM55JE9aY0uvgZmv2uHvK7YaOmvznmfwymCP6
	 XIiCevRUjdJ5yGPiSS/YresV9VUjqOVxoqUB55ieizd3XfCdTeet79nrcNGUqglNrkYqy
	 Vz8yDsIfKlsYQZLdDH4cgtMIRbVL9Js8JAFCE/fNjlXSb41bHmZFLVVA+6JZduNPlSfhu
	 lmYtl0oNmpyVLSjkkLQfRrILzNLHRYsH8Oq5SHYKlV4NGWSQXvKO8zVVkeLtKvqq9qmvP
	 zEpC34f+nLhm5yVLjMQtp7vz2LmmXzPT8+jLTgvebMsD1X7XgrZlWKAThcQACeAifG+p0
	 CD1h1FvBqE7CzRbs5wYXRp+ttP+njUFQJuaaiU3W5HNJGVeaSJD8etKdpfyYhmzs1hT4s
	 wqZDvvF3jbbwvBggSATS04OU5sJAZlRm+5hiqm4WSJ+ffzrpqriysw/cwpttVVsS4Y1by
	 CibX0I/xq8yKvIJyMVrMjbhjDNnOfE/C3ZPAFeNalfXag/i2pgEIvzfa/ShuKElkV4Hza
	 FZx+Lf9wUfR15ez3jx5ocdWuQ4pEnuqe0fV9IR0dO/OMqQWODqLoxUGHtgo9B14=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1741371756;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=b2GpiO+14vGTaI+sXl5OewE+EwoYOP+PjCS9mx46WmM=;
	b=RN7BktBLsC4h2gpqKYc8IFAPypzWsdseFk0Lb+tY2KnL+tkgRNKZpiutUtJ2xhKxtfx9
	 svya63hi9x3/Ekk+xphCvf0RIFEgAkPiTZHQ7kdCNtoLqW4S7rh8SfCuZ+5fbEgnkG22/
	 S0U8fgfG14osSwHk7ixVPjHmBa8QBaIkrRkdHvO4wPA7GXbZPx4Dcd8SbOS85uHNcybaV
	 HSS6cmIZGFqNqNecTrZEBzzdlN4wVGv8eBfM7k9+Q4wVnosPCdG1gcKicgKuQ2SQbuEZe
	 642uY1EV8Gwh7HuA/EEJ2thjXmUIT9KrGNCb01be8P0OkX+6nthyb+cZKyWQRhkGlzd3P
	 VUtuixY+Eg79hP3f1lOwYhoMOTfqqzyD1RHnNtgG0j00S10WF21QUtQ2NNrMx+Whk6tE6
	 vyKjU4mm+d1WUKf/LmZh4RvBgrPxs2cpTmcXrDXxJ4ICIKVhfRCHrk3eURCCNljCcQLLe
	 //m4Jb/pB6DGrUcW2eIqVp6dyQ8NvZpKdoOkyqOqTIJADyZzSWjJ9ZQ3dQptbyQ2PaaeU
	 L3TAFPOPt5O3z060y1dGCMvAbYY6XnYvpNM7ebOCtzDAmQkbP1+HyxPDVJdH2VvUXBsRh
	 aPNHzhaKYb6kIpzTfCWbov0W96jIuB6X2o6fvF+kMhfpwUxu7umpLylWzGYkkCY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1741371756; bh=aQQY3+cXN6ISLYuje5/6IuhvooYeUUIJpTd37yYoCiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TEq5ODP25vx93C6AhRJFuUwmMWoOxtTx27MyonKWzcBS/cFWu/89Y+kgi9FT6vpfP
	 tuXea49nhU9KdWvSJw+aTWZiBNrvRA2HZfi9Sb8VUT/Atx2PN1Jj6BGS56bgxp/sPX
	 VOQqLNPKJJR/q0LWFAGyKGcLgXGLa0tuoFoNOXiusizTJ5MiWhqpusazL1z0yP6773
	 4aAasR1QAKNPONxkDwQ4U0YFbGQX9FEf01QvgLzj6trgsU/9hRMDGqty7Kv89r3DYC
	 i0raFgspCCO9sgk/bV6yNcS+q+amo5YXLg0far+VV+Ugbo/cFuX+RP/LI0x4weUodH
	 QzI0kX0Ug+91Q==
MIME-Version: 1.0
Date: Fri, 07 Mar 2025 19:22:35 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Subject: Re: [PATCH] xen: Update minimum toolchain requirements
In-Reply-To: <20250307175435.3089686-1-andrew.cooper3@citrix.com>
References: <20250307175435.3089686-1-andrew.cooper3@citrix.com>
Message-ID: <2aaa6042ec9f6220e6229878a13a714b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-03-07 18:54, Andrew Cooper wrote:
> GCC 4.1.2 is from 2007, and Binutils 2.16 is a similar vintage.  Clang 
> 3.5 is
> from 2014.  Supporting toolchains this old is a massive development and
> testing burden.
> 
> Set a minimum baseline of GCC 5.1 across the board, along with Binutils 
> 2.25
> which is the same age.  These were chosen *3 years ago* as Linux's 
> minimum
> requirements because even back then, they were ubiquitous in distros.  
> Choose
> Clang/LLVM 11 as a baseline for similar reasons; the Linux commit 
> making this
> change two years ago cites a laudry list of code generation bugs.
> 
> This will allow us to retire a lot of compatiblity logic, and start 
> using new
> features previously unavailable because of no viable compatibility 
> option.
> 
> Merge the ARM 32bit and 64bit sections now they're the same.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> PPC doesn't have a minimum set stated yet, but CI tests GCC 10 from 
> Debian 11.
> 
> This will require dropping some containers from CI.  CentOS 7 notably.
> 
> In terms of specific new features, I'm interested in:
> 
>  * __has_include() to remove the asm-generic makefile tangle
>  * asm goto (), to remove .fixup and code generation for error 
> handling.
> 
> and these too, but will require MISRA adjustments:
> 
>  * _Generic() to make properly const-preserving wrappers

Perhaps stating something that is already well-known, but this 
effectively means moving from MISRA C:2012 Amendment 2 as a target to, 
at least, MISRA C:2012 Amendment 3, as that version contains rules in 
series 23 for _Generic.

>  * Updating our -std to gnu11, which drops further compatibility logic
> 
> When the arguments die down, I'll add a hunk to CHANGELOG.md as this is 
> very
> significant.
> ---
>  README | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/README b/README
> index 9d9c6fc324c6..be90be3910d4 100644
> --- a/README
> +++ b/README
> @@ -38,16 +38,13 @@ provided by your OS distributor:
>      * GNU Make v3.80 or later
>      * C compiler and linker:
>        - For x86:
> -        - GCC 4.1.2_20070115 or later
> -        - GNU Binutils 2.16.91.0.5 or later
> +        - GCC 5.1 or later
> +        - GNU Binutils 2.25 or later
>          or
> -        - Clang/LLVM 3.5 or later
> -      - For ARM 32-bit:
> -        - GCC 4.9 or later
> -        - GNU Binutils 2.24 or later
> -      - For ARM 64-bit:
> +        - Clang/LLVM 11 or later
> +      - For ARM:
>          - GCC 5.1 or later
> -        - GNU Binutils 2.24 or later
> +        - GNU Binutils 2.25 or later
>        - For RISC-V 64-bit:
>          - GCC 12.2 or later
>          - GNU Binutils 2.39 or later
> 
> base-commit: ac29d63a0fa6a3ed98ecf86f95995811c301308f

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

