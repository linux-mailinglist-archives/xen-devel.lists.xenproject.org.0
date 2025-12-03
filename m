Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4E5CA0A18
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 18:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177014.1501442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQqx0-0004WM-Ar; Wed, 03 Dec 2025 17:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177014.1501442; Wed, 03 Dec 2025 17:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQqx0-0004TF-75; Wed, 03 Dec 2025 17:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1177014;
 Wed, 03 Dec 2025 17:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NLTO=6J=knorrie.org=hans@srs-se1.protection.inumbo.net>)
 id 1vQqwz-0004T9-9o
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 17:47:37 +0000
Received: from albatros.knorrie.org (albatros.knorrie.org [35.156.0.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26ed58a4-d070-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 18:47:35 +0100 (CET)
Received: from [IPV6:2a10:3781:4007:a::15] (unknown
 [IPv6:2a10:3781:4007:a::15])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by albatros.knorrie.org (Postfix) with ESMTPSA id CEC7A690F8B;
 Wed,  3 Dec 2025 18:47:34 +0100 (CET)
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
X-Inumbo-ID: 26ed58a4-d070-11f0-9d1a-b5c5bf9af7f9
Message-ID: <a7f28465-e068-4250-873a-42e6cce71a04@knorrie.org>
Date: Wed, 3 Dec 2025 18:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: Drop ThumbEE support
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <JBeulich@suse.com>,
 Maximilian Engelhardt <maxi@daemonizer.de>
References: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Hans van Kranenburg <hans@knorrie.org>
In-Reply-To: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 12/3/25 6:16 PM, Andrew Cooper wrote:
> It was reported that Xen no longer builds on Debian Trixie:

The FTBFS is on Debian *unstable/sid*.

The build on Debian 13 Trixie is OK.

>   Assembler messages:
>   {standard input}:474: Error: unknown or missing system register name at operand 1 -- `msr TEECR32_EL1,x0'
>   {standard input}:480: Error: unknown or missing system register name at operand 1 -- `msr TEEHBR32_EL1,x0'
>   {standard input}:488: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEECR32_EL1'
>   {standard input}:494: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEEHBR32_EL1'
>   make[5]: *** [Rules.mk:249: arch/arm/domain.o] Error 1
> 
> This turns out to be an intentional change in bintuils.  ThumbEE was dropped
> from the architecture and doesn't exist in v8 (i.e. AArch64).
> 
> Xen supports v7+virt extentions so in principle we could #ifdef CONFIG_ARM_32
> to keep it working, but there was apparently no use of ThumbEE outside of demo
> code, so simply drop it.
> 
> Reported-by: Hans van Kranenburg <hans@knorrie.org>

Thanks!

I have just applied the patch here and have now successfully built the
Debian Xen packages using Debian unstable/sid build chroot on the arm64
Debian VM that I have here on my work macbook.

Hans

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Hans van Kranenburg <hans@knorrie.org>
> CC: Maximilian Engelhardt <maxi@daemonizer.de>
> 
> There's been no movement on this and it's urgent.  This (cross)compiles for
> me, but is the sum total of testing it's had.
> 
> Bintuils link: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=8c0024ca8f6c01fc45f081f5ef11c9a6a1c24eb0
> [...]


