Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3B7A2E651
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 09:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884400.1294100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thP3a-0002Fd-BV; Mon, 10 Feb 2025 08:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884400.1294100; Mon, 10 Feb 2025 08:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thP3a-0002DD-8N; Mon, 10 Feb 2025 08:22:18 +0000
Received: by outflank-mailman (input) for mailman id 884400;
 Mon, 10 Feb 2025 08:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fMFa=VB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thP3Y-0002D7-Qq
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 08:22:16 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2269f9b3-e788-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 09:22:15 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-308f32984bdso2830501fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 00:22:15 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307e0b0efb9sm10890511fa.66.2025.02.10.00.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 00:22:13 -0800 (PST)
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
X-Inumbo-ID: 2269f9b3-e788-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739175734; x=1739780534; darn=lists.xenproject.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9RdhhkIH4VYXiigzwGIGf5YwUkL2NjQuRQ4FSZDDaB4=;
        b=KIc2HCaSBSnK84BuegEYy+zGqp+6AqwM1wq2tV11y6ObEvIqBKbvqaLa5mG3S2tP7E
         lljSwRjaMaj+Ry9mjLDbSJd+qwJ45DFVvuheDjNwVNvu9iKn7/5v7dV/CBO1itpageU4
         C5RkErAVHkWREvAKIlOnbYyrKBnrH7G/DLWq86AyCtag66FIZoS0xeztbTbe1Z2L75lo
         lct30kKTFno+9TJv7LcECFcA7JfEQvKya8Z7b9qe8JSxR+JOw4VIGlv+3Qghx8RGKqsm
         y2whTDMZQu0tgMiEmf+9JWJXn2DQdWE3zJm6b6rz0KBGaMQMPpv5hmztO+S/8ziN2DyL
         J7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739175734; x=1739780534;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RdhhkIH4VYXiigzwGIGf5YwUkL2NjQuRQ4FSZDDaB4=;
        b=hDO3NYNH2LBaqYmU4pL8q/0XFq9+NTHm7/iN1Bd/j847Yt8xx/JTJKygGMbS+bJTkD
         dkBHC08jO+quYH7OJ6iWio8MhNKjG0PELZMfLwoPYDbXRGK1zu2dBwi5OWd1lL/chYiE
         zzP5AYKhnhDKQtd3IEC3xKiM0pfOF3vHsgZoKou59v1FCCWMd4Ny9q9pb0PrLzcNAb7b
         BO7cVc6eoZpzqqNThUwQ6oGSoaaQqNtPqVrtEox5kJ1zlb1eJPB68N0dAm6TTG4Fin8a
         07wsju6G6NVaiU5RtEr5iU6Z2dhoECHDS+iR2T63OEbAU9/ZAd4kYlwNULb+6gwSOWkh
         OBLQ==
X-Gm-Message-State: AOJu0YyB9XZn4iIYxLqucAg5tHclb+H5rdhKr8bnCO66bUIIuRiJdsF/
	oBU/IRT4QkM00VHu8E0yFw7k1L5FVqFbpRjmaHUlhA+rW0l5gjq3uWUw8g==
X-Gm-Gg: ASbGncuwRC6goTC6Bfr48fegRYGe4NoFzy5q5RbdKUk7FWe9/aZy2hHOa8huI6Njk8c
	CRSrCGjURMoDqboTB3FtXiydp3rJeNHUNIAzJbgvZmpIhuUY6JezV9dWgGA/P1gpbZ+tALd567h
	QZ2Bx3Q2vq/yWOrNFJaW63fUwPhtM5wIEgjT3Jjy0KEIHL6GIgWXMeE/NHUxRASGYpdfeoci8fK
	L7lxPK4IzZwyupmCEzv8k5F4tm3IWt/y8+l+i2yEfgpBN7swbheq+br/P1AePnL1H/NhWRWqzRq
	v2QMK535PwUoB0W6Rw+nN7hZ8CU=
X-Google-Smtp-Source: AGHT+IG3h+QESFyb34w8e82+cAvl2kbxvjx/vb2y3SsSeQ+GROXWn3aXhxuZqsYQOwssep3KbIOG0Q==
X-Received: by 2002:a05:651c:554:b0:307:dc1f:e465 with SMTP id 38308e7fff4ca-307e57fed4amr41672431fa.22.1739175733985;
        Mon, 10 Feb 2025 00:22:13 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------p7btw0dQHgdDC10eiDLAiJtW"
Message-ID: <08283473-422d-4880-939c-4bb3bd785cba@gmail.com>
Date: Mon, 10 Feb 2025 09:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Hard code freeze for Xen 4.20 is started

This is a multi-part message in MIME format.
--------------p7btw0dQHgdDC10eiDLAiJtW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

The hard code freeze date for Xen 4.20 is started from February 07, 2025
to February 21, 2025.

Bug fixes for serious bugs (including regressions), and low-risk fixes
only may continue to be accepted by maintainers beyond this point.

For straightforward bugs and fixes, an R-Ack is not needed until the end
of hard code freeze date.
However, if you have any doubts, feel free to request an R-Ack explicitly.

Please add me in CC for the bugs and fixes you think should be in the
current release.

Thanks and have a great week!

Best regards,
   Oleksii

--------------p7btw0dQHgdDC10eiDLAiJtW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello everyone,

The hard code freeze date for Xen 4.20 is started from February 07, 2025
to February 21, 2025.

Bug fixes for serious bugs (including regressions), and low-risk fixes 
only may continue to be accepted by maintainers beyond this point.

For straightforward bugs and fixes, an R-Ack is not needed until the end
of hard code freeze date.
However, if you have any doubts, feel free to request an R-Ack explicitly.

Please add me in CC for the bugs and fixes you think should be in the
current release.

Thanks and have a great week!

Best regards,
  Oleksii
</pre>
  </body>
</html>

--------------p7btw0dQHgdDC10eiDLAiJtW--

