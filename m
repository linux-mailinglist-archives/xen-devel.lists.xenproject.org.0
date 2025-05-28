Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7C7AC5E66
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 02:38:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998899.1379595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4oG-0008Kz-UE; Wed, 28 May 2025 00:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998899.1379595; Wed, 28 May 2025 00:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4oG-0008IH-R2; Wed, 28 May 2025 00:38:20 +0000
Received: by outflank-mailman (input) for mailman id 998899;
 Wed, 28 May 2025 00:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isSc=YM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uK4oG-0008IB-0P
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 00:38:20 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cc28338-3b5c-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 02:38:18 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so627182466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 17:38:18 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8a1b5b865sm10559466b.168.2025.05.27.17.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 17:38:17 -0700 (PDT)
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
X-Inumbo-ID: 0cc28338-3b5c-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748392698; x=1748997498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6XII4U9fWpA94jxkMxjFFougZajWLFmoGQljKXx6uV0=;
        b=kRI9Gp24Gy3l2bLbWDsK5gynbfEDuhFVNU2oNr3TpUpRO8Rca3J4N19DJjUwxmBxLA
         1JWOVB3+JSk4BSbD774LjaPja7+l97LbW4ZN0Zyc+JYqnmGxsnhho0vw1Vs80uyhf6GC
         9Sj1vUGj+wAKsdqriuWw4aj8B+VwDmEgeXRY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748392698; x=1748997498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XII4U9fWpA94jxkMxjFFougZajWLFmoGQljKXx6uV0=;
        b=ZQ4S8CYqqqlwpQhlZbBLuykQdyG1Th+2JWxNajulE1QM9cY6BFauAswgziFPFTwnRC
         X1Oa8t5ikBIHQOXLSfj1g9M5IQqKyq+w08bDUS7hc9cl0aOgMTaxHQmvhOYSKR9PK2cW
         Z5xCsj4/upOl4T3lhd8sLhAIubFlf9oQ78VblKuuiqA8u7wJP+rOObxZfsDURGCJl3xb
         iht4cid2b5ZjNA643N4FxnhZQZ4+Czt1YRbsoHoogSngEh6hOBdD0qa+kA0/w+m4ZNM9
         N+k4Q5wZjxhYkj5qSCSEd6SbKKGYQjuXOne0YAFNLMUINqFih/Av4ASFrXCTpjQIWWn9
         MH0g==
X-Gm-Message-State: AOJu0YyNrTzMalucH3JKlmMJ60v+NqWNKKlq58GKAAaIv6/oiKFqowib
	Prma0KTu20WwuYcZ2Cx3GmeV9OUhJT9ImdafaJYR8/N6CBrKOyq585KAw1VqMMtGAqw=
X-Gm-Gg: ASbGnct4E8qyQIfUmoAzT69QpjGu+DAWcCuBFykr7KmL/4EiD8tLHn7tdVFh82/4i9e
	xX0p+YmAo0j1UrxIhqGe+fcwZizouPoHC7Ogh+dk+f4u/VfitokP2BQghRhYLPulWaPHASnT4Hp
	Lym7ID4xo+kdpkTE+Tr2f4N/CUcizoPSQSBx/yR7j++IHBI0EshywtQLpdW7VdeOlLZty6pYu41
	iZ78n5PoDpZrzN6hiX4d3+803/R8UO3HEBjprpxL38pBstIn9cmquQMnT85livSDC7rdLGnIabl
	Zh4CYo30lwaNa9FGhbOUZ9eixgnq9aZK1Jx9jk7VGZ/3YwgJAk8miYl9YGBb8QP25sk92qUqKRT
	w3OaSPhXRP7dAj+GC
X-Google-Smtp-Source: AGHT+IFB719Q2GTrTdy5Ni70ywvwc65VKAez38EEtauMagA4sJcOWabt5/+p7tJUoZsx9aApKC6hLg==
X-Received: by 2002:a17:907:7215:b0:ad8:9b5d:2c1f with SMTP id a640c23a62f3a-ad89b5d2e9dmr155216766b.50.1748392698062;
        Tue, 27 May 2025 17:38:18 -0700 (PDT)
Message-ID: <a49d8ce2-d2d9-4f86-9f74-1234ca33e4e0@citrix.com>
Date: Wed, 28 May 2025 01:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] CI: Adjust how domU is packaged in dom0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
 <20250522173640.575452-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2505271727170.135336@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2505271727170.135336@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/05/2025 1:30 am, Stefano Stabellini wrote:
> On Thu, 22 May 2025, Andrew Cooper wrote:
>> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
>> index 1dd3f48b3d29..17a37134f46a 100755
>> --- a/automation/scripts/qubes-x86-64.sh
>> +++ b/automation/scripts/qubes-x86-64.sh
>> @@ -185,12 +185,24 @@ Kernel \r on an \m (\l)
>>      find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
>>      cd ..
>>      rm -rf rootfs
>> +
>> +    # Package domU kernel+rootfs in /root for dom0 (uncompressed)
>> +    mkdir -p rootfs/root
>> +    cd rootfs
>> +    cp ../binaries/bzImage root/vmlinuz-domU
>> +    cp ../binaries/domU-rootfs.cpio.gz root/initrd-domU
>> +    find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
>> +    cd ..
>> +    rm -rf rootfs
>>  fi
>>  
>>  # Dom0 rootfs.  The order or concatination is important; ucode wants to come
>>  # first, and all uncompressed must be ahead of compressed.
>>  parts=(
>>      binaries/ucode.cpio
>> +)
>> +[ -n "$domU_check" ] && parts+=(binaries/domU-in-dom0.cpio)
> This is a NIT but I have been trying to avoid this format in favor of
>
> if [ -n "$domU_check" ]
> then
>     parts+=(binaries/domU-in-dom0.cpio)
> fi
>
> for readibility.

This is a weird one, because the (relevant) readability is the
components of parts, and it's easier to scan without the extra blank
lines.  Nevertheless, ...

>
>
> I can see the patch is correct. It adds a bit of complexity in exchange
> for a small improvement. I am not sure if the trade off is worth it, but
> I'll ack it anyway.

... see the thread on the previous patch.  This was the RFC "I'd like to
find a nicer way of doing it", and Anthony has made a suggestion which I
need to experiment with.

> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks, but do you have any input on the /boot vs /root question on the
other part of the thread?

~Andrew

