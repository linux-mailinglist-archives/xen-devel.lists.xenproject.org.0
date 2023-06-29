Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA997428D3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 16:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556880.869724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsxt-0001qK-UU; Thu, 29 Jun 2023 14:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556880.869724; Thu, 29 Jun 2023 14:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsxt-0001nc-RU; Thu, 29 Jun 2023 14:49:45 +0000
Received: by outflank-mailman (input) for mailman id 556880;
 Thu, 29 Jun 2023 14:49:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHn5=CR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qEsxs-0001nU-Jg
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 14:49:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2eaab0b3-168c-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 16:49:43 +0200 (CEST)
Received: from [192.168.1.198] (unknown [151.57.184.11])
 by support.bugseng.com (Postfix) with ESMTPSA id 8FD6E4EE0737;
 Thu, 29 Jun 2023 16:49:40 +0200 (CEST)
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
X-Inumbo-ID: 2eaab0b3-168c-11ee-b237-6b7b168915f2
Message-ID: <3cef948f-c85c-d906-4496-c1e528643675@bugseng.com>
Date: Thu, 29 Jun 2023 16:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH v3 1/3] xen/arch/arm: fix violations of MISRA C:2012
 Rule 3.1
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, "julien@xen.org"
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <7996a8bb62e62076d48bdf289e37352bb5e43b52.1688032865.git.nicola.vetrini@bugseng.com>
 <5FD86C4C-3BD6-4ED3-A910-683DCC86613D@arm.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <5FD86C4C-3BD6-4ED3-A910-683DCC86613D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/06/23 16:41, Luca Fancellu wrote:
> 
> 
>> On 29 Jun 2023, at 11:06, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>
>> In the files `xen/arch/arm/include/asm/arm(32|64)/flushtlb.h' there are a
>> few occurrences of nested '//' character sequences inside C-style comment
>> blocks, which violate Rule 3.1. The patch aims to resolve those by changing
>> the inner comments to arm asm comments, delimited by ';' instead.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Can I suggest another commit title:
> “xen/arm: tlbflush: fix violations of MISRA C:2012 Rule 3.1"
> 
> Sometimes when I am not sure on how to deal with prefixes, I check to the git
> history of the line I am changing, for these lines there was a commit from
> Julien using these prefixes. I’m using vs code with GitLens extension, that
> ease a lot this kind of checks.
> 
> Apart from that, the changes looks good to me:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 

Thanks for the suggestion, I'll use it from now on

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

