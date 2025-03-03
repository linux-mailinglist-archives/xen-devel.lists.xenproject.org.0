Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BC8A4C837
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 17:52:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900508.1308388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp91U-00044X-7V; Mon, 03 Mar 2025 16:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900508.1308388; Mon, 03 Mar 2025 16:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp91U-00042Q-48; Mon, 03 Mar 2025 16:52:08 +0000
Received: by outflank-mailman (input) for mailman id 900508;
 Mon, 03 Mar 2025 16:52:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tp91S-00042H-Pi
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 16:52:06 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5ba38ed-f84f-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 17:52:04 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-390eebcc371so1705072f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 08:52:04 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e485ddedsm14739260f8f.89.2025.03.03.08.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 08:52:03 -0800 (PST)
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
X-Inumbo-ID: d5ba38ed-f84f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741020724; x=1741625524; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NFRKAUFNXywTBedhA1hgZsbJTtTluG3F2YU10PXHwho=;
        b=aDnRtGrE3ghDYlJmZ1JrlZV8k6nPWJZu+lFgXJqBa2nULgWSYgdK35jl30ZKKmlejd
         GEhBiQBJ/Lq1mM5QA6gvpN1s3w9HGqTz+B3srZAA8SNDEgErwePOGfuS4LeTjE8Hw4BU
         oounSJuC3tMJNDflE1j82IILjnN/iCeneuTEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741020724; x=1741625524;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFRKAUFNXywTBedhA1hgZsbJTtTluG3F2YU10PXHwho=;
        b=nMzTS44pZjwDXrE1s9WV6GFWtKj+xpkX+5+edvvcWfOueF4AuE3YC1UpheZzXdr43n
         R4w19STzU4NkUugKUimP7zZX1ACBYUD3AHK2jtKU6FxyL9HUHz9CmTToBNOV8O8RZ8J+
         xVVIbum7so43s2a7n1KtLxWacjJWuVv9izqgSwPF57KHHq80bxezNziF7xadIO1PFM3m
         Fi7pAj27n/t940Do9AgIby0efXzUK3ejOHnx63/6hDkZfyC3Aq+EdwQuzurxIPDfSjCw
         EqKn+siet/DUOHptUBrUyU6JwLGE5EGcLDS/jxbUamNHbWzFT079+84Ts4HUQUsxTbhB
         MrCg==
X-Forwarded-Encrypted: i=1; AJvYcCWHL37R89ZRPsCyECQh9WXDi+82B4t8/xeAoq60eMnf4IFdgjat9ifFTDuvZ1zmvkDi70yt8Cz9Imc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc3aRXceJYlXGo3PwgQdVcSmBvo7vewMKg8BmnQB4pdPRVEbCS
	L6xbRPJuk8d7Fw1apjbHeAdAIdwud/HPfPbRgat03qd4DLT/NLV8lcuP7aTpFUM=
X-Gm-Gg: ASbGncvrCoucm8QqMAKmIU/zz7c6rmj71PTXZti1WdKXrbvWkUOYAUxVXX3YK7FKkxA
	ZyMlpJ7tNqNWLgPqjHbuz4RWKjzVwQIgq19BnzpT30JCj2v1ohcjmwjhswZthRCBoa8uCHL197S
	FJPsIMpD+Vv11yewLG0gq6w9EwLuGj6wy7oqb+ths03HRXPinTFZKtQeBjnEGLjBTw70Bgy3f89
	Fu3Xpr9y5EOI2MCDhUZQUrEn0Zv6OI8Jo0REQ5BRvebjyF9Wr6yAcxQhftPAnnJ3A08ekUQsR/k
	NNvTlNNi24QDJSYj3KPVhciL0SoIb6Vpliav/3qy6xxQ0aGmMeMOE98=
X-Google-Smtp-Source: AGHT+IHdBBUsjF1aesgQcI1oKTAo8yhSmzTQOD7RRLb/OPur5BqnCxZk8MTLNRSmBxxMpwJmvQviJQ==
X-Received: by 2002:a05:6000:1aca:b0:391:10f9:f3aa with SMTP id ffacd0b85a97d-39110f9f4ccmr2360758f8f.9.1741020723944;
        Mon, 03 Mar 2025 08:52:03 -0800 (PST)
Message-ID: <f62841d3-b0e4-4007-a056-a807a19fc988@citrix.com>
Date: Mon, 3 Mar 2025 16:52:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Don't cast away const-ness in vcpu_show_registers()
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225230213.1248136-1-andrew.cooper3@citrix.com>
 <7e77dceb-489b-4022-a665-2a008ddfe844@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7e77dceb-489b-4022-a665-2a008ddfe844@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 7:33 am, Jan Beulich wrote:
> On 26.02.2025 00:02, Andrew Cooper wrote:
>> The final hunk is `(struct vcpu *)v` in disguise, expressed using a runtime
>> pointer chase through memory and a technicality of the C type system to work
>> around the fact that get_hvm_registers() strictly requires a mutable pointer.
>>
>> For anyone interested, this is one reason why C cannot optimise any reads
>> across sequence points, even for a function purporting to take a const object.
>>
>> Anyway, have the function correctly state that it needs a mutable vcpu.  All
>> callers have a mutable vCPU to hand, and it removes the runtime pointer chase
>> in x86.
>>
>> Make one style adjustment in ARM while adjusting the parameter type.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> RISC-V and PPC don't have this helper yet, not even in stub form.
>>
>> I expect there will be one objection to this patch.  Since the last time we
>> fought over this, speculative vulnerabilities have demonstrated how dangerous
>> pointer chases are, and this is a violation of Misra Rule 11.8, even if it's
>> not reasonable for Eclair to be able to spot and reject it.
> On these grounds
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> irrespective of the fact that a function of this name and purpose really, really
> should be taking a pointer-to-const.

No - this is a perfect example of why most functions should *not* take
pointer-to-const for complex objects.

There is no such thing as an actually-const vcpu or domain; they are all
mutable.  The reason why x86 needs a strictly-mutable pointer is because
it needs to take a spinlock to negotiate for access to a hardware
resource to read some of the registers it needs.

This is where there is a semantic gap between "logically doesn't modify"
and what the C keyword means.

Anything except the-most-trivial trivial predates may reasonably need to
take a spinlock or some other safety primitive, even just to read
information.


Because this was gratuitously const in the first place, bad code was put
in place of making the prototype match reality.

This demonstrates a bigger failing in how code is reviewed and
maintained.  It is far too frequent that requests to const things don't
even compile.  It is also far too frequent that requests to const things
haven't read the full patch series to realise why not.  Both of these
are a source of friction during review.

But more than that, even if something could technically be const right
now, the request to do so forces churn into a future patch to de-const
it in order to make a clean change.  And for contributors who aren't
comfortable saying a firm no to a maintainer, this turns into a bad hack
instead.

i.e. requests to const accessors for complexity objects are making Xen
worse, not better, and we should stop doing it.

~Andrew

