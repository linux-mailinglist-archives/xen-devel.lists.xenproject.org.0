Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5950B8BE6E1
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 17:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718260.1120835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4MLp-0000tJ-OL; Tue, 07 May 2024 15:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718260.1120835; Tue, 07 May 2024 15:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4MLp-0000qU-Lh; Tue, 07 May 2024 15:03:29 +0000
Received: by outflank-mailman (input) for mailman id 718260;
 Tue, 07 May 2024 15:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9mcW=MK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s4MLn-0000qO-Vp
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 15:03:27 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3ff391d-0c82-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 17:03:25 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-79291262dc2so311286685a.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 08:03:25 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e17-20020a056214111100b006a0d0c6ed22sm4764978qvs.98.2024.05.07.08.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 08:03:24 -0700 (PDT)
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
X-Inumbo-ID: f3ff391d-0c82-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715094204; x=1715699004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=44FclAYB4asT1fRHDFchMJxjb3ZZ8KHEZCSsQpGlMRM=;
        b=YA9m2+LMy+YB091eCb7Qi2x6iz9Sd3B5jFHNcZBmTKG50Hw+Up4qAjIj06IE3+MKEf
         ZALuFO/dl4WI4aIYKVZ7ujX03gR4iMX2E0qrU+fP5rxXXq1x9KH08/H0Sp5xOBDJ1Jx2
         WspQ0QsO4XJl2ZQm/jWf4kMXuSADhruws47L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715094204; x=1715699004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44FclAYB4asT1fRHDFchMJxjb3ZZ8KHEZCSsQpGlMRM=;
        b=dXf8XoUzAR5ko9qR5+zbKkcyMejCuGAYDP6n+4nqHZv58d/q/M92eZaHFFY52K5HSN
         A03Yd0Ymo3d6rYRbXcNhbjKm7Rw38W8GCVbPur7tYkAmMZKr5q4twXy6bA4or3/vwW0C
         lwPw+LT7tAi/XojqCmiI6h3X4hbaMwAOpO3snDadLrfp6vE5pTThUK4sGsohI8Tclawe
         bddQ3nO93DncJpRDn2o/fynGBESA3uV/PvqF8s4agbC6XetSCbUW8SkV3fbag8fuBavF
         EXMqpZY381by85iROhGf44nTCca4g7aMzlWVcNIYDzfOLDfBsnmQXhM/1QhR5qhjrW6B
         8FbQ==
X-Gm-Message-State: AOJu0YwzamfcEqlnvDHqyDlwlaOdc2ATYGozmTktIWuppmpVtRCRy3yK
	uGriY0uyC/QsVQ2EX/dEBTxo/ps8878fr7BPDepjCEdM5wGcYViz9NnLveWO2IOpY7lnM60MMIZ
	Z
X-Google-Smtp-Source: AGHT+IGnDp0OO4TxUU5ic6SEpb+aJ+ukXOGAefHNY2KRBX7Hk5btmAcOF44NF3spaJqyafultRO1LA==
X-Received: by 2002:a05:6214:21eb:b0:69b:3c90:400f with SMTP id 6a1803df08f44-6a151569f0bmr437586d6.32.1715094204542;
        Tue, 07 May 2024 08:03:24 -0700 (PDT)
Message-ID: <57c14302-5e12-4101-bf52-1e88d7dd2532@citrix.com>
Date: Tue, 7 May 2024 16:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/cpu-policy: Fix migration from Ice Lake to Cascade
 Lake
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
References: <20240507112957.1701824-1-andrew.cooper3@citrix.com>
 <20240507134540.1714274-1-andrew.cooper3@citrix.com>
 <Zjo5iwmEvD3RWtsx@macbook> <f0272d79-7c59-42b2-b185-2aaf84f1b196@citrix.com>
 <Zjo-pWunEGru6Z_K@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zjo-pWunEGru6Z_K@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2024 3:45 pm, Roger Pau Monné wrote:
> On Tue, May 07, 2024 at 03:31:19PM +0100, Andrew Cooper wrote:
>> On 07/05/2024 3:24 pm, Roger Pau Monné wrote:
>>> On Tue, May 07, 2024 at 02:45:40PM +0100, Andrew Cooper wrote:
>>>> Ever since Xen 4.14, there has been a latent bug with migration.
>>>>
>>>> While some toolstacks can level the features properly, they don't shink
>>>> feat.max_subleaf when all features have been dropped.  This is because
>>>> we *still* have not completed the toolstack side work for full CPU Policy
>>>> objects.
>>>>
>>>> As a consequence, even when properly feature levelled, VMs can't migrate
>>>> "backwards" across hardware which reduces feat.max_subleaf.  One such example
>>>> is Ice Lake (max_subleaf=2 for INTEL_PSFD) to Cascade Lake (max_subleaf=0).
>>>>
>>>> Extend the max policies feat.max_subleaf to the hightest number Xen knows
>>>> about, but leave the default policies matching the host.  This will allow VMs
>>>> with a higher feat.max_subleaf than strictly necessary to migrate in.
>>>>
>>>> Eventually we'll manage to teach the toolstack how to avoid creating such VMs
>>>> in the first place, but there's still more work to do there.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>> Thanks.
>>
>>> Even if we have just found one glitch with PSFD and Ice Lake vs
>>> Cascade Lack, wouldn't it be safer to always extend the max policies
>>> max leafs and subleafs to match the known array sizes?
>> This is the final max leaf (containing feature information) to gain
>> custom handling, I think?
> Couldn't the same happen with extended leaves?  Some of the extended
> leaves contain features, and hence for policy leveling toolstack might
> decide to zero them, yet extd.max_leaf won't be adjusted.

Hmm.  Right now, extd max leaf is also the one with the bit that we
unconditionally advertise, and it's inherited all the way from the host
policy.

So yes, in principle, but anything that bumps this limit is going to
have other implications too, and I'd prefer not to second-guess them at
this point.

I hope we can get the toolstack side fixes before this becomes a real
problem...

~Andrew

