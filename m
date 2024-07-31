Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66209433F3
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 18:14:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768943.1179844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBww-0004AN-Cs; Wed, 31 Jul 2024 16:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768943.1179844; Wed, 31 Jul 2024 16:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBww-00048F-8I; Wed, 31 Jul 2024 16:13:14 +0000
Received: by outflank-mailman (input) for mailman id 768943;
 Wed, 31 Jul 2024 16:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/qb=O7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sZBwu-000488-2v
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 16:13:12 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c78b1ea0-4f57-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 18:13:10 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5b5b67d0024so1548402a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 09:13:10 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac631b0395sm8943235a12.20.2024.07.31.09.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 09:13:08 -0700 (PDT)
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
X-Inumbo-ID: c78b1ea0-4f57-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722442389; x=1723047189; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rlJnHfoCOtaelGswhuvwpdXnULtdno4aU6oFyup1k8k=;
        b=CBskI7aMOeUq0ttPislLVis/82LVq5zgVRYuNyfBUeWRv6tsy7v1O/+CkgP0mM+QtX
         MEZoEC/FJC2Nv76etccG6YxDEKjmxhXx54agr6dWg251A8+0HS+mLHSQvEa3Gg/s2qHI
         YS+Cmd+k2loFQONPJiq3qrhv7S6pnJmBvPx+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722442389; x=1723047189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlJnHfoCOtaelGswhuvwpdXnULtdno4aU6oFyup1k8k=;
        b=ukTE1eUrBo26i+KbPCd+UmdtHQSYzbYv0y7EePp4qEXKV+FJcaWuKBqR6EmKMEK9Rd
         WhhAq8iKmqmiILPcvKWwExi9W7S9M6Tuzutz+2B0MUBc3P5mCgPI8kzOCfjM4WmmW4z9
         CWEDS8TdiMZU2rF7jWOc5JM4+I86L6jGDVLNoDQ69ggpmPHf6sSdfaF8urGhkrehaanI
         99XfqLMmQyOCEd/wKXYz4oWSwB5ZNouc2QLt5DpY3ClR/YdMaTSlLNqwc7l2aOj6Pjgj
         UgIXhkDoowRTDHMzmQzlLfDLdTf48nYWiX/mXI9EQobaz6rIIG7HDInWUMNF8AqvpzIS
         mj2w==
X-Forwarded-Encrypted: i=1; AJvYcCUzRlZuHzCuJFUg9wU1qLiD2s6qZ/kITjVX82N2CQY6VpxBYuwgZ/O+ZLK24J7MFu1sLT5nUqpUtU9NIEM69LZeOjDxn7GyLqGOXDnYTNs=
X-Gm-Message-State: AOJu0YwzgmhEeVecCYwwBQLaQgJtkd9kepJN2G9SLzT1xjm5/r3bmEPv
	IcfZt8jTeYFQYFYCDU4qHAtxQaTY8sfK9RZ/WB11YXspbYFjGgJdtYHcsu/rmzTAECQuQZiQ6TY
	9
X-Google-Smtp-Source: AGHT+IGgYhGverrck+rLjbbsiwhk+dTy7TIpnpMQF2kfvg0mKrcC/Re2NhlE+MXRdQVR+heWRj94fQ==
X-Received: by 2002:a50:f69a:0:b0:5a2:87d3:6ee6 with SMTP id 4fb4d7f45d1cf-5b0224cf4b3mr9093841a12.32.1722442389543;
        Wed, 31 Jul 2024 09:13:09 -0700 (PDT)
Message-ID: <762756f0-1bb1-4c76-bce9-710dbe85c49f@citrix.com>
Date: Wed, 31 Jul 2024 17:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] SUPPORT.md: split XSM from Flask
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <121c2612-c255-4051-8d7c-315df6b3d348@suse.com>
 <a1fc969a-aa91-4daa-92ff-931a2c5c8f37@citrix.com>
 <36cee24e-e9c3-4a22-a2f7-cec6c3ffcf74@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <36cee24e-e9c3-4a22-a2f7-cec6c3ffcf74@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/07/2024 4:14 pm, Jan Beulich wrote:
> On 31.07.2024 16:59, Andrew Cooper wrote:
>> On 31/07/2024 3:28 pm, Jan Beulich wrote:
>>> XSM is a generic framework, which in particular is also used by SILO.
>>> With this it can't really be experimental: Arm mandates SILO for having
>>> a security supported configuration.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v2: Terminology adjustments. Stronger description.
>>>
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -768,13 +768,20 @@ Compile time disabled for ARM by default
>>>  
>>>      Status, x86: Supported, not security supported
>>>  
>>> -### XSM & FLASK
>>> +### XSM (Xen Security Module)
>> I'd suggest using Modules (plural) here.
> But XSM itself is just one thing?

In which case "XSM (Xen Security Module) Framework" ?

>
>>> +
>>> +    Status: Supported
>>> +
>>> +See below for use with FLASK and SILO.  The dummy implementation is covered here
>>> +as well.
>> I still think we want a one-line description of what "dummy" is.
>>
>> "XSM is a security policy framework.  The dummy implementation is
>> covered by this statement, and implements a policy whereby dom0 is all
>> powerful.  See below for alternative modules (FLASK, SILO)."
>>
>> ?
> Hmm, can do. Looking around in some cases we indeed have such explanations.

Everything which isn't entirely obvious should come with a oneliner
explanation.  Otherwise, SUPPORT.md is useless to non-Xen developers.

~Andrew

