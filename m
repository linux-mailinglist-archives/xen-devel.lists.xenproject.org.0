Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E88464CCCD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 16:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462329.720502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5TGk-00080a-QW; Wed, 14 Dec 2022 15:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462329.720502; Wed, 14 Dec 2022 15:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5TGk-0007y9-MQ; Wed, 14 Dec 2022 15:02:02 +0000
Received: by outflank-mailman (input) for mailman id 462329;
 Wed, 14 Dec 2022 15:02:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2C/v=4M=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p5TGj-0007y3-UP
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 15:02:02 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4283f505-7bc0-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 16:02:00 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id u5so7194821pjy.5
 for <xen-devel@lists.xen.org>; Wed, 14 Dec 2022 07:02:00 -0800 (PST)
Received: from [10.17.77.104] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a170903125200b001897916be2bsm1967396plh.268.2022.12.14.07.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 07:01:58 -0800 (PST)
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
X-Inumbo-ID: 4283f505-7bc0-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FkB8QBBXb8tMdOFML7d7eFNmZSeKWieQBEul+3uhvd0=;
        b=lZWNFg4GDox2W+G81y21rs42PO1TV5hSt5d87BZ6NdhQ2m9/Cj3UunQBS8YZZgrrQA
         dnuTVl9qdc7klWkHIvN1OGUfBeQkhjZROUPDrZMtEvRePuNXs7k55xnyRbmSZ2hlg8/T
         ENSRcZY9EC5tcXueREUOlgXjDh30iJS/SDcyVJeE2qAFWvPDehKFO0XYJn2nuyRd6u7E
         tKxC8nFg6/5Qwf5meNs8ra+5tHRyy4KSzjqTL5jVKZvEdyut36RCHMpQVlrl1f4RPV/9
         6ADofY6mE/ACDb8guzW1+PBDxMYE2LCO/3jTiDwNe0hz1wSCJisWpfvB3jkbAF1iVZso
         oeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkB8QBBXb8tMdOFML7d7eFNmZSeKWieQBEul+3uhvd0=;
        b=baG7Ce6swUzV2P7AmrjGs0TdBcK8d+Vhsv9lSZGdFD7f6yhSROkI8OxU4WJJQRMcbn
         lY8YUCuuVScesFRPCMn7mEVzJ3NBwWae5OgtzELX+V28oqN07DSNyJ8dyKrN3bnHeOo4
         CzTTc4jsiejnqJMcRbIKCTh/WdPU7IGVpZrmpMZKNee7aA76QwsKMIPM2djOHfNCqlfx
         S6JM9gtUIgCxXkZjtsRGl4qzsOJmJyBLRfoAFp9zgkwd3VcuKNAIqHycEUy6IqevlDqT
         DrpVF/gMGcye8oqpYICGYHQ8y6ZKDP5ZDVbRsPAb/BLjKWYTnSMKiSM4f7+Cp132q/lg
         CPhw==
X-Gm-Message-State: ANoB5pm0hELJ2jZ/rBONbfK14JV7FBAHb1dDXWJI7c/+76Ob9zFGee1r
	akaqA2hIREK7Sr9JQlo5xZo=
X-Google-Smtp-Source: AA0mqf51dE1GMFmotbfkODve6SFky8sDj+mhLbj3b4J1onZWdhzOhii14b45dSwUwzBzQlvlWCVfcQ==
X-Received: by 2002:a17:902:768b:b0:186:865c:ea17 with SMTP id m11-20020a170902768b00b00186865cea17mr24325384pll.38.1671030119171;
        Wed, 14 Dec 2022 07:01:59 -0800 (PST)
Message-ID: <f4ba541c-d089-28af-c80b-dcb0fa87a9d7@gmail.com>
Date: Wed, 14 Dec 2022 17:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Virtio-disk updates for latest Xen ?
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xen.org
References: <CAKohpo=u7qp4URjRRAMM4xEytmZoKZAJOZLw4v0HTk13BrK-fw@mail.gmail.com>
 <CAPD2p-kfhaygmNNutUdk-mApR7z1YDSTYCEhtLgLsXi+-wbv8A@mail.gmail.com>
 <20221207002138.qulrlav3z3heozk4@vireshk-i7>
 <20221207035918.amzgrybqub632dyc@vireshk-i7>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20221207035918.amzgrybqub632dyc@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.12.22 05:59, Viresh Kumar wrote:

Hello Viresh

First of all, sorry for the late response.
The second, thank you for the investigation.


> On 07-12-22, 05:51, Viresh Kumar wrote:
>> I am not sure how to get this working, as there is no finalizing event
>> for the directory. Maybe our design is broken from the start and we
>> need to do it properly in some recommended way ?
> 
> For now this is what I have done to make it work:
> 
> diff --git a/xs_dev.c b/xs_dev.c
> index a6c8403cfe84..4643394a52a2 100755
> --- a/xs_dev.c
> +++ b/xs_dev.c
> @@ -413,20 +413,7 @@ static int xenstore_get_fe_domid(struct xs_dev *dev)
>   
>   static int xenstore_poll_be_watch(struct xs_dev *dev)
>   {
> -    unsigned int num;
> -    char **vec;
> -    int rc = 0;
> -
> -    vec = xs_read_watch(dev->xsh, &num);
> -    if (!vec)
> -        return -1;
> -
> -    if (!strcmp(vec[XS_WATCH_PATH], dev->path))
> -        rc = xenstore_get_fe_domid(dev);
> -
> -    free(vec);
> -
> -    return rc;
> +    return xenstore_get_fe_domid(dev);
>   }
> 
> This rns xenstore_get_fe_domid() for each event in the path
> "backend/virtio", and in my case it passes with the second event
> itself, which came for "backend/virtio/1/0" and this code doesn't run
> after that.
> 
> Note that I have tested this with my rust counterpart which received a
> similar change, I didn't test virtio-disk directly.


Today I had a chance to check virtio-disk on my H/W using new Xen branch 
which does include Juergen's series with commit 3a96013a3e17 
("tools/xenstore: reduce number of watch events").

Very interesting, but I didn't manage to reproduce an issue the similar 
to what you had already faced with the rust counterparts before (caused 
by the lack of Xenstore watches?). Note that I didn't debug what exactly 
events I had got during guest creation/destruction, I just made sure 
that backend worked as before. I checked that by running the backend in 
Dom0 and DomD and performed a couple of guest power cycles (reboot, 
destroy/create).

If you could provide the debug patch which you seem to use to print 
incoming events which you described in previous email, I think I would 
be able to re-check the situation at my side more deeper.

