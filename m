Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FFAA3D486
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 10:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893691.1302559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2ke-0007zD-PJ; Thu, 20 Feb 2025 09:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893691.1302559; Thu, 20 Feb 2025 09:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2ke-0007xn-Mh; Thu, 20 Feb 2025 09:21:48 +0000
Received: by outflank-mailman (input) for mailman id 893691;
 Thu, 20 Feb 2025 09:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tl2ke-0007xh-2P
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 09:21:48 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b408ec8-ef6c-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 10:21:46 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5452ed5b5b2so788265e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 01:21:46 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545637f0e14sm1599363e87.86.2025.02.20.01.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 01:21:45 -0800 (PST)
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
X-Inumbo-ID: 1b408ec8-ef6c-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043306; x=1740648106; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hHh7WNv2GKgw/2U5zj0LlpXMq2VUhBTHIQKbEWWS/8=;
        b=VdP/sgRuAXFHKyY+pg2HhneGDivQb8lXhPJVpOYzSnIjUUInZQvRpuMXALZbHapYd7
         OR37C6Ev0htUc2IRjCF6Jf4K7CI0L9qiq4lHU1vF4LP3dGk0OGeM/1i/bFj709F2GkrE
         9b43HWKstVoEvDHImLM+hHx4sWziU/bTELYMNVS+Qu7zcgjl+Tq7y/2GDBgrkaFdj91G
         n08l9xlYtBimLZ30/wtldHwKc3M+RB0iIAZTWgvratLg689VczMNd+nhdVExHm3U5Rdo
         a8Vgr2hKD4e6qPkkkWOxfFE4mdjQffeMWrtfioZCYC3oYzz8Ul9BjzI8VLezUmlV9Dcp
         VdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043306; x=1740648106;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3hHh7WNv2GKgw/2U5zj0LlpXMq2VUhBTHIQKbEWWS/8=;
        b=c9gDAIQe9u6Gu2YCbZvyU+vXf5l8aexabsh0UH19Fc5U3Jwcp9lIqd9Bq8JDqGIp+E
         QrT5vkIcB4+zCbuSFtL0ouVAKc90GaTtq59TWJY5QiR211u10UiCMB+tu43PsNWqxfuA
         XmEZv+KZK3N1xag7R/4dGI06+uNgN4iJT8sZr561I/o3rqpnvc9mOKVvoVo9TB3hEGaQ
         AdTkxUmhQ9X8XoOfV/WMPzKTtX0UswaxPwaP9J6LwRmEI3qhzzkKw+7L2PWsu+FmQl7s
         gEdUIh2SQAFaXV52yNoLWlqYn3YaUr2/eYt/oKYz7z5iM3CpfezuuJuQiSsQB1uGcXO7
         46IA==
X-Gm-Message-State: AOJu0YwG1ZnLhS9pTx3yiWJ8Gt4Nw5lYUTLI+ICpWKMinJI96rphItMG
	R3iS9Mi1gCA33bsvF/xcImY73kyzHJ0frdW3tSlodGvVq57xQu3f
X-Gm-Gg: ASbGncvRLQAHpbapc7AZx/ybYAh8Hi+HbV2w+71O/wO9TbjwMA8lask/kT58/vAzmAc
	/EwtjVcaE0+U06+oWyTb+0idK4Vq94p5VLbHQOFH/pcJtF6P2EDToP9EiHvVh1C6N0K2xMUVR+r
	LBuqqG2g8ucvyywl5CRKbnSE80iDZyA4tQzduVwSSCrsU7WwU7lUy1TPOwRYyFJG6BZrlm9wHvH
	xyaaz0InG8mjCqHaoRRJU26bVHHx+5Rpd7bJMzix0X58CLmBKcfQsv3QVdoK+xfdl1WsavacQQy
	nn0fCKcb8Hg8R6+4jcdtvkqg
X-Google-Smtp-Source: AGHT+IFbRRMzw373tm1TDU3t/tmjkb7Ygv4n5Zu3Do+OKUuonwez027rBSaowUNJv/Vjyh4eSRGBrg==
X-Received: by 2002:a05:6512:33ca:b0:545:16d3:3bd4 with SMTP id 2adb3069b0e04-5452fe79c0cmr6611912e87.53.1740043305560;
        Thu, 20 Feb 2025 01:21:45 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------OkksGcV0VroETC0R1ZAy6ScI"
Message-ID: <6dda7f58-ca4f-4cd9-b2fb-e1adf711951b@gmail.com>
Date: Thu, 20 Feb 2025 10:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Create GIC node using the node name from host dt
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250219172946.359234-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2502191825060.1791669@ubuntu-linux-20-04-desktop>
 <18e030b4-8268-497e-b42c-f0d920fcb9c7@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <18e030b4-8268-497e-b42c-f0d920fcb9c7@amd.com>

