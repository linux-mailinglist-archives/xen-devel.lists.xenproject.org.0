Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E82A56739
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 12:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904939.1312726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWK7-0003Z8-4e; Fri, 07 Mar 2025 11:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904939.1312726; Fri, 07 Mar 2025 11:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWK7-0003Ws-22; Fri, 07 Mar 2025 11:57:03 +0000
Received: by outflank-mailman (input) for mailman id 904939;
 Fri, 07 Mar 2025 11:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YHQw=V2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tqWK5-0003Wm-UZ
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 11:57:01 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4666373f-fb4b-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 12:56:59 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e5e0caa151so1690701a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 03:56:59 -0800 (PST)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c768f8cbsm2419913a12.76.2025.03.07.03.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 03:56:58 -0800 (PST)
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
X-Inumbo-ID: 4666373f-fb4b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741348619; x=1741953419; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wHNyQPneM7ZqwLxqlqQxFiog4J6FqDY8ioJmChRN2I=;
        b=UVpiNe3RjmYFqyKDr8OyEFjqjhpEztEJy7XIgMJXIWZIR5dqzD3g0tHFtmVvpM8I5c
         jLVAml1wGtGtxClzAD8lBHgHFa2okcKzLN0k2SPeqfI2gsym7smlwmAKww1/8FTRrotE
         fSjarpdDHClaXyRsqU17a8HE58+vbb6lSBSKDjwzyEZTIoFsnnqpaHW5bYwsXI+fdajM
         5fF0M/PSaw4ede+PE6iN2AUqgHvyWY+/cSKmbz/MgijQS8Jz4Eu9Jt0WsCSPVy7P3C4p
         CRJCadU0Dje6Q2nLaIvbztS5eDXNq67exT653vp1Vx5za/kpQoKuXVzUOk5I+7vxQMhl
         4qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741348619; x=1741953419;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8wHNyQPneM7ZqwLxqlqQxFiog4J6FqDY8ioJmChRN2I=;
        b=Rywv9vL1NuMu/jTcXO75JlS+DKSgJovdOAKXhDU6fHBMsK1FDV2l05zAxPjqnTHf7i
         mALRoUEHA2/7N9AsTaJPbpN9G5Epmzr6dnI9MaZWeWURyIKCYkWyK2QOLm4CkstyW4vf
         vnMx+M0YijxHi21y+ISAZZhkm5N8FlrUZExryUchzjIe1lqqpE0OqFGtfBYmOiHuX2BQ
         KsebZimJrDPheTp1hRcqIhVj6C+UtBlYaXW0I/Aie6DkJZd+PxQ9y7WRggRA4SHqyRfk
         XZmIzQ14zatbXxIob2lDPdLPABzqdFD5Gplh0avixJ4qRpX79z4PgGSuFPXsMN1WGg1Z
         ZqdA==
X-Gm-Message-State: AOJu0Yx6wplxLXr2yWp0QUpBBa8BydGabOVOiGgtVAwEFrG8n9Dc7QXD
	tXn4YGvxSKeHSUaZkHd18rtWvX+R5b45oBHqdzoc4DujJ3JXkp/D
X-Gm-Gg: ASbGncs6+Ebq+DIOEzBkWptX1183geSNWdH41jNKjXAOB2pVJHs8eM2qjPeHUqEO8qB
	2N0MfjBHQXS+mLhnSf/PM3qGmbXJOeqgCf7Ob4pUDgBnt/yJtT5R6vRRGiZBrWFAbQoCb7pLF8R
	fQ5nBpFWYRuEdxCeetIuBuTqbomnqFahgvh0ifkoKdqw6tTtssnrBR3euWz7q8h0qZGGZHhdPZu
	iPIx6CmGEM8dfZdGUlrryPrnP0M4PIIEif0EpL1nrHfuvehDmKaFypn3niI5UQ9ZSOKtnqxBpmK
	MOVlCZlDbKUhUgO0b0cmU2CFX8A6OgKI2+5vCuMnVVtflJkWh0nYf33k1TKon3RPR2gltMhs6sH
	aGUj1Z2J+kxpHZxbYzcDH
X-Google-Smtp-Source: AGHT+IGbIUKGX5/NY8E9LSxlRk/GHBZTT4zxyrR86sp7eOy9aYm8Ujc5J6Mm1ZkP6DbUwg0jVpDWVw==
X-Received: by 2002:a50:8dca:0:b0:5e5:bd8d:edb9 with SMTP id 4fb4d7f45d1cf-5e5e22db548mr2752291a12.10.1741348618640;
        Fri, 07 Mar 2025 03:56:58 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------1Rn7CXrr0ks0L0utR9UF0rNg"
Message-ID: <90dd70c2-88bc-44a6-8ccd-12bda9ac00f2@gmail.com>
Date: Fri, 7 Mar 2025 12:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: copy_to_guest/copy_from_guest functionality.
To: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Milan Djokic <Milan.Djokic@rt-rk.com>
References: <dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com>
 <1b71b063-1f1d-4cd0-be06-0ba3908027e6@gmail.com>
 <CAKp59VHngx=DaHYdb8nYNNbmd5_s5FejShX2xwFFz1KVmPB_vw@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CAKp59VHngx=DaHYdb8nYNNbmd5_s5FejShX2xwFFz1KVmPB_vw@mail.gmail.com>

