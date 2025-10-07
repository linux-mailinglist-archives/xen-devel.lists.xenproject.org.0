Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7B1BC17E2
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 15:27:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138821.1474428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67iT-0001rx-1U; Tue, 07 Oct 2025 13:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138821.1474428; Tue, 07 Oct 2025 13:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67iS-0001pE-Uu; Tue, 07 Oct 2025 13:26:56 +0000
Received: by outflank-mailman (input) for mailman id 1138821;
 Tue, 07 Oct 2025 13:26:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jiYT=4Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v67iS-0001Ys-Aw
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 13:26:56 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b2e07e7-a381-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 15:26:55 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6318855a83fso12872764a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 06:26:55 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486a173a41sm1391211166b.87.2025.10.07.06.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 06:26:54 -0700 (PDT)
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
X-Inumbo-ID: 4b2e07e7-a381-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759843615; x=1760448415; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKCubl4VmCe4Eh88cPSd8wW/t3R5vLLs+JMih2EID64=;
        b=QsxsJk/UGzO5u3bOYAkoUt0I1rqbeyL3BOrOqyJ2sRhrhMM168iPPqAtgm/PD5cKLz
         MtX2yT21l6BnRU2XZUwOU/58C9L7Ob1/bhjuweK5Mi06wA9hHU05bWoBE7I8JlPz+rKq
         r2XtfaZKlhGMZseNhZyMB+faXAzAu6BJT7c4DT9i1uqFCxG3rEu4CDLtdGSvmHL2WP4f
         SIYTpv1PPjpzlS8XZNJPoVgGiOuHcoLwWS4R+HsOAocjgdt5xGMQ7h2xOLEJSQ3jlgae
         IZsT1Da/TUd+EA428Hu/NTvKBLBPcs7ngOQMbFyfLnIF2+7CvSmhJbBHOSK96MTf94eP
         PGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843615; x=1760448415;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JKCubl4VmCe4Eh88cPSd8wW/t3R5vLLs+JMih2EID64=;
        b=WgWD4Nfc37J+0NaDQ++5mqaTt58QiCl7/P41l0jnxh3kp7JUdUP14UlgiGogfx3kEa
         j0DfncH/Ksn1uR8coiYdRjlZ+ryDlLjjHEJFDd2BdciLtHwGxhTNUlXG1BoLEzIT6LMW
         f6LL8/4JoNn6UeCuDvTTCZzLPBxTdbN0hDAY/NszpVwga9SdV38OTbelvImurERtNrC8
         JmnMRHknGN+321mbiYtKNGuT1UitlqgQ/KFtc7NIinmUw5wehWWeYVkM9d7r4fdrLEJu
         6/JLz7VNAjy85hNDuDh9p5KrbMSo9QHwTamk/LZm4Fv/GiEJISXMQNVB+O8ARWUN7QoZ
         MqoA==
X-Forwarded-Encrypted: i=1; AJvYcCXWW0jkxMpRT+mvUhXwVK4dsjviB0PnWBVdvDI7mvwiwjIxbRhURCw6aNYWqbP+zb+h91MNFmRNMvU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdIbeEpfl0ZhyGMckRCizpF1970QGp7k3rubWqyfWRfQbtXRvF
	Mr0zjB/6jDOKVk03RB5aCClz+b55h9bTWMA0zgsLi8TNAZN72pKHRE0R
X-Gm-Gg: ASbGncsbT/imo6dp0H1nzcnPNP8JuY3upBjeKSh274gjisZUkVSCvpRJT3rpJvo40M+
	Vjcgd1hB8gKkNLjtJoy+nD0sK6kF3z/lbFiOgll29OiEPxYFvm9Q3RXpQoQ5Qw4CX2wZXy2LKiS
	M+3QECtZ+Q3ciSXr4LoPN+dPnUY4/g662JXWn2VsqeEmj2N+D0YOMZKG4lUyLVJJ0jeK2a39BRv
	PHvNd3Q36KBJ2CA6KklL4+Wcfj1+WGHL4aabArE7Xkl0fFJ+1V8U6dF34KBixEJ0BmA96vuNd93
	rCr4f+xmU0DksJVbz1gyKfGA6wLiwcV/wcn8r95T5ylI274EIyXt+4UpMY+IK+iGboBvRALzcU8
	7gnoJshDjD+8wMCTutOTLIneScm6IsseHGaqv2Me6/cr2FyXiibthw37/zCaaSNG1NUOtPkQSnQ
	pq0+uglch7tSeu7SV+2SRkEKHqG7c=
X-Google-Smtp-Source: AGHT+IFYOZCK3ES4t5GWNyYevvpzYYd8BjqJHgjZ37X+MgFWOFwdhZYtzzloWwMWmmeX8Wqb/JvD+g==
X-Received: by 2002:a17:907:a089:b0:b3c:200b:4364 with SMTP id a640c23a62f3a-b49c1f5ac7cmr2318917666b.27.1759843614479;
        Tue, 07 Oct 2025 06:26:54 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------AVnKoanhiOcZT1DFpKXCXdaC"
Message-ID: <91f7a719-8bac-4b8e-be6f-f04f55fa9cfc@gmail.com>
Date: Tue, 7 Oct 2025 15:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 0/2] Prepare RC1
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251006200840.2171113-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------AVnKoanhiOcZT1DFpKXCXdaC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/25 10:08 PM, Andrew Cooper wrote:
> Andrew Cooper (2):
>    Config.mk: Pin QEMU_UPSTREAM_REVISION
>    Update Xen version to 4.21.0-rc1
>
>   Config.mk    |  2 +-
>   README       | 10 +++++-----
>   SUPPORT.md   |  2 +-
>   xen/Makefile |  2 +-
>   4 files changed, 8 insertions(+), 8 deletions(-)
>
>
> base-commit: acaecf31ea1d566a20b5ee9c0f1f3cb4ee0ec9c2

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------AVnKoanhiOcZT1DFpKXCXdaC
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
    <div class="moz-cite-prefix">On 10/6/25 10:08 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251006200840.2171113-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Andrew Cooper (2):
  Config.mk: Pin QEMU_UPSTREAM_REVISION
  Update Xen version to 4.21.0-rc1

 Config.mk    |  2 +-
 README       | 10 +++++-----
 SUPPORT.md   |  2 +-
 xen/Makefile |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)


base-commit: acaecf31ea1d566a20b5ee9c0f1f3cb4ee0ec9c2</pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------AVnKoanhiOcZT1DFpKXCXdaC--

