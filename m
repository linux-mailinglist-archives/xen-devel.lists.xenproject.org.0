Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34066A457A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502679.774575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWezD-0000Wx-2D; Mon, 27 Feb 2023 15:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502679.774575; Mon, 27 Feb 2023 15:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWezC-0000Um-Ur; Mon, 27 Feb 2023 15:00:18 +0000
Received: by outflank-mailman (input) for mailman id 502679;
 Mon, 27 Feb 2023 15:00:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pWezB-0000Ua-6F
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:00:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWezA-0002ok-Oe; Mon, 27 Feb 2023 15:00:16 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.16.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWezA-0000zL-Iu; Mon, 27 Feb 2023 15:00:16 +0000
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
	bh=vuqz0qJecfZ5v27tzPKQ+H8bB3dJlRoHVMU7F/+nZXM=; b=g5UKFuwGbHLIt4e5N1v5hb4zve
	BlTS4FVxeMDDwH3i5aG8c2DIDuLLiNv36N3dS9PCRqyA6Qaq8eW4GFQA3p6YKtWJ4m5oo/AfCQ1HK
	Qw10v8Q6l9jAQiaLoG0C7T2SzOwkLSf1eJYGD+KfdV9sILtVQ8c5LEY4LlZ3DtTjaaW4=;
Message-ID: <42827e14-8daa-66ed-328a-92940dc98a95@xen.org>
Date: Mon, 27 Feb 2023 15:00:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v7 09/20] xen/arm: ffa: add support for FFA_ID_GET
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marc Bonnici <Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <82e4e0c3ac1614822fddd90336c22e6fad5b485e.1677079672.git.jens.wiklander@linaro.org>
 <FF2BBB34-102C-425F-9A9A-2D6FA1BEB2D4@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FF2BBB34-102C-425F-9A9A-2D6FA1BEB2D4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/02/2023 14:48, Bertrand Marquis wrote:
>> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>
>> Adds support for the FF-A function FFA_ID_GET to return the ID of the
>> calling client.
>>
>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>> ---
>> xen/arch/arm/tee/ffa.c | 21 ++++++++++++++++++++-
>> 1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>> index 8b0b80ce1ff5..463fd7730573 100644
>> --- a/xen/arch/arm/tee/ffa.c
>> +++ b/xen/arch/arm/tee/ffa.c
>> @@ -167,6 +167,12 @@ static bool ffa_get_version(uint32_t *vers)
>>      return true;
>> }
>>
>> +static uint16_t get_vm_id(const struct domain *d)
>> +{
>> +    /* +1 since 0 is reserved for the hypervisor in FF-A */
>> +    return d->domain_id + 1;
>> +}
>> +
>> static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
>>                       register_t v2, register_t v3, register_t v4, register_t v5,
>>                       register_t v6, register_t v7)
>> @@ -181,6 +187,12 @@ static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
>>          set_user_reg(regs, 7, v7);
>> }
>>
>> +static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
>> +                             uint32_t w3)
>> +{
>> +    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
>> +}
>> +
>> static void handle_version(struct cpu_user_regs *regs)
>> {
>>      struct domain *d = current->domain;
>> @@ -210,6 +222,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
>>      case FFA_VERSION:
>>          handle_version(regs);
>>          return true;
>> +    case FFA_ID_GET:
>> +        set_regs_success(regs, get_vm_id(d), 0);
>> +        return true;
>>
>>      default:
>>          gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
>> @@ -221,7 +236,11 @@ static int ffa_domain_init(struct domain *d)
>> {
>>      struct ffa_ctx *ctx;
>>
>> -    if ( !ffa_version )
>> +     /*
>> +      * We can't use that last possible domain ID or get_vm_id() would cause
>> +      * an overflow.
>> +      */
>> +    if ( !ffa_version || d->domain_id == UINT16_MAX)
>>          return -ENODEV;
> 
> In reality the overflow could only happen if this is called by the IDLE domain right now.
> Anyway this could change and this is making the code more robust at no real cost.
> 
> I would just suggest here to return a different error code like ERANGE for example to
> prevent missing ENODEV with other cases not related to FFA not being available.

+1. I would also like to suggest to use >= rather than == in case we 
decide to support more than 16-bit domid.

Cheers,

-- 
Julien Grall

