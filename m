Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E948A38416
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 14:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890406.1299481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk0u0-0003rj-Cq; Mon, 17 Feb 2025 13:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890406.1299481; Mon, 17 Feb 2025 13:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk0u0-0003qC-9i; Mon, 17 Feb 2025 13:11:12 +0000
Received: by outflank-mailman (input) for mailman id 890406;
 Mon, 17 Feb 2025 13:11:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kh3E=VI=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1tk0ty-0003pn-8z
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 13:11:10 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5dce4cc-ed30-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 14:11:06 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5453153782aso1832110e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 05:11:07 -0800 (PST)
Received: from [192.168.0.110] ([91.123.151.154])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452771c15esm1298487e87.190.2025.02.17.05.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 05:11:04 -0800 (PST)
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
X-Inumbo-ID: a5dce4cc-ed30-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739797866; x=1740402666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uhgyIDJsvO4T/6SIxUj1UEqF2Ls14n3yI5brnCZVcck=;
        b=KmLhpdVznKlws9JpOd8thTXM8i8w+iBy40nWN6OOZTGvY79toMYf5GCcCVfiRJP13p
         1RnNinhUzo+jdMlDSgUWdTpi6mttO2AdDsKuaaXPN8+p1cWLq7liZrUdK2w96HpEzogB
         pHvZu6nN4Pb4wThHHEYwPyjRTvbTTvFRJErsPte+/4zScMY/mgx+bVYKTuae7ZGWpnWF
         jPclaDi/kp5WCM1wfES3CZGGe3yQCzGh0yAs170r4mMf75wqhLBpCduGUAdYmcbOAbez
         JMCMp2xYyQG4hDFfFp7uL3ZlBuQIubiKoKSvFoFlAyGJQc6z8Cxvo1AhbP+MApaGjw3/
         oMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739797866; x=1740402666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhgyIDJsvO4T/6SIxUj1UEqF2Ls14n3yI5brnCZVcck=;
        b=tTv3sMUeVCtXaNyj2pYIvJXeIWwk+VY1bHbuLHDMhfrp2YKcbmS/M4hjUukhNjFtc0
         02zqlYYhEFbWVbLInT+KicGH9d3uAAYxAq9ZPgtEQiHkqdmf69qficQZWOKjHyMWU//D
         2socXeMg+a5jpTYV8bwSw2iFBQE2tAKsrubvrGry/AThWMlF8TsUp0KaFpzXKzNFZ/4f
         mp3jzxp8wuMQwME1wDboZ/UMkuiRrXxe1yP6YguSjqYxtQQib3tcaQvnuPg4CscC/Qq4
         r1/liXS1zPHPmqhgR8V+QmVqtuHDOJNmM/Vzp7rKtvRGVsvcdUHycyOhRmYJSC5h8tyY
         6T5g==
X-Forwarded-Encrypted: i=1; AJvYcCVdJYcEhuV/2PLF3WYcVerDFtFtYSOjHJK83jXpTjkAHcXTA4RY5YTjCKiQAblX9tUpsLSE5aau3Vw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRwH6YrGI7r+1mN6pzl2dcnwH/uIiPiPbUuP+SZJZKSkKFKtEu
	5rY7N3EH/mTOcR4kOXkJELrBsR3i5qWBnr/g9XCDeYTB5CEhS1rt
X-Gm-Gg: ASbGnct4tvPzaCgX9vysr6Db9gulc9jkH3qvdmeW5zC8Cia4K2nfw9oDBgPf0X7j6mz
	9BORZnnY0SkmQIrOa7e5ou2gRyrxVl9QLcwlvq95aqkTgIRIkrLyTVA5HFN0QbrQY/l3yIkN68D
	1Je7oDM5kllxCH33Lu3GP356CxDNsbyOgIOzHnm90HmL2JZjsUzXzoqU2mr4Ul+7a1yK0erfI2T
	9aeEMasTg9uP/+JxC7phjFUkHLw4PSjFFa+FN9FZzSsQhI5ktt9gdegf4rjsMG7gpI60sE5NPXL
	hakqGn17f5ASQ7+eXe+k
