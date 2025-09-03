Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4453B423E8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108532.1458659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utofc-00076F-SO; Wed, 03 Sep 2025 14:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108532.1458659; Wed, 03 Sep 2025 14:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utofc-000735-PE; Wed, 03 Sep 2025 14:41:08 +0000
Received: by outflank-mailman (input) for mailman id 1108532;
 Wed, 03 Sep 2025 14:41:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tKq3=3O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1utofb-00072g-IC
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:41:07 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 050d1ca6-88d4-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 16:41:04 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61ec59e833aso2839488a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 07:41:04 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff08b86833sm1298942166b.48.2025.09.03.07.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 07:41:03 -0700 (PDT)
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
X-Inumbo-ID: 050d1ca6-88d4-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756910464; x=1757515264; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5gylBqcfTlrBhktlHFUaOyZ1wYujkpAVleyJVZn6gk=;
        b=SqH7E2WbDQjc6Nv0p1PQhlUd804ORWVNQeIKSCQMvdg48QdClNm6As4j2GCt1573dw
         gqg1FK4wMDrG1hBCHzmbQn7TPngCzGKTHB0rHiJaAY7VUQoQfRwWX6AFQ8pusendkvHp
         utEy5gpMScQRw4J2GCJNfUVmjTW9dLeav+/qex17Oia5KoLn5MgwnYw4zJ4XpsUwMzXP
         l8/gkXcEJ1VJUrj5qYqBzWcDrmrkcSkeCEATnXAC8tWWGqc0hpbLyb2DLAHZL50taILk
         10+MbjshtNFwrLAT04QAw3BMHgPf/B09y/2Q5sNodcA3qT4We4bUgkWrbWl5s+bIQPYN
         0EcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756910464; x=1757515264;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e5gylBqcfTlrBhktlHFUaOyZ1wYujkpAVleyJVZn6gk=;
        b=HtKG27d4Dp/pJ1ipxeLp/SKty8qsYFbylgEMFBgXYxLfGX1Ar9L/hKYEV/+UB2HMQ/
         ux0gHMQFZUV2tvVqTiCbPUmZjQ8mjhgyN6ozr0+J41ydBZuUP2jAPoMJgiwXJhJT2LTd
         WFURmzoCToAtEUR1PCiF1bSmNhgqkhUo3eCKNX00ywW4IWfEZY/Yo702epcyF1oS6OeE
         xtY5qGSZR/Prui++XVfIl/J4E7AaR5rlKdsxcYd11caI0BhLeA74SdFBYOzii0GhAh4V
         gzjYF1YN10BjwZZHfIvIPbVN8yr4U0G+h0P0Qj+AVbdMeB0xLElIkiLuR04bhE5aT2UM
         aZ6A==
X-Forwarded-Encrypted: i=1; AJvYcCUSQ1SVYW4k3vCn5BUW6UnjNkDsVs8PPQoqb+gA67noyJv1pL3p2Z922WByJ7K7ERWpdPsnH0eCG3o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yybe+O7rAeYyLMVL2iEQkRfOA43s4hi2uyboX7Wlbap2GN1fZBx
	V+PzAs2SOTsrHg9MdrhtjSQXZZwc9YKagwAoWjiqQejCXGj4B3vDfTsi
X-Gm-Gg: ASbGncue3+8QwH0hQ+UL4dQ3SPo05I/MmEb2lDIAlfxRA96rl4aPAzXPP2x8/n4Hq3S
	F02w4xwwjP2t7n8nnVZfDbFqCmc+Fo7JD83sIvxv0CcOooJ8PBI0lqD7g1o4cOQ9238mjeyEx6s
	59qBTLnJlGQF06UneCgHxZdrNNTV4rgkoDeLOOiT4JJAX1DPYipfMAO5aILe5ku9JPX0DIKeqg/
	49HtiFJ4pWN38IfkOOvcyAAR/fI4I4zcHuHu1qosPMzWBbPUl7J13Q6vfgu/+y91Ovp8SFv4ULv
	sZW2y+SbBKAlMbxJA4StOvcofqBuBa6gOp0RhakAswVpx8SgbS6La/LHpKLH95nLMSvq0i8vV75
	p2pAasjJ59CFArv/kYGv9ykaRpeFckyNTfHIZLgOMCus/NmrCaJA2VWoWmc1rL49zeFPeru6ntL
	9M1sxOBqg=
X-Google-Smtp-Source: AGHT+IFaPwXpn6xcYWJcssWCvdMCAVPT2zjOekeaAUu9FL4NIElajJnRRzKTHZSfGkWtm/YY32EkbA==
X-Received: by 2002:a17:906:794e:b0:b04:6d3d:9936 with SMTP id a640c23a62f3a-b046d3d9ae5mr204554666b.51.1756910464010;
        Wed, 03 Sep 2025 07:41:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------hBmKXonvLQj1jynq2TQbEZQZ"
Message-ID: <4600abf5-000f-436f-b80c-06f42ce22f62@gmail.com>
Date: Wed, 3 Sep 2025 16:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Domctl series as a fix to PV_SHIM_EXCLUSIVE, was: [PATCH]
 xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>,
 jbeulich@suse.com
