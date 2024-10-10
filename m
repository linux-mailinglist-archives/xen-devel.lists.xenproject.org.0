Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343669979CB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 02:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815325.1229047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhNW-00066H-VQ; Thu, 10 Oct 2024 00:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815325.1229047; Thu, 10 Oct 2024 00:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhNW-00062y-RU; Thu, 10 Oct 2024 00:50:06 +0000
Received: by outflank-mailman (input) for mailman id 815325;
 Thu, 10 Oct 2024 00:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syhNU-0005nP-SB
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 00:50:04 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94f86966-86a1-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 02:50:03 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728521396399897.9801760655782;
 Wed, 9 Oct 2024 17:49:56 -0700 (PDT)
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
X-Inumbo-ID: 94f86966-86a1-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728521398; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BGKNCTKR7Iu8qOl7PZWKH6TTzqTpRMmqDofsp9PNTBxerM3bLXWKlpgYfJSgyQ/Lj/BPfp9+nwL51wV4XM6g2d1o3f11TT2SVPLLUyounAJl8/8bvkC4mxEyVkbXN6gpEZ2ee+rI95KhgRLNDX1IQbanoDuvN2x6XRY+dNhX1SI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728521398; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NNKOfYBwW6ac4MKfufnn4w2/OIYAggKc4UDv6sB8Ytg=; 
	b=BokSoqe+L8PRpvL1EIBw4zgcCZvBpjMqRoD4hN6HfIVvHwVpRzQWTeW3QT7B6b7l8tLOwYnJ8ibRSmkPT2PYyyzjAtvL77AOAIpATDyqfJVTPJZnMjSS6Q27RAHkcFrJRci+7K9SGku3zVJiaxA1SNtxI/5Xl26+U7sc7jHBCS8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728521398;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NNKOfYBwW6ac4MKfufnn4w2/OIYAggKc4UDv6sB8Ytg=;
	b=BbGxReiICqqeR9M+wwyWTs0iG3h7bFvGFODQHHgj+eHroWUzKxCdc1bYq8VVfxab
	SPUMhuulCF1WRSO6d5/UdH9aIcJVOqvFyt28mX3GoFRsgTmFkUk25Qst2xut/FpWLQE
	CEJ4XXj8+YBUUjsLyUiTZ0hWzHbADSEv+UExrKcQ=
Message-ID: <5726a5d1-7a76-41c8-85b1-c0c08cae4c5d@apertussolutions.com>
Date: Wed, 9 Oct 2024 20:49:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 43/44] x86/boot: convert dom0_construct_pv to struct
 boot_domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-44-dpsmith@apertussolutions.com>
 <5fe173b3-9c75-4f10-92df-d8e022231bf3@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <5fe173b3-9c75-4f10-92df-d8e022231bf3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 15:54, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> With construct_dom0 consuming struct boot_domain, continue passing the
>> structure down to dom0_construct_pv.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>> index 16b8c1e40998..34974aa7cd56 100644
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -354,10 +354,7 @@ static struct page_info * __init 
>> alloc_chunk(struct domain *d,
>>       return page;
>>   }
>> -static int __init dom0_construct(struct domain *d,
>> -                                 const struct boot_module *image,
>> -                                 struct boot_module *initrd,
>> -                                 const char *cmdline)
>> +static int __init dom0_construct(struct boot_domain *bd)
>>   {
>>       int i, rc, order, machine;
>>       bool compatible, compat;
>> @@ -373,11 +370,12 @@ static int __init dom0_construct(struct domain *d,
>>       struct page_info *page = NULL;
>>       unsigned int flush_flags = 0;
>>       start_info_t *si;
>> -    struct vcpu *v = d->vcpu[0];
>> -    void *image_base = bootstrap_map_bm(image);
>> -    unsigned long image_len = image->size;
>> -    void *image_start = image_base + image->headroom;
>> -    unsigned long initrd_len = initrd ? initrd->size : 0;
>> +    struct domain *d = bd->d;
>> +    struct vcpu *v = bd->d->vcpu[0];
> 
> This can stay:
>      struct vcpu *v = d->vcpu[0];

Ack.

> With that:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks!

v/r,
dps

