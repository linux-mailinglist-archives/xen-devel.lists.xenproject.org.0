Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC76DAAD0DA
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 00:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978056.1364926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCQbB-0004Qn-H1; Tue, 06 May 2025 22:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978056.1364926; Tue, 06 May 2025 22:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCQbB-0004Nu-Dh; Tue, 06 May 2025 22:17:13 +0000
Received: by outflank-mailman (input) for mailman id 978056;
 Tue, 06 May 2025 22:17:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cniF=XW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uCQbA-0004No-4E
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 22:17:12 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5b23358-2ac7-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 00:17:02 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so3839204f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 15:17:02 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d43cb5e5sm8161145e9.7.2025.05.06.15.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 15:17:01 -0700 (PDT)
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
X-Inumbo-ID: d5b23358-2ac7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746569822; x=1747174622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WOLLM1nZ2VFgS6llNyqg6FWUpWb8G4v8eubCWc5XIFQ=;
        b=NTndIjVaGaSSBksUR+5WNwnBMBS+/BURPB/a9TFNYoez/M6dO5Kk6Ga8IRebuFCYHt
         Q0H4zT/Z9QYG5ZDOJepwFkWl9fOLTUapdYTK0YUU96i70TE3HHpfyLMPh/kCx2xVq48r
         CoD/t8YMwVCMvt5zqJAj/O5XQANiLnS3ADo9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746569822; x=1747174622;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOLLM1nZ2VFgS6llNyqg6FWUpWb8G4v8eubCWc5XIFQ=;
        b=IVFGXmvFPNDJDKhIKnf4W58p9JmT+Wg9LFLDUiSmdxQyyf878vuZI5pF421jjT+drb
         alc7Ao3BwEyMcMOgh1gis1XVcy4+6fDHOl56dGwWt43MVZbmXmT2ySUPoAqVEyxn2KTb
         mviXyb0ChPySD2Gs6ZfplibGBqI4sc1Q1m7nxtpgP6fpr465U4/bQ6GvgTduPjloxE7c
         EQXX9gHv3661l1GOSfkY2xpIdyNH2DxjjDZX8a62Gj/+rH+OJZM8Naz1kw9Z6mdLTrMZ
         fWa4E3joYbBWBLZqOX+S5Uz5CHjFLpr1BYtwioej2Brtz6RHKDTHxVfVD72m3y0LqIjS
         xNHw==
X-Forwarded-Encrypted: i=1; AJvYcCUaSIg0eeX/wCiUPIilxZ644TGAVi6mbIYcWQpFwGKWeqAlj8yGukJkOTdazV+8Y/9SWciaU2LCabk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzd7bZ+KpFlGx5wouONKnW9IuW9S6oPTrhGXuT9t6zC0bVD9GTl
	feWvgbsr8nJkVsMvSqDsboTlaBobuv2hT57AsY0uuELK7xMqAhft84FK1ab1U7s=
X-Gm-Gg: ASbGncsi/H0p45J15tVLnPJPV5zxZLUnkWIxyx9gOJWsd+PBaHKePL52HnKC0kim+/+
	z8vgF9ygsK6SRm7hBvBDzVA6vRrOTIuxGOVc62hWwdvNWht4HrjhL40dTXShRMnt/XjfAzcvOBL
	hmzbNylBOeEiVNyr+WBHF2ZgTRkLXQbhBSJ0UGUEGlS65S6O3+3la7Zt81/M1uF9l/Nu+GUNtea
	aMjcOlBQJxoVDd9b8g0lt5WcIJ80NT7cDSqSG/uC9S1ow6W4s1WJssJhWClSZBHFjqzeVVUPEHw
	lo4kUtxt7rcrsVORKp2nt5uA/sVwDKg77ywH9epGotxvjxNTUas+JF761yDODb8k5bjLgie4IZw
	T0PXQp3UvfWkgPECX
