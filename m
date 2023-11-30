Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9397FECD6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 11:28:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644534.1005666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8eGs-0004Hk-Km; Thu, 30 Nov 2023 10:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644534.1005666; Thu, 30 Nov 2023 10:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8eGs-0004FZ-IB; Thu, 30 Nov 2023 10:27:50 +0000
Received: by outflank-mailman (input) for mailman id 644534;
 Thu, 30 Nov 2023 10:27:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Ek5=HL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r8eGq-0004FS-T0
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 10:27:48 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b4ba00d-8f6b-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 11:27:47 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b4c2ef58aso6472045e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 02:27:47 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fk14-20020a05600c0cce00b0040b2a52ecaasm5249912wmb.2.2023.11.30.02.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 02:27:46 -0800 (PST)
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
X-Inumbo-ID: 1b4ba00d-8f6b-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701340067; x=1701944867; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHRbbPJ8up1Qhq+HcTJ8RXqEY3aSfkdE9EYDWXnnT3Y=;
        b=s4zo6VVN/z7gfd6uGF2Kj2tHOlHZ1ZJOF30RCJ+eCEqJMhqy93rmIEqQ+DhwddIH5j
         RRS8/Q7u9VeJZFzGDUOFKHl3Op9/ExQXeYmc80orEhW2LAuRlb1CX060nrun0clV1VDC
         EyTdzcEzb/WSrWm+9oH7XtQ22Ahr/99/4XuP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701340067; x=1701944867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHRbbPJ8up1Qhq+HcTJ8RXqEY3aSfkdE9EYDWXnnT3Y=;
        b=FVyAwLpOAoS6x8Po0LmYe8b+7qR7UX7HxiTU7VRw+Aw60zdfkjVdmdJxqZdytlGnBI
         EL13XjGpvLQpqUUNOTtrDmk3XpZ5NdInoL0xHp9skQBzIXMRRD7ujt/RltV6vWk5cs0e
         OUeiZl4xlLnt1Lxom1Hd/ZdAk1bGvlCilWyyIVwLPXqYGxkKmswrRCIDAj3nlN6xcfPv
         hROx2N+0BNJXHeLBNykHh936sUpi0ecF24DGW4JA8lSabiAbElUMETFFUaUc+HivFTKR
         AWBt+jmsKx9NAx4X5DG/MV7kTTxGLzEnH4kJjsWCBZnkCtvJycHvD69sNgKku7OWWFTN
         ldfg==
X-Gm-Message-State: AOJu0YxSElY0hLK2lsTA/I37nCsQJxDvZOb39Y7gOaiH2XQaP0zpVu4X
	NToLgxveuNNxjUN0/HHuT9sCcg==
X-Google-Smtp-Source: AGHT+IG5rQe7eHTbsiG9BBkU74Ab9cjoZ16k/kYt81tTsIL3X0SoNVHV490IiA+EwTuZ5oy977IXqQ==
X-Received: by 2002:a05:600c:1f90:b0:40b:578d:2472 with SMTP id je16-20020a05600c1f9000b0040b578d2472mr1295517wmb.1.1701340067139;
        Thu, 30 Nov 2023 02:27:47 -0800 (PST)
Message-ID: <01b35101-a807-49d1-a962-9ba3cb251c28@citrix.com>
Date: Thu, 30 Nov 2023 10:27:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/DMI: adjustments to comply with Misra C:2012 Rule 9.3
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4876b0a8-b96b-4f60-8040-a346b2655645@suse.com>
 <f89cc7c0bff5b403380f27cf4cd510b5@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f89cc7c0bff5b403380f27cf4cd510b5@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/11/2023 9:47 am, Nicola Vetrini wrote:
> On 2023-11-30 08:55, Jan Beulich wrote:
>> The rule demands that all array elements be initialized (or dedicated
>> initializers be used). Introduce a small set of macros to allow doing so
>> without unduly affecting use sites (in particular in terms of how many
>> elements .matches[] actually has; right now there's no use of
>> DMI_MATCH4(), so we could even consider reducing the array size to 3).
>>
>> Note that DMI_MATCH() needs adjustment because of the comma included in
>> its expansion, which - due to being unparenthesized - would otherwise
>> cause macro arguments in the "further replacement" step to be wrong.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course a question is how many of these DMI table entries are in fact
>> no longer applicable (e.g. because of naming 32-bit-only systems).
>> Subsequently the table in dmi_scan.c itself may want cleaning up as
>> well, yet I guess the question of stale entries is even more relevant
>> there.
>>
>> An alternative to using the compound literal approach might be to go
>> along the lines of
>>
>> #define DMI_MATCH4(m1, m2, m3, m4) .matches = { [0] = m1, [1] = m2,
>> [2] = m3, [3] = m4 }
>>
>> I've chosen the other approach mainly because of being slightly shorter.
>>
>
> This looks good. Upon applying this patch I noticed that there's no
> diffstat, and it doesn't
> apply cleanly with git-am.
>

So I've had this git alias for more than a decade.

$ git help jan-am
'jan-am' is aliased to '!bash -c '(echo -en "From: Jan Beulich
<JBeulich@suse.com>\nSubject: " && cat "$1") | git am' -'


However, what you actually want to use these days is
https://b4.docs.kernel.org/en/latest/ which integrates with
https://lore.kernel.org/xen-devel/ and also does administrative things
like collecting acked-by/reviewed-by tags.

~Andrew

