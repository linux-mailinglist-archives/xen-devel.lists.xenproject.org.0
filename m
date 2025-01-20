Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7055CA16A0B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 10:56:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874913.1285270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZoVy-0007YD-My; Mon, 20 Jan 2025 09:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874913.1285270; Mon, 20 Jan 2025 09:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZoVy-0007WE-KM; Mon, 20 Jan 2025 09:56:14 +0000
Received: by outflank-mailman (input) for mailman id 874913;
 Mon, 20 Jan 2025 09:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xfr=UM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tZoVx-0007Vu-3F
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 09:56:13 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7b98913-d714-11ef-a0e3-8be0dac302b0;
 Mon, 20 Jan 2025 10:56:12 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54298ec925bso5120683e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 01:56:12 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af07ae4sm1247415e87.47.2025.01.20.01.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 01:56:10 -0800 (PST)
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
X-Inumbo-ID: c7b98913-d714-11ef-a0e3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737366971; x=1737971771; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWd478+1zlqzkwI3n78PwnNHKKyIVpxwGjjTEAnc7FI=;
        b=IoPWugCAxdfZ+FIwCALYA9VwN+OPrMtQIuJKgz4B08zkmmTagz63R2iI3QdNW7JlAH
         7q+YApQv/Q7K4bqYy7ui3/M1kM0SzyhekTJJtGLbzgZLk0coxtxHGCT8R3EDsYrhvax4
         Qp00y8My8JESAgccgN8JPfS9uEC/+pgI8XuGddpEY/yvbrgpJFfuHvTgJypSLHfV0S5i
         6ZhKraIEMiMjXCGESsipYApru3SJk5pQk9mtvkxShMxoi9STUVzodKdPJCRn7urfUpFW
         p8ZtYnegVkX4tSAFsmCGIJoWOhMocS7sKxfihUV4L+VieT0HaBA4O+AYBSrFAlmtiwUN
         awWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737366971; x=1737971771;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWd478+1zlqzkwI3n78PwnNHKKyIVpxwGjjTEAnc7FI=;
        b=sd+fuRg/jdLfQ2UcCf7ZkJZHcfCBoOEgBuT2QptVpdHirgiaQXpekNjIEQMDS6K8QQ
         kqjwyP5xd5Uyq+L4gPRBI2C4lX+USZ67xKyBbHCbHBibgjXOP/tX+of89nbIQXOEv5Bh
         SZzxTyVy1MOP7ZvGD8BXBuQ5XoxgEaC3Pyfw/c8LWmrnYskKS5yxcMDonkpLRMFY3maO
         FjVprYUQKl0BNaMLj4otN4ba5+sYZv7A0rlrWslL1y7N+KtESnpS9Kf090TeR9iL4Fzw
         SOob5shbWJoVnplJih+zpl/VqB4tUcglGj9Z5XADayK3HT3VeTxMLkc7/QypOrcSRpSP
         6B9w==
X-Gm-Message-State: AOJu0YwbFpq2E9ywHN50kokTc86xQtj7E3yUgffwsdSzwP4G57+UA2n1
	4hAQHu3IoZU+PrCa1y8rNHJpj9p+e1bOirPGngkttGA047z1iBCOBg3oSg==
X-Gm-Gg: ASbGncsWv1BMaxSx0Iya8lvJpH1zVWcyO6VQZyHuhtxNz3D8kRw3t0ovVGcQhaZw2Ry
	0oDE8FWdUi8Ljbc8ZPCGxuWjTP9pnKjpp0JB0DeP6nlab+iUi3aXfyyoTC7PqtLFMbH5LvY3lKt
	Sm1jxpFMYOd4R+4fBFb6Vx0Vxy+3BFl64KdzjHzxoPWXDVC0l8VA4PGTq+ETUH8G7BXU2PzF5l2
	LPwfaT4n/etXU8cn1vpEMtWzSUBEfGGZG80X4gdVLhHgchnRpuZGwgcuafWqnotI34jpKfLfCkC
	Y55HimQ=
X-Google-Smtp-Source: AGHT+IHunhH8LDpuVcMBXJmaJ674tTCFQdbOHDETTvEfoWKmpbFMRKN3yAtd3TITGI49L5oDEzVWtQ==
X-Received: by 2002:ac2:4acb:0:b0:540:1a0c:9ba6 with SMTP id 2adb3069b0e04-5439c282d2bmr3668735e87.34.1737366970652;
        Mon, 20 Jan 2025 01:56:10 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------qa0UJA0v1VMAXraQv0gh2UeC"
Message-ID: <2f0550b6-2b2c-495a-9b06-1d24a2748138@gmail.com>
Date: Mon, 20 Jan 2025 10:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hard code freeze date for Xen 4.20 is Feb 07, 2025
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
References: <9ce473c2-0735-4ded-9f44-6e8c0605cf3d@gmail.com>
Content-Language: en-US
In-Reply-To: <9ce473c2-0735-4ded-9f44-6e8c0605cf3d@gmail.com>

This is a multi-part message in MIME format.
--------------qa0UJA0v1VMAXraQv0gh2UeC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/20/25 10:48 AM, Oleksii Kurochko wrote:
> Hello everyone,
>
> The hard code freeze date for Xen 4.20 is  February 07, 2025.
>
> Bug fixes for serious bugs (including regressions), and low-risk fixes 
> only may
> continue to be accepted by maintainers beyond this point. Please add 
> me in CC
> for the bugs and fixes you think should be in the current release.

For straightforward bugs and fixes, an R-Ack is not needed until the end of hard
code freeze date.
However, if you have any doubts, feel free to request an R-Ack explicitly.

~ Oleksii

>
> Thanks and have a great week!
>
> Best regards,
>   Oleksii
>
--------------qa0UJA0v1VMAXraQv0gh2UeC
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
    <div class="moz-cite-prefix">On 1/20/25 10:48 AM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9ce473c2-0735-4ded-9f44-6e8c0605cf3d@gmail.com">Hello
      everyone,
      <br>
      <br>
      The hard code freeze date for Xen 4.20 is  February 07, 2025.
      <br>
      <br>
      Bug fixes for serious bugs (including regressions), and low-risk
      fixes only may
      <br>
      continue to be accepted by maintainers beyond this point. Please
      add me in CC
      <br>
      for the bugs and fixes you think should be in the current release.
      <br>
    </blockquote>
    <pre>For straightforward bugs and fixes, an R-Ack is not needed until the end of hard
code freeze date.
However, if you have any doubts, feel free to request an R-Ack explicitly.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:9ce473c2-0735-4ded-9f44-6e8c0605cf3d@gmail.com">
      <br>
      Thanks and have a great week!
      <br>
      <br>
      Best regards,
      <br>
        Oleksii
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------qa0UJA0v1VMAXraQv0gh2UeC--

