Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A99F63CBFE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 00:52:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449687.706584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0ANx-0005Q3-TO; Tue, 29 Nov 2022 23:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449687.706584; Tue, 29 Nov 2022 23:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0ANx-0005NK-Qn; Tue, 29 Nov 2022 23:51:33 +0000
Received: by outflank-mailman (input) for mailman id 449687;
 Tue, 29 Nov 2022 23:51:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMqW=35=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p0ANw-0005NE-0o
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 23:51:32 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be144469-7040-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 00:51:29 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 31C4FB817BB;
 Tue, 29 Nov 2022 23:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D48AC433C1;
 Tue, 29 Nov 2022 23:51:25 +0000 (UTC)
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
X-Inumbo-ID: be144469-7040-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669765886;
	bh=C75V34+Ow/44DJ3mf/LUmPvzrLRJ7RgB01JL25nL5zQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=huDVbi1COqsyzNEkafLwb2vTCg/Ykovahb/x2bBlk6ASmgVGKlntuPx2tzJ+wAWXl
	 8Aw32qLBduG1aJZIfw71iyPQGY1TDhv2t6bzsvL43JBB/0dBvA21UW0Bc0TCti08KB
	 B/sk7LWj+8yfzkpNhvXmKD0aHmtK+MV2VYJh50S15zExPBuEiRO6nJrjcxVy18zcl1
	 kICiOQQX0awoAbZRAoizVvLYuzdvTKBI/EqdVox4ujpEU2pwwvB1KDpCPhi8TFJGJR
	 jrxVhmlRxr5ZZLPn8laAF2TbIZbZcKbzPIFSm9U0eCfYjHmchhKkaPzlK70AJzsSvo
	 v1obuoUjjC23Q==
Date: Tue, 29 Nov 2022 15:51:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/4] tools/misra: fix skipped rule numbers
In-Reply-To: <20221128141006.8719-4-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2211291545420.4039@ubuntu-linux-20-04-desktop>
References: <20221128141006.8719-1-luca.fancellu@arm.com> <20221128141006.8719-4-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Nov 2022, Luca Fancellu wrote:
> Currently the script convert_misra_doc.py is using a loop through
> range(1,22) to enumerate rules that needs to be skipped, however
> range function does not include the stop counter in the enumeration
> ending up into list rules until 21.21 instead of including rule 22.
> 
> Fix the issue using a dictionary that list the rules in misra c2012.

I think I understand the problem you are trying to solve with this
patch. But I am confused about the proposed solution.

The original code is trying to list all the possible MISRA C rules that
are not in docs/misra/rules.rst. Instead of list(range(1,22)) now we
have a dictionary: misra_c2012_rules. But misra_c2012_rules doesn't have
all the possible MISRA C rules missing from docs/misra/rules.rst.

As an example Rule 13.1 is missing from docs/misra/rules.rst but it is
also missing from misra_c2012_rules.

Can you please help me understand why misra_c2012_rules has only a small
subset of MISRA C rules to be skipped?


> Fixes: 57caa5375321 ("xen: Add MISRA support to cppcheck make rule")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/tools/convert_misra_doc.py | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/tools/convert_misra_doc.py b/xen/tools/convert_misra_doc.py
> index caa4487f645f..13074d8a2e91 100755
> --- a/xen/tools/convert_misra_doc.py
> +++ b/xen/tools/convert_misra_doc.py
> @@ -14,6 +14,34 @@ Usage:
>  
>  import sys, getopt, re
>  
> +# MISRA rule are identified by two numbers, e.g. Rule 1.2, the main rule number
> +# and a sub-number. This dictionary contains the number of the MISRA rule as key
> +# and the maximum sub-number for that rule as value.
> +misra_c2012_rules = {
> +    1:4,
> +    2:7,
> +    3:2,
> +    4:2,
> +    5:9,
> +    6:2,
> +    7:4,
> +    8:14,
> +    9:5,
> +    10:8,
> +    11:9,
> +    12:5,
> +    13:6,
> +    14:4,
> +    15:7,
> +    16:7,
> +    17:8,
> +    18:8,
> +    19:2,
> +    20:14,
> +    21:21,
> +    22:10
> +}
> +
>  def main(argv):
>      infile = ''
>      outfile = ''
> @@ -142,8 +170,8 @@ def main(argv):
>      skip_list = []
>  
>      # Search for missing rules and add a dummy text with the rule number
> -    for i in list(range(1,22)):
> -        for j in list(range(1,22)):
> +    for i in misra_c2012_rules:
> +        for j in list(range(1,misra_c2012_rules[i]+1)):
>              if str(i) + '.' + str(j) not in rule_list:
>                  outstr.write('Rule ' + str(i) + '.' + str(j) + '\n')
>                  outstr.write('No description for rule ' + str(i) + '.' + str(j)
> -- 
> 2.17.1
> 