This is a multi-part message in MIME format.
--------------1Rn7CXrr0ks0L0utR9UF0rNg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/4/25 1:09 PM, Milan Đokić wrote:
>> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
>> index 17827c302c..f4098f5b5e 100644
>> --- a/xen/arch/riscv/arch.mk
>> +++ b/xen/arch/riscv/arch.mk
>> @@ -23,13 +23,17 @@ $(eval $(1) := \
>>    $(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
>>   endef
>>
>> +h-extension-name := $(call cc-ifversion,-lt,1301, hh, h)
>> +$(h-extension-name)-insn := "hfence.gvma"
>> +$(call check-extension,$(h-extension-name))
>> +
>>   zbb-insn := "andn t0$(comma)t0$(comma)t0"
>>   $(call check-extension,zbb)
>>
>>   zihintpause-insn := "pause"
>>   $(call check-extension,zihintpause)
>>
>> -extensions := $(zbb) $(zihintpause)
>> +extensions := $(value $(h-extension-name)) $(zbb) $(zihintpause)
>>
>>   extensions := $(subst $(space),,$(extensions))
>>
>> This patch should take into account another one patch series (https://lore.kernel.org/xen-devel/cover.1740071755.git.oleksii.kurochko@gmail.com/T/#t)
>> update for which I am going to sent today.
>>
>> Also, these changes would be better to move into separate commit with explanation why what is so specific with 1301 and why it is needed to introduce
>> 'hh'.
>> I believe that these changes were taken based on my patch:https://gitlab.com/xen-project/people/olkur/xen/-/commit/154f75e943f1668dbf2c7be0f0fdff5b30132e89
>> Probably it will make sense just to get it and rebase on top of mentioned above patch series.
>>
> Yes, it is based on your patch. Sorry, I was not aware that you
> already have an active patch series which contains this part.
> In that case we'll wait for your patch series to be merged first. And
> we'll split it into 2 commits where first one will only introduce h
> extension handling in arch.mk and the second one with
> copy_from/to_guest functionallity

This is not really contains this part directly but that another one patch series will affect these changes.
So the final changes should look like:
   https://gitlab.com/xen-project/people/olkur/xen/-/commit/eb75bc3482ffe025cf36c320e2e13a77deeea883

I planned to send this patch to upstream on Monday.

Best regards,
  Oleksii


--------------1Rn7CXrr0ks0L0utR9UF0rNg
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
    <div class="moz-cite-prefix">On 3/4/25 1:09 PM, Milan Đokić wrote:</div>
    <blockquote type="cite"
cite="mid:CAKp59VHngx=DaHYdb8nYNNbmd5_s5FejShX2xwFFz1KVmPB_vw@mail.gmail.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 17827c302c..f4098f5b5e 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -23,13 +23,17 @@ $(eval $(1) := \
  $(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
 endef

+h-extension-name := $(call cc-ifversion,-lt,1301, hh, h)
+$(h-extension-name)-insn := "hfence.gvma"
+$(call check-extension,$(h-extension-name))
+
 zbb-insn := "andn t0$(comma)t0$(comma)t0"
 $(call check-extension,zbb)

 zihintpause-insn := "pause"
 $(call check-extension,zihintpause)

-extensions := $(zbb) $(zihintpause)
+extensions := $(value $(h-extension-name)) $(zbb) $(zihintpause)

 extensions := $(subst $(space),,$(extensions))

This patch should take into account another one patch series ( <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1740071755.git.oleksii.kurochko@gmail.com/T/#t">https://lore.kernel.org/xen-devel/cover.1740071755.git.oleksii.kurochko@gmail.com/T/#t</a>)
update for which I am going to sent today.

Also, these changes would be better to move into separate commit with explanation why what is so specific with 1301 and why it is needed to introduce
'hh'.
I believe that these changes were taken based on my patch: <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/commit/154f75e943f1668dbf2c7be0f0fdff5b30132e89">https://gitlab.com/xen-project/people/olkur/xen/-/commit/154f75e943f1668dbf2c7be0f0fdff5b30132e89</a>
Probably it will make sense just to get it and rebase on top of mentioned above patch series.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Yes, it is based on your patch. Sorry, I was not aware that you
already have an active patch series which contains this part.
In that case we'll wait for your patch series to be merged first. And
we'll split it into 2 commits where first one will only introduce h
extension handling in arch.mk and the second one with
copy_from/to_guest functionallity
</pre>
    </blockquote>
    <pre>This is not really contains this part directly but that another one patch series will affect these changes.
So the final changes should look like:
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/commit/eb75bc3482ffe025cf36c320e2e13a77deeea883">https://gitlab.com/xen-project/people/olkur/xen/-/commit/eb75bc3482ffe025cf36c320e2e13a77deeea883</a></pre>
    <pre>I planned to send this patch to upstream on Monday.

Best regards,
 Oleksii
</pre>
    <br>
  </body>
</html>

--------------1Rn7CXrr0ks0L0utR9UF0rNg--

