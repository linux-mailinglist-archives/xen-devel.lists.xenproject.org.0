Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6518113FF
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 15:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654011.1020647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDPon-0008Hs-Ih; Wed, 13 Dec 2023 14:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654011.1020647; Wed, 13 Dec 2023 14:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDPon-0008G9-Fn; Wed, 13 Dec 2023 14:02:33 +0000
Received: by outflank-mailman (input) for mailman id 654011;
 Wed, 13 Dec 2023 14:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw9L=HY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rDPom-0008G3-Jz
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 14:02:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4133c998-99c0-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 15:02:30 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B84A14EE0737;
 Wed, 13 Dec 2023 15:02:29 +0100 (CET)
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
X-Inumbo-ID: 4133c998-99c0-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Wed, 13 Dec 2023 15:02:29 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
In-Reply-To: <240c97ed-ce27-406d-84ad-68b72e999294@xen.org>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
 <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
 <240c97ed-ce27-406d-84ad-68b72e999294@xen.org>
Message-ID: <5ad1c008182bc9f23e1b37b0d6e35e4c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-12 16:49, Julien Grall wrote:
> Hi,
> 
> On 11/12/2023 12:32, Julien Grall wrote:
>> Hi,
>> 
>> On 11/12/2023 10:30, Nicola Vetrini wrote:
>>> The branches of the switch after a call to 'do_unexpected_trap'
>>> cannot return, but there is one path that may return, hence
>>> only some clauses are marked with ASSERT_UNREACHABLE().
>> I don't understand why this is necessary. The code should never be 
>> reachable because do_unexpected_trap() is a noreturn().
> 
> From the matrix discussion, it wasn't clear what was my position on 
> this patch.
> 
> I would much prefer if the breaks are kept. I could accept:
> 
> ASSERT_UNREACHABLE();
> break;
> 
> But this solution is a Nack because if you are concerned about 
> functions like do_unexpected_trap() to return by mistaken, then it 
> needs to also be safe in production.
> 
> The current proposal is not safe.
> 
> Cheers,

Ok. I wonder whether the should be applied here in vcpreg.c:

diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 39aeda9dab62..089d2f03eb5e 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -707,7 +707,8 @@ void do_cp10(struct cpu_user_regs *regs, const union 
hsr hsr)
          inject_undef_exception(regs, hsr);
          return;
      }
-
+
+    ASSERT_UNREACHABLE();
      advance_pc(regs, hsr);
  }

the rationale being that, should the switch somehow fail to return, the 
advance_pc would be called, rather than doing nothing.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

