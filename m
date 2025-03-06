Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E543EA54B9E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 14:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903476.1311358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqAzQ-0005rk-4s; Thu, 06 Mar 2025 13:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903476.1311358; Thu, 06 Mar 2025 13:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqAzQ-0005qI-1x; Thu, 06 Mar 2025 13:10:16 +0000
Received: by outflank-mailman (input) for mailman id 903476;
 Thu, 06 Mar 2025 13:10:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqAzO-0005qC-98
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 13:10:14 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d54aca2-fa8c-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 14:09:57 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3910e101d0fso376178f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 05:09:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c102d76sm1975028f8f.86.2025.03.06.05.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 05:09:56 -0800 (PST)
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
X-Inumbo-ID: 4d54aca2-fa8c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741266597; x=1741871397; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TmGPElO1A9Qp7dp4TGJ/6Rt2SYwU7AJaXcCIBnHZHYs=;
        b=Gyl7lXxj6M5BJaBq6wDKGnCE9xUiogwmnRYn2n6MrkO2FNeUrgtrS94CXuhLPupxOL
         VsfbkOfDh83hP5z36E3EftMP0WNmqvqFV6Lb7iPjI69ljYA3nNZllNvUqWDneqMZ1MxU
         k5jUVs7OKnWZcd3Pq3u+6UMpIm82WAjJ6QshaYdc/IDfnRpq1hXDNdxREBXps0qHcagJ
         qbq52UZPbFuYl4z2gXdoEoTjq4OXT5jetjBGht+Nrl/Vah1ZO3vN7NbxlGYvr7GuqCB2
         mjf5YLHwZaHd8YPxnolkGhYiNzAx+5VDy1Kw7vRtfIIJ9Lmjz+JtctXSnztu+BtF56SM
         2FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741266597; x=1741871397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmGPElO1A9Qp7dp4TGJ/6Rt2SYwU7AJaXcCIBnHZHYs=;
        b=jrjdUFi5gMW7XyjUVfRLT0QoWqDxI0JNZqtxmZ8Rq7vRx9rAKEt3UCK+H3rGE9KpX8
         Bc4m8TXdye0UuSD5LY7Rt6vQGSwCoXMiQJovlp4FHG0RcfV9SIWq4IlmO9XayBzCuNPv
         wD0NOuPZkRfC8FrsUFnt1NlTXR/WUihvcrpy3iq0p7sYcSRBQlHevY+eEjPu6A4/ncHe
         3gHjz3f+HGm1rPkEWE6v4yb+KM790FMR8c3KKnwvQus1jN2BTPZetAk9i7AiQ/JGOejF
         T2IK6lYsdICN28Q+ius3S2Eub2dme1d3hYZvKbKacH2BtkmYISuKdQfBvdMfNJtYztBs
         rpdw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ZTbHnsZjsD+KvMjA/imvaSIbcP2Q/Ic0BPT7EYPMuq54qswdEwRO2ShNbOdYhjWu8lyHf6uejk8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxs1IIRgPBIvbSA/4+6J1cLS+JoMwcwbdBaigo4a5H1iKac8R3a
	9t80s54kYxbL6wqEsYwNhjhBu33lMJQIQn7ryHvajowW9CriZAWlGwZOU0n6uQ==
X-Gm-Gg: ASbGncvax0Py8aiwGvt9AI+uU4R7qcUIkKuV9yM1mVUgo/UtQYw5Np+CLaxqM9trD7+
	YiPjk6vwtMaoMdN+1wQ5x5tbIzdf7Ejn7jIK2/k0bimbw1PSJArL7BNTZKtsJSrKfyYM0yjurH8
	7yt0kuSmHKx1VJzv8KqdzF7rgIbrrsaU4fuLiizzMQdSLfHTPjbEmq+RzZwPepPsmrxmy8gavNr
	mYpV7t0HePGtXpO2Mv4Kn4K1EpMoSpKr2QR20n6L/xFvNmQhjrs+c/aeNbGIq/WssdOkCNHJTGp
	Oy/LIQss2+T5lS/5XHwP7790O+q0OKR9NaHY78sRt5shOmUVmvef31uV5mSpPnH2iftq57YB6gd
	8NQ+O1VBvfJXwXMzU5XBOBu0uSk63ZQ==
