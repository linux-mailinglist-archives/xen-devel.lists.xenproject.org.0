Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5A8664ED1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 23:31:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475001.736485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFN9F-0001ap-1B; Tue, 10 Jan 2023 22:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475001.736485; Tue, 10 Jan 2023 22:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFN9E-0001Yn-Ui; Tue, 10 Jan 2023 22:31:12 +0000
Received: by outflank-mailman (input) for mailman id 475001;
 Tue, 10 Jan 2023 22:31:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFN9D-0001Yh-Mz
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 22:31:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFN96-0003Zs-Mt; Tue, 10 Jan 2023 22:31:04 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.2.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFN96-0004o6-Ft; Tue, 10 Jan 2023 22:31:04 +0000
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
	bh=nL0hgIXtLIRLqID3kiLWMDGxgcSsGiMcy7f4z5lq1Jg=; b=XG6kO7rHNnckMSBBPOWKDM3577
	TfGLpg+bfRuQBpU3vI3Y7JisSBzaUyg2I7O8SuvgF33UGVONjNJowJJhEl6jHnurU0E4r8AHn3UVD
	p5WQ2WZz8TubQbpW9pCsXA+P3TRnW/eIfU4VgGbrOKTL+fbw9EQ0sY+1s8Rjwi6zqJEI=;
Message-ID: <c7c5bac2-d9a9-6a1f-355f-c1088322e8ad@xen.org>
Date: Tue, 10 Jan 2023 22:31:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/6] xen/riscv: introduce dummy asm/init.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
 <b1585373e39a7cbe023f485aa5a04b093e25ec80.1673362493.git.oleksii.kurochko@gmail.com>
 <891d0830-7fdc-202a-5f12-2364cae5bce5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <891d0830-7fdc-202a-5f12-2364cae5bce5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2023 17:02, Jan Beulich wrote:
> Arm maintainers,

Hi Jan,

> On 10.01.2023 16:17, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/init.h
>> @@ -0,0 +1,12 @@
>> +#ifndef _XEN_ASM_INIT_H
>> +#define _XEN_ASM_INIT_H
>> +
>> +#endif /* _XEN_ASM_INIT_H */
> 
> instead of having RISC-V introduce an empty stub matching what x86 has,
> what would it take to empty Arm's as well, allowing both present ones to
> go away and no new one to be introduced? The only thing you have in there
> is struct init_info, which doesn't feel like it's properly placed in this
> header (x86 has such stuff in setup.h) ...

Yes. setup.h should be a good place even though the header is getting 
quite crowded.

I am happy to send a patch for it.

Cheers,

-- 
Julien Grall

