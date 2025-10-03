Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E307BB7A69
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 19:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136765.1473244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4jDh-0004Zv-4Y; Fri, 03 Oct 2025 17:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136765.1473244; Fri, 03 Oct 2025 17:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4jDh-0004YT-1W; Fri, 03 Oct 2025 17:05:25 +0000
Received: by outflank-mailman (input) for mailman id 1136765;
 Fri, 03 Oct 2025 17:05:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TaDF=4M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v4jDf-0004YN-Rh
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 17:05:23 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 259436f6-a07b-11f0-9d14-b5c5bf9af7f9;
 Fri, 03 Oct 2025 19:05:22 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-62fc0b7bf62so3854359a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 10:05:22 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-637ef848199sm2928261a12.21.2025.10.03.10.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 10:05:20 -0700 (PDT)
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
X-Inumbo-ID: 259436f6-a07b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759511121; x=1760115921; darn=lists.xenproject.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q4sDSfyEo4doa9r9lqLvuT8mzJW9AkZHjDX4G/dmL9A=;
        b=Jyh4bfUPOJj1ayzcKsRjHb4B8DOqi6jfCJuPvPhGFYSRwUHQklOyW8kdOfgy4i1UPh
         E+Y5zo+TnTGSrZq5QSKnehPSk2x8ZtD9imF7snNQh1BFNQPFX8auyMxRJXbGLnvJvbG/
         7YjRvoSEk8bBecb95bElecQPqYVIeMwlpQ+i8MC3cYnjSTt89ofjBw/Vb/6zuSbOsMab
         7/Q9S65sYwnQq8NzAJCEr1Dd44d5vz3p8Va7xtx1z/2tY7SgMKh/wLV/C2N+CIEojKUT
         81cNe9QXHGhvih7bO1IxP8uF3oVKZHAOFX1DUGWfHyMLvMbxc9SQFochE+6VPe7jZR36
         Y7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759511121; x=1760115921;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4sDSfyEo4doa9r9lqLvuT8mzJW9AkZHjDX4G/dmL9A=;
        b=JmpUzkyb5vuGu9nlGGDhPixkJExaWcIhSOmzwIRI2XcfOLBKeo+mpNKHiDYRuJVHND
         Ovj9vl/mn5QPONJttIZbgxOBD10t90I84XPdO2X+ypsaH20ETkVIhzr8YPB//pizLSwl
         pKuKt26TutH+hlKO1waTu8Xa+SzdNZdvl0aDqTet2J/CCgtFlkIGFTMxBZnNOhlgEhZH
         jRjrA8XBa4Bd4xrn9cAaZKAJ2JYY0BpRJzhrBifHd+YnL+Iatrd+8EjFDpLjR4aXY3YX
         lwdfLG46XiaDMqNOS+EUONCUDO9ynNbIX6gCbKA8oW1WSa6FAhLkhkHtkBdiANwLwPRB
         nhsg==
X-Gm-Message-State: AOJu0Yxmklab1kleYjyZNuc85VL9SJ3GurxCu0YuqObiPd85jBzW7xTj
	3uhYjyve/EszMpVnD2Q0b3+U5eHi6SHSeKnrkcxA2PqvzrBdTnmGwURQ7sguuw==
X-Gm-Gg: ASbGnct48xKMjbTpWbS0Fm9wftw4EIA8mTdo8Pdv+43zZq4+T2hAnOJEMKNbbHvFUEp
	t/116Vs867PEtt+JhQtq6dudugY6ZGbV/PtWNia5NMIlTo0Zr6jOv9Yu1jjtXgBPKT16lcfeKW/
	uzG6j6XGp3c0mH/ks9ediXBEdp9uXh/WiVcGtQv1zuva0KwdyoPsv+ZzIUGQDAvKf2qOTBUDAen
	8lo4NQDIkG1yRxb++1ikjcMm/8CljIZOAelBVDDeG0uENFuG3yS7eOXfbA/GyLNud81+RdxkKpW
	NYibjtzzTamZyjKBjjQs/4tjrdKaM++Fd3WVc9Z0Ly7vF7c+l7nhEBzOaPggeEcVVl2DjQlfPUu
	Dsqn7bTxLK5l9FvDimNILUB/Vq9XySD6xiLe2L5NsfH2Z53hYrDhxK+CxqOItSvgtebN54h7QdJ
	U7QaPneJ9krtN20ARCskshLg7bgsUveJOxhyo=
X-Google-Smtp-Source: AGHT+IGYHDRQDYQBI+fRCW3S6DvG2ipjTI7Ifc+Hvk/8tEt6BzIMDg3a6vSE/RUjCHRROy0aq+iogw==
X-Received: by 2002:a05:6402:13cf:b0:633:deec:8b57 with SMTP id 4fb4d7f45d1cf-639348e3d34mr4177829a12.16.1759511121140;
        Fri, 03 Oct 2025 10:05:21 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Zx4N0dKLN0OjzDeb6eAfQ0B6"
Message-ID: <4345cabf-55dd-4885-bb2c-95f63ad17fa5@gmail.com>
Date: Fri, 3 Oct 2025 19:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Hard code freeze for Xen 4.21 started on 04 Oct 2025

This is a multi-part message in MIME format.
--------------Zx4N0dKLN0OjzDeb6eAfQ0B6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

The hard code freeze for Xen 4.21 runs from October 4, 2025, to October 31, 2025.

Bug fixes for serious issues (including regressions) and low-risk fixes may
continue to be accepted by maintainers during this period.

R-Ack is requited during this period.

Please add me in CC for any bugs or fixes you believe should be included
in the current release.

Thanks, and have a great weekend.

Best regards,
  Oleksii

--------------Zx4N0dKLN0OjzDeb6eAfQ0B6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre data-start="146" data-end="163">Hello everyone,

The hard code freeze for Xen 4.21 runs from October 4, 2025, to October 31, 2025.

Bug fixes for serious issues (including regressions) and low-risk fixes may
continue to be accepted by maintainers during this period.

R-Ack is requited during this period.

Please add me in CC for any bugs or fixes you believe should be included
in the current release.

Thanks, and have a great weekend.</pre>
    <pre data-start="702" data-end="727">Best regards,
 Oleksii</pre>
    <p></p>
  </body>
</html>

--------------Zx4N0dKLN0OjzDeb6eAfQ0B6--

