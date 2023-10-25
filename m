Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352CF7D7156
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 17:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623110.970607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvgHB-0003uX-BC; Wed, 25 Oct 2023 15:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623110.970607; Wed, 25 Oct 2023 15:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvgHB-0003sr-8V; Wed, 25 Oct 2023 15:58:33 +0000
Received: by outflank-mailman (input) for mailman id 623110;
 Wed, 25 Oct 2023 15:58:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvgH9-0003sl-Ef
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 15:58:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvgGv-0005Jy-Ud; Wed, 25 Oct 2023 15:58:17 +0000
Received: from [15.248.3.4] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvgGv-00059P-Jz; Wed, 25 Oct 2023 15:58:17 +0000
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
	bh=RlPOZ+wnev9DbM/P8Ke1/jGgNtuLQSSx6yexMPyHR1o=; b=hRTkfmXcYyfURchc1n9Bo4hTRR
	fz0mek4WPyp8PDJ8q9YKp4hQGI7u4d7FJVagjKR1yCVGNaMgJGVx7YFU9rmhL5j91UC5xZS0WZTWH
	FBEn1GwNpNhr5F2O9PzqvgJSCPb7I90+J7nfWiscIvF1R4J8r2gmUET0GYrZX53QaAR8=;
Message-ID: <50b3a500-aa7d-4d3d-8bcf-220f8ee69b0e@xen.org>
Date: Wed, 25 Oct 2023 16:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com>
 <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop>
 <725f5193-c8d3-1bc8-cd62-2a2b1b5ecc01@suse.com>
 <alpine.DEB.2.22.394.2310171709310.965337@ubuntu-linux-20-04-desktop>
 <ead797ed-84cc-fb70-5259-7e11211d049e@suse.com>
 <alpine.DEB.2.22.394.2310181739270.965337@ubuntu-linux-20-04-desktop>
 <e642bc2a-cefa-4ee4-6394-3c10102e8164@suse.com>
 <alpine.DEB.2.22.394.2310190915590.1945130@ubuntu-linux-20-04-desktop>
 <6374f0f4-d58f-83ca-6eb3-d5a9fcbac525@suse.com>
 <alpine.DEB.2.22.394.2310201622160.2356865@ubuntu-linux-20-04-desktop>
 <36e6dd08-918c-9791-0dab-ca75d4b98d7e@suse.com>
 <alpine.DEB.2.22.394.2310231346370.3516@ubuntu-linux-20-04-desktop>
 <af4a86bc-40d3-4363-adc8-30981652cd2b@xen.org>
 <c1fa350f-6f49-e2b1-0cda-dec99df415ae@suse.com>
 <alpine.DEB.2.22.394.2310241254480.271731@ubuntu-linux-20-04-desktop>
 <f546b8dc-baa8-c178-12be-70f7c1a8fec8@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f546b8dc-baa8-c178-12be-70f7c1a8fec8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/10/2023 09:18, Jan Beulich wrote:
> On 24.10.2023 21:59, Stefano Stabellini wrote:
>> If I understood correctly I am fine with that. To make sure we are all
>> on the same page, can you provide a couple of samples?
> 
> Taking the earlier example, instead of DRIVERS_PASSTHROUGH_VTD_DMAR_H it
> would then be VTD_DMAR_H. arch/x86/pv/mm.h would use PV_MM_H, but then
> you can already see that a hypothetical arch/x86/mm.h would use X86_MM_H,
> thus colliding with what your proposal would also yield for
> arch/x86/include/asm/mm.h. So maybe private header guards should come
> with e.g. a trailing underscore? Or double underscores as component
> separators, where .../include/... use only single underscores? Or
> headers in arch/*/include/asm/ use ASM_<name>_H (i.e. not making the
> architecture explicit in the guard name, on the grounds that headers
> from multiple architectures shouldn't be included at the same time)?
Thanks for providing some details.  The proposal for private headers 
make sense. For arch/.../include/asm/ headers, I would strongly prefer 
if we use prefix them with ASM_*.

As a side note, I am guessing for asm-generic, we would want to use 
ASM_GENERIC_* for the guard prefix. Is that correct?

Cheers,

-- 
Julien Grall

