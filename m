Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94C47DA76C
	for <lists+xen-devel@lfdr.de>; Sat, 28 Oct 2023 15:56:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624755.973379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwjmf-0001lE-Ew; Sat, 28 Oct 2023 13:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624755.973379; Sat, 28 Oct 2023 13:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwjmf-0001ib-CC; Sat, 28 Oct 2023 13:55:25 +0000
Received: by outflank-mailman (input) for mailman id 624755;
 Sat, 28 Oct 2023 13:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k4Ch=GK=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qwjme-0001iV-DK
 for xen-devel@lists.xenproject.org; Sat, 28 Oct 2023 13:55:24 +0000
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [2607:f8b0:4864:20::d33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1ee8725-7599-11ee-9b0e-b553b5be7939;
 Sat, 28 Oct 2023 15:55:21 +0200 (CEST)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7a6830df017so89258439f.3
 for <xen-devel@lists.xenproject.org>; Sat, 28 Oct 2023 06:55:20 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 g4-20020aa78744000000b0068e49cb1692sm3003511pfo.1.2023.10.28.06.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Oct 2023 06:55:18 -0700 (PDT)
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
X-Inumbo-ID: a1ee8725-7599-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698501319; x=1699106119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ghogzWAM0DlwzHAe5VfGXZuVCvVZ5uQ3sHkg2QNduys=;
        b=RxYaHHqYhn25p+47YEtoRG4PJ2UsB/Dbnz5HKlkKWJjo5HxU0DpqONAeSNHlOpSwOC
         5OEMhwV4g1iWY+J44F2QqGd0oGt2V5GbBwxKTEgU94qEr4bw1VB66tM6eWtcRIRFrE2C
         gEFKmDVatQgKtOkqs821DuzSMjfff2kUknyObKBGeHtHesgyLzFFN3FzE3j6bE0hJu7H
         AA3x23KaB1d0Kam6MqDWaLjxVHlhF4xWOhjqJXzyTOX8Vs1dn213HQUP27JO8/QoB8Pq
         fShWFQUxszKRiryfYWGHnklQGrs600Ptd5eKxfV6q+J0aFpxccMbHretB62Ojv9n5I6j
         8e7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698501319; x=1699106119;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghogzWAM0DlwzHAe5VfGXZuVCvVZ5uQ3sHkg2QNduys=;
        b=oj90l1jMttCn/Yc0oYtQdS3mmQL2fO9ypkJVPVXlLPNJPCNpmMiRhPfY5FwJwIzw9m
         srdI88BSDW2F1FbXdc+zGSQYBAOCjXben4Ov25L2BbFMzIVWx5vYKjtOL7UOl1aZLDNH
         Q+Zx3MQhXfiUoM0YhB8DA9wlYt/QQNO9xTaaz5Fe5LiA3POMPG0aQ8qDHbOWUldetU8Q
         t6x+0TkDPR2k4Otzb/zN2vR2pTqw6sTEWRAXrAgjaBoRmAl0W+gZ5ZWKiCUTcqewjZFT
         mmgJ050UAcLI5CA9FBS0OsCBbWxBJ+3Szz7exnaA/tQUbjYG59+ZEfNMlEANiXFvtR5Z
         p0jg==
X-Gm-Message-State: AOJu0YzA4sH7i00YOZ7sRmHVZAd76EGPDafBFzdti5P+B4AFS/jWKrQp
	Onc7ms4EJSxcJ/+cNUcK7jo=
X-Google-Smtp-Source: AGHT+IE36nKn7DU2LMBoTIw1oUV7gLSmlyd0tKZnbx+QIk+lt8IHgBuVeoTMv0nCAWIotXRVdvg0DQ==
X-Received: by 2002:a05:6e02:1846:b0:358:104:677d with SMTP id b6-20020a056e02184600b003580104677dmr7464775ilv.22.1698501319649;
        Sat, 28 Oct 2023 06:55:19 -0700 (PDT)
Message-ID: <3b21c98d-bf3c-46e4-a302-fc5b2c6cce3d@gmail.com>
Date: Sat, 28 Oct 2023 22:55:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86: Introduce x86_merge_dr6()
Content-Language: en-US
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-6-andrew.cooper3@citrix.com>
 <943d1d28-08de-3c1a-5a64-6caa98cdba78@suse.com>
 <43428539-4fe0-e2ac-48a0-b2fd9bcc0d1f@citrix.com>
 <f365e11a-9ca7-fb3f-ceae-28da7e1d6779@suse.com>
 <13e3a0e1-42fe-d954-f06e-88526d56e919@gmail.com>
Autocrypt: addr=jinoh.kang.kr@gmail.com; keydata=
 xsFNBF/Q7MUBEADVIU6g5ui3gcTQV9jbneUb6xdUQJtEDOWG6pThD+nKAwQFYtZpCUSWgGVg
 osMQTyZu7HpEMvxoYNmO+1ZHtARugq2tl6BH11vEJgTsoF8IFrgyXNlinS+Kq6I8s6py96Pl
 Fk2b9Y3ok64DJUrmFjfgCAxO0RY/ZFS1vXMqibExzMLODTChrXal0Z9tjxQBkARPXeDmVg8c
 qW0121/3ODyi04jri34f5luRQe2PMJsqKAmd6Ok9zNkvc3wQZw7t3MiMEJjf1/eZa/He4OoI
 CO0zQY9dRhQBqgO67lnVziCRfRb4WCHxO03zE7C8ud/UOmuMM4Qh8rAyW3sJ2TbIqwvQepuc
 vC/Q+Av0GtuUCArUw4GbOibUDxhe1eTZViIYAghkzOxUWeDs1PXRPVnRu6PAGsQP39/2ZPAB
 wune9t2SEs4o2Js0Vx0c2O/vMXt3uHqtaGNdCJgqlBkNXHlrv47wF7bBMQSf4SepAg+1ZqfI
 wGgEWmWhBV+8Kqyb1zYIAPsqyvl/2E//XcvKk/70q0QhASGkUvEI8AWAGDdkVPrBfwIqhvWY
 ycMnOl12k5e161uvL1NiUIbvG41/lCzQqhmaDfYznwsC1YRfx/STNaoIdBqR+niUhJbEGpfy
 z1BqOYMHpFx1sKFfJesMDyLBDaQBuO5X2mKmpHvCyfy9ouBNmQARAQABzSRKaW5vaCBLYW5n
 IDxqaW5vaC5rYW5nLmtyQGdtYWlsLmNvbT7CwZQEEwEIAD4CGy8FCwkIBwIGFQoJCAsCBBYC
 AwECHgECF4AWIQRCo/a4eJTkYSJv2ktDGVOBYOvS5gUCYbhyYgUJBansnQAKCRBDGVOBYOvS
 5j/MD/9nOVrCapKqBwZasEvTDRnpSP+TYoNoLDnJ6ukyCLiVwSBINJuzENLw7WQzsAoMsQbF
 PH/VJE2BIsFTTkkEcST6xJzGb79LCReYWINCLJKFRkdqhFC/tE5WjcRmpHW6A+xWPvoBcsNw
 gkpygovdQEI4i4LnwTmC40xL86x7EgJMOFyHdbFFV6SbnagSQyN9qLMV52Ohj8VvBMEMoXF4
 gokxz11FYNMH6y8/n7VCqF3/uQR11uc84IHlxG1Q9I2b2Uwzf2Yy6JM7GYgSehqJnB74vxHw
 gLFTTtSTsi7yselCbvXMbOa2etETdU78u95JrKwlIDSDymPSynDLW4424DAv+r/HJ4T2ldck
 OFDf4cGKVsKw/IrNimgOQzGyMNoFbkZEG79+kWYqA6URXOPZaIpBsdMX7GGWpAei+FPUzLjI
 /lozEArNKHESRdoJaHPFMPuECodjfEYZjblt0VZNM8ybi7Xrp/RWrOtloKnTNewl/hSEfbxk
 S2yn6epDDhnU5vlOpnQXE6UrcGh0SXmnr6ZcN1b3xObTgvHe+nOq5vV1Rxss5iJURokEFe4L
 83PvU/9kZ9Z8SUzAjx5dgm4cV8MhKGFSV+6vCuWJwVqk0HVXyicSip4YR1uhdI+pmXqBdXa4
 51RbFPjXR1tR42AY3HsBvlksLjiWftW2nOyIYr48+c7BTQRf0OzFARAAx8fgWCVxM1CZWKGj
 5HKYV5IJy4D5/YVvi2ob05I18a5lz1dXLOu598rL9gX3V9bZ1k6Q7lh5glNyITnTnlAnpVNu
 zXbPlbJb35Bwmns3OgGi0tCPWxlsn5GZacXUnByVylwcR0OKA9ekWB2CJk0BVpBzKf3c/JgS
 bLNKNG9lpDlypJGMZBWbwODK5HdKKridfUJiFHdE6wErdryjTT75NDTzQoKTeMG/TgyBTLY5
 Ebc6AXryTGGi2THU/ufC+m7/NMhXQGR1dc1dZsPUELXR4XfE36HVfKi3lHT6jY+ylQqIhiQr
 haAun5mpitoOCWyeMvQCrXB+Qe1JzpVHQB2mPZ2RAMD82+wZE3kGh3XiOheY+NFb2ahTvZMe
 otf3/uH6k0LehKt2jVbVjaxAelqCMjBzOlPeaYlD1NTXXX9RGRUUQThfJezcCt/iOv64wayV
 N6ua8dMCrFWzS66bsrsdSmlucB/S7VvNLCFStSJnoW1s4MdQ387NVK3NC41tpx9qVzwIc4X/
 0jS2xA2EHC/+HMx8CXQiXPV98WP2Hd4TEmX4SAiIXuiXrN84ANJx/bPn/iS3QXBiY1YNI787
 oinlL4BJTM+rpZgTgsQk3M0QfenrVIqn7c/L+vk7r0TV4oq/+w2mKLAQX3co00+mrRfANajb
 xA4oODN5wd649jV7NZUAEQEAAcLDsgQYAQgAJgIbLhYhBEKj9rh4lORhIm/aS0MZU4Fg69Lm
 BQJhuHKrBQkFqezmAkDBdCAEGQEIAB0WIQTMaS2u9z9TeQVd30AaWpBEbISr9QUCX9DsxQAK
 CRAaWpBEbISr9YyoEACEZ78xorTPJiQwPtk+CDusIGGQUCpmDv9SJATiXVLS9n0cmNXpCEr0
 wmSfNMpav6vsbXG98J9VMS5sqYV92BNdcQzrUQQY6cZum3CgpXOZgsmmijda8Qd8agX6+dzi
 vnwZLF8pkKeGfvBGtGzy2gY/cU2HpXfBDYkReFpPT3wilRKjZGe5QvNS8VQYbQ3EHp72cKim
 ksXclQOd/oN03TSCQGAZV3aIq4rw/dnPL8Yk+ngZLDRjWwWCVpvvX972a1D9BnfP4+AXIAfW
 8/OY+HSELm2Ft2EGglascOlgztHNx8k6cDI+aj0W58QH3BEQRIrTLL7aH2V+rnofloFyHdNJ
 vbdwiIDjHs6EeCRpOaxRGJJKH14/b95d50KVFe+8Yyhz8s/zfuq1nPnZ4MMdwvLsADb6E9sO
 ojL5nGZg7D1uNssfpAa/aEoa8PC0QXXavgxpgeJp7+9tsg6ORDbWb1tzqA7mQ+pZqeXaumRr
 g90OaDXbkxM3IE5mT7zd7Exj7np5NWJxwwez69Sa2rGW5Hnf0HywIdqVxyLdR1vi9RZE0XB5
 gzzm62BtJHcwJ2wDqv/C4vAgD++wrNpJOODYjso7j8qI1XcBQKFp9eMCRkyE+zc4+6RZFIB8
 dKLHHLKAtMHnaKtt+FX+pWxLlEp7acvo8KWa6ZT1452WOtnoVbybGwkQQxlTgWDr0uZsGxAA
 wqR1Jr/ddIfFHdvEc8o/MGKJbmco+NZzmPqBjq7CUd9HWtApXM3VGJEV2KIBUndBRFt6+ZRQ
 IoDMD8YdqJMqRTGNNmi5lzQO/FYSKMdNc312e0AISFq4M5h3H1L2eHQRKUhf6yN1lEcvxAOC
 oifY83sLcMxiQCalMmquy4ViISo7NutImw8hJmJ/wwGTR2vQ4ROdISPTzcLmQgqECJdA/IeG
 Pmy2v5Mc+hVAlEGSxPXU4s3kqxXlNaJA7nX2+QYCjiOnIYgRa90VPbsrkw8B7GUz78rYYb3D
 XNwy8LtR2kv5vkqiqkKQCRhCB7EBWYrDgFldOBx7VbV8p9dS1Ub50/de6pKi0IrK46CtE4sB
 ro+Uq+k0HxllHh2ilUlSnInm+Riit+pH7x5BAjMQJ5E2nIGBHJebWPPN4hmraAh7Iy+tFLrr
 JCtRNpmqjscVqbBCtAc0KbGenSAPeWB4xx4CPxj0xYls8yR7r4HFnhk3RHGuTk2XhI+oa3Ku
 EFupnXSyAprbJOXjLrTQGmqgqxu2Pe3Y8c4QDpMWvSE9O1uFL3Kbb81A0UKJBDTovVvNixbk
 bd/QBkfTNpm3GP0/jjQRma2jvammxorO8/rCHHTJDC1G9jYdS5plYdjBauqtVAhwQYAptlD6
 txXwl3e8f9MonKqfbRPPNjJzsrnlOhApsBI=
In-Reply-To: <13e3a0e1-42fe-d954-f06e-88526d56e919@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/23 19:20, Jinoh Kang wrote:
> As an outsider's perspective, I think this kind of thing is where selftests
> really shine.  I got the impression that Xen will need to rely on numerous other
> platform oddities, the documentation of which are often unavailable.
> 
> Of course, adding a whole new test infrastructure in code freeze is not viable.
> Maybe I have missed something, but I only see three paths forward here:
> 
> 1. Reference the most relevant paragraph in SDM/APM, but don't quote it.
>    Keep the current explanation, and state that the manual is vague anyway.
> 
> 2. Acknowledge that SDM/APM is incomplete, and completely abandon the manual
>    as the *authoritative* source of information.  Perhaps embed a sample test
>    program that demonstrates the behavior, if it isn't too long.
> 
> 3. Actually assert in runtime that DR6 behaves as expected.
> 

Just a heads-up; has there been any progress on this part?

Please let me know if you need anything.  I'm happy to help!

-- 
Sincerely,
Jinoh Kang


