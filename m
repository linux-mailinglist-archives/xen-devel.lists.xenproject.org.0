Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FD0A6F1AF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 12:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926343.1329191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2Nq-0004B3-QG; Tue, 25 Mar 2025 11:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926343.1329191; Tue, 25 Mar 2025 11:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2Nq-00047v-MD; Tue, 25 Mar 2025 11:23:50 +0000
Received: by outflank-mailman (input) for mailman id 926343;
 Tue, 25 Mar 2025 11:23:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogJ6=WM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tx2No-00047p-Gf
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 11:23:48 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e736de1-096b-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 12:23:47 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab771575040so1256068566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 04:23:47 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac6932e843asm420410866b.83.2025.03.25.04.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 04:23:46 -0700 (PDT)
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
X-Inumbo-ID: 9e736de1-096b-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742901827; x=1743506627; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peg0EU7I7tp0ADX2CzLT4SbzlFxlYVi4682cqDy2Eqw=;
        b=cvOXvG2g4L3OJQpYtbHFxeIX5Vhowm1dci5ucusLjO7ZsbukimYOp44pQPc6vHfEcB
         BpV15qHDAJ1wSkBGgmpwdQkh0a6MA5rWUT6xu1MN5wmamdVWkbPw+3XVv8YOVeC7cnut
         qwc2js8zgISnIdBjVrVFSpnNFEeqzbUBjd3O0C4PqBqJypZyxIeBs8xqdZYK8dCtMOVh
         fl05UobxYWIWF6541mloxdMh3f/fYbO4eSPhWQ9chB5qKJAssqQ8JwRtbu5Mfb3CzKQc
         lhZXY9TCb10hOpS2ILN+U8lvxkZYfBR48y7pqlbBfkeR3rf2SAWlgPGjkDZYy6iXGKeJ
         OhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742901827; x=1743506627;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=peg0EU7I7tp0ADX2CzLT4SbzlFxlYVi4682cqDy2Eqw=;
        b=qbU0jxFift0LGnR+Jas1df9ovLvwHRWJnkQM01NEFL4bY5T3M6WcRD6k+obvfBE88v
         /+BnDQzq5F8wgm2y0rQGoU/L5rEWSvG/vsdh3qmdXgH5c+qZZzQ/ezEvBNc+jpEEtGDI
         NmcNSS/QEmKy0omo5oMkR+VYSu/wbOBvzaFcqEg0gxgtz2OudrINRR3BwTMj0LCX8QLJ
         wA4dC3gogLwJQcl06XzW7lAvRHe/7NAoNb9RPizEcC75Z7PX+Ge8THmfSdNDdM7YG94d
         hvSqnIoBYPezdyT+PQ/0qjZy05ThGbnLh1qjRuLbuJE1ng65dJ7zAjvNfz1J417Y5H7G
         +tBA==
X-Forwarded-Encrypted: i=1; AJvYcCVCN0NgA4wVlkAP4Ane2GbyOto64d+fy1Xwh6+IUePqz6MsrsY20YQh0dbvTb0mpBaBZTbi4zQ13L4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxng0ZqBHh2rOn0wgAajrnLkGc4ii272bGWckRAqAVSsr2MxMh6
	TxyT5YUm6iQWIhrg3KX5HcJlHwSyPjYECXrmw6dT52iPh22vplX+
X-Gm-Gg: ASbGncvrjFleTo7A754cwH50pDDHJ3R3mbhRzwm8fV4jKprnAl6hsYet4uJBJdzWmWI
	89GqjkzDyLR5HOFxaWYQBGWUBv/tukqeEABQEe48x2d9pI79M9F1817ZKX4Tz7y6ryAMT7v+X8r
	7fhlv1Lokmqr/nmXytvHrH5iNB67C7QVw1YM9463I7toR1byBw9d0CKuRiYgYd6qjfveDbtXM/V
	7OYEXy5spq0IwIRVqCXqx74Joz96L514L08Nyn9yuUirfWTYmb0xszvTvZg5/Mhx88AplQQugvI
	bFShfHBG6xy5qZMX6uKu4uz5l8bSAp3YIwJK6jwzKeRKBU6n+1qaGDxktPkxUe3gr4dmbyiQjeW
	aPpwkWULWjHkop/lLQLXy
X-Google-Smtp-Source: AGHT+IEoIF9Jh7K2nXYti9K5Bx+koJD8MMzJApAMOH2NoIWbKJ9ZkdyyVfsZz8ahpbTR5AUthOOd6Q==
X-Received: by 2002:a17:907:94cb:b0:ac3:92ac:9364 with SMTP id a640c23a62f3a-ac3f011c346mr1345248166b.10.1742901826497;
        Tue, 25 Mar 2025 04:23:46 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------c5t02dRZKQohbSrtIF0w5fkr"
Message-ID: <b0083a5e-2395-4c94-b6b1-8fd8459ad043@gmail.com>
Date: Tue, 25 Mar 2025 12:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/riscv: introduce preinit_xen_time()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com>

This is a multi-part message in MIME format.
--------------c5t02dRZKQohbSrtIF0w5fkr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/17/25 4:24 PM, Jan Beulich wrote:
> On 11.03.2025 17:19, Oleksii Kurochko wrote:
> +static __initdata struct dt_device_node *timer;
> +
> +/* Set up the timer on the boot CPU (early init function) */
> +static void __init preinit_dt_xen_time(void)
> +{
> +    static const struct dt_device_match  __initconst timer_ids[] =
>
Do we need here __initconstrel too? (the same as we need for
aplic_dt_match[] in patch3)

~ Oleksii

--------------c5t02dRZKQohbSrtIF0w5fkr
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
    <div class="moz-cite-prefix">On 3/17/25 4:24 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com">
      <pre wrap="" class="moz-quote-pre">On 11.03.2025 17:19, Oleksii Kurochko wrote:
+static __initdata struct dt_device_node *timer;
+
+/* Set up the timer on the boot CPU (early init function) */
+static void __init preinit_dt_xen_time(void)
+{
+    static const struct dt_device_match  __initconst timer_ids[] =

</pre>
    </blockquote>
    <pre>Do we need here __initconstrel too? (the same as we need for 
aplic_dt_match[] in patch3)

~ Oleksii
</pre>
  </body>
</html>

--------------c5t02dRZKQohbSrtIF0w5fkr--

