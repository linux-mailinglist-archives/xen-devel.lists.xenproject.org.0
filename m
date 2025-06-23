Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846C3AE4739
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 16:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022555.1398396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTiQ6-0002sP-9S; Mon, 23 Jun 2025 14:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022555.1398396; Mon, 23 Jun 2025 14:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTiQ6-0002pk-6m; Mon, 23 Jun 2025 14:45:14 +0000
Received: by outflank-mailman (input) for mailman id 1022555;
 Mon, 23 Jun 2025 14:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a94z=ZG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uTiQ4-0002pT-7e
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 14:45:12 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa470a5d-5040-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 16:45:11 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6097d144923so8900186a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 07:45:11 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60a1851450bsm6121075a12.12.2025.06.23.07.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 07:45:10 -0700 (PDT)
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
X-Inumbo-ID: aa470a5d-5040-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750689911; x=1751294711; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8OARxFXaAZOGHE4HIwnYDbeHEw746xM/NbyncgeQf0=;
        b=D8verOVCes/cpQQzoOL+q5iMs1Ayui8Mb/1rbLVMguV2TzlsbruuiS9GMLVP9hdkn7
         fzBQwOWHcFTBShVAEOBrKMZvqs8hz5AVKdAoszJBergRu8ZszWljCckaHmEz1KeVgCMX
         CM8yKQVkWpw7yeS3FMdvuCaz602QumayCwNkF/G1jRmyzj8E8y4OGVWYjlsHi4riKom5
         EBqmADv6MoRjPx1Kr6BO5iooM1qYPR7QmYrmIFxaTdo5SQCqFxEtQPSH1iXoNNQhJs5v
         pxO6ORl3oVUAz9XQm2nMaLSBswu4VaGPXsx3aCLt0g6A7VTbzBAI1SHx8BIe26nfan3/
         FpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750689911; x=1751294711;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z8OARxFXaAZOGHE4HIwnYDbeHEw746xM/NbyncgeQf0=;
        b=ZlZ1jZRXA1NcxuRNM2OGLAbftQPBQZirlCZ6tUYlbpiWK0Rbb/GxF2dhr8Wt9+WPJu
         Av0/0hsUyqWjwz2q3GQNV28OuVEBKcu/ASLqGplW4Ietj23SjNVD/qAGAC3I08SPuek1
         U/RtMWDkMQC6S+V/Dx12vVzTBzO1ZbiczD80mS053s/IbgsvNXVv9FOJ1FHSAimGEj6T
         NNH+fR4NhjkJKB1qTAcI23L5Vhx78AOgXYq1LvS+hQPByBWV/k0FpiLt/UEl4hx+gbG4
         w0Kfn4pf1Oi8LUCzOfgxoYzTAH2aWtQ7DHRjVAb4WqBbDfM6Tsi90XO7ot+H8XWYv6vu
         hwVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv5XzHZMsMhCWbeoyKRXz1JQPjEMVAXeKiPV865Y7rJRRky8zGHxiCH/529YDYyVEeP8tjmiugfDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywp52zJkVgDABHzoMFdQWHpumpsJy98L6X3WhIg03WxPFMnIiqK
	3XzrqHK8iHDm5UbqoUJmNqq4oa2VDk+V6dH3D0MmBBeg9M5pp7tu0Yp7
X-Gm-Gg: ASbGnctueUV0lwH1n6dopT7z30VbsFPxQdkpqqqNeN/3LYb2+TAJp5uaq/aYLhDm+m/
	b5Iq/40KMvH2BM1Ig3YnisfG1cTp5L7splPHz4KF1Wf1au6g8mPMQCPrCIlQ9+1cxWN/93kChtr
	TkwKxs1GFIidzRUnFa/RQGLWCEFpan0eSif49OIAI/SaQAUOU8JMPbqFzNrkt7b9+925iaWKTLk
	bH58RFKKEwWSpJnUpy4YhmuRcHhjT/zICVHF/ml3hFnAOtrOQ6v9to7yjOVkemm9qfps3Bw6tiU
	pwyZ9Uh9bklA6ln7+PnhSjFdmiu3q/al4K68FNjKP8BfQGj3R8GdrWr973RBwpNntkHkv1bidpg
	IaNdn+gdfG+dZVbhDLy4/IAhfnuI2qV3VM6HkP6CTQWsglg==
