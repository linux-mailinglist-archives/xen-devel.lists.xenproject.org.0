Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8325F77F396
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 11:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585220.916272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZPv-0004bl-8E; Thu, 17 Aug 2023 09:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585220.916272; Thu, 17 Aug 2023 09:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZPv-0004Zl-5i; Thu, 17 Aug 2023 09:35:47 +0000
Received: by outflank-mailman (input) for mailman id 585220;
 Thu, 17 Aug 2023 09:35:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0n1I=EC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qWZPt-0004Zf-PS
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 09:35:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f707ccd-3ce1-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 11:35:43 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A13EC4EE0737;
 Thu, 17 Aug 2023 11:35:42 +0200 (CEST)
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
X-Inumbo-ID: 6f707ccd-3ce1-11ee-8779-cb3800f73035
MIME-Version: 1.0
Date: Thu, 17 Aug 2023 11:35:42 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Remove unused function 'do_trap_fiq'
In-Reply-To: <85fa02a8-7a19-4bca-89d7-6036038def4d@xen.org>
References: <21c76788cbf4b79d4b77721cbdb956ca@bugseng.com>
 <85fa02a8-7a19-4bca-89d7-6036038def4d@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <303c6a31510b90f9f37f18ec080acbb5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 16/08/2023 17:28, Julien Grall wrote:
> On 16/08/2023 16:18, Nicola Vetrini wrote:
>> Hi,
> 
> Hi,
> 
>> the function mentioned in the subject, defined in 
>> 'xen/arch/arm/traps.c' seems to have no
>> caller (either from C code or from asm code), so I think it can be 
>> safely removed, unless
>> there's a reason for it to remain in Xen.
> 
> This is used by the arm32 code in arm32/head.S:
> 
> trap_fiq:
>    vector fiq
> 
> where the macro vector will call do_trap_fiq.
> 
> So we need to keep the function around and a definition. Although we
> can move the function to arm32/traps.c but this is somewhat unrelated.
> 
> Cheers,

Ok. Would you mind if a declaration was supplied in an appropriate 
header file for this function,
to fully comply with Rule 8.4? This not only serves as useful 
documentation to developers
that will touch the asm files, as Stefano mentioned some time ago in the 
preliminary thread
on R8.4, but also prevents an avoidable violation of the Rule, and
hence yet another deviation to keep track of.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

