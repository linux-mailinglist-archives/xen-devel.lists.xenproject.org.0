Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB711547358
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 11:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347118.573253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzxcn-0000cz-Ra; Sat, 11 Jun 2022 09:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347118.573253; Sat, 11 Jun 2022 09:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzxcn-0000Zn-ON; Sat, 11 Jun 2022 09:41:45 +0000
Received: by outflank-mailman (input) for mailman id 347118;
 Sat, 11 Jun 2022 09:41:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzxcm-0000Zh-BC
 for xen-devel@lists.xenproject.org; Sat, 11 Jun 2022 09:41:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzxck-0005W0-LY; Sat, 11 Jun 2022 09:41:42 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzxck-0001VZ-Fm; Sat, 11 Jun 2022 09:41:42 +0000
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
	bh=0XL7oyQnVXn+mEg0//1CB9ap+KpDRbvC/oKn1rv5qNk=; b=BHzTF+6ztO3YrRjy7X4T2zPXWf
	VimisPDu5KTAzNiYueOjG5yvTGsc3s/avVp+ID0v2fc0eB3QQVpa9DpUTJ+SwVq97GNvU7XDHOMcL
	sp0vAFOEwweKnJ5Okas9ry4tMfhjOLhrsWbKP1WmoviN8xtqKfrILaEbAOkZglXD6tlg=;
Message-ID: <569a6d37-157a-d237-3ef9-d77fae32d002@xen.org>
Date: Sat, 11 Jun 2022 10:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220609061812.422130-1-jens.wiklander@linaro.org>
 <20220609061812.422130-2-jens.wiklander@linaro.org>
 <alpine.DEB.2.22.394.2206101733020.756493@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
In-Reply-To: <alpine.DEB.2.22.394.2206101733020.756493@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 11/06/2022 01:41, Stefano Stabellini wrote:
> On Thu, 9 Jun 2022, Jens Wiklander wrote:
>> +    /* Store the registers x0 - x17 into the result structure */
>> +    stp	x0, x1, [x19, #0]
>> +    stp	x2, x3, [x19, #16]
>> +    stp	x4, x5, [x19, #32]
>> +    stp	x6, x7, [x19, #48]
>> +    stp	x8, x9, [x19, #64]
>> +    stp	x10, x11, [x19, #80]
>> +    stp	x12, x13, [x19, #96]
>> +    stp	x14, x15, [x19, #112]
>> +    stp	x16, x17, [x19, #128]
> 
> I noticed that in the original commit the offsets are declared as
> ARM_SMCCC_1_2_REGS_X0_OFFS, etc. In Xen we could add them to
> xen/arch/arm/arm64/asm-offsets.c given that they are only used in asm.
> 
> That said, there isn't a huge value in declaring them given that they
> are always read and written in order and there is nothing else in the
> struct, so I am fine either way.

While we don't support big-endian in Xen (yet?), the offsets will be 
inverted.

Furthermore, I prefer to avoid open-coded value (in particular when they 
are related to offset). They are unlikely going to change, but at least 
we have the compiler that will compute them for us (so less chance for a 
problem).

Cheers,

-- 
Julien Grall