This is a multi-part message in MIME format.
--------------OkksGcV0VroETC0R1ZAy6ScI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/20/25 9:00 AM, Orzel, Michal wrote:
>
> On 20/02/2025 03:26, Stefano Stabellini wrote:
>>
>> On Wed, 19 Feb 2025, Michal Orzel wrote:
>>> At the moment the GIC node we create for hwdom has a name
>>> "interrupt-controller". Change it so that we use the same name as the
>>> GIC node from host device tree. This is done for at least 2 purposes:
>>> 1) The convention in DT spec is that a node name with "reg" property
>>> is formed "node-name@unit-address".
>>> 2) With DT overlay feature, many overlays refer to the GIC node using
>>> the symbol under __symbols__ that we copy to hwdom 1:1. With the name
>>> changed, the symbol is no longer valid and requires error prone manual
>>> change by the user.
>>>
>>> The unit-address part of the node name always refers to the first
>>> address in the "reg" property which in case of GIC, always refers to
>>> GICD and hwdom uses host memory layout.
>>>
>>> Signed-off-by: Michal Orzel<michal.orzel@amd.com>
>> Reviewed-by: Stefano Stabellini<sstabellini@kernel.org>
>>
>> While this fix changes behavior for everyone, so it is risky at RC5, it
>> also fixes bugs with DT overlays, but that is an experimental feature. I
>> am in two minds whether it should go in right now or not. Maybe I would
>> wait until 4.20 is out and commit when the tree reopens.
> Technically this is not a bug, hence no Fixes tag. I'm fine with this patch not
> landing in 4.20. That said, I don't agree with what you wrote about a change in
> behavior. There is no functional change at all. Only the node name change. It
> could impact only those OSes that parse by the exact name which would be super
> irrational and wrong. The only way one should parse intc is by searching for
> "interrupt-controller" property as written in DT spec.

I would prefer to have this changes when the tree reopens.

~ Oleksii

>>
>>> ---
>>>   xen/arch/arm/domain_build.c | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 7b47abade196..e760198d8609 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -1615,6 +1615,7 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
>>>       int res = 0;
>>>       const void *addrcells, *sizecells;
>>>       u32 addrcells_len, sizecells_len;
>>> +    const char *name;
>>>
>>>       /*
>>>        * Xen currently supports only a single GIC. Discard any secondary
>>> @@ -1628,7 +1629,11 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
>>>
>>>       dt_dprintk("Create gic node\n");
>>>
>>> -    res = fdt_begin_node(fdt, "interrupt-controller");
>>> +    /* Use the same name as the GIC node in host device tree */
>>> +    name = strrchr(gic->full_name, '/');
>>> +    name = name ? name + 1 : gic->full_name;
>>> +
>>> +    res = fdt_begin_node(fdt, name);
>>>       if ( res )
>>>           return res;
>>>
>>> --
>>> 2.25.1
>>>
--------------OkksGcV0VroETC0R1ZAy6ScI
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
    <div class="moz-cite-prefix">On 2/20/25 9:00 AM, Orzel, Michal
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:18e030b4-8268-497e-b42c-f0d920fcb9c7@amd.com">
      <pre wrap="" class="moz-quote-pre">

On 20/02/2025 03:26, Stefano Stabellini wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

On Wed, 19 Feb 2025, Michal Orzel wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">At the moment the GIC node we create for hwdom has a name
"interrupt-controller". Change it so that we use the same name as the
GIC node from host device tree. This is done for at least 2 purposes:
1) The convention in DT spec is that a node name with "reg" property
is formed "node-name@unit-address".
2) With DT overlay feature, many overlays refer to the GIC node using
the symbol under __symbols__ that we copy to hwdom 1:1. With the name
changed, the symbol is no longer valid and requires error prone manual
change by the user.

The unit-address part of the node name always refers to the first
address in the "reg" property which in case of GIC, always refers to
GICD and hwdom uses host memory layout.

Signed-off-by: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Reviewed-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>

While this fix changes behavior for everyone, so it is risky at RC5, it
also fixes bugs with DT overlays, but that is an experimental feature. I
am in two minds whether it should go in right now or not. Maybe I would
wait until 4.20 is out and commit when the tree reopens.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Technically this is not a bug, hence no Fixes tag. I'm fine with this patch not
landing in 4.20. That said, I don't agree with what you wrote about a change in
behavior. There is no functional change at all. Only the node name change. It
could impact only those OSes that parse by the exact name which would be super
irrational and wrong. The only way one should parse intc is by searching for
"interrupt-controller" property as written in DT spec.</pre>
    </blockquote>
    <pre>I would prefer to have this changes when the tree reopens.</pre>
    <pre>~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:18e030b4-8268-497e-b42c-f0d920fcb9c7@amd.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">---
 xen/arch/arm/domain_build.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7b47abade196..e760198d8609 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1615,6 +1615,7 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
     int res = 0;
     const void *addrcells, *sizecells;
     u32 addrcells_len, sizecells_len;
+    const char *name;

     /*
      * Xen currently supports only a single GIC. Discard any secondary
@@ -1628,7 +1629,11 @@ static int __init make_gic_node(const struct domain *d, void *fdt,

     dt_dprintk("Create gic node\n");

-    res = fdt_begin_node(fdt, "interrupt-controller");
+    /* Use the same name as the GIC node in host device tree */
+    name = strrchr(gic-&gt;full_name, '/');
+    name = name ? name + 1 : gic-&gt;full_name;
+
+    res = fdt_begin_node(fdt, name);
     if ( res )
         return res;

--
2.25.1

</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------OkksGcV0VroETC0R1ZAy6ScI--

