Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B370B3E5BB
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104809.1455841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4np-0004R6-20; Mon, 01 Sep 2025 13:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104809.1455841; Mon, 01 Sep 2025 13:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4no-0004Oc-VY; Mon, 01 Sep 2025 13:42:32 +0000
Received: by outflank-mailman (input) for mailman id 1104809;
 Mon, 01 Sep 2025 13:42:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOk3=3M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ut4nn-0004OW-Ia
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:42:31 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 814f798e-8739-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 15:42:30 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso7427823a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 06:42:30 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc214bacsm7423614a12.16.2025.09.01.06.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 06:42:29 -0700 (PDT)
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
X-Inumbo-ID: 814f798e-8739-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756734150; x=1757338950; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hhw3UBPRNy0F2MJaz1C8wYQ0dbUgJQ39KZSUREKvcBE=;
        b=FevgZD7CIyQUl/N2XIagUCgfvJwgEFz1QiE6vJ8CIVHtSI7fjbklBw479nUBuv7+/N
         3tRgE9wQMJsLBj9MUM/cT4mTg7RAYn2sp5veI+XCrQ1u/nGJybWaV21rnQJTppfU5QfM
         GUD+9POyxpXNa+VNv7BV4/D+HiVhyNaqIPbc1iLb6pcCS553qmB6s7sM+GToilH1Ah4a
         q9elKAm/mtJnxFlkv5Cer62HxpvkHTtKo2wd1Kkve3b2CVCwsygVgc4INGnytWExm3+e
         8gr1BjGKe6qshCT5zsWERgQNzMKPyb2zgcwt0jDYmYKewv1MBZy3WwCxe5z/YV3CV7b2
         fing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756734150; x=1757338950;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hhw3UBPRNy0F2MJaz1C8wYQ0dbUgJQ39KZSUREKvcBE=;
        b=TF/Ci0ZRaVcPj4Thkso98ObkkipH3/fHFpTU6TQI5vB+zKnXQWSyOrGLzT7tfRraMz
         mCtn0YNx0dzcDLRg5iCcDaBGjG2xGaj7roasKJ9M0noKP0Vcpd/twQ/WiusmHy5sJptg
         IVGfoXwNEzCttuT9E7sxNbzpq6qTbQqdidLtB0Ht82YiKzKQpS9i2LHz/763qYtU1g/p
         2dRkjjnuf0kPwgPsZvIfxhH/4a+34+NCsc6Utj/akPnal2tXI2uWhss6wMN3qec5NuIC
         5LLcboK1jNWbdMrXZWHIRs2c9oCx7dkQebMxKBL0Ll2tsgR6pMRmFOGZeohQG4/rPN9F
         S+2g==
X-Forwarded-Encrypted: i=1; AJvYcCXVokITA4hiUQRW8uQqovLPoBTgltodvJ5blcDBZ1TOBDImRWAeHfEB+LVpXByXI7zRsaX3PhtwJEo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5xyNMIP63m3rb5P7mPhrbx61viPKkJS89YVznE4XusPdzxe1z
	SFcMEw+5nCbszkYexdw+8sQe1VDJWewRXv5f/l5B5obKvTQ74Q6TYWDXlkmYMQ==
X-Gm-Gg: ASbGncuoalvwwTh2anJlpNfvTB70mvvDKToCehQaRVFRwU7QSCRmDt/kUqQcD2ae6cG
	D7PSxIJNmlwZFHswbX506WiOenzEv3033UfnhFdw6cfz0CF2oLexjdhEQ+i9MY32bkrhvo3o4ey
	RYciwNUnJ6d1CDiUUu7LQ9+E2Iqg3vKGkq131x0CYMvpeyxOXm5Rp8lY6oaYtjXHiyApMs6HydI
	tzma3s5fNM/zhJ7OSsBPyGMO1dcor+O5HBCurM2RFUCrBYLQ86Krqd4kLSGegleHrKeKhExWabP
	8kp753IPeCSVGihVJp3mepjDImTzitKyUGpv6SiK4hU8i9UaAebXP2utOvcx/vejDbLxr0eeQJw
	xLHh6182Jgl+zlkncj9ZdSjJCX6C/z0ObSNFgLcgRXhONWW/Htz4NkpFRmpyNwNFOcO45wF4=
X-Google-Smtp-Source: AGHT+IHGN5E9Cd8W03pN+9DDfJF2+EhUQT82qjoCdzi4TFPP3vq5jQyKsVP/h3zqSVQXQRMeRDLJNQ==
X-Received: by 2002:a05:6402:504b:b0:618:aed3:38a with SMTP id 4fb4d7f45d1cf-61d26ebbf9fmr6551311a12.31.1756734149542;
        Mon, 01 Sep 2025 06:42:29 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------nupsem2UgoMYGXQO7druMN0S"
Message-ID: <f688714e-45a2-4bbd-9955-f7bb678d6f46@gmail.com>
Date: Mon, 1 Sep 2025 15:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 3/3] CHANGELOG.md: Add SMBIOS 2.6 update
 statement
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>
References: <cover.1756460430.git.teddy.astie@vates.tech>
 <301a84287488629932950c1cefef3a97c3d9ba0d.1756460430.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <301a84287488629932950c1cefef3a97c3d9ba0d.1756460430.git.teddy.astie@vates.tech>

This is a multi-part message in MIME format.
--------------nupsem2UgoMYGXQO7druMN0S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/29/25 11:58 AM, Teddy Astie wrote:
> Signed-off-by: Teddy Astie<teddy.astie@vates.tech>
> ---
> v2:
>   - introduced
> ---
>   CHANGELOG.md | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8c4435c181..80a8273d7e 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -34,6 +34,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
>        Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
>        and 28 (Temperature Probe).
> +   - Updated SMBIOS version to 2.6.

Generally looks good to me, but I think it would be nice to add a short explanation why it was done.
Something like:
  - Update SMBIOS to 2.6 to fix UUID endianness mismatch with OVMF and ensure consistent
    Linux guest UUIDs.
Does it make sense?

~ Oleksii


>   
>    - On Arm:
>       - Ability to enable stack protector
--------------nupsem2UgoMYGXQO7druMN0S
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
    <div class="moz-cite-prefix">On 8/29/25 11:58 AM, Teddy Astie wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:301a84287488629932950c1cefef3a97c3d9ba0d.1756460430.git.teddy.astie@vates.tech">
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Teddy Astie <a class="moz-txt-link-rfc2396E" href="mailto:teddy.astie@vates.tech">&lt;teddy.astie@vates.tech&gt;</a>
---
v2:
 - introduced
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8c4435c181..80a8273d7e 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -34,6 +34,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
      Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
      and 28 (Temperature Probe).
+   - Updated SMBIOS version to 2.6.</pre>
    </blockquote>
    <pre>Generally looks good to me, but I think it would be nice to add a short explanation why it was done.
Something like:
 - Update SMBIOS to 2.6 to fix UUID endianness mismatch with OVMF and ensure consistent
   Linux guest UUIDs.
Does it make sense?

~ Oleksii

</pre>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:301a84287488629932950c1cefef3a97c3d9ba0d.1756460430.git.teddy.astie@vates.tech">
      <pre wrap="" class="moz-quote-pre">
 
  - On Arm:
     - Ability to enable stack protector
</pre>
    </blockquote>
  </body>
</html>

--------------nupsem2UgoMYGXQO7druMN0S--

