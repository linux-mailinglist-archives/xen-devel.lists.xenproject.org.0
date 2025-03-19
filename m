Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D99A6959C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 17:58:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920977.1325017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwkN-0004Zk-Cg; Wed, 19 Mar 2025 16:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920977.1325017; Wed, 19 Mar 2025 16:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwkN-0004Xy-9W; Wed, 19 Mar 2025 16:58:27 +0000
Received: by outflank-mailman (input) for mailman id 920977;
 Wed, 19 Mar 2025 16:58:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTXv=WG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tuwkM-0004Xs-Kk
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 16:58:26 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f641886-04e3-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 17:58:25 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac25d2b2354so1227288266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 09:58:25 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e81692e670sm9264516a12.14.2025.03.19.09.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 09:58:24 -0700 (PDT)
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
X-Inumbo-ID: 5f641886-04e3-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742403505; x=1743008305; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lg26nt4JtoZFWpPpt7QijCAYWro5vRHfhsEiF3Z6eY=;
        b=EzQ5JjSot9sF3xV6mzesTxJ4kwYagmXm6WUhkLxWW8HL1d7B2QFL4dO+KhKMhca5zE
         pR/YejnLNDcT6XdCu8vfyF8EqbRrZuu68W4kiq/LtaE3qDEEFS1mjJPXbZWVcNysW4Fh
         B7GNiNbqqbNPYgH37SNavgdbTZXXSIZOrzU9V5HP3k8+PEOmeaqvI7eeA9upUlzCuLga
         tJERYw0T5hbJKkqGkmz4EgpLoWRJLWQ33R2F0RO+GJkF5lWX0g5umUGoUTpCor9XyJ+Q
         clMZg6KTOV/ydBlUKyGaVN+B38UDWa2wh4vg+VYBdAAaerPafcPNcBEt4ttcEo7bS3SH
         r+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742403505; x=1743008305;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9lg26nt4JtoZFWpPpt7QijCAYWro5vRHfhsEiF3Z6eY=;
        b=wTh8i+ZbKWgfCkAiw1iNhPeS2R/M4XhJOsHuZKEULuoLxYZCxlAjz3pOtSwm1b+9tm
         nEHFdCge7jz4KGDa9WNYeIPjpIYFt0SoTqManbdSKW5Pf3dTYUY0x4m4+dIhLSAMiM6A
         HaC1kvqY5mUTsh7ZK3lO7L21d3sIwjnHJ7LsQcUcHPwChmWOYKwdyV7jVK0UZRC8vDkM
         oLeBGi+o3uGHFiQnKEI3Uabt1oQuJlULWnQl41Z/No7GnU1/LsXbYagnAYhzhs0/1MA1
         AfbgyXQ17hTWDjTAA7j9URCqHmgT5EOYxUTH0+rA14JjbMSDGxUgDEUwpMMi9pL+eVri
         4jbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSThFKWNLkhrurbuWLyXHspz2Xde4qEnciCuwpvbx6QJdcxrPIlgGJHDAJ5pzWoypCNatdzweT6GI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6M3nFUuxntUx8rE2KkFZyH4yfb7uJyAO/igHPcZc61PbZNw4Z
	so7bWTQpmgDfTIrXbFTbDVffNzEn/d6ioPlFDP9YVqvTK9Su7NLi
X-Gm-Gg: ASbGncu3MBeH7kJbROmGwLuCC4IGTxdNJHG1tPtQlSgD07Gdm72X+jwvEe6x0Ujt/TP
	NCvyAvzRjmzdaziTSINvj8KZL3DJKEpc84i0Na0O8yeL0kcKEXxzJAIxbbILlt+fQSfYGw+LzYy
	SILpM4rKZ8E3ZBdiWl4hVfZ379kpbqcnybqve1KXwXgJRl6V9a3Zdye8YQiOl3ZIwnHga0ocPE+
	/lQe1I/47oQhDnsYOTAuw28dq10rFl9p3R60PcxBbYT7+1USc/k1/t3l2u3b3Lmmd688ZYBJiVL
	4BCijlx32V1dZ5LSQa5WlmA14r7gy5l9fjZ6jXKE43YzmymRfTJUUDI9xgTy/kT0s1F7byfauxC
	AUoRyuybvufR+4ta5pysB
