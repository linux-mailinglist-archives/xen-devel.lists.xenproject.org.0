Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C3D8B76F5
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 15:26:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714889.1116258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1nU8-0001qK-OM; Tue, 30 Apr 2024 13:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714889.1116258; Tue, 30 Apr 2024 13:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1nU8-0001nl-Ky; Tue, 30 Apr 2024 13:25:28 +0000
Received: by outflank-mailman (input) for mailman id 714889;
 Tue, 30 Apr 2024 13:25:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OUm+=MD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1nU6-0001ln-Sf
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 13:25:26 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19fffae8-06f5-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 15:25:25 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-78f056f928eso433255885a.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 06:25:25 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h6-20020a05620a13e600b0078f044ff474sm11441994qkl.35.2024.04.30.06.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 06:25:23 -0700 (PDT)
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
X-Inumbo-ID: 19fffae8-06f5-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714483524; x=1715088324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2txO9Y/0e3sW6NwewuDY9zMut4fPbN5/4hbdzVvdi+s=;
        b=XkveZeSfIm0I9kYBQ8dbCwsrRyahkW9D349NWLlVBtAr8hnznnC0v/IvdXFqOcEMVG
         QGjjxRHSQnh9h7SJEImvry1cWVoABw0mnpbUuu1nTSAh6D7foKGeX7jidaD1Gv4/kq6Y
         9WW7k+HsSqL5LhqGxqHfm67l0eNNLiHW4PlwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714483524; x=1715088324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2txO9Y/0e3sW6NwewuDY9zMut4fPbN5/4hbdzVvdi+s=;
        b=uDTgoQ82uNWVkypfjyi2sWvZqTfwuwLu5FkxkMEH+BEsZbSJA5SGDgv+dfiw3S4eoK
         ENh+eaQZTnXHu7z0UV1qDu29RMEZs/dKKiqPPMEZVdSwaND6oxxPHHs9pF2HjnAAduZ7
         ITFmzx8UHJXbvY40v7zxCpypnMRf8/+y5cxr5AvgdVXnkjsloqEoQD8hePFkZxjUUOY9
         NvXf3r1xppspjB+UUxBUl964BMZ93RklLZVEonUS140H5t/CxB8XnVL9AN++PrugrfTL
         yVyQ+mMyhF77q1tTjTCL63l8EVioqprF8/fAJy/Yw4icbEMtB+buKe5AJVzWYsJiViDr
         +ZcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvZ2Ljv1PtbFwZrT5IH8B6JvC2aedlD/U2uujvB+Uqda3gGf29EwMgvADKgpnwlQTIWTj8VOeWL/wImpFqKQypoV2T19qpigodo+Vag6w=
X-Gm-Message-State: AOJu0YwhS0bp0jla2yrDnJIo8VZXcZLs7Y5YT0WQma60gujyA+6G9VNV
	0vqWCuXjqsvtWRUX1hPuiHuT5ZEMt/H438QRfWVJAMkHaVE7V00UrA33EM1pCw4=
X-Google-Smtp-Source: AGHT+IGzNp4rav48XLXa/ONoVkuOOQlBoVzaJGOeVQ03C4baPjYYYGkHXU/KDaXsKBk7gvwlasNaTg==
X-Received: by 2002:a37:e102:0:b0:790:690c:ff5c with SMTP id c2-20020a37e102000000b00790690cff5cmr12398008qkm.58.1714483523919;
        Tue, 30 Apr 2024 06:25:23 -0700 (PDT)
Message-ID: <1749cd23-ba17-450d-b5e0-29fc9ce9489e@citrix.com>
Date: Tue, 30 Apr 2024 14:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/cpu-policy: Infrastructure for the AMD SVM and
 SEV leaves
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrei Semenov <andrei.semenov@vates.fr>,
 Vaishali Thakkar <vaishali.thakkar@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
 <20240429151625.977884-2-andrew.cooper3@citrix.com>
 <766b178a-5e32-437f-ac02-4cb9ad8cb248@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <766b178a-5e32-437f-ac02-4cb9ad8cb248@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/04/2024 1:45 pm, Jan Beulich wrote:
> On 29.04.2024 17:16, Andrew Cooper wrote:
>> Allocate two new feature leaves, and extend cpu_policy with the non-feature
>> fields too.
>>
>> The CPUID dependency between the SVM bit on the whole SVM leaf is
>> intentionally deferred, to avoid transiently breaking nested virt.
> In reply to this I meant to ask that you at least add those dependencies in
> commented-out form, such that from looking at gen-cpuid.py it becomes clear
> they're intentionally omitted. But you don't add feature identifiers either,
> making dependencies impossible to express. Maybe this sentence was really
> meant for another of the patches? (Then my request would actually apply
> there.)

This is necessary because c/s 4f8b0e94d7ca is buggy.  Notice how it puts
an edit to the policy object in the middle of a block of logic editing
the featureset, which ends with writing the featureset back over the
policy object.

And it's not the first outstanding problem from what is a very small
number of nested-virt patches so far...

>> @@ -296,7 +298,16 @@ struct cpu_policy
>>              uint32_t /* d */:32;
>>  
>>              uint64_t :64, :64; /* Leaf 0x80000009. */
>> -            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
>> +
>> +            /* Leaf 0x8000000a - SVM rev and features. */
>> +            uint8_t svm_rev, :8, :8, :8;
>> +            uint32_t /* b */ :32;
>> +            uint32_t nr_asids;
> According to the doc I'm looking at it is %ebx which holds the number of
> ASIDs and %ecx is reserved. With that adjusted

That's fun...  The PPR I used for this has it wrong.  A sample of others
match the APM, so  I'll raise a bug with AMD against this PPR.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

