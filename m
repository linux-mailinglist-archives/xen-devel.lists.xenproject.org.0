Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40CFB56AF3
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 19:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123974.1466613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxqyJ-00016x-6f; Sun, 14 Sep 2025 17:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123974.1466613; Sun, 14 Sep 2025 17:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxqyJ-000141-3z; Sun, 14 Sep 2025 17:57:07 +0000
Received: by outflank-mailman (input) for mailman id 1123974;
 Sun, 14 Sep 2025 17:57:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uxqyH-00013v-Dq
 for xen-devel@lists.xenproject.org; Sun, 14 Sep 2025 17:57:05 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 374eb079-9194-11f0-9809-7dc792cee155;
 Sun, 14 Sep 2025 19:57:02 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3e7622483beso1700790f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 14 Sep 2025 10:57:02 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c36cc6adcsm107083635ad.7.2025.09.14.10.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Sep 2025 10:57:00 -0700 (PDT)
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
X-Inumbo-ID: 374eb079-9194-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757872621; x=1758477421; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMVbcPts/TfyGtp/9rEYYPMaMs38KHK+eMYy+Om5bqM=;
        b=Sx9FMb5UevUDFT1zspGr8uUFbDEkiM4C1TwztYyUmSd0fxpZ1/D+k8kkLkXivd23Kd
         70UPhj1vWNMA+QmWYY68wLnv4h+v245cF+AvtvK5mhteHnZ1VpX+6sGHxi+om+cQWU0i
         3z6kDx1hkFX7aNhvfNXnaNTs1U1aAYRPk3H8cmGezuxsRPZpEOAV44QU1V89Tq74trzc
         zri9IUrfLOCnB4Ip8KW2cSuDL8/HvqsT1xFGcDV3A44OWH+C+15eBVXY/Zq+aT3Z80vx
         s3A4nRxSxf5Yz9N5amv6IyAVIYJ2AeZjTiqOfoxtCLECNYdwJaBhDSih6dfcJuEyt/BP
         uRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757872621; x=1758477421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMVbcPts/TfyGtp/9rEYYPMaMs38KHK+eMYy+Om5bqM=;
        b=fk39mM6noQg3eCz3n4Ft7BKjHkFZNXem9tKR3nabYUfUP8VgX7lPnbKlcUdULBbV2h
         WisS4WQSfONuxKDIuXD+cwG/SSa9Viwqr4iWz/YEo+UdtdTiW6OlZtjdpRqAaxZDHZTt
         aRorQWtv6TIyl6gM5neA2aBbR9gjQSNwEb6WqX5Lsaz9Y5eJnuCawFnHBRP4EOXhG1Yd
         J32IigHugcJTi/bjqF1HG8nJwpeSr8/S2T6dMzor+e7pDCT5d4pLcoHAJDgk7N1c9eAX
         hDi/TkTBEYwDprzcuoi94O1VVetQKI3NmT4Uv+AzLXgdyEhfM3/qZby/VeKF0hhjSNkA
         yP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiVbAIWpzAoSZALtNevtcPqk9dMjbqxL6EQRhiZzATQ+0Go1IIlUkfAOz8NwIm0F6kZGRPdk4mMrI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRO9tyYk3ABxgUlmwHSUNYpenXdhDoPGfdvoSeNcGyqDj/c/mf
	xGSKrk3/caDIFLUQlXF6b1jNT9/sH0XTDE+6TjgvP/WuPWIxAR02ieQNq6AarWlB5g==
X-Gm-Gg: ASbGncuHkcwWTC7gX050k8lR2Ok1xov+N3tHNdKVPUYMa3O2OR3YaBdNtet0ayr2eXC
	W2D2p08Ykz6FfgcvroT7Qi9B1OWF8Lf/Rj0/OFHQH+nVmJpBuE3h8cPS1JrUhV/n8mE7lJSJgkx
	Hi7qRHeo8Oebv6XF4d7JlCmJAKT1ZDA7pgEHdfP4wn5CAa7q7J2KeCxanw0dsImqCItiIXFpLwQ
	JoAwTi0wqFuBmkKx3Ql0LOJ+6NLLkKsndKz2YqW83MCZ1b4NB32yKqOPQueGzAyiTJr00sa3ufG
	oBW/0ht+7X/+/SDaeUuCDQTTeQ2Emo0D+W9PeL0t1OtezBdbNs34XQIv4EHIMJroZlZg31KDfeM
	0Q2F9kHFxAiuX0IjNkyJmlMbZZ71BLUEWYjXWDLAIDTgiLku6lYGd
X-Google-Smtp-Source: AGHT+IFpt0/ASKXY6P2+J9kA4e7qsuFEorNDxY7nmROUYbSQYAxe/i3Q9WxeuSw3jKVoEtwmr747Qw==
X-Received: by 2002:a05:6000:2486:b0:3e7:404f:685 with SMTP id ffacd0b85a97d-3e765a197ebmr8875378f8f.44.1757872621190;
        Sun, 14 Sep 2025 10:57:01 -0700 (PDT)
Message-ID: <a01e2f6d-9bf4-4635-b1d1-9826494177bd@suse.com>
Date: Sun, 14 Sep 2025 19:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] releases: use newer compression methods for tarballs
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <a9b52101-c332-4791-8034-2d3043f82356@suse.com>
 <53d760ad-c58d-4d3f-bd66-598b4a95a8ff@xen.org>
 <b031118e-8949-4c8a-8894-f70b89ae2b5a@suse.com>
 <7c017dec-91e6-4637-842e-8210ae8022d7@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7c017dec-91e6-4637-842e-8210ae8022d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.09.2025 18:59, Oleksii Kurochko wrote:
> 
> On 9/14/25 3:43 PM, Jan Beulich wrote:
>> On 12.09.2025 23:23, Julien Grall wrote:
>>> On 11/09/2025 09:14, Jan Beulich wrote:
>>>> Other projects have long switched to xz and/or lzip.
>>>>
>>>> Tidy things some as well: With the removal of qemu from the tarball,
>>>> intermediately extracting the tarball again has become wasteful. Drop
>>>> that. Invoke compressors using asynchronous lists, to reduce overall
>>>> latency. Drop the -v option from the (previously implicit) gzip
>>>> invocation.
>>>>
>>>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>>> I have tested manually the steps and the correct tarballs have been
>>> produced. I will update my scripts to copy & sign all the tarballs once
>>> this is merged.
>>>
>>> Acked-by: Julien Grall<jgrall@amazon.com>
>>> Tested-by: Julien Grall<jgrall@amazon.com>
>> Thanks.
>>
>>> Is this intended for Xen 4.21?
> 
> IMO, it would be nice to have that in Xen 4.21.

May I translate this to a release-ack then?

>> So far it was, but I'm increasingly unsure, seeing that it still hasn't
>> gone in. Cc-ing Oleksii too now. Andrew had voiced concern towards the
>> rm use, but hasn't come back as to his argument towards the uncompressed
>> tarball previously not having been removed (when I can't see that one
>> would have been created in the first place), hence why I couldn't make
>> use of his (conditional) R-b.
> 
> There is not too much sense in the uncompressed tarball. I prefer to not
> generate it at all.

Generating is helpful, to do it only once (instead of once per compressed
tarball).

> Also I have regarding .gz. If other projects switched to xz and/or
> lzip (as it is mentioned in the commit message) what is the purpose of
> having .gz tarball then?

At the very least to help people presently assuming they'll find a .gz.

Jan