X-Google-Smtp-Source: AGHT+IEOnbmc6M/94hDQ9MVa974C4JSB+0oG1bEqcKJ8a1VKMDeUrmU2ls+heMDSsifb7gMN+/yx7Q==
X-Received: by 2002:a17:907:868e:b0:ac1:e881:8997 with SMTP id a640c23a62f3a-ac3cde7f20emr31502566b.3.1742403504577;
        Wed, 19 Mar 2025 09:58:24 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------6gpUFmdDgs0Dijjl5CULfiAz"
Message-ID: <a17037ea-7a0f-4455-aa55-ac40ac58a93d@gmail.com>
Date: Wed, 19 Mar 2025 17:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen/riscv: implement basic aplic_preinit()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <6e2212313a47772d6929ae76f5e4be0f365766e9.1741709885.git.oleksii.kurochko@gmail.com>
 <9187583f-a4d0-429e-a666-113c4f8aabaa@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9187583f-a4d0-429e-a666-113c4f8aabaa@suse.com>

This is a multi-part message in MIME format.
--------------6gpUFmdDgs0Dijjl5CULfiAz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/17/25 4:40 PM, Jan Beulich wrote:
> On 11.03.2025 17:19, Oleksii Kurochko wrote:
>> Based on the code from [1] provided by Romain Caritey from Microchip
>> with some minor changes():
> "Based on", to me at least, suggests an import from some other project. The
> reference looks to be to a Xen tree though. With that, a proper description
> would then be needed here, rather than a list of differences.

Sorry, but I don't understand fully what kind of description is needed? Could
you please give me some pointers?

>> +};
>> +
>> +static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
>> +{
>> +    if ( aplic_info.node )
>> +    {
>> +        printk("XEN doesn't support more than one S mode APLIC\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    /* don't process if APLIC node is not for S mode */
>> +    if ( dt_get_property(node, "riscv,children", NULL) )
>> +        return -ENODEV;
>> +
>> +    aplic_info.node = node;
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct dt_device_match aplic_dt_match[] __initconst =
>> +{
>> +    DT_MATCH_COMPATIBLE("riscv,aplic"),
> Iirc this requires use of __initconstrel, which would also be nice to
> be put between type and identifier.

Could you please explain why do we need __initconstrel? Arm uses only __initconst
for such definitions.

Thanks  in advance.

~ Oleksii

--------------6gpUFmdDgs0Dijjl5CULfiAz
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
    <div class="moz-cite-prefix">On 3/17/25 4:40 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9187583f-a4d0-429e-a666-113c4f8aabaa@suse.com">
      <pre wrap="" class="moz-quote-pre">On 11.03.2025 17:19, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Based on the code from [1] provided by Romain Caritey from Microchip
with some minor changes():
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
"Based on", to me at least, suggests an import from some other project. The
reference looks to be to a Xen tree though. With that, a proper description
would then be needed here, rather than a list of differences.</pre>
    </blockquote>
    <pre>Sorry, but I don't understand fully what kind of description is needed? Could
you please give me some pointers?
</pre>
    <blockquote type="cite"
      cite="mid:9187583f-a4d0-429e-a666-113c4f8aabaa@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+};
+
+static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
+{
+    if ( aplic_info.node )
+    {
+        printk("XEN doesn't support more than one S mode APLIC\n");
+        return -ENODEV;
+    }
+
+    /* don't process if APLIC node is not for S mode */
+    if ( dt_get_property(node, "riscv,children", NULL) )
+        return -ENODEV;
+
+    aplic_info.node = node;
+
+    return 0;
+}
+
+static const struct dt_device_match aplic_dt_match[] __initconst =
+{
+    DT_MATCH_COMPATIBLE("riscv,aplic"),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Iirc this requires use of __initconstrel, which would also be nice to
be put between type and identifier.</pre>
    </blockquote>
    <pre>Could you please explain why do we need __initconstrel? Arm uses only __initconst
for such definitions.

Thanks  in advance.

~ Oleksii
</pre>
  </body>
</html>

--------------6gpUFmdDgs0Dijjl5CULfiAz--

