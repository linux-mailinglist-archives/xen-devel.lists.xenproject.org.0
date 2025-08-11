Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561A6B20FB9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 17:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077758.1438787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUW4-0001l7-7V; Mon, 11 Aug 2025 15:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077758.1438787; Mon, 11 Aug 2025 15:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUW4-0001i0-4V; Mon, 11 Aug 2025 15:32:52 +0000
Received: by outflank-mailman (input) for mailman id 1077758;
 Mon, 11 Aug 2025 15:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOyo=2X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ulUW3-0001ht-4C
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 15:32:51 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ea14f85-76c8-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 17:32:47 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-af8fd1b80e5so788478166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 08:32:47 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c10asm2057887066b.116.2025.08.11.08.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 08:32:45 -0700 (PDT)
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
X-Inumbo-ID: 6ea14f85-76c8-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926366; x=1755531166; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziDdkQh8q6dHIk2Ps8yc+L8q/2MsULl1nXOuEdpM3T8=;
        b=OhBNVwS6dUwE7mh5iQq9yE8Xx/cIfusieCWlU53qts11FQzipKJMlPlXbgruuiopPx
         SR68T4X2ftuNU563q0i0mha4MAkiVC7mIGCXRgEB4plIE9wnpOj4/a1DuPkf/WEMeftk
         4HTnNbG4iYU5y/Ep8vL2yR5tqUvD4mataIBOJwDbVd6QwlczZAJ+30dbTZGvTQpYPgW7
         DG3TN5WLTFzJilkEPYjWyjQKpdSYwn4LKnRiylZOqrz8pYjVB6JuRkM+kIND1iOTRARq
         zQ6etr1ybh/0A7pQCBNV871xdXrh9+y+zScf+xu7kwaHPfOf52/6ay5egH8lD0Hz761p
         qvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926366; x=1755531166;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ziDdkQh8q6dHIk2Ps8yc+L8q/2MsULl1nXOuEdpM3T8=;
        b=vtrE0fGm90aPAL5v8ribUtfu7F6GoSGGjtFstq87Mpg6EB7KoNXmBp7hAD0yvA5Hcu
         I1GuO2DVDulwPQED7FRb9To1X9AKj2rd184JobHeM54JRe9IPwygwvDLbdauPdAvpkTe
         naZDqrDQWZJCo9WpHRdAr+SYaRX8KT02O0dbfQnHMTM3rEfwXpPrpDz5cSNS/cg6DXNI
         GPlnn9BwFLFMvBkfFNrr8Xiqwf0DsNUcQlJUc6E5M/vTwIwyCTlEWQ2lLX80enqUtT6P
         SpP5BCM0le8lfXzpWPgTsVVWVcDs/rAfFeUZO6q8G3DfISOilUesHc8DtipcT/6h2/L4
         +2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVUoHzBWiSXJOT9MVzD+sXLjUdR32ycxq+4maRswcrPgwQNR8gbkI1q2R9MZfm1yz40QfI6l6I3TRU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8GzDJJ+awHlhA1wAeGG9QPBrgcBXjiP+86nd1VH7OqXxliCCa
	JyrofOPfrw0WUguRAqbIG+vsYrNmeekIk+Zh/LqX0/2nMN9+ZosUIabb
X-Gm-Gg: ASbGnctr7AfQE9l6DLiBL0CM1lJahHNhoOYH/GZ8Lx/HeJU+yhdpOKvBW+b/HctTSeW
	Le3ZTtCpHuXQIT9jVgw9KqOWq08sp5r+N/4d+obnHD4NlC1sNlDfgLfGV21100TZuOytM+mcJhN
	2eTZrqzYnxQ0/eOjS++1Hb5QBcfCoUakhMlJbKLB4VAsEY3x3/0+6GbGUn7HZbaXtTlU14+lccX
	ut9ivXreC5mLcMm8iMbY3hF+DBnuAHSA4orh0ZFrzf2d70TC8k7T+H12BEIK2Jre7aBLQVaHTsp
	V048owHg1x2dQlaDwE1hHgVYrROf7Y9fVc8kvGCP2IfBmZdncpqT400Yc8/sHDriIjFgYAH8359
	JXyapb7Lb8V1lEOH41NI/yDxH5zTryoQ9/R/TDO4YIGCAqdGUZtLsshKxoGjYTceYBHfug5N8
X-Google-Smtp-Source: AGHT+IHx3UbjOsI0GMujjkseLIlVnKxzLBwM8lJKYSoAhdymLRjNqV3ce0oY9uDWrwCSGDRJ4v6uAg==
X-Received: by 2002:a17:907:3e8d:b0:af9:116c:61cf with SMTP id a640c23a62f3a-af9c64d27f8mr1350286466b.43.1754926366210;
        Mon, 11 Aug 2025 08:32:46 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------KGZgshcsqRJ4OnlYYHHF9wFX"
Message-ID: <fe1cf58d-b00b-4a49-adc0-4738e6b2c2f8@gmail.com>
Date: Mon, 11 Aug 2025 17:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/20] xen/riscv: implement put_page()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <7a7c07d431fc943e655216d389322638a640b2cd.1753973161.git.oleksii.kurochko@gmail.com>
 <aaf27a60-9f3c-4b4b-bad1-ace6f24260cf@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aaf27a60-9f3c-4b4b-bad1-ace6f24260cf@suse.com>

This is a multi-part message in MIME format.
--------------KGZgshcsqRJ4OnlYYHHF9wFX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/25 2:43 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> Implement put_page(), as it will be used by p2m_put_code().
> I would have ack-ed the code change, but the description is irritating:
> Who or what is p2m_put_code() (going to be)?

It should be p2m_put_*-related code.

>
>> Although CONFIG_STATIC_MEMORY has not yet been introduced for RISC-V,
>> a stub for PGC_static is added to avoid cluttering the code of
>> put_page_nr() with #ifdefs.
> There isn't any put_page_nr() being introduced (anymore), though.

I'll correct the commit message, it should be put_page() here.

Thanks.

~ Oleksii

--------------KGZgshcsqRJ4OnlYYHHF9wFX
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
    <div class="moz-cite-prefix">On 8/11/25 2:43 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:aaf27a60-9f3c-4b4b-bad1-ace6f24260cf@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Implement put_page(), as it will be used by p2m_put_code().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I would have ack-ed the code change, but the description is irritating:
Who or what is p2m_put_code() (going to be)?</pre>
    </blockquote>
    <pre>It should be p2m_put_*-related code.

</pre>
    <blockquote type="cite"
      cite="mid:aaf27a60-9f3c-4b4b-bad1-ace6f24260cf@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Although CONFIG_STATIC_MEMORY has not yet been introduced for RISC-V,
a stub for PGC_static is added to avoid cluttering the code of
put_page_nr() with #ifdefs.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
There isn't any put_page_nr() being introduced (anymore), though.</pre>
    </blockquote>
    <pre>I'll correct the commit message, it should be put_page() here.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------KGZgshcsqRJ4OnlYYHHF9wFX--

