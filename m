Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4577BB816
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 14:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613583.954198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokHt-0004qE-5t; Fri, 06 Oct 2023 12:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613583.954198; Fri, 06 Oct 2023 12:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokHt-0004nf-2U; Fri, 06 Oct 2023 12:50:37 +0000
Received: by outflank-mailman (input) for mailman id 613583;
 Fri, 06 Oct 2023 12:50:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2TT5=FU=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qokHs-0004nZ-ID
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 12:50:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f084f8bf-6446-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 14:50:34 +0200 (CEST)
Received: from [192.168.1.15] (host-87-11-204-216.retail.telecomitalia.it
 [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id 893524EE0738;
 Fri,  6 Oct 2023 14:50:33 +0200 (CEST)
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
X-Inumbo-ID: f084f8bf-6446-11ee-9b0d-b553b5be7939
Message-ID: <f7207b73-9913-453a-8d04-7b97af24e78b@bugseng.com>
Date: Fri, 6 Oct 2023 14:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: update deviations and accepted
 guidelines
Content-Language: en-US, it
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <f7fb64aa1b78dfa57a2bf781f5a3cec6219c2de5.1696587777.git.simone.ballarin@bugseng.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <f7fb64aa1b78dfa57a2bf781f5a3cec6219c2de5.1696587777.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/23 12:23, Simone Ballarin wrote:
> +-doc_begin="XEN only supports architectures where signed integers are
> +representend using two's complement and all the XEN developers are aware of
> +this."
> +-config=MC3R1.R10.1,etypes+={safe,
> +  "stmt(operator(and||or||xor||not||and_assign||or_assign||xor_assign))",
> +  "any()"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.5 Integers\" of \"GCC_MANUAL\", where it says that
> +\"Signed `>>' acts on negative numbers by sign extension. As an extension to the
> +C language, GCC does not use the latitude given in C99 and C11 only to treat
> +certain aspects of signed `<<' as undefined. However, -fsanitize=shift (and
> +-fsanitize=undefined) will diagnose such cases. They are also diagnosed where
> +constant expressions are required.\""
> +-config=MC3R1.R10.1,etypes+={safe,
> +  "stmt(operator(shl||shr||shl_assign||shr_assign))",
> +  "any()"}
> +-doc_end

These two deviations for Rule 10.1 have been already proposed by me
in the following (not committed) patch:
https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00146.html

So, I would suggest dropping my patch in favor of the one
proposed by Simone.

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

