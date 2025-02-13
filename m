Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0570A341F5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:28:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887689.1297151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaCm-0007cA-Ma; Thu, 13 Feb 2025 14:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887689.1297151; Thu, 13 Feb 2025 14:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaCm-0007a3-Jj; Thu, 13 Feb 2025 14:28:40 +0000
Received: by outflank-mailman (input) for mailman id 887689;
 Thu, 13 Feb 2025 14:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=horU=VE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiaCl-0007Zm-01
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:28:39 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfe46891-ea16-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 15:28:37 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-308dc0878dfso10048281fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 06:28:37 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309102bbec2sm2138781fa.111.2025.02.13.06.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:28:35 -0800 (PST)
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
X-Inumbo-ID: cfe46891-ea16-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739456916; x=1740061716; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDjS6HuoRVV6uFzyfUIfm+sxEvKhNCZJykI8AYh0vOA=;
        b=ZfBF5/Eu1tOX2/dSyyWD+fQabvxCPssI2shjDTu4Xjf8uYn7ETPLxiuDM4NG1FYink
         8lm1M36eA2pIEJthPaOMeN4wadWMKUbQZztp37TrjILzxkJTy9gI4B8WC/Fa6oPrbds6
         A5KOyuDXF493EicjkSknMBO34QejHx04Kx3zMVLM/R+RJgesOHcAE6Tg0p8LogcVUJSv
         bO3uH/lVsFV+NsZ8gninuMhpRDo2OHkrCQzw6/nK/MaqiWB1Tj76hKybNxxpUFKTZ/z4
         0dG9sN5N/Pvo4iq2SqEeE+48y81QxPGsh50BVFdyA3Zp4sEo9Uc3xFkqp/JzedizuN+g
         toOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456916; x=1740061716;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FDjS6HuoRVV6uFzyfUIfm+sxEvKhNCZJykI8AYh0vOA=;
        b=qWfIKrF/BdOTaLCb+BYe6RW4pQS1wxtoFjA8D9G7OnY+c48Rr5FAmhrqYsQilWNmxT
         YmzMvOTyn9rauW5UR0wSVdpaFItokYF0up8JFp6HxOzFNXcGhN8I6kPZajo4rvtu523p
         mHUBBuhPIOHCSBrW/DU1CiW1f6ZfyAFUqaAkMWsMBbtHhqq9NRBhYhFMjVJKl4F8U0HG
         4FpXkF5V8uZIVUFTKAqAX8ZiaBgCdJ3IYmRZs5JdJ37bEtlkr1jP5g9su8L09w/NK1BV
         pyV3G3q18FB5waH4ggfBMUIKyYmHvOzbtnaLZ55SbUGl/v0l7Zdmq25+wJD4mtBl47OM
         lHxA==
X-Gm-Message-State: AOJu0Yxdh0xINzFQWNrxkg66tvl6CYu097I6L6ggniKRBBAJPv36xOcW
	l7T4xx3vnQlU0Ac8mFcOHo+g4MZhNMbCUQDsd2jts+RS9l1jQJdN
X-Gm-Gg: ASbGncsbsbSq49cJ5m7Bmt1RaIqd5BF+0i6cxYrp9sU4CwA1l4VVdTYIESB2dsxxN/D
	ZRoG+Ewgyo5bmWntg4Ij8kOpjX4jm0atvliQF4IursVR/5dynI2KQHkboYzRM3ZPjmOtAvJnPHz
	eYZh29/UPLXLmvY/4STMx0NccG87P3VKUHNzYrm5WCGeYNfnrTkZM7+yJ8SO9XS519Du13PmP7G
	7pNsq7lw+lIFqxjitThdMkoljGlTzcRDO6RGvX1sV9SQ6NAIByqd/sNuRGoX2dNM/NQoGpVWnXy
	fiTaqJCmbBWG2xijUgHdx0qN0dQ=
X-Google-Smtp-Source: AGHT+IHuyNDcHKYD8sUNO1XZ7icuygXjzgxAl3fMWBEkzJRGk9Ty/HC7pond5RNk27+5ERbCi4iipw==
X-Received: by 2002:a2e:a99e:0:b0:308:ee65:7f4e with SMTP id 38308e7fff4ca-30903554dc6mr25300211fa.0.1739456916273;
        Thu, 13 Feb 2025 06:28:36 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Gs9jnFChaULQ3HxzdTSNFY8s"
Message-ID: <fb34061e-a3eb-4ec7-ad96-29f30f982fa5@gmail.com>
Date: Thu, 13 Feb 2025 15:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 for-4.20(?) 0/4] Add/enable stack protector
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
 <5b6b1ad2-c0cd-454c-aa7c-b6de37ab39df@citrix.com> <87pljmymos.fsf@epam.com>
 <e692db7a-c457-445e-befa-96702b512b13@citrix.com>
 <402c93ec-9cb0-41e0-b1c8-eca321140ad6@gmail.com>
 <2dbe84e9-485b-47e1-8ceb-94ed9b6b13bc@xen.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2dbe84e9-485b-47e1-8ceb-94ed9b6b13bc@xen.org>