X-Google-Smtp-Source: AGHT+IFpk+GS6ZKG52j0ML4CWnFLjS0eCgbg/tC0Ck1kJpzdAQo6Tv+4hVlfAggKSKt91g65Or3vMA==
X-Received: by 2002:a5d:6c64:0:b0:391:300f:7485 with SMTP id ffacd0b85a97d-391300f7764mr513080f8f.8.1741266596640;
        Thu, 06 Mar 2025 05:09:56 -0800 (PST)
Message-ID: <b96c2600-735a-4767-9ed6-5cbb89e103af@suse.com>
Date: Thu, 6 Mar 2025 14:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: specify numerical values of Xenstore commands
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306122426.4351-1-jgross@suse.com>
 <70436c18-a916-46d9-befd-56e1780d92a4@suse.com>
 <9f096156-05c6-4b05-8b67-5370b4079d02@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <9f096156-05c6-4b05-8b67-5370b4079d02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2025 13:56, Jürgen Groß wrote:
> On 06.03.25 13:32, Jan Beulich wrote:
>> On 06.03.2025 13:23, Juergen Gross wrote:
>>> --- a/docs/misc/xenstore.txt
>>> +++ b/docs/misc/xenstore.txt
>>> @@ -86,6 +86,65 @@ parts of xenstore inaccessible to some clients.  In any case passing
>>>   bulk data through xenstore is not recommended as the performance
>>>   properties are poor.
>>>   
>>> +---------- Defined Xenstore message types ----------
>>> +
>>> +Below is a table with all defined Xenstore message types (type name
>>> +and its associated numerical value).
>>> +
>>> +Some types are optional to be supported by a specific Xenstore
>>> +implementation.  If an optional type is not supported by a Xenstore
>>> +implementation, Xen tools will continue to work, maybe with slightly
>>> +reduced functionality.  A mandatory type not being supported will
>>> +result in severely reduced functionality, like inability to create
>>> +domains.  In case a type is optional, this is stated in the table with
>>> +the lost functionality in case Xenstore doesn't support that type.
>>> +
>>> +XS_CONTROL		0	optional
>>> +	If not supported, xenstore-control command will not work.
>>> +	XS_DEBUG is a deprecated alias of XS_CONTROL.
>>> +XS_DIRECTORY		1
>>> +XS_READ			2
>>> +XS_GET_PERMS		3
>>> +XS_WATCH		4
>>> +XS_UNWATCH		5
>>> +XS_TRANSACTION_START	6
>>> +XS_TRANSACTION_END	7
>>> +XS_INTRODUCE		8
>>> +XS_RELEASE		9
>>> +XS_GET_DOMAIN_PATH	10
>>> +XS_WRITE		11
>>> +XS_MKDIR		12
>>> +XS_RM			13
>>> +XS_SET_PERMS		14
>>> +XS_WATCH_EVENT		15
>>> +	Not valid in client sent messages.
>>> +	Only valid in Xenstore replies.
>>> +XS_ERROR		16
>>> +	Not valid in client sent messages.
>>> +	Only valid in Xenstore replies.
>>> +XS_IS_DOMAIN_INTRODUCED	17
>>> +XS_RESUME		18
>>> +XS_SET_TARGET		19
>>> +XS_RESTRICT		20	no longer supported
>>> +	XS_RESTRICT has been removed, the type value 20 is invalid.
>>> +XS_RESET_WATCHES	21
>>> +XS_DIRECTORY_PART	22	optional
>>> +	If not supported, the output of xenstore-ls might be incomplete
>>> +	with moŕe than ca. 1000 domains active.
>>
>> Nit: Odd 'ŕ' here.
> 
> Thanks for spotting.
> 
>> Also the 1000 domains boundary is just an example aiui, so you may want
>> to add "e.g.".
> 
> The boundary is related to the amount of data returned by XS_DIRECTORY
> for "/local/domain". As soon as the sum of (strlen(domid_string) + 1)
> of all domains is larger than 4080 (XENSTORE_PAYLOAD_MAX - sizeof(struct
> xsd_sockmsg)), XS_DIRECTORY won't be able to return the list of children
> for "/local/domain". The limit will depend on the domid distribution:
> in the worst case it can be 640 (all domids 5 digits), in the best case
> it will be 1038 (all domids below 1000 present, the rest below 10000).

And elsewhere there can't be very many nodes resulting in a similar
situation?

>> I'm further uncertain here regarding your use of hard tabs.
> 
> I'm following the style of the rest of the document, which is making use
> of hard tabs as well. I can switch to spaces if you want.

I'm not demanding a change. I'd like it to be considered though that people
may in principle be using different tab-to-nr-of-blanks mappings, which
causes tabular arrangements like the above one to come out distorted.

Jan

