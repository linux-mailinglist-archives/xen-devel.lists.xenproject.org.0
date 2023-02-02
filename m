Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3935F688028
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 15:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488828.757090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNadB-0002Mp-Uf; Thu, 02 Feb 2023 14:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488828.757090; Thu, 02 Feb 2023 14:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNadB-0002Ky-Qs; Thu, 02 Feb 2023 14:32:05 +0000
Received: by outflank-mailman (input) for mailman id 488828;
 Thu, 02 Feb 2023 14:32:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akv/=56=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pNadA-0002Kq-CS
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 14:32:04 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c5fcce3-a306-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 15:32:03 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id y1so1900481wru.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Feb 2023 06:32:03 -0800 (PST)
Received: from [10.95.156.231] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 e28-20020a5d595c000000b002bfd8ad20a0sm16175013wri.44.2023.02.02.06.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 06:32:02 -0800 (PST)
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
X-Inumbo-ID: 5c5fcce3-a306-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6dyQOgZukQ54QDK6aIe7WXm73Yx6J7f4p/XUgBjaiQ=;
        b=gYEzfD17n8nHeGoo5M7J1IahG2YNPvjdBolDnNH1dKlwLIQXMWw5VU0hROBTqSsbWm
         Npz0Q/sEvU9Pvv6n+f33YCfowllVjSHQofRAnH4e6OvqHfY4aYJ3iY1L6yRYpwNPNbmY
         VI6gWJfW8NBJaQYAgGel+y5tvn51iZ3Ky+OAt/opWL3Gmkwx0qezwoZKvXvva4g1nXQh
         IimNUx1q+fZliP6fbn4t2d+dyycwzO3lQKu0VqbQMomqkgPAL+BVeDucNBeEk42SdHEd
         ztaaXz6nwQvW7Q2rJfuhQDam4dWfsPjwyqs3RdNhBr+gZZXgE7a20uII9ldSfZgOEMm8
         8gQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6dyQOgZukQ54QDK6aIe7WXm73Yx6J7f4p/XUgBjaiQ=;
        b=cLXDlijECiEzNxVcGwfUmId3c5ayWWQNWWK9x1h7eQOp0l/8xfgppz3j3HDrI++fls
         sSc1tewfdavJcZh3MB+C0WCjzIc7vlzue3He1x1nH2NNIfQHLzvcFzeyUoQGpumFRpUt
         PvsEhSA6zB8QjQ68RrSOpZPQ9X2AaCIPYt/KVg8paRAQ/5dlZ+h4Q6JkGvqMiAfb/vDL
         ivBtoWpjEdYE4FTbORFo285tVyfQ0i9nwg/0jmYL89h22LEesRiPBa9ghJTM0DDzUTJB
         I1ZSFvSfyOY/MzDVhozNw63IT9bKbF9Aac9XNm4j+WVBZHocj8JZHVnCPWjWIMbxCKuZ
         WAOQ==
X-Gm-Message-State: AO0yUKW3tH0kHSEBzIUWR38ew/2i14lMAB0KT+SAc8Ul4Qi3RDR7Bygk
	k1DcNWVVRBGT6xVCk9cuxzg=
X-Google-Smtp-Source: AK7set/Ded8UbNBqMS274a0klw1pXZiUb0FG0DCX0n76UwKL6fmeBdzYOvVoqjnvG9oAyaz0U8rRew==
X-Received: by 2002:a5d:464a:0:b0:2bf:b1f0:7bab with SMTP id j10-20020a5d464a000000b002bfb1f07babmr5097051wrs.47.1675348322958;
        Thu, 02 Feb 2023 06:32:02 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <5b7c223a-2c96-4bd2-7150-79a56281dd57@xen.org>
Date: Thu, 2 Feb 2023 14:31:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Reply-To: paul@xen.org
Subject: Re: [QEMU][PATCH v5 09/10] hw/arm: introduce xenpvh machine
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-10-vikram.garhwal@amd.com>
 <179d773b-2634-b52b-8836-8d8f882e1495@xen.org>
 <3e205146-5113-861d-ef39-c463257b54a1@amd.com>
Organization: Xen Project
In-Reply-To: <3e205146-5113-861d-ef39-c463257b54a1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/02/2023 18:22, Vikram Garhwal wrote:
> Hi Paul,
> 
> Thanks for reviewing this and other patches in series.
> 
> Please see my reply below.
> 
> On 2/1/23 12:30 AM, Paul Durrant wrote:
>> On 31/01/2023 22:51, Vikram Garhwal wrote:
>>> Add a new machine xenpvh which creates a IOREQ server to 
>>> register/connect with
>>> Xen Hypervisor.
>>>
>>
>> Is this really the right way? Is it not possible to do the Xen 
>> initialization (including ioreq server registration) off the back of 
>> the accelerator init (i.e. AccelOpsClass ops_init function), which 
>> seems like the right place to do it now that it's no longer 
>> architecture specific.
>>
> There are few other machines using the "accel=xen" option and few of 
> these machines aren't using IOREQ and other Xen related initialization. 
> Example: /xenpv/ machine under /hw/xenpv/xen_machine_pv.c /and few other 
> machines under /hw/i386/pc_piix.c//.

Ok. TBH the concept of 'accel=xen' is probably somewhat broken then. 
(QEMU isn't even running the VM in question, so how can it be 
accelerated?). Maybe abstract machine types really are the right way then.

   Paul

> /So, that's//why we moved the IOREQ and other common initialization 
> parts in hw/xen/xen-hvm-common.c and call them as needed for the 
> particular machine.
> 
> @stefano, just checking if you want to add any other suggestion here.
> 
>>   Paul
>>


