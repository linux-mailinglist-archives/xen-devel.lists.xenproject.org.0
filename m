Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA37FEE70
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 13:00:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644586.1005771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fiV-0003dv-KP; Thu, 30 Nov 2023 12:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644586.1005771; Thu, 30 Nov 2023 12:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fiV-0003ao-Gv; Thu, 30 Nov 2023 12:00:27 +0000
Received: by outflank-mailman (input) for mailman id 644586;
 Thu, 30 Nov 2023 12:00:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4Nc=HL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8fiT-0003YC-MN
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 12:00:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b961057-8f78-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 13:00:25 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A1E194EE0739;
 Thu, 30 Nov 2023 13:00:24 +0100 (CET)
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
X-Inumbo-ID: 0b961057-8f78-11ee-98e4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 30 Nov 2023 13:00:24 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/DMI: adjustments to comply with Misra C:2012 Rule 9.3
In-Reply-To: <4876b0a8-b96b-4f60-8040-a346b2655645@suse.com>
References: <4876b0a8-b96b-4f60-8040-a346b2655645@suse.com>
Message-ID: <533b6aadb95ab767c9060d5a5ed7505f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-30 08:55, Jan Beulich wrote:
> The rule demands that all array elements be initialized (or dedicated
> initializers be used). Introduce a small set of macros to allow doing 
> so
> without unduly affecting use sites (in particular in terms of how many
> elements .matches[] actually has; right now there's no use of
> DMI_MATCH4(), so we could even consider reducing the array size to 3).
> 
> Note that DMI_MATCH() needs adjustment because of the comma included in
> its expansion, which - due to being unparenthesized - would otherwise
> cause macro arguments in the "further replacement" step to be wrong.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course a question is how many of these DMI table entries are in fact
> no longer applicable (e.g. because of naming 32-bit-only systems).
> Subsequently the table in dmi_scan.c itself may want cleaning up as
> well, yet I guess the question of stale entries is even more relevant
> there.
> 
> An alternative to using the compound literal approach might be to go
> along the lines of
> 
> #define DMI_MATCH4(m1, m2, m3, m4) .matches = { [0] = m1, [1] = m2, [2] 
> = m3, [3] = m4 }
> 
> I've chosen the other approach mainly because of being slightly 
> shorter.
> 

 From a MISRA perspective this resolves all but one violation: the 
initialization of static array

ns16550_com[2] = { { 0 } };

in drivers/char/ns16550.c. This is a case where the explicit initializer 
looks unnecessary.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

