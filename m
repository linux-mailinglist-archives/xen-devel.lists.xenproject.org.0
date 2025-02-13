Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DBEA3420F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:31:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887718.1297180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaFK-00025G-KI; Thu, 13 Feb 2025 14:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887718.1297180; Thu, 13 Feb 2025 14:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaFK-00022s-HV; Thu, 13 Feb 2025 14:31:18 +0000
Received: by outflank-mailman (input) for mailman id 887718;
 Thu, 13 Feb 2025 14:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiaFJ-0001fg-3N
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:31:17 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29fdc69a-ea17-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 15:31:08 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso6237885e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 06:31:08 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4396180f231sm19371235e9.16.2025.02.13.06.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:31:07 -0800 (PST)
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
X-Inumbo-ID: 29fdc69a-ea17-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739457068; x=1740061868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EPAS/lQNesHaznl+GmCvYvz2oLNPOkuXue4loJVVq/Y=;
        b=Ohm9qjtgiBJtFAbGLh5eIv2OMZi9I4tptPHsSmt2E3ck+oUSHBIz6DwZ8q5Ea9qfl+
         jvTKCYxrD6V0D2dcIU2on0SCxkP6+JZnKJHHadPQU1G+uCxlMieb6dIhCw3oBSamNQzp
         hTyffq0u/MPKv8Z54ve8RpTzVH0KmunBmKWcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457068; x=1740061868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPAS/lQNesHaznl+GmCvYvz2oLNPOkuXue4loJVVq/Y=;
        b=dQpJiAR9JAIlFbtjWrM4AmrGJLTPeFoAQpZj9LIkCanlHxcS8ZpeAHxISsTMn1XBH/
         LKNYb/EHZb4BoFxGRaIdqh5KxUIB0xicIpaySmqpYZSuBYI3ZpvSQV0lchNbMNO6eZq4
         a7CXCmQRVW8R7x+DXbHWGBivwNQS4kaytU9GN528wnrLw2MN05sgiSKMhfi8HHCZSsJb
         lOnw9fvbCbtsnOCV0D06ZKLsFdCrwBd6wDMcHKFc999zqxsERR4lgY2T6zrPruUwpLFC
         TCodHVAwk798oK3cTUQzG9KWiRomk835XKGFGBjayAIcKw8qatTNCSkWwqL9nERQtuZy
         ByRQ==
X-Gm-Message-State: AOJu0Yzkrz8xZMNSuiJzbaFqjSbg1a8wmCmxIvdoRhtXNMIEaAvFBhiw
	/6TJBGYEvhFz2/dGbyrh2MerXAZlFhjuJ2zvbRbO9tISRX62TMxSpghUN4FhzOw=
X-Gm-Gg: ASbGncs2hiAWwfUYiUrkb/d0XibeLp5Gq9P+p4xy0xmfyLVSxDDXAnLfjpogN5GAIqu
	kPC2LmbTIwSwN7/tRIM7hkeVwT00YikKg+etWtadKSuMLLkFumxPjbLbOGpwh/Niof1ySpMtytx
	X5oK1VelASdvrKJkXj3TYOiwghmk2obO9JSy1v8tRProIdT273/d+hpccF3Q5JdqHYXe0IHZ+Wl
	cvGL+6WXYCCT+w8plLUCQLR05OnOMcNfGt304F4toC0NBGHGqGDMNtddhZ7DD46SNcmiGYR71w7
	WNQi1UN1Vv1Ila9DJpFsOdadZQ==
X-Google-Smtp-Source: AGHT+IEGQUmJb5ndW3m0yyRtlX6VmgtqAXHTNPqvh9CxmZYkHFqKvp/3waCokrx8U9kMehihikcKcg==
X-Received: by 2002:a05:600c:c08:b0:439:4221:8882 with SMTP id 5b1f17b1804b1-439581bfd19mr85295355e9.29.1739457067644;
        Thu, 13 Feb 2025 06:31:07 -0800 (PST)
Message-ID: <d6cf6b0b-1501-4acc-8dd8-3f71fa63ea47@citrix.com>
Date: Thu, 13 Feb 2025 14:31:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 for-4.20(?) 0/4] Add/enable stack protector
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
 <5b6b1ad2-c0cd-454c-aa7c-b6de37ab39df@citrix.com> <87pljmymos.fsf@epam.com>
 <e692db7a-c457-445e-befa-96702b512b13@citrix.com>
 <402c93ec-9cb0-41e0-b1c8-eca321140ad6@gmail.com>
 <50d8f989-2512-4414-b12c-a9cb33c675b7@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <50d8f989-2512-4414-b12c-a9cb33c675b7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/02/2025 2:26 pm, Oleksii Kurochko wrote:
>
>
> On 2/13/25 3:21 PM, Oleksii Kurochko wrote:
>>
>>
>> On 2/13/25 3:07 PM, Andrew Cooper wrote:
>>> On 13/02/2025 1:54 pm, Volodymyr Babchuk wrote:
>>>> Hi Andrew,
>>>>
>>>> Andrew Cooper <andrew.cooper3@citrix.com> writes:
>>>>
>>>>> On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
>>>>>> Volodymyr Babchuk (4):
>>>>>>   common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>>>>>>   xen: common: add ability to enable stack protector
>>>>>>   xen: arm: enable stack protector feature
>>>>>>   CHANGELOG.md: Mention stack-protector feature
>>>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>
>>>>> There's one minor formatting error which can be fixed on commit.
>>>>>
>>>>> ~Andrew
>>>> Thanks for the review. I noticed that this series is not committed. Is
>>>> there anything else required from my side?
>>>>
>>> You need an ARM Ack on patch 3.  [EDIT], no you don't, my R-by is good
>>> enough.
> Andrew, why it is enough your R-by for patch 3? It seems like it is fully Arm related patch
> and I expect to see Ack from Arm maintainers. Also, there is some comments from Julien.

Volodymyr is an ARM maintainer (so qualifies for the ARM requirement),
and my R-by covers the "looked over by any other person" requirement.

~Andrew

