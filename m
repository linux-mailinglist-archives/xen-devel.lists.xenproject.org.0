Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3018C846C
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 12:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723988.1129167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7uRK-0000PA-TV; Fri, 17 May 2024 10:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723988.1129167; Fri, 17 May 2024 10:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7uRK-0000Lu-QY; Fri, 17 May 2024 10:03:50 +0000
Received: by outflank-mailman (input) for mailman id 723988;
 Fri, 17 May 2024 10:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g7K8=MU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s7uRJ-0000Lo-IL
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 10:03:49 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03a100f-1434-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 12:03:46 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a599c55055dso419039166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 03:03:46 -0700 (PDT)
Received: from ?IPV6:2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c?
 (p200300e5873ca5006aafb7a77c29ae5c.dip0.t-ipconnect.de.
 [2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17894dc3sm1099123766b.86.2024.05.17.03.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 03:03:46 -0700 (PDT)
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
X-Inumbo-ID: c03a100f-1434-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715940226; x=1716545026; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCNMD6qSYt+oq7gnC2MrSoLrVZzbr9VCri2gbO7qRY8=;
        b=SL3cGw88oNIn0FehSKVq9Yc2A3i8wJVixJD1asx5QzuEGP69fT0WJwcjq7HdyXqLc3
         fSNTE+AJWF0RiHRwAftwXfel4KnbFBW3AsF3qTbk/XzGmG+wvGcz1xK3eH50NPWi/snP
         b9+SXHxz9i0hTG8+Kp6QEHQ8MYy6grvVc+BXcEGMdWsUWVrspyDeGCIDxJmlTiA3rPpG
         K8zR3WPShFI5bwK6oHV4QVn8BH39jMPLgprBjloAVXvKKhUmAp8ptLGA+0LMxQ4Y87hZ
         L1BPBl3T2MB6QHydKYNlD0kOs/1ww8YgZyeOZwGZFHzQvNUeZzwOTv85UFVQ2VhZmu34
         e+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715940226; x=1716545026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCNMD6qSYt+oq7gnC2MrSoLrVZzbr9VCri2gbO7qRY8=;
        b=WATlWc9bUirVvYZvOvtHRApkq1EaR/GEKqTTDg0H2j2xVjCFCG3MAxxbo6trfJxrrj
         jnUNMftzDX3r4whhhH/jco6g5aKnbw+AtCzUi58P2hikSzWGohW9HwBxFaEVYL+Attbr
         CMTtNG9lYTLFWunDCvxSbCDaWqmvnzBj8+IQoQ+hO5O96QhRFswKoVWMIQfQgwT0vFHh
         Tp8RNHb1BfAHlHW8hm4V6G00nQtr+91Ei2fG5vBOxu4YF+QFybmdqX6kA4aXmvLxAo9o
         nnOnwCEUhemp5MdkFvBEVpoUuK8GnFBZWdHj4bqTwxYJN3UB1DFTMGcllmOqgMXbYWl1
         wJMA==
X-Forwarded-Encrypted: i=1; AJvYcCWBqlv066ej3JwdVhltxi+QI7TKrGS7ckpQvBjNV36bIA5yFNj6GJySOGTccV1OU6kUedw9UTRPM84EmHmr5of5Xc/MFpV0Pqm3DR8yUHw=
X-Gm-Message-State: AOJu0YwIHrsNdBHkhq5vjqmiXDQz9WK7tJehnDblaf8JXS4Aa6PfrSUi
	SmEcKAiZoQ4D3SgJ7l5T7nno1x7qVVt7ynO7Oq/ZSvmO3Rd2Fbkd6C7V9NDwMWA=
X-Google-Smtp-Source: AGHT+IFK3gjHgioDL2i0FIC4Wmg2sikK8o9RTszlH9Hh1fBVm4YaxyB+dUqhBorFN9L4fAn2a9GSlg==
X-Received: by 2002:a17:906:7004:b0:a59:bcfd:d950 with SMTP id a640c23a62f3a-a5a2d5cdbecmr1542300466b.46.1715940226416;
        Fri, 17 May 2024 03:03:46 -0700 (PDT)
Message-ID: <3ef32fec-53e7-403c-81d6-9f3e89966e2c@suse.com>
Date: Fri, 17 May 2024 12:03:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
To: Jan Beulich <jbeulich@suse.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-2-Jiqian.Chen@amd.com>
 <fb708441-b302-4727-8131-62435a54d99c@suse.com>
 <BL1PR12MB5849FCB53BDAB6968536E5A5E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cdcbb04d-72e8-4555-a67f-9fd28c5c7743@suse.com>
 <BL1PR12MB5849447757191C93B77D19E6E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0cc1e273-2c42-40ea-a02a-ef8702efc030@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <0cc1e273-2c42-40ea-a02a-ef8702efc030@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.05.24 11:50, Jan Beulich wrote:
> On 17.05.2024 11:28, Chen, Jiqian wrote:
>> On 2024/5/17 16:20, Jan Beulich wrote:
>>> On 17.05.2024 10:08, Chen, Jiqian wrote:
>>>> On 2024/5/16 21:08, Jan Beulich wrote:
>>>>> On 16.05.2024 11:52, Jiqian Chen wrote:
>>>>>>   struct physdev_pci_device {
>>>>>>       /* IN */
>>>>>>       uint16_t seg;
>>>>>
>>>>> Is re-using this struct for this new sub-op sufficient? IOW are all
>>>>> possible resets equal, and hence it doesn't need specifying what kind of
>>>>> reset was done? For example, other than FLR most reset variants reset all
>>>>> functions in one go aiui. Imo that would better require only a single
>>>>> hypercall, just to avoid possible confusion. It also reads as if FLR would
>>>>> not reset as many registers as other reset variants would.
>>>> If I understood correctly that you mean in this hypercall it needs to support resetting both one function and all functions of a slot(dev)?
>>>> But it can be done for caller to use a cycle to call this reset hypercall for each slot function.
>>>
>>> It could, yes, but since (aiui) there needs to be an indication of the
>>> kind of reset anyway, we can as well avoid relying on the caller doing
>>> so (and at the same time simplify what the caller needs to do).
>> Since the corresponding kernel patch has been merged into linux_next branch
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20240515&id=b272722511d5e8ae580f01830687b8a6b2717f01,
>> if it's not very mandatory and necessary, just let the caller handle it temporarily.
> 
> As also mentioned for the other patch having a corresponding kernel one:
> The kernel patch would imo better not be merged until the new sub-op is
> actually finalized.

Oh, sorry to have overlooked that the interfcae change isn't yet committed on
Xen side.

I'll drop the patch from my linux-next branch.


Juergen