X-Google-Smtp-Source: AGHT+IEUjylX5d4hRcllC3XHOATH+eFAei9THapeWXQzXTBF2jdywFhqWDPS3zZ3JNSiDptZGQmuKA==
X-Received: by 2002:a19:5e54:0:b0:545:2f0c:a29c with SMTP id 2adb3069b0e04-5452fe9306bmr2785779e87.36.1739797865997;
        Mon, 17 Feb 2025 05:11:05 -0800 (PST)
Message-ID: <ab9ac9b5-2d2f-469a-83dc-304c880cbf55@gmail.com>
Date: Mon, 17 Feb 2025 15:11:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/memory: Make resource_max_frames() to return 0 on
 unknown type
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250217102741.4122367-1-olekstysh@gmail.com>
 <24e6c348-a5c3-415e-a5b9-69d948eb15c2@citrix.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <24e6c348-a5c3-415e-a5b9-69d948eb15c2@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17.02.25 13:09, Andrew Cooper wrote:


Hello Andrew


> On 17/02/2025 10:27 am, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This is actually what the caller acquire_resource() expects on any kind
>> of error (the comment on top of resource_max_frames() also suggests that).
> 
> :(
> 
> So it broke somewhere between v3 and v8 of the original patch series,
> but I can't seem to find the intervening series on lore.
> 
> Given the comment, I suspect I got inadvertently-reviewed into this bug.
> 
>> Otherwise, the caller will treat -errno as a valid value and propagate incorrect
>> nr_frames to the VM. As a possible consequence, a VM trying to query a resource
>> size of an unknown type will get the success result from the hypercall and obtain
>> nr_frames 4294967201.
> 
> This is one of the few interfaces we have low level testing for.
> 
> tools/tests/resource/test-resource.c

yes

> 
> Please could you add a step looking for an invalid resource id and check
> you get 0 back?



Sure. I was thinking where to add this step and propose the following 
change. I will send a formal patch once I find a way how to easily test 
this change.



 From 872565da55b7e87e1664714bb1b3ee84245db4a5 Mon Sep 17 00:00:00 2001
From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Date: Mon, 17 Feb 2025 14:16:50 +0200
Subject: [PATCH] tests/resource: Verify that Xen can deal with invalid
  resource type

The sign of the presence of a corresponding bugfix is an error
returned on querying the size of an unknown for Xen resource type.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
  tools/tests/resource/test-resource.c | 16 ++++++++++++++++
  1 file changed, 16 insertions(+)

diff --git a/tools/tests/resource/test-resource.c 
b/tools/tests/resource/test-resource.c
index 1b10be16a6..197477c3f3 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -123,6 +123,22 @@ static void test_gnttab(uint32_t domid, unsigned 
int nr_frames,
          fail("    Fail: Managed to map gnttab v2 status frames in v1 
mode\n");
          xenforeignmemory_unmap_resource(fh, res);
      }
+
+    /*
+     * While at it, verify that an attempt to query the size of an unknown
+     * for Xen resource type fails. Use the highest possible value for 
variable
+     * of uint16_t type.
+     */
+    rc = xenforeignmemory_resource_size(
+        fh, domid, 65535,
+        XENMEM_resource_grant_table_id_shared, &size);
+
+    /*
+     * Success here indicates that Xen is missing the bugfix to make size
+     * requests return an error on an invalid resource type.
+     */
+    if ( !rc )
+        fail("    Fail: Expected error on an invalid resource type, got 
success\n");
  }

  static void test_domain_configurations(void)
-- 
2.34.1




> 
> 
>> Also, add an ASSERT_UNREACHABLE() in the default case of _acquire_resource(),
>> normally we won't get to this point, as an unknown type will always be rejected
>> earlier in resource_max_frames().
> 
> Fixes: 9244528955de ("xen/memory: Fix acquire_resource size semantics")
> 
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> ~Andrew

