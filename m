Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8B4BC1F74
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 17:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139011.1474565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v69pc-0001Gk-PO; Tue, 07 Oct 2025 15:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139011.1474565; Tue, 07 Oct 2025 15:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v69pc-0001EO-MC; Tue, 07 Oct 2025 15:42:28 +0000
Received: by outflank-mailman (input) for mailman id 1139011;
 Tue, 07 Oct 2025 15:42:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jiYT=4Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v69pb-0001ED-Mu
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 15:42:27 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38b49c7a-a394-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 17:42:25 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso402101a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 08:42:25 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6376b3b7225sm12414502a12.16.2025.10.07.08.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:42:23 -0700 (PDT)
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
X-Inumbo-ID: 38b49c7a-a394-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759851744; x=1760456544; darn=lists.xenproject.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BH2imbmcGG8YC2NKOOPrT40O2e/gZ8uDrdr2Rn9CXkM=;
        b=nn4Om902HuWQGCfuAfAQNdZpTqRfpjlZyC773+07N5qCUGBXgQT4ZKNtTRG3B1d4CT
         5saOQ8Apxz2C7Hg8q1coYSgs6QmQzhxpyonp02d9Oe8EdCd0OzrZi2KJrTrkpHf9gQCn
         xLxBVwlq4jniI+n4HpBkAZnRSWzYAeK0GoJ9XiPOk4C4ibEzfKZ1VZScxQfQsBUfgUsi
         0xGrOlUWIsL7tEwLglzr3FmS9NTg5crGimBL6ddQgT3xKEDsvNbeWFsy91vKJHjXjwye
         uOql6zTgx4KJvVFDBF6kzmaX1BK9pPacPZISRRLOIqZCpsQalWOlYRhegdno51r2YZKx
         ncaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759851744; x=1760456544;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BH2imbmcGG8YC2NKOOPrT40O2e/gZ8uDrdr2Rn9CXkM=;
        b=rFTrsmGu3mur0Mq2y5XoJlofVUWQgoD0vNiSY/mQdCQxZoPnL9qrBctdLXgTJKROu8
         9A9EeWJ+1oKvDTWjunZqy4vQzghUSk/4IHm604K0RukR4SjShDm0aPu/fzLmu2Sau+Km
         4NJFCp+gs1X4MoNLwz7+qe+f4BDt571ig0dx4xlHwTv5PcxeqHTDuPNQTWMpfO4EdMy4
         PxqT+yHCDH1rSiRDhmnmbgSe8MKeFh3hsBlSwFrLU+JI7QDF6s8atkCMyMsNeVFsxP68
         HI1IKb89gTa2ug3evS08zBQQDB/tZ03CIkE/tpxw7JYxQPG7wiSLgHsVgJY/TVacLwQ/
         dp3A==
X-Gm-Message-State: AOJu0Yz+FB3lUfP5pHThLqMHqgDqmSqOTwtwNCS+CfzzmVGe1yobPQQz
	buHbP8oDghSVAsGKO9an2nPwScMzCK7ozNhf9JUFV4DuSFlphr+LP+A8nyIuuA==
X-Gm-Gg: ASbGnctChQy+PEIXz/WiHKcIEY3VgqbJmSJZXVKuUsOqaJ1fYJJlibQA1wz8GIQ3kxW
	WSPyLcqY77VDS5AOwE7vxBvwOS5qn9wFg5Egg56TpTt4XNdJEVxtyh4v/e/YsymzFxVA6ySCSaT
	fUNeGNoufUPP4X662kY9TQPGhs+V1tI04ymRGMKCunA9lkbBfzzutxtdSiinvpZBpFEKfwwawho
	aNfoevGu8mYGY/hrB6VDRuK2R1E5scS7vvNuoynqAgPl0rEHwd5IcLhkTOpEJgCr4iVNHrWp6ne
	OP7/0mVSzA48IdTko2G/WePCpL+XUZ3nZXgnaYe7+nJcf6y7UBOGaLofGTaElWlWbE+IUUrgeQN
	anoLpjl/bqhXXUJNwRUcKjtKEG3LXy3dSOpYYtZvv0uOJd4gxPfptIQY+Avo2nk6ifzlAWwnAj8
	u+xfgyxJn86Ix6aZiNr84RG4BF9XiUxWn2JojW7w==
X-Google-Smtp-Source: AGHT+IEDaDZMmobSFrigZoj/bc51u0nCCT+Ufn/VGhQVVVYj8ZKnFuX5ewdQ4cVkyW+PjmJvfjOrGw==
X-Received: by 2002:a05:6402:1ec2:b0:62b:2f0:974f with SMTP id 4fb4d7f45d1cf-639348e4edfmr16712140a12.15.1759851743980;
        Tue, 07 Oct 2025 08:42:23 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------QET1v2u4oLBXWmKoMaFyupyG"
Message-ID: <1a7522f7-89e5-4d0d-9953-8fd4c6e86c16@gmail.com>
Date: Tue, 7 Oct 2025 17:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.21.0-rc1 is tagged

This is a multi-part message in MIME format.
--------------QET1v2u4oLBXWmKoMaFyupyG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

Xen 4.21 rc1 is tagged. You can check that out from xen.git: 
git://xenbits.xen.org/xen.git 4.21.0-rc1

For your convenience there is also a tarball and the signature at:
   https://downloads.xenproject.org/release/xen/4.21.0-rc1/xen-4.21.0-rc1.tar.gz

And the signature is at:
   https://downloads.xenproject.org/release/xen/4.21.0-rc1/xen-4.21.0-rc1.tar.gz.sig

Have a nice week!

~ Oleksii


--------------QET1v2u4oLBXWmKoMaFyupyG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre id="b"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hello everyone,

<span class="q"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255);">Xen 4.21 rc1 is tagged. You can check that out from xen.git:
</span><span class="q"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255);">  git://xenbits.xen.org/xen.git 4.21.0-rc1</span>

For your convenience there is also a tarball and the signature at:
  <a class="moz-txt-link-freetext" href="https://downloads.xenproject.org/release/xen/4.21.0-rc1/xen-4.21.0-rc1.tar.gz">https://downloads.xenproject.org/release/xen/4.21.0-rc1/xen-4.21.0-rc1.tar.gz</a>

And the signature is at:
  <a class="moz-txt-link-freetext" href="https://downloads.xenproject.org/release/xen/4.21.0-rc1/xen-4.21.0-rc1.tar.gz.sig">https://downloads.xenproject.org/release/xen/4.21.0-rc1/xen-4.21.0-rc1.tar.gz.sig</a>

Have a nice week!

~ Oleksii</pre>
    <p><br>
    </p>
  </body>
</html>

--------------QET1v2u4oLBXWmKoMaFyupyG--