This is a multi-part message in MIME format.
--------------Gs9jnFChaULQ3HxzdTSNFY8s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/13/25 3:24 PM, Julien Grall wrote:
> Hi,
>
> On 13/02/2025 14:21, Oleksii Kurochko wrote:
>>
>> On 2/13/25 3:07 PM, Andrew Cooper wrote:
>>> On 13/02/2025 1:54 pm, Volodymyr Babchuk wrote:
>>>> Hi Andrew,
>>>>
>>>> Andrew Cooper<andrew.cooper3@citrix.com> writes:
>>>>
>>>>> On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
>>>>>> Volodymyr Babchuk (4):
>>>>>>    common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>>>>>>    xen: common: add ability to enable stack protector
>>>>>>    xen: arm: enable stack protector feature
>>>>>>    CHANGELOG.md: Mention stack-protector feature
>>>>> Reviewed-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>>>>
>>>>> There's one minor formatting error which can be fixed on commit.
>>>>>
>>>>> ~Andrew
>>>> Thanks for the review. I noticed that this series is not committed. Is
>>>> there anything else required from my side?
>>>>
>>> You need an ARM Ack on patch 3.  [EDIT], no you don't, my R-by is good
>>> enough.
>
> I beg to differ. For low level code, you really ought to have Arm 
> folks to confirm this is correct. In fact, I don't think patch #3 it 
> is. So ...
>
>>>
>>> And at this point at rc4, you'll need to persuade Oleksii to take it 
>>> for
>>> 4.20.
>>>
>>> Personally I think it's low risk and worthwhile to take for 4.20, 
>>> and it
>>> was technically completed in time - it just fell between the cracks.
>>
>> I think the same it's low risk patch series, so we can take it for 4.20:
>>   Release-Acked-by: Oleksii Kurochko<olekskii.kurochko@gmail.com>
>
> ... I should not go to 4.20 as-is.
>
> And before someone ask why it wasn't answered early. I can't comment 
> for the other Arm maintainers, but I have been away for the past two 
> months. So still catching up on my emails.

Agree, I wrote that in follow-up reply to my initial reply.

So if the proper Ack will be received I still think we can consider to have it in 4.20.

~ Oleksii

>
--------------Gs9jnFChaULQ3HxzdTSNFY8s
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
    <div class="moz-cite-prefix">On 2/13/25 3:24 PM, Julien Grall wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2dbe84e9-485b-47e1-8ceb-94ed9b6b13bc@xen.org">Hi,
      <br>
      <br>
      On 13/02/2025 14:21, Oleksii Kurochko wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 2/13/25 3:07 PM, Andrew Cooper wrote:
        <br>
        <blockquote type="cite">On 13/02/2025 1:54 pm, Volodymyr Babchuk
          wrote:
          <br>
          <blockquote type="cite">Hi Andrew,
            <br>
            <br>
            Andrew Cooper<a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> writes:
            <br>
            <br>
            <blockquote type="cite">On 14/01/2025 4:25 am, Volodymyr
              Babchuk wrote:
              <br>
              <blockquote type="cite">Volodymyr Babchuk (4):
                <br>
                   common: remove -fno-stack-protector from
                EMBEDDED_EXTRA_CFLAGS
                <br>
                   xen: common: add ability to enable stack protector
                <br>
                   xen: arm: enable stack protector feature
                <br>
                   CHANGELOG.md: Mention stack-protector feature
                <br>
              </blockquote>
              Reviewed-by: Andrew
              Cooper<a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
              <br>
              <br>
              There's one minor formatting error which can be fixed on
              commit.
              <br>
              <br>
              ~Andrew
              <br>
            </blockquote>
            Thanks for the review. I noticed that this series is not
            committed. Is
            <br>
            there anything else required from my side?
            <br>
            <br>
          </blockquote>
          You need an ARM Ack on patch 3.  [EDIT], no you don't, my R-by
          is good
          <br>
          enough.
          <br>
        </blockquote>
      </blockquote>
      <br>
      I beg to differ. For low level code, you really ought to have Arm
      folks to confirm this is correct. In fact, I don't think patch #3
      it is. So ...
      <br>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">
          <br>
          And at this point at rc4, you'll need to persuade Oleksii to
          take it for
          <br>
          4.20.
          <br>
          <br>
          Personally I think it's low risk and worthwhile to take for
          4.20, and it
          <br>
          was technically completed in time - it just fell between the
          cracks.
          <br>
        </blockquote>
        <br>
        I think the same it's low risk patch series, so we can take it
        for 4.20:
        <br>
          Release-Acked-by: Oleksii
        Kurochko<a class="moz-txt-link-rfc2396E" href="mailto:olekskii.kurochko@gmail.com">&lt;olekskii.kurochko@gmail.com&gt;</a>
        <br>
      </blockquote>
      <br>
      ... I should not go to 4.20 as-is.
      <br>
      <br>
      And before someone ask why it wasn't answered early. I can't
      comment for the other Arm maintainers, but I have been away for
      the past two months. So still catching up on my emails.
      <br>
    </blockquote>
    <pre>Agree, I wrote that in follow-up reply to my initial reply.

So if the proper Ack will be received I still think we can consider to have it in 4.20.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:2dbe84e9-485b-47e1-8ceb-94ed9b6b13bc@xen.org">
      <br>
    </blockquote>
  </body>
</html>

--------------Gs9jnFChaULQ3HxzdTSNFY8s--

