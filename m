Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B6A341C0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887644.1297111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tia5Z-0004VR-7m; Thu, 13 Feb 2025 14:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887644.1297111; Thu, 13 Feb 2025 14:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tia5Z-0004T7-5C; Thu, 13 Feb 2025 14:21:13 +0000
Received: by outflank-mailman (input) for mailman id 887644;
 Thu, 13 Feb 2025 14:21:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=horU=VE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tia5X-00047d-Nr
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:21:11 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c62980d9-ea15-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 15:21:11 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-30795988ebeso9937541fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 06:21:11 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09b310sm182950e87.73.2025.02.13.06.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:21:10 -0800 (PST)
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
X-Inumbo-ID: c62980d9-ea15-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739456471; x=1740061271; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yx1nZkn7e/6/jFM3Wo/KEwBFaROh8llDtp/FNGsRG4o=;
        b=Vo5uuvTV/PEN8YYc8u3CE2CsSOfGSRMGUgFkdlboHUkcN89Rv7mEENOoYdNF4db7mT
         2PA016XsBVsN8MFcclLk76H70ZsTEWfT9ojQ7VerY7A8U2EecaQiARfIEYwYeK3CwdEd
         5G4Hx55NT6AHMkJ9TdiN32wvDMN/1N86Q4taDOog69FAe0+vbjKEFMDuxqdGSRM5NiGz
         XxqzTAMmqTTkmXc0atEJnexbyILpO/BVJJYk++Jmbb66P/QDV4Qqv4KrakZUFJ1HANY4
         Uao6DoKS/dD40lViva0TlIfnaEfIfM4wmA90527T0UGs/klwxhN55B9iYfGm8t1iDeKR
         K1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456471; x=1740061271;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yx1nZkn7e/6/jFM3Wo/KEwBFaROh8llDtp/FNGsRG4o=;
        b=fVWmY+RV1gYBmfAKpNzeV+WhggwRV5F8bTZTMf2mAjS8WhpuOo7iLbEn4eTyTirU3h
         EuxTWeOnjicW+FiJralEEljtRtdctLmmXS0pagDdZW0zT40pLwcK7gQ9zjS4fYxv4zfJ
         xdmVX7ShaJT2wbKn5fZGqEOW5KlhrB0jDeK/mAQj5BPlKQBMFk84hQIwre5kEJjCVEqH
         99LdyGbY//j+OXCWXnPPjk85GQkJCbWvhiHDU+DtJ9E5whyx2ayXfdwlfIkS1zNpfcsy
         r3i8dvDRBqqMD0WuJBQ+bGik3bBcolyltZsR464B5dUkoTpVh4NNvuLuqQ83nH1iesZy
         IAyA==
X-Gm-Message-State: AOJu0YxhKtwgSyBOxuAjy+UCIS2/DCNP93SC6DIvi3DvYh3FtBiD/zly
	KkS72X33rxNFS1cuLmbePCcsecX79VDRT6b7vHqpOZydcetEMez5
X-Gm-Gg: ASbGncsgTHzyw2Pgf8RRHDC1/xBwbDABNpOP7wwj8+PTg1Z0gVYMTg6zDguNyyKtera
	E2uKckEtV6H6gNEa1z8/qefmU7IGa/3YXEFlCQY2QannCloKd6L22kfU9jJLyckCf+XJEqr08Rs
	XHLrDk1sCdmRZQkQ5nA/yxeElyP2ZwUo8jsYw8bIfiQzWxiqJx0uqMEfWMpkLuB1WHarstvHAIr
	/nipWA4MOU//6KTTBDN0bkf+ofmn2TDhgvv1KHEQr1nzPgrCjXh5ayQ8y/tjRK3+7fBLnF87jMb
	2e3JUyVfHidfeiCpzB4pJ1NMSNc=
X-Google-Smtp-Source: AGHT+IFobv/ihymJVHMpExK2EprVbJp+8h5vXX7yzCSnJYUSZEmcae4+X2lYYJD9v9Uzm5OrUyFFLA==
X-Received: by 2002:a05:6512:31cf:b0:545:c7d:1791 with SMTP id 2adb3069b0e04-5451ddd9e2dmr1037528e87.43.1739456470297;
        Thu, 13 Feb 2025 06:21:10 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------c66KjAY0azc2QB8jp7MNbPQN"
Message-ID: <402c93ec-9cb0-41e0-b1c8-eca321140ad6@gmail.com>
Date: Thu, 13 Feb 2025 15:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 for-4.20(?) 0/4] Add/enable stack protector
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
 <5b6b1ad2-c0cd-454c-aa7c-b6de37ab39df@citrix.com> <87pljmymos.fsf@epam.com>
 <e692db7a-c457-445e-befa-96702b512b13@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e692db7a-c457-445e-befa-96702b512b13@citrix.com>

This is a multi-part message in MIME format.
--------------c66KjAY0azc2QB8jp7MNbPQN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/13/25 3:07 PM, Andrew Cooper wrote:
> On 13/02/2025 1:54 pm, Volodymyr Babchuk wrote:
>> Hi Andrew,
>>
>> Andrew Cooper<andrew.cooper3@citrix.com> writes:
>>
>>> On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
>>>> Volodymyr Babchuk (4):
>>>>    common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>>>>    xen: common: add ability to enable stack protector
>>>>    xen: arm: enable stack protector feature
>>>>    CHANGELOG.md: Mention stack-protector feature
>>> Reviewed-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>>
>>> There's one minor formatting error which can be fixed on commit.
>>>
>>> ~Andrew
>> Thanks for the review. I noticed that this series is not committed. Is
>> there anything else required from my side?
>>
> You need an ARM Ack on patch 3.  [EDIT], no you don't, my R-by is good
> enough.
>
> And at this point at rc4, you'll need to persuade Oleksii to take it for
> 4.20.
>
> Personally I think it's low risk and worthwhile to take for 4.20, and it
> was technically completed in time - it just fell between the cracks.

I think the same it's low risk patch series, so we can take it for 4.20:
  Release-Acked-by: Oleksii Kurochko<olekskii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> ~Andrew
--------------c66KjAY0azc2QB8jp7MNbPQN
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
    <div class="moz-cite-prefix">On 2/13/25 3:07 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e692db7a-c457-445e-befa-96702b512b13@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 13/02/2025 1:54 pm, Volodymyr Babchuk wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hi Andrew,

Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> writes:

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Volodymyr Babchuk (4):
  common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
  xen: common: add ability to enable stack protector
  xen: arm: enable stack protector feature
  CHANGELOG.md: Mention stack-protector feature
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Reviewed-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>

There's one minor formatting error which can be fixed on commit.

~Andrew
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Thanks for the review. I noticed that this series is not committed. Is
there anything else required from my side?

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You need an ARM Ack on patch 3.  [EDIT], no you don't, my R-by is good
enough.

And at this point at rc4, you'll need to persuade Oleksii to take it for
4.20.

Personally I think it's low risk and worthwhile to take for 4.20, and it
was technically completed in time - it just fell between the cracks.</pre>
    </blockquote>
    <pre>I think the same it's low risk patch series, so we can take it for 4.20:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:olekskii.kurochko@gmail.com">&lt;olekskii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:e692db7a-c457-445e-befa-96702b512b13@citrix.com">
      <pre wrap="" class="moz-quote-pre">

~Andrew
</pre>
    </blockquote>
  </body>
</html>

--------------c66KjAY0azc2QB8jp7MNbPQN--

