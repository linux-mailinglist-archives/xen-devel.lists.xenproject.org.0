Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2657775CC46
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 17:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567637.886931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMsJ2-0007Og-VD; Fri, 21 Jul 2023 15:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567637.886931; Fri, 21 Jul 2023 15:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMsJ2-0007LS-SD; Fri, 21 Jul 2023 15:44:36 +0000
Received: by outflank-mailman (input) for mailman id 567637;
 Fri, 21 Jul 2023 15:44:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMsJ2-0007LM-Az
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 15:44:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMsJ1-0000to-IG; Fri, 21 Jul 2023 15:44:35 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.21.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMsJ1-0006Iq-Bt; Fri, 21 Jul 2023 15:44:35 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=3K0ntquEJPgGRY3chu4E0HtaMr0S7IXxsYtQmgCoiBg=; b=urh2IOIY9gRB3mIMjLvqC9EmiJ
	QVNc9CFakWrTjACbWKN0KDFw43zuOxyI1F+xW0tNgdjR9Obps73LFfB0lHcKtRrKZ37M7N/xQTlJA
	1wLSqPa04f9ArPGIT3VaczUAOPTS5qIu8zvGsUqxPkJ+EYPdGjqTNvgFz8XgKZLFBYq4=;
Message-ID: <fa0c651f-2e02-e058-a3e5-efdaced81456@xen.org>
Date: Fri, 21 Jul 2023 16:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] atomic: change parameter name in atomic_cmpxchg()
 definition
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cace061a0b574d56f9b12a43a7c82276ef56654f.1689953642.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cace061a0b574d56f9b12a43a7c82276ef56654f.1689953642.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Title:

Please add "xen/arm: " to clarify this is a patch touching the Arm code.

On 21/07/2023 16:37, Federico Serafini wrote:
> Change parameter name from 'ptr' to 'v' in the function definition thus
> addressing violations of MISRA C:2012 Rule 8.3: "All declarations of an
> object or function shall use the same names and type qualifiers".

The parameters are consistent between arm32 and arm64. Naming wise, any 
reason you picked the x86 name? Personally, I have a slight preference 
to keep 'ptr' because this is more obvious than 'v'.

But I will not strongly argue against it. That said, if you are looking 
for consistency, you should also modify arm32.

Cheers,

-- 
Julien Grall