X-Google-Smtp-Source: AGHT+IHlS0PbwCxtlw5YrovyaR5gQHhuC6TrDS+2DXZZTzCApLxQBYylImldlK4ryVj3/544NrTTew==
X-Received: by 2002:a05:6402:1e91:b0:601:470b:6d47 with SMTP id 4fb4d7f45d1cf-60a20a5117cmr11676721a12.1.1750689910831;
        Mon, 23 Jun 2025 07:45:10 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------FmYPHNJ7TC5xAYSZIiWQsbRZ"
Message-ID: <29ad0416-d42c-4d78-8aff-28e892d2510f@gmail.com>
Date: Mon, 23 Jun 2025 16:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/17] xen/riscv: implement sbi_remote_hfence_gvma()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <ea7a15c0ecfd2bae95c11a92e4c0cb71b155140f.1749555949.git.oleksii.kurochko@gmail.com>
 <728ee92b-0e4f-4ccb-8c6e-54687bd75c62@suse.com>
 <80460b90-ffb9-44e9-83ba-0f81b3b05e92@gmail.com>
 <670d4fa7-fc94-465d-a174-a73fedd1ee9f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <670d4fa7-fc94-465d-a174-a73fedd1ee9f@suse.com>

This is a multi-part message in MIME format.
--------------FmYPHNJ7TC5xAYSZIiWQsbRZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/25 4:39 PM, Jan Beulich wrote:
> On 23.06.2025 16:31, Oleksii Kurochko wrote:
>> On 6/18/25 5:15 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
>>>> covering the range of guest physical addresses between start_addr and
>>>> start_addr + size for all the guests.
>>> Here and in the code comment: Why "for all the guests"? Under what conditions
>>> would you require such a broad (guest) TLB flush?
>> Originally, it came from Andrew reply:
>> ```
>> TLB flushing needs to happen for each pCPU which potentially has cached
>> a mapping.
>>
>> In other arches, this is tracked by d->dirty_cpumask which is the bitmap
>> of pCPUs where this domain is scheduled.
>>
>> CPUs need to flush their TLBs before removing themselves from
>> d->dirty_cpumask, which is typically done during context switch, but it
>> means that to flush the P2M, you only need to IPI a subset of CPUs.
>> ```
> Hmm, but the word "guest" doesn't even appear there. "Each pCPU" isn't quite
> the same as "all guests".

Agree, it is just what SBI spec wording that...

pCPU here it is the first argument of sbi_remote_hfence_gvma(unsigned long hart_mask, ...)

It is even more confusing as based on explaantion if RISC-V priv spec., hfence.gvma it is
used to flush G-stage (stage-2) TLB and hfence.vvma it is VS-stage (stage-1) TLB flush.

~ Oleksii

--------------FmYPHNJ7TC5xAYSZIiWQsbRZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/25 4:39 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:670d4fa7-fc94-465d-a174-a73fedd1ee9f@suse.com">
      <pre wrap="" class="moz-quote-pre">On 23.06.2025 16:31, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 6/18/25 5:15 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
covering the range of guest physical addresses between start_addr and
start_addr + size for all the guests.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Here and in the code comment: Why "for all the guests"? Under what conditions
would you require such a broad (guest) TLB flush?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Originally, it came from Andrew reply:
```
TLB flushing needs to happen for each pCPU which potentially has cached
a mapping.

In other arches, this is tracked by d-&gt;dirty_cpumask which is the bitmap
of pCPUs where this domain is scheduled.

CPUs need to flush their TLBs before removing themselves from
d-&gt;dirty_cpumask, which is typically done during context switch, but it
means that to flush the P2M, you only need to IPI a subset of CPUs.
```
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, but the word "guest" doesn't even appear there. "Each pCPU" isn't quite
the same as "all guests".</pre>
    </blockquote>
    <pre>Agree, it is just what SBI spec wording that...

pCPU here it is the first argument of sbi_remote_hfence_gvma(unsigned long hart_mask, ...)

It is even more confusing as based on explaantion if RISC-V priv spec., hfence.gvma it is
used to flush G-stage (stage-2) TLB and hfence.vvma it is VS-stage (stage-1) TLB flush.

~ Oleksii

</pre>
  </body>
</html>

--------------FmYPHNJ7TC5xAYSZIiWQsbRZ--

