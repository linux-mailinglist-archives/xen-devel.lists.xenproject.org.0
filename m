Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462E39878C8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 20:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805840.1217080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stslq-0005rp-Sz; Thu, 26 Sep 2024 17:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805840.1217080; Thu, 26 Sep 2024 17:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stslq-0005qK-Os; Thu, 26 Sep 2024 17:59:18 +0000
Received: by outflank-mailman (input) for mailman id 805840;
 Thu, 26 Sep 2024 17:59:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rvAu=QY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stslp-0005oh-3c
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 17:59:17 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b3687f0-7c31-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 19:59:15 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8a7cdfdd80so164431966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 10:59:16 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2978a71sm22481966b.161.2024.09.26.10.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 10:59:12 -0700 (PDT)
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
X-Inumbo-ID: 0b3687f0-7c31-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727373555; x=1727978355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WEYYk2T+LMg92QDv1AQAUTwEId4Ac1XliuuLLkWLCHg=;
        b=hmbOE4beWyWq38D6/eDWT5cr8mNGvZ1uMahEdWx8RDnmF/UA8PK3fiq1iDVdQMTmo6
         8UfO6TFFZNuTgb5Xkw0kpX6DqonOsbKlcOVL+cg98fXXzE7dNtKNqxvXSH+1OXQhDL6i
         JyPb8lTC8nUUX0ZJ8cA328P4zBksDmHXjaqcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727373555; x=1727978355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEYYk2T+LMg92QDv1AQAUTwEId4Ac1XliuuLLkWLCHg=;
        b=LhrOynQue0Y/JdKNGq0uYAfVABILl+CywPoLmvlbfOUFslRSdVD3Cr6x+p6UCYOqr2
         rtrG8kYJKNFzfiTvdnnAxeUSDLGXJyR/a0o8I6WQIgOdodLgqyZYX3gytkltVNdCYMnN
         Vp2tEPY1lQBq1ZD/xDlvi/NTWkNLLU3h4M+1b3FU9qfHYXcZg1mwYma64AzfofTc533A
         Cq4YWXSV3x+4kgQFY2BphvvPWi+z//qS3k+FTe30KJK5n+06P03aQvpjXnY8x89ZxaF3
         dx9XO54cEUmJscHMUJECGvC7Cz5PW/o+rZdyGtn7X7z/JEatl6YKdqDXTuJIc6A9Uo6K
         Qweg==
X-Forwarded-Encrypted: i=1; AJvYcCXWg9CbgMZGeaRE7ZbCWhn1CBkmtk9eAPbxQFU/GvYWanx0e7n/2BjxB7X6jhMxTXT5CIM3jwoWIdo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIGDxYx0dSuoZ5KqnmxVJBnH5pXtkSIpP90M+HSpbzVduCdzd9
	1Qa47OXiGFx8s8fT2QwuJTmOQow7oShUPp2s8weqOHAAZGJTPd2ttgbNURq3ddg=
X-Google-Smtp-Source: AGHT+IGtGlvLM/CAwuUw/UeKDzWeU0ioy8BUoaKM2A0ibMPx+wYNbYUiynQYhvqmSD3YBSVi1BNL8A==
X-Received: by 2002:a17:907:3d92:b0:a86:94e2:2a47 with SMTP id a640c23a62f3a-a93c49101a1mr31946966b.15.1727373555329;
        Thu, 26 Sep 2024 10:59:15 -0700 (PDT)
Message-ID: <f48f6302-354d-4214-978d-4785a3ad6d64@citrix.com>
Date: Thu, 26 Sep 2024 18:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PV: simplify (and thus correct) guest accessor
 functions
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3c1a7eee-7909-4b18-9497-1d0a6ee4f17d@suse.com>
 <8b737e1c-f229-4355-bc4c-1f147acc3920@citrix.com>
 <b555d845-9746-484a-b945-4a69fa5beac2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b555d845-9746-484a-b945-4a69fa5beac2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2024 4:09 pm, Jan Beulich wrote:
> On 02.09.2024 16:13, Andrew Cooper wrote:
>> On 02/09/2024 1:28 pm, Jan Beulich wrote:
>>> Taking a fault on a non-byte-granular insn means that the "number of
>>> bytes not handled" return value would need extra care in calculating, if
>>> we want callers to be able to derive e.g. exception context (to be
>>> injected to the guest) - CR2 for #PF in particular - from the value. To
>>> simplify things rather than complicating them, reduce inline assembly to
>>> just byte-granular string insns. On recent CPUs that's also supposed to
>>> be more efficient anyway.
>>>
>>> For singular element accessors, however, alignment checks are added,
>>> hence slightly complicating the code. Misaligned (user) buffer accesses
>>> will now be forwarded to copy_{from,to}_guest_ll().
>>>
>>> Naturally copy_{from,to}_unsafe_ll() accessors end up being adjusted the
>>> same way, as they're produced by mere re-processing of the same code.
>>> Otoh copy_{from,to}_unsafe() aren't similarly adjusted, but have their
>>> comments made match reality; down the road we may want to change their
>>> return types, e.g. to bool.
>>>
>>> Fixes: 76974398a63c ("Added user-memory accessing functionality for x86_64")
>>> Fixes: 7b8c36701d26 ("Introduce clear_user and clear_guest")
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> This is definitely simpler, however the code gen less so.
>>
>> add/remove: 0/0 grow/shrink: 42/9 up/down: 2759/-178 (2581)
> Not nice, but entirely expected.

Yes.  Having considered this for a while, the usual rule prevails; get
it correct first, fast second.

So, lets go with it like this.

I already want to get rid of .fixup for backtrace reasons, so don't want
to go expanding our use of it.

I'm also not thrilled with the idea of doing a second access.  At the
time any fault has occurred, we're delivering an error of some form, and
finding unexpected success the second time around is about the worst
available outcome.

As to your comment about to-guest, that does matter for correct %cr2 on
an emulated store.  The INS emulation tries precisely this.

I've got some ad-hoc XTF tests which I'll run this patch over, but I'm
expecting to R-by/T-by in this form.

~Andrew