X-Google-Smtp-Source: AGHT+IEOlXHPWvrY6jY6PfXrSE0R7h9lROIErZBHwGdvPv16ypp10sJd8KEMtfJV9OLpiY3vCR9ExA==
X-Received: by 2002:a5d:588e:0:b0:391:2f15:c1f4 with SMTP id ffacd0b85a97d-3a0b4a68783mr773759f8f.55.1746569821672;
        Tue, 06 May 2025 15:17:01 -0700 (PDT)
Message-ID: <5698b996-e23d-49f7-af37-645d4784dc67@citrix.com>
Date: Tue, 6 May 2025 23:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/lib: Export additional sha256 functions
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250506135655.187014-1-frediano.ziglio@cloud.com>
 <20250506135655.187014-2-frediano.ziglio@cloud.com>
 <de48c8bc-a7b2-4b9f-b45e-cbe3f7eb03c4@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <de48c8bc-a7b2-4b9f-b45e-cbe3f7eb03c4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/05/2025 3:05 pm, Andrew Cooper wrote:
> On 06/05/2025 2:56 pm, Frediano Ziglio wrote:
>> diff --git a/xen/include/xen/sha2.h b/xen/include/xen/sha2.h
>> index 47d97fbf01..ea8bad67e4 100644
>> --- a/xen/include/xen/sha2.h
>> +++ b/xen/include/xen/sha2.h
>> @@ -9,6 +9,16 @@
>>  
>>  #define SHA2_256_DIGEST_SIZE 32
>>  
>> +struct sha2_256_state {
>> +    uint32_t state[SHA2_256_DIGEST_SIZE / sizeof(uint32_t)];
>> +    uint8_t buf[64];
>> +    size_t count; /* Byte count. */
>> +};
>> +
>> +void sha2_256_init(struct sha2_256_state *s);
>> +void sha2_256_update(struct sha2_256_state *s, const void *msg,
>> +                     size_t len);
>> +void sha2_256_final(struct sha2_256_state *s, void *_dst);
>>  void sha2_256_digest(uint8_t digest[SHA2_256_DIGEST_SIZE],
>>                       const void *msg, size_t len);
> sha2_256_digest() is unlike the others as it holds sha2_256_state
> internally.  I'd suggest having all of the additions below this point,
> which group them more nicely.
>
> Can fix on commit.  Otherwise LGTM.

Not quite.  Now that sha2_256_final() is exported, it should have a
proper type for  _dst.  I've folded:

diff --git a/xen/include/xen/sha2.h b/xen/include/xen/sha2.h
index 0d55fe640431..cb30e8f8d77c 100644
--- a/xen/include/xen/sha2.h
+++ b/xen/include/xen/sha2.h
@@ -21,6 +21,7 @@ struct sha2_256_state {
 void sha2_256_init(struct sha2_256_state *s);
 void sha2_256_update(struct sha2_256_state *s, const void *msg,
                      size_t len);
-void sha2_256_final(struct sha2_256_state *s, void *_dst);
+void sha2_256_final(struct sha2_256_state *s,
+                    uint8_t digest[SHA2_256_DIGEST_SIZE]);
 
 #endif /* XEN_SHA2_H */
diff --git a/xen/lib/sha2-256.c b/xen/lib/sha2-256.c
index 896a257ed9b7..08ef7011a1c3 100644
--- a/xen/lib/sha2-256.c
+++ b/xen/lib/sha2-256.c
@@ -171,9 +171,9 @@ void sha2_256_update(struct sha2_256_state *s, const
void *msg,
     memcpy(s->buf + partial, msg, len);
 }
 
-void sha2_256_final(struct sha2_256_state *s, void *_dst)
+void sha2_256_final(struct sha2_256_state *s, uint8_t
digest[SHA2_256_DIGEST_SIZE])
 {
-    uint32_t *dst = _dst;
+    uint32_t *dst = (uint32_t *)digest;
     unsigned int i, partial = s->count & 63;
 
     /* Start padding */

in too, which is compatible with the rest of the series too.

~Andrew

