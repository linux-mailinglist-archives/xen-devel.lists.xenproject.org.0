Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9AA38A63
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 18:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890758.1299895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4eb-0000q1-Ja; Mon, 17 Feb 2025 17:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890758.1299895; Mon, 17 Feb 2025 17:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4eb-0000nP-G3; Mon, 17 Feb 2025 17:11:33 +0000
Received: by outflank-mailman (input) for mailman id 890758;
 Mon, 17 Feb 2025 17:11:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0TS9=VI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tk4eZ-0000nJ-4d
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 17:11:31 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a3acce2-ed52-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 18:11:29 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-543e49a10f5so4884267e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 09:11:29 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545294727f3sm1320451e87.229.2025.02.17.09.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 09:11:27 -0800 (PST)
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
X-Inumbo-ID: 3a3acce2-ed52-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739812289; x=1740417089; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ9/J9h35ilWXRxsKVW+JVYYvP7a3v8B/uJdQKMSq/Y=;
        b=hOxm9zBAzaUfp0USBIVZIBoDnu7fFaDJ9TpkUda+WnrrZujcSF/SfGYARpp08Zq8iz
         SI44p8b7Z0AJ18eiQUYhNy+gGY1/TT4nlvM4D8DcNSx1akccwqpm3PUCOcoPq5ZpFl1L
         ZO9mw8BMrq9GfeKg5fpv96UXNB3ZDK3OPn9sdramYpjbSPOgy71MJY3BO38jLDNTgrpG
         XAipkYNm6QaafCWuajcXgPM25n276jdyhvbNoBtbvJM1jUD9qCxlvm7tTaaPlz5IvsfT
         ACzq08XZ0yCLVtywsz8gp7FWX/TSuUIXi/vdINvOe8XZfk5cPcGR/jAAuabaGlY0gxbj
         zusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739812289; x=1740417089;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IQ9/J9h35ilWXRxsKVW+JVYYvP7a3v8B/uJdQKMSq/Y=;
        b=VjlzIAe5f3pRk3/C9WZQhE/Umv+04hCYAkwGXXZDQHJRTKHXyQOiUWvIO4BlCmRJiH
         R5runeiIypVaLNcjtGG7e6to6aW1itaVDDJOMNxNPab5n63EQhim+kvEl+HLHuhgMLAl
         Oyz1+tYEsWX6kl9xFBBJ8WABIJgGy+zuCDQ5UICtnZ8+Me7OaePXolwalkQk1mSG4KUH
         BrYovsCADRdWynf5K2oslGwGhoV/T1BrNLu4pCsPs79+wCqqt4TQS2QjgeH3i578KGB/
         s0pag5LTkMx96CgW9cwDuzU6nID/Udqjosta55T9gNoUltW/lGkvgiDx9+9aSxS6w3TE
         WdVA==
X-Forwarded-Encrypted: i=1; AJvYcCVoaAUbz27l9/lO5P5AaqDVVDBJ3Q4bJyQzAy/epLfi1AeqCWkZ6QbzA7v922Iddzx9ny4t4AEJl8c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMc9LROZ1fKiii+Z7Hai0BWFNO3GQ7AAEVtcl7rOUAptthhdrZ
	IaYq51DjHFZhtVBAjRWe3NfQPh8yK2brVO2yR6/La7FjjnfC3vpq
X-Gm-Gg: ASbGncsHJXJEmMiAXT1wu8H0dm3S/M4tkCIq/jB5+7NhFX+kJFR0JQApSbjsNsas4FX
	mTTKDT/RMJWj7GCi7QuqVsULaijJwWCW6RLcai2z7iV07+sqeWJRDomkouLGNz6gg7C8+U6i037
	FD5CtoEqak9Gsj02XikJ+k+SwJ6MRkF1IENZgPb+k0zdyCqMgPf6lj2PHeHY+6fuuDIs21cWDqh
	9liVfFTv0jymUoqoppk7+tezkUCAdKeIWm9taP+40Rv14y1DWAIPO2Rl2jR6JfLrdD2mgk44WD8
	UhMk+MTwz4Jwzaf6EHYPWcl9
X-Google-Smtp-Source: AGHT+IHM3D31s3wMtCwLIi+psAVJmigcdRyMHlAGT5z+7EDvmn7M5PDslQZEm1ou902E8++1ynfuWA==
X-Received: by 2002:a05:6512:3996:b0:545:81b:1514 with SMTP id 2adb3069b0e04-5452fe271fbmr2508105e87.9.1739812288182;
        Mon, 17 Feb 2025 09:11:28 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------i9fcqK3E0ZyrZPwcIBNcPaNR"
Message-ID: <05cc15ee-fb2b-450b-9188-8ece65b353b0@gmail.com>
Date: Mon, 17 Feb 2025 18:11:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v5] Avoid crash calling PrintErrMesg from
 efi_multiboot2
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250122101407.52282-1-frediano.ziglio@cloud.com>
 <9d7b6706-7415-43d5-a66e-650eb67437fa@suse.com>
 <5c9ab6a7-2095-4f7c-8e5b-1942ad54420d@gmail.com>
 <CACHz=Zjru+BYnhFz97W1LGpTQNej+SM6-jZ-rqGE=D6x0rt5+A@mail.gmail.com>
 <CACHz=ZghOk1EET3_N3Rn-1+0anZ7e702cKux7U5bBf862fDfQw@mail.gmail.com>
 <f4f93da6-42e1-4a9d-b638-e44560f84408@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f4f93da6-42e1-4a9d-b638-e44560f84408@citrix.com>

This is a multi-part message in MIME format.
--------------i9fcqK3E0ZyrZPwcIBNcPaNR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Frediano,

On 2/17/25 3:45 PM, Andrew Cooper wrote:
> On 17/02/2025 1:55 pm, Frediano Ziglio wrote:
>> ping
> Ping what?
>
> You have no maintainer ack, an outstanding bug raised against this
> version, and a suggestion on how to address it.
>
> I'd really like to see this in 4.20 too, but this needs a v6 before it's
> going to progress any further.

As I mentioned in one of my previous replies to this patch, I'm giving
Release-Acked with the expectation that a proper maintainer's acknowledgment
will be obtained.

~ Oleksii

--------------i9fcqK3E0ZyrZPwcIBNcPaNR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello Frediano,
</pre>
    <div class="moz-cite-prefix">On 2/17/25 3:45 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f4f93da6-42e1-4a9d-b638-e44560f84408@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 17/02/2025 1:55 pm, Frediano Ziglio wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">ping
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ping what?

You have no maintainer ack, an outstanding bug raised against this
version, and a suggestion on how to address it.

I'd really like to see this in 4.20 too, but this needs a v6 before it's
going to progress any further.</pre>
    </blockquote>
    <pre>As I mentioned in one of my previous replies to this patch, I'm giving
Release-Acked with the expectation that a proper maintainer's acknowledgment
will be obtained.

~ Oleksii
</pre>
  </body>
</html>

--------------i9fcqK3E0ZyrZPwcIBNcPaNR--

