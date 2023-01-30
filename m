Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5E0681DCD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 23:12:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487248.754830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMcNB-0005ss-Gy; Mon, 30 Jan 2023 22:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487248.754830; Mon, 30 Jan 2023 22:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMcNB-0005pk-DJ; Mon, 30 Jan 2023 22:11:33 +0000
Received: by outflank-mailman (input) for mailman id 487248;
 Mon, 30 Jan 2023 22:11:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMcNA-0005pe-Bu
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 22:11:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMcN9-00066a-IM; Mon, 30 Jan 2023 22:11:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMcN9-0005tS-CI; Mon, 30 Jan 2023 22:11:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=W0g9OHm+SaI85wEZniYACedt3YZ8DzwJcSmRkBFvQuo=; b=3jdS8nomV2jVFDhv7C76GIuJBl
	tndVjl4Je7Hs9dYP46mf4cPl4vhVc9x2z/ksi02/24VNWBCqXH7XuKWhv72huyw+/H3mKhWEo3A0T
	VLpmkniEoG/JUILabwSeAPWfZYnf18GXawBfzZI0IDQL6E9ogoB+t2nYOXgSLsmR2g2M=;
Message-ID: <8c0bce0b-05bd-5f4b-7b66-f6668ad34899@xen.org>
Date: Mon, 30 Jan 2023 22:11:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
 <a8219b2d-a22d-63ac-5088-c33610310d6e@xen.org>
 <27469e861d4777af42b84fb637b24ed47a187647.camel@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
In-Reply-To: <27469e861d4777af42b84fb637b24ed47a187647.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 30/01/2023 11:40, Oleksii wrote:
> On Fri, 2023-01-27 at 14:54 +0000, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 27/01/2023 13:59, Oleksii Kurochko wrote:
>>> +static inline void wfi(void)
>>> +{
>>> +    __asm__ __volatile__ ("wfi");
>>
>> I have starred at this line for a while and I am not quite too sure
>> to
>> understand why we don't need to clobber the memory like we do on Arm.
>>
> I don't have an answer. The code was based on Linux so...

Hmmm ok. It would probably wise to understand how code imported from 
Linux work so we don't end up introducing bug when calling such function.

 From your current use in this patch, I don't expect any issue. That may 
chance for the others use.

>> FWIW, Linux is doing the same, so I guess this is correct. For Arm we
>> also follow the Linux implementation.
>>
>> But I am wondering whether we are just too strict on Arm, RISCv
>> compiler
>> offer a different guarantee, or you expect the user to be responsible
>> to
>> prevent the compiler to do harmful optimization.
>>
>>> +/*
>>> + * panic() isn't available at the moment so an infinite loop will
>>> be
>>> + * used temporarily.
>>> + * TODO: change it to panic()
>>> + */
>>> +static inline void die(void)
>>> +{
>>> +    for( ;; ) wfi();
>>
>> Please move wfi() to a newline.
> Thanks.
> 
> I thought that it is fine to put into one line in this case but I'll
> move it to a newline. It's fine.

I am not aware of any place in Xen where we would combine the lines.
Also, you want a space after 'for'.

Cheers,

-- 
Julien Grall

