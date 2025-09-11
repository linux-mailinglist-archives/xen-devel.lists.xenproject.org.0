Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B790DB52A71
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 09:48:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119493.1464826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwc2j-0002ay-5J; Thu, 11 Sep 2025 07:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119493.1464826; Thu, 11 Sep 2025 07:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwc2j-0002YC-2Z; Thu, 11 Sep 2025 07:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1119493;
 Thu, 11 Sep 2025 07:48:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8rd=3W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uwc2h-0002Y3-TT
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 07:48:31 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4ee4953-8ee3-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 09:48:29 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b04271cfc3eso49158666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 00:48:29 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd47bsm74004666b.58.2025.09.11.00.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 00:48:28 -0700 (PDT)
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
X-Inumbo-ID: b4ee4953-8ee3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757576909; x=1758181709; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OiiKyOJFvu6X5z3RLlId/CdIpqvtrIsJnYhRupUhuc=;
        b=jt9nMAYZep88oDS9pFHT0qwLDvmEJ9riyLavdvb7Fc6BhHOUnqyXBjfxHEuHmGK5HB
         X4g8Bf3QN27Ya6D9Ldu7527MxkcOelOmxu1XR6ckJAR/q0kCzc1BFge3q4CpTgkknVSt
         wMeEhm3Ib2kKOh+Gw8F3pi5SaUqw/4vdDI//x5QI1YoS9llepvL1EeQlxTpRU4BIRJuM
         WzP2e1P6iKsSB0dpzoGyWjj9B1Sjwdd/AjZM2Sib1mSxlMA98j/XVjMfQ3cFNgb69+dY
         mLOxkDY82EdWWssPeuGoy2TDyOi/hYAXDALRbzlHTJK+VydtGUvzoOtPXvO5ri9KPPms
         eTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757576909; x=1758181709;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3OiiKyOJFvu6X5z3RLlId/CdIpqvtrIsJnYhRupUhuc=;
        b=Qh64NiNGiqeveIDdm/OcVOGQNQIgoels+nM/me4Z8afMIB7TQIJ2dRumCgrzhlFQfI
         c5aMb4iVWVA51GS8MT246HMoNVnjXbCbEtb6N98/Fi/UBboVixu5ZIm/h71ZmWXHOvru
         OPgS8kTYJ1r7WnTT+oiY9CwSeuH/fgVx+CqqHMtkDb/Ty3hP8P6u6+3BXgmH63KzZLX6
         UccIG7WfuEQf4G5OXjXbp7xSX3CUJs7uCa4jl5LKshFsJI8YwYCcuElXX53p83yXndKc
         ak9DSCbjlEsgq/mbz4sRadU6EDe8b3o8K2Qh7oL65NEbqjemLTM4HJ4X+Um8JPeHGIAs
         GNfw==
X-Forwarded-Encrypted: i=1; AJvYcCWKIccyCGnmZ+DtLg7OwFgxsHjvPPVCaJ+VKjzbmUro6+mEfea93b8YyGGZWYP0n73g9tzAGnGcTDs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxhh8eJ4KP+uuO0zDFWhrk/R7Y0mI8jBi/Enjq2YumjTJUHWK3E
	a/gBen/A/oW0qgrsgBhZZF/uAF2iu6NwKtsk4/bYHJ6FLMOgeHbeh9kE
X-Gm-Gg: ASbGncs9DmMTdhADw5KZxIenANxuD5PrC4T1JSnrPh5LAyVQnEmqkcQqJy6ENt5POnV
	IT4aqmoJLlZKoQ+wj8iLCyMFiojzAbtkVnF3fLvQUXlI4lEUNXtLXtMAhesh12ncnO/++rMhCo1
	292TZ16+ReQF8cEHp5QY2rKX/pXTPY24f3SmrzqYZMmyTrAJXqX89Rxp3fEYPV5lQZdrqN3qqW5
	HTxCir27YlMI58s9NaY3kNUUZJmHmG++ePqo79vnjvQte41yCmblOBzCEnovpVtM6pUcwzeQLU2
	Sk4IWFetgn2OHM5FdUoSxVjFHMcOG/CygerFAE14LQ65zcs7LeOqi4aAGFiE8lgl5kPPZJdjRCX
	8WuuZGgv9XG4GH1g/YHmcbdvdlbIYNKGTfytaPG0jjoZ+0hWnR56m7l70gQy7DXASd0FumCc+Ev
	xFcUVarZI=
X-Google-Smtp-Source: AGHT+IGk8SQOHJgNbkyjJVrzJcbajCl74dCdOvXFBC/bfymBLqk8YIRaQjtESD1XgTI3lS3LgdLEqw==
X-Received: by 2002:a17:907:9810:b0:b04:a1ec:d073 with SMTP id a640c23a62f3a-b04b1437db2mr1808993766b.18.1757576908567;
        Thu, 11 Sep 2025 00:48:28 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------tBtFFG0xJgK5YRGK3Yb0Ut2a"
Message-ID: <f114731c-7a67-4b24-a6bb-12575733cc9b@gmail.com>
Date: Thu, 11 Sep 2025 09:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 0/5] CI: Add Debian Trixie
To: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>, Victor Lira <victorm.lira@amd.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
 <aMAUJehaWkYyyM-E@mail-itl>
 <alpine.DEB.2.22.394.2509091452200.1405870@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2509091452200.1405870@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------tBtFFG0xJgK5YRGK3Yb0Ut2a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/9/25 11:53 PM, Stefano Stabellini wrote:
> On Tue, 9 Sep 2025, Marek Marczykowski-Górecki wrote:
>> On Sat, Aug 09, 2025 at 11:12:01PM +0100, Andrew Cooper wrote:
>>> I know it's past the last-post deadline, but Trixie was only released today.
>>>
>>> In terms of backports, we should at least go back to the bugfix branches.
>> What is the state of this series? I'm preparing refresh of my various CI
>> series and some add more jobs on debian-12 - I wonder if I should make
>> them debian-13 already - but for this I need this series committed...
> I have been too busy reviewing the non-gitlab patch series for the
> feature freeze last Friday and we have a couple of series still to
> process.
>
> Maybe gitlab-related series could be committed also past the feature
> freeze.

It makes sense to me. And I think we had such conversation somewhere else.

~ Oleksii

--------------tBtFFG0xJgK5YRGK3Yb0Ut2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/9/25 11:53 PM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2509091452200.1405870@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">On Tue, 9 Sep 2025, Marek Marczykowski-Górecki wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Sat, Aug 09, 2025 at 11:12:01PM +0100, Andrew Cooper wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">I know it's past the last-post deadline, but Trixie was only released today.

In terms of backports, we should at least go back to the bugfix branches.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
What is the state of this series? I'm preparing refresh of my various CI
series and some add more jobs on debian-12 - I wonder if I should make
them debian-13 already - but for this I need this series committed...
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I have been too busy reviewing the non-gitlab patch series for the
feature freeze last Friday and we have a couple of series still to
process.

Maybe gitlab-related series could be committed also past the feature
freeze.</pre>
    </blockquote>
    <pre>It makes sense to me. And I think we had such conversation somewhere else.

~ Oleksii
</pre>
  </body>
</html>

--------------tBtFFG0xJgK5YRGK3Yb0Ut2a--

