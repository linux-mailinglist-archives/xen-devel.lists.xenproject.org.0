Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AF6A67CEE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 20:17:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919809.1324169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tucR5-0003NS-Pa; Tue, 18 Mar 2025 19:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919809.1324169; Tue, 18 Mar 2025 19:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tucR5-0003Lj-Le; Tue, 18 Mar 2025 19:17:11 +0000
Received: by outflank-mailman (input) for mailman id 919809;
 Tue, 18 Mar 2025 19:17:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tucR3-0003Ld-Q6
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 19:17:09 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 952fee75-042d-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 20:17:07 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso39675605e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 12:17:07 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3978ef9a23bsm14672088f8f.15.2025.03.18.12.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 12:17:06 -0700 (PDT)
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
X-Inumbo-ID: 952fee75-042d-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742325427; x=1742930227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S0c/7n/H61TTzgIlncaD6HT/y21YR1OXdIve57iZ7a0=;
        b=JchdUb1xtO6M+BJFKGHJ840Aa7ey8EtlectHBVS1BN8rMtUnPe/OsCikA6zOyJODjB
         kZ4gxGA3wvxLJifDmdtnxXpZNnNla7+9gLxrCRHgZzSJnn3sxHCdQHJC8Lv29qnkXk4B
         av/iRBEb+Zdk3/x5QhQswZe4oD8JdP820MRDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742325427; x=1742930227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0c/7n/H61TTzgIlncaD6HT/y21YR1OXdIve57iZ7a0=;
        b=CqhE+HIpoJly8qC71j8H2diCPs5dCp0Qeo626dn66486022x11gb1Nx5B+DlRFHJCH
         VqWTj5Ew3ZErN8yxteJn+jGFhMl/+8kQMd60tz87GXJFuVXXNZ+tfM7vC3XZxo8MAdGL
         bsmrQgMJhKSjNPkxyqktvlXAuXJwTE9rLQ7iEzBlYwQBt3wYBclsEnlOxUbBVXSrPQ8y
         F46uYh45fG45oYN+SFD9eDQtxZvsb/OqDvgdCanjYwn2Qa5LItVjxHgb7s4M67n+T35I
         QIPR6i2iPgJQxrNlHX0sMWX8TExBxhsDDNlDs61Z1hQBBsONQKr9VUPLm4UQWqo2QXRd
         dAUQ==
X-Gm-Message-State: AOJu0Yz2hHn5FA8fEwr5lA865Np3feRNyyNwM6u5+oiPEQljlQtKB1YG
	rcUrUBS+txUqQfaBT0r883k3CLPW3SGnb9y6xCYWVx31D+spIz7sfZ0v7VgjGS0=
X-Gm-Gg: ASbGncue3mGBto3+7S1qyM/KkjdOXK2EdpS0cotnffXXded7UPpmcB0brhuhOd8IFXc
	B0e5regKx9exZp9jnNjonzZg54BaTK94Jv0KUZvvvyM/lofsUqlPc5+Lz/t7Mq6rues3ckpWcPr
	uQSUhgnzZb43DwGv3oFClAjOQmrOVcfj6qMTF7x3fVUlU+zvPgoyfxLX68p0GFQDHlmNB0pSAs8
	cUAXDRiIghaKPvTA1wDte14sxDzLQQfm9cA4lP0wLo0iZ8y/CeMib0HK9E3kYoxk6GKIqTEvP73
	JkuH1GwzpgZYvsQDEKHtDh3lN+mzqisS/Cu4CfXlOLcJk8e5VxtIQOWYCq/qvL6qBRvK5xo9cLp
	CcoMWhLolDCzcdfvuWdQ=
X-Google-Smtp-Source: AGHT+IFyXRHo1Y9Rvk5y1LcDGl1Wvf13E/R6ETL4ojQ6vmVoh+otNxgK4opUpPEyyyL2FBYjw0LEVw==
X-Received: by 2002:a05:600c:4506:b0:43b:cbe2:ec03 with SMTP id 5b1f17b1804b1-43d3b9f711fmr25851875e9.27.1742325426531;
        Tue, 18 Mar 2025 12:17:06 -0700 (PDT)
Message-ID: <6a827f94-2c9f-4441-b98c-ed7349b39865@citrix.com>
Date: Tue, 18 Mar 2025 19:17:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] x86/boot: apply trampoline relocations at destination
 position
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-5-roger.pau@citrix.com>
 <CACHz=Zhyn54-w=dysFXwwzhdnL4RVnadKoT+hx7hR42_VrY2oA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=Zhyn54-w=dysFXwwzhdnL4RVnadKoT+hx7hR42_VrY2oA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 7:05 pm, Frediano Ziglio wrote:
> On Tue, Mar 18, 2025 at 5:36 PM Roger Pau Monne <roger.pau@citrix.com> wrote:
>> Change the order relocations are applied.  Currently the trampoline is
>> patched for relocations before being copied to the low 1MB region.  Change
>> the order and instead copy the trampoline first to the low 1MB region and
>> then apply the relocations.
>>
>> This will allow making .init.text section read-only (so read and execute
>> permissions only), which is relevant when Xen is built as a PE image.
>>
> This change is not enough to make the section read-only, some other
> code writes directly into the trampoline at the not-relocated
> position.
> But this improves the situation.
> The code looks fine, I'll try the code if it passes some tests I did.

Which other writes are there?

Strictly speaking it only matters for writes while we're still on the
EFI BS pagetables, because they're the only ones which enforce R/O on .init.

The moment we drop into 32bit (the MB2+EFI path) or get into __start_xen
(all paths), writes into either trampoline should work.

There are definitely bits of logic which depend on the trampoline being
placed, and ideally wouldn't, but they're quite easy to find now with
bootsym().

There's also definitely bits of logic which have temporaries in the
trampoline which shouldn't be there, and now that some of the
Hyperlaunch prep work is in place, can be moved out relatively easily.

~Andrew

