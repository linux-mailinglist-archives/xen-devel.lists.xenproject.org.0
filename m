Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E3996DB8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814624.1228224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXfS-0007w8-Ll; Wed, 09 Oct 2024 14:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814624.1228224; Wed, 09 Oct 2024 14:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXfS-0007uN-IJ; Wed, 09 Oct 2024 14:27:58 +0000
Received: by outflank-mailman (input) for mailman id 814624;
 Wed, 09 Oct 2024 14:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syXfR-0007uE-SK
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:27:57 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abd43475-864a-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 16:27:55 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728484066240917.0602204986117;
 Wed, 9 Oct 2024 07:27:46 -0700 (PDT)
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
X-Inumbo-ID: abd43475-864a-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728484071; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i+S2D8Hcg0UOBkoDZlMgr9MXWaRKT69o3Bn6iau/KlgrbteChpw4n+uZI4LQQrWKuUY77nADpYls9swqlL5OoL2r0BnCUuuRLDm9Ho/hYphhVxk0Z9R45FrDBkaFRWn31jMbGBUl/QZAXyAYFJq8hn9rqZxe09MHBKADzAT+3ZQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728484071; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9dnrk7Ux+QSKxifrK0fc4/U5m1lGqmw0srJnlZiqcg4=; 
	b=Ud40njCK4jqwGygOsUaLKnISmVKVI2bH5wm9JqTKHqlz3tkUn5wM6D3yr57LT8bwTzBF2P4R9gKZreIu5nPz5uuhNJiDXWUmBVPBJnF6eZqPh6+HIFicTxRgXtVaaYZNDiOEfS5KgavEJvOnxIGnv9kSE/Bt1bqCvOq1ZpH1Mao=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728484071;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9dnrk7Ux+QSKxifrK0fc4/U5m1lGqmw0srJnlZiqcg4=;
	b=r/Cp4r6GVNSCEI0YmzdDENpab0yzXkdLyCb8z5kgZec+3gBYPCQLgHvkgZfYI6ix
	wioc/hI9Gw9G/is4oLZOgAtN+NRfSiuZ9tWCLNo9/sWmcb2mtDKVgTYHK83nCPn7ZqT
	+0+VeZoZHkPoWiRNPCTbaGrX0bwUpSrq3mnXB2wg=
Message-ID: <580cc5e2-ef46-476a-90cc-97d78708e03a@apertussolutions.com>
Date: Wed, 9 Oct 2024 10:27:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/44] x86/boot: introduce boot module flags
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-11-dpsmith@apertussolutions.com>
 <9372d72c-c98d-495b-bc3c-8b81208f7cd5@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <9372d72c-c98d-495b-bc3c-8b81208f7cd5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/7/24 16:02, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> The existing startup code employs various ad-hoc state tracking about 
>> certain
>> boot module types by each area of the code. A boot module flags is 
>> added to
>> enable tracking these different states.  The first state to be 
>> transition by
>> this commit is module relocation.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootinfo.h | 4 ++++
>>   xen/arch/x86/setup.c                | 8 ++++----
>>   2 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h 
>> b/xen/arch/x86/include/asm/bootinfo.h
>> index 6941a8975ea6..021ff0d93643 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -31,6 +31,10 @@ struct boot_module {
>>        */
>>       unsigned long headroom;
>>       enum bootmod_type type;
>> +
>> +    uint32_t flags;
>> +#define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
>> +
> 
> Stray newline.  Otherwise:
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Ack and thank you.

v/r,
dps

