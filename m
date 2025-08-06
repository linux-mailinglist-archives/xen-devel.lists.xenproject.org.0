Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8C0B1C57E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 14:02:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071688.1435102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcq6-0002AY-IG; Wed, 06 Aug 2025 12:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071688.1435102; Wed, 06 Aug 2025 12:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcq6-000296-FG; Wed, 06 Aug 2025 12:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1071688;
 Wed, 06 Aug 2025 12:01:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctQb=2S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ujcq5-0001t5-1x
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 12:01:49 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20da6b82-72bd-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 14:01:47 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6156463fae9so1527997a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 05:01:47 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0763d8sm1103259966b.2.2025.08.06.05.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 05:01:45 -0700 (PDT)
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
X-Inumbo-ID: 20da6b82-72bd-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754481707; x=1755086507; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIC2xpCOK1u7HiBkTWfraOsV9wSURM5yK972xn+dA/c=;
        b=E9ElItoZnzxObfJ24UIQVEMbkGaEYSYqPI178k+Lz8mq/9OC4tMUacoDH6Yys6aUdP
         v9nuiUixPpQ6OWCiA/ETG5Rr7UhCW6/VMTdqwiO8sUXFONZLN/4f3l2i3zbfHB3pHS36
         CaHcNgvt3fbqivx4t4s53KL2iUHBUPN5zO0Cy358Gj0lhcGsh4vHQIIWUHZ7JCcWOwv+
         JS5NmXGSFI5RlVoVaY8q5xsn7QyXGHNDD3icCDeNMA04E4R4ntTM+vyNfYjDDKE7RXam
         XzE3qYqbH8Os4PZ77AbKvhyfTww5MThKC2V8De1hFs2af3rQiTzjYzkzM4Zvra2WU1SV
         nCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754481707; x=1755086507;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JIC2xpCOK1u7HiBkTWfraOsV9wSURM5yK972xn+dA/c=;
        b=AkhqrO19qNEJFahPYKZcXy7oZHhic7XWEDOKKuJ8eEFU/3ZLv8cS4oOXoM/smyOU/U
         cEixwXd8xueglGDg7rW5hozIDwb0Fenv3vCcGk++ujcbf75sBvDmq/kes8aGQKNAHvNY
         dlO6HdfnMLg/rSyM14Ot6wwQG93yYiMQl7Drvq5zgITJr2CT1v8Cd9IpNWPfbk0Eefm3
         8l+Bm8hGIHTaGDbQAf6cbIpTYo1hoyvDu4ZNaMomPlSVUyfPukqtdg7PAMXDs1obfuCg
         +a/zrTs2PMlZT3RE1aJDkCmeoZkvKCWZAGO1SQsM179nE6DHuwYGEqEAcEpAFqstevMj
         IfXg==
X-Forwarded-Encrypted: i=1; AJvYcCXVNmuzrgHc9iJ4kkmqyngl+uFY+FhsipJ9wE47wDJ/okTG4EcJU8V7tbZhpJ8dbFWRMbg4nTAywnU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVuOsrN62NIF7uOyS3ppp60XZZkVYAn2qN9nnjTIfyFHi3sFqG
	AzTz299Ie0km3cWmSrS3rDlnTG97kn457bBXRGlvazhkTVrdAgk2sKpMsFIAuA==
X-Gm-Gg: ASbGnctgC8O8ol8Y7ZhkwRRXcvb+5rwwgioxIMpE0Ww5EccmNLqs4w8MFmyIfumQc0N
	UtXxZASXmAQDzndwY3HYqRnMeMRA58pOHrfmF4jtgmSfECMXPeGIjdAfWSx3Txwy0976WfuxX3Y
	sNCB75Bb6HXkGz4F0mkIsSNKtcYcNzCf7sQucGsemcCu5b2j5vmpinRIbW8VLUel0klUQzrFAik
	WE0swSbCigrUi0TqVMsiGr967Ny3mV3Oyio0qLsEcZ5A0Fqn6sH3fHKq97Zt1MV10ujDNQjXLeU
	gV7CcUzQ2YLbuizW7g1pkhA2DkYfdUa0oKV8xO4uEp317hsmKCjZ8XPl3dz8wegtwCtD83ZqNBH
	j2F0WfSxpEd0GY02alO79lBJQMeweqjdHcT8Vl4V7Z1fPX6wd+GNQiG22LXrwa/0JCIjTslE=
X-Google-Smtp-Source: AGHT+IHh9rW4CALEG3Fm+yQgoKMoHk8sY+3wD08jPWlU/hef1IynQPlNeNX6m4lltKKZV2F98B7yZg==
X-Received: by 2002:a17:907:6ea4:b0:af8:fded:6bad with SMTP id a640c23a62f3a-af990906562mr259599766b.18.1754481706513;
        Wed, 06 Aug 2025 05:01:46 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------H6KpCsd5d2afR9BLfiirc8TZ"
Message-ID: <858f52de-8ca4-4b93-b565-2e943523c526@gmail.com>
Date: Wed, 6 Aug 2025 14:01:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/20] xen/riscv: construct the P2M pages pool for
 guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <4e7de8ffc929c1bdfa28b40fdd31b814acef103c.1753973161.git.oleksii.kurochko@gmail.com>
 <ae570c32-e6d0-4131-af2b-d6984ff92750@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ae570c32-e6d0-4131-af2b-d6984ff92750@suse.com>

This is a multi-part message in MIME format.
--------------H6KpCsd5d2afR9BLfiirc8TZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/25 12:40 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> @@ -30,3 +34,18 @@ int p2m_init(struct domain *d)
>>   
>>       return 0;
>>   }
>> +
>> +/*
>> + * Set the pool of pages to the required number of pages.
>> + * Returns 0 for success, non-zero for failure.
>> + * Call with d->arch.paging.lock held.
>> + */
>> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
> Noticed only when looking at the subsequent patch: With this being ...
>
>> +{
>> +    int rc;
>> +
>> +    if ( (rc = paging_freelist_init(d, pages, preempted)) )
> ... a caller of this function, the "init" in the name feels wrong.

I thought about paging_freelist_alloc(), but it feels wrong too as it sounds like
freelist is being allocated inside this functions, but what really happens that
pages are allocated and just added/removed to/from freelist.

Maybe something like paging_freelist_resize() or *_adjust() would be better?

~ Oleksii

--------------H6KpCsd5d2afR9BLfiirc8TZ
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
    <div class="moz-cite-prefix">On 8/5/25 12:40 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ae570c32-e6d0-4131-af2b-d6984ff92750@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -30,3 +34,18 @@ int p2m_init(struct domain *d)
 
     return 0;
 }
+
+/*
+ * Set the pool of pages to the required number of pages.
+ * Returns 0 for success, non-zero for failure.
+ * Call with d-&gt;arch.paging.lock held.
+ */
+int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Noticed only when looking at the subsequent patch: With this being ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    int rc;
+
+    if ( (rc = paging_freelist_init(d, pages, preempted)) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... a caller of this function, the "init" in the name feels wrong.</pre>
    </blockquote>
    <pre>I thought about paging_freelist_alloc(), but it feels wrong too as it sounds like
freelist is being allocated inside this functions, but what really happens that
pages are allocated and just added/removed to/from freelist.

Maybe something like paging_freelist_resize() or *_adjust() would be better?

~ Oleksii
</pre>
  </body>
</html>

--------------H6KpCsd5d2afR9BLfiirc8TZ--