References: <20250815102728.1340505-1-Penny.Zheng@amd.com>
 <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com>
 <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com>
 <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com>
 <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
 <49416df6-83c8-4fa3-bf81-2d1e504ef31b@suse.com>
 <alpine.DEB.2.22.394.2508251934200.3391208@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2508261728250.3391208@ubuntu-linux-20-04-desktop>
 <cc8724b6-bb31-4482-a459-156366b7b433@suse.com>
 <alpine.DEB.2.22.394.2508271442410.580734@ubuntu-linux-20-04-desktop>
 <5f5ba1dd-1252-4740-8c64-e4fcd8a7ac32@suse.com>
 <alpine.DEB.2.22.394.2508281632020.8757@ubuntu-linux-20-04-desktop>
 <dfadb4d5-cbf9-4b99-b389-34cb290a2229@suse.com>
 <alpine.DEB.2.22.394.2509021507410.1405870@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2509021507410.1405870@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------hBmKXonvLQj1jynq2TQbEZQZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Stefano,

On 9/3/25 12:16 AM, Stefano Stabellini wrote:
> Hi Oleksii,
>
> We previously discussed the PV_SHIM_EXCLUSIVE build issue on Matrix
> and agreed on resolving it after the feature freeze as a fix. This
> conversation took place before the feature freeze was rescheduled to
> September 5. I am documenting this on xen-devel both for record-keeping
> and because Matrix is currently offline. I am proceeding under the
> assumption that the conclusions from that discussion still apply.

Thank you for documenting this on xen-devel.


>
> I would like to request an additional clarification. While there is no
> consensus among the maintainers on the preferred short-term compromise,
> there is agreement that reviewing and committing the domctl series [1]
> in time would be the best outcome. (Together with unifying CONFIG_SYSCTL
> and CONFIG_DOMCTL into a single CONFIG_MGMT_HYPERCALLS for simplicify.)
>
> Are you still OK with us going ahead with reviewing and committing the
> domctl series as a fix to the PV_SHIM_EXCLUSIVE issue, potentially going
> past the feature freeze by a week?

Regarding your request for clarification on the domctl series [1], I agree
that reviewing and committing this series as a fix for the PV_SHIM_EXCLUSIV
issue is the preferred short-term solution.
Given that the series primarily consists of refactoring changes with minimal
functional impact, I am comfortable with making an exception to the feature
freeze to allow its inclusion, potentially extending up to one week past
September 5 (only for this patch series).

But if it will/could take more time then I think that we should consider
an option just to revert some patches, IIUC it should fix the mentioned issue
too.

~ Oleksii

> Stefano
>
> [1]https://marc.info/?l=xen-devel&m=175421442423500
--------------hBmKXonvLQj1jynq2TQbEZQZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello Stefano,

</pre>
    <div class="moz-cite-prefix">On 9/3/25 12:16 AM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2509021507410.1405870@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">Hi Oleksii,

We previously discussed the PV_SHIM_EXCLUSIVE build issue on Matrix
and agreed on resolving it after the feature freeze as a fix. This
conversation took place before the feature freeze was rescheduled to
September 5. I am documenting this on xen-devel both for record-keeping
and because Matrix is currently offline. I am proceeding under the
assumption that the conclusions from that discussion still apply.</pre>
    </blockquote>
    <pre dir="auto" style="white-space: pre-wrap;">Thank you for documenting this on xen-devel.</pre>
    <pre>

</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2509021507410.1405870@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">

I would like to request an additional clarification. While there is no
consensus among the maintainers on the preferred short-term compromise,
there is agreement that reviewing and committing the domctl series [1]
in time would be the best outcome. (Together with unifying CONFIG_SYSCTL
and CONFIG_DOMCTL into a single CONFIG_MGMT_HYPERCALLS for simplicify.)

Are you still OK with us going ahead with reviewing and committing the
domctl series as a fix to the PV_SHIM_EXCLUSIVE issue, potentially going
past the feature freeze by a week?</pre>
    </blockquote>
    <pre dir="auto" style="white-space: pre-wrap;">Regarding your request for clarification on the domctl series [1], I agree
that reviewing and committing this series as a fix for the PV_SHIM_EXCLUSIV
issue is the preferred short-term solution.
Given that the series primarily consists of refactoring changes with minimal
functional impact, I am comfortable with making an exception to the feature
freeze to allow its inclusion, potentially extending up to one week past
September 5 (only for this patch series).

But if it will/could take more time then I think that we should consider
an option just to revert some patches, IIUC it should fix the mentioned issue
too.

~ Oleksii</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2509021507410.1405870@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">Stefano

[1] <a class="moz-txt-link-freetext" href="https://marc.info/?l=xen-devel&amp;m=175421442423500">https://marc.info/?l=xen-devel&amp;m=175421442423500</a>
</pre>
    </blockquote>
  </body>
</html>

--------------hBmKXonvLQj1jynq2TQbEZQZ--

