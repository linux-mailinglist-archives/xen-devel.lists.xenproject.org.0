Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A136B975342
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 15:08:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796637.1206378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soN4U-0005c8-B2; Wed, 11 Sep 2024 13:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796637.1206378; Wed, 11 Sep 2024 13:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soN4U-0005aX-7F; Wed, 11 Sep 2024 13:07:46 +0000
Received: by outflank-mailman (input) for mailman id 796637;
 Wed, 11 Sep 2024 13:07:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RHL=QJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1soN4S-0005ZH-WB
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 13:07:45 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2fa5b13-703e-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 15:07:40 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so609592566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 06:07:40 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d7360f398sm250803266b.5.2024.09.11.06.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 06:07:39 -0700 (PDT)
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
X-Inumbo-ID: d2fa5b13-703e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726060060; x=1726664860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rB/RzgqRotSsCyKNGWHl1ko6jRy9gSvw+WW1tSZgypA=;
        b=UmDbi34wYfW+EzRWQDcYZiOy1/26V9aENQe4/LniYDaglKf6hBpnfcKeSF4oi8legy
         zUp0mlPBHJHCver4dI0bT1kIpLKFsOvlj5z/LUIE+yMfmA4XQMM5C6ryKTmHqZE2jXtF
         r4E1Nm5A2JjJqDTe4gEF5QqauBxXonWFPWxLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726060060; x=1726664860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rB/RzgqRotSsCyKNGWHl1ko6jRy9gSvw+WW1tSZgypA=;
        b=jrLgWrW68mvShLzPfq3lFF1DJ6x2ushQcrKjEQ2S+KcoRFjR8k+2t4oYPdJ8NdlSaj
         sCDBa6eho+IFZewnVsTPCVfZNxf2JHlr6nt4isV0UBqlRLjoGfKVzPWK0/OEUC5aJ0Az
         5G+iy7gtLr7LkVLLhoqcwjSz3Qp1W2TSFDxe+VMvllJWIg9KxLkLF3Pf7SMmrhVHyJK0
         si9it5o32YLicPKtWhSvi7OZZL3nfgWhPKkwshwL7OaCnFy/O5DKOpZfTD3hZ2vOlOo5
         2JLUmQ2KiFbYUlNo8yJ6+1Wxzzy8E+OV7SJ4Sc5zCkowU2CyM3A+U5qLPKkNGfpDc16F
         C79w==
X-Forwarded-Encrypted: i=1; AJvYcCVmNimCEMUNQOzUl7y2Q3/xeuC1KJVby2DZJXY1sFwZdXy3814NdI5hrIU8nSwLYe6ri6VAVBcPMQ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXOKd3AbhIaCVkSRZCUgEkxCZIWaEfs7Yu0Wj6XH5/YJ6Qj69k
	lZvACqv/IC2lohoAGAYXyZ+ncV1aCz26TiNCDh6PQt0N7plFJ7OkediG8+kTdaM=
X-Google-Smtp-Source: AGHT+IFjAMD+jn/JJqNv+BysqaBnvRVcS48Qx466FMzymRxE1XrrqYQSAmSz7fgdb59dQ9h/fGVTag==
X-Received: by 2002:a17:907:96aa:b0:a8d:6921:e179 with SMTP id a640c23a62f3a-a8ffab84899mr396927466b.39.1726060059465;
        Wed, 11 Sep 2024 06:07:39 -0700 (PDT)
Message-ID: <db97215e-4e78-413c-b86d-aec8c87f8a86@citrix.com>
Date: Wed, 11 Sep 2024 14:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] x86/HVM: drop stdvga's "lock" struct member
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
 <716868cb-6a94-4470-a1a5-a4b5994e8195@suse.com>
 <dcc120ce-6634-465b-81ee-d652bd0935a7@citrix.com>
 <d7394132-e3ed-4804-8da0-6333a1dcf466@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d7394132-e3ed-4804-8da0-6333a1dcf466@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2024 1:58 pm, Jan Beulich wrote:
> On 11.09.2024 14:42, Andrew Cooper wrote:
>> On 11/09/2024 1:29 pm, Jan Beulich wrote:
>> However for performance, we also want to do the dir/ptr/count exclusions
>> before the address range exclusions, meaning that ...
>>
>>>  
>>> -    spin_lock(&s->lock);
>>> -
>>>      if ( p->dir != IOREQ_WRITE || p->data_is_ptr || p->count != 1 )
>>>      {
>>>          /*
>>>           * Only accept single direct writes, as that's the only thing we can
>>>           * accelerate using buffered ioreq handling.
>>>           */
>> ... it wants merging with this into a single expression.
> I'm not convinced, and hence would at least want to keep this separate.
> Which exact order checks want doing in would require more detailed
> analysis imo. Or do you have blindingly obvious reasons to believe that
> the re-ordering you suggest is always going to be an improvement?

I'm not overly fussed if this is delayed to a later patch.  My review
stands as long as the comment is gone.

But, right now, accept() is called linearly over all handlers (there's
not range based registration) so *every* IO comes through this logic path.

The likely path is the excluded path.  ioreq_mmio_{first,last}_byte()
are non-trivial logic because they account for DF, so being able to
exclude based on direction/size before the DF calculations is a definite
improvement.

~Andrew

